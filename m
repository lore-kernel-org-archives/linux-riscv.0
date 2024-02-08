Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC2AC4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1jdg+XeEzd5mfC9S5MblpCXFLlcwjpVgQxGQCUBDW8=; b=HGNoIYgmpa1PZg
	hm+0l6zLkz9/Mf+15uNiMb/pL12T4JaNyDQ2y1BSNb3MK538ra9uQWaLvKP+7f3qCs+1bsYtZ2WM5
	YDVz5kjzS/0wAx+kNCcbATjMCArINlff4pOLpuyORuthPaTOBNoSDn9wuE/znn5IsIRJuRok6J6Fn
	XyHN6Q6EiSf5rU1nnZmUHKMztn0CfwxvNKFuO05AFUIinFZrE6zyYHu8jHNZwIIJn4WFTGFYnqWdy
	tijuU1ZfwWvLffBo2k6JQzZESmZiuGVCS4bvdXq6xpJYvjRCPihsA+S0QVF2bGQSsZALcOgTCGXAj
	2rvMQpXKkWDZk2YZnBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lW-0000000Dm0x-1lrH;
	Thu, 08 Feb 2024 12:44:30 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lH-0000000Dlkw-2K0O
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:44:26 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5116bf4dcf4so1120797e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396252; x=1708001052; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o1OEC2TGCoY61eo3wIHDOREKTL6pfLj41IN2rZ/kx+k=;
        b=KoJQPDdEWyfaqHm+COj4XPu+Xpg7LcMZv5/NbGrl1gpftM37pEz2AaxM5VmuYphprp
         KFxMdEcKLN1D3sSc7LO08L8VKsFbc2gjZz0AVm5GzzI3fYmdfSkxoqjY5OJI83Lk9OBn
         mxRJTNuFgg0vpVutRvdy8qoJTaUc9CoMXfRYCUlE4kpWCJq5iu7+fAxtltcYUV3Y9Jg6
         TO6b1GOY/dblohgM0kGifVGyNQOLdPYCyU6RkYjJrUVl6F+8HCogLdpgU7uyEx+jPnGn
         AnPPM2h9IG4x/+RNW1COMRKxBU/FYbJEdw+qeEA67T66MXgJFiVDUM8YzmM+hlVp0l+j
         kf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396252; x=1708001052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o1OEC2TGCoY61eo3wIHDOREKTL6pfLj41IN2rZ/kx+k=;
        b=rYUPDCGsndgfKm/ouNEZeq95dVgMrog0+TCl1mPYC44NOdBe4Yl40Xmq/UDiM0yIBn
         jgHmhCXv4oxzQwd+fMrfsDMW0w6/prNf8NJOV/+2hrSoRISxnI09atXpcRReBHEdH1Gx
         n3zDZ97eWTUkhqSJWfIikUWhWPVczCFUvoVqpK0YPMG6gWOv5fz4/v3CnoSbCJCDtGcM
         d7gcSdgcP2L7v7OHEUzP4XY3rvjUXQjoMCd7iJEeG9McJ1ZBD2jfzUVqyCKikvLFM3pr
         epxFaDj98BMMbdYjNOLFCeXhsiDjlUwqPUz/Sx8cMBg6whM+K/+BQZ5Lbw+6lTsfaozG
         3+VA==
X-Gm-Message-State: AOJu0Ywh2AHlGMBDuR/p/ckHAOHyWoYe3l1jfSBGtqyVJYCkYmNiPEwq
	LoDYBvzhoc9itPbYEzIOHefT9ujXU4KVJ6xLw3UZ3dQCpSGAwnS3LJ9BZuQNkiQ=
X-Google-Smtp-Source: AGHT+IFuY8aJN8uAbwsfcvyYL2SSxdbplBVBbG1hcv48UfkKaNutTJ7x4FhnQPP25P1zzLOULgHIFA==
X-Received: by 2002:ac2:51b9:0:b0:511:552e:6ee3 with SMTP id f25-20020ac251b9000000b00511552e6ee3mr5708379lfk.39.1707396252359;
        Thu, 08 Feb 2024 04:44:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjpYGt1NJEfb6j/M95q9qoJUByI0mWDph51t57B6nJclQ4TZTsbk/7rtb2zpzqxYplrNcFELwfgJOBgmdMX8jSxHyFN20zXgZMO2s/FeNUMO5mCmcNGaAtZPtcMcLtIXj6ewiVc8R3mx8C1jn5ZmqZ/vjUZEWF/XIAYByb+A/59AVZWuPaqUROjEmOH1rObLvH8xiXlABoyztj4sl9kEX96ezV214lXsNCJb7CLmMIvRA6hlXjmM3mD0hyisAdCJa49moxdVhatpLBLPMlL0PO3tZdGYPF2tV5/4H0eGzUu0w9PMIkSxYCeEcNir4wC8iCdvgsAr2ZbT4ndmkVLigPYMs7XJ3vMhYWttfcABT0luynyK7u3xMeAlFhiJOFckPdnrytjuX5M0zRZXZ2BHP7itUWh2yYjXuHZvAvmrsQt3mOx/92Bro2nOQENJbcsEzmQ/nEAwFajz/cWrcdqwEZUbnHDN1DMEatjvC61VH7/o/mNFSVAzPsft8B/p0/r4MVrSz7fdqV3EzM9Iwqq++T9ARF67ye6K0PbknzRP2ARsoN3Yu1TcRXx55WwrIgN14=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:12 -0800 (PST)
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
Subject: [PATCH 13/17] arm64: dts: renesas: r9a07g043: Update #power-domain-cells = <1>
Date: Thu,  8 Feb 2024 14:42:56 +0200
Message-Id: <20240208124300.2740313-14-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044416_286975_A13D80AD 
X-CRM114-Status: UNSURE (   9.41  )
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
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi  | 84 ++++++++++-----------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi |  6 +-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi |  2 +-
 3 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 8721f4c9fa0f..3e12f9dd3c6a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -138,7 +138,7 @@ mtu3: timer@10001200 {
 					  "tgia8", "tgib8", "tgic8", "tgid8",
 					  "tciv8", "tciu8";
 			clocks = <&cpg CPG_MOD R9A07G043_MTU_X_MCK_MTU3>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_MTU_X_PRESET_MTU3>;
 			#pwm-cells = <2>;
 			status = "disabled";
@@ -159,7 +159,7 @@ ssi0: ssi@10049c00 {
 			resets = <&cpg R9A07G043_SSI0_RST_M2_REG>;
 			dmas = <&dmac 0x2655>, <&dmac 0x2656>;
 			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
@@ -179,7 +179,7 @@ ssi1: ssi@1004a000 {
 			resets = <&cpg R9A07G043_SSI1_RST_M2_REG>;
 			dmas = <&dmac 0x2659>, <&dmac 0x265a>;
 			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
@@ -198,7 +198,7 @@ ssi2: ssi@1004a400 {
 			resets = <&cpg R9A07G043_SSI2_RST_M2_REG>;
 			dmas = <&dmac 0x265f>;
 			dma-names = "rt";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
@@ -218,7 +218,7 @@ ssi3: ssi@1004a800 {
 			resets = <&cpg R9A07G043_SSI3_RST_M2_REG>;
 			dmas = <&dmac 0x2661>, <&dmac 0x2662>;
 			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			#sound-dai-cells = <0>;
 			status = "disabled";
 		};
@@ -234,7 +234,7 @@ spi0: spi@1004ac00 {
 			resets = <&cpg R9A07G043_RSPI0_RST>;
 			dmas = <&dmac 0x2e95>, <&dmac 0x2e96>;
 			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -252,7 +252,7 @@ spi1: spi@1004b000 {
 			resets = <&cpg R9A07G043_RSPI1_RST>;
 			dmas = <&dmac 0x2e99>, <&dmac 0x2e9a>;
 			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -270,7 +270,7 @@ spi2: spi@1004b400 {
 			resets = <&cpg R9A07G043_RSPI2_RST>;
 			dmas = <&dmac 0x2e9d>, <&dmac 0x2e9e>;
 			dma-names = "tx", "rx";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			num-cs = <1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -291,7 +291,7 @@ scif0: serial@1004b800 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G043_SCIF0_CLK_PCK>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_SCIF0_RST_SYSTEM_N>;
 			status = "disabled";
 		};
@@ -310,7 +310,7 @@ scif1: serial@1004bc00 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G043_SCIF1_CLK_PCK>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_SCIF1_RST_SYSTEM_N>;
 			status = "disabled";
 		};
@@ -329,7 +329,7 @@ scif2: serial@1004c000 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G043_SCIF2_CLK_PCK>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_SCIF2_RST_SYSTEM_N>;
 			status = "disabled";
 		};
@@ -348,7 +348,7 @@ scif3: serial@1004c400 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G043_SCIF3_CLK_PCK>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_SCIF3_RST_SYSTEM_N>;
 			status = "disabled";
 		};
@@ -367,7 +367,7 @@ scif4: serial@1004c800 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A07G043_SCIF4_CLK_PCK>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_SCIF4_RST_SYSTEM_N>;
 			status = "disabled";
 		};
@@ -382,7 +382,7 @@ sci0: serial@1004d000 {
 			interrupt-names = "eri", "rxi", "txi", "tei";
 			clocks = <&cpg CPG_MOD R9A07G043_SCI0_CLKP>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_SCI0_RST>;
 			status = "disabled";
 		};
@@ -397,7 +397,7 @@ sci1: serial@1004d400 {
 			interrupt-names = "eri", "rxi", "txi", "tei";
 			clocks = <&cpg CPG_MOD R9A07G043_SCI1_CLKP>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_SCI1_RST>;
 			status = "disabled";
 		};
@@ -425,7 +425,7 @@ canfd: can@10050000 {
 			resets = <&cpg R9A07G043_CANFD_RSTP_N>,
 				 <&cpg R9A07G043_CANFD_RSTC_N>;
 			reset-names = "rstp_n", "rstc_n";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 
 			channel0 {
@@ -454,7 +454,7 @@ i2c0: i2c@10058000 {
 			clocks = <&cpg CPG_MOD R9A07G043_I2C0_PCLK>;
 			clock-frequency = <100000>;
 			resets = <&cpg R9A07G043_I2C0_MRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -476,7 +476,7 @@ i2c1: i2c@10058400 {
 			clocks = <&cpg CPG_MOD R9A07G043_I2C1_PCLK>;
 			clock-frequency = <100000>;
 			resets = <&cpg R9A07G043_I2C1_MRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -498,7 +498,7 @@ i2c2: i2c@10058800 {
 			clocks = <&cpg CPG_MOD R9A07G043_I2C2_PCLK>;
 			clock-frequency = <100000>;
 			resets = <&cpg R9A07G043_I2C2_MRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -520,7 +520,7 @@ i2c3: i2c@10058c00 {
 			clocks = <&cpg CPG_MOD R9A07G043_I2C3_PCLK>;
 			clock-frequency = <100000>;
 			resets = <&cpg R9A07G043_I2C3_MRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -534,7 +534,7 @@ adc: adc@10059000 {
 			resets = <&cpg R9A07G043_ADC_PRESETN>,
 				 <&cpg R9A07G043_ADC_ADRST_N>;
 			reset-names = "presetn", "adrst-n";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 
 			#address-cells = <1>;
@@ -554,7 +554,7 @@ tsu: thermal@10059400 {
 			reg = <0 0x10059400 0 0x400>;
 			clocks = <&cpg CPG_MOD R9A07G043_TSU_PCLK>;
 			resets = <&cpg R9A07G043_TSU_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -568,7 +568,7 @@ sbc: spi@10060000 {
 			clocks = <&cpg CPG_MOD R9A07G043_SPI_CLK2>,
 				 <&cpg CPG_MOD R9A07G043_SPI_CLK>;
 			resets = <&cpg R9A07G043_SPI_RST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -581,7 +581,7 @@ cpg: clock-controller@11010000 {
 			clock-names = "extal";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
-			#power-domain-cells = <0>;
+			#power-domain-cells = <1>;
 		};
 
 		sysc: system-controller@11020000 {
@@ -599,7 +599,7 @@ pinctrl: pinctrl@11030000 {
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			clocks = <&cpg CPG_MOD R9A07G043_GPIO_HCLK>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_GPIO_RSTN>,
 				 <&cpg R9A07G043_GPIO_PORT_RESETN>,
 				 <&cpg R9A07G043_GPIO_SPARE_RESETN>;
@@ -635,7 +635,7 @@ dmac: dma-controller@11820000 {
 			clocks = <&cpg CPG_MOD R9A07G043_DMAC_ACLK>,
 				 <&cpg CPG_MOD R9A07G043_DMAC_PCLK>;
 			clock-names = "main", "register";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			resets = <&cpg R9A07G043_DMAC_ARESETN>,
 				 <&cpg R9A07G043_DMAC_RST_ASYNC>;
 			reset-names = "arst", "rst_async";
@@ -655,7 +655,7 @@ sdhi0: mmc@11c00000 {
 				 <&cpg CPG_MOD R9A07G043_SDHI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A07G043_SDHI0_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -671,7 +671,7 @@ sdhi1: mmc@11c10000 {
 				 <&cpg CPG_MOD R9A07G043_SDHI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A07G043_SDHI1_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -689,7 +689,7 @@ eth0: ethernet@11c20000 {
 				 <&cpg CPG_CORE R9A07G043_CLK_HP>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A07G043_ETH0_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -709,7 +709,7 @@ eth1: ethernet@11c30000 {
 				 <&cpg CPG_CORE R9A07G043_CLK_HP>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A07G043_ETH1_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -721,7 +721,7 @@ phyrst: usbphy-ctrl@11c40000 {
 			reg = <0 0x11c40000 0 0x10000>;
 			clocks = <&cpg CPG_MOD R9A07G043_USB_PCLK>;
 			resets = <&cpg R9A07G043_USB_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			#reset-cells = <1>;
 			status = "disabled";
 		};
@@ -736,7 +736,7 @@ ohci0: usb@11c50000 {
 				 <&cpg R9A07G043_USB_U2H0_HRESETN>;
 			phys = <&usb2_phy0 1>;
 			phy-names = "usb";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -750,7 +750,7 @@ ohci1: usb@11c70000 {
 				 <&cpg R9A07G043_USB_U2H1_HRESETN>;
 			phys = <&usb2_phy1 1>;
 			phy-names = "usb";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -765,7 +765,7 @@ ehci0: usb@11c50100 {
 			phys = <&usb2_phy0 2>;
 			phy-names = "usb";
 			companion = <&ohci0>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -780,7 +780,7 @@ ehci1: usb@11c70100 {
 			phys = <&usb2_phy1 2>;
 			phy-names = "usb";
 			companion = <&ohci1>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -793,7 +793,7 @@ usb2_phy0: usb-phy@11c50200 {
 				 <&cpg CPG_MOD R9A07G043_USB_U2H0_HCLK>;
 			resets = <&phyrst 0>;
 			#phy-cells = <1>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -806,7 +806,7 @@ usb2_phy1: usb-phy@11c70200 {
 				 <&cpg CPG_MOD R9A07G043_USB_U2H1_HCLK>;
 			resets = <&phyrst 1>;
 			#phy-cells = <1>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -825,7 +825,7 @@ hsusb: usb@11c60000 {
 			renesas,buswait = <7>;
 			phys = <&usb2_phy0 3>;
 			phy-names = "usb";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -840,7 +840,7 @@ wdt0: watchdog@12800800 {
 				     <SOC_PERIPHERAL_IRQ(50) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "wdt", "perrout";
 			resets = <&cpg R9A07G043_WDT0_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -851,7 +851,7 @@ ostm0: timer@12801000 {
 			interrupts = <SOC_PERIPHERAL_IRQ(46) IRQ_TYPE_EDGE_RISING>;
 			clocks = <&cpg CPG_MOD R9A07G043_OSTM0_PCLK>;
 			resets = <&cpg R9A07G043_OSTM0_PRESETZ>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -862,7 +862,7 @@ ostm1: timer@12801400 {
 			interrupts = <SOC_PERIPHERAL_IRQ(47) IRQ_TYPE_EDGE_RISING>;
 			clocks = <&cpg CPG_MOD R9A07G043_OSTM1_PCLK>;
 			resets = <&cpg R9A07G043_OSTM1_PRESETZ>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 
@@ -873,7 +873,7 @@ ostm2: timer@12801800 {
 			interrupts = <SOC_PERIPHERAL_IRQ(48) IRQ_TYPE_EDGE_RISING>;
 			clocks = <&cpg CPG_MOD R9A07G043_OSTM2_PCLK>;
 			resets = <&cpg R9A07G043_OSTM2_PRESETZ>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index 01d08ebb4a78..1ac71b9cbbb6 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -75,7 +75,7 @@ cru: video@10830000 {
 		resets = <&cpg R9A07G043_CRU_PRESETN>,
 			 <&cpg R9A07G043_CRU_ARESETN>;
 		reset-names = "presetn", "aresetn";
-		power-domains = <&cpg>;
+		power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 		status = "disabled";
 
 		ports {
@@ -106,7 +106,7 @@ csi2: csi2@10830400 {
 		resets = <&cpg R9A07G043_CRU_PRESETN>,
 			 <&cpg R9A07G043_CRU_CMN_RSTB>;
 		reset-names = "presetn", "cmn-rstb";
-		power-domains = <&cpg>;
+		power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 		status = "disabled";
 
 		ports {
@@ -194,7 +194,7 @@ irqc: interrupt-controller@110a0000 {
 		clocks = <&cpg CPG_MOD R9A07G043_IA55_CLK>,
 			<&cpg CPG_MOD R9A07G043_IA55_PCLK>;
 		clock-names = "clk", "pclk";
-		power-domains = <&cpg>;
+		power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 		resets = <&cpg R9A07G043_IA55_RESETN>;
 	};
 
diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
index 09ef10b39f46..925203746b28 100644
--- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -62,7 +62,7 @@ plic: interrupt-controller@12c00000 {
 		interrupt-controller;
 		reg = <0x0 0x12c00000 0 0x400000>;
 		clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
-		power-domains = <&cpg>;
+		power-domains = <&cpg R9A07G043_PD_ALWAYS_ON>;
 		resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
 		interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
 	};
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
