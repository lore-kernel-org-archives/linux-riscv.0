From: palmer@sifive.com (Palmer Dabbelt)
Date: Mon, 27 Aug 2018 11:42:40 -0700
Subject: [PATCH 5/8] RISC-V: Rename im_okay_therefore_i_am to found_boot_cpu
In-Reply-To: <20180827184243.25344-1-palmer@sifive.com>
References: <20180827184243.25344-1-palmer@sifive.com>
Message-ID: <20180827184243.25344-6-palmer@sifive.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

The old name was a bit odd.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/kernel/smpboot.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 5f29f8562cf6..e1f6a5ad0416 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -50,7 +50,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 void __init setup_smp(void)
 {
 	struct device_node *dn = NULL;
-	int hart, im_okay_therefore_i_am = 0;
+	int hart, found_boot_cpu = 0;
 
 	while ((dn = of_find_node_by_type(dn, "cpu"))) {
 		hart = riscv_of_processor_hartid(dn);
@@ -58,13 +58,13 @@ void __init setup_smp(void)
 			set_cpu_possible(hart, true);
 			set_cpu_present(hart, true);
 			if (hart == smp_processor_id()) {
-				BUG_ON(im_okay_therefore_i_am);
-				im_okay_therefore_i_am = 1;
+				BUG_ON(found_boot_cpu);
+				found_boot_cpu = 1;
 			}
 		}
 	}
 
-	BUG_ON(!im_okay_therefore_i_am);
+	BUG_ON(!found_boot_cpu);
 }
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
-- 
2.16.4
