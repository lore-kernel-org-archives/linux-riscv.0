Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F2CBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUhqRTGhQ7NsbG1D9Z5A2XPchrH4umYnKcb7mtfiMRk=; b=NZEO3KwO8qRXVq
	oG/q6+9t6jVDFk42uH64e+mNTdChW6henfb5A2GcQDsWuU6eRALdQa2EG93NQzmcKybnqvoPO0vDn
	rtC4aNUGeJLaxc5IDqkhT/KoMrgvdY0l6TzcdZzARlGDz5nY0LhNofr5n94sFELHiI327Bls9Bun5
	K9cynxvyJDRw15n81CKVvZdntaMktkU9wxx3uWSrNjKFKloiC89Od89nSD2kaX2whnLbLFI4JdhRD
	yXkNw7Cgxz6e89Eofqj4oirpyZA4vOHSwKkZH9hP0WwiBxBDIkporAxqEl+qsGQ+fgpSCb6HDYkZJ
	wpl7kLAevBGRz+15ZaeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrG5u-001404-W9; Wed, 18 May 2022 09:35:51 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrG4B-0012aw-AM; Wed, 18 May 2022 09:34:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 990A51063;
 Wed, 18 May 2022 02:34:02 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 59D823F66F;
 Wed, 18 May 2022 02:34:00 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atishp@atishpatra.org>,
	linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v2 5/8] arch_topology: Check for non-negative value rather
 than -1 for IDs validity
Date: Wed, 18 May 2022 10:33:22 +0100
Message-Id: <20220518093325.2070336-6-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220518093325.2070336-1-sudeep.holla@arm.com>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_023403_468756_550B468F 
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

Instead of just comparing the cpu topology IDs with -1 to check their
validity, improve that by checking for a valid non-negative value.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/arch_topology.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 77aab5fea46b..be99a78f5b31 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -662,7 +662,7 @@ static int __init parse_dt_topology(void)
 	 * only mark cores described in the DT as possible.
 	 */
 	for_each_possible_cpu(cpu)
-		if (cpu_topology[cpu].package_id == -1)
+		if (cpu_topology[cpu].package_id < 0)
 			ret = -EINVAL;
 
 out_map:
@@ -688,7 +688,7 @@ const struct cpumask *cpu_coregroup_mask(int cpu)
 		/* not numa in package, lets use the package siblings */
 		core_mask = &cpu_topology[cpu].core_sibling;
 	}
-	if (cpu_topology[cpu].llc_id != -1) {
+	if (cpu_topology[cpu].llc_id >= 0) {
 		if (cpumask_subset(&cpu_topology[cpu].llc_sibling, core_mask))
 			core_mask = &cpu_topology[cpu].llc_sibling;
 	}
@@ -719,7 +719,8 @@ void update_siblings_masks(unsigned int cpuid)
 	for_each_online_cpu(cpu) {
 		cpu_topo = &cpu_topology[cpu];
 
-		if (cpu_topo->llc_id != -1 && cpuid_topo->llc_id == cpu_topo->llc_id) {
+		if (cpu_topo->llc_id >= 0 &&
+		    cpuid_topo->llc_id == cpu_topo->llc_id) {
 			cpumask_set_cpu(cpu, &cpuid_topo->llc_sibling);
 			cpumask_set_cpu(cpuid, &cpu_topo->llc_sibling);
 		}
@@ -733,7 +734,7 @@ void update_siblings_masks(unsigned int cpuid)
 		if (cpuid_topo->cluster_id != cpu_topo->cluster_id)
 			continue;
 
-		if (cpuid_topo->cluster_id != -1) {
+		if (cpuid_topo->cluster_id >= 0) {
 			cpumask_set_cpu(cpu, &cpuid_topo->cluster_sibling);
 			cpumask_set_cpu(cpuid, &cpu_topo->cluster_sibling);
 		}
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
