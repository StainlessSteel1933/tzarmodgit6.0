#include <X11/Xlib.h>
#include <X11/keysym.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

extern int XTestFakeKeyEvent(Display *, unsigned int, Bool, unsigned long);

static int xtest_key(Display *display, KeySym keysym) {
	KeyCode keycode = XKeysymToKeycode(display, keysym);
	if (keycode == 0) {
		return 0;
	}

	int ok = XTestFakeKeyEvent(display, keycode, True, 0);
	XFlush(display);
	usleep(50000);
	ok = XTestFakeKeyEvent(display, keycode, False, 0) && ok;
	XFlush(display);
	return ok ? 1 : 0;
}

static KeySym text_keysym(char c) {
	if (c >= 'a' && c <= 'z') {
		return XK_a + (c - 'a');
	}
	if (c >= '0' && c <= '9') {
		return XK_0 + (c - '0');
	}
	switch (c) {
		case ' ': return XK_space;
		case '.': return XK_period;
		case '-': return XK_minus;
		case '_': return XK_underscore;
		case '/': return XK_slash;
		default: return NoSymbol;
	}
}

static int send_key(Display *display, Window window, KeySym keysym) {
	KeyCode keycode = XKeysymToKeycode(display, keysym);
	if (keycode == 0) {
		return 0;
	}

	XEvent event;
	memset(&event, 0, sizeof(event));
	event.xkey.display = display;
	event.xkey.window = window;
	event.xkey.root = DefaultRootWindow(display);
	event.xkey.subwindow = None;
	event.xkey.time = CurrentTime;
	event.xkey.x = 1;
	event.xkey.y = 1;
	event.xkey.x_root = 1;
	event.xkey.y_root = 1;
	event.xkey.same_screen = True;
	event.xkey.keycode = keycode;

	XSetInputFocus(display, window, RevertToParent, CurrentTime);
	XFlush(display);
	usleep(50000);

	event.xkey.type = KeyPress;
	if (!XSendEvent(display, window, True, KeyPressMask, &event)) {
		return 0;
	}
	XFlush(display);
	usleep(50000);

	event.xkey.type = KeyRelease;
	if (!XSendEvent(display, window, True, KeyReleaseMask, &event)) {
		return 0;
	}
	XFlush(display);
	return 1;
}

static int walk(Display *display, Window window, KeySym keysym) {
	Window root;
	Window parent;
	Window *children = NULL;
	unsigned int child_count = 0;
	int sent = send_key(display, window, keysym);

	if (XQueryTree(display, window, &root, &parent, &children, &child_count)) {
		for (unsigned int i = 0; i < child_count; ++i) {
			sent += walk(display, children[i], keysym);
		}
	}
	if (children != NULL) {
		XFree(children);
	}
	return sent;
}

int main(int argc, char **argv) {
	Display *display = XOpenDisplay(NULL);
	if (display == NULL) {
		fprintf(stderr, "failed to open DISPLAY\n");
		return 2;
	}

	if (argc > 2 && strcmp(argv[1], "--text") == 0) {
		int sent = 0;
		for (const char *p = argv[2]; *p != '\0'; ++p) {
			KeySym keysym = text_keysym(*p);
			if (keysym == NoSymbol) {
				fprintf(stderr, "unsupported text char: %c\n", *p);
				XCloseDisplay(display);
				return 2;
			}
			sent += xtest_key(display, keysym);
			usleep(30000);
		}
		XCloseDisplay(display);
		printf("sent %d text key events\n", sent);
		return sent > 0 ? 0 : 1;
	}

	const char *key_name = argc > 1 ? argv[1] : "space";
	KeySym keysym = XStringToKeysym(key_name);
	if (keysym == NoSymbol && strcmp(key_name, "space") == 0) {
		keysym = XK_space;
	}
	if (keysym == NoSymbol) {
		fprintf(stderr, "unknown key: %s\n", key_name);
		XCloseDisplay(display);
		return 2;
	}

	int sent = xtest_key(display, keysym);
	if (sent == 0) {
		sent = walk(display, DefaultRootWindow(display), keysym);
	}
	XCloseDisplay(display);
	printf("sent %d key events for %s\n", sent, key_name);
	return sent > 0 ? 0 : 1;
}
