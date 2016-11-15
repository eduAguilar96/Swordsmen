/// view_follow(object, padding)
// Ensures that view can fit all objects of given kind.
// Returns number of objects fit.
var vw, vh, vb, vm, // (view related)
    x1, y1, x2, y2, // (bounding box)
    xm, ym, n; // (medians and count)
n = 0
with (argument0) {
    if (n == 0) {
        x1 = x; x2 = x; xm = x
        y1 = y; y2 = y; ym = y
    } else {
        x1 = min(x1, x); x2 = max(x2, x); xm += x
        y1 = min(y1, y); y2 = max(y2, y); ym += y
    }
    n += 1
}
if (n == 0) return 0 // nothing to follow
xm /= n // (x median)
ym /= n // (y median)
vb = argument1 * 2 // (view border)
vw = view_wport // (view width)
vh = view_hport // (view height)
vm = max(1, (x2 - x1) / (vw - vb), (y2 - y1) / (vh - vb))
view_wview = vm * vw
view_hview = vm * vh
view_xview = (x1 + x2) / 2 - view_wview / 2
view_yview = (y1 + y2) / 2 - view_hview / 2
return n
