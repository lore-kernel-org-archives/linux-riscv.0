Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5640EC64E90
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF3BE20857
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 04:37:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vdOVzaV7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YKQQ3sNb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF3BE20857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HgdkZNYMxqCOfYiEsDHq/aWTxAmXkd6sorK6HDMzdOM=; b=vdOVzaV7qELtpqB7IMJAy35ql
	o94JQZY0NjEBh9blg7nP8GneY59i+rpufvQ6erKXMaQZEf9pnEj0Ifu6QWdxG0IelsCQ3ABZ09+Kz
	UBYuy99uUEOc/n6lODWFvXEskMcO3s5w78zmBYh5oLQ9uDSThe36XBxP8/QpfnL6NQgqadJFM+r/f
	k1tw0/DAB4HYfKDwTNN4+mKCpQENu3Pb1OoJUFIdgUnhM542dCFKaLZBAtA8ii1/lhgPTuWY2RbXq
	wvtDI1lRPi/pgJbAkSCASiSwiIVR9gLPv5Lq+7BzscG1yOlyokvOxtKp1QBC4dfUsRYShQXvWiowc
	G4J69hbLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khQ5B-0007OB-D4; Tue, 24 Nov 2020 04:37:37 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khQ58-0007N8-SV
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 04:37:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606192654; x=1637728654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9FRj9UJZUXbJ36h9NtK7sWhZkQHQ9GoiFFCz8CrFtg=;
 b=YKQQ3sNbq9KwRtzG/DWS4FQtY4PwHRTW/jjdVTBdjo8im6rJo8TzzLfY
 ckrQwJsQRj3JtlD6veSPriWc94488nBUR99BDKJFJgfZ4spJGMozuj96p
 keJvoX8F8cf2tcFvhrt35oN3iH+Zcjh6T0FYjI3lBdu8iWjZp0GX0RqMl
 MUsSEWvcinlnZlJqLAOKtP2ZBpeQS7lcvkK+CPBe40np5WzQJ4X8soK67
 K7iV1DoYHgPlYuVGFU9mEZ4iqi2+w+DSHv9Ck6gO7noQbdVUkahNSjc7q
 nEZL0yQBz6wCD1wUnBZtl7tAeDwDfs3yKOWOO0JyN5Od1NlcDjD11AWwm A==;
IronPort-SDR: Ugooa1zaq6teQZdvEG4Vc5pWvejzRQw8r+7B+p4Ny6hmS4ZITwT77jevX2WLRsxBpJQPPBbq7p
 VrCAKQv+ES0ZbbqqjuZgw1PViLTRjxGoYxIoIBfrcknwkQ6NfO94sKWy8JiZ8s/c1PjC4rxamX
 v05fV9725AsAIOSoeRax+ngdhejitEGdClB+5DmZFbTTl6mnfLaqy3rISvcci+MMD3B0FLJk0r
 I32E6Vayr9+WR0xYnJWEwk5Cwl9+fQmuO5W35EnpXFVc24Y1jyLzwtZWRAk6oXotSdzbXyZRMS
 1sI=
X-IronPort-AV: E=Sophos;i="5.78,365,1599494400"; d="scan'208";a="157768566"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 24 Nov 2020 12:37:33 +0800
IronPort-SDR: lYTOfzaBd3MuWzAmAgJ+MZjCapq05EgBI36owtJ0LOmg2JBBdi7lerPCrzyiCi5S3DS63LSxZo
 ELZEXPsPz1gSwfErMWl7KbLEa4dYrOxwA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2020 20:21:57 -0800
IronPort-SDR: 0crCT+yJ371+gYzb2Mk1eOSYv19iS6VK06GKdG/n5pPXxtKSo5m/+hJsQrj0KSVAPd/ZlwwzTL
 VrtM/3jBOwLg==
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.163])
 by uls-op-cesaip01.wdc.com with ESMTP; 23 Nov 2020 20:37:31 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 01/21] riscv: Fix kernel time_init()
Date: Tue, 24 Nov 2020 13:37:08 +0900
Message-Id: <20201124043728.199852-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201124043728.199852-1-damien.lemoal@wdc.com>
References: <20201124043728.199852-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_233735_108583_A25AF203 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

If of_clk_init() is not called in time_init(), clock providers defined
in the system device tree are not initialized, resulting in failures for
other devices to initialize due to missing clocks.
Similarly to other architectures and to the default kernel time_init()
implementation, call of_clk_init() before executing timer_probe() in
time_init().

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/kernel/time.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 4d3a1048ad8b..8a5cf99c0776 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/of_clk.h>
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <asm/sbi.h>
@@ -24,6 +25,8 @@ void __init time_init(void)
 	riscv_timebase = prop;
 
 	lpj_fine = riscv_timebase / HZ;
+
+	of_clk_init(NULL);
 	timer_probe();
 }
 
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
