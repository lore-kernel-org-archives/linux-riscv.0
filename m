Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFD3C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:03:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C465523B85
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C465523B85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zCWKsNhd+y0U9BNQd+Xc8+hQx/lATMHTCzQr2Ai/vkc=; b=zdnky3Sh5rzO6Hw+1QlazrstX
	ph9ffB0YSzUnz0pYuACpY2VHWfcrhaDML2f0sFZFUYLocn9gY/pnr5Bc20DxynLjqSV0Ogvv+3x6d
	+zzzzoYqWoVaTlFDb8JdYsu6D/KJKsjDUhJRkafDOL5Ixg8YdxM8cXcvM6R2s7i0OfQgeqUaWK0Cq
	5wqDpY6KrlWDiXZYKbsTwi5/OSfmLNsaqKpUUSOdUqwK8GTk8BBD66zys7pcoXVUOd5rk4RjBLKFy
	F4DaClbfWuNEa5vQUYz6Q7et/carbDGxY/+KcTPy1B/EbsDGgN2Tx6+mgo32+17tMKuGSzcjupuMa
	qEYP851ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMXV-0000LK-2u; Thu, 10 Dec 2020 14:03:25 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMXR-0000JJ-EZ
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 14:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607609292; x=1639145292;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a9lIXSkXmm1JjHCFgZUF+EI1D5ZXZRRfkRqwz5LKPsE=;
 b=oydvFiHhHaguJr4kZpReKkwIFXT93tBfcL3+pPBXjqb/uNqx2x7crndF
 jrBp1khvZNCKZ2puESdqSXjq1OWqMvdl5seA1q1UDhfzSZbcP7M68aZPp
 lU/7DbceuevBgBb7vWJWQ8ngrcJjuXou9KPPvBQsHG7f9jgIgrT588yxs
 lIikxCIrEFxBrSgzcrgd9OAe28IwwSFxkJLPUzn9h4zDkNlK6yTYVsyrS
 oruAbsZkxwuQ2ZjiBRAH/S14+9ufTme3XO9EaPjLQoO3rxzC17WBoVon5
 kzifxhAOC037qKFEKkm2xXClv5b/GewvbqT3WAGeqmM2nf/FXXd40TKIp w==;
IronPort-SDR: gt3MfwZiazmYmXRVsonswr/ZFwV904OEV4CA3zpAuTVSizRm7eJzlynrbYM/kyrFDq9bPQhGuC
 XosYd5W2oaHgPYC/3LBVU5c/VPu5Hh3EzzS3yh335ZdapvrhzY5iHyD+3R2ly8Ij+BRw/F+Qzj
 pKq/430lMwRD7vODSeAnjXkL6RUHFKcyjZtbPNg70rG6Y8HrWGlbVgANQb8u4SkMfQEnVsEuMU
 och9BUg9CG8vbWYbrJbs+58l47qLxfjYVn4QLkyRPaN0UpdEgIA9JeBi4CdUheJ6tdTXSZz136
 rDw=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; d="scan'208";a="258584799"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:08:11 +0800
IronPort-SDR: d+bvQ+bSKAeqlC1nv+3EAMDXs7wdeJfqbav7I+hof4qzQ6hphDPbPWBhSzbrnUONv8g6EYRiya
 MrIjBQM2Mf8x6kMLzTEsoyFU7B9Zp3CnY=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:47:12 -0800
IronPort-SDR: AYIs6fKaxtHsLAssBV6+qL+slKYEegOBU1Hy83epkwHh6hmSUUPiHJC1HWDsM5dVzAgNS4OPZx
 pq90cn8uQTcw==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:19 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v8 01/22] riscv: Fix kernel time_init()
Date: Thu, 10 Dec 2020 23:02:52 +0900
Message-Id: <20201210140313.258739-2-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_090321_655127_48041F02 
X-CRM114-Status: GOOD (  12.71  )
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
