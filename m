Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA2EC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBSBHNe/pSpRnwY3GQ1kd/MH5KdUgrY12Atyb5g9vws=; b=VBi+OQhgLDnXYv
	N5GGGyl933dNT27RLJRlqVjMcvL/QwmVCXHRIQtS8wHMXFS1QrX8SEKj8LSWCzlsx2vC6F75dV4TI
	hTVi6+ecdiJH3LTpMQJR37wH21iWckLdVjWk5/5RbOFL9FekDh80n2F0kQWZjtohwvI01tDlSKLKL
	Vj1qI3RwzO73B4Gks1l4K4sa1DH6g2lVX40uUHI99fbYTwaCjeDs1NVa+3O8vjvSks8TnKcGUSff5
	IbOuAqhUKAp4Z5fYA1RwNdlSUViXr6YDUbyOjCWbLRj0jkZGhExlPhQA8f65lPoQVl5OKkZxH5OMj
	mwaX/Dt91+y1O2i/Na4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntmF6-00ALNO-44; Wed, 25 May 2022 08:19:44 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntmAS-00AIWC-FT; Wed, 25 May 2022 08:14:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5B091FB;
 Wed, 25 May 2022 01:14:55 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0645C3F73D;
 Wed, 25 May 2022 01:14:53 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atishp@atishpatra.org>,
 Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v3 11/16] arch_topology: Check for non-negative value rather
 than -1 for IDs validity
Date: Wed, 25 May 2022 09:14:11 +0100
Message-Id: <20220525081416.3306043-12-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525081416.3306043-11-sudeep.holla@arm.com>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <20220525081416.3306043-2-sudeep.holla@arm.com>
 <20220525081416.3306043-3-sudeep.holla@arm.com>
 <20220525081416.3306043-4-sudeep.holla@arm.com>
 <20220525081416.3306043-5-sudeep.holla@arm.com>
 <20220525081416.3306043-6-sudeep.holla@arm.com>
 <20220525081416.3306043-7-sudeep.holla@arm.com>
 <20220525081416.3306043-8-sudeep.holla@arm.com>
 <20220525081416.3306043-9-sudeep.holla@arm.com>
 <20220525081416.3306043-10-sudeep.holla@arm.com>
 <20220525081416.3306043-11-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_011456_586870_79263C1E 
X-CRM114-Status: GOOD (  11.25  )
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
 drivers/base/arch_topology.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 59dc2c80c439..f73a5e669e42 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -637,7 +637,7 @@ static int __init parse_dt_topology(void)
 	 * only mark cores described in the DT as possible.
 	 */
 	for_each_possible_cpu(cpu)
-		if (cpu_topology[cpu].package_id == -1)
+		if (cpu_topology[cpu].package_id < 0)
 			ret = -EINVAL;
 
 out_map:
@@ -709,7 +709,7 @@ void update_siblings_masks(unsigned int cpuid)
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
