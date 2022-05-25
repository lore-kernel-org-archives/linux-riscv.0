Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B025FC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 08:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y9piTPGqTtibr6hlZrWNa8aQlieSUtQwU6X2T0jJzrM=; b=d76yzJ91uFpquF
	AFRQI2wE5mVM2q7JkXxTRuNTfeW+cPWpzPCJ2DTE3j+MU6cF4QKqINPs2HPhJBIXJ+IuWSO4uVWMz
	td82nxGr+glb1CRSWyWJ1a1PGGMgO0kRRmh/LWaxLuV/SoIez26BUJ2QKf3bbTrk//mWm8EzAtz3Q
	GMHlOGK98mxWdK1ahhi4WXpjo3LNorqTPgxgiD7AZAzQXSq2RKU28Bl23m/9oEpxcgzRjVdAs7ZaC
	n5HNx7LySI8NS6JalCo52XiHcK22vIjmIKQFhqUzhz3ann4LfmTidgh1BZ7SyMq+8uKlA3stnWLfx
	acg1kbrfnQuciPYs5uAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntmBA-00AIuG-4a; Wed, 25 May 2022 08:15:40 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntmAB-00AIOz-HA; Wed, 25 May 2022 08:14:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 225A51FB;
 Wed, 25 May 2022 01:14:38 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 474293F73D;
 Wed, 25 May 2022 01:14:36 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atishp@atishpatra.org>,
 Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 03/16] cacheinfo: Move cache_leaves_are_shared out of
 CONFIG_OF
Date: Wed, 25 May 2022 09:14:03 +0100
Message-Id: <20220525081416.3306043-4-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220525081416.3306043-3-sudeep.holla@arm.com>
References: <20220525081416.3306043-1-sudeep.holla@arm.com>
 <20220525081416.3306043-2-sudeep.holla@arm.com>
 <20220525081416.3306043-3-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_011439_656902_65906605 
X-CRM114-Status: GOOD (  14.30  )
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

cache_leaves_are_shared is already used even with ACPI and PPTT. It checks
if the cache leaves are the shared based on fw_token pointer. However it is
defined conditionally only if CONFIG_OF is enabled which is wrong.

Move the function cache_leaves_are_shared out of CONFIG_OF and keep it
generic. It also handles the case where both OF and ACPI is not defined.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index c4547d8ac6f3..417e1ebf5525 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -33,13 +33,21 @@ struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu)
 	return ci_cacheinfo(cpu);
 }
 
-#ifdef CONFIG_OF
 static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
 					   struct cacheinfo *sib_leaf)
 {
+	/*
+	 * For non DT/ACPI systems, assume unique level 1 caches,
+	 * system-wide shared caches for all other levels. This will be used
+	 * only if arch specific code has not populated shared_cpu_map
+	 */
+	if (!IS_ENABLED(CONFIG_OF) && !(IS_ENABLED(CONFIG_ACPI)))
+		return !(this_leaf->level == 1);
+
 	return sib_leaf->fw_token == this_leaf->fw_token;
 }
 
+#ifdef CONFIG_OF
 /* OF properties to query for a given cache type */
 struct cache_type_info {
 	const char *size_prop;
@@ -193,16 +201,6 @@ static int cache_setup_of_node(unsigned int cpu)
 }
 #else
 static inline int cache_setup_of_node(unsigned int cpu) { return 0; }
-static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
-					   struct cacheinfo *sib_leaf)
-{
-	/*
-	 * For non-DT/ACPI systems, assume unique level 1 caches, system-wide
-	 * shared caches for all other levels. This will be used only if
-	 * arch specific code has not populated shared_cpu_map
-	 */
-	return !(this_leaf->level == 1);
-}
 #endif
 
 int __weak cache_setup_acpi(unsigned int cpu)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
