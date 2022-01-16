const std = @import("std");
const qoi = @import("qoi.zig");

const zero_bytes = @embedFile("zero.qoi");

var gpa = std.heap.GeneralPurposeAllocator(.{}){};

export fn getZeroRawImage(width_ptr: *u32, height_ptr: *u32) [*]u8 {
   const img = qoi.decodeBuffer(gpa.allocator(), zero_bytes) catch @panic("oh no");
   width_ptr.* = img.width;
   height_ptr.* = img.height;
   return @ptrCast([*]u8, img.pixels.ptr);
}

export fn freeZeroRawImage(pixels: [*]u8, len: u32) void {
    gpa.allocator().free(pixels[0..len]);
}
