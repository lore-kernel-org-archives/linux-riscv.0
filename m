From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed,  4 Jul 2018 14:10:56 -0700
Subject: [PATCH] RISC-V: Use KBUILD_CFLAGS instead of KCFLAGS when building
 the vDSO
Message-ID: <20180704211056.1885-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

If you use a 64-bit compiler to build a 32-bit kernel then you'll get an
error when building the vDSO due to a library mismatch.  The happens
because the relevant "-march" argument isn't supplied to the GCC run
that generates one of the vDSO intermediate files.

I'm not actually sure what the right thing to do here is as I'm not
particularly familiar with the kernel build system.  I poked the
documentation and it appears that KCFLAGS is the correct thing to do
(it's suggested that should be used when building modules), but we set
KBUILD_CFLAGS in arch/riscv/Makefile.

This does at least fix the build error.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/vdso/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index f6561b783b61..eed1c137f618 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -52,8 +52,8 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 # Add -lgcc so rv32 gets static muldi3 and lshrdi3 definitions.
 # Make sure only to export the intended __vdso_xxx symbol offsets.
 quiet_cmd_vdsold = VDSOLD  $@
-      cmd_vdsold = $(CC) $(KCFLAGS) $(call cc-option, -no-pie) -nostdlib $(SYSCFLAGS_$(@F)) \
-                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp -lgcc && \
+      cmd_vdsold = $(CC) $(KBUILD_CFLAGS) $(call cc-option, -no-pie) -nostdlib -nostartfiles $(SYSCFLAGS_$(@F)) \
+                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp && \
                    $(CROSS_COMPILE)objcopy \
                            $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@
 
-- 
2.16.4
