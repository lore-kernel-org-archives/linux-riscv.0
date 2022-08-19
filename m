Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB89FC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyVH+6Yoz5iQmXA3GkfVsTgrStkJJ3HbvFekEnw9Bx8=; b=GROEw+V3wceqAN
	RAyxWXg41DEEo7oqp7GcufmmMK4uufQRUd29pZVVq2saTnHpgcLv39FG4BwAJU0f0pFQzX93qunGb
	vW0Klwn+1NPlCPBBcyrTou9B82yo/xPYSJh3UpyskWi6lOtT9ylNMFO1M6pierweJR64KddCNlKCd
	7kc48NmAXNYT9sUXvED00NscNseGw/bX3bFBBTsbUfZaDWBCDuH0+tmyjz9q3pw7eGY3bmdgVDapv
	wXSU38DSBkH7vkHrFvCUNdzo4ALUFmiLsHRwljMP/7XTDjE4vuexcmRj9ei1q68izAi15ki2iuVmy
	BcIlE4pR+8Yo2muRjYww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP176-007sFy-Go; Fri, 19 Aug 2022 12:28:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP172-007s1o-1b
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 12:28:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660912111; x=1692448111;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Nm7jyxD/fyaId3huaPt8VqEfpZF+UJyBdpgKFruHqQ=;
  b=k8KOOn84vTtsie4h7wnL3LXpmNoMsZRp57fNprZMLzWege6ywht4gCxv
   i5JsvCL/PJddjJ+S0Ko6HLlJRRJ2JtzNFLxeb7ACqOO/k7Y+bxikjm5u3
   bfHoIv+dX662T1mIrD8Uk2jNBKrtQ8haUrVD6yhqoUxT/pnL2UlhgZ+xo
   F02agRm7H3Ft5oCVtdHV/1saneEWPIy418vj5Hjga12oqyXinwougdaQj
   yjfHf1RuFgNu9EDt5dnRf3LIf+f9GJHc8av4DYp3NdvcmniqeN+g0sQRC
   6JabpZLACUpb3yCdF8KTamDWF6TY2DROhPivPBUgG0l8NpRvBvVDOF92V
   w==;
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; 
   d="scan'208";a="109780604"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 19 Aug 2022 05:28:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 19 Aug 2022 05:28:22 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 19 Aug 2022 05:28:20 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock control
Date: Fri, 19 Aug 2022 13:23:00 +0100
Message-ID: <20220819122259.183600-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220819122259.183600-1-conor.dooley@microchip.com>
References: <20220819122259.183600-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_052832_208789_1C899450 
X-CRM114-Status: GOOD (  10.37  )
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

The "fabric clocks" in current PolarFire SoC device trees are not
really fixed clocks. Their frequency is set by the bitstream, so having
them located in -fabric.dtsi is not a problem - they're just as "fixed"
as the IP blocks etc used in the FPGA fabric.
However, their configuration can be read at runtime (and to an extent
they can be controlled, although the intended usage is static
configurations set by the bitstream) through the system controller bus.

In the v2209 reference design a single CCC (north-west corner) is
enabled, using a 50 MHz off-chip oscillator as its reference.

Updating to the v2209 reference design is required.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi | 27 +++++++++------
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  4 +++
 .../dts/microchip/mpfs-polarberry-fabric.dtsi |  5 +++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 34 +++++++++++++++++--
 4 files changed, 58 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 0d28858b83f2..f17cb00df467 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -2,14 +2,14 @@
 /* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 / {
-	compatible = "microchip,mpfs-icicle-reference-rtlv2203", "microchip,mpfs";
+	compatible = "microchip,mpfs-icicle-reference-rtlv2209", "microchip,mpfs";
 
 	core_pwm0: pwm@41000000 {
 		compatible = "microchip,corepwm-rtl-v4";
 		reg = <0x0 0x41000000 0x0 0xF0>;
 		microchip,sync-update-mask = /bits/ 32 <0>;
 		#pwm-cells = <2>;
-		clocks = <&fabric_clk3>;
+		clocks = <&ccc_nw CLK_CCC_PLL0_OUT0>;
 		status = "disabled";
 	};
 
@@ -18,22 +18,29 @@ i2c2: i2c@44000000 {
 		reg = <0x0 0x44000000 0x0 0x1000>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clocks = <&fabric_clk3>;
+		clocks = <&ccc_nw CLK_CCC_PLL0_OUT3>;
 		interrupt-parent = <&plic>;
 		interrupts = <122>;
 		clock-frequency = <100000>;
 		status = "disabled";
 	};
 
-	fabric_clk3: fabric-clk3 {
+	refclk_ccc: cccrefclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-		clock-frequency = <62500000>;
 	};
+};
 
-	fabric_clk1: fabric-clk1 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <125000000>;
-	};
+&ccc_nw {
+	clocks = <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>,
+		 <&refclk_ccc>, <&refclk_ccc>;
+	clock-names = "pll0_ref0", "pll0_ref1", "pll1_ref0", "pll1_ref1",
+		      "dll0_ref", "dll1_ref";
+	status = "okay";
+};
+
+&pcie {
+	clocks = <&ccc_nw CLK_CCC_PLL0_OUT0>, <&ccc_nw CLK_CCC_PLL0_OUT1>,
+		 <&ccc_nw CLK_CCC_PLL0_OUT3>;
+	clock-names = "fic0", "fic1", "fic3";
 };
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 044982a11df5..d361d1e38b16 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -140,6 +140,10 @@ &refclk {
 	clock-frequency = <125000000>;
 };
 
+&refclk_ccc {
+	clock-frequency = <50000000>;
+};
+
 &rtc {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
index 49380c428ec9..3beb450b4259 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
@@ -14,3 +14,8 @@ fabric_clk1: fabric-clk1 {
 		clock-frequency = <125000000>;
 	};
 };
+
+&pcie {
+	clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
+	clock-names = "fic0", "fic1", "fic3";
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 499c2e63ad35..dd15b6d1a3c9 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -236,6 +236,38 @@ clkcfg: clkcfg@20002000 {
 			#clock-cells = <1>;
 		};
 
+		ccc_se: cccseclk@38010000 {
+			compatible = "microchip,mpfs-ccc";
+			reg = <0x0 0x38010000 0x0 0x1000>, <0x0 0x38020000 0x0 0x1000>,
+			      <0x0 0x39010000 0x0 0x1000>, <0x0 0x39020000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_ne: cccneclk@38040000 {
+			compatible = "microchip,mpfs-ccc";
+			reg = <0x0 0x38040000 0x0 0x1000>, <0x0 0x38080000 0x0 0x1000>,
+			      <0x0 0x39040000 0x0 0x1000>, <0x0 0x39080000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_nw: cccnwclk@38100000 {
+			compatible = "microchip,mpfs-ccc";
+			reg = <0x0 0x38100000 0x0 0x1000>, <0x0 0x38200000 0x0 0x1000>,
+			      <0x0 0x39100000 0x0 0x1000>, <0x0 0x39200000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_sw: cccswclk@38400000 {
+			compatible = "microchip,mpfs-ccc";
+			reg = <0x0 0x38400000 0x0 0x1000>, <0x0 0x38800000 0x0 0x1000>,
+			      <0x0 0x39400000 0x0 0x1000>, <0x0 0x39800000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		mmuart0: serial@20000000 {
 			compatible = "ns16550a";
 			reg = <0x0 0x20000000 0x0 0x400>;
@@ -480,8 +512,6 @@ pcie: pcie@2000000000 {
 					<0 0 0 3 &pcie_intc 2>,
 					<0 0 0 4 &pcie_intc 3>;
 			interrupt-map-mask = <0 0 0 7>;
-			clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
-			clock-names = "fic0", "fic1", "fic3";
 			ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
 			msi-parent = <&pcie>;
 			msi-controller;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
