Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0A6C27C4F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jun 2024 08:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxGSBw+oZLxJ2NV31UQu1qqLkfchx9O0mARHQT33IU4=; b=E/LFjnttboPzAx
	XXZDIRw+cIKbrIVpFWvfo1IKQBieY9EEtGzLDKNOHausg+1LFPedH/ChLVDOwJSO5O4MN6Qjn1mjF
	pBLJ/+frHzTav8geD7r1zil1t9VaLJsHnNzzuvk+HDQWyzlBBT0bbbjXrbNmJ0whqohLcrcUY6mMS
	7pi3nUMwamkDXccCEFHWEupc5fNlNncbZAYWE1m5NrMjkUbXmsqQqf4ABdgACX4pWpP6mVeE3IhOB
	tPDwGfrU2Mxf9O+WdvYKQzSz8A+GGOkikJ6AeBajjYdbRKUkJVHop0uGBgDjdZMpppHs2NqytLU0s
	5VJXlBPP94gUyhXsi/ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfx0-0000000FirF-3kiK;
	Thu, 13 Jun 2024 08:36:54 +0000
Received: from mgamail.intel.com ([198.175.65.21])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHfww-0000000FipC-3VX2;
	Thu, 13 Jun 2024 08:36:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718267811; x=1749803811;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MdSsdR+nCk+lUET3GoDI+x2qw9fyMSMCpII1FEoUKIU=;
  b=h5hp5aq9eB4+aC3BxmgPnbq4le+4zaNkfp4rTojCHiH6mllisVBQ3upd
   bQl4bV1BaCeXPzeFIlHq70qbB1GBb1YInhmDo5FYbpSkciQzI6QizNyev
   2WbOHGTC+aG2S0nz6+6PgmeLYPxLDeXF5lhLI1q09/0vOR8EN3hHpzrz4
   N3aawaefPgXOtjPVOJlf26rSA52HgKK0od9Vw+/8JjFzbpbYU3i8Da81O
   c01xZFYUMAwPHz6+jxH52gnezBIqgSngdqjNibrQaUZiBFAJEMQHUKPYY
   7Hj58Jua0fJYDJjS/Mxwcxh7K9K0uqI1FGplvfdKo9makGQrowC9aMUKs
   g==;
X-CSE-ConnectionGUID: wnJ10Zn4SRmIirAM9BdO4g==
X-CSE-MsgGUID: eKC+vl+OR5ueOeLZN4wiUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="15037795"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="15037795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 01:36:50 -0700
X-CSE-ConnectionGUID: /6kYW/xnTOybf+evepdIFg==
X-CSE-MsgGUID: mtQyswmUSkiWSqE2erBdeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="40033671"
Received: from unknown (HELO haibo-OptiPlex-7090.sh.intel.com) ([10.239.159.132])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2024 01:36:40 -0700
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
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Baoquan He <bhe@redhat.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Zong Li <zong.li@sifive.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	James Morse <james.morse@arm.com>,
	Evan Green <evan@rivosinc.com>,
	Zhao Ke <ke.zhao@shingroup.cn>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andy Chiu <andy.chiu@sifive.com>,
	Marc Zyngier <maz@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alison Schofield <alison.schofield@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Robert Richter <rrichter@amd.com>,
	Yuntao Wang <ytcoode@gmail.com>,
	Dave Jiang <dave.jiang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v4 1/4] ACPI: RISCV: Add NUMA support based on SRAT and SLIT
Date: Thu, 13 Jun 2024 16:54:33 +0800
Message-Id: <65dbad1fda08a32922c44886e4581e49b4a2fecc.1718268003.git.haibo1.xu@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718268003.git.haibo1.xu@intel.com>
References: <cover.1718268003.git.haibo1.xu@intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_013650_953599_7E45EADF 
X-CRM114-Status: GOOD (  26.30  )
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
index 5b243d46f4b1..1e2afec141b5 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -110,3 +110,4 @@ obj-$(CONFIG_COMPAT)		+= compat_vdso/
 
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
index 19baf0d574d3..0f8f1c95ac38 100644
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
index 28c3fb2bef0d..5a2b620ccd58 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -264,6 +264,12 @@ static inline void
 acpi_numa_gicc_affinity_init(struct acpi_srat_gicc_affinity *pa) { }
 #endif
 
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
