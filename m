From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Jan 2018 14:19:12 -0800
Subject: [PATCH 3/4] riscv: rename sptbr to satp
In-Reply-To: <20180124221913.6613-1-palmer@sifive.com>
References: <20180124132447.5517-1-hch@lst.de>
 <20180124221913.6613-1-palmer@sifive.com>
Message-ID: <20180124221913.6613-4-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Christoph Hellwig <hch@lst.de>

satp is the name used by the current privileged spec 1.10, use it
instead of the old name.  The most recent release binutils release
(2.29) doesn't know about the satp name yet, so stick to the name from
the previous privileged ISA release and comment on the fact.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/csr.h         | 14 +++++++-------
 arch/riscv/include/asm/mmu_context.h |  7 ++++++-
 arch/riscv/kernel/head.S             |  6 +++---
 arch/riscv/mm/fault.c                |  4 ++++
 4 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3c7a2c97e377..421fa3585798 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -40,15 +40,15 @@
 #define SR_SD   _AC(0x8000000000000000, UL) /* FS/XS dirty */
 #endif
 
-/* SPTBR flags */
+/* SATP flags */
 #if __riscv_xlen == 32
-#define SPTBR_PPN     _AC(0x003FFFFF, UL)
-#define SPTBR_MODE_32 _AC(0x80000000, UL)
-#define SPTBR_MODE    SPTBR_MODE_32
+#define SATP_PPN     _AC(0x003FFFFF, UL)
+#define SATP_MODE_32 _AC(0x80000000, UL)
+#define SATP_MODE    SATP_MODE_32
 #else
-#define SPTBR_PPN     _AC(0x00000FFFFFFFFFFF, UL)
-#define SPTBR_MODE_39 _AC(0x8000000000000000, UL)
-#define SPTBR_MODE    SPTBR_MODE_39
+#define SATP_PPN     _AC(0x00000FFFFFFFFFFF, UL)
+#define SATP_MODE_39 _AC(0x8000000000000000, UL)
+#define SATP_MODE    SATP_MODE_39
 #endif
 
 /* Interrupt Enable and Interrupt Pending flags */
diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 082ef8652ac7..d30f0c54b8b2 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -41,7 +41,12 @@ static inline void destroy_context(struct mm_struct *mm)
 
 static inline void set_pgdir(pgd_t *pgd)
 {
-	csr_write(sptbr, virt_to_pfn(pgd) | SPTBR_MODE);
+	/*
+	 * Use the old spbtr name instead of using the current satp
+	 * name to support binutils 2.29 which doesn't know about the
+	 * privileged ISA 1.10 yet.
+	 */
+	csr_write(sptbr, virt_to_pfn(next->pgd) | SATP_MODE);
 }
 
 /*
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 78f670d70133..226eeb190f90 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -74,15 +74,15 @@ relocate:
 	sub a1, a1, a0
 	add ra, ra, a1
 
-	/* Point stvec to virtual address of intruction after sptbr write */
+	/* Point stvec to virtual address of intruction after satp write */
 	la a0, 1f
 	add a0, a0, a1
 	csrw stvec, a0
 
-	/* Compute sptbr for kernel page tables, but don't load it yet */
+	/* Compute satp for kernel page tables, but don't load it yet */
 	la a2, swapper_pg_dir
 	srl a2, a2, PAGE_SHIFT
-	li a1, SPTBR_MODE
+	li a1, SATP_MODE
 	or a2, a2, a1
 
 	/*
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 0713f3c67ab4..06c5621970ae 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -239,6 +239,10 @@ asmlinkage void do_page_fault(struct pt_regs *regs)
 		 * Do _not_ use "tsk->active_mm->pgd" here.
 		 * We might be inside an interrupt in the middle
 		 * of a task switch.
+		 *
+		 * Note: Use the old spbtr name instead of using the current
+		 * satp name to support binutils 2.29 which doesn't know about
+		 * the privileged ISA 1.10 yet.
 		 */
 		index = pgd_index(addr);
 		pgd = (pgd_t *)pfn_to_virt(csr_read(sptbr)) + index;
-- 
2.13.6
