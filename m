Return-Path: <SRS0=+vY3=ED=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9622C55179
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 13:07:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF5392473F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2020 13:07:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KLFPf2Xq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF5392473F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=URnQYQ9Au+B9tjNy/2j8PrXsyy3aqwZWUU7KMd/1sHs=; b=KLFPf2XqwCu017AMt2Im4XaFLu
	kvUWB5xIUhcPY3H1wbRZrO7w3wtSePikDHPFSPionMYFzvvHNfw29Qcu+etim0Ns2vbZm/pSejVtm
	IAj86G+0zn1BKsxZGtSn9BJPTWEK4cRLDYGyFl/gjWZAhsWSuuy9/n1HcFqgnChPSrKcsWCrKBGyu
	deIMF1YEfTHKm/nc8tnb0EK4X6v7xIRPQulZ5PWmH5WLbc6PDAjHHOBY1XT697nDcLttkHxOjx355
	01+T0b28eotmXJZc9oLyxrRGIIyA9NmsplmznTp1kRUg1vx1RkFuJY+dXbtVIj9YqP0hIQpfFB9Fu
	og9GEb9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXlAP-00084Q-Ls; Wed, 28 Oct 2020 13:07:05 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXlAM-00080f-Gw
 for linux-riscv@lists.infradead.org; Wed, 28 Oct 2020 13:07:04 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CLpkM1MbvzkXdf;
 Wed, 28 Oct 2020 21:06:51 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Wed, 28 Oct 2020 21:06:42 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH] riscv: Make RISCV_TIMER depends on RISCV_SBI
Date: Wed, 28 Oct 2020 21:12:30 +0800
Message-ID: <20201028131230.72907-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_090703_500552_C86C1B27 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The riscv timer is set via SBI timer call, let's make RISCV_TIMER
depends on RISCV_SBI, and it also fixes some build issue.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 68b087bff59c..2be849bb794a 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -654,7 +654,7 @@ config ATCPIT100_TIMER
 
 config RISCV_TIMER
 	bool "Timer for the RISC-V platform" if COMPILE_TEST
-	depends on GENERIC_SCHED_CLOCK && RISCV
+	depends on GENERIC_SCHED_CLOCK && RISCV && RISCV_SBI
 	select TIMER_PROBE
 	select TIMER_OF
 	help
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
