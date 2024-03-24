const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "fpconv",
        .target = target,
        .optimize = optimize,
    });
    lib.linkLibC();
    lib.addCSourceFiles(&.{"fpconv_dtoa.c"}, &.{
        "-std=c99",
        "-Wall",
        "-Os",
        "-g",
    });

    lib.installHeader("fpconv_dtoa.h", "fpconv_dtoa.h");
    b.installArtifact(lib);
}
