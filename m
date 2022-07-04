Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F95C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 10:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQoLtihv5JeoPlB881rnacOC+Ruq8Jz75vKkZW7UFeo=; b=lqixYPk+9/yECh
	SdNCGfwI40Xg7Kils3iVpQHV6bmZvKoMTOf4WT2gBdCpqodvYGP7cgMJaNQfBLRZjWqBEc/Jk+NGJ
	AIK1NV5OZNtLPax8g/mkq9ir7Ho0knPubnS8AHLoPIPBhYSmaLSGxCddGrMVrfCIAyDbABrGyTRrY
	2qNpXgNuAbOb4Mg65rCic71JXR8MC6GhNHxDjDo6bBUH5tI+cm654jL6cCNmfhRx3rMdOel5L7vhf
	0MwTGu2tCph5TeZdjtTf4Gb4ayu5WHpy9gYMzO+VfgpzUusxvzLzbgpAmSLJ9fUEzRvigUA571zoF
	Hwlii5TFMporR3fdKUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JDf-006vj5-Cg; Mon, 04 Jul 2022 10:22:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J7y-006rcg-55; Mon, 04 Jul 2022 10:16:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D243414BF;
	Mon,  4 Jul 2022 03:16:23 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A64EA3F792;
	Mon,  4 Jul 2022 03:16:21 -0700 (PDT)
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
	linux-riscv@lists.infradead.org,
	Gavin Shan <gshan@redhat.com>
Subject: [PATCH v6 04/21] cacheinfo: Move cache_leaves_are_shared out of CONFIG_OF
Date: Mon,  4 Jul 2022 11:15:48 +0100
Message-Id: <20220704101605.1318280-5-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704101605.1318280-1-sudeep.holla@arm.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031626_300436_9FAA4936 
X-CRM114-Status: GOOD (  14.50  )
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

cache_leaves_are_shared is already used even with ACPI and PPTT. It
checks if the cache leaves are the shared based on fw_token pointer.
However it is defined conditionally only if CONFIG_OF is enabled which
is wrong.

Move the function cache_leaves_are_shared out of CONFIG_OF and keep it
generic. It also handles the case where both OF and ACPI is not defined.

Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index e13ef41763e4..2cea9201f31c 100644
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
+	if (!(IS_ENABLED(CONFIG_OF) || IS_ENABLED(CONFIG_ACPI)))
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
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
