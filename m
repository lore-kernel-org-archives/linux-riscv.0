Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D08C4361B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6944224B0
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 13:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E6944224B0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HM0tU4okIFitl/FCRtlMAEFpffkxHv47JTbmlEw6PQE=; b=xA8xuWaQHKuhjQzlFFdAOY3fi
	9UCPAqGgVn2HrDy7xUhS/45Hd5GWXzHQz2dv3BFEzkfdZwcOnthEVYitcYynoEgxmSL3eGhC44scW
	eLc6GmmkvfJ0N7wZdnggkdeH9i2U0T0EX9/KRJ7rcHwjzYV8ejRFbX2Z4rmXIPyWHCNIASEPjLYeb
	3Rc9A5Ro4BlDA1uScqCgizxJN9pUKyorRt+s47U59Ez/0tjozjpsJl2tI7YlW4nu4ZgXsVvDgy4D2
	pTzJJWnHlR619zkWnNqbY8g2jJWhNvvlN3EXVJQoMQsVX6Vid55Vx9cXUjW6YFrzqCFZPYjr2nbFU
	m85V90smA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koRmI-0000Bw-Df; Sun, 13 Dec 2020 13:51:10 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koRmB-0000AL-0h
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 13:51:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607867463; x=1639403463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0B+kwvrbaYpEs4CIb2Eoho1O+FgaDjaWqzP4OVlKPRk=;
 b=obcVPY4hjJbLV8cl1mEUflKdtSo1pKKjOLrSDKeZr1Z9aHwzAr6skRVf
 +bzUaYk4znPOy0LlmK6/E5uKBrjHXbX6d/44IjiUYhSB2UgcGw8NC9Mr7
 bBUFeA7KpsxSSGbnuiiRLSZLvbuwS/qQ81PZhwq35MyoYBCJUup1PNnzF
 Azr9bjj1nLnlYtb1gLE8+VkGJ7hB8Y4GDImIOtFi3hbKVEioBSHV0UcrJ
 xVRYMC8r0uWra7Ovup7OZYNi9656SHzf9VQsCWayGznKc0gYrfhXMBqcC
 LcNgDYBNY4JmmSddBSk65hR95j2W03pl/uA6Awf8V4l3BRobEGh1duL5S g==;
IronPort-SDR: vWMIfGS3RDfsB65P3YrkyNr1R5OTnOEmrp2vL4a6E89yEIo/6xPmcOlTk7GfuN4nu7ypMubFw/
 b1R79WWqrW1Y9Di7Aw+5z17Qv4XkVlJzY+OFuhTwfpdh48x4VlnMYOMXf+Nf7eOyBZHOtt4vXv
 Q9Xr332b3fjwLTKWzYFEtt558oEWWxUFjAHNoo4PXJaZCLK25XsGBjvKSNtSPo6MkidLG5ZMAZ
 X5kPGoUEkByi/YOx2vK+DUcRCIymoex5ZZoT1vE/JojyYmYID6SaMCBBg1lawyMBK9RazOeYbi
 /gg=
X-IronPort-AV: E=Sophos;i="5.78,416,1599494400"; d="scan'208";a="156242548"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 21:51:03 +0800
IronPort-SDR: pAvys3BF87XrZ/uWT+TX8WSJg8qGK6kN16EoD6auZvpkLTr0WXHXyAmNiVarCJMl2TS5jYvK2W
 PkdJ8dzJbG88ZC5e0MWUXLy9woe+fYRwvC7lJXQ+IIISROH6S2LX89+PJaCkXVcHkufeU/znHf
 8LAH0gxpPb1RTC2eKr+MbkDkRyl6/sehqX0rkcHFp7/6Lh2hAuT0iUhyPdaSjC3fXx9QC6wN86
 2YHGazXmkCQpQv+UviP0Ft8CLHHuMFuCo1EhLdWgtxUmrePp75TTeVZGlLo1YUOaGLQE49g5HG
 H8ov3Rc1+7CdaJDZsOmtJjrE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2020 05:34:47 -0800
IronPort-SDR: 0/LgnlutHKxtwb+pbBl3o7Ls1rFecKaGRoWvO0RKPF3+TFxWGaq0BBzTIVTYJ/BlZQa76Nj8Ff
 Ghz2Yp5unOhqlEKeg/LU1dqh1GiQLgFSHv4YUS925vBDOKOeb0V1mxkRZnVe7GYQ4lDDo7cjzr
 Oo9OqBoFpBTYrX79QHkNQAHdJvNnCZgQrF28rxxOuELpPyUFc1jKGzr9MPMWlY/OVcyu7EuaBl
 +L4joXnki/19If7Uqt4UwVCtxu+kFf0mWcWrcbGx7oQLhCOl1oY3nFi5arNrX9aZX+a2Dkviyu
 PKU=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Dec 2020 05:51:00 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v10 01/23] riscv: Fix kernel time_init()
Date: Sun, 13 Dec 2020 22:50:34 +0900
Message-Id: <20201213135056.24446-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213135056.24446-1-damien.lemoal@wdc.com>
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_085103_198502_D8795522 
X-CRM114-Status: GOOD (  14.22  )
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
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
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
