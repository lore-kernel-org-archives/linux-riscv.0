Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499E5D29C40
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SQQG7wDpex/xB5BHa3spGqkC58oOL1Zb0xdnec1U/oU=; b=KBwDp3PplvKNyB
	9HZ5NxeTlw+3YWzZKK+TlSN+NlpyOIljt56DPUw/+E511kBFC0lD0SlnyudC4TxEplEomQGqXUbkl
	4E/zQcmKRaSHrGVQmnZAqgYltm84MVdJe39dHgyhb5yufs3Y1HcrTYqQ8mpJ0TihZG90pxsQCzLmq
	CGG1sYP96OHd7raok6cFgE3y2OGT6FS1qft2L9JrDCIQNIxpwWF8DJbZfK3qvLCeQb/eVacMOyAbm
	fsufuHGu3RWsMhfK+j+67v1Lc6xtoYHArEFOSQ2NtS9WQgV0gj9VQefQcW/dLClcGlE0YRNmn8RNT
	IZcPwyh4NV4tGf5JzXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsAT-00000002VLx-1W4w;
	Mon, 19 Jan 2026 16:31:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhs9k-00000002VBC-3KEC
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 16:31:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso29599255e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 08:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768840267; x=1769445067; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=WeXlKG1w6YTH7TmG8qMggQw0qJgjuRW68ZZq+FkPSljzkko4sY8W/kKwnBpGd/KlvX
         fhYnSDDGYfErua/cSpq3Mt5TILlKisOMTybFdRucBIZEKWQqW7pQN/PPmQv5+jwukXtp
         m9t4UY5KttSQO4ymIE9yyBSNa1B4+tqsDyIhL58+AgY6gLr9QvzoDyzXa0dTkxJfoBDO
         c5FJByEQif5+Ck+3J1EPHAjMpiikkzsw3nnUNJpt1TfOjNhGjZRBDa8XIVjCpH1nETaZ
         578ujdS1IcuNMlsfI/W42NIlSeAQYvgRvZwnpnYEOrZLrx6VF2TJ3g1Fvk5aUSFtb7yh
         rQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768840267; x=1769445067;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNGQeFUv68F6qppT5//wf2zYpim+0plexrvmi4qsXjc=;
        b=VLMK6BN1QOE7kdTBwXsXd7mVxmC+/cQJzGPPk3uX6VGeFFem1BERA7i8LKOGVq1maR
         BE79fGqbHzlzRvrkFAHDuOl/JzQ+JHPiQhgpUzMdq39V+hEA9hKt023evn0EW5vofuEf
         M2nR70cc0WgXqu6/hUHOs9AlX2XpXuYgy0fxYFyxi/6Oy846BhHAV7sMJZjAKTXLffCy
         cJyboZ/2M3jahEu/L0Amrqa46RuJTf3bUPsipNKx8EkgQVyLoDygdgT6zTvgfCgTbPY2
         pS9hZFk/KbvI+2dZrU3GpCarqfXLXJjavmKIPTCyacprYGHaFYj1PY2+f6KxGAfr0XtJ
         czNg==
X-Forwarded-Encrypted: i=1; AJvYcCX4yrkgnMFFsfrQEa1m91CsajkDRJ3zSrziw0MO2arB7ufFvSu7lcarXOgX7a8WjoOM+pGIPEInUxHIVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDrYLsWRJZEJkH0KPTrWTNvVF8jNH+PeXmmUpmM2K8tD1cM9Hh
	rYuBxlquinZzYqQqYG8Z4yuPfcAHUD9Yj4n1YuciBTWNNYi9UDuwNXiX
X-Gm-Gg: AY/fxX7SHQ8JNDJ1rgCcaFb9qtYxB9Bk+nWU/bC3/75G4mShZP6Bk1ttHExpPkBVkF8
	5w/J8EwuFSthEj3kfC6admQ0WUxItuuKxYSY5J9RAMX1neS3e0e4kny/QyEJEXbKIiY4WFmXjx4
	Yrqkmbc3vOKPvlD4f8QqTQWLsRWbCNUV3asOYZ0ago0Lt1K6xzdxBDTkTjve/1nFePCb8BXcQoo
	2h1LXooEVK4SIbqMA8x3YcAuRbZ2Epb7UVafmqJJGSqHS30sjP6KeYlxfr1fTCRBKTGPY5Htes/
	Pmp6ZJLP+PsevoKHTMyo4D3ebSNb0zPD2sgkPNig4B/c4ZuCZuIfJJA2bKK3sQPMRpF9qio/DSE
	BFAOLVu+8HqxtrTfPXLadew5SF7x4m1OLvKCO6ifdew2qL8GBb00NSrrOFP5+1lwUsUswU1axyn
	J/5PgfAARBD9ei4Zfe9Y/d+QJWE1QXJ84HlVC5EfeXIpIu
X-Received: by 2002:a05:600c:3484:b0:46e:59bd:f7e2 with SMTP id 5b1f17b1804b1-4801e670bf9mr159794485e9.11.1768840266726;
        Mon, 19 Jan 2026 08:31:06 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e879537sm201666795e9.5.2026.01.19.08.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 08:31:06 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Mon, 19 Jan 2026 20:30:47 +0400
Subject: [PATCH v3 6/6] riscv: dts: sophgo: dts nodes for i2s tdm modules
MIME-Version: 1.0
Message-Id: <20260119-cv1800b-i2s-driver-v3-6-04006f4111d7@gmail.com>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768840243; l=4275;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=X+s12PRGw5dEE4UNo2e5A0PjiGovDts5oKNtEN72P90=;
 b=r9Z1y74tcJ8gis3RDlg74cE+YXsoSshHRNU33vg0Nu0vl7bHYJmVj2LjZTiPZ8Sjv9vKTCkv5
 kS1aMfQsPoUCC57nRHqqNt4XubsJOaZPwNoX290TDNqfFrgV2YiTRLS
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_083137_541304_06CA99D2 
X-CRM114-Status: GOOD (  12.72  )
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
