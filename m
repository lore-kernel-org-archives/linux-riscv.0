Return-Path: <SRS0=CEwi=NM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFF50C6786F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 23:04:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A91B720657
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  1 Nov 2018 23:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oyil0dnn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="TeUvWklV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A91B720657
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3UIPl33atSDY9KVaRvUmFDExqgIxfWKnScxFq0tQiYk=; b=Oyil0dnnEuLFrnsdtQfngRJfx4
	mVqOZLR49UduJyDqeH8OvgFbIeXtDYCtYRjIekA2M6r2zq2JBKxZdbPKRkCp8xl7nSYIPw9XkbuoB
	ZXSzQArbi6Xw7aCU244LMYNWn3lzms1NE9LAJdeDWLEGYSOH1s5ZCAD5TkxkTc+MxHzDWy9wRF9dy
	KuiRRiXpCWIz3f3fSxpurPuCQ22MMfhIbS7wdOvw6BSyrC4Qy4WK24bW56SrczokYkwlsSmP5yoe7
	NLO+b7HMa8DgaqV3VVrubAHjqzcFEugKQRdBhhdn5KemW6xuezVsNsEz2fhTh/lEZ0V3emR1m7H4J
	iit+5OOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gIM1J-0001eo-QS; Thu, 01 Nov 2018 23:04:57 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gIM1G-0001a9-B3
 for linux-riscv@lists.infradead.org; Thu, 01 Nov 2018 23:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1541113495; x=1572649495;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=IrvmeNwmAXPQ6w9WW8c5cIIoJ3GqExvnYZ0ZjKV6/6Y=;
 b=TeUvWklVRsUh1yQOE37CBO66SAkVTHdeTyn1SE71jEQtA4DBuOrpOPkm
 egLltq2k+YjubiXfO1lRU1aJPIatpzJXZ5qegupqGqSzvOFDD9JV6SM8x
 4iEQLamyLm/xkSTwegSd7hiLi1QH9MBwtA+cvYsAU7pC91Pmomqu9MMjn
 /pGt+LBavmx2wrTwammukhWEJqbpEL89p3mmTVRwpCMbt/PHDF2i1VA4j
 4m9A/fkuMaMdugzGX1WYfnwa1u/uRQAMOmV4uUKDgd/Y3SUnNjDq4fm/P
 pTaVtxvDUU1lVjUzmdsbLTcXusWzaOoS2q70nyPWQz6NfKJLmoqYWYbXq Q==;
X-IronPort-AV: E=Sophos;i="5.54,454,1534780800"; d="scan'208";a="93332265"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 Nov 2018 07:04:30 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP; 01 Nov 2018 15:48:14 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Nov 2018 16:04:29 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [RFC 2/2] RISC-V: Introduce cpu topology.
Date: Thu,  1 Nov 2018 16:04:28 -0700
Message-Id: <1541113468-22097-3-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
References: <1541113468-22097-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181101_160454_420361_432AC0EE 
X-CRM114-Status: GOOD (  19.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Damien.LeMoal@wdc.com,
 alankao@andestech.com, zong@andestech.com, anup@brainfault.org,
 palmer@sifive.com, linux-kernel@vger.kernel.org, hch@infradead.org,
 robh+dt@kernel.org, tglx@linutronix.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181101230428.M6AkWaVHQNt-WRg07TEJPptO600yQL5emABLzlwVhMo@z>

Currently, cpu topology is not defined for RISC-V.

Parse cpu-topology from a new DT entry "cpu-topology"
to create different cpu sibling maps.
As of now, only bare minimum requirements are implemented
but it is capable of describing any type of topology in future.

CPU topology after applying the patch.
$cat /sys/devices/system/cpu/cpu2/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/core_siblings_list
0-3
$cat /sys/devices/system/cpu/cpu3/topology/physical_package_id
0
$cat /sys/devices/system/cpu/cpu3/topology/core_id
3

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/topology.h |  28 ++++++
 arch/riscv/kernel/Makefile        |   1 +
 arch/riscv/kernel/smpboot.c       |   5 +-
 arch/riscv/kernel/topology.c      | 194 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 227 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/topology.h
 create mode 100644 arch/riscv/kernel/topology.c

diff --git a/arch/riscv/include/asm/topology.h b/arch/riscv/include/asm/topology.h
new file mode 100644
index 00000000..d412edc8
--- /dev/null
+++ b/arch/riscv/include/asm/topology.h
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#ifndef __ASM_TOPOLOGY_H
+#define __ASM_TOPOLOGY_H
+
+#include <linux/cpumask.h>
+#include <asm-generic/topology.h>
+
+struct riscv_cpu_topology {
+	int core_id;
+	int package_id;
+	int hart_id;
+	cpumask_t thread_sibling;
+	cpumask_t core_sibling;
+};
+
+extern struct riscv_cpu_topology cpu_topology[NR_CPUS];
+
+#define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
+#define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
+#define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
+#define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
+
+void init_cpu_topology(void);
+void remove_cpu_topology(unsigned int cpuid);
+void set_topology_masks(unsigned int cpuid);
+
+#endif /* _ASM_RISCV_TOPOLOGY_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index e1274fc0..128766f8 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -27,6 +27,7 @@ obj-y	+= riscv_ksyms.o
 obj-y	+= stacktrace.o
 obj-y	+= vdso.o
 obj-y	+= cacheinfo.o
+obj-y	+= topology.o
 obj-y	+= vdso/
 
 CFLAGS_setup.o := -mcmodel=medany
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 56abab6a..1324f4b2 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -45,6 +45,7 @@ void __init smp_prepare_boot_cpu(void)
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
+	init_cpu_topology();
 }
 
 void __init setup_smp(void)
@@ -98,13 +99,15 @@ void __init smp_cpus_done(unsigned int max_cpus)
 asmlinkage void __init smp_callin(void)
 {
 	struct mm_struct *mm = &init_mm;
+	int cpu = smp_processor_id();
 
 	/* All kernel threads share the same mm context.  */
 	atomic_inc(&mm->mm_count);
 	current->active_mm = mm;
 
 	trap_init();
-	notify_cpu_starting(smp_processor_id());
+	notify_cpu_starting(cpu);
+	set_topology_masks(cpu);
 	set_cpu_online(smp_processor_id(), 1);
 	local_flush_tlb_all();
 	local_irq_enable();
diff --git a/arch/riscv/kernel/topology.c b/arch/riscv/kernel/topology.c
new file mode 100644
index 00000000..5195de14
--- /dev/null
+++ b/arch/riscv/kernel/topology.c
@@ -0,0 +1,194 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2018 Western Digital Corporation or its affiliates.
+ *
+ * Based on the arm64 version arch/arm64/kernel/topology.c
+ *
+ */
+
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/of.h>
+#include <linux/smp.h>
+#include <linux/string.h>
+
+#include <asm/topology.h>
+
+/*
+ * cpu topology array
+ */
+struct riscv_cpu_topology cpu_topology[NR_CPUS];
+EXPORT_SYMBOL_GPL(cpu_topology);
+
+void set_topology_masks(unsigned int cpuid)
+{
+	struct riscv_cpu_topology *ctopo, *cpuid_topo = &cpu_topology[cpuid];
+	int cpu;
+
+	/* update core and thread sibling masks */
+	for_each_online_cpu(cpu) {
+		ctopo = &cpu_topology[cpu];
+
+		if (cpuid_topo->package_id != ctopo->package_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &ctopo->core_sibling);
+		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+		if (cpuid_topo->core_id != ctopo->core_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &ctopo->thread_sibling);
+		cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+	}
+}
+
+static int __init get_hartid_for_cnode(struct device_node *node,
+				       unsigned int count)
+{
+	char name[10];
+	struct device_node *cpu_node;
+	int cpu;
+
+	snprintf(name, sizeof(name), "cpu%d", count);
+	cpu_node = of_parse_phandle(node, name, 0);
+	if (!cpu_node)
+		return -1;
+
+	cpu = of_cpu_node_to_id(cpu_node);
+	if (cpu < 0)
+		pr_err("Unable to find CPU node for %pOF\n", cpu_node);
+
+	of_node_put(cpu_node);
+	return cpu;
+}
+
+static int __init parse_core(struct device_node *core, int pid)
+{
+	char name[10];
+	struct device_node *cnode;
+	int count, hid = 0;
+	int coreid = 0;
+	bool found_hart = false;
+
+	do {
+		snprintf(name, sizeof(name), "core%d", coreid);
+		cnode = of_get_child_by_name(core, name);
+		if (cnode) {
+			count = 0;
+			do {
+				hid = get_hartid_for_cnode(cnode, count);
+				if (hid >= 0) {
+					found_hart = true;
+					cpu_topology[hid].package_id = pid;
+					cpu_topology[hid].core_id = coreid;
+					cpu_topology[hid].hart_id = hid;
+				}
+				count++;
+			} while (hid >= 0);
+			coreid++;
+			of_node_put(cnode);
+		}
+	} while (cnode);
+
+	if (!found_hart) {
+		pr_err("%pOF: no hart found\n", cnode);
+		of_node_put(cnode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+static int __init parse_package(struct device_node *package)
+{
+	char name[10];
+	struct device_node *pnode;
+	int ret, package_id = 0;
+
+	/*
+	 * Current RISC-V system doesn't have child package node. It has a
+	 * flat package hierarchy. Once, we have such a system, the following
+	 * code can be modified to support that.
+	 */
+	do {
+		snprintf(name, sizeof(name), "package%d", package_id);
+		pnode = of_get_child_by_name(package, name);
+		if (pnode) {
+			ret = parse_core(pnode, package_id);
+			if (ret < 0)
+				pr_warn("%pOF: empty package\n", package);
+
+			package_id++;
+		}
+	} while (pnode);
+
+	return 0;
+}
+
+static int __init parse_dt_topology(void)
+{
+	struct device_node *cn, *map;
+	int ret = 0;
+	int cpu;
+
+	cn = of_find_node_by_path("/cpus");
+	if (!cn) {
+		pr_err("No CPU information found in DT\n");
+		return 0;
+	}
+
+	map = of_get_child_by_name(cn, "cpu-topology");
+	if (!map)
+		goto out;
+
+	ret = parse_package(map);
+	if (ret != 0)
+		goto out_map;
+
+	/*
+	 * Check that all cores are in the topology; the SMP code will
+	 * only mark cores described in the DT as possible.
+	 */
+	for_each_possible_cpu(cpu)
+		if (cpu_topology[cpu].package_id == -1)
+			ret = -EINVAL;
+
+out_map:
+	of_node_put(map);
+out:
+	of_node_put(cn);
+	return ret;
+}
+
+static void clear_all_topology_masks(int cpu)
+{
+	struct riscv_cpu_topology *ctopo = &cpu_topology[cpu];
+
+	cpumask_clear(&ctopo->core_sibling);
+	cpumask_set_cpu(cpu, &ctopo->core_sibling);
+	cpumask_clear(&ctopo->thread_sibling);
+	cpumask_set_cpu(cpu, &ctopo->thread_sibling);
+}
+
+static void __init reset_cpu_topology(void)
+{
+	unsigned int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct riscv_cpu_topology *ctopo = &cpu_topology[cpu];
+
+		ctopo->hart_id = 0;
+		ctopo->core_id = 0;
+		ctopo->package_id = -1;
+
+		clear_all_topology_masks(cpu);
+	}
+}
+
+void __init init_cpu_topology(void)
+{
+	reset_cpu_topology();
+
+	if (of_have_populated_dt() && parse_dt_topology())
+		reset_cpu_topology();
+}
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
