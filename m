Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B87C5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CwqtFAiG6eAYqO/+yC0//fN2F9B05HjAE8kHmRwI9Uw=; b=hRkHBZBAZKna2D
	yhFouAL8+6kdiAH8tkRVXOqFA3rwWb/8ctdUS+g/gZ8+kPmsap8Srz/ny/IXVET7MoLIV0yIjHvIG
	qRYIN86Fe0fRIWxV49EKcG/+mnFgJ0MXPgwrKLkYFu9Bm+PSWTOR1JuFjKG9G6Fd4cF6MNCXZor5X
	8CLSi8Zp1xo93q1R4TAqYTfsdhKkHf+7yurZ1ITo80LDima2vjcUceXvZLxWUsFyoGN2XzILIRZeB
	XILaLZgpE3KwGfCqv2bWx4Ffnw50mrpzHuttk47GowYbWHExu1Ht6SRtvGn0ZueBzxrF04VAR4Zfj
	xlwibn3vKlY20TgEhlTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMh-000000036as-1im9;
	Sun, 08 Jun 2025 23:23:47 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPMe-000000036Zu-28Bk
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:23:45 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6fabb948e5aso40657836d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:23:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425023; x=1750029823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f80/rTjexX6kZx0F6zMPRlo3NF3zV6bgMpBVAmghpHA=;
        b=SJDv6nfpksfMNWzaqIRKRlvYuqB3xFGYcn7X4LHvbB7nv5tOeoxcV9Ffl/tx/WtftE
         oDeDOFpU813cBXF4ARjjl3/iP8mXwSF0RRGgygCRjoMt85a9Q8K8IK8bnwe9eFzrGKet
         PEP4pdcV2KFE2WfCLJ7hDbk/824uzJeEBt/2t6W1IhH/IdKHqsLNEdIJ8n8BYQJXMvnr
         OIu1DmbnoCGyZeKpyLyGijc3GAOvSi/EDQuluezcJO74tRD2XpzNjUKYnm3bXzZUIMqI
         Ihx2tZNRzBa64kTuvrDkk1tY0BdaVDGbH7VGd9l5YqvSoB/Y43qqZIpYfj6Si8S5gGV3
         aI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425023; x=1750029823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f80/rTjexX6kZx0F6zMPRlo3NF3zV6bgMpBVAmghpHA=;
        b=Qa3Jd1YkZ0ZN9VHfxh33h70KZoLBZJJjfKpBQe2gkqT070dVK6sYUdrE4qgaSL947O
         /YjFrfAzphLxa7feRvAzhBMnENB3YjoCtkwsa4hXFlAnP/jr3avaZPxsld+MFSHTRcXg
         AxIOki4Bv9JxTCqGrEIvwELAgRtnIjBoLOAJtrwkRbYvih8X9uxL9I3fubn3ThXj6Qt0
         LcSMMsD82ZBneXUGWcCcqoe7kn9vl4dQbK80lp6R6/gQ3iCxkuoObpDGCVp9Io+alLJb
         A5sMR4yfGPQ805NrU7weWFMthJxmWVZZnbadCyImBZJAXXEqyAwcCR4gQY/X79INjlvv
         yNTw==
X-Forwarded-Encrypted: i=1; AJvYcCVAkaPNYTun2clLwdGL0TNdGEo7pAVGhSKTecYebzO9i7/UOzREGOeXIUsuVVXhzxgpIJOqNBP3v+l7VA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw//1ap3INAhgyD/ximJSkwoXJbUaC39i/rb+5tvOCRYwRYyQwB
	HagwW8NiVentNzARrapuB+kO/fVdDJZJSoOVuT5YeSc5YDc0mBmLOpk9pUQMin8A
X-Gm-Gg: ASbGnct2P3IbatGw+gDNoW4QAj5ltuJb5dnYpTn2bL02B8DK9S88S1sZTxpXA0Fq6sJ
	ELz9vSmgM/gAvEBzkBDg69EsJDCcGiZEJ9Uhz9xH+O6eznEGwkuKJb3TpmbrQJJt4R7xLMjHdme
	i1iY8IRvoMoRXxu3xvT5gQG7byVncP1JzjlnIgNl2bnPYAGq9FkKrafBhD590+6lcPXBvqlohAS
	MBfwuxvGYoYkt/d7M3m+LGQSVEHqVhBzJtubGfm7cQFFciMIg0j0kAMOIoa5MU51Z7zbLBaFqR5
	f6qxHG6ix6o4keNhS2H6IyjoGlKZPqCrTY1dmQ==
X-Google-Smtp-Source: AGHT+IGDR5vCzjnRiL5Bd9DmHdP239tGw9TK/2w6p5uhxMHd8d9XEN7rTINOxss4Gjf2OI+0cHYNfw==
X-Received: by 2002:a05:6214:5017:b0:6f9:51b5:45b4 with SMTP id 6a1803df08f44-6fb08fdc76fmr172715016d6.12.1749425023356;
        Sun, 08 Jun 2025 16:23:43 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09b36759sm44140746d6.121.2025.06.08.16.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:23:43 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
Date: Mon,  9 Jun 2025 07:22:10 +0800
Message-ID: <20250608232214.771855-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232214.771855-1-inochiama@gmail.com>
References: <20250608232214.771855-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162344_546658_2B42C5CA 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

Add known reset configuration for existed device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 4c3d16764131..e91bb512b099 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -36,6 +36,7 @@ gpio0: gpio@3020000 {
 			reg = <0x3020000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO0>;
 
 			porta: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -54,6 +55,7 @@ gpio1: gpio@3021000 {
 			reg = <0x3021000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO1>;
 
 			portb: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -72,6 +74,7 @@ gpio2: gpio@3022000 {
 			reg = <0x3022000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO2>;
 
 			portc: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -90,6 +93,7 @@ gpio3: gpio@3023000 {
 			reg = <0x3023000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			resets = <&rst RST_GPIO3>;
 
 			portd: gpio-controller@0 {
 				compatible = "snps,dw-apb-gpio-port";
@@ -133,6 +137,7 @@ i2c0: i2c@4000000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(33) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C0>;
 			status = "disabled";
 		};
 
@@ -144,6 +149,7 @@ i2c1: i2c@4010000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C1>;
 			status = "disabled";
 		};
 
@@ -155,6 +161,7 @@ i2c2: i2c@4020000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C2>;
 			status = "disabled";
 		};
 
@@ -166,6 +173,7 @@ i2c3: i2c@4030000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C3>;
 			status = "disabled";
 		};
 
@@ -177,6 +185,7 @@ i2c4: i2c@4040000 {
 			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
 			clock-names = "ref", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_I2C4>;
 			status = "disabled";
 		};
 
@@ -188,6 +197,7 @@ uart0: serial@4140000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART0>;
 			status = "disabled";
 		};
 
@@ -199,6 +209,7 @@ uart1: serial@4150000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART1>;
 			status = "disabled";
 		};
 
@@ -210,6 +221,7 @@ uart2: serial@4160000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART2>;
 			status = "disabled";
 		};
 
@@ -221,6 +233,7 @@ uart3: serial@4170000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART3>;
 			status = "disabled";
 		};
 
@@ -232,6 +245,7 @@ spi0: spi@4180000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI0>;
 			status = "disabled";
 		};
 
@@ -243,6 +257,7 @@ spi1: spi@4190000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI1>;
 			status = "disabled";
 		};
 
@@ -254,6 +269,7 @@ spi2: spi@41a0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(40) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI2>;
 			status = "disabled";
 		};
 
@@ -265,6 +281,7 @@ spi3: spi@41b0000 {
 			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
 			clock-names = "ssi_clk", "pclk";
 			interrupts = <SOC_PERIPHERAL_IRQ(41) IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rst RST_SPI3>;
 			status = "disabled";
 		};
 
@@ -276,6 +293,7 @@ uart4: serial@41c0000 {
 			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
+			resets = <&rst RST_UART4>;
 			status = "disabled";
 		};
 
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
