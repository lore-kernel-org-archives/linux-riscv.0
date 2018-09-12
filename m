From: anup@brainfault.org (Anup Patel)
Date: Wed, 12 Sep 2018 20:08:22 +0530
Subject: [PATCH] RISC-V: Show CPU ID and Hart ID separately in /proc/cpuinfo
Message-ID: <20180912143822.21948-1-anup@brainfault.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Currently, /proc/cpuinfo show logical CPU ID as Hart ID which
is in-correct. This patch shows CPU ID and Hart ID separately
in /proc/cpuinfo using cpuid_to_hardid_map().

With this patch, contents of /proc/cpuinfo looks as follows:
cpu	: 0
hart	: 1
isa	: rv64imafdcsu
mmu	: sv48

cpu	: 1
hart	: 0
isa	: rv64imafdcsu
mmu	: sv48

cpu	: 2
hart	: 3
isa	: rv64imafdcsu
mmu	: sv48

cpu	: 3
hart	: 2
isa	: rv64imafdcsu
mmu	: sv48

Signed-off-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kernel/cpu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f0f0ec2737b7..7c1342e242e6 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -87,7 +87,8 @@ static int c_show(struct seq_file *m, void *v)
 						   NULL);
 	const char *compat, *isa, *mmu;
 
-	seq_printf(m, "hart\t: %lu\n", cpu_id);
+	seq_printf(m, "cpu\t: %lu\n", cpu_id);
+	seq_printf(m, "hart\t: %lu\n", cpuid_to_hardid_map(cpu_id));
 	if (!of_property_read_string(node, "riscv,isa", &isa)
 	    && isa[0] == 'r'
 	    && isa[1] == 'v')
-- 
2.17.1
