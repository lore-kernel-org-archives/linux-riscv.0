Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80BEC43334
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jun 2022 19:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AB+CJCeIf70hA2p/pMjyHgOjl/tv0ZrY6cLstxDB0vM=; b=WA73WVOI5S1BvN
	ySbHKvW1NQbZoILdNEJh/wDgWXFgyU0FP6Mvc/VHCz01TnyAengMCoPfbIwTxbgf5AVcMBGhxxAPv
	jjKUfpsY/CVg3OJ1WPzEwSxlrECH0coA4MH8qFqk5UO/jvxdrHiTdfHX2NAQjCgJG74C3DyOCSI0W
	DPsiBV28h0lIPlkGKaeP8/gOV9U99OH/9DprOKcxseCnj1tNuWIBNkf5oTQrW+PR7YUAorVcsefBn
	8Ji/DkZzIvv7ShL6bIQkzUq590F71wShplJrVQOsRX5BQbBjdRzeFFFUMFCKFIXr1paHqSbJrJyeD
	n+WMPXve9PM04RSSmyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jb1-006tmG-53; Tue, 21 Jun 2022 19:31:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3jRC-006oCT-89; Tue, 21 Jun 2022 19:21:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C371E1688;
	Tue, 21 Jun 2022 12:21:19 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CCC8B3F792;
	Tue, 21 Jun 2022 12:21:17 -0700 (PDT)
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
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 16/20] arch_topology: Drop unnecessary check for uninitialised package_id
Date: Tue, 21 Jun 2022 20:20:30 +0100
Message-Id: <20220621192034.3332546-17-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220621192034.3332546-1-sudeep.holla@arm.com>
References: <20220621192034.3332546-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_122122_396785_2AE309DE 
X-CRM114-Status: GOOD (  11.11  )
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

With the support of socket node parsing from the device tree and
assigning 0 as package_id in absence of socket nodes, there is no need
to check for invalid package_id. It is always initialised to 0 or values
from the device tree socket nodes.

Just drop that now redundant check for uninitialised package_id.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/arch_topology.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 46fa1b70b02b..42448a5a9412 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -611,7 +611,6 @@ static int __init parse_dt_topology(void)
 {
 	struct device_node *cn, *map;
 	int ret = 0;
-	int cpu;
 
 	cn = of_find_node_by_path("/cpus");
 	if (!cn) {
@@ -633,16 +632,6 @@ static int __init parse_dt_topology(void)
 
 	topology_normalize_cpu_scale();
 
-	/*
-	 * Check that all cores are in the topology; the SMP code will
-	 * only mark cores described in the DT as possible.
-	 */
-	for_each_possible_cpu(cpu)
-		if (cpu_topology[cpu].package_id < 0) {
-			ret = -EINVAL;
-			break;
-		}
-
 out_map:
 	of_node_put(map);
 out:
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
