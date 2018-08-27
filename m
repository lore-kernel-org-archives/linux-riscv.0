From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 27 Aug 2018 11:42:37 -0700
Subject: [PATCH 2/8] RISC-V: Don't set cacheinfo.{physical_line_partition,
 attributes}
In-Reply-To: <20180827184243.25344-1-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
Message-ID: <20180827184243.25344-3-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

These are just hard coded in the RISC-V port, which doesn't make any
sense.  We should probably be setting these from device tree entries
when they exist, but for now I think it's saner to just leave them all
as their default values.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/cacheinfo.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 0bc86e5f8f3f..cb35ffd8ec6b 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -22,13 +22,6 @@ static void ci_leaf_init(struct cacheinfo *this_leaf,
 {
 	this_leaf->level = level;
 	this_leaf->type = type;
-	/* not a sector cache */
-	this_leaf->physical_line_partition = 1;
-	/* TODO: Add to DTS */
-	this_leaf->attributes =
-		CACHE_WRITE_BACK
-		| CACHE_READ_ALLOCATE
-		| CACHE_WRITE_ALLOCATE;
 }
 
 static int __init_cache_level(unsigned int cpu)
-- 
2.16.4
