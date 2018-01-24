From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 24 Jan 2018 14:19:11 -0800
Subject: [PATCH 2/4] riscv: don't read back satp in paging_init
In-Reply-To: <20180124221913.6613-1-palmer@sifive.com>
References: <20180124132447.5517-1-hch@lst.de>
 <20180124221913.6613-1-palmer@sifive.com>
Message-ID: <20180124221913.6613-3-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Christoph Hellwig <hch@lst.de>

init_mm.pgd (aka swapped_pgd) gets relocated like all other kernel
symbols by the elf loader, so there is no need to reload it from satp.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/mm/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9f4bee5e51fd..26a291ee792e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -39,8 +39,6 @@ void setup_zero_page(void)
 
 void __init paging_init(void)
 {
-	init_mm.pgd = (pgd_t *)pfn_to_virt(csr_read(sptbr));
-
 	setup_zero_page();
 	local_flush_tlb_all();
 	zone_sizes_init();
-- 
2.13.6
