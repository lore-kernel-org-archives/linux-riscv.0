Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4964CCA5FE1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jan 2026 20:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMsW2AAp9bvRbcUl1g3sgugC+1AICSizX+w6uL4uKNM=; b=J5oy96ireIpyfK
	LLSoFyGlfYiBiD1Hb0mb67yE79wRIRQXwlPVC0Yg9Hcpolz9ytFF/7Fgt3ESMVuH7B4DPlBnwULtE
	Yx4Vi5bDeX/7y45y8iEb+Dtqv0LYwtpzKIOnbYu2cZS41zATc+jvr2HJbFGTxOJ2vtzDEskL1NjbH
	6zG9QNDfoaRyF8mpOl/DCrnZMf5GOBFwIHROTPUIPBpEjj+RnQN9IisHJUPxZR+d5NVDOc3KcJXzy
	BitZdg14xNv/E7tpgdou3ip1yTWlN+FL+cmsgr9Nf846prT5atDnXGb4xZGVoeQ1SZGHcQpZykDiT
	iHHTu9r1PHeU2HuPHUTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhClx-0000000FtVx-1aiT;
	Sat, 17 Jan 2026 20:19:49 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhClv-0000000FtTi-3tyo
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jan 2026 20:19:49 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so19666035e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Jan 2026 12:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768681186; x=1769285986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aFd557jOvMya/P6LqfoMyYvVuvH7cOmI8lbzWePx/N0=;
        b=TzujMGvzCiE6kMMwd71bWylGpZFCFZXYcY79st9ev2HuNDW7c1h013EGKrwabekilL
         hRwZaJFyP44xcVLjighsAZu6ccBs9ECJkb+ge+9PMRYUiCRZD6df4cns28AViLUA64d7
         FtYUI2EyD0auOSV1KHQBGFLlIdI79hByMc7pUT5Ui7+NrUaNMX9jqoZPRUOz/slkA2TO
         /wfZROBV6nz12xWUXqqh9WXj8ddn1gSorxO3Tnj2vKIhXYy0F1lgc9HjMt2X399LnYDZ
         xr5ZIgvlPJ0hdhOuE+kVHVNoMNMSsFY64kMlqG4TByAKw/RlSBvHfreVtTeFURbEh/nk
         pcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768681186; x=1769285986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aFd557jOvMya/P6LqfoMyYvVuvH7cOmI8lbzWePx/N0=;
        b=KjejdNttFGziNVuMd88eWIV46mo2fikQ1ouAQRHF8qZCoXLUWL+lLSNqwwIy7++Qci
         OaH7jYlvvXehqKc+K2/tfSAtRT7gYvI2UGofM/slQPZOl10UsZs/4YJHA+XHjfhScqjP
         quYXHNnU5MICsXWp4NTVLe0v1UXEPzWW+ZPQDVAtdABAeYv9VS57iUrcZSlb5gldZ9QO
         4P6zxppnF310OBqcQBwOmILJsBIHyCuURta4RAyDumXzl27Y5KQOkFUPNC3EKjSEDcza
         WnjqzQjiglbnKw+B7nAXJ0HWTI4llhBC0GsMEdUbhUdQ6kubuQT4akH5slLT27YfrgrF
         fFGA==
X-Forwarded-Encrypted: i=1; AJvYcCUjHvm+q4tDcAfZy4wzHaLBOhmNnwRrRTsamdIDTJXwrjC22qbZ9WJIvBfUyGYUPe1Jtoz74BpcDw+/4g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9cNhrTYoqdBNUFpfY9C9R6Bx7zTbjJ3WqD19+IwoRe67rq6o/
	SSqkbut5r8LLG1pN+prB4j0tsZNN3Lh3zriK7Mhc+zx6oAR95eRBRp10
X-Gm-Gg: AY/fxX66tNff/b1gdmrHT9spPtNd6QRudbC6bWkYaORvxs46J+J2z/ZELTJsOAWmBsi
	hQ08znRAxm+nbwVvIofupEzWgeAj+c7WoIrHNJdmzCZeTYYkZOTxFXkxtkKoJ7q83hQb/sHoRqT
	kZlgKbdjlZj4Iud6lClqsbICIQDRBMpPdC1xIxZQ3OT+j7Lew//RwJl/5ekzGnODV/ydGoaMaIr
	Q5lUFMytyPwvP7eO5ivPhAR5XcoDtFGmSPavIuWjgCWdCfEjodDOq3OpqhD4n3jOa6lregWCqCb
	kMxOoliQiEtbOVwzHB9mVGUDACLr75f6Mc+QgBSp1FR9vNNrvuvLDBzG2ACmtFw2tfzTSUzgMJQ
	TBddfvIvaRBGleMhQEXtfNKsNrDE87fy+j9sRgOdPj7Izzvys2rM5vKF370UWonpKI9oplUtl6t
	i0MmjwaCsDzpYWi0niVPGhUX5SwzDrYDuUVK0THY4rOJ4/
X-Received: by 2002:a05:600c:4f8f:b0:47e:d774:80a6 with SMTP id 5b1f17b1804b1-4801e34e81fmr87603705e9.34.1768681185822;
        Sat, 17 Jan 2026 12:19:45 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879542sm112402295e9.4.2026.01.17.12.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 12:19:45 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Sun, 18 Jan 2026 00:18:59 +0400
Subject: [PATCH v2 7/7] riscv: dts: sophgo: dts nodes for i2s tdm modules
MIME-Version: 1.0
Message-Id: <20260118-cv1800b-i2s-driver-v2-7-d10055f68368@gmail.com>
References: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
In-Reply-To: <20260118-cv1800b-i2s-driver-v2-0-d10055f68368@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768681160; l=4478;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=g4t3ASBfpTD6MsKZ16mnOZXRVvOWIeS8pZgY3yatJ+k=;
 b=IP/61jcli7ye+ePhqXMU/dvjwgiJnBsZKE2W1q/UjFBh0BZ0qWBFmNKibfoStAitWRS+TSq1X
 s+qHIH+9TLWA4M+O7mS88p7iE9XRfRSp62cdieG5oTFmNQ5FOulvhvx
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_121948_001554_B33374B0 
X-CRM114-Status: GOOD (  12.24  )
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

Introduced I2S nodes and internal dac and adc nodes as well
The new header file provided in order to make DMA channel names
more readable.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 +++++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 63 ++++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

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
index 06b0ce5a2db7..5a56951f7e4c 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "cv18xx-reset.h"
+#include "cv180x-dmamux.h"
 
 / {
 	#address-cells = <1>;
@@ -448,6 +449,68 @@ usb: usb@4340000 {
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
+		int_adc: codec@300a100 {
+			compatible = "sophgo,cv1800b-sound-adc";
+			#sound-dai-cells = <0>;
+			reg = <0x300a100 0x100>;
+			status = "disabled";
+		};
+
+		int_dac: codec@300a000 {
+			compatible = "sophgo,cv1800b-sound-dac";
+			#sound-dai-cells = <0>;
+			reg = <0x300a000 0x100>;
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
