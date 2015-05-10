#include <Cocoa/Cocoa.h>
#include <CoreGraphics/CGWindow.h>

int get_front_window_id(void) {
    int pid;
    CFArrayRef windows = CGWindowListCopyWindowInfo(kCGWindowListOptionOnScreenOnly, kCGNullWindowID);
    CFIndex i, n;

    for (i = 0, n = CFArrayGetCount(windows); i < n; i++) {
        CFDictionaryRef windict = CFArrayGetValueAtIndex(windows, i);
        CFNumberRef layernum = CFDictionaryGetValue(windict, kCGWindowLayer);
        CFNumberRef windowNum = CFDictionaryGetValue(windict, kCGWindowNumber);
        if (layernum && windowNum) {
            int layer;
            CFNumberGetValue(layernum, kCFNumberIntType, &layer);
            if (layer == 0) {
                CFNumberGetValue(windowNum, kCFNumberIntType, &pid);
                return pid;
            }
        }
    }
    return -1;
}

int main(int argc, char **argv) {
    printf("%d\n", get_front_window_id());
}
