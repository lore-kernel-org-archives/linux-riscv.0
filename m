Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D545BD2628A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 19:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQQG7wDpex/xB5BHa3spGqkC58oOL1Zb0xdnec1U/oU=; b=Fn/X1cJY3Ugtni
	csjA4JGDXdsLQoSZA7gyLYGO0CMd4X9BCh8d/GzeXne1kZza+ckvYLmnYe/cOquAekHwUL01TRxhZ
	4xA9BsiTaJDwCR9Yz+v6nZqkS6b2nS4NTww0z7VvhgdXfp1CpRPLu4iEwlHcE4+P+zUW16qpZDvqP
	QjstDr9hPG2ZQpyWPn+UuZGNXz0KZe9ORAG+RyAqvVRUmE3c8YepLiuzoRedDEY0oU6ScnQWdFRFT
	WIHkGX5k6KX516Jzce5rPqKhohwJrPtr3XC3Kq17SS9tPqjLiUgk+wOVxxS2ht+JxqTzQtLbMQ7uI
	Ip7NJ+ifsw6TxCUbYiWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3p-00000004KxP-2E2s;
	Tue, 20 Jan 2026 19:06:41 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viH3f-00000004Ktq-3Fb0
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 19:06:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47edffe5540so49699375e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jan 2026 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768935989; x=1769540789; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=P+JkVhHV55EKFLqgkug6yFYXPT6MK/FT5HZu8V5aCZNKkKSVa5olvLZQT1N/U0jyfq
         QWOyn5pvPLtq/CvVFb3L2e7YgXaQOnTTBGat4dXN3GX1Sakhzsj8mZfUZU4pUefw0aFO
         oyMPSFOpmWZXl4H9BJ++uIMtBZLlW9g6tSHDqnudoZa3JGegKnbIkxGAgZJFkts1iUCt
         DXi8ilr4vthLgG+0tUEXGoOTQuVN44DtJB0+sENJdiT2KEb2n9tIMyOho9A5qXngmd20
         vaiRjZJxg0mtSNZLT88YFuslDsPKYeJYdAB+lxVVWOUBvwygqKlVl0C8f0VXek889hsA
         3jwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768935989; x=1769540789;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=uWgOCkYPVgx+SFYCJx7LQN53UTmYmwcFDw8DjXyu1qS/nVSXYEXf31iAvdHjTzwQcL
         udxOfYZoA+SdNR9qY+SKrLFtiIY4rQWFNQ2O7AIs0Qk5X8g4+6lCt+ts2KW2MnD5kn8B
         aehichx58qrNiB0ZRaQgFJp9+R/Wsp5xHJBS0s9dVSybxdEWC6lECuI2pSumY2qPNTce
         zmuTJMMCZ0hc2Nw5Ikao+lFqqTjw/GAHv5oIi9U3nyxPZrNEIlpEtkmRO70boNyOrg4i
         dppV52PTphhI5vurkLfdK8GmvwnAkdp8DlbiAxyOOfebiWcPA6lcVUatoZnB3vw/N0xv
         V5vA==
X-Forwarded-Encrypted: i=1; AJvYcCVw2t7a/8A5i3l4TkTzLCzz/3Qr/uhS6mPubGlEBcE606ysaZZdsRtRDWzKi1/vgob1AupBUM3qxGoAoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQUwrRF4GiQieObNT1QIWAwqIlFB8FN4/sYOhN1f8P2EcsXIkY
	3j5rmzCIHdyarG/C6J6deKPTo7X4eNqMNlTH8No50NsN3wi+RZx0XnC4
X-Gm-Gg: AY/fxX73gwcCSah9/VVXRiEMZj4OMU5pTJuGa0rPwFqPMvKhoHuHYnQGXAe70uLNTOE
	fCM28TQxS0aO6eobFiOja+ClbpI80WRwM8EjlME6Y7RI5rwW82EUbUxVBiIckyD4yVgPxBwcaw8
	c0b8DWbQmZcSy1xBL5dwOD7hqmcA4NydpXGOn6BuC9kqirJ8C50xLN+J6PU3h9rO3qo+Z5aw4LV
	j+6zVDYEdQnzfpM3IKZ4KNc1ez1Ktkq68O0ezVt8Kgw7uVZ+RxOTEp2HQSZAA8y76sEeC7Vww+A
	+F+Pgtp7e/aOfa+aIYqU2WnzrZhhcCiZK15uyZh9pxxDpHgTTnKFCgyk8CCtxGYndwmCZ/GhiJj
	c4bbmykhyZQrBdRFRHhbvmoOhBPf6CMDqi12FteZUXboep6KuSxrwuv/ZZ+oBEDg+Ia6V8ZTSUt
	Tq6rkebiuwGlN/Smup0/Baersu+J6CyWEVoL979cwPzIgl
X-Received: by 2002:a05:600c:1c13:b0:480:1dc6:269c with SMTP id 5b1f17b1804b1-4803e8046a7mr37670375e9.37.1768935989139;
        Tue, 20 Jan 2026 11:06:29 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804244c6cesm2005735e9.0.2026.01.20.11.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 11:06:28 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Tue, 20 Jan 2026 23:06:08 +0400
Subject: [PATCH v4 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
MIME-Version: 1.0
Message-Id: <20260120-cv1800b-i2s-driver-v4-6-6ef787dc6426@gmail.com>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
In-Reply-To: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
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
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768935966; l=4275;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=X+s12PRGw5dEE4UNo2e5A0PjiGovDts5oKNtEN72P90=;
 b=Cwq4vdM8lAMNexXf49piuwk9NPj4tlC29MXQjZSSksluPp5PAggrMazkMg2b0Y8QaQtdqFUDc
 1DAE12pFXwmCl8OKZPgqfeXsmPUQBgO22kRGdD2kMXHTTkzfheVfobG
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_110631_867195_0975B762 
X-CRM114-Status: GOOD (  12.52  )
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
 arch/riscv/boot/dts/sophgo/cv180x-dmamux.h | 57 ++++++++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv180x.dtsi     | 55 ++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+)

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
index 06b0ce5a2db7..ebe5e8113939 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include "cv18xx-reset.h"
+#include "cv180x-dmamux.h"
 
 / {
 	#address-cells = <1>;
@@ -448,6 +449,60 @@ usb: usb@4340000 {
 			status = "disabled";
 		};
 
+		i2s0: i2s@4100000 {
+			compatible = "sophgo,cv1800b-i2s";
+			reg = <0x04100000 0x1000>;
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
