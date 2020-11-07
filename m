Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E37DC4741F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7A0F208E4
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sdNZWY/V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="NcikV2SN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7A0F208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cg4r5e4UPdCzspPQuni16N1nXS4E5gHci2YMo9O+91s=; b=sdNZWY/VokGbtXFLUtXlfjp5L
	3KcmxdLZT14jNUqgjA5MrGkgeN0WBYjk3sZuX40Jyl4oKCuZmSgpNTdQYI/rXxi1UrKFUKAuab68Y
	66o/4RO/w2XUCNbq3XkhDWIIA9HSyd04KVbAMICrFanY7zauLYrXrejbqP4P61Q/kHi3aLx99A5oZ
	sWytrrYQSiA7g9g1P7Bg81/1yx0kLQL4s/buYnfk0QYgbvYlzKoMWGH40pEqLwjACvkVrqMoZjOwV
	ouH2s0TQnpAvj6ky5C7NXW8oqvn36crXn0s8pde6EXliDGu7M7mfI3AjLjfp8LVwBqhW07yjbujxS
	V7bizqxZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNL-0000lV-5C; Sat, 07 Nov 2020 08:15:07 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNF-0000PH-T1
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736901; x=1636272901;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jRSYrT/nCX22lvm9yKoOPpqudn5ve7/gRn0IuSGz6SI=;
 b=NcikV2SNwrUYlT7TqG2FFY4WprNZJ5gZTykrEmBCp882gSRDIH75aeBV
 almNFsrpIyWNJdgtgd7nURad1l/5er66DwEz06NCzzJuTUp3mDOl7fmu1
 r09XRVdGG5mRd7BjeCO/Tmy1Seqi2AI6EgGZ+eQTobi8F0L5cz0W5PG83
 E3AVr+jjCCAF5M2NqBD+3xOLoOAqyvFKHP794/iPItdlBezSP2B5iakRN
 9+pYA25klZm4M7mU44jiitx8I9uzRAtB10Fs/dl1IEQWX3i6/b87PaZaZ
 qLIKPVfmCy9Jr2VpAifE8zqs7HCLm+QMajOxp15salwQhdPixkWBtAhAB Q==;
IronPort-SDR: cNZfBewRaZgKTvNXxP8QPviZ5G8qf6zHt3jxIXe5Cq7Wduq3V+A5jVHuj2x8DXqXONPZm+mtJv
 HibObjFrwjChUZcC2BvJr3SDrrGdO0vd5AhOCtONNkBwdYybqbkkjNEaaYXzj6B76DeOHm3VsW
 R92ntKtrbn1wQ85akiNFiQG5L5YhVx6euV7475sgqVSiF85ToSwbZ2il6fkh2lMmpvcNEmdiqG
 00f17eG/TFPhR/cfo6fOCHvdIi3fYGj9ySJn0gH1EANd193Sss3sY8PSleyLuMKE2eXpStayhB
 ono=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079298"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:01 +0800
IronPort-SDR: d8uroUjJDjdbdYOoCzMVtEJAcoc+W1rkSR3g63RqC81IG+ufcdsJNt0FxjNAnd6GFZxQ7igwP9
 eV1T88U6G5lFtlKwRAdB+HqhgYWgszKWjhQyXRzjFVyq0udtB1MQKwwgoySn4xapS232JIuVnI
 jJ4AjgMlYyzrsdLx1nqWhjAaJMjeMIvI+e/dXQa/LmLJem7RO4TAqXqd2ehaACQ6lIpz5XB5lk
 PQq1sXC+XiUdi/pdhygf/7BkMHReeFYEAUCjKAUs3gYzQ/KiwqtMe98UbWkbi6wMxOoAu7NReo
 WjPS1eo71reCEgiANb+gSPTq
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:05 -0800
IronPort-SDR: J9xCovqu/4T/JaWxZz1AtZJvqQHZI5qpvSqLOujLeGbPzdAeuQZP6yLNgd/KWnxsBqE5HBJdUk
 T9yoxH4vjhUKe+qJ6JA+oduAnkHAcKyCJxRji/atsQXUx5AEcs/IMRduZBCzHq8JeDUrKkEo7o
 3oDZSNdeR86mEFf8ezM/q6Cl04GqBsKwvZh/KZ+s7ayI/b7ind5+X4Bva/1cl9uQJITgTdjjW2
 u0tJiX2KgomnddlAuf3ZSB/4fG9J2C2ArzR88FKk4Xk4B4BwxnCdLVoCwyNdvqJDZpxkKYozUA
 VPg=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:59 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 14/32] dt-bindings: Define all Kendryte K210 clock IDs
Date: Sat,  7 Nov 2020 17:14:02 +0900
Message-Id: <20201107081420.60325-15-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031502_194178_E3BC09B3 
X-CRM114-Status: GOOD (  12.16  )
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

Define unique arbitrary IDs for all 44 clocks available on the Kendryte
K210 RISC-V SoC in the header file include/dt-bindings/clock/k210-clk.h.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 include/dt-bindings/clock/k210-clk.h | 61 +++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 11 deletions(-)

diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
index 5a2fd64d1a49..8d7ab2f0737c 100644
--- a/include/dt-bindings/clock/k210-clk.h
+++ b/include/dt-bindings/clock/k210-clk.h
@@ -3,18 +3,57 @@
  * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
  * Copyright (c) 2020 Western Digital Corporation or its affiliates.
  */
-#ifndef K210_CLK_H
-#define K210_CLK_H
+#ifndef CLOCK_K210_CLK_H
+#define CLOCK_K210_CLK_H
 
 /*
- * Arbitrary identifiers for clocks.
- * The structure is: in0 -> pll0 -> aclk -> cpu
- *
- * Since we use the hardware defaults for now, set all these to the same clock.
+ * Kendryte K210 SoC clock identifiers (arbitrary values).
  */
-#define K210_CLK_PLL0   0
-#define K210_CLK_PLL1   0
-#define K210_CLK_ACLK   0
-#define K210_CLK_CPU    0
+#define K210_CLK_IN0	0
+#define K210_CLK_PLL0	1
+#define K210_CLK_PLL1	2
+#define K210_CLK_PLL2	3
+#define K210_CLK_ACLK	4
+#define K210_CLK_CPU	5
+#define K210_CLK_CLINT	6
+#define K210_CLK_DMA	7
+#define K210_CLK_FFT	8
+#define K210_CLK_SRAM0	9
+#define K210_CLK_SRAM1	10
+#define K210_CLK_ROM	11
+#define K210_CLK_DVP	12
+#define K210_CLK_APB0	13
+#define K210_CLK_APB1	14
+#define K210_CLK_APB2	15
+#define K210_CLK_AI	16
+#define K210_CLK_I2S0	17
+#define K210_CLK_I2S1	18
+#define K210_CLK_I2S2	19
+#define K210_CLK_I2S0_M	20
+#define K210_CLK_I2S1_M	21
+#define K210_CLK_I2S2_M	22
+#define K210_CLK_WDT0	23
+#define K210_CLK_WDT1	24
+#define K210_CLK_SPI0	25
+#define K210_CLK_SPI1	26
+#define K210_CLK_SPI2	27
+#define K210_CLK_I2C0	28
+#define K210_CLK_I2C1	29
+#define K210_CLK_I2C2	30
+#define K210_CLK_SPI3	31
+#define K210_CLK_TIMER0	32
+#define K210_CLK_TIMER1	33
+#define K210_CLK_TIMER2	34
+#define K210_CLK_GPIO	35
+#define K210_CLK_UART1	36
+#define K210_CLK_UART2	37
+#define K210_CLK_UART3	38
+#define K210_CLK_FPIOA	39
+#define K210_CLK_SHA	40
+#define K210_CLK_AES	41
+#define K210_CLK_OTP	42
+#define K210_CLK_RTC	43
 
-#endif /* K210_CLK_H */
+#define K210_NUM_CLKS	44
+
+#endif /* CLOCK_K210_CLK_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
