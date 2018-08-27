From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 27 Aug 2018 15:03:52 -0700
Subject: [PATCH] RISC-V: Mask out the F extension on systems without D
Message-ID: <20180827220352.24301-1-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The RISC-V Linux port doesn't support systems that have the F extension
but don't have the D extension -- we actually don't support systems
without D either, but Alan's patch set is rectifying that soon.  For now
I think we can leave this in a semi-broken state and just wait for
Alan's patch set to get merged for proper non-FPU support -- the patch
set is starting to look good, so doing something in-between doesn't seem
like it's worth the work.

I don't think it's worth fretting about support for systems with F but
not D for now: our glibc ABIs are IMAC and IMAFDC so they probably won't
end up being popular.  We can always extend this in the future.

CC: Alan Kao <alankao@andestech.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/cpufeature.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 17011a870044..652d102ffa06 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -57,5 +57,12 @@ void riscv_fill_hwcap(void)
 	for (i = 0; i < strlen(isa); ++i)
 		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
 
+	/* We don't support systems with F but without D, so mask those out
+	 * here. */
+	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
+		pr_info("This kernel does not support systems with F but not D");
+		elf_hwcap &= ~COMPAT_HWCAP_ISA_F;
+	}
+
 	pr_info("elf_hwcap is 0x%lx", elf_hwcap);
 }
-- 
2.16.4
