Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640DDC43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 10:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7cBXQT6PwY6U8QLDIfQtKOsgP7h4MclK97WBCPWuZc=; b=1EleK3mJ6fiWGP
	YY8uw9++pZiiYZ8qQNBPcSoLRcGvq09xpMjbQ0QNDF7pqKuPdv3Cwz65/gm+StAmfRU72qeEgNa1I
	s7pcARW8kmrBF7Zhl0LJsDTDpR7vltIPHFQTCGeTEWbYbSbe/dCNm6hVTpRG+5UKnQDs7h8RwcnQ0
	a1xXQ8gh1lPkZfhheSRTMD5mUCwJfQPVPIamSzDvxEZz39A85+YSWhFFJFYv8gRZhtsZQ1APG9kjS
	83mjSMGFTWpmLIxYMFkjy9YO0rgT+3sOlfRuaglveRI0m5ey/YoU6hrrIw4btH7M7eaTw+TmsHplo
	dIfXT0UIAC+xuePVjijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JEr-006wtf-NH; Mon, 04 Jul 2022 10:23:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J84-006rcg-Ku; Mon, 04 Jul 2022 10:16:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17571480;
	Mon,  4 Jul 2022 03:16:31 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E16A73F792;
	Mon,  4 Jul 2022 03:16:29 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Qing Wang <wangqing@vivo.com>,
	Rob Herring <robh+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Ionela Voinescu <ionela.voinescu@arm.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v6 08/21] cacheinfo: Align checks in cache_shared_cpu_map_{setup,remove} for readability
Date: Mon,  4 Jul 2022 11:15:52 +0100
Message-Id: <20220704101605.1318280-9-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704101605.1318280-1-sudeep.holla@arm.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031632_761758_138C9EA8 
X-CRM114-Status: GOOD (  10.21  )
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

The checks to skip the CPU itself or no cacheinfo case are implemented
bit differently though the effect is exactly same. Just align the
implementation in both cache_shared_cpu_map_{setup,remove} just for
improved readability. No functional change.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index e331b399adeb..65d566ff24c4 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -279,6 +279,7 @@ static int cache_shared_cpu_map_setup(unsigned int cpu)
 
 			if (i == cpu || !sib_cpu_ci->info_list)
 				continue;/* skip if itself or no cacheinfo */
+
 			sib_leaf = per_cpu_cacheinfo_idx(i, index);
 			if (cache_leaves_are_shared(this_leaf, sib_leaf)) {
 				cpumask_set_cpu(cpu, &sib_leaf->shared_cpu_map);
@@ -301,14 +302,11 @@ static void cache_shared_cpu_map_remove(unsigned int cpu)
 	for (index = 0; index < cache_leaves(cpu); index++) {
 		this_leaf = per_cpu_cacheinfo_idx(cpu, index);
 		for_each_cpu(sibling, &this_leaf->shared_cpu_map) {
-			struct cpu_cacheinfo *sib_cpu_ci;
-
-			if (sibling == cpu) /* skip itself */
-				continue;
+			struct cpu_cacheinfo *sib_cpu_ci =
+						get_cpu_cacheinfo(sibling);
 
-			sib_cpu_ci = get_cpu_cacheinfo(sibling);
-			if (!sib_cpu_ci->info_list)
-				continue;
+			if (sibling == cpu || !sib_cpu_ci->info_list)
+				continue;/* skip if itself or no cacheinfo */
 
 			sib_leaf = per_cpu_cacheinfo_idx(sibling, index);
 			cpumask_clear_cpu(cpu, &sib_leaf->shared_cpu_map);
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
