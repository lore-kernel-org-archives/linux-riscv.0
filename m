Return-Path: <SRS0=Z5mV=BY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AAD4C433DF
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:48:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C497A20838
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2020 21:48:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lcPsTILC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dFjf1hQc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C497A20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5TsCf9zQrTrrVLsuJWpA1meMneA85Vmhxpm9Ss59oMo=; b=lcPsTILCnSDdIBPeueWQRoByq
	HRtaT3J74P3rH10oac6lRWmfpb+Nf/AVUXUXVobi1m90qafGkc/ua6keoGSaj8sKxrhl0MgrgtxF6
	sbt6e3gmh5LDhqqcCxmsTYIMyEmkN3B+Yv4QE1FcdHHafJ46PGuL5AJ/RqQ3haJT4s6alCQaIZUKA
	fkHS74FW3oCM0rg5sANR81az4lRfXPY4m3O7oc8C8WGN1g2+QFPHxq1SPCBQl6hG4iwze+zfkrkcZ
	udqB7TC/XhSESoG7bxqC6vVYrJeB44lkh/Wv//lXkWYcTYiLEb59QeAwpsCu50xlkTpaCLyY8ASXB
	9u5eXUhIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6hYy-0008L9-4D; Fri, 14 Aug 2020 21:48:36 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6hYt-0008IJ-Fh; Fri, 14 Aug 2020 21:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1597441711; x=1628977711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SJ0t1sPROiBG0ybrpqvJwUR8k08JOqtJS9YP0pE5HbI=;
 b=dFjf1hQcHgTjMfGrNOFOubCnEIGcfzKOZWOJIn4gdMOC0J2Wb2iAr91N
 6NIuqZqtv/OTxBRCK4RGQJyqvphp+51TpWRziu0+k5vGBXUk6/sczIURY
 DIXlBuAipf0gCbquh19xoEAbbajcWrpVhwDVIZufEKmiRhBVFIDm51Q7c
 3rp8vlBkGeErZ/6wF/ke16oxDrN5FutvIMQf6RT4qzfx7evdBxlV9VtaP
 C06TdGcxFCmytKTPIFU13lw6FsJbgmMvRt5TpyvAOkRjz5HsruRstqRbA
 Q/cxLdMmTbwR1MzMgfTRe3RK4Qvl+Pm+3XKidCbEhOxZhISvEMMslJDZ3 A==;
IronPort-SDR: 1tS2I8LJVzbD9ZRVo3cMwrE6RgOX4mT6JdlzQKwtwJifP6zXauTKiJnznf3VwVX9qWzWeq9EnC
 Cow7HqPJvyZ5If9KJiS/crwQkMugEOTI3YVsUX6ERKFyk+2zCbJIAGBUHc7ql7ZMxhXZpreuW9
 iEH6CkFOzRP9mwtvGwzEcrj3hq1nvp775GrsrFJ63616VOuRwtDth4wxbh7PQ9NFCJv+jCjoGf
 Ia0Q8vAToJnfO9WOaga4eCjCjt9z8w3FDlmmpaYgrlxFH2rM9Frtg+hF1EzGmX1KaJdJU/PHG7
 fkU=
X-IronPort-AV: E=Sophos;i="5.76,313,1592841600"; d="scan'208";a="254397125"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 15 Aug 2020 05:48:28 +0800
IronPort-SDR: yaZtaxD6QsjlLa8/DO7WMW0Nu6P4pE8A5MvXfjMTjZA47pYYaniJQDjvF+0Rdks/xJRoIc2N8/
 jmi6K53cjbyg==
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2020 14:35:34 -0700
IronPort-SDR: xffce0VAhCB97N3lScrDgWYFuEDqStOodwz6NuYrdbRda0C1irpZ5qtGu/MYexgJM39mnWmD8l
 W9+3tcwmpHpA==
WDCIronportException: Internal
Received: from cnf006060.ad.shared (HELO jedi-01.hgst.com) ([10.86.59.56])
 by uls-op-cesaip01.wdc.com with ESMTP; 14 Aug 2020 14:48:27 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC/RFT PATCH 1/6] numa: Move numa implementation to common code
Date: Fri, 14 Aug 2020 14:47:20 -0700
Message-Id: <20200814214725.28818-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200814214725.28818-1-atish.patra@wdc.com>
References: <20200814214725.28818-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200814_174831_775913_FB6743B1 
X-CRM114-Status: GOOD (  21.19  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ganapatrao Kulkarni <gkulkarni@cavium.com>,
 Steven Price <steven.price@arm.com>, Greentime Hu <greentime.hu@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 Nick Hu <nickhu@andestech.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

ARM64 numa implementation is generic enough that RISC-V can reuse that
implementation with very minor cosmetic changes. This will help both
ARM64 and RISC-V in terms of maintanace and feature improvement

Move the numa implementation code to common directory so that both ISAs
can reuse this. This doesn't introduce any function changes for ARM64.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/arm64/Kconfig                            |  1 +
 arch/arm64/include/asm/numa.h                 | 45 +---------------
 arch/arm64/mm/Makefile                        |  1 -
 drivers/base/Kconfig                          |  6 +++
 drivers/base/Makefile                         |  1 +
 .../mm/numa.c => drivers/base/arch_numa.c     |  0
 include/asm-generic/numa.h                    | 51 +++++++++++++++++++
 7 files changed, 60 insertions(+), 45 deletions(-)
 rename arch/arm64/mm/numa.c => drivers/base/arch_numa.c (100%)
 create mode 100644 include/asm-generic/numa.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 6d232837cbee..955a0cf75b16 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -960,6 +960,7 @@ config HOTPLUG_CPU
 # Common NUMA Features
 config NUMA
 	bool "NUMA Memory Allocation and Scheduler Support"
+	select GENERIC_ARCH_NUMA
 	select ACPI_NUMA if ACPI
 	select OF_NUMA
 	help
diff --git a/arch/arm64/include/asm/numa.h b/arch/arm64/include/asm/numa.h
index 626ad01e83bf..8c8cf4297cc3 100644
--- a/arch/arm64/include/asm/numa.h
+++ b/arch/arm64/include/asm/numa.h
@@ -3,49 +3,6 @@
 #define __ASM_NUMA_H
 
 #include <asm/topology.h>
-
-#ifdef CONFIG_NUMA
-
-#define NR_NODE_MEMBLKS		(MAX_NUMNODES * 2)
-
-int __node_distance(int from, int to);
-#define node_distance(a, b) __node_distance(a, b)
-
-extern nodemask_t numa_nodes_parsed __initdata;
-
-extern bool numa_off;
-
-/* Mappings between node number and cpus on that node. */
-extern cpumask_var_t node_to_cpumask_map[MAX_NUMNODES];
-void numa_clear_node(unsigned int cpu);
-
-#ifdef CONFIG_DEBUG_PER_CPU_MAPS
-const struct cpumask *cpumask_of_node(int node);
-#else
-/* Returns a pointer to the cpumask of CPUs on Node 'node'. */
-static inline const struct cpumask *cpumask_of_node(int node)
-{
-	return node_to_cpumask_map[node];
-}
-#endif
-
-void __init arm64_numa_init(void);
-int __init numa_add_memblk(int nodeid, u64 start, u64 end);
-void __init numa_set_distance(int from, int to, int distance);
-void __init numa_free_distance(void);
-void __init early_map_cpu_to_node(unsigned int cpu, int nid);
-void numa_store_cpu_info(unsigned int cpu);
-void numa_add_cpu(unsigned int cpu);
-void numa_remove_cpu(unsigned int cpu);
-
-#else	/* CONFIG_NUMA */
-
-static inline void numa_store_cpu_info(unsigned int cpu) { }
-static inline void numa_add_cpu(unsigned int cpu) { }
-static inline void numa_remove_cpu(unsigned int cpu) { }
-static inline void arm64_numa_init(void) { }
-static inline void early_map_cpu_to_node(unsigned int cpu, int nid) { }
-
-#endif	/* CONFIG_NUMA */
+#include <asm-generic/numa.h>
 
 #endif	/* __ASM_NUMA_H */
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index d91030f0ffee..928c308b044b 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -6,7 +6,6 @@ obj-y				:= dma-mapping.o extable.o fault.o init.o \
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE)	+= dump.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
-obj-$(CONFIG_NUMA)		+= numa.o
 obj-$(CONFIG_DEBUG_VIRTUAL)	+= physaddr.o
 KASAN_SANITIZE_physaddr.o	+= n
 
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 8d7001712062..73c2151de194 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -210,4 +210,10 @@ config GENERIC_ARCH_TOPOLOGY
 	  appropriate scaling, sysfs interface for reading capacity values at
 	  runtime.
 
+config GENERIC_ARCH_NUMA
+	bool
+	help
+	  Enable support for generic numa implementation. Currently, RISC-V
+	  and ARM64 uses it.
+
 endmenu
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 157452080f3d..c3d02c644222 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_PINCTRL) += pinctrl.o
 obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
 obj-$(CONFIG_GENERIC_MSI_IRQ_DOMAIN) += platform-msi.o
 obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
+obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
 
 obj-y			+= test/
 
diff --git a/arch/arm64/mm/numa.c b/drivers/base/arch_numa.c
similarity index 100%
rename from arch/arm64/mm/numa.c
rename to drivers/base/arch_numa.c
diff --git a/include/asm-generic/numa.h b/include/asm-generic/numa.h
new file mode 100644
index 000000000000..0635c0724b7c
--- /dev/null
+++ b/include/asm-generic/numa.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_GENERIC_NUMA_H
+#define __ASM_GENERIC_NUMA_H
+
+#ifdef CONFIG_NUMA
+
+#define NR_NODE_MEMBLKS		(MAX_NUMNODES * 2)
+
+int __node_distance(int from, int to);
+#define node_distance(a, b) __node_distance(a, b)
+
+extern nodemask_t numa_nodes_parsed __initdata;
+
+extern bool numa_off;
+
+/* Mappings between node number and cpus on that node. */
+extern cpumask_var_t node_to_cpumask_map[MAX_NUMNODES];
+void numa_clear_node(unsigned int cpu);
+
+#ifdef CONFIG_DEBUG_PER_CPU_MAPS
+const struct cpumask *cpumask_of_node(int node);
+#else
+/* Returns a pointer to the cpumask of CPUs on Node 'node'. */
+static inline const struct cpumask *cpumask_of_node(int node)
+{
+	return node_to_cpumask_map[node];
+}
+#endif
+
+void __init arm64_numa_init(void);
+int __init numa_add_memblk(int nodeid, u64 start, u64 end);
+void __init numa_set_distance(int from, int to, int distance);
+void __init numa_free_distance(void);
+void __init early_map_cpu_to_node(unsigned int cpu, int nid);
+void numa_store_cpu_info(unsigned int cpu);
+void numa_add_cpu(unsigned int cpu);
+void numa_remove_cpu(unsigned int cpu);
+
+#else	/* CONFIG_NUMA */
+
+static inline void numa_store_cpu_info(unsigned int cpu) { }
+static inline void numa_add_cpu(unsigned int cpu) { }
+static inline void numa_remove_cpu(unsigned int cpu) { }
+static inline void arm64_numa_init(void) { }
+static inline void early_map_cpu_to_node(unsigned int cpu, int nid) { }
+
+#endif	/* CONFIG_NUMA */
+
+#include <asm/topology.h>
+
+#endif	/* __ASM_GENERIC_NUMA_H */
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
