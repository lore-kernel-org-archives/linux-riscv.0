Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F178C43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 19:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uOZtG+A13AiCuOdw6RnH/tOwPA2rZzsqwd5l1gNbeH8=; b=G+QATHcl09x8M9
	cMkMb/4jcCplDuVN0yRY5Bylx2tso3XJ7K8iLdIkLnSrrResmZT1I+pXBiop5ujotoYnh2YuHMyIR
	VjR576iHRhw3OVy3rHL8JC+yPvNr7PobMPQ4fi0OFq2qxde9wLQXsPMUW2c8T83B4ay0z5Vy2w4eG
	r2kpcmm7t1axjeeTRCOqqG3T+TBmrs4Rb/C0OEXT656clUJNPtfRUL6RNVF14kd7N6ZWIqFKbdCoa
	Lc+aWTuffuSdugPoJXk5l2y+B2e+/DwRCfvibfbKrWisDtrHD2M8e91okEN11uHf70TEOnZe9oPbN
	UcIe1mKBIvIiTp7kuXwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jb8-006tp5-6c; Tue, 21 Jun 2022 19:31:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jRC-006oA4-3C; Tue, 21 Jun 2022 19:21:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC6E8165C;
	Tue, 21 Jun 2022 12:21:21 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D18AE3F792;
	Tue, 21 Jun 2022 12:21:19 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Atish Patra <atishp@atishpatra.org>,
	Atish Patra <atishp@rivosinc.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>,
	Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Darren Hart <darren@os.amperecomputing.com>
Subject: [PATCH v4 17/20] arch_topology: Limit span of cpu_clustergroup_mask()
Date: Tue, 21 Jun 2022 20:20:31 +0100
Message-Id: <20220621192034.3332546-18-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621192034.3332546-1-sudeep.holla@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_122122_263423_64C4440F 
X-CRM114-Status: GOOD (  11.26  )
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

From: Ionela Voinescu <ionela.voinescu@arm.com>

Currently the cluster identifier is not set on DT based platforms.
The reset or default value is -1 for all the CPUs. Once we assign the
cluster identifier values correctly, the cluster_sibling mask will be
populated and returned by cpu_clustergroup_mask() to contribute in the
creation of the CLS scheduling domain level, if SCHED_CLUSTER is
enabled.

To avoid topologies that will result in questionable or incorrect
scheduling domains, impose restrictions regarding the span of clusters,
as presented to scheduling domains building code: cluster_sibling should
not span more or the same CPUs as cpu_coregroup_mask().

This is needed in order to obtain a strict separation between the MC and
CLS levels, and maintain the same domains for existing platforms in
the presence of CONFIG_SCHED_CLUSTER, where the new cluster information
is redundant and irrelevant for the scheduler.

While previously the scheduling domain builder code would have removed MC
as redundant and kept CLS if SCHED_CLUSTER was enabled and the
cpu_coregroup_mask() and cpu_clustergroup_mask() spanned the same CPUs,
now CLS will be removed and MC kept.

Cc: Darren Hart <darren@os.amperecomputing.com>
Signed-off-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/arch_topology.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 42448a5a9412..39be5dbaf4da 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -675,6 +675,14 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
 
 const struct cpumask *cpu_clustergroup_mask(int cpu)
 {
+	/*
+	 * Forbid cpu_clustergroup_mask() to span more or the same CPUs as
+	 * cpu_coregroup_mask().
+	 */
+	if (cpumask_subset(cpu_coregroup_mask(cpu),
+			  &cpu_topology[cpu].cluster_sibling))
+		return get_cpu_mask(cpu);
+
 	return &cpu_topology[cpu].cluster_sibling;
 }
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
