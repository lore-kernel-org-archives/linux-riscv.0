Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB756C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:13:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6C6460720
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 16:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A6C6460720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vv38FVnnSAYWDY9zrc7RtXdpm6+arX2g9pu05oYaMVw=; b=VjkEOHSdPgwnW5
	3gFf/S1e6J0PTnore1qZrDrmAmgst80EzMabTBRmb95HcbjnGhhqerNJC+ku5J6uwAZoBLjpaFfcw
	NZoPa6xPn1DlCGdTZEZ9Q//Y6t4xyHamp0o6YGl10B/N0L+jzpoLRl2QIUViKDCWevWdIw/9CDqLc
	2j8l2TBNgXvYK9Yw7nZPAusfoH2IW0xyK3MytgX3/PLTn4841WKVXifOubONik7fJWvj5xaxGF0pR
	Be7GvbRzYClDdn9R9s6Bl1WrasTSliOWYZP4tuQWWi6eoyOEjZMAs4MgTIIbjArhDJEggGUIq5mXQ
	njUM4JJ93kinEizSqcwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhwPC-002GA0-UX; Tue, 02 Nov 2021 16:12:59 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhwOP-002FZu-CB
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 16:12:11 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z20so78248027edc.13
 for <linux-riscv@lists.infradead.org>; Tue, 02 Nov 2021 09:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Ok82EnVbms3xaCc+k3GgiPbyL+Vn/MOKDOz/sHkYac=;
 b=FpAga6kCi7RHSg2HVfSa8xBCK79uBAf4+rCMs7CO+M2Htf90WqGnE+R1S5cB4086kD
 fvtNyduUeraji0GkaX2aWgyV4JEM0EyZ0BN975YDZtFd3sjcMBI8bmlCQFVlEfqkx/Tv
 oVYJWCntPoQMmgvp0XwC2ko8tQiYT4VpoeLEZcspRpYcLgU25W7XiMxyj26iaUBJBmIG
 5/gzUCaWnAiH4SuMy6m/hU+XtVOYlLcPCVcPO9Qsiv4YupUCQDapL2oPMtRda5P2N3bG
 cjp0yRAPtAMIg55eVTxZ3BeFSf6y/XEbbsj0pirVczqY3oY5bL3VE3yWS8SNj8yMKmRS
 aK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0Ok82EnVbms3xaCc+k3GgiPbyL+Vn/MOKDOz/sHkYac=;
 b=wOyDOZC7Fu+jy9puNnIp0kL3oU1a/ay9Dy2U6r93dS86YF9JPUCrGX7EJ2z87Zdg+2
 8T/2z+9g7a7jycp4dkhEKCY8tImDr5b9WFZ3L+5ORi5Ax6QH9CK4CzA8jRAEx3hqDhrd
 2ivRi7H5jvZMvdaa7sGXCVkRcWhusjOix61lc774vyYY55ZBHkGDg2HVm0iqAX6qPjlB
 Y+N2BPbldvOhOVhS4VrYCbCnXkV6lxfoXftDY67X9U74QxCqvSkb59e8Fdz/VT4V1Cog
 7PK/AmC3SsEMFNokaMMVdv+zw0TI84uXVa8eS4qEsNc/6kR884+ZDvqtIB9QwLXiNA//
 4Z0g==
X-Gm-Message-State: AOAM533DlBUKI2mAzslGTOkv0wtB8ZQCo4tZiPEe5TbPqTs02ngMRFZm
 rZLaix3eHq3Vw7yepKXaRBKPBQqB7/eU5A==
X-Google-Smtp-Source: ABdhPJxnMiC7LtTwAPQ6kTTZeKyhxxR6MixNfrXy6ZIEnFS1jdBGaMKrd35Vxf19zFpFtTnXw+YUyA==
X-Received: by 2002:a05:6402:1e8f:: with SMTP id
 f15mr51430884edf.212.1635869527685; 
 Tue, 02 Nov 2021 09:12:07 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id c7sm8451374ejd.91.2021.11.02.09.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 09:12:07 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/16] RISC-V: Add initial StarFive JH7100 device tree
Date: Tue,  2 Nov 2021 17:11:24 +0100
Message-Id: <20211102161125.1144023-16-kernel@esmil.dk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211102161125.1144023-1-kernel@esmil.dk>
References: <20211102161125.1144023-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_091209_484969_992B46E3 
X-CRM114-Status: GOOD (  14.70  )
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

Add initial device tree for the JH7100 RISC-V SoC by StarFive Ltd. This
is a test chip for their upcoming JH7110 SoC.

The CPU and cache data is based on the device tree in the vendor u-boot
port.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 230 +++++++++++++++++++++++
 1 file changed, 230 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100.dtsi

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
new file mode 100644
index 000000000000..69f22f9aad9d
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -0,0 +1,230 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2021 StarFive Technology Co., Ltd.
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+/dts-v1/;
+#include <dt-bindings/clock/starfive-jh7100.h>
+#include <dt-bindings/reset/starfive-jh7100.h>
+
+/ {
+	compatible = "starfive,jh7100";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			compatible = "sifive,u74-mc", "riscv";
+			reg = <0>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+
+		cpu@1 {
+			compatible = "sifive,u74-mc", "riscv";
+			reg = <1>;
+			d-cache-block-size = <64>;
+			d-cache-sets = <64>;
+			d-cache-size = <32768>;
+			d-tlb-sets = <1>;
+			d-tlb-size = <32>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <64>;
+			i-cache-size = <32768>;
+			i-tlb-sets = <1>;
+			i-tlb-size = <32>;
+			mmu-type = "riscv,sv39";
+			riscv,isa = "rv64imafdc";
+			tlb-split;
+
+			cpu1_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+				#interrupt-cells = <1>;
+			};
+		};
+	};
+
+	osc_sys: osc_sys {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	osc_aud: osc_aud {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	gmac_rmii_ref: gmac_rmii_ref {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* Should be overridden by the board when needed */
+		clock-frequency = <0>;
+	};
+
+	gmac_gr_mii_rxclk: gmac_gr_mii_rxclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* Should be overridden by the board when needed */
+		clock-frequency = <0>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		clint: clint@2000000 {
+			compatible = "starfive,jh7100-clint", "sifive,clint0";
+			reg = <0x0 0x2000000 0x0 0x10000>;
+			interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
+					       &cpu1_intc 3 &cpu1_intc 7>;
+		};
+
+		plic: interrupt-controller@c000000 {
+			compatible = "starfive,jh7100-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0xc000000 0x0 0x4000000>;
+			interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9
+					       &cpu1_intc 11 &cpu1_intc 9>;
+			interrupt-controller;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			riscv,ndev = <127>;
+		};
+
+		clkgen: clock-controller@11800000 {
+			compatible = "starfive,jh7100-clkgen";
+			reg = <0x0 0x11800000 0x0 0x10000>;
+			clocks = <&osc_sys>, <&osc_aud>, <&gmac_rmii_ref>, <&gmac_gr_mii_rxclk>;
+			clock-names = "osc_sys", "osc_aud", "gmac_rmii_ref", "gmac_gr_mii_rxclk";
+			#clock-cells = <1>;
+		};
+
+		rstgen: reset-controller@11840000 {
+			compatible = "starfive,jh7100-reset";
+			reg = <0x0 0x11840000 0x0 0x10000>;
+			#reset-cells = <1>;
+		};
+
+		i2c0: i2c@118b0000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x118b0000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_I2C0_CORE>,
+				 <&clkgen JH7100_CLK_I2C0_APB>;
+			clock-names = "ref", "pclk";
+			resets = <&rstgen JH7100_RSTN_I2C0_APB>;
+			interrupts = <96>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@118c0000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x118c0000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_I2C1_CORE>,
+				 <&clkgen JH7100_CLK_I2C1_APB>;
+			clock-names = "ref", "pclk";
+			resets = <&rstgen JH7100_RSTN_I2C1_APB>;
+			interrupts = <97>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		gpio: pinctrl@11910000 {
+			compatible = "starfive,jh7100-pinctrl";
+			reg = <0x0 0x11910000 0x0 0x10000>,
+			      <0x0 0x11858000 0x0 0x1000>;
+			reg-names = "gpio", "padctl";
+			clocks = <&clkgen JH7100_CLK_GPIO_APB>;
+			resets = <&rstgen JH7100_RSTN_GPIO_APB>;
+			interrupts = <32>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		uart2: serial@12430000 {
+			compatible = "starfive,jh7100-uart", "snps,dw-apb-uart";
+			reg = <0x0 0x12430000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_UART2_CORE>,
+				 <&clkgen JH7100_CLK_UART2_APB>;
+			clock-names = "baudclk", "apb_pclk";
+			resets = <&rstgen JH7100_RSTN_UART2_APB>;
+			interrupts = <72>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart3: serial@12440000 {
+			compatible = "starfive,jh7100-uart", "snps,dw-apb-uart";
+			reg = <0x0 0x12440000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_UART3_CORE>,
+				 <&clkgen JH7100_CLK_UART3_APB>;
+			clock-names = "baudclk", "apb_pclk";
+			resets = <&rstgen JH7100_RSTN_UART3_APB>;
+			interrupts = <73>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@12450000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x12450000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_I2C2_CORE>,
+				 <&clkgen JH7100_CLK_I2C2_APB>;
+			clock-names = "ref", "pclk";
+			resets = <&rstgen JH7100_RSTN_I2C2_APB>;
+			interrupts = <74>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@12460000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x0 0x12460000 0x0 0x10000>;
+			clocks = <&clkgen JH7100_CLK_I2C3_CORE>,
+				 <&clkgen JH7100_CLK_I2C3_APB>;
+			clock-names = "ref", "pclk";
+			resets = <&rstgen JH7100_RSTN_I2C3_APB>;
+			interrupts = <75>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
