Return-Path: <SRS0=bcqy=RX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB48C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 01:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7667B20835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2019 01:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O0CMMwpO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XSkGfyjr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="B9lqdLDK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7667B20835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkA6e0yTjpgvz9Mc7UCz55qsy+GBSFwwQ6meVrJYsWo=; b=O0CMMwpOdzF6w7
	foB+CTQaS+vo2m7qO3pfKE5Wez5Qwka0GLNy/AROrnY5/28X1ZfmEz+ZmIbnCbYaUla34EIIhzePW
	QZxyki07gJPBtE4FDVeb9CY5fyzkx2xuf1DKI50QUvp45alCltwKh4tDR+zi9Ala1S5hLip+6YLdS
	AEMAFW2JK7P59fA59wZnaXCK8ZT2A07bdRr2vAOtuRRjtH5vp6LRlZRedfNaRf/g7VkeoUdw1nbFG
	It4O+fiSfgdJy6Ht/ILVEbAEfeObapubnrfa6y2IG5SyMNCFT4Ei95IbqJm167EzqkY5XaNSf3igD
	V86ynY/+S4SF+DhcMQ/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6Q7J-00072T-3I; Wed, 20 Mar 2019 01:34:05 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Q7H-00070S-Qd
 for linux-riscv@bombadil.infradead.org; Wed, 20 Mar 2019 01:34:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pUvoRaCB1Pd5oSIDWe0L+w8CwY0kGPJMJneoVK92CkM=; b=XSkGfyjrkhrxryCpWnp/6F4s83
 /Pkw4L9mGlJKZR/CXQxp+iThsvM0IRArENGU6wh0TRcaqVkSUI/aITfYUOj0WSNyflOFBkesjvOU4
 lwuSvKtqu4k+pStsTYPKTWNI0VfiRddDjG42tqKSGCaQZ4GemKSqlVe+TAm2rCHJO+GGa9xdp62rG
 2fZBrRDy+KKI+aWau6N3ZXAnORo1v2TWO86e4oH7FL/58g39+x28xDnhm1MeP91XsMzPe532uWlqW
 SU7W2+6rQRnDrDMuf4/6iInwaP9wwQURnmTxffVte+wnaloskESoUtIA/wVQXDcRPCW4rjaqGJp15
 aXV4A5YA==;
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6Pxc-000342-4a
 for linux-riscv@lists.infradead.org; Wed, 20 Mar 2019 01:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1553045044; x=1584581044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=amqP89gwPQFN9Tqm3LdMzVULIBgJF8Mj4/6iEK50OhA=;
 b=B9lqdLDKmudFQQaYx4evOs3oLjP7JYrYmKDg8sV5HK8YSHbM1TOpI3Co
 NQvsU722N2v+2Ka9XGcyUIBJQf2gB0s05JVeLxeQ83b1NUMosNRIB08R2
 0U6rOPWUqeMhkGCR/ZgwAFvJWLZJSsoW+sU1lqGy3ie3JTYvpqFsLMGNp
 XFsKhi7fWAR3TCVVc6po2LnkbudIYa9RnJ3LLn4eziI1FgcalGFDy9F3b
 fEpO+J0aIQVcfHnOTbTdhz8RvaxnzPNxmFAmESVcCea+CTaRySXod1bjd
 ANvRxd9OdAMnvcL92b/eXEag5cbaMhQoOx7W1c5vFgEUBWdKWohLElPFQ A==;
X-IronPort-AV: E=Sophos;i="5.60,246,1549900800"; d="scan'208";a="105533379"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2019 09:22:59 +0800
IronPort-SDR: kcK5cWyNSadVE/TopYzqMs/jWbf/y8fbuh+9AyL59SZUgUA+MNYZKsvTrHaDLQN+Ou1P6HdhvI
 gjNsoaLANIqMahwd4Yei878qjkUFgISo6P5eWt+lXzUTLX1i1l6L3GyKJJe0vaKsTFMcuyhnG8
 YwE+kWFqd7jvklYDaCYbikF4qNnyxS+KIcjnJop6cMuLhxSzfmL57xkoI3SpPcsF7qN3vSpTHl
 a5d3ITMGKAgy3YZpyCiy2vSdIfx3yRs6gE/+iUhVWSf22g08DeibFYV3Ywu9yc4OkFhomDg1ta
 9Pi5qvFdleUwZmlsmttCcDYL
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 19 Mar 2019 18:00:35 -0700
IronPort-SDR: F1u/FU+3QTwDiYoOWOl2oim21L1j1BuQprXuRSWuI/mXv9OOPE/oFMRbe73eQA8epago4WQ6Xv
 2sH+DZ/Q9PBAgwUNvtY3U7bBa6w1KNNwTHdzjVqGe2rIpl4iqfRE7qpu65TjZnNv9kZcRrdg7C
 51NaUMB5U4w7wQjDEYrFplPeyUW+6+XrCXBSx1Vywzx+fFn7nFXri00BpTZuv00pIMpLi+muSa
 B8zFKc2CqV41IccSh0GODldcYCSglO8vPDuv3ZQR1shki1BT5Dvok0njL2ccO1V5ed8rQbrCKF
 YN8=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 19 Mar 2019 18:22:59 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT/RFC PATCH v2 2/4] cpu-topology: Move cpu topology code to common
 code.
Date: Tue, 19 Mar 2019 18:22:49 -0700
Message-Id: <20190320012251.2728-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190320012251.2728-1-atish.patra@wdc.com>
References: <20190320012251.2728-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_012404_523172_BDEA2CFF 
X-CRM114-Status: GOOD (  29.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Morten Rasmussen <morten.rasmussen@arm.com>,
 Jeffrey Hugo <jhugo@codeaurora.org>, Anup Patel <anup@brainfault.org>,
 Ingo Molnar <mingo@kernel.org>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Both RISC-V & ARM64 are using cpu-map device tree to describe
their cpu topology. It's better to move the relevant code to
a common place instead of duplicate code.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 arch/arm64/include/asm/topology.h |  23 ---
 arch/arm64/kernel/topology.c      | 303 +-----------------------------
 drivers/base/arch_topology.c      | 298 ++++++++++++++++++++++++++++-
 drivers/base/topology.c           |   1 +
 include/linux/arch_topology.h     |  28 +++
 5 files changed, 330 insertions(+), 323 deletions(-)

diff --git a/arch/arm64/include/asm/topology.h b/arch/arm64/include/asm/topology.h
index 0524f243..a4d945db 100644
--- a/arch/arm64/include/asm/topology.h
+++ b/arch/arm64/include/asm/topology.h
@@ -4,29 +4,6 @@
 
 #include <linux/cpumask.h>
 
-struct cpu_topology {
-	int thread_id;
-	int core_id;
-	int package_id;
-	int llc_id;
-	cpumask_t thread_sibling;
-	cpumask_t core_sibling;
-	cpumask_t llc_sibling;
-};
-
-extern struct cpu_topology cpu_topology[NR_CPUS];
-
-#define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
-#define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
-#define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
-#define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
-#define topology_llc_cpumask(cpu)	(&cpu_topology[cpu].llc_sibling)
-
-void init_cpu_topology(void);
-void store_cpu_topology(unsigned int cpuid);
-void remove_cpu_topology(unsigned int cpuid);
-const struct cpumask *cpu_coregroup_mask(int cpu);
-
 #ifdef CONFIG_NUMA
 
 struct pci_bus;
diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index 0825c4a8..6b95c91e 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -14,250 +14,13 @@
 #include <linux/acpi.h>
 #include <linux/arch_topology.h>
 #include <linux/cacheinfo.h>
-#include <linux/cpu.h>
-#include <linux/cpumask.h>
 #include <linux/init.h>
 #include <linux/percpu.h>
-#include <linux/node.h>
-#include <linux/nodemask.h>
-#include <linux/of.h>
-#include <linux/sched.h>
-#include <linux/sched/topology.h>
-#include <linux/slab.h>
-#include <linux/smp.h>
-#include <linux/string.h>
 
 #include <asm/cpu.h>
 #include <asm/cputype.h>
 #include <asm/topology.h>
 
-static int __init get_cpu_for_node(struct device_node *node)
-{
-	struct device_node *cpu_node;
-	int cpu;
-
-	cpu_node = of_parse_phandle(node, "cpu", 0);
-	if (!cpu_node)
-		return -1;
-
-	cpu = of_cpu_node_to_id(cpu_node);
-	if (cpu >= 0)
-		topology_parse_cpu_capacity(cpu_node, cpu);
-	else
-		pr_crit("Unable to find CPU node for %pOF\n", cpu_node);
-
-	of_node_put(cpu_node);
-	return cpu;
-}
-
-static int __init parse_core(struct device_node *core, int package_id,
-			     int core_id)
-{
-	char name[10];
-	bool leaf = true;
-	int i = 0;
-	int cpu;
-	struct device_node *t;
-
-	do {
-		snprintf(name, sizeof(name), "thread%d", i);
-		t = of_get_child_by_name(core, name);
-		if (t) {
-			leaf = false;
-			cpu = get_cpu_for_node(t);
-			if (cpu >= 0) {
-				cpu_topology[cpu].package_id = package_id;
-				cpu_topology[cpu].core_id = core_id;
-				cpu_topology[cpu].thread_id = i;
-			} else {
-				pr_err("%pOF: Can't get CPU for thread\n",
-				       t);
-				of_node_put(t);
-				return -EINVAL;
-			}
-			of_node_put(t);
-		}
-		i++;
-	} while (t);
-
-	cpu = get_cpu_for_node(core);
-	if (cpu >= 0) {
-		if (!leaf) {
-			pr_err("%pOF: Core has both threads and CPU\n",
-			       core);
-			return -EINVAL;
-		}
-
-		cpu_topology[cpu].package_id = package_id;
-		cpu_topology[cpu].core_id = core_id;
-	} else if (leaf) {
-		pr_err("%pOF: Can't get CPU for leaf core\n", core);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int __init parse_cluster(struct device_node *cluster, int depth)
-{
-	char name[10];
-	bool leaf = true;
-	bool has_cores = false;
-	struct device_node *c;
-	static int package_id __initdata;
-	int core_id = 0;
-	int i, ret;
-
-	/*
-	 * First check for child clusters; we currently ignore any
-	 * information about the nesting of clusters and present the
-	 * scheduler with a flat list of them.
-	 */
-	i = 0;
-	do {
-		snprintf(name, sizeof(name), "cluster%d", i);
-		c = of_get_child_by_name(cluster, name);
-		if (c) {
-			leaf = false;
-			ret = parse_cluster(c, depth + 1);
-			of_node_put(c);
-			if (ret != 0)
-				return ret;
-		}
-		i++;
-	} while (c);
-
-	/* Now check for cores */
-	i = 0;
-	do {
-		snprintf(name, sizeof(name), "core%d", i);
-		c = of_get_child_by_name(cluster, name);
-		if (c) {
-			has_cores = true;
-
-			if (depth == 0) {
-				pr_err("%pOF: cpu-map children should be clusters\n",
-				       c);
-				of_node_put(c);
-				return -EINVAL;
-			}
-
-			if (leaf) {
-				ret = parse_core(c, package_id, core_id++);
-			} else {
-				pr_err("%pOF: Non-leaf cluster with core %s\n",
-				       cluster, name);
-				ret = -EINVAL;
-			}
-
-			of_node_put(c);
-			if (ret != 0)
-				return ret;
-		}
-		i++;
-	} while (c);
-
-	if (leaf && !has_cores)
-		pr_warn("%pOF: empty cluster\n", cluster);
-
-	if (leaf)
-		package_id++;
-
-	return 0;
-}
-
-static int __init parse_dt_topology(void)
-{
-	struct device_node *cn, *map;
-	int ret = 0;
-	int cpu;
-
-	cn = of_find_node_by_path("/cpus");
-	if (!cn) {
-		pr_err("No CPU information found in DT\n");
-		return 0;
-	}
-
-	/*
-	 * When topology is provided cpu-map is essentially a root
-	 * cluster with restricted subnodes.
-	 */
-	map = of_get_child_by_name(cn, "cpu-map");
-	if (!map)
-		goto out;
-
-	ret = parse_cluster(map, 0);
-	if (ret != 0)
-		goto out_map;
-
-	topology_normalize_cpu_scale();
-
-	/*
-	 * Check that all cores are in the topology; the SMP code will
-	 * only mark cores described in the DT as possible.
-	 */
-	for_each_possible_cpu(cpu)
-		if (cpu_topology[cpu].package_id == -1)
-			ret = -EINVAL;
-
-out_map:
-	of_node_put(map);
-out:
-	of_node_put(cn);
-	return ret;
-}
-
-/*
- * cpu topology table
- */
-struct cpu_topology cpu_topology[NR_CPUS];
-EXPORT_SYMBOL_GPL(cpu_topology);
-
-const struct cpumask *cpu_coregroup_mask(int cpu)
-{
-	const cpumask_t *core_mask = cpumask_of_node(cpu_to_node(cpu));
-
-	/* Find the smaller of NUMA, core or LLC siblings */
-	if (cpumask_subset(&cpu_topology[cpu].core_sibling, core_mask)) {
-		/* not numa in package, lets use the package siblings */
-		core_mask = &cpu_topology[cpu].core_sibling;
-	}
-	if (cpu_topology[cpu].llc_id != -1) {
-		if (cpumask_subset(&cpu_topology[cpu].llc_sibling, core_mask))
-			core_mask = &cpu_topology[cpu].llc_sibling;
-	}
-
-	return core_mask;
-}
-
-static void update_siblings_masks(unsigned int cpuid)
-{
-	struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
-	int cpu;
-
-	/* update core and thread sibling masks */
-	for_each_online_cpu(cpu) {
-		cpu_topo = &cpu_topology[cpu];
-
-		if (cpuid_topo->llc_id == cpu_topo->llc_id) {
-			cpumask_set_cpu(cpu, &cpuid_topo->llc_sibling);
-			cpumask_set_cpu(cpuid, &cpu_topo->llc_sibling);
-		}
-
-		if (cpuid_topo->package_id != cpu_topo->package_id)
-			continue;
-
-		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
-		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
-
-		if (cpuid_topo->core_id != cpu_topo->core_id)
-			continue;
-
-		cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
-		cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
-	}
-}
-
 void store_cpu_topology(unsigned int cpuid)
 {
 	struct cpu_topology *cpuid_topo = &cpu_topology[cpuid];
@@ -296,59 +59,19 @@ void store_cpu_topology(unsigned int cpuid)
 	update_siblings_masks(cpuid);
 }
 
-static void clear_cpu_topology(int cpu)
-{
-	struct cpu_topology *cpu_topo = &cpu_topology[cpu];
-
-	cpumask_clear(&cpu_topo->llc_sibling);
-	cpumask_set_cpu(cpu, &cpu_topo->llc_sibling);
-
-	cpumask_clear(&cpu_topo->core_sibling);
-	cpumask_set_cpu(cpu, &cpu_topo->core_sibling);
-	cpumask_clear(&cpu_topo->thread_sibling);
-	cpumask_set_cpu(cpu, &cpu_topo->thread_sibling);
-}
-
-static void __init reset_cpu_topology(void)
-{
-	unsigned int cpu;
-
-	for_each_possible_cpu(cpu) {
-		struct cpu_topology *cpu_topo = &cpu_topology[cpu];
-
-		cpu_topo->thread_id = -1;
-		cpu_topo->core_id = 0;
-		cpu_topo->package_id = -1;
-		cpu_topo->llc_id = -1;
-
-		clear_cpu_topology(cpu);
-	}
-}
-
-void remove_cpu_topology(unsigned int cpu)
-{
-	int sibling;
-
-	for_each_cpu(sibling, topology_core_cpumask(cpu))
-		cpumask_clear_cpu(cpu, topology_core_cpumask(sibling));
-	for_each_cpu(sibling, topology_sibling_cpumask(cpu))
-		cpumask_clear_cpu(cpu, topology_sibling_cpumask(sibling));
-	for_each_cpu(sibling, topology_llc_cpumask(cpu))
-		cpumask_clear_cpu(cpu, topology_llc_cpumask(sibling));
-
-	clear_cpu_topology(cpu);
-}
-
 #ifdef CONFIG_ACPI
 /*
  * Propagate the topology information of the processor_topology_node tree to the
  * cpu_topology array.
  */
-static int __init parse_acpi_topology(void)
+int __init parse_acpi_topology(void)
 {
 	bool is_threaded;
 	int cpu, topology_id;
 
+	if (acpi_disabled)
+		return 0;
+
 	is_threaded = read_cpuid_mpidr() & MPIDR_MT_BITMASK;
 
 	for_each_possible_cpu(cpu) {
@@ -384,24 +107,6 @@ static int __init parse_acpi_topology(void)
 
 	return 0;
 }
-
-#else
-static inline int __init parse_acpi_topology(void)
-{
-	return -EINVAL;
-}
 #endif
 
-void __init init_cpu_topology(void)
-{
-	reset_cpu_topology();
 
-	/*
-	 * Discard anything that was parsed if we hit an error so we
-	 * don't use partial information.
-	 */
-	if (!acpi_disabled && parse_acpi_topology())
-		reset_cpu_topology();
-	else if (of_have_populated_dt() && parse_dt_topology())
-		reset_cpu_topology();
-}
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index edfcf8d9..6cc6a860 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -6,8 +6,8 @@
  * Written by: Juri Lelli, ARM Ltd.
  */
 
-#include <linux/acpi.h>
 #include <linux/arch_topology.h>
+#include <linux/acpi.h>
 #include <linux/cpu.h>
 #include <linux/cpufreq.h>
 #include <linux/device.h>
@@ -16,6 +16,11 @@
 #include <linux/string.h>
 #include <linux/sched/topology.h>
 #include <linux/cpuset.h>
+#include <linux/cpumask.h>
+#include <linux/init.h>
+#include <linux/percpu.h>
+#include <linux/sched.h>
+#include <linux/smp.h>
 
 DEFINE_PER_CPU(unsigned long, freq_scale) = SCHED_CAPACITY_SCALE;
 
@@ -278,3 +283,294 @@ static void parsing_done_workfn(struct work_struct *work)
 #else
 core_initcall(free_raw_capacity);
 #endif
+
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+static int __init get_cpu_for_node(struct device_node *node)
+{
+	struct device_node *cpu_node;
+	int cpu;
+
+	cpu_node = of_parse_phandle(node, "cpu", 0);
+	if (!cpu_node)
+		return -1;
+
+	cpu = of_cpu_node_to_id(cpu_node);
+	if (cpu >= 0)
+		topology_parse_cpu_capacity(cpu_node, cpu);
+	else
+		pr_crit("Unable to find CPU node for %pOF\n", cpu_node);
+
+	of_node_put(cpu_node);
+	return cpu;
+}
+
+static int __init parse_core(struct device_node *core, int package_id,
+			     int core_id)
+{
+	char name[10];
+	bool leaf = true;
+	int i = 0;
+	int cpu;
+	struct device_node *t;
+
+	do {
+		snprintf(name, sizeof(name), "thread%d", i);
+		t = of_get_child_by_name(core, name);
+		if (t) {
+			leaf = false;
+			cpu = get_cpu_for_node(t);
+			if (cpu >= 0) {
+				cpu_topology[cpu].package_id = package_id;
+				cpu_topology[cpu].core_id = core_id;
+				cpu_topology[cpu].thread_id = i;
+			} else {
+				pr_err("%pOF: Can't get CPU for thread\n",
+				       t);
+				of_node_put(t);
+				return -EINVAL;
+			}
+			of_node_put(t);
+		}
+		i++;
+	} while (t);
+
+	cpu = get_cpu_for_node(core);
+	if (cpu >= 0) {
+		if (!leaf) {
+			pr_err("%pOF: Core has both threads and CPU\n",
+			       core);
+			return -EINVAL;
+		}
+
+		cpu_topology[cpu].package_id = package_id;
+		cpu_topology[cpu].core_id = core_id;
+	} else if (leaf) {
+		pr_err("%pOF: Can't get CPU for leaf core\n", core);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int __init parse_cluster(struct device_node *cluster, int depth)
+{
+	char name[10];
+	bool leaf = true;
+	bool has_cores = false;
+	struct device_node *c;
+	static int package_id __initdata;
+	int core_id = 0;
+	int i, ret;
+
+	/*
+	 * First check for child clusters; we currently ignore any
+	 * information about the nesting of clusters and present the
+	 * scheduler with a flat list of them.
+	 */
+	i = 0;
+	do {
+		snprintf(name, sizeof(name), "cluster%d", i);
+		c = of_get_child_by_name(cluster, name);
+		if (c) {
+			leaf = false;
+			ret = parse_cluster(c, depth + 1);
+			of_node_put(c);
+			if (ret != 0)
+				return ret;
+		}
+		i++;
+	} while (c);
+
+	/* Now check for cores */
+	i = 0;
+	do {
+		snprintf(name, sizeof(name), "core%d", i);
+		c = of_get_child_by_name(cluster, name);
+		if (c) {
+			has_cores = true;
+
+			if (depth == 0) {
+				pr_err("%pOF: cpu-map children should be clusters\n",
+				       c);
+				of_node_put(c);
+				return -EINVAL;
+			}
+
+			if (leaf) {
+				ret = parse_core(c, package_id, core_id++);
+			} else {
+				pr_err("%pOF: Non-leaf cluster with core %s\n",
+				       cluster, name);
+				ret = -EINVAL;
+			}
+
+			of_node_put(c);
+			if (ret != 0)
+				return ret;
+		}
+		i++;
+	} while (c);
+
+	if (leaf && !has_cores)
+		pr_warn("%pOF: empty cluster\n", cluster);
+
+	if (leaf)
+		package_id++;
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
+	/*
+	 * When topology is provided cpu-map is essentially a root
+	 * cluster with restricted subnodes.
+	 */
+	map = of_get_child_by_name(cn, "cpu-map");
+	if (!map)
+		goto out;
+
+	ret = parse_cluster(map, 0);
+	if (ret != 0)
+		goto out_map;
+
+	topology_normalize_cpu_scale();
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
+/*
+ * cpu topology table
+ */
+struct cpu_topology cpu_topology[NR_CPUS];
+EXPORT_SYMBOL_GPL(cpu_topology);
+
+const struct cpumask *cpu_coregroup_mask(int cpu)
+{
+	const cpumask_t *core_mask = cpumask_of_node(cpu_to_node(cpu));
+
+	/* Find the smaller of NUMA, core or LLC siblings */
+	if (cpumask_subset(&cpu_topology[cpu].core_sibling, core_mask)) {
+		/* not numa in package, lets use the package siblings */
+		core_mask = &cpu_topology[cpu].core_sibling;
+	}
+	if (cpu_topology[cpu].llc_id != -1) {
+		if (cpumask_subset(&cpu_topology[cpu].llc_sibling, core_mask))
+			core_mask = &cpu_topology[cpu].llc_sibling;
+	}
+
+	return core_mask;
+}
+
+void update_siblings_masks(unsigned int cpuid)
+{
+	struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
+	int cpu;
+
+	/* update core and thread sibling masks */
+	for_each_online_cpu(cpu) {
+		cpu_topo = &cpu_topology[cpu];
+
+		if (cpuid_topo->llc_id == cpu_topo->llc_id) {
+			cpumask_set_cpu(cpu, &cpuid_topo->llc_sibling);
+			cpumask_set_cpu(cpuid, &cpu_topo->llc_sibling);
+		}
+
+		if (cpuid_topo->package_id != cpu_topo->package_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
+		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
+
+		if (cpuid_topo->core_id != cpu_topo->core_id)
+			continue;
+
+		cpumask_set_cpu(cpuid, &cpu_topo->thread_sibling);
+		cpumask_set_cpu(cpu, &cpuid_topo->thread_sibling);
+	}
+}
+
+static void clear_cpu_topology(int cpu)
+{
+	struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+
+	cpumask_clear(&cpu_topo->llc_sibling);
+	cpumask_set_cpu(cpu, &cpu_topo->llc_sibling);
+
+	cpumask_clear(&cpu_topo->core_sibling);
+	cpumask_set_cpu(cpu, &cpu_topo->core_sibling);
+	cpumask_clear(&cpu_topo->thread_sibling);
+	cpumask_set_cpu(cpu, &cpu_topo->thread_sibling);
+}
+
+static void __init reset_cpu_topology(void)
+{
+	unsigned int cpu;
+
+	for_each_possible_cpu(cpu) {
+		struct cpu_topology *cpu_topo = &cpu_topology[cpu];
+
+		cpu_topo->thread_id = -1;
+		cpu_topo->core_id = 0;
+		cpu_topo->package_id = -1;
+		cpu_topo->llc_id = -1;
+
+		clear_cpu_topology(cpu);
+	}
+}
+
+void remove_cpu_topology(unsigned int cpu)
+{
+	int sibling;
+
+	for_each_cpu(sibling, topology_core_cpumask(cpu))
+		cpumask_clear_cpu(cpu, topology_core_cpumask(sibling));
+	for_each_cpu(sibling, topology_sibling_cpumask(cpu))
+		cpumask_clear_cpu(cpu, topology_sibling_cpumask(sibling));
+	for_each_cpu(sibling, topology_llc_cpumask(cpu))
+		cpumask_clear_cpu(cpu, topology_llc_cpumask(sibling));
+
+	clear_cpu_topology(cpu);
+}
+
+__weak int __init parse_acpi_topology(void)
+{
+	return 0;
+}
+
+void __init init_cpu_topology(void)
+{
+	reset_cpu_topology();
+
+	/*
+	 * Discard anything that was parsed if we hit an error so we
+	 * don't use partial information.
+	 */
+	if (parse_acpi_topology())
+		reset_cpu_topology();
+	else if (of_have_populated_dt() && parse_dt_topology())
+		reset_cpu_topology();
+}
+#endif
diff --git a/drivers/base/topology.c b/drivers/base/topology.c
index 5fd9f167..c17d5434 100644
--- a/drivers/base/topology.c
+++ b/drivers/base/topology.c
@@ -8,6 +8,7 @@
  *
  * All rights reserved.
  */
+#include <linux/arch_topology.h>
 #include <linux/mm.h>
 #include <linux/cpu.h>
 #include <linux/module.h>
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index d9bdc1a7..d4e76e0a 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -33,4 +33,32 @@ unsigned long topology_get_freq_scale(int cpu)
 	return per_cpu(freq_scale, cpu);
 }
 
+struct cpu_topology {
+	int thread_id;
+	int core_id;
+	int package_id;
+	int llc_id;
+	cpumask_t thread_sibling;
+	cpumask_t core_sibling;
+	cpumask_t llc_sibling;
+};
+
+#ifdef CONFIG_GENERIC_ARCH_TOPOLOGY
+extern struct cpu_topology cpu_topology[NR_CPUS];
+
+#define topology_physical_package_id(cpu)	(cpu_topology[cpu].package_id)
+#define topology_core_id(cpu)		(cpu_topology[cpu].core_id)
+#define topology_core_cpumask(cpu)	(&cpu_topology[cpu].core_sibling)
+#define topology_sibling_cpumask(cpu)	(&cpu_topology[cpu].thread_sibling)
+#define topology_llc_cpumask(cpu)	(&cpu_topology[cpu].llc_sibling)
+void init_cpu_topology(void);
+void store_cpu_topology(unsigned int cpuid);
+const struct cpumask *cpu_coregroup_mask(int cpu);
+#endif
+
+#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
+void update_siblings_masks(unsigned int cpu);
+#endif
+void remove_cpu_topology(unsigned int cpuid);
+
 #endif /* _LINUX_ARCH_TOPOLOGY_H_ */
-- 
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
