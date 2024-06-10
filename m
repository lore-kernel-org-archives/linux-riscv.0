Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A59C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1pLoPGgpi3hAHv0cUt2p4tMpVTqEI9+Efiq2NVaf/k=; b=pklOEzvZSPXH7l
	hCtQRJWpmZj12tqG1i2DLZGw+jX6FbADSX966uce+lAa9imJotVDaqO37BfR/rd93hgVAzBXw0SjL
	mufqH9zMaQiL3z/sXd4Ox3lv3WCJ4wfKJKgykFj9MUg6CI0cYo/lwnJgJZd2W7ZPdh1qSS4U97EQ4
	AJh/Y6xQeS0V6wZ7pKsArGQ7sOmJ2ouDBM6PJzlYkswk7GYt61y11d/fOX+5TcOKyVlQvSeGaOgaJ
	IvEJJe2LULOdTXpJ8ZNNZlD9YhV/KSKSSkdD5lDbpjWjPLUoHdLofGpIB9zOYi15T5RPxdZnS+2ER
	1i2w9Tx3Vm9OG9S7sVHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcup-00000004lqj-1PbU;
	Mon, 10 Jun 2024 11:10:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcuk-00000004lmj-2ymK
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:10:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718017814; x=1749553814;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KLTX+FrN+/X5Pjo7hasr1G+U/5MVxG90GAbohrK1Lcw=;
  b=NvfjHK+Lxc2m4XQ1cfMJvGw0pJlc4iT9qmt7svuG7xL4U6jIRjrbGQo1
   r18L0Oj6tFGJwL3RMiYakR06TJ30RmgQ4vhhVt+ge+xHUiE4u5OPdXkL8
   Z8qGbeRACOHAPtuWg/IuIBlJAm4v1HC+zu43dv2RqJgs2I5zsUF02kFgC
   GPIwneSeUzuQKA6ICqj9yknNhYxqYiXUa4osld0R08tl7/mQ7AjFjvEw4
   9eoZsmuVddS/efEUO8fq1gtaHQzDDClh3pWu2fyXtkTxbRtxGZQpWpUZ0
   Ph7mjIciWOWycBq0Hm59LHkwCyh94P0Nlbd46mrumXC1gYk6kQ38aN/qn
   A==;
X-CSE-ConnectionGUID: LxG2JZT/RDyTTRgbHxmFoA==
X-CSE-MsgGUID: v1Ns5dfRR+6+wMyyTaxnhA==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="29623984"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 04:10:07 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 04:09:43 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 04:09:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 4/5] riscv: dts: microchip: modify memory map & add dma-ranges for pcie on icicle
Date: Mon, 10 Jun 2024 12:09:16 +0100
Message-ID: <20240610-unhealthy-squeamish-db1039449a32@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240610-vertical-frugally-a92a55427dd9@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6818; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=KLTX+FrN+/X5Pjo7hasr1G+U/5MVxG90GAbohrK1Lcw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlp925Pi7651timSFPqf4/U7bYL+3zZkuuYzhz9s2Xmussh m2aldJSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiZ9gY/nD/CV8a3LqWJTvgkcvL+n 0XnbySzC9crFMQ1HZ9d67t621Ghnm++wRuuEwS/djpdvFaXa3/nDvSukX2kt5Nf2cHzvppwAsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_041014_792836_716B8D79 
X-CRM114-Status: GOOD (  13.79  )
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

Since 2022/02, the main reference design for the Icicle Kit uses a
non-coherent memory configuration for PCIe, and a shim in the FPGA
fabric, in response to customer requests. As a result, the PCIe root
port has not been usable in mainline since that point in time.

The memory apertures on the reference design have been configured so
that the base of each aperture is mapped to 0x0 in physical memory, a
completely "overlaid" approach. This enables the PCIe root port to
operate in a non-coherent manner (the CPUs/harts use the cached variant
of a particular actual DDR address, the PCIe root port uses the
non-cached variant of the same address. As an example, to access DDR
location 0, the FIC, to which the PCIe rootport is attached, would use
14'0000'0000 and the CPUs would use 10'0000'0000. In this example, the
FIC is responsible for the upper 32-bits of the AXI address and the
root-port (as it is limited to 32-bits on the AXI-S interface) is
responsible for the lower 32-bits of the AXI address. The FPGA designs
utilizing this approach use a simple "shim" to statically set the upper
32-bits of all AXI-S addresses to '000'0014'.

Describe some regions of non-cached memory (and immediately reserve them,
as PolarFire SoC does not support atomics in non-cached memory) so that
we can configure dma-ranges and dma-pools to support a "shim" that will
shift addresses in AXI transactions from the PCIe root port into the
0x14_0000_0000 non-cached region of memory.

The price paid for this is a reduction in the overall system memory.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi | 75 ++++++++++++-------
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 44 +++++++++--
 2 files changed, 84 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 1069134f2e12a..33e76db965bbc 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -26,33 +26,54 @@ i2c2: i2c@40000200 {
 		status = "disabled";
 	};
 
-	pcie: pcie@3000000000 {
-		compatible = "microchip,pcie-host-1.0";
-		#address-cells = <0x3>;
-		#interrupt-cells = <0x1>;
-		#size-cells = <0x2>;
-		device_type = "pci";
-		reg = <0x30 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
-		reg-names = "cfg", "apb";
-		bus-range = <0x0 0x7f>;
-		interrupt-parent = <&plic>;
-		interrupts = <119>;
-		interrupt-map = <0 0 0 1 &pcie_intc 0>,
-				<0 0 0 2 &pcie_intc 1>,
-				<0 0 0 3 &pcie_intc 2>,
-				<0 0 0 4 &pcie_intc 3>;
-		interrupt-map-mask = <0 0 0 7>;
-		clocks = <&ccc_nw CLK_CCC_PLL0_OUT1>, <&ccc_nw CLK_CCC_PLL0_OUT3>;
-		clock-names = "fic1", "fic3";
-		ranges = <0x3000000 0x0 0x8000000 0x30 0x8000000 0x0 0x80000000>;
-		dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000 0x1 0x00000000>;
-		msi-parent = <&pcie>;
-		msi-controller;
-		status = "disabled";
-		pcie_intc: interrupt-controller {
-			#address-cells = <0>;
-			#interrupt-cells = <1>;
-			interrupt-controller;
+	fabric-pcie-bus@3000000000 {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges = <0x0 0x40000000 0x0 0x40000000 0x0 0x20000000>,
+			 <0x30 0x0 0x30 0x0 0x10 0x0>;
+		dma-ranges = <0x0 0x0 0x0 0x80000000 0x0 0x6000000>,
+			     <0x0 0x6000000 0x0 0xc6000000 0x0 0x4000000>,
+			     <0x0 0xa000000 0x0 0x8a000000 0x0 0x8000000>,
+			     <0x0 0x12000000 0x14 0x12000000 0x0 0x10000000>,
+			     <0x0 0x22000000 0x10 0x22000000 0x0 0x5e000000>;
+
+		pcie: pcie@3000000000 {
+			compatible = "microchip,pcie-host-1.0";
+			#address-cells = <0x3>;
+			#interrupt-cells = <0x1>;
+			#size-cells = <0x2>;
+			device_type = "pci";
+			dma-noncoherent;
+			reg = <0x30 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
+			reg-names = "cfg", "apb";
+			bus-range = <0x0 0x7f>;
+			interrupt-parent = <&plic>;
+			interrupts = <119>;
+			interrupt-map = <0 0 0 1 &pcie_intc 0>,
+					<0 0 0 2 &pcie_intc 1>,
+					<0 0 0 3 &pcie_intc 2>,
+					<0 0 0 4 &pcie_intc 3>;
+			interrupt-map-mask = <0 0 0 7>;
+			clocks = <&ccc_nw CLK_CCC_PLL0_OUT1>, <&ccc_nw CLK_CCC_PLL0_OUT3>;
+			clock-names = "fic1", "fic3";
+			ranges = <0x43000000 0x0 0x9000000 0x30 0x9000000 0x0 0xf000000>,
+				 <0x1000000 0x0 0x8000000 0x30 0x8000000 0x0 0x1000000>,
+				 <0x3000000 0x0 0x18000000 0x30 0x18000000 0x0 0x70000000>;
+			dma-ranges = <0x3000000 0x0 0x80000000 0x0 0x0 0x0 0x6000000>,
+				     <0x3000000 0x0 0x86000000 0x0 0x6000000 0x0 0x4000000>,
+				     <0x3000000 0x0 0x8a000000 0x0 0xa000000 0x0 0x8000000>,
+				     <0x3000000 0x0 0x92000000 0x0 0x12000000 0x0 0x10000000>,
+				     <0x3000000 0x0 0xa2000000 0x0 0x22000000 0x0 0x5e000000>;
+			msi-parent = <&pcie>;
+			msi-controller;
+			status = "disabled";
+
+			pcie_intc: interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
 		};
 	};
 
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index f80df225f72b4..6c9340992e9eb 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -54,16 +54,29 @@ led-4 {
 		};
 	};
 
-	ddrc_cache_lo: memory@80000000 {
+	memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x80000000 0x0 0x40000000>;
-		status = "okay";
+		reg = <0x0 0x80000000 0x0 0x6000000>;
 	};
 
-	ddrc_cache_hi: memory@1040000000 {
+	memory@8a000000 {
 		device_type = "memory";
-		reg = <0x10 0x40000000 0x0 0x40000000>;
-		status = "okay";
+		reg = <0x0 0x8a000000 0x0 0x8000000>;
+	};
+
+	memory@c4000000 {
+		device_type = "memory";
+		reg = <0x0 0xc6000000 0x0 0x4000000>;
+	};
+
+	memory@1022000000 {
+		device_type = "memory";
+		reg = <0x10 0x22000000 0x0 0x5e000000>;
+	};
+
+	memory@1412000000 {
+		device_type = "memory";
+		reg = <0x14 0x12000000 0x0 0x10000000>;
 	};
 
 	reserved-memory {
@@ -71,10 +84,25 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		hss_payload: region@BFC00000 {
-			reg = <0x0 0xBFC00000 0x0 0x400000>;
+		hss_payload: region@103fc00000 {
+			reg = <0x10 0x3fc00000 0x0 0x400000>;
 			no-map;
 		};
+
+		non-cached-low-buffer {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x4000000>;
+			no-map;
+			alloc-ranges = <0x0 0xc6000000 0x0 0x4000000>;
+		};
+
+		non-cached-high-buffer {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x10000000>;
+			no-map;
+			linux,dma-default;
+			alloc-ranges = <0x14 0x12000000 0x0 0x10000000>;
+		};
 	};
 };
 
-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
