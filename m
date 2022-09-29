Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A46AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 17:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujpC4wsBgVR/MSIkh7PWksA6AHL4y3p6bCQtkgzJ1lk=; b=LiTAdgPKWLyEgH
	C3/vTTVsgEzcTRDvj+1jqcnwNLt3G8EB6JDRId/ApqsF+QgDu7Yd/0mowbFroLSkS1QFT7G50hQ34
	oWgGEUyFkfF7ImKJ7AKC/jsfsaw2nMXmauvr0qpVI8E77ugRQSrQnPsXbcPGCg8I210RLlzeA2Cbs
	SFLbGAgJ5kEx0MyaYYPlLTbanCy5iVcdxUyCJCS8atcYEcdnGzF9Ph96cScx902/gdr87ANOb7o4f
	v/ws6gBGt91guUFuUbpAA1hQDx0vseIvAH0vimMlpGbIfq2TBeFHhdbZX3Tua8jO4Dgc+cwDdRcOI
	fyNsvTkDi0ftwN4WcOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxHi-004adR-8j; Thu, 29 Sep 2022 17:25:18 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxGb-004ZyR-0q; Thu, 29 Sep 2022 17:24:13 +0000
Received: by mail-wr1-x436.google.com with SMTP id n10so3214561wrw.12;
        Thu, 29 Sep 2022 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=jHdgvFWHb19G7Tf1bbecViUw7+xy+qKpBmYS/rq//kM=;
        b=jT/hcgtRNaRLR7wymeBOkaUaKdRC9hO+p+mO480tI/8JOX+gSwffNrHAidmTFmEB0v
         2+BbnK2/dRSRoPQHydgrunLqXPfrHrMyKE4fD/ArMFeS2+aefRHJZhfj8mGAxrZxAgxU
         2l4KxJmNxvnM/gea3Zm4BD4STS5L7GPKGxGlpmWhPVzVdbU8IVCSPqp+wMdBA4CbqWM2
         rLWZRIv3MD7O6TVKTebfmbNsdclpL6hc0BxRgaBsXBqKtsNKpnjxdLWXHt9Lf8fD4okc
         yLwsy1vGGomFk5BY6waIDikwls+TGRqezrrOVJDbzo/Wa4uOVK+v3JhQpfAkbUwIw0/t
         4Zjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=jHdgvFWHb19G7Tf1bbecViUw7+xy+qKpBmYS/rq//kM=;
        b=6ZSffpL+dISxSm7VgVwVcYe7GI+7Oqgi7M9RYInZS+aCa1wL2TFv0Mjy2DMIuz79Dc
         ALFeS8MR0ewMwyqsuk4inWUXWFgVYOR2iJU+cqPku+i8FGPmGCZF1eFhgoNO4mYsr/nR
         BUfrE2DJ6rTSRgYMrYJdWNdLNCvxV88BpzOo4vBB0YhSt7Fwr8Ym0KJLYXbfj+LsP6IK
         FR13TG9ingcjRUkmuDReZwTXNt3tvbc2ucNvis6QlBuFaBdAWmYf16+/Hy5vcYJhT9Fg
         xUQvQ+rACANa5HuCjv1vQuG1YBixqnZ8FY7KJV2B+A0PV8ERSGqVX1JTI/q+G2+atpwr
         z5vQ==
X-Gm-Message-State: ACrzQf2926MCuhh/lNYyCju59rZSWG+J7MuzSk58vI1E/rhqp3lwvqpe
	MuYIlmMxxofIUeU2HO3vNiw=
X-Google-Smtp-Source: AMsMyM7cJNAb9NcFKm5iOKs5ZcfFOaeEdram8y20UldC0+d1eOXPWy8TEt0dBiwAdq9xOZ+ntmTX3Q==
X-Received: by 2002:adf:e4c5:0:b0:22c:c92b:27ef with SMTP id v5-20020adfe4c5000000b0022cc92b27efmr3319251wrm.246.1664472244330;
        Thu, 29 Sep 2022 10:24:04 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:9174:aca4:83d8:90fd])
        by smtp.gmail.com with ESMTPSA id d18-20020adfe852000000b0022a293ab1e9sm11815wrn.11.2022.09.29.10.24.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 10:24:03 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	DT <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/2] arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts
Date: Thu, 29 Sep 2022 18:23:56 +0100
Message-Id: <20220929172356.301342-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_102409_125134_5AAC0AD0 
X-CRM114-Status: GOOD (  13.59  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Move RZ/G2UL SoC specific parts to r9a07g043u.dtsi so that r9a07g043.dtsi
can be shared with RZ/Five (RISC-V SoC).

Below are the changes due to which SoC specific parts are moved to
r9a07g043u.dtsi:
- RZ/G2UL has Cortex-A55 (ARM64) whereas the RZ/Five has AX45MP (RISC-V)
- RZ/G2UL has GICv3 as interrupt controller whereas the RZ/Five has PLIC
- RZ/G2UL has WDT2 (channel 2) whereas this block is missing on RZ/Five
- RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
  for SYSC block on RZ/Five

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi  | 69 +------------------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 75 +++++++++++++++++++++
 2 files changed, 76 insertions(+), 68 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index dfb8e1e30236..fd2b7d7e6d1a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the RZ/G2UL SoC
+ * Device Tree Source for the RZ/Five and RZ/G2UL SoCs
  *
  * Copyright (C) 2022 Renesas Electronics Corp.
  */
@@ -68,36 +68,8 @@ opp-1000000000 {
 		};
 	};
 
-	cpus {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		cpu0: cpu@0 {
-			compatible = "arm,cortex-a55";
-			reg = <0>;
-			device_type = "cpu";
-			#cooling-cells = <2>;
-			next-level-cache = <&L3_CA55>;
-			enable-method = "psci";
-			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
-			operating-points-v2 = <&cluster0_opp>;
-		};
-
-		L3_CA55: cache-controller-0 {
-			compatible = "cache";
-			cache-unified;
-			cache-size = <0x40000>;
-		};
-	};
-
-	psci {
-		compatible = "arm,psci-1.0", "arm,psci-0.2";
-		method = "smc";
-	};
-
 	soc: soc {
 		compatible = "simple-bus";
-		interrupt-parent = <&gic>;
 		#address-cells = <2>;
 		#size-cells = <2>;
 		ranges;
@@ -550,12 +522,6 @@ cpg: clock-controller@11010000 {
 		sysc: system-controller@11020000 {
 			compatible = "renesas,r9a07g043-sysc";
 			reg = <0 0x11020000 0 0x10000>;
-			interrupts = <SOC_PERIPHERAL_IRQ(42, IRQ_TYPE_LEVEL_HIGH)>,
-				     <SOC_PERIPHERAL_IRQ(43, IRQ_TYPE_LEVEL_HIGH)>,
-				     <SOC_PERIPHERAL_IRQ(44, IRQ_TYPE_LEVEL_HIGH)>,
-				     <SOC_PERIPHERAL_IRQ(45, IRQ_TYPE_LEVEL_HIGH)>;
-			interrupt-names = "lpm_int", "ca55stbydone_int",
-					  "cm33stbyr_int", "ca55_deny";
 			status = "disabled";
 		};
 
@@ -608,16 +574,6 @@ dmac: dma-controller@11820000 {
 			dma-channels = <16>;
 		};
 
-		gic: interrupt-controller@11900000 {
-			compatible = "arm,gic-v3";
-			#interrupt-cells = <3>;
-			#address-cells = <0>;
-			interrupt-controller;
-			reg = <0x0 0x11900000 0 0x40000>,
-			      <0x0 0x11940000 0 0x60000>;
-			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
-		};
-
 		sdhi0: mmc@11c00000 {
 			compatible = "renesas,sdhi-r9a07g043",
 				     "renesas,rcar-gen3-sdhi";
@@ -819,21 +775,6 @@ wdt0: watchdog@12800800 {
 			status = "disabled";
 		};
 
-		wdt2: watchdog@12800400 {
-			compatible = "renesas,r9a07g043-wdt",
-				     "renesas,rzg2l-wdt";
-			reg = <0 0x12800400 0 0x400>;
-			clocks = <&cpg CPG_MOD R9A07G043_WDT2_PCLK>,
-				 <&cpg CPG_MOD R9A07G043_WDT2_CLK>;
-			clock-names = "pclk", "oscclk";
-			interrupts = <SOC_PERIPHERAL_IRQ(53, IRQ_TYPE_LEVEL_HIGH)>,
-				     <SOC_PERIPHERAL_IRQ(54, IRQ_TYPE_LEVEL_HIGH)>;
-			interrupt-names = "wdt", "perrout";
-			resets = <&cpg R9A07G043_WDT2_PRESETN>;
-			power-domains = <&cpg>;
-			status = "disabled";
-		};
-
 		ostm0: timer@12801000 {
 			compatible = "renesas,r9a07g043-ostm",
 				     "renesas,ostm";
@@ -898,12 +839,4 @@ target: trip-point {
 			};
 		};
 	};
-
-	timer {
-		compatible = "arm,armv8-timer";
-		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
-				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
-	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
index be84392ee47f..97062ad03765 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -10,3 +10,78 @@
 #define SOC_PERIPHERAL_IRQ(nr, na)	GIC_SPI nr na
 
 #include "r9a07g043.dtsi"
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			#cooling-cells = <2>;
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
+			operating-points-v2 = <&cluster0_opp>;
+		};
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x40000>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
+				      <&gic GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+};
+
+&soc {
+	interrupt-parent = <&gic>;
+
+	gic: interrupt-controller@11900000 {
+		compatible = "arm,gic-v3";
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+		interrupt-controller;
+		reg = <0x0 0x11900000 0 0x40000>,
+		      <0x0 0x11940000 0 0x60000>;
+		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+	};
+
+	wdt2: watchdog@12800400 {
+		compatible = "renesas,r9a07g043-wdt",
+				"renesas,rzg2l-wdt";
+		reg = <0 0x12800400 0 0x400>;
+		clocks = <&cpg CPG_MOD R9A07G043_WDT2_PCLK>,
+			 <&cpg CPG_MOD R9A07G043_WDT2_CLK>;
+		clock-names = "pclk", "oscclk";
+		interrupts = <SOC_PERIPHERAL_IRQ(53, IRQ_TYPE_LEVEL_HIGH)>,
+			     <SOC_PERIPHERAL_IRQ(54, IRQ_TYPE_LEVEL_HIGH)>;
+		interrupt-names = "wdt", "perrout";
+		resets = <&cpg R9A07G043_WDT2_PRESETN>;
+		power-domains = <&cpg>;
+		status = "disabled";
+	};
+};
+
+&sysc {
+	interrupts = <SOC_PERIPHERAL_IRQ(42, IRQ_TYPE_LEVEL_HIGH)>,
+		     <SOC_PERIPHERAL_IRQ(43, IRQ_TYPE_LEVEL_HIGH)>,
+		     <SOC_PERIPHERAL_IRQ(44, IRQ_TYPE_LEVEL_HIGH)>,
+		     <SOC_PERIPHERAL_IRQ(45, IRQ_TYPE_LEVEL_HIGH)>;
+	interrupt-names = "lpm_int", "ca55stbydone_int",
+			  "cm33stbyr_int", "ca55_deny";
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
