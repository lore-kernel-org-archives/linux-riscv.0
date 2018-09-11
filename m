From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 11 Sep 2018 13:05:35 -0700
Subject: [PATCH v4 08/12] RISC-V: Rename im_okay_therefore_i_am to
 found_boot_cpu
In-Reply-To: <1536696339-15204-1-git-send-email-atish.patra@wdc.com>
References: <1536696339-15204-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1536696339-15204-9-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Palmer Dabbelt <palmer@sifive.com>

The old name was a bit odd.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/smpboot.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index cfb0b02d..4a232600 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -50,7 +50,8 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
 void __init setup_smp(void)
 {
 	struct device_node *dn = NULL;
-	int hart, im_okay_therefore_i_am = 0;
+	int hart;
+	bool found_boot_cpu = false;
 
 	while ((dn = of_find_node_by_type(dn, "cpu"))) {
 		hart = riscv_of_processor_hartid(dn);
@@ -58,13 +59,13 @@ void __init setup_smp(void)
 			set_cpu_possible(hart, true);
 			set_cpu_present(hart, true);
 			if (hart == smp_processor_id()) {
-				BUG_ON(im_okay_therefore_i_am);
-				im_okay_therefore_i_am = 1;
+				BUG_ON(found_boot_cpu);
+				found_boot_cpu = true;
 			}
 		}
 	}
 
-	BUG_ON(!im_okay_therefore_i_am);
+	BUG_ON(!found_boot_cpu);
 }
 
 int __cpu_up(unsigned int cpu, struct task_struct *tidle)
-- 
2.7.4
