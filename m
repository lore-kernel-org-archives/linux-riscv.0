From: david.abdurachmanov@gmail.com (David Abdurachmanov)
Date: Sat, 10 Nov 2018 07:45:43 +0100
Subject: [PATCH] riscv: add S and U modes to ISA string
Message-ID: <20181110064543.12411-1-david.abdurachmanov@gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Booting kernel (4.20-rc1) with riscv-pk @
6ebd0f2a46255d0c76dad3c05b16c1d154795d26 (master/HEAD) on Fedora 29 one gets:

[..]
[   55.075000] unsupported ISA "rv64imafdcsu" in device tree
[   55.075000] unsupported ISA "rv64imafdcsu" in device tree
[   55.076000] unsupported ISA "rv64imafdcsu" in device tree
[   55.076000] unsupported ISA "rv64imafdcsu" in device tree
[   55.077000] systemd[1]: Detected architecture riscv64.
[..]

The patch adds the missing S and U modes.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/kernel/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3a5a2ee31547..4029c7e6872b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -64,7 +64,7 @@ int riscv_of_processor_hartid(struct device_node *node)
 
 static void print_isa(struct seq_file *f, const char *orig_isa)
 {
-	static const char *ext = "mafdc";
+	static const char *ext = "mafdcsu";
 	const char *isa = orig_isa;
 	const char *e;
 
-- 
2.19.1
