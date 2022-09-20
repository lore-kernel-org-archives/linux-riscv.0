Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C39AECAAD8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 09:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lm08oOYyyQJaYSh3CsvvsaLoNo6dBTxEKNs8SqiEje0=; b=lNn+xFSD6hDTOc
	+dOOUekCSsUeB4QS1D0LF0DNthJEkFuYfBKobqhHo06CxfnCLhr9t3c7z8Xrew4313ROrrHaVJgN+
	HFSEskQkK906u+4KKxPuMo04QdZO8O8Qt7qt7VI6rd3teYhGceGQkWlT+zTIyGmm2nYxib/JaG1Xf
	7FNXVmDyLi8gX/wHRFtFHc6aLf9jXnMUqbbBGraml4Q+bEYehUfPwv/kGc03f+wVY43zTgZ/Oe88O
	vP3uWWZ3UMj+Tloo6Wx761R0L2BtuK55nmK6B4JA6/o0kKxCq0+Yvi5Ipj5RN5fCTgcJdUrWy33ZZ
	lkqJRHM5pVhL+fnBeH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZiG-002UAh-7u; Tue, 20 Sep 2022 09:38:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZdT-002RJU-DZ
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 09:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663666428; x=1695202428;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=K5iROaqmuZTrCp2cKiKRvhaSPdddfMNU1rnN4ZgvctY=;
  b=BpOf3vrgVE60fcez9e/YXD2R5g1zqG1zXz2x113yL3v1N08zCuEPRUAy
   mP+7zk9sJWkk7ZVxpcvTodu9HT2Kn1DA4Lw+xbxNlV8nlOYLE2Nv8SreF
   YfZ/nuy9OCPRr4V0B8iLsOpV3BhoQu3sDxbUv2G77W/I0snagwDp5b+pi
   P8AHsxDdNcf8T20nz9yDVhtLTSVqEaMDT4PQxgsmSRNeLeW3rD7lfiZb7
   piRlH6Ejp4DN1VqcPPimXL2ioYeNTYQ/IcHUuMuDxUy3eBIUn05Q5V8yw
   Ifgoi0SIrlBMsQ80ov0XeVmNfHgEh2duxFsCq1aGgPl5O2U+7D55H2Z5T
   g==;
X-IronPort-AV: E=Sophos;i="5.93,330,1654585200"; 
   d="scan'208";a="174700575"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 20 Sep 2022 02:33:44 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 20 Sep 2022 02:33:39 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 20 Sep 2022 02:33:38 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v6] riscv: dts: microchip: add the mpfs' fabric clock control
Date: Tue, 20 Sep 2022 10:31:55 +0100
Message-ID: <20220920093154.24765-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_023347_566304_2C26C612 
X-CRM114-Status: GOOD (  10.91  )
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

In the v2022.09 icicle kit reference design a single CCC (north-west
corner) is enabled, using a 50 MHz off-chip oscillator as its reference.

Updating to the v2022.09 icicle kit reference design is required, as
prior to this release, the CCC was not fixed & could change for any
given run of the synthesis tool.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Claudiu has applied the rest of the series & sent a PR to Stephen for
it. Since v5, I've rebased this on top of the 2022.09 memory map
changes & made the PWM use the correct clock.

 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi | 31 +++++++++---------
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  4 +++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 32 +++++++++++++++++++
 3 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index c2aac1a7e862..c196bbfc0c24 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -11,7 +11,7 @@ core_pwm0: pwm@40000000 {
 		reg = <0x0 0x40000000 0x0 0xF0>;
 		microchip,sync-update-mask = /bits/ 32 <0>;
 		#pwm-cells = <2>;
-		clocks = <&fabric_clk3>;
+		clocks = <&ccc_nw CLK_CCC_PLL0_OUT3>;
 		status = "disabled";
 	};
 
@@ -20,25 +20,13 @@ i2c2: i2c@40000200 {
 		reg = <0x0 0x40000200 0x0 0x1000>;
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
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <50000000>;
-	};
-
-	fabric_clk1: fabric-clk1 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <125000000>;
-	};
-
 	pcie: pcie@3000000000 {
 		compatible = "microchip,pcie-host-1.0";
 		#address-cells = <0x3>;
@@ -55,7 +43,7 @@ pcie: pcie@3000000000 {
 				<0 0 0 3 &pcie_intc 2>,
 				<0 0 0 4 &pcie_intc 3>;
 		interrupt-map-mask = <0 0 0 7>;
-		clocks = <&fabric_clk1>, <&fabric_clk3>;
+		clocks = <&ccc_nw CLK_CCC_PLL0_OUT1>, <&ccc_nw CLK_CCC_PLL0_OUT3>;
 		clock-names = "fic1", "fic3";
 		ranges = <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
 		dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000 0x1 0x00000000>;
@@ -68,4 +56,17 @@ pcie_intc: interrupt-controller {
 			interrupt-controller;
 		};
 	};
+
+	refclk_ccc: cccrefclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+};
+
+&ccc_nw {
+	clocks = <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>, <&refclk_ccc>,
+		 <&refclk_ccc>, <&refclk_ccc>;
+	clock-names = "pll0_ref0", "pll0_ref1", "pll1_ref0", "pll1_ref1",
+		      "dll0_ref", "dll1_ref";
+	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 5e2b8aa2ff64..bc3621df2e15 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -138,6 +138,10 @@ &refclk {
 	clock-frequency = <125000000>;
 };
 
+&refclk_ccc {
+	clock-frequency = <50000000>;
+};
+
 &rtc {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 8f463399a568..0a9bb84af438 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -236,6 +236,38 @@ clkcfg: clkcfg@20002000 {
 			#clock-cells = <1>;
 		};
 
+		ccc_se: clock-controller@38010000 {
+			compatible = "microchip,mpfs-ccc";
+			reg = <0x0 0x38010000 0x0 0x1000>, <0x0 0x38020000 0x0 0x1000>,
+			      <0x0 0x39010000 0x0 0x1000>, <0x0 0x39020000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_ne: clock-controller@38040000 {
+			compatible = "microchip,mpfs-ccc";
+			reg = <0x0 0x38040000 0x0 0x1000>, <0x0 0x38080000 0x0 0x1000>,
+			      <0x0 0x39040000 0x0 0x1000>, <0x0 0x39080000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_nw: clock-controller@38100000 {
+			compatible = "microchip,mpfs-ccc";
+			reg = <0x0 0x38100000 0x0 0x1000>, <0x0 0x38200000 0x0 0x1000>,
+			      <0x0 0x39100000 0x0 0x1000>, <0x0 0x39200000 0x0 0x1000>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
+		ccc_sw: clock-controller@38400000 {
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
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
