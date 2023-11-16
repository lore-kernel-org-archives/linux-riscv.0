Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE91C54FB9
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Nov 2023 10:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JyIbe868MwSgTGtWD/8fRmMkPNpk6UnVERAOTfhLGVQ=; b=lgQM51yLyP/+wG
	rOnD7kVBXFdjjZbJCWT9DqodqkpjZBaVh0wN0OfTGzNWbStLZkmKJ/Pv1ZDdOR2s1ZO3G2OQYJVxY
	gfR/qr2gs1Y5nGH29fSyMDTcFYEan86fHSzrEX4wJZ/4Dwhp8A003vRtTqx5Zj+KFZEqh9g47BeXL
	3WGNvgMk/awEcgFxTjcF8DHxXBjhTPC3xZr0Q+U2TCtb1CmppxiI/SVx2NgQMyj8erJXlF9p1idks
	OOEN3Um/7y8wBeucs9M0EmYmW5f1R6D2KdxSRie1pJ8nsc6JUpgEWe3ueED9S0iiynLl6oaUcHd+Y
	3hep6KIO5215UG1emHMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3a1J-00396n-1L;
	Thu, 16 Nov 2023 10:54:49 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3a1F-00391W-0v
	for linux-riscv@lists.infradead.org;
	Thu, 16 Nov 2023 10:54:47 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id F0CDE80C7;
	Thu, 16 Nov 2023 18:53:47 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Nov
 2023 18:53:48 +0800
Received: from localhost.localdomain (161.142.156.149) by EXMBX066.cuchost.com
 (172.16.6.66) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 16 Nov
 2023 18:53:39 +0800
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <leyfoon.tan@starfivetech.com>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Joshua Yeong
	<joshua.yeong@starfivetech.com>
Subject: [PATCH v3 1/1] clocksource/timer-riscv: Add riscv_clock_shutdown callback
Date: Thu, 16 Nov 2023 18:53:12 +0800
Message-ID: <20231116105312.4800-1-joshua.yeong@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [161.142.156.149]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_025445_493067_D766C7D9 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

Add clocksource detach/shutdown callback to disable RISC-V timer interrupt when
switching out riscv timer as clock source

Signed-off-by: Joshua Yeong <joshua.yeong@starfivetech.com>
---
 drivers/clocksource/timer-riscv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 57857c0dfba9..e66dcbd66566 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -61,12 +61,19 @@ static int riscv_clock_next_event(unsigned long delta,
 	return 0;
 }
 
+static int riscv_clock_shutdown(struct clock_event_device *evt)
+{
+	riscv_clock_event_stop();
+	return 0;
+}
+
 static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.name			= "riscv_timer_clockevent",
 	.features		= CLOCK_EVT_FEAT_ONESHOT,
 	.rating			= 100,
 	.set_next_event		= riscv_clock_next_event,
+	.set_state_shutdown	= riscv_clock_shutdown,
 };
 
 /*
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
