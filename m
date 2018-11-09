From: me@packi.ch (=?UTF-8?q?Patrick=20St=C3=A4hlin?=)
Date: Fri,  9 Nov 2018 20:33:47 +0100
Subject: [PATCH] RISC-V: recognize S/U mode bits in print_isa
Message-ID: <20181109193349.28179-1-me@packi.ch>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Removes the warning about an unsupported ISA when reading /proc/cpuinfo
on QEMU.

Signed-off-by: Patrick St?hlin <me@packi.ch>
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
2.17.1
