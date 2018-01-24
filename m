From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Jan 2018 14:19:10 -0800
Subject: [PATCH 1/4] riscv: remove the unused current_pgdir function
In-Reply-To: <20180124221913.6613-1-palmer@sifive.com>
References: <20180124132447.5517-1-hch@lst.de>
 <20180124221913.6613-1-palmer@sifive.com>
Message-ID: <20180124221913.6613-2-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Christoph Hellwig <hch@lst.de>

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/include/asm/mmu_context.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index 97424834dce2..082ef8652ac7 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -39,11 +39,6 @@ static inline void destroy_context(struct mm_struct *mm)
 {
 }
 
-static inline pgd_t *current_pgdir(void)
-{
-	return pfn_to_virt(csr_read(sptbr) & SPTBR_PPN);
-}
-
 static inline void set_pgdir(pgd_t *pgd)
 {
 	csr_write(sptbr, virt_to_pfn(pgd) | SPTBR_MODE);
-- 
2.13.6
