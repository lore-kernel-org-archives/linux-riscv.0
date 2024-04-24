Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F91C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2024 05:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Emg2G0jcQ8r+rYMh+4grQVwBkduRXU2Do8Qdtu2rGTY=; b=RR4YQnpnh74Yjm
	OTE84JAFSMOKLnvvlhx0jO4rCqfU6p5DQkBwqf2N0xyevK0rYUeYcaqtSRnmgPxMQXOmurGrYD4Sp
	DoJwP3yB3L6rXh1m4XjkgMa7J1a1zwFD980ea/8eX8hciLtsuuZFkIgLkJMY1hNxOEjUtaYw8QSAe
	SO9dUEQncGi97nHRzt4sdpeQ40dnQmYNNVZ72E6AimOPPabwcqR3XbUeiW4QE3mW3kjTSS0tyL/Dd
	E1+4NHGwC61qkNzog//UHrh5eB/6FDSaWlV8HBZbOpdnJpacWd/nYreeiHg+rLBML7DAVJ+sl03bh
	sIFH6XeXXupnUrXuXvMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVCt-00000002gJR-1xwA;
	Wed, 24 Apr 2024 05:30:11 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzVCn-00000002gHP-2wWF;
	Wed, 24 Apr 2024 05:30:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713936606; x=1745472606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m94xgFiC9Egx8aA5jSWnNCr+cu96SO8oXS5hvtC918o=;
  b=WM9LYHzyRtKnvUnGZA80OE5K2mnOUcijTUjPJfckH7k87gJRJ7wrw+D/
   zw+9QlQu20KlWVbGIlBHkdT6z3ssImVJSpI7gRNpNnek90gOZhbiLwSYt
   2zEgGVs0BavfbWa6siXYZ0Zaacu4njSnnfZk/tq3+zuk09oknN4KYvv2a
   FDGPNBTI4wpR25AvsWbvWvJRUQoh80vYanepyVi2MWx6971E5DUPKgGx4
   mHFVU+XcNKU/qh76QKnM8y0+xOBwr+kAivN2hjb7hJwRUkKKeo97uVQoi
   sNiC+8Yd1NCmAQ6IAeOgZDXdenrODtwpeelsXgXQRiuGCdexuYLIQpuWG
   Q==;
X-CSE-ConnectionGUID: 0Ky47hHKTyyLbD0uz64lWg==
X-CSE-MsgGUID: j3NMZu3cTKWJ+3aphCosXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="27004264"
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="27004264"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2024 22:30:06 -0700
X-CSE-ConnectionGUID: TV3x9Wh/SXakiir18y3vQA==
X-CSE-MsgGUID: lbzoQyNzTZ++rY75L2VhXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,225,1708416000"; 
   d="scan'208";a="62049888"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by orviesa001.jf.intel.com with ESMTP; 23 Apr 2024 22:29:55 -0700
From: Haibo Xu <haibo1.xu@intel.com>
To: sunilvl@ventanamicro.com,
	arnd@arndb.de
Cc: xiaobo55x@gmail.com,
	ajones@ventanamicro.com,
	Haibo Xu <haibo1.xu@intel.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Robert Moore <robert.moore@intel.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Baoquan He <bhe@redhat.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	James Morse <james.morse@arm.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Evan Green <evan@rivosinc.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tony Luck <tony.luck@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [PATCH v3 2/6] ACPI: RISCV: Add NUMA support based on SRAT and SLIT
Date: Wed, 24 Apr 2024 13:46:22 +0800
Message-Id: <060957b1c052a97eced29a5f85f647e95ddb91e9.1713778236.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713778236.git.haibo1.xu@intel.com>
References: <cover.1713778236.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_223007_357228_A3046BF3 
X-CRM114-Status: GOOD (  25.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add acpi_numa.c file to enable parse NUMA information from
ACPI SRAT and SLIT tables. SRAT table provide CPUs(Hart) and
memory nodes to proximity domain mapping, while SLIT table
provide the distance metrics between proximity domains.

Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>
---
 arch/riscv/include/asm/acpi.h |  15 +++-
 arch/riscv/kernel/Makefile    |   1 +
 arch/riscv/kernel/acpi.c      |   5 --
 arch/riscv/kernel/acpi_numa.c | 131 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c     |   4 +-
 arch/riscv/kernel/smpboot.c   |   2 -
 include/linux/acpi.h          |   6 ++
 7 files changed, 154 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/kernel/acpi_numa.c

diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
index 7dad0cf9d701..e0a1f84404f3 100644
--- a/arch/riscv/include/asm/acpi.h
+++ b/arch/riscv/include/asm/acpi.h
@@ -61,11 +61,14 @@ static inline void arch_fix_phys_package_id(int num, u32 slot) { }
 
 void acpi_init_rintc_map(void);
 struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu);
-u32 get_acpi_id_for_cpu(int cpu);
+static inline u32 get_acpi_id_for_cpu(int cpu)
+{
+	return acpi_cpu_get_madt_rintc(cpu)->uid;
+}
+
 int acpi_get_riscv_isa(struct acpi_table_header *table,
 		       unsigned int cpu, const char **isa);
 
-static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
 void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
 			     u32 *cboz_size, u32 *cbop_size);
 #else
@@ -87,4 +90,12 @@ static inline void acpi_get_cbo_block_size(struct acpi_table_header *table,
 
 #endif /* CONFIG_ACPI */
 
+#ifdef CONFIG_ACPI_NUMA
+int acpi_numa_get_nid(unsigned int cpu);
+void acpi_map_cpus_to_nodes(void);
+#else
+static inline int acpi_numa_get_nid(unsigned int cpu) { return NUMA_NO_NODE; }
+static inline void acpi_map_cpus_to_nodes(void) { }
+#endif /* CONFIG_ACPI_NUMA */
+
 #endif /*_ASM_ACPI_H*/
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 81d94a8ee10f..960e627d2ad1 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -109,3 +109,4 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
 
 obj-$(CONFIG_64BIT)		+= pi/
 obj-$(CONFIG_ACPI)		+= acpi.o
+obj-$(CONFIG_ACPI_NUMA)	+= acpi_numa.o
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index e619edc8b0cc..040bdbfea2b4 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -191,11 +191,6 @@ struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
 	return &cpu_madt_rintc[cpu];
 }
 
-u32 get_acpi_id_for_cpu(int cpu)
-{
-	return acpi_cpu_get_madt_rintc(cpu)->uid;
-}
-
 /*
  * __acpi_map_table() will be called before paging_init(), so early_ioremap()
  * or early_memremap() should be called here to for ACPI table mapping.
diff --git a/arch/riscv/kernel/acpi_numa.c b/arch/riscv/kernel/acpi_numa.c
new file mode 100644
index 000000000000..0231482d6946
--- /dev/null
+++ b/arch/riscv/kernel/acpi_numa.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ACPI 6.6 based NUMA setup for RISCV
+ * Lots of code was borrowed from arch/arm64/kernel/acpi_numa.c
+ *
+ * Copyright 2004 Andi Kleen, SuSE Labs.
+ * Copyright (C) 2013-2016, Linaro Ltd.
+ *		Author: Hanjun Guo <hanjun.guo@linaro.org>
+ * Copyright (C) 2024 Intel Corporation.
+ *
+ * Reads the ACPI SRAT table to figure out what memory belongs to which CPUs.
+ *
+ * Called from acpi_numa_init while reading the SRAT and SLIT tables.
+ * Assumes all memory regions belonging to a single proximity domain
+ * are in one chunk. Holes between them will be included in the node.
+ */
+
+#define pr_fmt(fmt) "ACPI: NUMA: " fmt
+
+#include <linux/acpi.h>
+#include <linux/bitmap.h>
+#include <linux/kernel.h>
+#include <linux/mm.h>
+#include <linux/memblock.h>
+#include <linux/mmzone.h>
+#include <linux/module.h>
+#include <linux/topology.h>
+
+#include <asm/numa.h>
+
+static int acpi_early_node_map[NR_CPUS] __initdata = { NUMA_NO_NODE };
+
+int __init acpi_numa_get_nid(unsigned int cpu)
+{
+	return acpi_early_node_map[cpu];
+}
+
+static inline int get_cpu_for_acpi_id(u32 uid)
+{
+	int cpu;
+
+	for (cpu = 0; cpu < nr_cpu_ids; cpu++)
+		if (uid == get_acpi_id_for_cpu(cpu))
+			return cpu;
+
+	return -EINVAL;
+}
+
+static int __init acpi_parse_rintc_pxm(union acpi_subtable_headers *header,
+				       const unsigned long end)
+{
+	struct acpi_srat_rintc_affinity *pa;
+	int cpu, pxm, node;
+
+	if (srat_disabled())
+		return -EINVAL;
+
+	pa = (struct acpi_srat_rintc_affinity *)header;
+	if (!pa)
+		return -EINVAL;
+
+	if (!(pa->flags & ACPI_SRAT_RINTC_ENABLED))
+		return 0;
+
+	pxm = pa->proximity_domain;
+	node = pxm_to_node(pxm);
+
+	/*
+	 * If we can't map the UID to a logical cpu this
+	 * means that the UID is not part of possible cpus
+	 * so we do not need a NUMA mapping for it, skip
+	 * the SRAT entry and keep parsing.
+	 */
+	cpu = get_cpu_for_acpi_id(pa->acpi_processor_uid);
+	if (cpu < 0)
+		return 0;
+
+	acpi_early_node_map[cpu] = node;
+	pr_info("SRAT: PXM %d -> HARTID 0x%lx -> Node %d\n", pxm,
+		cpuid_to_hartid_map(cpu), node);
+
+	return 0;
+}
+
+void __init acpi_map_cpus_to_nodes(void)
+{
+	int i;
+
+	/*
+	 * In ACPI, SMP and CPU NUMA information is provided in separate
+	 * static tables, namely the MADT and the SRAT.
+	 *
+	 * Thus, it is simpler to first create the cpu logical map through
+	 * an MADT walk and then map the logical cpus to their node ids
+	 * as separate steps.
+	 */
+	acpi_table_parse_entries(ACPI_SIG_SRAT, sizeof(struct acpi_table_srat),
+				 ACPI_SRAT_TYPE_RINTC_AFFINITY, acpi_parse_rintc_pxm, 0);
+
+	for (i = 0; i < nr_cpu_ids; i++)
+		early_map_cpu_to_node(i, acpi_numa_get_nid(i));
+}
+
+/* Callback for Proximity Domain -> logical node ID mapping */
+void __init acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa)
+{
+	int pxm, node;
+
+	if (srat_disabled())
+		return;
+
+	if (pa->header.length < sizeof(struct acpi_srat_rintc_affinity)) {
+		pr_err("SRAT: Invalid SRAT header length: %d\n", pa->header.length);
+		bad_srat();
+		return;
+	}
+
+	if (!(pa->flags & ACPI_SRAT_RINTC_ENABLED))
+		return;
+
+	pxm = pa->proximity_domain;
+	node = acpi_map_pxm_to_node(pxm);
+
+	if (node == NUMA_NO_NODE) {
+		pr_err("SRAT: Too many proximity domains %d\n", pxm);
+		bad_srat();
+		return;
+	}
+
+	node_set(node, numa_nodes_parsed);
+}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 4f73c0ae44b2..a2cde65b69e9 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -281,8 +281,10 @@ void __init setup_arch(char **cmdline_p)
 	setup_smp();
 #endif
 
-	if (!acpi_disabled)
+	if (!acpi_disabled) {
 		acpi_init_rintc_map();
+		acpi_map_cpus_to_nodes();
+	}
 
 	riscv_init_cbo_blocksizes();
 	riscv_fill_hwcap();
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index d41090fc3203..7b63149128e7 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -96,7 +96,6 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
 	if (hart == cpuid_to_hartid_map(0)) {
 		BUG_ON(found_boot_cpu);
 		found_boot_cpu = true;
-		early_map_cpu_to_node(0, acpi_numa_get_nid(cpu_count));
 		return 0;
 	}
 
@@ -106,7 +105,6 @@ static int __init acpi_parse_rintc(union acpi_subtable_headers *header, const un
 	}
 
 	cpuid_to_hartid_map(cpu_count) = hart;
-	early_map_cpu_to_node(cpu_count, acpi_numa_get_nid(cpu_count));
 	cpu_count++;
 
 	return 0;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 34829f2c517a..bba6d6b35f68 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -269,6 +269,12 @@ acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa) { }
 
 int acpi_numa_memory_affinity_init (struct acpi_srat_mem_affinity *ma);
 
+#ifdef CONFIG_RISCV
+void acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa);
+#else
+static inline void acpi_numa_rintc_affinity_init(struct acpi_srat_rintc_affinity *pa) { }
+#endif
+
 #ifndef PHYS_CPUID_INVALID
 typedef u32 phys_cpuid_t;
 #define PHYS_CPUID_INVALID (phys_cpuid_t)(-1)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
