Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AAF6C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4G/fDOeslWwFi6i5j5DFJS9mTI/fD2MG0PhyQe4suY8=; b=W6QDSFkD/OUCdw
	qBo7m0OW8pdn/Pp9zDY9wo6vGZzInCOTnv+VccGk4VMb2atMMUEOJOko/UruCk1h0jY13lYdaEUsz
	z82N9sVsjZDyj6aZRBfzcrRInCL4Sp0FAoOFPS53oKdAReyKdNKDL0Cujz7OfneEpAO6ifC4R+btB
	lDYI+9IsRx1Q2ZCqcHvpJ55pLkjAaqD0pBGX1ezg7dbKGqrfUuGhGEHo3l56hBJ3QiS/jzgduQQg/
	cDiUNBLbHoCdMN+cb8zVhuX4l6cqluXoHTzUlxCE37iaZ0V5XGYpCpvL6tzeOJGCITJUvcNWSp3C+
	qs9SwWD8+2zNM62CWIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lb-0000000Dm5Y-1VN6;
	Thu, 08 Feb 2024 12:44:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lO-0000000Dlsf-1Ffd
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:44:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40fd72f7125so15209985e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396259; x=1708001059; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpJ+A6WuI8qVYR+ufe285R9BOl0SnuSgZcst9eKsxpE=;
        b=UaJNRz1r/SFTQo7osypbj9yHQUSBQ5jOmtaScnIQF9oClZlh7Y8yO9/SuAW9YLY7Py
         is02KGn85M5/rA5VxVwNFmJI8elpQ09VRDVLh+Zoz4/1BRdfqrldqk3CCSXpk/AYgBcB
         odasT2kO5go9JU/40pAHX5u/Ybk1kFPyII7lPwK00ZmnySuMZ7t4W+85ZoRJr1aANU7Y
         RiANBxmug8U6mrQSaoGyCxZoQ7edz39jZpApd3TVF6kuNaQwKLAadDzED1tXIb0cP8J1
         ypaCmql/DAPZjHxJSPt5TfVJsFOmPd3T9d8G4CDH1ISzLq5oN02wEKsSUTRc3s0xR8yE
         yu6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396259; x=1708001059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BpJ+A6WuI8qVYR+ufe285R9BOl0SnuSgZcst9eKsxpE=;
        b=s73rOFTwubvRvLnzPxPlukoNeWLCQeP+oQDMJ7ESNtZVOTfLX+v5GqABuOXIZjGRtD
         MUBOAgagFfbsvVDgZA5SXElX9M2XWYWLEdbm87Eei5bCzqqMyz4jWUia+UUs5XXrb7s2
         /yMM9Dkp6G+4THSiF3oliT+qE8m6b3SNycst0rVyZ87DTdTTkFfh7qpCqLsROkmjV+me
         /IfuKCfQn55XXis2oXC2o/Vms4K5N1HcYiYs1Vsq0ViReFeWJALMx1dW6vOO1DOGkrqw
         Zj8/GQhXCY72oGEIVZRYYUbHJ93Qd3rvLi/YjoTQzsU5n3RKCyccP4BrgNchdPcBJ7yH
         pDUQ==
X-Gm-Message-State: AOJu0YyR6+chgkvTIZhfX/PG/6L9lkYIeoaqbWqLSAC1l1g+iUIrk5aF
	OeG5KWU9xatNe+kWXefzKFM9wj1r9xTQS15Nzn3A/V9LniAwXosHLYER4COd7JY=
X-Google-Smtp-Source: AGHT+IEVOZm0VWUSOovYKJ223+YVNHrjrhAtzw+X1sDs9e2FCOdjTVtfM5cCpJ3hh1HB26NEgjjpkA==
X-Received: by 2002:a05:600c:1e1a:b0:40f:f069:8d13 with SMTP id ay26-20020a05600c1e1a00b0040ff0698d13mr5499134wmb.9.1707396259681;
        Thu, 08 Feb 2024 04:44:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9bngb2X5GISbv/yy4j9mBBKnrhZrZe/gI/sdxeOnyMsmZ2gSqgLXZyHsX3ZlpZxGigWkWe6GSwDnD4tO+f8wqHead8T2e8iNOMHdV5b639DFoeDoZZIg+IAVvhvJdbPXv0SzGz5XkIKQg9XFqSfWCT0HgB6EbbrIx5T3QEwDngGV/hg2FqFGLMO4PL2rZZDJSYNdNfDUX6Ml6dMEBeMaV+gpd2wJCcnD/3xEH7W/6HsOkMUH/34CX68J7zMfusaioZyzGycnwzfXdjc90Sz2Uwv2cJvWbbIE3Id3ziAgggEXuhKA63/s5c4rg1ZU4U1gp3TRCObPRvyYJzSuyl/v9isF3DDEqWjmMVFLesJ9Moj4cxOZ8Uk5rQV12scBuS7gdF4VOFcaKS1QuErd7owZXZnKwF+36SAam3c22tRApNCKCJuAkY2Ruxuw2tWt1OV4yQ9Ts86qdbfv5VfzLq70hrZcxDuZkV2/LyzMDo9xuGSHC0yS2h0CJCPcZaNcqq+lRqLnfTgXAmCgYFhdiQt2ZNZFqPALsdIXX1AVQsVjLiF2SHSP4cE06KE6TRh3FvwY=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:19 -0800 (PST)
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
Subject: [PATCH 16/17] arm64: dts: renesas: r9a08g045: Update #power-domain-cells = <1>
Date: Thu,  8 Feb 2024 14:42:59 +0200
Message-Id: <20240208124300.2740313-17-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044422_789174_D639C8B7 
X-CRM114-Status: UNSURE (   9.06  )
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
IP specific power domain as the driver has been modified to support multiple
power domains.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index dfee878c0f49..11be621aaa82 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -62,7 +62,7 @@ scif0: serial@1004b800 {
 					  "bri", "dri", "tei";
 			clocks = <&cpg CPG_MOD R9A08G045_SCIF0_CLK_PCK>;
 			clock-names = "fck";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SCIF0>;
 			resets = <&cpg R9A08G045_SCIF0_RST_SYSTEM_N>;
 			status = "disabled";
 		};
@@ -74,7 +74,7 @@ cpg: clock-controller@11010000 {
 			clock-names = "extal";
 			#clock-cells = <2>;
 			#reset-cells = <1>;
-			#power-domain-cells = <0>;
+			#power-domain-cells = <1>;
 		};
 
 		sysc: system-controller@11020000 {
@@ -99,7 +99,7 @@ pinctrl: pinctrl@11030000 {
 			interrupt-parent = <&irqc>;
 			gpio-ranges = <&pinctrl 0 0 152>;
 			clocks = <&cpg CPG_MOD R9A08G045_GPIO_HCLK>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ALWAYS_ON>;
 			resets = <&cpg R9A08G045_GPIO_RSTN>,
 				 <&cpg R9A08G045_GPIO_PORT_RESETN>,
 				 <&cpg R9A08G045_GPIO_SPARE_RESETN>;
@@ -168,7 +168,7 @@ irqc: interrupt-controller@11050000 {
 			clocks = <&cpg CPG_MOD R9A08G045_IA55_CLK>,
 				 <&cpg CPG_MOD R9A08G045_IA55_PCLK>;
 			clock-names = "clk", "pclk";
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ALWAYS_ON>;
 			resets = <&cpg R9A08G045_IA55_RESETN>;
 		};
 
@@ -183,7 +183,7 @@ sdhi0: mmc@11c00000  {
 				 <&cpg CPG_MOD R9A08G045_SDHI0_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI0_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI0>;
 			status = "disabled";
 		};
 
@@ -198,7 +198,7 @@ sdhi1: mmc@11c10000 {
 				 <&cpg CPG_MOD R9A08G045_SDHI1_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI1_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI1>;
 			status = "disabled";
 		};
 
@@ -213,7 +213,7 @@ sdhi2: mmc@11c20000 {
 				 <&cpg CPG_MOD R9A08G045_SDHI2_ACLK>;
 			clock-names = "core", "clkh", "cd", "aclk";
 			resets = <&cpg R9A08G045_SDHI2_IXRST>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_SDHI2>;
 			status = "disabled";
 		};
 
@@ -230,7 +230,7 @@ eth0: ethernet@11c30000 {
 				 <&cpg CPG_MOD R9A08G045_ETH0_REFCLK>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A08G045_ETH0_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ETHER0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -249,7 +249,7 @@ eth1: ethernet@11c40000 {
 				 <&cpg CPG_MOD R9A08G045_ETH1_REFCLK>;
 			clock-names = "axi", "chi", "refclk";
 			resets = <&cpg R9A08G045_ETH1_RST_HW_N>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_ETHER1>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -275,7 +275,7 @@ wdt0: watchdog@12800800 {
 				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "wdt", "perrout";
 			resets = <&cpg R9A08G045_WDT0_PRESETN>;
-			power-domains = <&cpg>;
+			power-domains = <&cpg R9A08G045_PD_WDT0>;
 			status = "disabled";
 		};
 	};
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
