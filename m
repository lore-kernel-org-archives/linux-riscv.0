Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DD3C5CFFE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 16:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4852420672
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 16:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rh2Ljurl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="IQMOZoVS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4852420672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=/fcXXENQ7hk256CnHprRHTdMtfYVp+WH7uKKyxWtWls=; b=Rh2
	LjurlS0+aDFUkr2l1U3UuyeGGZR/5CPHOEb63DRV0uAzG8X/OD6Hs/wAVSbKhMtScZu6Ds0s6/kXm
	leih4U8ypLG59pDvqEWD0aYb5/wyvyeEcy9LkRQ61Sg1gmn0r2HaFdiulKGHxisCspxunU6Lbw0LZ
	sPoBj10ox/xWkdsrpC4tx1OEgIbDB0IuSb/Vv3QERTtcNgkn2B60V50iiLifX8l6DTB7ONzpjh2AH
	GowaNNXA98LbuxzDzSISlhd/L0+gHMp7FVFIvUEGkwEdjxnsvZNMMODSPJt0cLmsoS+YoiXW67soZ
	YB0Fw8TRZReVX6Nvs2yYYpzR5xzM10Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWOnl-0002zI-KV; Mon, 10 Dec 2018 16:53:01 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWOnj-0002yr-6G
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 16:53:00 +0000
Received: by mail-wm1-x343.google.com with SMTP id m22so12060336wml.3
 for <linux-riscv@lists.infradead.org>; Mon, 10 Dec 2018 08:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=/tF6/1it/JYRnKL2oCTIrRuf0Werr1FUed1K6IZQ/dU=;
 b=IQMOZoVS0iG0kUMg+/db+R6R+G/XLyWsrox0OjbZR6tYXjaZ7Z8fmJhEotxrxe5Lis
 h2hC/ccFgllisqOHqfIdaW9sZbuXNdL+z41VixDqBKpB/TGMmuMMOfTAuAwZfNpl6gV1
 704xY8pt5KO0KQSdoFaRN54QKYhwQAK7bPNyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/tF6/1it/JYRnKL2oCTIrRuf0Werr1FUed1K6IZQ/dU=;
 b=OYohv4iRPMEipXuitppX8Zdset4Mn0Y3OmJmSPFSuHcUlOMcnTaj+y0tlGjpMY2tMj
 PrOwYr8HKoa+6shHh37hYu1qdN9Ksf/rouYVJ2K8vBnFgEz80NkXbQzQwHwYHejNoIG7
 RwCo6fga6t6L7nR1xb5sk5Mhf0tTEJAFFSKGmR37zlh7t5qXiPBuLAiujJ6QPJatlZ+T
 NQ6xz/2ZyFPxHrmAJRmf1wUihNR3ubVg6kxPYQixchQYZEbB3p7OzUP6eVi8F/NFrZjy
 hMWjk7H2Kwwr68FCoJS+mM1N075NFyOztXam+sm8klhgb734QfpGVUHSf1yrPDd09vf7
 rQ8Q==
X-Gm-Message-State: AA+aEWaQep06gvmmpMW+LkdfeRT54QQrPGibO4C9qdI3RRUFr+mw8iGm
 1x4IWmfnmgx5OrhkV1Z0emcVeg==
X-Google-Smtp-Source: AFSGD/XUKg5l3QE2PN7HEX8DdJlmo6N6JoRrrZMQuwy1z8F2kGdNzuTqhByTs45zxN323S5JjuXbHQ==
X-Received: by 2002:a1c:1286:: with SMTP id 128mr11949834wms.70.1544460767078; 
 Mon, 10 Dec 2018 08:52:47 -0800 (PST)
Received: from localhost.localdomain (73.59.88.92.rev.sfr.net. [92.88.59.73])
 by smtp.gmail.com with ESMTPSA id
 c77sm12877833wmh.12.2018.12.10.08.52.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 10 Dec 2018 08:52:46 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de,
	daniel.lezcano@linaro.org
Subject: [PATCH 1/5] clocksource/drivers/riscv: Change name riscv_timer to
 timer-riscv
Date: Mon, 10 Dec 2018 17:52:38 +0100
Message-Id: <20181210165243.5625-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_085259_228286_9ABFEDCB 
X-CRM114-Status: UNSURE (   8.04  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, "open list:CLOCKSOURCE,
 CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In order to unify the names in this directory, let's rename the driver to be
prefixed with timer-*

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/Makefile                         | 2 +-
 drivers/clocksource/{riscv_timer.c => timer-riscv.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/clocksource/{riscv_timer.c => timer-riscv.c} (100%)

diff --git a/drivers/clocksource/Makefile b/drivers/clocksource/Makefile
index dd9138104568..ddf697b29df9 100644
--- a/drivers/clocksource/Makefile
+++ b/drivers/clocksource/Makefile
@@ -78,6 +78,6 @@ obj-$(CONFIG_H8300_TPU)			+= h8300_tpu.o
 obj-$(CONFIG_CLKSRC_ST_LPC)		+= clksrc_st_lpc.o
 obj-$(CONFIG_X86_NUMACHIP)		+= numachip.o
 obj-$(CONFIG_ATCPIT100_TIMER)		+= timer-atcpit100.o
-obj-$(CONFIG_RISCV_TIMER)		+= riscv_timer.o
+obj-$(CONFIG_RISCV_TIMER)		+= timer-riscv.o
 obj-$(CONFIG_CSKY_MP_TIMER)		+= timer-mp-csky.o
 obj-$(CONFIG_GX6605S_TIMER)		+= timer-gx6605s.o
diff --git a/drivers/clocksource/riscv_timer.c b/drivers/clocksource/timer-riscv.c
similarity index 100%
rename from drivers/clocksource/riscv_timer.c
rename to drivers/clocksource/timer-riscv.c
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
