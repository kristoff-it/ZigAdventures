const std = @import("std");
const testing = std.testing;

export fn helloFromZig() [*:0]const u8 {
   return "All your codebase are belong to us.";
}

