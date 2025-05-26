Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19567C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pIZjxeNLI1RejCp6LkGfnqrdsINTY46w2xISo0FzsW8=; b=V7yr+8SVYiOjfh
	j412aQMqzV8b5Iq3BbBR5B7fiYs2c3XVcge0edK70BWQ1QTz8fv4UttxhtEB7Hv+dED7iNxIxJKRx
	/ZBBkxFDDdjVJEpWKirI4zrHXN06UoMzhih1wZv/Rk2QeniFuEnEwob0B2aGOSsnsUPmoPcZS0UY2
	+PxPZZBGo6IlecHZafJW2iJLiswVb37Wn6sR6chKNCFJBQUBlVvgcxJDLunoc+PGSGIX05W8Bn48p
	DwZcoYodj1WYB4qTz9F7RBZUR6e00LR1+WWIxRj6WdJr1pjsTg9uYfRbGb6L3DHvCscoGtPjtGx/i
	uzH9sqQkRIYXE7V/eakA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJa4a-00000009Ad9-0r6q;
	Mon, 26 May 2025 15:49:08 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJZ0e-000000093Rb-408n
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 14:41:02 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.37])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16709a33f;
	Mon, 26 May 2025 22:40:50 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Date: Mon, 26 May 2025 22:40:20 +0800
Subject: [PATCH v4 4/4] riscv: dts: spacemit: add usb3.0 support for K1
MIME-Version: 1.0
Message-Id: <20250526-b4-k1-dwc3-v3-v4-4-63e4e525e5cb@whut.edu.cn>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
In-Reply-To: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748270423; l=5426;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=cGVbOqpUYlVjPJ9sdnL9JMn3K7BgmO8hSIFFZcC21rQ=;
 b=dvUL5idzS2fqYMvI0gmi9yeE8UN14gsHQUVnnAR5LvJGp5WR/4J8RqMrM/PWSx01FX6z+kN2K
 qehbIV1k72sAULbGHhGZM40nRnWqpDmugEUNRdZDvuBNm1VZGoKSshL
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSBhIVkNPS00YSEMeGB9NGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVITFlXWRYaDxIVHRRZQVlPS0hVSktJQk1KSlVKS0tVS1kG
X-HM-Tid: 0a970d0a072803a1kunm5f56ec4c12f04
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pz46FAw6QjEyOgw4CjYBFDcy
	EgMaCQ1VSlVKTE9DSUxLT05MTElPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVITFlXWQgBWUFNQk9NNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_074101_417237_192F8B15 
X-CRM114-Status: UNSURE (   8.85  )
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
this relationship through the interconnects node "dma-mem", similar to [1].

Link: https://lore.kernel.org/all/09e5e29a4c54ec7337e4e62e5d6001b69d92b103.1554108995.git-series.maxime.ripard@bootlin.com [1]

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 51 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 67 +++++++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 816ef1bc358ec490aff184d5915d680dbd9f00cb..1f4585fe30b64a63ee643ed9596a3a97db8c0f0d 100644
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
@@ -35,3 +54,35 @@ &uart0 {
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
+	vbus-supply = <&usb3_vbus>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub_2_0: hub@1 {
+		compatible = "usb2109,2817";
+		reg = <0x1>;
+		vdd-supply = <&usb3_vhub>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+	};
+
+	hub_3_0: hub@2 {
+		compatible = "usb2109,817";
+		reg = <0x2>;
+		vdd-supply = <&usb3_vhub>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio K1_GPIO(124) GPIO_ACTIVE_LOW>;
+	};
+};
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 61f5ca250ded0da7b91cd4bbd55a5574a89c6ab0..e57b39bba877f90d52227349c983ce638559e601 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include <dt-bindings/clock/spacemit,k1-syscon.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 / {
@@ -346,6 +348,15 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		mbus0: dram-controller@0 {
+			compatible = "spacemit,k1-mbus";
+			reg = <0x0 0x00000000 0x0 0x80000000>;
+			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			#interconnect-cells = <0>;
+		};
+
 		syscon_rcpu: system-controller@c0880000 {
 			compatible = "spacemit,k1-syscon-rcpu";
 			reg = <0x0 0xc0880000 0x0 0x2048>;
@@ -358,6 +369,62 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usb_dwc3: usb@c0a00000 {
+			compatible = "spacemit,k1-dwc3";
+			reg = <0x0 0xc0a00000 0x0 0x10000>;
+			clocks = <&syscon_apmu CLK_USB30>;
+			clock-names = "usbdrd30";
+			interconnects = <&mbus0>;
+			interconnect-names = "dma-mem";
+			interrupts = <125>;
+			phys = <&usbphy2>, <&combphy PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi";
+			resets = <&syscon_apmu RESET_USB3_0>;
+			snps,hsphy_interface = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis-u2-freeclk-exists-quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis_rxdet_inp3_quirk;
+			status = "disabled";
+		};
+
+		usbphy0: phy@c0940000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0940000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_AXI>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usbphy1: phy@c09c0000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc09c0000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB_P1>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		usbphy2: phy@c0a30000 {
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
