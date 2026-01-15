Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD9BD4660F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JQbWecQfRRRrdhZsHkuZMOABIcGJV4UhuOY6k2oAFs=; b=qyUlxtxrZb1Ly3
	XROqJOsPb8Mu6pJCN3HijUicQ0jUmFjHeJn8TVZ+PrVRiunjRgmuKtIQlVTxBp0ueUClCtpRYWIf5
	E/O14Qh1967yF96OORMhnghwe67glycaAlC/jYdHdUgxZf95ZP4u5AOO/URL3MbJ2ycGXWssYZbhH
	YrH2y3g1uZPGgQTwFNMnpZNE94n9lp8+ATvogpnFeihlJ3vl2QajVf/Im0pad1IlQe3uaIc5tgpSs
	EE2EJwXDfqQefwlub8BNUcaxW0rLNE7zfBdOuy36NQp6EAWP0ucIkqxuQW4r2QEbSdturAbfzPSmT
	mU21lGdNvClF7H0AYCww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrT-0000000D2qx-1Fi6;
	Thu, 15 Jan 2026 19:18:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrQ-0000000D2mN-306s
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:18:25 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42fbc544b09so913708f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 11:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504703; x=1769109503; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bZybh6ajNmTP3emcxjHSZEZGR4b5MsX3LqH44SKh2E=;
        b=WN+MCfx6SmblVTT+Myk92m0rkGsuhlTwHKNHQaHZns2lPCkGCXr8OZdP9NPH36I2i1
         y12Nm/Ix1c1/Flunb8AXYEvvYAExrtyBt5qFBG4fy0EivkONFvRo99Mzbr7NByQV/woH
         LqeePdXtqwqO3B3yMGXSRrMSN8fh6WDTfLUNbHomJUUoMIwC1wadgeYwZ5QqrXjeFphE
         R6nAqJIU6ge3qtbcrQylu/kfxOc+5SuUoIDUzsNnbVwMlR7b6H2UHxHuL9RGynrwOP10
         eNB0I+xqCr6OvQk4dffT7NsMfgmEW8CAYTBVqsInekREHOjcVFWzWpQRSzIA6VUHZuVb
         g/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504703; x=1769109503;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9bZybh6ajNmTP3emcxjHSZEZGR4b5MsX3LqH44SKh2E=;
        b=NO10s0qFCGhRh7Ei2h3fRClQG0Fvtoo39a1mudX1n5sqYb39gHsI+Yc4FCzrfV1hbe
         wzgSSXsVS0m6FlNItbnvSZ1KBLEVJqiY4CQzHFodX9FOlhwGoAjGunToEP70ZW2MgZVX
         xM8a3gRZtemhuiAhTD8QLurA4ssq8C0SxeC3A0Gb0koAfDsdbATfLrYXJOmsCJIAg3kY
         rr7Vehmu07PWW4SjqUrM8R/JlNhoUUD9ddc6/Y6i1cNmtvfCBSh+ngY9Y1LRQ9bK9BBk
         xfMJX8CrD+6f6TFkcSFbT9goemAFShW/wVamPVP2GTYdvk5HtSLRsonsVRW2Sa8WjfpX
         qrfg==
X-Forwarded-Encrypted: i=1; AJvYcCWhFmBhPc/U2JQ9rpyszyUv99KtSt6RV5i99EK+z0TNjYznGt1dgaYF1MREPhaLcSdadjNGp5yjqYOrvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBTetzokNJlzt39ElncRDs+Cf73Pj3OlJLZKluOlLbTOyEuD2+
	1e5AtNLyFEY7zY3KZ20eBPURYaIjC7EMu/sR5T/Ma9VzNpcb0el6Z+bj
X-Gm-Gg: AY/fxX6gFgrwPbr8zEDdSFWf01ge5XlCnX9EZmj4JBoYgWUWq4gvcUSGBv+DuQE6pRU
	eKXUzRGp9bZINovWL/R3eQXfvFwB1Y5rxUuXR5Zu4F2Cb4jQWb8E8+8a02jTT2PhXUS1jJ34QF6
	KTTflC9MJOte60afeIFJJkVeaB3F3KW3vXnkESnFpwDrsCO39XUA9OI52Uw3iwwPk6WjLjfWpVw
	BaP5qFOrDpDus7vkR8WECpnMwdDFWyaxxtNzeUDyznjYbel2yLzRt6FJ57x3vNMdmg7AzB6ENSP
	2K1wu3N8XFwJt/x6BBTk9OzYhMF7n6kXWa9w75saolcXIFzOf555DBWbMmGepPGRlcuklKXy+Au
	GMVJCkcvpCmjQX+aFFiDneC2Fd5rILC6Dng6/k3eZXCzOcHCAMHTY7086ksf0QPbfF+TIOuB9IL
	wHh+n7n7nB506+WPjlh0hViKxarNDHh0F/ldzqy5NmS+wa
X-Received: by 2002:a05:6000:2209:b0:430:f7dc:7e96 with SMTP id ffacd0b85a97d-43569bc59b6mr523652f8f.48.1768504703038;
        Thu, 15 Jan 2026 11:18:23 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:22 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:44 +0400
Subject: [PATCH 7/8] riscv: dts: sophgo: dts nodes for i2s tdm modules
MIME-Version: 1.0
Message-Id: <20260115-cv1800b-i2s-driver-v1-7-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=4041;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=ZvpnRa7g8hCkE7r1q64LPBBaiWff0x2lLnMd+0VKnb0=;
 b=vwb7UYqSlXo3rPP9yGKTfWtMY3ZhNyyOZjfBpq/qKetxn106Ow7lZhWEbkNRzwEkQv1jaiQWa
 4bJ9F94rEA5BNdFZq1EVeJ1mjB3FJd8ZDKSoSUN8dkyyucDYqKQeG9n
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111824_807949_D6E81AFE 
X-CRM114-Status: GOOD (  11.97  )
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

New dts nodes for TDMs and readable DMA names

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 ++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 49 +++++++++++++++++++++++++
 2 files changed, 106 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
new file mode 100644
index 000000000000..6314bf6e9dc8
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv180x-dmamux.h
@@ -0,0 +1,57 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@gmail.com>
+ */
+
+#ifndef _SOPHGO_CV18XX_DMAMUX
+#define _SOPHGO_CV18XX_DMAMUX
+
+#define DMA_I2S0_RX		0
+#define DMA_I2S0_TX		1
+#define DMA_I2S1_RX		2
+#define DMA_I2S1_TX		3
+#define DMA_I2S2_RX		4
+#define DMA_I2S2_TX		5
+#define DMA_I2S3_RX		6
+#define DMA_I2S3_TX		7
+#define DMA_UART0_RX	8
+#define DMA_UART0_TX	9
+#define DMA_UART1_RX	10
+#define DMA_UART1_TX	11
+#define DMA_UART2_RX	12
+#define DMA_UART2_TX	13
+#define DMA_UART3_RX	14
+#define DMA_UART3_TX	15
+#define DMA_SPI0_RX		16
+#define DMA_SPI0_TX		17
+#define DMA_SPI1_RX		18
+#define DMA_SPI1_TX		19
+#define DMA_SPI2_RX		20
+#define DMA_SPI2_TX		21
+#define DMA_SPI3_RX		22
+#define DMA_SPI3_TX		23
+#define DMA_I2C0_RX		24
+#define DMA_I2C0_TX		25
+#define DMA_I2C1_RX		26
+#define DMA_I2C1_TX		27
+#define DMA_I2C2_RX		28
+#define DMA_I2C2_TX		29
+#define DMA_I2C3_RX		30
+#define DMA_I2C3_TX		31
+#define DMA_I2C4_RX		32
+#define DMA_I2C4_TX		33
+#define DMA_TDM0_RX		34
+#define DMA_TDM0_TX		35
+#define DMA_TDM1_RX		36
+#define DMA_AUDSRC		37
+#define DMA_SPI_NAND	38
+#define DMA_SPI_NOR		39
+#define DMA_UART4_RX	40
+#define DMA_UART4_TX	41
+#define DMA_SPI_NOR1	42
+
+#define DMA_CPU_A53		0
+#define DMA_CPU_C906_0	1
+#define DMA_CPU_C906_1	2
+
+#endif // _SOPHGO_CV18XX_DMAMUX
diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..9dd93e028ba9 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "cv18xx-reset.h"
+#include "cv180x-dmamux.h"
 
 / {
 	#address-cells = <1>;
@@ -448,6 +449,54 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@4100000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04100000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S0>, <&clk CLK_SDMA_AUD0>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S0_RX 1>, <&dmamux DMA_I2S0_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s1: i2s@4110000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04110000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S1>, <&clk CLK_SDMA_AUD1>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S1_RX 1>, <&dmamux DMA_I2S1_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s2: i2s@4120000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04120000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S2>, <&clk CLK_SDMA_AUD2>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S2_RX 1>, <&dmamux DMA_I2S2_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
+		i2s3: i2s@4130000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04130000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_APB_I2S3>, <&clk CLK_SDMA_AUD3>;
+			clock-names = "i2s", "mclk";
+			dmas = <&dmamux DMA_I2S3_RX 1>, <&dmamux DMA_I2S3_TX 1>;
+			dma-names = "rx", "tx";
+			status = "disabled";
+		};
+
 		rtc@5025000 {
 			compatible = "sophgo,cv1800b-rtc", "syscon";
 			reg = <0x5025000 0x2000>;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
