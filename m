Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8055CC369D9
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 07:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ckGugrogJ+eAfTDLLWmfvrntMKZD/qlGPOrEFy677Gk=; b=aCh2qgw+8d/Rn9
	658pBDre9goXuCByZSEgkt2S7krvsDeYRf6sK5NKQxdFvPbuuPVI9kDhMYGZCs5EWjPiGwghQya02
	u64SFXw0mecMExugMm+LB3uyBV8inoA7oaK22VGIqXMWLicEzc5PYD/YmRA/g2jOzCXqhtsDbXZaK
	hgizIhKDmmp6JyRInXSZakJqWNN/8KbO9unyQG39v2uJUIkXU7/vuM4YSDRjC+e8m2yOGiqB/mIZ2
	sDE8zIfHdz+1vWEXbpV3nl+OO9WGzMpyPjbpuycH8/T2vzSxC17gCT1teKpoAjxxlnlQmhcNkdWnG
	AQqmxyntoN71AhwByBjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JHM-00000005Je1-3i0d;
	Mon, 28 Apr 2025 07:51:52 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9J4X-00000005GnS-1AzK
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 07:38:38 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [27.18.99.221])
	by smtp.qiye.163.com (Hmail) with ESMTP id 135f5a5b2;
	Mon, 28 Apr 2025 15:38:29 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 28 Apr 2025 15:38:12 +0800
Subject: [PATCH 2/2] riscv: dts: spacemit: add usb3.0 support for K1
MIME-Version: 1.0
Message-Id: <20250428-b4-k1-dwc3-v2-v1-2-7cb061abd619@whut.edu.cn>
References: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
In-Reply-To: <20250428-b4-k1-dwc3-v2-v1-0-7cb061abd619@whut.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745825898; l=5014;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=InIXD7r3QEA4Imaa5hfJxxveIupBNNwLiowBxO1GqwI=;
 b=IVfVOwaQj6raMnn3pxzQq/Z5hW8EmniGXVFBYWWgBkuhaPyJosKcypBUPs9krGJC/WaEpZSXH
 g0XSnjXfbyPBOsVE0dwyudwOj9rp5Y94ilY2y+LAE7gUYrt2EQuPpWV
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSU5NVhhDSksYHUlIGkhPSVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVJSUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVUpCS0
	tZBg++
X-HM-Tid: 0a967b554daa03a1kunm135f5a5b2
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Nwg6Ohw5HjJIPzUXDyFLAVYo
	KB5PCRhVSlVKTE9OQ0lOQkpOTkhKVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVJSUpZV1kIAVlBTU9PTzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_003837_537361_282CE028 
X-CRM114-Status: UNSURE (   8.76  )
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

Add USB 3.0 support for the SpacemiT K1 SoC, including the
following components:

- USB 2.0 PHY nodes
- USB 3.0 combo PHY node
- USB 3.0 host controller
- USB 3.0 hub and vbus regulator (usb3_vhub, usb3_vbus)
- DRAM interconnect node for USB DMA ("dma-mem")

The `usb3_vbus` and `usb3_vhub` regulator node provides a fixed 5V
supply to power the onboard USB 3.0 hub and usb vbus.

On K1, some DMA transfers from devices to memory use separate buses with
different DMA address translation rules from the parent node. We express
this relationship through the interconnects node("dma-mem").

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 52 +++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 56 +++++++++++++++++++++++++
 2 files changed, 108 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 816ef1bc358ec490aff184d5915d680dbd9f00cb..0c0bf572d31e056955eb2ff377c3262271dcc156 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	usb3_vhub: regulator-vhub-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VHUB";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usb3_vbus: regulator-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB30_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &uart0 {
@@ -35,3 +54,36 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&usbphy2 {
+	status = "okay";
+};
+
+&combphy {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "host";
+	phy_type = "utmi";
+	snps,hsphy_interface = "utmi";
+	snps,dis_enblslpm_quirk;
+	snps,dis-u1u2-quirk;
+	snps,dis-u2-freeclk-exists-quirk;
+	snps,dis-del-phy-power-chg-quirk;
+	snps,dis_u2_susphy_quirk;
+	snps,dis_u3_susphy_quirk;
+	snps,dis_rxdet_inp3_quirk;
+	snps,xhci-trb-ent-quirk;
+	vbus-supply = <&usb3_vbus>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub@1 {
+		compatible = "usb2109,817";
+		reg = <0x1>;
+		vdd-supply = <&usb3_vhub>;
+		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0cc4b99c9356d550a470291dba9f2625b10f8df..c7b86c850da969e5412ad42c63995cd20b4d0484 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 / {
@@ -346,6 +348,13 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		dram_range0: dram-range@0 {
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
+			#interconnect-cells = <0>;
+		};
+
 		syscon_rcpu: system-controller@c0880000 {
 			compatible = "spacemit,k1-syscon-rcpu";
 			reg = <0x0 0xc0880000 0x0 0x2048>;
@@ -358,6 +367,53 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usb_dwc3: usb@c0a00000 {
+			compatible = "spacemit,k1-dwc3", "snps,dwc3";
+			reg = <0x0 0xc0a00000 0x0 0x10000>;
+			clocks = <&syscon_apmu CLK_USB30>;
+			clock-names = "bus_early";
+			resets = <&syscon_apmu RESET_USB3_0>;
+			interrupt-parent = <&plic>;
+			interrupts = <125>;
+			interconnects = <&dram_range0>;
+			interconnect-names = "dma-mem";
+			phys = <&usbphy2>, <&combphy PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			status = "disabled";
+		};
+
+		usbphy0: phy@c0940000 {
+			compatible = "spacemit,usb2-phy";
+			reg = <0x0 0xc0940000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_AXI>;
+			status = "disabled";
+		};
+
+		usbphy1: phy@c09c0000 {
+			compatible = "spacemit,usb2-phy";
+			reg = <0x0 0xc09c0000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_P1>;
+			status = "disabled";
+		};
+
+		usbphy2: phy@0xc0a30000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0a30000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB30>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		combphy: phy@c0b10000 {
+			compatible = "spacemit,k1-combphy";
+			reg = <0x0 0xc0b10000 0x0 0x800>,
+			      <0x0 0xd4282910 0x0 0x400>;
+			reg-names = "ctrl", "sel";
+			resets = <&syscon_apmu RESET_PCIE0>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
