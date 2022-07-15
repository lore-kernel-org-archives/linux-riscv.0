Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E0A7C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 10:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W39YmLPlNgDLNVo+/FGGq46PQu5W/7GEjyDeYhkTcAs=; b=WlxGTbjiblYEyW
	GlCaxXw0Usd+uajvIg7+r4B5jsEDwQAaFbieit4gfawdqEpvtNhshT7/YYIBBnZdmFCxKQ0FiYY9k
	HieYoyAOA08FvesRt3jd4l1t0J+zQzAXx3VoE2W4sFtKgIAkcJkrwIrqExaVbWDQ2SMgvLI07diGv
	WTnB0YFiMdLjFer3wRBgFg1irmkbguhfeikbLsmxYiIRYLmgr/phEgf6s01Ds29yigjAf2LTYaofy
	u3H0htxjEpEGDgktVtxHYcUpwn8HLXJOtbIoyq9IvTLGvK7VWDJD+7iBx6Ih8PvHnSdrLFnAaIIV4
	Bf7y5ou248/sXWixqt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCIX7-006KrY-0S; Fri, 15 Jul 2022 10:26:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCIWm-006KmE-Nb; Fri, 15 Jul 2022 10:26:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB4281D13;
	Fri, 15 Jul 2022 03:26:21 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1E0403F792;
	Fri, 15 Jul 2022 03:26:20 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH -next v2 2/2] arch_topology: Fix cache attributes detection in the CPU hotplug path
Date: Fri, 15 Jul 2022 11:26:09 +0100
Message-Id: <20220715102609.2160689-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220715102609.2160689-1-sudeep.holla@arm.com>
References: <20220715102609.2160689-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_032632_838518_AD40FFDE 
X-CRM114-Status: GOOD (  13.15  )
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

init_cpu_topology() is called only once at the boot and all the cache
attributes are detected early for all the possible CPUs. However when
the CPUs are hotplugged out, the cacheinfo gets removed. While the
attributes are added back when the CPUs are hotplugged back in as part
of CPU hotplug state machine, it ends up called quite late after the
update_siblings_masks() are called in the secondary_start_kernel()
resulting in wrong llc_sibling_masks.

Move the call to detect_cache_attributes() inside update_siblings_masks()
to ensure the cacheinfo is updated before the LLC sibling masks are
updated. This will fix the incorrect LLC sibling masks generated when
the CPUs are hotplugged out and hotplugged back in again.

Reported-by: Ionela Voinescu <ionela.voinescu@arm.com>
Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/arch_topology.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

v1->v2:
	- No change in this patch, but 1/2 was added to fix possible
	  bug "sleeping in the atomic context" with this patch.
	- Added all the received tags

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 441e14ac33a4..0424b59b695e 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -732,7 +732,11 @@ const struct cpumask *cpu_clustergroup_mask(int cpu)
 void update_siblings_masks(unsigned int cpuid)
 {
 	struct cpu_topology *cpu_topo, *cpuid_topo = &cpu_topology[cpuid];
-	int cpu;
+	int cpu, ret;
+
+	ret = detect_cache_attributes(cpuid);
+	if (ret)
+		pr_info("Early cacheinfo failed, ret = %d\n", ret);

 	/* update core and thread sibling masks */
 	for_each_online_cpu(cpu) {
@@ -821,7 +825,7 @@ __weak int __init parse_acpi_topology(void)
 #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 void __init init_cpu_topology(void)
 {
-	int ret, cpu;
+	int ret;

 	reset_cpu_topology();
 	ret = parse_acpi_topology();
@@ -836,13 +840,5 @@ void __init init_cpu_topology(void)
 		reset_cpu_topology();
 		return;
 	}
-
-	for_each_possible_cpu(cpu) {
-		ret = detect_cache_attributes(cpu);
-		if (ret) {
-			pr_info("Early cacheinfo failed, ret = %d\n", ret);
-			break;
-		}
-	}
 }
 #endif
--
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
