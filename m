Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D482ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 14:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6T11hDBKEuf07uzcIlMo6WBuyrN6IeGt77qa5+d06BI=; b=XbMKFkM4FH/WLg
	wuXglTzMCbYy8fKMnNi5gsMCMA6txcg3HKe2uWmNSdXzX8fDFn0RSd7MGwpP4dF27jxZtgYc31PsL
	fEQWAsHTQXJRAPJr9aiv5mDMqXJS4wi1DWolY05s3yY97/vV/SOhvPe0+hdPWOjwm78znyJxdgpE5
	bUGvsDyDB3RttJ0M8HxRQZ9E4T4GZWeRbZenPutIw8rQ6FI2hS8e7pX6fWE6np0aL8JgHPNEyLMvS
	256MUDOyjP78JymlVTAZKUP7nsz/DXKpffA2KA+vRtvUml/njj+Y1aN43lj+jUPAXOlkOryQFpx8l
	g2St+PqGC3MrY37gGkLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaKU-006CmG-U7; Fri, 26 Aug 2022 14:29:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaKQ-006CTX-Ch
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 14:29:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661524138; x=1693060138;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5en4qBuVzdeyn5IGKXiQxzbRqw1ndSal365HolbPArY=;
  b=U0OjKGD6T6KOSOoIFf2ca5SMdhz7UJRi18oq+D0SREvb3H9AusSvD3PE
   2zyUreS0xLsEOdHxwQxtrNCYh4HERKu6ShNaYXwEz/wm2/664VGupCxMJ
   fnzo9qW2oBeM4IzN9GvNYV9wLnI3eww6dApwvfhHTggEkC3ptevTaW6cv
   KPiT+mdOuSwANaDrq+bJrIu5srkwlavpY5GgX/PMzVznq4NAc08DDvZww
   YcQQFov/1uCnrGnOiZNnMLVvvTWzB/HOo54rQPT5KpPDUJ3aykg4ld7oA
   JjEJRdqpq/wnUvSan5MlbJM4r0I4fegi6OkNgrrHI8hyJ3e7ovAbsOajO
   A==;
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="110917604"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 07:28:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 07:28:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 26 Aug 2022 07:28:53 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/9] riscv: dts: microchip: move the mpfs' pci node to -fabric.dtsi
Date: Fri, 26 Aug 2022 15:28:03 +0100
Message-ID: <20220826142806.3658434-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220826142806.3658434-1-conor.dooley@microchip.com>
References: <20220826142806.3658434-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_072858_568372_1F52EC4D 
X-CRM114-Status: GOOD (  11.65  )
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
 arch/riscv/boot/dts/microchip/mpfs.dtsi       | 29 -----------------
 3 files changed, 58 insertions(+), 32 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index c0fb9dd7b2c8..a21440c8ee03 100644
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
index a1176260086a..5974066298e1 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -464,35 +464,6 @@ usb: usb@20201000 {
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
-			status = "disabled";
-			pcie_intc: interrupt-controller {
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
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
