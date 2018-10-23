From: schwab@suse.de (Andreas Schwab)
Date: Tue, 23 Oct 2018 09:33:47 +0200
Subject: [PATCH] RISC-V: properly determine hardware caps
Message-ID: <mvmftwxruas.fsf@suse.de>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On the Hifive-U platform, cpu 0 is a masked cpu with less capabilities
than the other cpus.  Ignore it for the purpose of determining the
hardware capabilities of the system.

Signed-off-by: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/kernel/cpufeature.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 5493f32287..0339087aa6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -28,7 +28,7 @@ bool has_fpu __read_mostly;
 
 void riscv_fill_hwcap(void)
 {
-	struct device_node *node;
+	struct device_node *node = NULL;
 	const char *isa;
 	size_t i;
 	static unsigned long isa2hwcap[256] = {0};
@@ -44,9 +44,11 @@ void riscv_fill_hwcap(void)
 
 	/*
 	 * We don't support running Linux on hertergenous ISA systems.  For
-	 * now, we just check the ISA of the first processor.
+	 * now, we just check the ISA of the first "okay" processor.
 	 */
-	node = of_find_node_by_type(NULL, "cpu");
+	while ((node = of_find_node_by_type(node, "cpu")))
+		if (riscv_of_processor_hartid(node) >= 0)
+			break;
 	if (!node) {
 		pr_warning("Unable to find \"cpu\" devicetree entry");
 		return;
-- 
2.19.1


-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."
