######
######   What are we building?
######

TARGET = lib/libORB_SLAM2.so


# Objects that must be built in order to link

OBJECTS = src/System.o 
OBJECTS += src/Tracking.o
OBJECTS += src/LocalMapping.o
OBJECTS += src/LoopClosing.o
OBJECTS += src/ORBextractor.o
OBJECTS += src/ORBmatcher.o
OBJECTS += src/FrameDrawer.o
OBJECTS += src/Converter.o
OBJECTS += src/MapPoint.o
OBJECTS += src/KeyFrame.o
OBJECTS += src/Map.o
OBJECTS += src/MapDrawer.o
OBJECTS += src/Optimizer.o
OBJECTS += src/PnPsolver.o
OBJECTS += src/Frame.o
OBJECTS += src/KeyFrameDatabase.o
OBJECTS += src/Sim3Solver.o
OBJECTS += src/Initializer.o
OBJECTS += src/Viewer.o


######
######   Binaries and flags
######

CPPFLAGS = -std=c++11 -DCOMPILEDWITHC11 -fPIC
#CPPFLAGS += -DORB_SLAM2_EXPORTS
#CPPFLAGS += -isystem /usr/local/include/eigen3
#CPPFLAGS += -isystem /usr/local/include/opencv

## Hunh.  Optimization level isn't supposed to change the behavior of the
## code, but this does:
CPPFLAGS += -O3

CPPFLAGS += -Wall -DNDEBUG
CPPFLAGS += -Iinclude
CPPFLAGS += -I/usr/include/ORB_SLAM2/Thirdparty/DBoW2
CPPFLAGS += -I/usr/include/ORB_SLAM2/Thirdparty/g2o
CPPFLAGS += -I/usr/include/eigen3

LD = g++
LDLIBS += -lpangolin
LDLIBS += -lDBoW2
LDLIBS += -lg2o
LDLIBS += $(shell pkg-config --libs opencv)


# Default target:
.PHONY: all
all: $(TARGET)


$(TARGET): $(OBJECTS)
	$(LD) $(LDFLAGS) $(OBJECTS) -shared -o $@ $(LDLIBS)

.PHONY: clean
clean:
	rm -f $(OBJECTS)
	rm -f $(TARGET)


