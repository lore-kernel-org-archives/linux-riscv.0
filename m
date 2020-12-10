Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E989C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:40:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C7B32184D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C7B32184D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zCWKsNhd+y0U9BNQd+Xc8+hQx/lATMHTCzQr2Ai/vkc=; b=SFCIe0ibvozfDTqknIw4NPu1B
	86+HflQeGlOPEREiReMMyXqya7/UTa0vcb8e59Sl7FTZ1mT2sQdS8jd0PltNZnmT48HXJWkSQjzbP
	n/7WjABVX2mWayxmxZmpm84A6Ovpr0UgM5YEDcOKawC8f66SOM0X3eJ1mg0KRSXEYSxjq2Cyg6tP1
	dLssLAeMPy6qpagp6Lm/ii9NVrYY7YlnmOrg8cbVawt/bfejA1s8UGos2KaDOFrub/za15qXXcub7
	xzT8kFCN9/pJ+nyAH3LEAnWzpsUsX0EqpgzQtld9p6zOKleRjcnGMsv/QRCrTIIqs2bivY6DYYUDI
	JQtAXLJBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCoU-0004Wu-1l; Thu, 10 Dec 2020 03:40:18 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCoS-0004Vq-8o
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607571616; x=1639107616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9lIXSkXmm1JjHCFgZUF+EI1D5ZXZRRfkRqwz5LKPsE=;
 b=bCIm3jOMhTVakw89rnIsbU2tRL5R6lOqC8l+dWkGHwqwbtb6hJ4wO4ky
 iBCfVwinEIhYA/GuRsi2sAWwmXOvJkL7beVZSs3FmvN1ritsBw1Xko1hX
 hqqQHdr2juaNhlVnRr8MKjvrEqp7dHnRF1Fwm25GSysXqrzIOV6RsB4z5
 UJnCaeHLGz9cr2Bwg1RygngIIs5GUYS+qGGwjE0ZWMtfmJOnkIBJUfND5
 PeXpqUjuw3PptLGcEojWxPL+oAIEqMLjs3xDCX7t4biSN9EXyHz5KQPUj
 Kl5ICbTNmA9Ct7WFxlUkiU15SkfOokmu01Lm2P5rnq5nRoS1kqGt7s0M2 A==;
IronPort-SDR: FK3XV/lha27UnIQaw51Duawwj0DhO4HyW/MbpaJ+YaUWITULDoBYT3NaJ1n1tNVK3PsrkRWvug
 WSXiE7jfI1yxxoOhXcPDeH5rEsbNyW5x8lxjl8OGSRlMGG4J8T4PfDzISH4KF3XFxbfzefJMK7
 hm0lSJThQDl9db7rHjDo0DdvY2Xx1Qc04fSFm2+P+yvjBIj25r8W0hog6dXCjIMPeTqjePZqEM
 V3JTmQw8uhsR6SDW6pkWgJSpBJGyiSoqQ6ZL8bB2nv2VGXClAiI2zWI5Sl1McK0p/DQhTkmEva
 r5M=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; d="scan'208";a="154813104"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:40:15 +0800
IronPort-SDR: nIk2z3zEJ6Lc7hrTpmtJSd4y3AbOmRj4KFugnUxEAUVvKQYtrSGT0vFeL9j0yRyqzqVvxW0LV8
 2O4Ozb4PNvpIK5F+r9vnvI1+jm1K0Cb14=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 19:24:11 -0800
IronPort-SDR: wEESJt/qlZsFQNbUANYLhzB3DFbaaogp712R+AZekxpejGOdxwjN6Bsy93ahaUlPn/GLf1HPKs
 ThW/3HsaZpfg==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:13 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 01/22] riscv: Fix kernel time_init()
Date: Thu, 10 Dec 2020 12:39:42 +0900
Message-Id: <20201210034003.222297-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_224016_463430_F92AEF32 
X-CRM114-Status: GOOD (  12.82  )
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
Acked-by: Stephen Boyd <sboyd@kernel.org>
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
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
