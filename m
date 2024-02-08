Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DCEC4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LeXcJ0S48vzEpowH0odSHXAbGE3npktidhu2zjIK3U8=; b=QSkE8zvPdl0mDF
	bmmkAgSryiGVTXLxWmE+gbaMTA3hzEjNr494oLv7kFXvaUZ3ZedQ5cYFSumSwtGNG0hfoCR5oR6XR
	FU6czAmJANbLEVAxO59YYNi0RGvIqRkoHJd9HtSUasOh4/hCmIlZSGMl5nUxT0gAw9aTft0GtS78k
	YAZxtq9HBsZfuoNJpEUXDSFGPoioxFJPAVm03/9VOr5QO2WOuNMP0BLIi7wFhngsYMkkZev95HxJU
	CToYbaG/XpM7rxe16Qo2alyjaBaqIMWEmC0kqGHq0EOBmZQq+kAMTbowDBLP1+4M9gNWC0yPSuYpj
	+PbU+z34VcR00VXeLPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lj-0000000DmEF-2k9O;
	Thu, 08 Feb 2024 12:44:43 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lO-0000000Dltx-3aYw
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:44:29 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40efcb37373so16040375e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396261; x=1708001061; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yTEa4/lsVRh49barZX5/hHwmF5ODn+0XbIAzs9ib3A=;
        b=kTpqdwXgltbe6blEgzKkR3cd78zcnxMiRiso1FQnb8FNbFRI7Os+FIHKcnzsp2Y1cU
         6qauPrH9L14lppruZbKekugyrQpTRhAvm4K0FAGNHIKAduNUUzyAJER5ZASrVq/vAgmh
         a2VcymTx3d6kZ+m8Cu4RVipeWwtTgrVmGRkdGV6ScAuufsaGVbwS6eowL+ll4QNAF94k
         FeWDKmAwnIPm0w1kpbrwfEdekzVrS//L9eBsYNJCAl/Mnd86TEGS/eLJajCxV5vS1wWx
         HTrTiaNmK3GQ54d00oLEm2Eru4Zp75bgfjnXhjgc9nSBVmEji4EZ000+SSQqoVJdBsRx
         DAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396261; x=1708001061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6yTEa4/lsVRh49barZX5/hHwmF5ODn+0XbIAzs9ib3A=;
        b=fft2f0QbAr9/uRNX/Adi8sPepVl0Yb0+2KBGBUpfej3EwxiI2e/BftoGzkCPiqKyPi
         ZabpZqT/meJk/jUykV1ZLFBST0WpkjMmYgBrJAaOcakgNGY+CctvQkdAZygXF7W1+QrC
         sV+j6Qsr3PSCzCE5UtopnGqsKEcdO5AlXH1Wy8ZQle1T6kgrfywMu9BZFsar+x3oeb1T
         /+0MdZ//6yKkvBW5JTBtG5P1MybhWjTKo+AOCsxQH0NaSNFxptJ8DBlVHjVrVZpaJESk
         HwSZ8CVrgL8hgp13j/nwS6eaCDSvIsc6Uzu0vxy81+rKIQPf/icxOWS0I6WkmPlf5/Bj
         U8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUHtD13HhsUAD4ZRvuzRfFlBNxpe9VW0YNgiImzUVDs4g6o+KlVWecTyfZf+5NIs6XpceyOcEAIlvly7wIzKuEjJPhM8gHwSmOYMHNOD1ty
X-Gm-Message-State: AOJu0YzQE9xuhoBTgTVRPvsezW/zroBbo70/jTy4YrUpD3gaK4rgQCfz
	6CqVn+boPBp749cyX5lQM38M94AiwEWWITkWf1EGWXTcwPSnzplyGjMtM3627vc=
X-Google-Smtp-Source: AGHT+IGANbj1iqOytgIwqTg4Mq/0gpcdPMAp60+0punCG5pjW18WFbjKTwZGb5kh4i/RgdGw5GaHyw==
X-Received: by 2002:a05:600c:1c9e:b0:40f:c1b7:2556 with SMTP id k30-20020a05600c1c9e00b0040fc1b72556mr7366673wms.11.1707396261396;
        Thu, 08 Feb 2024 04:44:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9Sr/LYarYn0Ydw9Z5UndLl0lPc2rf5eImobbDtGEveI/5qBkV4OQYupRBQfDCMJRJ35YozSSMZas9QWzlnjzZVptnk7zkEZazrYTVw86UYlPS3AI0amTEsE6I1FZTTCY+hKtcasM7WBV0CBCiw8LWCK5V8+EBrXoy+b097mnpz/r7tCy6nox9rqP8L6C/nTjqQwSbamMiJThJ8fRRSO1vtaaCazKwu8e2vMsvJBixIu9GxEvggwQmByZNF0Ftcn2PZ+sei2Tg2ED43jC+Pkt/GSwfzj4BqqDpmdcS/ligPgbTVv4N94S7AmYojqC3XPwLYcTPlsGwptui7xpDuKnOfdMoU91UuSuawHavUuKJrBzwPp3Gk8VKSIXbo2O13LQPhV7Rrq5vTtcWY2ksYI7gP3GUlsypZNX08ORpOoYrg0q6+EI8xVUSuGbFdrQeqxp/s1UyKIEqYLsn9o0yOymBeDmq7b0rAXaZJ+wGnPwDdhKPP0W9GZMM1Ow3IYm8P5oq0ulAfZVqpmXZbInU1pEw6JiKqDGpNY1BXjMkk/DzWiFO5eVGwKSTxx5g6mbiqdQ=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:20 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 17/17] arm64: dts: renesas: r9a09g011: Update #power-domain-cells = <1>
Date: Thu,  8 Feb 2024 14:43:00 +0200
Message-Id: <20240208124300.2740313-18-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044423_365239_1CE4B6CC 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Update CPG #power-domain-cells = <1> and move all the IPs to be part of the
always on power domain as the driver has been modified to support multiple
power domains.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 28 +++++++++++-----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index 50ed66d42a24..74af0f730b89 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -81,7 +81,7 @@ sdhi0: mmc@85000000 {
 				 <&cpg CPG_MOD R9A09G011_SDI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A09G011_SDI0_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -97,7 +97,7 @@ sdhi1: mmc@85010000  {
 				 <&cpg CPG_MOD R9A09G011_SDI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A09G011_SDI1_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -113,7 +113,7 @@ emmc: mmc@85020000  {
 				 <&cpg CPG_MOD R9A09G011_EMM_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A09G011_EMM_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -129,7 +129,7 @@ usb3drd: usb3drd@85070400 {
 				 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
 			clock-names = "axi", "reg";
 			resets = <&cpg R9A09G011_USB_DRD_RESET>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			ranges;
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -144,7 +144,7 @@ usb3host: usb@85060000 {
 					 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
 				clock-names = "axi", "reg";
 				resets = <&cpg R9A09G011_USB_ARESETN_H>;
-				power-domains = <&cpg>;
+				power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 				status = "disabled";
 			};
 
@@ -157,7 +157,7 @@ usb3peri: usb3peri@85070000 {
 					 <&cpg CPG_MOD R9A09G011_USB_PCLK>;
 				clock-names = "axi", "reg";
 				resets = <&cpg R9A09G011_USB_ARESETN_P>;
-				power-domains = <&cpg>;
+				power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 				status = "disabled";
 			};
 		};
@@ -207,7 +207,7 @@ avb: ethernet@a3300000 {
 				 <&cpg CPG_MOD R9A09G011_ETH0_GPTP_EXT>;
 			clock-names = "axi", "chi", "gptp";
 			resets = <&cpg R9A09G011_ETH0_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -220,7 +220,7 @@ cpg: clock-controller@a3500000 {
 			clock-names = "extal";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
-			#power-domain-cells = <0>;
+			#power-domain-cells = <1>;
 		};
 
 		pwc: pwc@a3700000 {
@@ -244,7 +244,7 @@ csi0: spi@a4020000 {
 				 <&cpg CPG_MOD R9A09G011_CPERI_GRPG_PCLK>;
 			clock-names = "csiclk", "pclk";
 			resets = <&cpg R9A09G011_CSI_GPG_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -258,7 +258,7 @@ csi4: spi@a4020200 {
 				 <&cpg CPG_MOD R9A09G011_CPERI_GRPH_PCLK>;
 			clock-names = "csiclk", "pclk";
 			resets = <&cpg R9A09G011_CSI_GPH_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -274,7 +274,7 @@ i2c0: i2c@a4030000 {
 			interrupt-names = "tia", "tis";
 			clocks = <&cpg CPG_MOD R9A09G011_IIC_PCLK0>;
 			resets = <&cpg R9A09G011_IIC_GPA_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -288,7 +288,7 @@ i2c2: i2c@a4030100 {
 			interrupt-names = "tia", "tis";
 			clocks = <&cpg CPG_MOD R9A09G011_IIC_PCLK1>;
 			resets = <&cpg R9A09G011_IIC_GPB_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -311,7 +311,7 @@ wdt0: watchdog@a4050000 {
 			clock-names = "pclk", "oscclk";
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&cpg R9A09G011_WDT0_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -361,7 +361,7 @@ pinctrl: pinctrl@b6250000 {
 				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD R9A09G011_PFC_PCLK>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A09G011_PD_ALWAYS_ON>;
 			resets = <&cpg R9A09G011_PFC_PRESETN>;
 		};
 	};
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
