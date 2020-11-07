Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5595EC55ABD
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFAC820704
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rDcI2F4I";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Nk9na0o/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFAC820704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2w3rg1URsBykYHfRrYwKsHZqWLa0ziCc8gRHtXCo8pg=; b=rDcI2F4I2lsZr5A8a7YHbVSXv
	MW7/ce+OniriO1Gk99KBzKxQQkvusCF6RfNZQW+INfF7VlnbW9w8eDu7Mr7NLqjvFvbPJdpQHXuIM
	pL++jbca5Q7XhN3YGgMUEGwCLg6qQGf1wghTTGyWX0NkNk6yxtaf5i0x4LMZIcYLFb6IhKVrq86FZ
	XhraGJt0ZPF18YRNBZNfImcR5vocZPT8tB+fXpMBUfDFnPW6vLaLWyLJWNblaA6zJJLQgklz4wMKL
	x+7ZzHNsR8BKOfsjDVKgP7wbLqgxt7eHDtrVcEZruCDxT6rXBpNqaObeU5cS9/uYRLhnREYmF+KyQ
	b2TDJ4nqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNV-0000sU-Mh; Sat, 07 Nov 2020 08:15:17 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNN-0000PH-HT
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736909; x=1636272909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=i3cWoJkR7yUZQNOde09o7Nwh6wMCqp2Qd3Q1TOs0x7M=;
 b=Nk9na0o/VIwbQ7dtDUh/XNdYPogWEBZt1AHAMfnpi8q1J2NpvmV9mtDZ
 s64mkDxxRfoA1RFd7NmGP4X1I0jSLd4CDhvEYusd488BBLey7i3oN5POb
 F37V3z5Mzxv/L+8Xgmvsxei4hRAYVCu/yBTugVP/tMmzK7fj88pbDpY82
 DtNvFbJDYxP/nLL0uHBKP3KNv4WCswmccy4c0KLp+qHKIAaCJ2B9jCV83
 e4qJr03gzaeMJc+cV80YZY2cU8eOCS8xF8eC/NNoW6oLyZIn+5gYRrwbm
 DS9BM1zqkaJlB4IXLLoTxlQRiLdprOMP4qcnJAyb8pAE7T/yStk3cO8RP g==;
IronPort-SDR: 1hK8zQul0FZfd8rNtAbK59s2ZzQHnTTfUk3YfCWjiaG++5cbMlineST9A8QultMUm3o8GvqVSo
 KjWwZeq8AoDLkzQhe2RZ5V3eMB98BMYVTUoBvSs0GfkbhVse6A+WXV2J2ntPLIEC2cuxpQcGWP
 RtEXOie70ejn7M/DhXF1sBLY7tWiEoWrFa62FiL9T5a/qUq7tbsGUjv284z0pia9GINF1TBoBO
 YlyRUlCZomvCjcMSOUPbRT60y97nQpFsjXi5lnEqYZta7UH8fo9crYy7ZHHdg3kpIotTZ+4USa
 92Y=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079311"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:09 +0800
IronPort-SDR: cI9wlqfsBDJ/x8c/GC0l+28U2xabQfdodw6dwfYtr7imyZP9Q5Z2u1uT6siblsKn8QJ7gwv8Cv
 zGmL/e/sSqlNeEvtVr2Fv7MJ+HbvzSWGf5zhxV4bNJFQeBau4t+BXvID8SudPjnNffkz8uJ9ok
 A81+szAtspY2dnEM32IeNzZz32nnHL1HZID8Et2Yyo7LE0U3mMyMl0qqF+7wWrh0S1XIR/idfE
 58Ihyi9I/in0mrvW2aw0iQ0uYWxjk15RBqG9QnvFFLMFdL4EZykZ7kqfrZWwnUpldb1jJlrOSo
 vcuSaGzm4kBmzkrt21GEo3eW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:13 -0800
IronPort-SDR: y1qTH6RGguGSyluxLK/fBd4YoKIYIBAHDBFAdJDQnfLjUxogD/HMVQV51PGP4PWDtiHU7L5lXh
 Ks0iRlB+NUDic6UsOlYiPQeN7Sa7eXGftVRNUnS53IRichEDB5BqeldCwo72sfTn2QQDblZvWX
 RisdudAF1jcncJw0uUSGiwjWt+bVWimOOgsvFBdNd4+YimsR0TBA//fGYaan2doQ2vHP1rTsfh
 oQrdxVYyDy+UDB00awl1jR/S0/pdo6CeH33MIgTe/wg/bW5ZNjUhktJ78wfuahcIGR5Ym1N2ub
 JZA=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:07 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 17/32] dt-bindings: Define Kendryte K210 reset signals
Date: Sat,  7 Nov 2020 17:14:05 +0900
Message-Id: <20201107081420.60325-18-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031509_794526_33231AA5 
X-CRM114-Status: GOOD (  13.08  )
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

Introduce the dt-bindings file include/dt-bindings/reset/k210_sysctl.h
to define IDs for all 30 reset signals available on the Kendryte K210
RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 include/dt-bindings/reset/k210-rst.h | 42 ++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 include/dt-bindings/reset/k210-rst.h

diff --git a/include/dt-bindings/reset/k210-rst.h b/include/dt-bindings/reset/k210-rst.h
new file mode 100644
index 000000000000..883c1aed50e8
--- /dev/null
+++ b/include/dt-bindings/reset/k210-rst.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2019 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef RESET_K210_SYSCTL_H
+#define RESET_K210_SYSCTL_H
+
+/*
+ * Kendryte K210 SoC system controller K210_SYSCTL_SOFT_RESET register bits.
+ * Taken from Kendryte SDK (kendryte-standalone-sdk).
+ */
+#define K210_RST_ROM	0
+#define K210_RST_DMA	1
+#define K210_RST_AI	2
+#define K210_RST_DVP	3
+#define K210_RST_FFT	4
+#define K210_RST_GPIO	5
+#define K210_RST_SPI0	6
+#define K210_RST_SPI1	7
+#define K210_RST_SPI2	8
+#define K210_RST_SPI3	9
+#define K210_RST_I2S0	10
+#define K210_RST_I2S1	11
+#define K210_RST_I2S2	12
+#define K210_RST_I2C0	13
+#define K210_RST_I2C1	14
+#define K210_RST_I2C2	15
+#define K210_RST_UART1	16
+#define K210_RST_UART2	17
+#define K210_RST_UART3	18
+#define K210_RST_AES	19
+#define K210_RST_FPIOA	20
+#define K210_RST_TIMER0	21
+#define K210_RST_TIMER1	22
+#define K210_RST_TIMER2	23
+#define K210_RST_WDT0	24
+#define K210_RST_WDT1	25
+#define K210_RST_SHA	26
+#define K210_RST_RTC	29
+
+#endif /* RESET_K210_SYSCTL_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
