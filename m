Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13076C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTdlprsabYD+3nq7qoz/Vj56BpFluSpKg6Wmh6N7ZwI=; b=Waw3KmrhJJ1Jyq
	8GSSI1fczDjWPPp53htSm4TK36viGnj2H/y+CbcT8J1/Hk4gz/Sk/0B8tC2yBmc0uapMo+WrvHFu6
	R0czKwPsVXb+BsClO2u1UHhbd4qmNWumAO02P5t1beFmaezv0Clh03hof850WdOs4YNiwKoRBb7zR
	jYWCiJMfYZqIX7/Jf4ePUqJarhrTxYjZxRVVniuDXEzHoXkxl8J7GoFtjqDt7BNEr2sXeExf3Fyyu
	QECAmv5A1TTvJRfE9ratE5A1ndsiYbKQwMjrrEVK+RvdNJ6kxcI6Hj8loO6S3PJftuI3wKHrYXcRD
	VqYj2D70o+p8MWLE9zWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JER-006wP7-AK; Mon, 04 Jul 2022 10:23:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8J82-006rfa-9V; Mon, 04 Jul 2022 10:16:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 033C6D6E;
	Mon,  4 Jul 2022 03:16:30 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E6AF63F792;
	Mon,  4 Jul 2022 03:16:27 -0700 (PDT)
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
Subject: [PATCH v6 07/21] cacheinfo: Use cache identifiers to check if the caches are shared if available
Date: Mon,  4 Jul 2022 11:15:51 +0100
Message-Id: <20220704101605.1318280-8-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220704101605.1318280-1-sudeep.holla@arm.com>
References: <20220704101605.1318280-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_031630_434978_AFF38565 
X-CRM114-Status: GOOD (  11.51  )
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

The cache identifiers is an optional property on most of the platforms.
The presence of one must be indicated by the CACHE_ID valid bit in the
attributes.

We can use the cache identifiers provided by the firmware to check if
any two cpus share the same cache instead of relying on the fw_token
generated and set in the OS.

Tested-by: Ionela Voinescu <ionela.voinescu@arm.com>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/base/cacheinfo.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 4d21a1022fa9..e331b399adeb 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -44,6 +44,10 @@ static inline bool cache_leaves_are_shared(struct cacheinfo *this_leaf,
 	if (!(IS_ENABLED(CONFIG_OF) || IS_ENABLED(CONFIG_ACPI)))
 		return !(this_leaf->level == 1);
 
+	if ((sib_leaf->attributes & CACHE_ID) &&
+	    (this_leaf->attributes & CACHE_ID))
+		return sib_leaf->id == this_leaf->id;
+
 	return sib_leaf->fw_token == this_leaf->fw_token;
 }
 
@@ -56,7 +60,8 @@ bool last_level_cache_is_valid(unsigned int cpu)
 
 	llc = per_cpu_cacheinfo_idx(cpu, cache_leaves(cpu) - 1);
 
-	return !!llc->fw_token;
+	return (llc->attributes & CACHE_ID) || !!llc->fw_token;
+
 }
 
 bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y)
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
