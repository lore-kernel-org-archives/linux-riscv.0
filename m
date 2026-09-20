Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A06C982EB
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 03:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6ScEhgMkzWzn5akbVtGnR4Ov0QjnodwSPWrFbKE/Co=; b=ARPQJJAZvyL5Yv
	sc7o2Te4rB7I0niu/+jOQzFxMQGRgQ0Z9tzDjjDj44wcNAe5yM6FNUcjTbvbC2efVkGcb3XuA0izl
	Ani2GCb95/HLL9wJHXwXR9JTzVx+DR+y3x4Xddhj5b/8+yImM4wrOwVVdvpI/ecgxnlud9ltwKCX/
	B2BIGX9AXAksHHRvdEQ+f9Eg1f6hpcu2GXRo3rQXB8e7RjlxcTOG+wlXs4v2JbE/OYZ0OU1YNw2m3
	7kLxYrpS/1c8BgWf94r4miY1QWEwlX6NCSVsdaRzqQ217fEtJHf5DzMoch9exsEk6Wntatx8JI4rN
	qRiHCrdwhEvBI9Rd96qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884f-0000000Gn4U-3M8W;
	Sun, 20 Sep 2026 03:18:41 +0000
Received: from out-31.mta0.migadu.com ([2001:41d0:1004:224b::1f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x884b-0000000Gn2n-3Ynn
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 03:18:39 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3W3O8094sWvs6XA3nq+JIrIy9/nDGCyklWmUxuJkhHE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874315; v=1; x=1790479115;
 b=qgs0b/yBrERYTjY5M8aM853MXHKXuMqTl3dC3nGJMra6awJnuuNkeTJrBFzelN51nvSJTBHQ
 SfWWd0IcxpVepjPqqp7TQ0SWF3DZPpWcvVKL2egnR6cK454XBInldUz8OEcljDRkRrcaxvussnG
 1jXddu+UWhjRUMr1Ceabtk64=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 4239474afc06c193;
	Sun, 20 Sep 2026 03:18:35 +0000
X-Mizu-Trace-ID: 4239474afc06c193
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Sun, 20 Sep 2026 11:18:02 +0800
Subject: [PATCH RFC 1/3] arch_topology: Add a die level to CPU topology
MIME-Version: 1.0
Message-Id: <20260920-riscv-die-topology-rfc-v1-1-071c0bf61d5f@linux.dev>
References: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
In-Reply-To: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3769;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=3W3O8094sWvs6XA3nq+JIrIy9/nDGCyklWmUxuJkhHE=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnrA+oZbvrfOL/008GwqU1e10rnnEsruPKnx6tZjXmD7
 9yzsq83d5SyMIhxMciKKbJ0P+DZVuATZVsgUOgLM4eVCWwIF6cATGSDLyPDV4f1J8QTD50JTFnE
 Pbeoz4OnaDZT4+/5xVPzOcQUDz/nY2SYWXIuevPUK6q3tHP+mr9bIRFpt9jxzaX2FT9tmBn4Luj
 xAgA=
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_201838_046596_3B42424E 
X-CRM114-Status: GOOD (  12.38  )
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

The generic topology model records packages and clusters but has no
representation for a die between them. Systems with multiple dies in one
package must therefore either report each die as a package or flatten
clusters across all dies. Both choices lose part of the physical hierarchy.

Add a die identifier and sibling mask between the package and cluster
levels. Initialize the identifier to -1 and only build die sibling masks
when firmware supplied a valid identifier. CPU topology paths without die
information, including the current ACPI parser and the fallback topology,
therefore keep the die unknown instead of inventing die 0.

Scope cluster sibling matching to a die so each die can number its
clusters independently, and maintain the new mask across CPU hotplug.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/base/arch_topology.c  | 20 +++++++++++++++++---
 include/linux/arch_topology.h |  2 ++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a3..ee82827be3351 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -766,6 +766,14 @@ void update_siblings_masks(unsigned int cpuid)
 		cpumask_set_cpu(cpuid, &cpu_topo->core_sibling);
 		cpumask_set_cpu(cpu, &cpuid_topo->core_sibling);
 
+		if (cpuid_topo->die_id != cpu_topo->die_id)
+			continue;
+
+		if (cpuid_topo->die_id >= 0) {
+			cpumask_set_cpu(cpu, &cpuid_topo->die_sibling);
+			cpumask_set_cpu(cpuid, &cpu_topo->die_sibling);
+		}
+
 		if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
 			continue;
 
@@ -792,6 +800,9 @@ static void clear_cpu_topology(int cpu)
 	cpumask_clear(&cpu_topo->cluster_sibling);
 	cpumask_set_cpu(cpu, &cpu_topo->cluster_sibling);
 
+	cpumask_clear(&cpu_topo->die_sibling);
+	cpumask_set_cpu(cpu, &cpu_topo->die_sibling);
+
 	cpumask_clear(&cpu_topo->core_sibling);
 	cpumask_set_cpu(cpu, &cpu_topo->core_sibling);
 	cpumask_clear(&cpu_topo->thread_sibling);
@@ -808,6 +819,7 @@ void __init reset_cpu_topology(void)
 		cpu_topo->thread_id = -1;
 		cpu_topo->core_id = -1;
 		cpu_topo->cluster_id = -1;
+		cpu_topo->die_id = -1;
 		cpu_topo->package_id = -1;
 
 		clear_cpu_topology(cpu);
@@ -824,6 +836,8 @@ void remove_cpu_topology(unsigned int cpu)
 		cpumask_clear_cpu(cpu, topology_sibling_cpumask(sibling));
 	for_each_cpu(sibling, topology_cluster_cpumask(cpu))
 		cpumask_clear_cpu(cpu, topology_cluster_cpumask(sibling));
+	for_each_cpu(sibling, &cpu_topology[cpu].die_sibling)
+		cpumask_clear_cpu(cpu, &cpu_topology[sibling].die_sibling);
 	for_each_cpu(sibling, topology_llc_cpumask(cpu))
 		cpumask_clear_cpu(cpu, topology_llc_cpumask(sibling));
 
@@ -969,9 +983,9 @@ void store_cpu_topology(unsigned int cpuid)
 	cpuid_topo->core_id = cpuid;
 	cpuid_topo->package_id = cpu_to_node(cpuid);
 
-	pr_debug("CPU%u: package %d core %d thread %d\n",
-		 cpuid, cpuid_topo->package_id, cpuid_topo->core_id,
-		 cpuid_topo->thread_id);
+	pr_debug("CPU%u: package %d die %d core %d thread %d\n",
+		 cpuid, cpuid_topo->package_id, cpuid_topo->die_id,
+		 cpuid_topo->core_id, cpuid_topo->thread_id);
 
 topology_populated:
 	update_siblings_masks(cpuid);
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f969..2a5591bb95075 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -63,10 +63,12 @@ struct cpu_topology {
 	int thread_id;
 	int core_id;
 	int cluster_id;
+	int die_id;
 	int package_id;
 	cpumask_t thread_sibling;
 	cpumask_t core_sibling;
 	cpumask_t cluster_sibling;
+	cpumask_t die_sibling;
 	cpumask_t llc_sibling;
 };
 

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
