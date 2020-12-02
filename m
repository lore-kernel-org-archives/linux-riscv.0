Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5E0C83014
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F338221F9
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 03:25:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F338221F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HgdkZNYMxqCOfYiEsDHq/aWTxAmXkd6sorK6HDMzdOM=; b=wNfw1oenlvX00Y68hH0IwZAqd
	hUrUzOuMLnizI0ymxjvqComdyOyhl6E2BR+/NPr8plpivmxypjpbKuHkGLxI96Qzq9qjDGQxD2Cgp
	aSZgl0b0TxDLPqW7uCmcosDfU4Z0DyNm4/xh/k0aV8epef0eoG9eMBqwX7a1Y5elNeRs0/+uX4dfv
	QpPKC5XTtCgMTd5/6oRakcKtUgGSb+R5iWBPxIdDj+9XKHJCguYgcWa91dbAbyTf3/HWY2R0hvi15
	+FMURJNnDV3SWu3gCShdwBdOUMTnl2jY9k61Go14w6veclVYxSGb1mUSZzu/6dDaFB5zGbcGc334g
	oAnFORFDg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkIln-0000qm-8C; Wed, 02 Dec 2020 03:25:31 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkIli-0000nF-8X
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 03:25:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1606879526; x=1638415526;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I9FRj9UJZUXbJ36h9NtK7sWhZkQHQ9GoiFFCz8CrFtg=;
 b=M1qyS1dvKE4eG2PBN+0bk871GhX2erHTaKFaI2HoYhG4Soux8PiIc9sa
 KTfKcGuzhaGSD8JaMqheUDgZ469ALkmo0ZJpSG4BzPKT4Ed0fW/fS1j9b
 ZZboyB2OhrZaWnWGu0jSa3YjVfYgPK9AckgDQBdKyJ0kNlIFObeWzPgyv
 4ZVHznrI6n4Wp8Slf2edoBvg/rjL0fzMNNF+xtV+vcqukvayHQHEBxXw1
 DfFverWYHDG654KQ4ledq5t5WYr72oYnPc0uUugd9A8CyedaD5rss5od0
 ISIGG3ZOk/okX8FkrMyLfQHFQGEazXf25Ob0eMkiBO4P3NGZY0RLrTCOm Q==;
IronPort-SDR: IyIirYQdDvXgTDZ3g+QIFDpZZBtfFEfUL5DI/lINPcKvt703yeIZGfIXLHwmEsQMyWchueHk0U
 QKb1n81R9cMwfmpKG4n0i3ocLwG0jkrBkX0tnA+I8xmLYrIqB31SvFg1SOlyphGdrn4ln5YiUL
 I2REx7Qaj5uJe+VlFlXHWkjc/A0iPGXVjQlNBtklXL1OGooEd11MZrpTVkImiijAEDIXHRAIMf
 R29LGT4koQ6Zxz0HR1w5I9FQIaBvyxTkqyVesZotKx0Pn6ShGkv5uBK1yTkEjZeEz2bLkvg8v7
 ZqQ=
X-IronPort-AV: E=Sophos;i="5.78,385,1599494400"; d="scan'208";a="153922330"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Dec 2020 11:25:07 +0800
IronPort-SDR: s9hLSqb4Vr9AqD5fw0keHAp8bh3VTIeGP1OqFwcd1lxbz9PtpIkSgFr7ECMY+XQ4vNL/ooRQhP
 O8XBn3kdS4sPjOiCkYoAvKsj+CWX6AqrQ=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 19:10:42 -0800
IronPort-SDR: 7sd3gTVHXv7tMnXz394AGVVdZYWJcyOfWN53dQORzp35UoArP8SSg38alO68OBdwstDWADBR6P
 Os2kxqV9AVNw==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.196])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Dec 2020 19:25:06 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 01/21] riscv: Fix kernel time_init()
Date: Wed,  2 Dec 2020 12:24:40 +0900
Message-Id: <20201202032500.206346-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201202032500.206346-1-damien.lemoal@wdc.com>
References: <20201202032500.206346-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_222526_448581_5A143E7A 
X-CRM114-Status: GOOD (  13.13  )
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
