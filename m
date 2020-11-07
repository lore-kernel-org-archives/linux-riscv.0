Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B44C64E90
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C803620B1F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3g0CUJrc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="AbphSkPw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C803620B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RV0u9Un4VriWSN8XEmchWHY6IR7FGhYg44EZjpoGKF4=; b=3g0CUJrcA0JsObZZL6yRD2E/s
	LsHrYuoRZZjrH2uikPqqC9r7A5AZNKt2Dtpe9kMwHBeRgh3oSpslB1URKs5fuatKM0cLhACIQs+Md
	dtI2sNiTf2mDztanjFW7HB8Nam1tNoGL4DJSDzCAjob98NkLvL+ekZVGuL4LLLLiDw/uoxv20PtZl
	zPFZfzKmaNUtWc/JCS3F8Geczqm2ew9synJAJLq9fyDxKtmymdcTg9RvLf9Dd5VjWLF1BTpJHC6CA
	UWdQcHtxoOtjkuMl5sdR5D726hk/6VTN3tXcGEcTOp6T0Emgg1RlmYYu0oRNKFzQA2CxdtA96E2eq
	ezfQxBVnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNO-0000mw-9z; Sat, 07 Nov 2020 08:15:10 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNI-0000PH-EC
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736904; x=1636272904;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OwEcAaLGKLikEV3IIKilCFTJ3PqrOw5/ZYDF2ZHGjzw=;
 b=AbphSkPw9aK9Mg28zlPcfgh1sqA43m7F4yPLqd/nRt2F1xCVTj2BLugq
 cuoTd65bLtSF3eyDm4E65s13bmlg884kh8598pHuFvFqzicubuLcGFLuS
 sFbQldRHKj6qUD8T3Od2g2OY0SA3wm8g4FxG+W43COJFI1pDCOQZYSTYK
 RtQuFAA4yD9Wi6stxKQLyf1PpmLJM3YystImmFe71DUKeucZp6cZHSkY1
 hd0NfIpzjPfZvtoA+1zM5oK/aUwrAurFhEgBqEuL+zet+yLibEuTdC/IV
 ziqrxETrTJppuRaxohpOJqh7wk1IZeTzJg/hOJ1qstCOL5/t62i+hd7gP A==;
IronPort-SDR: kPFokuagPGDaZpJfeFOqffeLzl0jHkdIuSXXbCb1n4pWigKWJyr/f2EUlkzfQqL5or43Q5OInm
 aWObv4IX0UczJajZLlvglZfLoZwwt1i8zsZ9wd8pTsMjjHTCRx1uFXWjROP/xuvtTS4TgSxjS5
 A4Y7mGS3/G5VkorCIxtaKyQxL3Z2I5U/GKvX4Ur2U+EHoPS3YszTQbt29WzD85oxMGqQjCBoQi
 83J1h5RQdhI/KmGGRnOweTCwXdrhkQYyn6LMvLm7NL4fRKr+kZaMi9dGTfSWhq8WwfTAt+MZEz
 hJ0=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079303"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:04 +0800
IronPort-SDR: 6PckM3KtbKyjrLEqYeoRkmKSeY/FaZsXyK9XEDit5Dac4ZyeQrJnP10rJUOco2ewyn7gbM6sWe
 2uP4AmAyV9AWSg0cf1wE0KU6u8Y4yAXnPzRDedG/cw4ag1D6MNVmx4Xd7wtfV2eITvy6fQgQ3u
 eVIUp44Gg5C02qpGaYAHgkUFYil88u9AEwVaQVhvpUqEVGyNRDqLr671iR+4+pj1DLfj74EmdS
 ENMvDqF3lgsAR+i/Py5bzeNmocmjPs6Zdznl9zOirJgyWRDZkkkWdnUy9T3N6ELn/hS1Q78Iou
 G0H18cGgeP85akcxfoognC0A
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:08 -0800
IronPort-SDR: dNzPwHeL0Y0HsdiO5RbgCWw5NbkvUs09f6HACXWVf3uJo62lGJ18zW3AULbXxjvfEzay/Fqiwj
 Ti4+Ok/5odPXKfyMVNpuPjkqrE0h6iYvNW/XFzgzAudOb9azkDYhuoVU3gNaBud4vKouOyh8Ao
 DrOaW4Ehk2wpJWepXLnw/skilL/a32bxsfTF7tGMtyNhq8nCh3Qzod393PXKbPzMdCRs0lBJgv
 W2WN0Mnas1krFdeveG2FIWFXpUGtHlF+BOmSXXiadqXLPo9q7LUQyxDO+5rdR2G7O8VmOwiavJ
 lQ0=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:02 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 15/32] dt-bindings: Define Kendryte K210 sysctl registers
Date: Sat,  7 Nov 2020 17:14:03 +0900
Message-Id: <20201107081420.60325-16-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031504_737760_2CDC4FFC 
X-CRM114-Status: GOOD (  13.94  )
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

Introduce the dt-bindings file include/dt-bindings/mfd/k210_sysctl.h to
define the offset of all registers of the K210 system controller.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 include/dt-bindings/mfd/k210-sysctl.h | 41 +++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 include/dt-bindings/mfd/k210-sysctl.h

diff --git a/include/dt-bindings/mfd/k210-sysctl.h b/include/dt-bindings/mfd/k210-sysctl.h
new file mode 100644
index 000000000000..5cc386d3c9ca
--- /dev/null
+++ b/include/dt-bindings/mfd/k210-sysctl.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2020 Sean Anderson <seanga2@gmail.com>
+ * Copyright (c) 2020 Western Digital Corporation or its affiliates.
+ */
+#ifndef MFD_K210_SYSCTL_H
+#define MFD_K210_SYSCTL_H
+
+/*
+ * Kendryte K210 SoC system controller registers offsets.
+ * Taken from Kendryte SDK (kendryte-standalone-sdk).
+ */
+#define K210_SYSCTL_GIT_ID	0x00 /* Git short commit id */
+#define K210_SYSCTL_UART_BAUD	0x04 /* Default UARTHS baud rate */
+#define K210_SYSCTL_PLL0	0x08 /* PLL0 controller */
+#define K210_SYSCTL_PLL1	0x0C /* PLL1 controller */
+#define K210_SYSCTL_PLL2	0x10 /* PLL2 controller */
+#define K210_SYSCTL_PLL_LOCK	0x18 /* PLL lock tester */
+#define K210_SYSCTL_ROM_ERROR	0x1C /* AXI ROM detector */
+#define K210_SYSCTL_SEL0	0x20 /* Clock select controller 0 */
+#define K210_SYSCTL_SEL1	0x24 /* Clock select controller 1 */
+#define K210_SYSCTL_EN_CENT	0x28 /* Central clock enable */
+#define K210_SYSCTL_EN_PERI	0x2C /* Peripheral clock enable */
+#define K210_SYSCTL_SOFT_RESET	0x30 /* Soft reset ctrl */
+#define K210_SYSCTL_PERI_RESET	0x34 /* Peripheral reset controller */
+#define K210_SYSCTL_THR0	0x38 /* Clock threshold controller 0 */
+#define K210_SYSCTL_THR1	0x3C /* Clock threshold controller 1 */
+#define K210_SYSCTL_THR2	0x40 /* Clock threshold controller 2 */
+#define K210_SYSCTL_THR3	0x44 /* Clock threshold controller 3 */
+#define K210_SYSCTL_THR4	0x48 /* Clock threshold controller 4 */
+#define K210_SYSCTL_THR5	0x4C /* Clock threshold controller 5 */
+#define K210_SYSCTL_THR6	0x50 /* Clock threshold controller 6 */
+#define K210_SYSCTL_MISC	0x54 /* Miscellaneous controller */
+#define K210_SYSCTL_PERI	0x58 /* Peripheral controller */
+#define K210_SYSCTL_SPI_SLEEP	0x5C /* SPI sleep controller */
+#define K210_SYSCTL_RESET_STAT	0x60 /* Reset source status */
+#define K210_SYSCTL_DMA_SEL0	0x64 /* DMA handshake selector 0 */
+#define K210_SYSCTL_DMA_SEL1	0x68 /* DMA handshake selector 1 */
+#define K210_SYSCTL_POWER_SEL	0x6C /* IO Power Mode Select controller */
+
+#endif /* MFD_K210_SYSCTL_H */
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
