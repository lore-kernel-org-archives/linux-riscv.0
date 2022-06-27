Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85B4C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 16:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R15p9Hhed/e0Gw3SbsZkiLiHszIVSWpCsW7Zz5X7KXM=; b=Gv6u7f6PNAMS/f
	XXYApNi4z2+ZA16wxWAyZUl8z2U+XeMvvMBef8NV6v31arKIESBbVTdrLm6hi/verEn0KHBuogxLm
	cqz+adBlYekquYBKfsRI7Qso+j64ZbhGh76rY1M2r4xk5kAN6f7Mpc6JUpze8qTcZcgAsVGWTKflK
	rw/CCGIiaFl1lSfUU8JGuNW3rTzaYSf0M5S3GnbjOn57WxSON/D/Pv63h/696YSjDPLbFEI61GYYh
	0jh4yl2nX90mpSYZwkqBIBfcamI+DyRtwgOLUsNgcC7gwBD4o7SkL3Ew0Li+htIRf52uDCRYVv9am
	Db0SrmKQ8XwMhgF6DjfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5s2N-001xM5-Hv; Mon, 27 Jun 2022 16:56:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5rxS-001uH1-HD; Mon, 27 Jun 2022 16:51:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1434175A;
	Mon, 27 Jun 2022 09:51:29 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A50543F792;
	Mon, 27 Jun 2022 09:51:27 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: [PATCH v5 16/19] arch_topology: Limit span of cpu_clustergroup_mask()
Date: Mon, 27 Jun 2022 17:50:44 +0100
Message-Id: <20220627165047.336669-17-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627165047.336669-1-sudeep.holla@arm.com>
References: <20220627165047.336669-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_095130_679224_11577F06 
X-CRM114-Status: GOOD (  11.65  )
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

Link: https://lore.kernel.org/r/20220621192034.3332546-18-sudeep.holla@arm.com
Cc: Darren Hart <darren@os.amperecomputing.com>
Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/arch_topology.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 46fa1b70b02b..277b65cf3306 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -686,6 +686,14 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
 
 const struct cpumask *cpu_clustergroup_mask(int cpu)
 {
+	/*
+	 * Forbid cpu_clustergroup_mask() to span more or the same CPUs as
+	 * cpu_coregroup_mask().
+	 */
+	if (cpumask_subset(cpu_coregroup_mask(cpu),
+			   &cpu_topology[cpu].cluster_sibling))
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
