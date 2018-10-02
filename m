From: atish.patra@wdc.com (Atish Patra)
Date: Tue,  2 Oct 2018 12:14:56 -0700
Subject: [PATCH v6 03/14] RISC-V: Filter ISA and MMU values in cpuinfo
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1538507707-22299-4-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Palmer Dabbelt <palmer@sifive.com>

We shouldn't be directly passing device tree values to userspace, both
because there could be mistakes in device trees and because the kernel
doesn't support arbitrary ISAs.

Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
[Atish: checkpatch fix and code comment formatting update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/cpu.c | 68 ++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ca6c81e5..1c0bf662 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -58,6 +58,63 @@ int riscv_of_processor_hart(struct device_node *node)
 
 #ifdef CONFIG_PROC_FS
 
+static void print_isa(struct seq_file *f, const char *orig_isa)
+{
+	static const char *ext = "mafdc";
+	const char *isa = orig_isa;
+	const char *e;
+
+	/*
+	 * Linux doesn't support rv32e or rv128i, and we only support booting
+	 * kernels on harts with the same ISA that the kernel is compiled for.
+	 */
+#if defined(CONFIG_32BIT)
+	if (strncmp(isa, "rv32i", 5) != 0)
+		return;
+#elif defined(CONFIG_64BIT)
+	if (strncmp(isa, "rv64i", 5) != 0)
+		return;
+#endif
+
+	/* Print the base ISA, as we already know it's legal. */
+	seq_puts(f, "isa\t: ");
+	seq_write(f, isa, 5);
+	isa += 5;
+
+	/*
+	 * Check the rest of the ISA string for valid extensions, printing those
+	 * we find.  RISC-V ISA strings define an order, so we only print the
+	 * extension bits when they're in order.
+	 */
+	for (e = ext; *e != '\0'; ++e) {
+		if (isa[0] == e[0]) {
+			seq_write(f, isa, 1);
+			isa++;
+		}
+	}
+
+	/*
+	 * If we were given an unsupported ISA in the device tree then print
+	 * a bit of info describing what went wrong.
+	 */
+	if (isa[0] != '\0')
+		pr_info("unsupported ISA \"%s\" in device tree", orig_isa);
+}
+
+static void print_mmu(struct seq_file *f, const char *mmu_type)
+{
+#if defined(CONFIG_32BIT)
+	if (strcmp(mmu_type, "riscv,sv32") != 0)
+		return;
+#elif defined(CONFIG_64BIT)
+	if (strcmp(mmu_type, "riscv,sv39") != 0 &&
+	    strcmp(mmu_type, "riscv,sv48") != 0)
+		return;
+#endif
+
+	seq_printf(f, "mmu\t: %s\n", mmu_type+6);
+}
+
 static void *c_start(struct seq_file *m, loff_t *pos)
 {
 	*pos = cpumask_next(*pos - 1, cpu_online_mask);
@@ -83,13 +140,10 @@ static int c_show(struct seq_file *m, void *v)
 	const char *compat, *isa, *mmu;
 
 	seq_printf(m, "hart\t: %lu\n", hart_id);
-	if (!of_property_read_string(node, "riscv,isa", &isa)
-	    && isa[0] == 'r'
-	    && isa[1] == 'v')
-		seq_printf(m, "isa\t: %s\n", isa);
-	if (!of_property_read_string(node, "mmu-type", &mmu)
-	    && !strncmp(mmu, "riscv,", 6))
-		seq_printf(m, "mmu\t: %s\n", mmu+6);
+	if (!of_property_read_string(node, "riscv,isa", &isa))
+		print_isa(m, isa);
+	if (!of_property_read_string(node, "mmu-type", &mmu))
+		print_mmu(m, mmu);
 	if (!of_property_read_string(node, "compatible", &compat)
 	    && strcmp(compat, "riscv"))
 		seq_printf(m, "uarch\t: %s\n", compat);
-- 
2.7.4
