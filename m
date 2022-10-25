Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1E8ECDFA1
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Oct 2022 22:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1fGQ+TA21w233w7eO/4u6Lke4c5iV6N9mStXO2ua0I=; b=LvL142W1luZLrE
	hM7F/QZmGVvB/ZI3hkWealz/E0D1Wcigfcfi/RNGlgdfDGyjcvydbtgAbtrMid1UjJcGPX3LZbp36
	4dtPjC1euHukyf/blOC5BkvQhYeewq2X7RlhBZfJDDiUnMutZY9VdwSQjDm1AnvSUNPNJ3VR/BRPq
	RC6Co+8JVKeAsIErVHjhTBWG1nAMHk47+hcvZJ9mX3vPO/qlVM/jqV5MTRI+VRwop29Qht8COb2U/
	vdum7ROieAfBCb5GHGfCwECUbNwyADKWMSwX+Uq/Yl7DDh0aHk30uIypoFVzfy0EMC2gWfi7nvxGS
	IckrN+avskBsXip9G1jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onS4g-007LBM-S8; Tue, 25 Oct 2022 22:07:06 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onS4N-007L73-FZ; Tue, 25 Oct 2022 22:06:49 +0000
Received: by mail-wr1-x431.google.com with SMTP id a14so20597500wru.5;
        Tue, 25 Oct 2022 15:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/b2ry2eREZpQrayM8pLQ/WtjYgIHMF+G/lbwLaKSf4=;
        b=JQXfCBiqZbzP5yTTlxr3EGz53xce3Aa/Ku+J2ahBCt2LsI8outAK6yhmUvwoQ8ai11
         EfSuSLmRHmovOKTS4EotfYkVjUrh+ZWaIr6L7FlYqxhvvjMCM0rZ5XHniyqlqwQI6YCX
         KqRfsoRq83tdyzHsiGoexP4JbKTRr+FF0VSJgBbvTqw4e5z4yR3q2xF0MBj55eq0i8hZ
         QEarnRDuY4SyfRLHd3KlLamW/wM3Zr9cGCM1zHe8ttWbyywxZk8E4Nq4bQ819vbL4LOw
         WWzD6yOq0ecZamsyiHeZP8PbtGz8FeGfvOAsIftrv+CFEt1gSlLne9v3dE9WMdyW1W4X
         EjDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U/b2ry2eREZpQrayM8pLQ/WtjYgIHMF+G/lbwLaKSf4=;
        b=6EzFREqqYDx6M1VBmfaj/BNJRGlmpTNSZPH20wIDIfyhsWmgyGgCKI/c8yYplbqhxD
         QFe396kpuER3SHfg4a0zMqOgz6vK8ctMp1n43Wl2ZDHE44ndzJ4Lou3P54qei6xbR3/X
         LRK824mKGOGaKNiwMKQphKDXyNUQ9Z8xsmEcDSnA9ZWs8BFFmMJ214R8COoiZEeYlgYv
         Izn8MvbmPJyAnn0fT4NCbBbTuxN9Oxx+eAroSEl3dWXPT7Wv60zem7PpMU+sUSF6vs9c
         06ALxJiO9Rbf7NNj0TvhNiLiiEYnFyxkyDDpEoQwVAMf5AqR0NuDxxQhOj5Jb6GMRapd
         wyUw==
X-Gm-Message-State: ACrzQf2EeLde3t7ckRDILJype7oLHuZp+tKWrAGiBUXNkzGPOidShlIT
	38r5xd+nCxvBQxY/hfKQR+8=
X-Google-Smtp-Source: AMsMyM4NxkIjCoW1jXtg0U6l6q46VarwvcbwRgKnXYT02v5kre0ykIeGSKQHaROp2OnA1S/1uKP71A==
X-Received: by 2002:adf:e88e:0:b0:236:792e:f2a2 with SMTP id d14-20020adfe88e000000b00236792ef2a2mr6494927wrm.220.1666735606305;
        Tue, 25 Oct 2022 15:06:46 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:1d2a:d2a2:361e:a475])
        by smtp.gmail.com with ESMTPSA id l18-20020a05600c1d1200b003a342933727sm210534wms.3.2022.10.25.15.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 15:06:45 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/2] arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts
Date: Tue, 25 Oct 2022 23:06:29 +0100
Message-Id: <20221025220629.79321-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221025220629.79321-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_150647_554593_2D996574 
X-CRM114-Status: GOOD (  13.45  )
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
- RZ/G2UL has interrupts for SYSC block whereas interrupts are missing
  for SYSC block on RZ/Five
- RZ/G2UL has armv8-timer whereas the RZ/Five has riscv-timer

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
RFC->v2
* Updated commit message about timer
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi  | 54 +------------------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi | 60 +++++++++++++++++++++
 2 files changed, 61 insertions(+), 53 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index a7248204d2ba..3f7d451b1199 100644
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
-			interrupts = <SOC_PERIPHERAL_IRQ(42) IRQ_TYPE_LEVEL_HIGH>,
-				     <SOC_PERIPHERAL_IRQ(43) IRQ_TYPE_LEVEL_HIGH>,
-				     <SOC_PERIPHERAL_IRQ(44) IRQ_TYPE_LEVEL_HIGH>,
-				     <SOC_PERIPHERAL_IRQ(45) IRQ_TYPE_LEVEL_HIGH>;
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
@@ -883,12 +839,4 @@ target: trip-point {
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
index 96f935bc2d4d..b8bf06b51235 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u.dtsi
@@ -10,3 +10,63 @@
 #define SOC_PERIPHERAL_IRQ(nr)		GIC_SPI nr
 
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
+};
+
+&sysc {
+	interrupts = <SOC_PERIPHERAL_IRQ(42) IRQ_TYPE_LEVEL_HIGH>,
+		     <SOC_PERIPHERAL_IRQ(43) IRQ_TYPE_LEVEL_HIGH>,
+		     <SOC_PERIPHERAL_IRQ(44) IRQ_TYPE_LEVEL_HIGH>,
+		     <SOC_PERIPHERAL_IRQ(45) IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "lpm_int", "ca55stbydone_int",
+			  "cm33stbyr_int", "ca55_deny";
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
