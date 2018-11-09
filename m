From: me@packi.ch (=?UTF-8?q?Patrick=20St=C3=A4hlin?=)
Date: Fri,  9 Nov 2018 22:42:16 +0100
Subject: [PATCH v2] RISC-V: recognize S/U mode bits in print_isa
In-Reply-To: <mhng-cff31d5f-053e-4e62-997c-232c8bdd5fd3@palmer-si-x1c4>
References: <mhng-cff31d5f-053e-4e62-997c-232c8bdd5fd3@palmer-si-x1c4>
Message-ID: <20181109214217.27494-1-me@packi.ch>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Removes the warning about an unsupported ISA when reading /proc/cpuinfo
on QEMU. The "S" extension is not being returned as it is not accessible
from userspace.

Signed-off-by: Patrick St?hlin <me@packi.ch>
---
 arch/riscv/kernel/cpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3a5a2ee31547..b4a7d4427fbb 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -64,7 +64,7 @@ int riscv_of_processor_hartid(struct device_node *node)
 
 static void print_isa(struct seq_file *f, const char *orig_isa)
 {
-	static const char *ext = "mafdc";
+	static const char *ext = "mafdcsu";
 	const char *isa = orig_isa;
 	const char *e;
 
@@ -88,11 +88,14 @@ static void print_isa(struct seq_file *f, const char *orig_isa)
 	/*
 	 * Check the rest of the ISA string for valid extensions, printing those
 	 * we find.  RISC-V ISA strings define an order, so we only print the
-	 * extension bits when they're in order.
+	 * extension bits when they're in order. Hide the supervisor (S)
+	 * extension from userspace as it's not accessible from there.
 	 */
 	for (e = ext; *e != '\0'; ++e) {
 		if (isa[0] == e[0]) {
-			seq_write(f, isa, 1);
+			if (isa[0] != 's')
+				seq_write(f, isa, 1);
+
 			isa++;
 		}
 	}
-- 
2.17.1
