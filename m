Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4425ED4A619
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 10:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YVuU0n6EGacxp5F+gOZYsOxfb4rXizlrUW3DnU02yD0=; b=K67+nwhNSvU9PU
	a1YmVlb0o9/sjHFSZpErGERUrkTCphDAmUnvAfEMhINtS/kGqMtQL8aNGnwOYnmltrjfRgvdWpZVD
	DX2SBK8hwf2ts1PwvATAA83cijmbtXv1WI0mdMN3d/iETGtWAOzCPAizyT2rtTWVxBwnqqAZ76yMw
	lb+VbUQ4/eZLaQjyAB1QyCmpYkeDHgTE5TP/hECxytw0lWxDrAT/NIF+N2mNoqWwcvRkvpgBoF0R8
	IlY47c9uqYhAanmuwkXbDZ0DCxii188RD1ATR1Nz7ag7IzQRKZxMkpV1u5KhBqG6AWxQrD5r7k5fL
	asGExD2YDN6ntVcpFpkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggd6-0000000DtfI-18P9;
	Fri, 16 Jan 2026 10:00:32 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vggd3-0000000Dtdc-2T3f
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 10:00:31 +0000
Received: from localhost.localdomain (unknown [116.25.94.194])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30e8ca646;
	Fri, 16 Jan 2026 18:00:17 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/2] riscv: dts: spacemit: add common board dtsi for OrangePi
Date: Fri, 16 Jan 2026 18:00:00 +0800
Message-Id: <20260116100001.208334-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Tid: 0a9bc63fa1e003a2kunm651e977725ca48
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDH0NMVkkYHR8fGR1CHUtISFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSkJPWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_020029_847827_357DF283 
X-CRM114-Status: GOOD (  11.03  )
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

The OrangePi R2S and OrangePi RV2 boards share many similarities, the
difference being that the RV2 board has more peripherals, such as HDMI
and Wi-Fi. Create a dtsi for shared parts to reduce duplication.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 69 +----------------
 .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 69 +----------------
 arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi | 76 +++++++++++++++++++
 3 files changed, 78 insertions(+), 136 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 58098c4a2aab..393270641b04 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -5,22 +5,11 @@
 
 /dts-v1/;
 
-#include "k1.dtsi"
-#include "k1-pinctrl.dtsi"
+#include "k1-orangepi.dtsi"
 
 / {
 	model = "OrangePi R2S";
 	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
-
-	aliases {
-		serial0 = &uart0;
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
 };
 
 &emmc {
@@ -32,59 +21,3 @@ &emmc {
 	no-sdio;
 	status = "okay";
 };
-
-&eth0 {
-	phy-handle = <&rgmii0>;
-	phy-mode = "rgmii-id";
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac0_cfg>;
-	rx-internal-delay-ps = <0>;
-	tx-internal-delay-ps = <0>;
-	status = "okay";
-
-	mdio-bus {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
-
-		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
-		reset-delay-us = <10000>;
-		reset-post-delay-us = <100000>;
-
-		rgmii0: phy@1 {
-			reg = <0x1>;
-		};
-	};
-};
-
-&eth1 {
-	phy-handle = <&rgmii1>;
-	phy-mode = "rgmii-id";
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac1_cfg>;
-	rx-internal-delay-ps = <0>;
-	tx-internal-delay-ps = <250>;
-	status = "okay";
-
-	mdio-bus {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
-
-		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
-		reset-delay-us = <10000>;
-		reset-post-delay-us = <100000>;
-
-		rgmii1: phy@1 {
-			reg = <0x1>;
-		};
-	};
-};
-
-&pdma {
-	status = "okay";
-};
-
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_2_cfg>;
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 41dc8e35e6eb..e53f52e27477 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -6,23 +6,12 @@
 
 /dts-v1/;
 
-#include "k1.dtsi"
-#include "k1-pinctrl.dtsi"
+#include "k1-orangepi.dtsi"
 
 / {
 	model = "OrangePi RV2";
 	compatible = "xunlong,orangepi-rv2", "spacemit,k1";
 
-	aliases {
-		serial0 = &uart0;
-		ethernet0 = &eth0;
-		ethernet1 = &eth1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
@@ -34,59 +23,3 @@ led1 {
 		};
 	};
 };
-
-&eth0 {
-	phy-handle = <&rgmii0>;
-	phy-mode = "rgmii-id";
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac0_cfg>;
-	rx-internal-delay-ps = <0>;
-	tx-internal-delay-ps = <0>;
-	status = "okay";
-
-	mdio-bus {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
-
-		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
-		reset-delay-us = <10000>;
-		reset-post-delay-us = <100000>;
-
-		rgmii0: phy@1 {
-			reg = <0x1>;
-		};
-	};
-};
-
-&eth1 {
-	phy-handle = <&rgmii1>;
-	phy-mode = "rgmii-id";
-	pinctrl-names = "default";
-	pinctrl-0 = <&gmac1_cfg>;
-	rx-internal-delay-ps = <0>;
-	tx-internal-delay-ps = <250>;
-	status = "okay";
-
-	mdio-bus {
-		#address-cells = <0x1>;
-		#size-cells = <0x0>;
-
-		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
-		reset-delay-us = <10000>;
-		reset-post-delay-us = <100000>;
-
-		rgmii1: phy@1 {
-			reg = <0x1>;
-		};
-	};
-};
-
-&pdma {
-	status = "okay";
-};
-
-&uart0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&uart0_2_cfg>;
-	status = "okay";
-};
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
new file mode 100644
index 000000000000..b4808f258adf
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
+ * Copyright (C) 2025 Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
+ */
+
+#include "k1.dtsi"
+#include "k1-pinctrl.dtsi"
+
+/ {
+	aliases {
+		ethernet0 = &eth0;
+		ethernet1 = &eth1;
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&eth0 {
+	phy-handle = <&rgmii0>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac0_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <0>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii0: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&eth1 {
+	phy-handle = <&rgmii1>;
+	phy-mode = "rgmii-id";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1_cfg>;
+	rx-internal-delay-ps = <0>;
+	tx-internal-delay-ps = <250>;
+	status = "okay";
+
+	mdio-bus {
+		#address-cells = <0x1>;
+		#size-cells = <0x0>;
+
+		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
+		reset-delay-us = <10000>;
+		reset-post-delay-us = <100000>;
+
+		rgmii1: phy@1 {
+			reg = <0x1>;
+		};
+	};
+};
+
+&pdma {
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_2_cfg>;
+	status = "okay";
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
