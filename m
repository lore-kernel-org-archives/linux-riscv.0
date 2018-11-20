From: atish.patra@wdc.com (Atish Patra)
Date: Tue, 20 Nov 2018 15:07:50 -0800
Subject: [PATCH] RISC-V: Fix of_node_* refcount
Message-ID: <1542755270-10433-1-git-send-email-atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Fix of_node* refcount at various places by using of_node_put.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cacheinfo.c  | 11 +++++++++++
 arch/riscv/kernel/cpu.c        |  1 +
 arch/riscv/kernel/cpufeature.c |  2 ++
 arch/riscv/kernel/perf_event.c |  1 +
 arch/riscv/kernel/smpboot.c    |  6 +++++-
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index cb35ffd8..638dee3f 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -28,6 +28,7 @@ static int __init_cache_level(unsigned int cpu)
 {
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct device_node *np = of_cpu_device_node_get(cpu);
+	struct device_node *prev = NULL;
 	int levels = 0, leaves = 0, level;
 
 	if (of_property_read_bool(np, "cache-size"))
@@ -39,7 +40,10 @@ static int __init_cache_level(unsigned int cpu)
 	if (leaves > 0)
 		levels = 1;
 
+	prev = np;
 	while ((np = of_find_next_cache_node(np))) {
+		of_node_put(prev);
+		prev = np;
 		if (!of_device_is_compatible(np, "cache"))
 			break;
 		if (of_property_read_u32(np, "cache-level", &level))
@@ -55,8 +59,10 @@ static int __init_cache_level(unsigned int cpu)
 		levels = level;
 	}
 
+	of_node_put(np);
 	this_cpu_ci->num_levels = levels;
 	this_cpu_ci->num_leaves = leaves;
+
 	return 0;
 }
 
@@ -65,6 +71,7 @@ static int __populate_cache_leaves(unsigned int cpu)
 	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
 	struct cacheinfo *this_leaf = this_cpu_ci->info_list;
 	struct device_node *np = of_cpu_device_node_get(cpu);
+	struct device_node *prev = NULL;
 	int levels = 1, level = 1;
 
 	if (of_property_read_bool(np, "cache-size"))
@@ -74,7 +81,10 @@ static int __populate_cache_leaves(unsigned int cpu)
 	if (of_property_read_bool(np, "d-cache-size"))
 		ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
 
+	prev = np;
 	while ((np = of_find_next_cache_node(np))) {
+		of_node_put(prev);
+		prev = np;
 		if (!of_device_is_compatible(np, "cache"))
 			break;
 		if (of_property_read_u32(np, "cache-level", &level))
@@ -89,6 +99,7 @@ static int __populate_cache_leaves(unsigned int cpu)
 			ci_leaf_init(this_leaf++, np, CACHE_TYPE_DATA, level);
 		levels = level;
 	}
+	of_node_put(np);
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 3a5a2ee3..7b3eb970 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -155,6 +155,7 @@ static int c_show(struct seq_file *m, void *v)
 	    && strcmp(compat, "riscv"))
 		seq_printf(m, "uarch\t\t: %s\n", compat);
 	seq_puts(m, "\n");
+	of_node_put(node);
 
 	return 0;
 }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0339087a..a6e369ed 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -56,8 +56,10 @@ void riscv_fill_hwcap(void)
 
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
 		pr_warning("Unable to find \"riscv,isa\" devicetree entry");
+		of_node_put(node);
 		return;
 	}
+	of_node_put(node);
 
 	for (i = 0; i < strlen(isa); ++i)
 		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
diff --git a/arch/riscv/kernel/perf_event.c b/arch/riscv/kernel/perf_event.c
index a243fae1..667ee70d 100644
--- a/arch/riscv/kernel/perf_event.c
+++ b/arch/riscv/kernel/perf_event.c
@@ -476,6 +476,7 @@ int __init init_hw_perf_events(void)
 
 		if (of_id)
 			riscv_pmu = of_id->data;
+		of_node_put(node);
 	}
 
 	perf_pmu_register(riscv_pmu->pmu, "cpu", PERF_TYPE_RAW);
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 18cda0e8..fc185eca 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -57,12 +57,15 @@ void __init setup_smp(void)
 
 	while ((dn = of_find_node_by_type(dn, "cpu"))) {
 		hart = riscv_of_processor_hartid(dn);
-		if (hart < 0)
+		if (hart < 0) {
+			of_node_put(dn);
 			continue;
+		}
 
 		if (hart == cpuid_to_hartid_map(0)) {
 			BUG_ON(found_boot_cpu);
 			found_boot_cpu = 1;
+			of_node_put(dn);
 			continue;
 		}
 
@@ -70,6 +73,7 @@ void __init setup_smp(void)
 		set_cpu_possible(cpuid, true);
 		set_cpu_present(cpuid, true);
 		cpuid++;
+		of_node_put(dn);
 	}
 
 	BUG_ON(!found_boot_cpu);
-- 
2.7.4
