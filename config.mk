# st version
VERSION = 0.8.3

# Customize below to fit your system

# paths
PREFIX = /usr/local
LOCAL_PREFIX = /home/mbasov/.local
MANPREFIX = $(PREFIX)/share/man

X11INC = /usr/include
X11LIB = /usr/lib

XftINC = $(LOCAL_PREFIX)/include
XftLIB = $(LOCAL_PREFIX)/lib

PKG_CONFIG = pkg-config

# includes and libs
INCS = -I$(XftINC) -I$(X11INC) \
       `$(PKG_CONFIG) --cflags fontconfig` \
       `$(PKG_CONFIG) --cflags freetype2` \
       `$(PKG_CONFIG) --cflags harfbuzz`
LIBS = -L$(XftLIB) -L$(X11LIB) -lm -lrt -lX11 -lutil -lXft \
       `$(PKG_CONFIG) --libs fontconfig` \
       `$(PKG_CONFIG) --libs freetype2` \
       `$(PKG_CONFIG) --libs harfbuzz` \
       -Wl,-rpath=$(XftLIB)

# flags
STCPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600
STCFLAGS = $(INCS) $(STCPPFLAGS) $(CPPFLAGS) $(CFLAGS)
STLDFLAGS = $(LIBS) $(LDFLAGS)

# OpenBSD:
#CPPFLAGS = -DVERSION=\"$(VERSION)\" -D_XOPEN_SOURCE=600 -D_BSD_SOURCE
#LIBS = -L$(X11LIB) -lm -lX11 -lutil -lXft \
#       `$(PKG_CONFIG) --libs fontconfig` \
#       `$(PKG_CONFIG) --libs freetype2`

# compiler and linker
# CC = c99
