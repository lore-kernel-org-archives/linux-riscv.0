Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32326C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 11:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=18bKJKve72kyZwR+url5MkFq1lElPsBxdlCw7RB8hjg=; b=gMCDw1p65wAuV2
	T2+L2CkpB1IvL3sokGnvXrrpbvYURdjf1pZ1aOKV3hiZOiqf1+HL1USJhWWd34TkWJ6HC7xTLTFq+
	AGPxwL8Pnz+EW89nvWBeooZV+9MqENT5wggWaTK8b3WjoLCN1298vUDs2MgIxN1nwUJJ9oQqVefnq
	RIMtK3x8bD+1PtmX5TbhtEp+2qby7sH8M6QUAFZ9hkazWanlYwfIVle5OzOwgWYhSq7czJ2u1BcnC
	YFe/pJ4pQNYsYbKvBySaNbJwuKA8tUP1j6uTUwgBpOkaY4KBr/dHGFDg/MvEFBpIKpiwwvR890TOp
	jU3yJ55/f9pUNeyvCjEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dg-00AAA7-4O; Tue, 27 Sep 2022 11:20:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1od8dT-00AA1g-Ao
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 11:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664277623; x=1695813623;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J3Qpg47GGZySRSkluQCg7tca5Lj+SZrqXdSd94Oyz+o=;
  b=wCHBpCbr/jr7BAtBRy3VMsDPfUBZ9kRYpadcpiTD0QEbWKLAmrbwrL2l
   nIEcjJROafo1WR4ut9kjWLHMfC0ul2CoFEIuHzQG04Eio5BjgPP+QX0Td
   bnkip4DhP2wgAW8rw3O9jlnOsJ/7NmWir929ogiU+ILe+VIY/KBuayV7W
   Uktn/yN04PhUsVLOdSOKqt4OxbbQ3P8wLbpFhZGOikiWLE2XabEbVwgQv
   xV4IuUfAHujxXeF4lB+p+lvdeNPIhBkWlAtCz8ikZKfUfpwuubLjTETvZ
   tcUUJDXITbpS4b246qWNU9iHaZQp1BuWngVMuixFy21IWWObq41hAIKzB
   A==;
X-IronPort-AV: E=Sophos;i="5.93,349,1654585200"; 
   d="scan'208";a="179094364"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 27 Sep 2022 04:20:22 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 27 Sep 2022 04:20:11 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 27 Sep 2022 04:20:09 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v6 05/11] riscv: dts: microchip: move the mpfs' pci node to -fabric.dtsi
Date: Tue, 27 Sep 2022 12:19:17 +0100
Message-ID: <20220927111922.3602838-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220927111922.3602838-1-conor.dooley@microchip.com>
References: <20220927111922.3602838-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_042023_613977_35818D86 
X-CRM114-Status: GOOD (  11.63  )
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

In today's edition of moving things around:

The PCIe root port on PolarFire SoC is more part of the FPGA than of
the Core Complex. It is located on the other side of the chip and,
apart from its interrupts, most of its configuration is determined
by the FPGA bitstream rather. This includes:

- address translation in both directions
- the addresses at which the config and data regions appear to the
  core complex
- the clocks used by the AXI bus
- the plic interrupt used

Moving the PCIe node to the -fabric.dtsi makes it clearer than a
singular configuration for root port is not correct & allows the
base SoC dtsi to be more easily included.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi | 32 +++++++++++++++++--
 .../dts/microchip/mpfs-polarberry-fabric.dtsi | 29 +++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 30 -----------------
 3 files changed, 58 insertions(+), 33 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index eec5aba43436..688ef0fc5a64 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -37,8 +37,34 @@ fabric_clk1: fabric-clk1 {
 		#clock-cells = <0>;
 		clock-frequency = <125000000>;
 	};
-};
 
-&pcie {
-	dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000 0x1 0x00000000>;
+	pcie: pcie@2000000000 {
+		compatible = "microchip,pcie-host-1.0";
+		#address-cells = <0x3>;
+		#interrupt-cells = <0x1>;
+		#size-cells = <0x2>;
+		device_type = "pci";
+		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
+		reg-names = "cfg", "apb";
+		bus-range = <0x0 0x7f>;
+		interrupt-parent = <&plic>;
+		interrupts = <119>;
+		interrupt-map = <0 0 0 1 &pcie_intc 0>,
+				<0 0 0 2 &pcie_intc 1>,
+				<0 0 0 3 &pcie_intc 2>,
+				<0 0 0 4 &pcie_intc 3>;
+		interrupt-map-mask = <0 0 0 7>;
+		clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
+		clock-names = "fic0", "fic1", "fic3";
+		ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
+		dma-ranges = <0x02000000 0x0 0x00000000 0x0 0x00000000 0x1 0x00000000>;
+		msi-parent = <&pcie>;
+		msi-controller;
+		status = "disabled";
+		pcie_intc: interrupt-controller {
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
index 49380c428ec9..67303bc0e451 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
@@ -13,4 +13,33 @@ fabric_clk1: fabric-clk1 {
 		#clock-cells = <0>;
 		clock-frequency = <125000000>;
 	};
+
+	pcie: pcie@2000000000 {
+		compatible = "microchip,pcie-host-1.0";
+		#address-cells = <0x3>;
+		#interrupt-cells = <0x1>;
+		#size-cells = <0x2>;
+		device_type = "pci";
+		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
+		reg-names = "cfg", "apb";
+		bus-range = <0x0 0x7f>;
+		interrupt-parent = <&plic>;
+		interrupts = <119>;
+		interrupt-map = <0 0 0 1 &pcie_intc 0>,
+				<0 0 0 2 &pcie_intc 1>,
+				<0 0 0 3 &pcie_intc 2>,
+				<0 0 0 4 &pcie_intc 3>;
+		interrupt-map-mask = <0 0 0 7>;
+		clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
+		clock-names = "fic0", "fic1", "fic3";
+		ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
+		msi-parent = <&pcie>;
+		msi-controller;
+		status = "disabled";
+		pcie_intc: interrupt-controller {
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 45e3cc659882..79fd8dfce96f 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -464,36 +464,6 @@ usb: usb@20201000 {
 			status = "disabled";
 		};
 
-		pcie: pcie@2000000000 {
-			compatible = "microchip,pcie-host-1.0";
-			#address-cells = <0x3>;
-			#interrupt-cells = <0x1>;
-			#size-cells = <0x2>;
-			device_type = "pci";
-			reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
-			reg-names = "cfg", "apb";
-			bus-range = <0x0 0x7f>;
-			interrupt-parent = <&plic>;
-			interrupts = <119>;
-			interrupt-map = <0 0 0 1 &pcie_intc 0>,
-					<0 0 0 2 &pcie_intc 1>,
-					<0 0 0 3 &pcie_intc 2>,
-					<0 0 0 4 &pcie_intc 3>;
-			interrupt-map-mask = <0 0 0 7>;
-			clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
-			clock-names = "fic0", "fic1", "fic3";
-			ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
-			msi-parent = <&pcie>;
-			msi-controller;
-			microchip,axi-m-atr0 = <0x10 0x0>;
-			status = "disabled";
-			pcie_intc: legacy-interrupt-controller {
-				#address-cells = <0>;
-				#interrupt-cells = <1>;
-				interrupt-controller;
-			};
-		};
-
 		mbox: mailbox@37020000 {
 			compatible = "microchip,mpfs-mailbox";
 			reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318C 0x0 0x40>;
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
