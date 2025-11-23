Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDCECFD313
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 22:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xZWAEi80WQQIs1JxVwdjckh4iGstnkalOuGMVG4XH9Y=; b=E0lYXROoUKAEm/
	WScgISfy6KAib2XqefoAWgLQcsvPtH/y2PvvDs7+Pb+nqeTdr3iMvgm2yN7xTyUvZBrxEVOIbcJWF
	7nOuN3GfbqZ7rgvy/gpG5a/NbnvuGd/s8bahYI6s900hc9B5fHvOvnjwx4KB8sDH7lKsZ49NtMGWK
	CQ/ELHO/bIjWrtHu5fiPkcwuo632u18YSJLlzhaoMm0Cg4qvzSKEhPl8TDK59UqMv4lZaoN1Naiz+
	86XejJEBFBa057J3vHFe7w0N6OTUn32gNqHiMxs4WUxV1TNpa6kwbCFHK+v4a8NcHNcO7tGamKcyQ
	txLIpUehJPxBwacmOV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIxL-0000000Am3H-3sL1;
	Sun, 23 Nov 2025 22:53:19 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNIxB-0000000Altr-0iqI
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 22:53:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1763938311;
	bh=+7C2Aew/6tLzcZ4pkubvFevq8gNEauyKc69XNTYNN0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hjhT3LRUaJZ5IrYrqcCda/dMs/7ycESGlTax3N0xXrm9xoBuKQ+UGf7BAFYE2bUnN
	 vxnXvjduH3VGlEL3bHjxRixDfcKvTjV98Wy9UBxpL8BhRwDIZKdGoA0epz60+Q6Xtj
	 hfOAYF7XNV1OC8R+4OeREFjrMBMDNs3uibVSRjLWLBUuXQxFC9K9820PKbsPIK5O//
	 HKaTqdCOZxa3S4urKqv8XXfXSPxrGQxeBUjkTrPiRzT/+KaPxzCQqS1voGjroCVM1y
	 cPi8h2Adh2q1FnmCjX36JfigC+cFxR0H2ujN61iXsokd0D4rCqu2sryD7IDUTNoGMz
	 lutkf/OKfTK6w==
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 389FBB2201BD;
	Sun, 23 Nov 2025 23:51:48 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v3 2/2] riscv: dts: starfive: add Orange Pi RV
Date: Sun, 23 Nov 2025 14:50:45 -0800
Message-ID: <20251123225059.49665-3-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20251123225059.49665-1-e@freeshell.de>
References: <20251123225059.49665-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_145311_127091_42379673 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, E Shattow <e@freeshell.de>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Icenowy Zheng <uwu@icenowy.me>

Orange Pi RV is a SBC based on the StarFive VisionFive 2 board.

Orange Pi RV features:

- StarFive JH7110 SoC
- GbE port connected to JH7110 GMAC0 via YT8531 PHY
- 4x USB ports via VL805 PCIe USB controller connected to JH7110 pcie0
- M.2 M-key slot connected to JH7110 pcie1
- HDMI video output
- 3.5mm audio output
- Ampak AP6256 SDIO Wi-Fi/Bluetooth module on mmc0
- microSD slot on mmc1
- SPI NOR flash memory
- 24c02 EEPROM (read only by default)

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-orangepi-rv.dts  | 76 +++++++++++++++++++
 2 files changed, 77 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 62b659f89ba7..d34c8c79bc10 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-emmc.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-lite.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-orangepi-rv.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
new file mode 100644
index 000000000000..16ec2767134e
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+/dts-v1/;
+#include "jh7110-common.dtsi"
+
+/ {
+	model = "Xunlong Orange Pi RV";
+	compatible = "xunlong,orangepi-rv", "starfive,jh7110";
+
+	/* This regulator is always on by hardware */
+	reg_vcc3v3_pcie: regulator-vcc3v3-pcie {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3-pcie";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&sysgpio 62 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&gmac0 {
+	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
+	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
+	starfive,tx-use-rgmii-clk;
+	status = "okay";
+};
+
+&mmc0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cap-sd-highspeed;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	vmmc-supply = <&reg_vcc3v3_pcie>;
+	vqmmc-supply = <&vcc_3v3>;
+	status = "okay";
+
+	ap6256: wifi@1 {
+		compatible = "brcm,bcm43456-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+		/* TODO: out-of-band IRQ on GPIO21 */
+	};
+};
+
+&mmc1 {
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_HIGH>;
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie1 {
+	status = "okay";
+};
+
+&phy0 {
+	rx-internal-delay-ps = <1500>;
+	tx-internal-delay-ps = <1500>;
+	motorcomm,rx-clk-drv-microamp = <3970>;
+	motorcomm,rx-data-drv-microamp = <2910>;
+	motorcomm,tx-clk-adj-enabled;
+	motorcomm,tx-clk-10-inverted;
+	motorcomm,tx-clk-100-inverted;
+	motorcomm,tx-clk-1000-inverted;
+};
+
+&pwmdac {
+	status = "okay";
+};
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
