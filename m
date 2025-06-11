Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2639AC71135
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRoM2J2ryXrFW67LMgEgqtWjgzGlH0sbLU5wKXz8xsE=; b=YGpw7AulnA/osR
	DZCpH18331rNzp4BlbDnU2BZ0rufyQjPGaXBjjv8rmQuONTXHYoYp0kub2YeyucxsMi9ENfLTfLO1
	DCWPpZG3XgShOoZSDFr8Ed94QlOzaXNPdt4Vy/u66ZS9AzpLzh3sfVGhRvvGkW5+U0IyEp7X1sURv
	YON44fZPnSmLUrKqqS8lLWA1TIL2WHW1jFi6D9BtrYSefbNn7aVpOaugDNR93z+AOUEeW6D8CNecT
	l/pgMyAc4bB5AZ7p12J07d5q4UGd6RnhWHhFd3gM0CoZEPErie7ia//IiH7KkcJtUjqynlFnhzFD9
	wzhp8ltKSU1AoF/5TGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGf2-00000009Emt-2zU0;
	Wed, 11 Jun 2025 08:18:16 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGIH-00000009APt-3GnT
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:54:46 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-7d098f7bd77so71406485a.0
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 00:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628485; x=1750233285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhFbypeFAxQ8f5bzL+8ikB/KiObjW6nRA+DZBhJ2u9A=;
        b=CzbPkTY9SgDdQT0nhoHY6DvYD6Qzn4yFAYvVSYMLtBo92URWYCfCCtzo4VOLXAgtLE
         egmNpwbNKj4ar8kxat/Xr60rRylY2Z0wxL215swV0J/oMxjpStflDVK2WVDLYELiAF+V
         f1pJnIFa0D/LQA7u0KqxSVinJO4nvb0e/Ur/tiLWN0tplmdQ9o/ftnMVr3Rq4aIydghR
         teneBoxtCUCLH3jOLOLtPju0OoTXygScdbBEAMWhIntAQwiaT7NnxPreCvvvorrLh2eh
         oD/yGCSyx35O5Q5Q9ypfhWlVWd7A+fW8IjYSl/kHoj+iUFLMQbXQ7fYjwPaHOEh5yWKT
         8SHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628485; x=1750233285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhFbypeFAxQ8f5bzL+8ikB/KiObjW6nRA+DZBhJ2u9A=;
        b=aWASnJNKUyDt3ThadX5ilKNUXnsDTmbKVDE779HSaHL3zqKTTmRfrkao+1XxiGun2H
         y5sDTtpNi9HtBtfRbrFVUeDKSuUqlIkeo3b+QZtoVKZkunkaBY30u1te/phREry/d8Kl
         I1lwii878C5T1pD9MaPAlN62jU2JV4ENKMIwrqMAOA3LfysyUb6IfFh77SIjT2BlgmkG
         yL/NvlJ/BfVrrJYMSu/tzG3ItfYdzGxdipu5Hac2jzDx3XG+ZCVquE1GrA8qKsOM0nY4
         ikVGDPzWP3OwCdNJALzg9Joppk3fJMzUvjkBKW/GpRja6JS6A0IpUOoIUHr9luls4Mui
         Zhfg==
X-Forwarded-Encrypted: i=1; AJvYcCWqmQI2Qk8JvWAxBIZKIjsPJptBLt/lDBY3/bk07yvsx8LPCOG4ImEkGvoEdk0/QKoL2K0LB86bPs8y2w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfMsnC/C+ZJj5pNwCKqyYaHuU8EIPwgU41QKWB+MK5hw5FkRNQ
	xBOhcr3+pghUnjZHpkODR0BvLhvAMNCp5xj0USgpes9OKHKb4iJWmIYc
X-Gm-Gg: ASbGncuDUb0F2Dy0eeuENGOhIQz69QNPRDY6lbm5ix+VpG9rQ1xwDYkfZTufclzQJdn
	jO3gwZRuiCZgmOzyaA+AiONLs4DbdigSt2aSZOVYvSD4EPTdFfbxXDq1ddoieSfGmmefs6xoYXp
	7OZyEbDNQDfMX/VSNyI2OUbJFhn4LDIdHWfugdZrYYg15D+IwoZBU5w3+zBIVOhRRZikoOmIb/j
	EzZa8CMIGPRyuLSbp34azpCwO0LbRjNtoonJISFK+NbniUu3SPeTb14S0YjyY0wILnA2LBmNU8V
	Xs52vg2CeTSkCwDQ1qodpJKdgNaAshoWXjghZQ==
X-Google-Smtp-Source: AGHT+IG+bZxDKiJkiUxLzUSj6ZSrcG1zMQKfyU+XGW5MIGqNr/oq3BfFTD+gZoUkdiX7PQSX/dupCg==
X-Received: by 2002:a05:620a:460e:b0:7d3:9e56:6345 with SMTP id af79cd13be357-7d3a88088c9mr358828585a.10.1749628484647;
        Wed, 11 Jun 2025 00:54:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d25a60a1dbsm822918885a.56.2025.06.11.00.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:54:44 -0700 (PDT)
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
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 4/4] riscv: dts: sophgo: add reset configuration for Sophgo CV1800 series SoC
Date: Wed, 11 Jun 2025 15:53:18 +0800
Message-ID: <20250611075321.1160973-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611075321.1160973-1-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_005445_838553_B3383FBE 
X-CRM114-Status: UNSURE (   7.48  )
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
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
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
