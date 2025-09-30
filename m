Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21294CCA468
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 10:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2kmcPxJ1IZBbxsxJJFPltSjYp11N6HL4ojsfwIsgg4=; b=VMNqiGhD47sJ9p
	hv0oB/wChzxcyWIaF3SrWC6N2sGT18ylK1Ob0Ml6eqoqbj4Xq1ovLHRTYwL7DEETtY/ZvV8L7S/ry
	CPkpxr2d7Wwm7tdAKUQKxTEt+Yoy8oAJKEVzVGNcXb0k8FE6XQw5LA3h1kzsmtztAX9iPB0viNZWE
	L3tWJaLSRRN3NdJb0DJhn659uGyFs+kWLR2HZQ9jlR01oRhuUWXsIlzhcJchbr+hRHoFYBpCVPmYG
	F2V6VqVsCGXlUM62kXF2Y8Q5Sfv4D+ZSOg1mmjLKhPTvPmoUuZByQSjLmuWLrRIvklQ4hEzVojnXO
	qMBu28B8T3KpUeZ7N+8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XDO-00000004x5O-3VI6;
	Tue, 30 Sep 2025 10:04:10 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3XDM-00000004x4q-11ES
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 10:04:09 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1759226640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mvbioyt5TZ0Bjifd5WH/AHYzbKrXx5QlgQ8yN3wfKPUIKBhZ9JRg6yaXSARU4SxHFN5GItlfo1rtcv2m1+0FSVFBQsmm+MhmrIcB75cAfglCk9jRDEtTLJ11K0E3sVDflN6HlhWlAHm1r3Vj2eXWf9b8O5XskDGy5S+gXv9vIkU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759226640; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=X+2Kt7ia+spiy1WSmoZW7Xpn1ruAr5JNqGp2P8AiYYo=; 
	b=RdRa7o2bPSVGPpCdYbWw9XIjwnjogUIbonJHU2pqjwkeTFHxcP5fcKzqGedE0/0CpugUnPwXBxGArn6ewNfdP//HWZbzftq6lJqEd+qIEIS6ccgViBwNVCb+bvc39Pwr6mKItrDPcvxLrwUNMxdufEkCkeC3HD8z6khxmwayXzA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759226640;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=X+2Kt7ia+spiy1WSmoZW7Xpn1ruAr5JNqGp2P8AiYYo=;
	b=mflzYbfNcZdJYS4Hb+wkeIHFdK9qS4IdJyyP4wsRvvjIIgBg78f+N01tx5XSLG7S
	9UWgol1LaIcb2aD6swjnFMbJoans2pattEJ9dIpJbAQa4UFtlxFgcRMDYLjmVB1YQFG
	T47gb1tDabaui9IzUw2NgHNmYGNPW+myCwNOL4HjMVvLTiASOu7p6mFhyq7r+Xf0m8I
	uU+7saeDsHcOFcuIVwU7uVBBKnbGOKBlM/AtC14Hc4fDCneaTMiiDpRt7dXPgCFmVGs
	Beb/lng8xgLBqDb3rkhuTlOzkxE1GHuD8mHIVi5pRgb16TjAdcOR751lkfyUXEkDWr6
	MiHgkAIRug==
Received: by mx.zohomail.com with SMTPS id 1759226638649745.844690092961;
	Tue, 30 Sep 2025 03:03:58 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Yao Zi <ziyao@disroot.org>,
	E Shattow <e@freeshell.de>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v2 2/2] riscv: dts: starfive: add DT for Orange Pi RV
Date: Tue, 30 Sep 2025 18:03:18 +0800
Message-ID: <20250930100318.2131968-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930100318.2131968-1-uwu@icenowy.me>
References: <20250930100318.2131968-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_030408_342502_F485C662 
X-CRM114-Status: GOOD (  17.45  )
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

Orange Pi RV is a newly released SBC with JH7110 SoC, single GbE port
(connected to JH7110 GMAC0 via a YT8531 PHY), 4 USB ports (via a VL805
PCIe USB controller connected to JH7110 PCIE0), a M.2 M-key slot
(connected to JH7110 PCIE1), a HDMI video output, a 3.5mm audio output
and a microSD slot.

Other Onboard peripherals contain a SPI NOR (which contains the U-Boot
firmware), a 24c02 EEPROM storing some StarFive-specific information
(factory programmed and read only by default) and an Ampak AP6256 SDIO
Wi-Fi module.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
Changes in v2:
- Property order change mentioned in the review of v1.
- Added Wi-Fi (along with the always on VCC3V3_PCIE regulator, which is
  used to power up WIFI_3V3). The OOB IRQ is still not possible to use
  because of some incompatibility between StarFive pinctrl driver and
  brcmfmac.
- Removed the LED because it's in common DTSI.

 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-orangepi-rv.dts  | 87 +++++++++++++++++++
 2 files changed, 88 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index b3bb12f78e7d5..24f1a44828350 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
 
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-orangepi-rv.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
new file mode 100644
index 0000000000000..5a917b7db6f78
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
@@ -0,0 +1,87 @@
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
+&mmc0_pins {
+	/*
+	 * As the MMC0 bus is used to connect a SDIO Wi-Fi card instead of
+	 * an eMMC card, and the eMMC RST is repurposed to be an enablement
+	 * pin of the SDIO Wi-Fi, remove it from the pinctrl node and manage
+	 * it as a GPIO instead.
+	 */
+	/delete-node/ rst-pins;
+};
+
+&mmc1 {
+	/delete-property/ cd-gpios;
+	broken-cd;
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
+	motorcomm,tx-clk-adj-enabled;
+	motorcomm,tx-clk-10-inverted;
+	motorcomm,tx-clk-100-inverted;
+	motorcomm,tx-clk-1000-inverted;
+	motorcomm,rx-clk-drv-microamp = <3970>;
+	motorcomm,rx-data-drv-microamp = <2910>;
+};
+
+&pwmdac {
+	status = "okay";
+};
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
