Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37474C55171
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 10:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kAiMXV/9kBmNGhOPAJkfsro2Rn8TjXg7Wy4sr0LEuMg=; b=LaPWk6wPRUBP3P
	7RQSVekHW9kqa4AEWTn+IVLJp/BBHUKmVFROKIKUrxfZ94PaKtsLYStlnh07sYZ5Q6W3gfX+YQNEc
	XtGHUeQ7olJiVSiWCzad/sYYf6l6w7psTZ2diUD/5qUfJEQ+Ay4+GlRi/k3Kx+y6r8zx8IkYox1Hb
	wQDqR7th2gcIvV2PslP9aQfipr1S3mCkhpqpM6Izj/4gjm2NhBpRYmq99yXDnnO/fSBiZTFtjfUmo
	IQwoA7jAI/Q6LxVjG3PUtwXq5DwoPkEGNbULPn8ZQQQSnrfPl5QlQFswr/G21HNqCCQpebqoYXgOO
	lRhnJ3q/Kn8qr/SQ7+dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqT0q-0000000FX2q-31V3;
	Sun, 02 Aug 2026 10:01:44 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqT0n-0000000FX1z-2Ek3
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 10:01:43 +0000
Received: from Vostro-3710.. (unknown [14.220.232.116])
	by smtp.qiye.163.com (Hmail) with ESMTP id 48732cd5a;
	Sun, 2 Aug 2026 18:01:29 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/1] riscv: dts: spacemit: sort nodes on OrangePi RV2
Date: Sun,  2 Aug 2026 18:01:01 +0800
Message-Id: <20260802100101.327815-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-HM-Tid: 0a9fc1ebe08703a2kunmb239287e2450e3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGkwaVk0YTEwdGUMdQx4aHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKT1VJSUtVSUhJVUpKTVlXWRYaDxIVHRRZQVlPS0hVSktIS0
	pMS1VKS0tVS1kG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_030141_763139_E982D72E 
X-CRM114-Status: UNSURE (   6.15  )
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

Sort the nodes for DT. Also reorder the properties of the sdhci0 node.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 66 +++++++++----------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..9b970a963199 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -25,6 +25,17 @@ chosen {
 		stdout-path = "serial0";
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			label = "sys-led";
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
+
 	pcie_vcc3v3: regulator-pcie-vcc3v3 {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -63,17 +74,6 @@ vcc5v0_usb30: regulator-vcc5v0-usb30 {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc_5v0>;
 	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		led1 {
-			label = "sys-led";
-			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_LOW>;
-			linux,default-trigger = "heartbeat";
-			default-state = "on";
-		};
-	};
 };
 
 &combo_phy {
@@ -138,10 +138,6 @@ rgmii1: phy@1 {
 	};
 };
 
-&pdma {
-	status = "okay";
-};
-
 &i2c8 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
@@ -290,6 +286,10 @@ &pcie2 {
 	status = "okay";
 };
 
+&pdma {
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
@@ -335,6 +335,24 @@ uboot@a0000 {
 	};
 };
 
+&sdhci0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_LOW>;
+	disable-wp;
+	no-mmc;
+	no-sdio;
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	vmmc-supply = <&buck4_3v3>;
+	vqmmc-supply = <&aldo1>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
@@ -366,21 +384,3 @@ hub_3_0: hub@2 {
 		vdd-supply = <&vcc_5v0>;
 	};
 };
-
-&sdhci0 {
-	pinctrl-names = "default", "uhs";
-	pinctrl-0 = <&mmc1_cfg>;
-	pinctrl-1 = <&mmc1_uhs_cfg>;
-	bus-width = <4>;
-	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_LOW>;
-	no-mmc;
-	no-sdio;
-	disable-wp;
-	cap-sd-highspeed;
-	vmmc-supply = <&buck4_3v3>;
-	vqmmc-supply = <&aldo1>;
-	sd-uhs-sdr25;
-	sd-uhs-sdr50;
-	sd-uhs-sdr104;
-	status = "okay";
-};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
