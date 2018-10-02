From: atish.patra@wdc.com (Atish Patra)
Date: Tue,  2 Oct 2018 12:15:06 -0700
Subject: [PATCH v6 13/14] RISC-V: Show CPU ID and Hart ID separately in
 /proc/cpuinfo
In-Reply-To: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
References: <1538507707-22299-1-git-send-email-atish.patra@wdc.com>
Message-ID: <1538507707-22299-14-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

From: Anup Patel <anup@brainfault.org>

Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
is in-correct. This patch shows CPU ID and Hart ID separately
in /proc/cpuinfo using cpuid_to_hardid_map().

With this patch, contents of /proc/cpuinfo looks as follows:
processor	: 0
hart		: 1
isa		: rv64imafdc
mmu		: sv48

processor	: 1
hart		: 0
isa		: rv64imafdc
mmu		: sv48

processor	: 2
hart		: 2
isa		: rv64imafdc
mmu		: sv48

processor	: 3
hart		: 3
isa		: rv64imafdc
mmu		: sv48

Signed-off-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cpu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index cccc6f61..3a5a2ee3 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -81,7 +81,7 @@ static void print_isa(struct seq_file *f, const char *orig_isa)
 #endif
 
 	/* Print the base ISA, as we already know it's legal. */
-	seq_puts(f, "isa\t: ");
+	seq_puts(f, "isa\t\t: ");
 	seq_write(f, isa, 5);
 	isa += 5;
 
@@ -96,6 +96,7 @@ static void print_isa(struct seq_file *f, const char *orig_isa)
 			isa++;
 		}
 	}
+	seq_puts(f, "\n");
 
 	/*
 	 * If we were given an unsupported ISA in the device tree then print
@@ -116,7 +117,7 @@ static void print_mmu(struct seq_file *f, const char *mmu_type)
 		return;
 #endif
 
-	seq_printf(f, "mmu\t: %s\n", mmu_type+6);
+	seq_printf(f, "mmu\t\t: %s\n", mmu_type+6);
 }
 
 static void *c_start(struct seq_file *m, loff_t *pos)
@@ -144,14 +145,15 @@ static int c_show(struct seq_file *m, void *v)
 						   NULL);
 	const char *compat, *isa, *mmu;
 
-	seq_printf(m, "hart\t: %lu\n", cpu_id);
+	seq_printf(m, "processor\t: %lu\n", cpu_id);
+	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 	if (!of_property_read_string(node, "riscv,isa", &isa))
 		print_isa(m, isa);
 	if (!of_property_read_string(node, "mmu-type", &mmu))
 		print_mmu(m, mmu);
 	if (!of_property_read_string(node, "compatible", &compat)
 	    && strcmp(compat, "riscv"))
-		seq_printf(m, "uarch\t: %s\n", compat);
+		seq_printf(m, "uarch\t\t: %s\n", compat);
 	seq_puts(m, "\n");
 
 	return 0;
-- 
2.7.4
