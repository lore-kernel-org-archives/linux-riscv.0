Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2746EC36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 09:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=COBqz5OMu06GvDWam6oyQN8j/TYKj4cIpKmT5Fv3Dbo=; b=YjxElNOk0qrfvx
	1feyvPmCVut1RyB+NcYjxWjlxF8W8cWBX06zwAB09Ho+ykXBNK38QQ2tzd5pmx2Wu6ZszXgGG4aVr
	NjlFK+9SEwDVy50B6c5iVeXCWIBsGta/mybfg02di5I3QxwciGKuyBG0iCOpy+S5Sd1NnRKqhASMu
	O7lpx+/oQjv+ttsrMpKGoWE3wjuvbAjcrda3kIbxTQKtcpRmTtowzS2+RAbyuBeIs7jGmJIZki58V
	LUy/2FtBki0gg7OVdkfOdlLUiUEFN2krMsTJrSEVBTJgZtcnahh1xyMYsIPHFavQ87bERD35lz5Bq
	17qZ9+vrVo0Cd0sk2wcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RZt-00000006gRY-3jNG;
	Wed, 09 Apr 2025 09:18:37 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RZq-00000006gPk-2YAI
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 09:18:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1744190306; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=S7upKIOYjF/0byUSM97pC9pIwWTRz3EC16Sbz7/VpY+SlGlP/TKpNxUkOSJb7cDkKcPzw/r1I31Gje2NXmKr6C9z/cUG5ee1Sf0BfcbNVhZZ7cfBxvDq/lajdEUr6Ggl5H4iOuAsFwyd5I/NEHsT1lmGpaEJ7fTqYqBPi1pjXic=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1744190306; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KwHCepAXG5Am7WCb6/BmtfPU10GewLqbpuq+dp90/YU=; 
	b=SW6SO7nJKS6UZN/KeVBrwC9vqRi3TLT9M5K67cicyM5/P5MIbCQilywKed9KUQzwhQRD5Q1yRMX4P615ChCnBbciZq2CZYk3ovufVqYTwL1lvVHcM/UlEtENk0C8uY6+Gy9Dur8ENbt/pH2g95vtIIm6sq5o3yvjyXWHcVGN0QE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744190306;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KwHCepAXG5Am7WCb6/BmtfPU10GewLqbpuq+dp90/YU=;
	b=hLE2NkMjspTEcAjl+TFG3q4SN+NokZdZTQ11WdQFT3YzVVD1DqiD0gWZb8RUPR4P
	JnFPUdLlzmwrJsjadg2J27hnmBEWwG73j61Gu18dVcwvUnUJlserU8+m/UPK5MfAulW
	mcKZhxdM3VTR0HywD1dUDMuz8+FJIRMHCYl0/Jd9mPhVr4lkd2PRc3VR131+CNn9AQQ
	FdVnEu8S/As/EkTmqNLsbWu4dL2MDzvbCSrnwITvcJUF/ON2OoGTlve3UFj/TuUZhEn
	XT1xgjsV9Z3k3jbi1cb2ze2FMjTgsITJ0uWH9m4JFX3uRGT8cA99RInJtBzpLcXW8p0
	yscXTRt2Vw==
Received: by mx.zohomail.com with SMTPS id 1744190304414130.91962773873797;
	Wed, 9 Apr 2025 02:18:24 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] riscv: dts: starfive: add DT for Orange Pi RV
Date: Wed,  9 Apr 2025 17:18:01 +0800
Message-ID: <20250409091801.855083-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250409091801.855083-1-uwu@icenowy.me>
References: <20250409091801.855083-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_021834_703309_3E92A5DD 
X-CRM114-Status: GOOD (  13.08  )
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

Onboard peripherals contain a SPI NOR (which contains the U-Boot
firmware) and an Ampak AP6256 SDIO Wi-Fi module.

As the schematics isn't available yet, the SDIO Wi-Fi is left disabled
yet.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../boot/dts/starfive/jh7110-orangepi-rv.dts  | 73 +++++++++++++++++++
 2 files changed, 74 insertions(+)
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
index 0000000000000..bde01f117e0b2
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
+ */
+
+/dts-v1/;
+#include "jh7110-common.dtsi"
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Xunlong Orange Pi RV";
+	compatible = "xunlong,orangepi-rv", "starfive,jh7110";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-ack {
+			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			linux,default-trigger = "heartbeat";
+			label = "ack";
+		};
+	};
+};
+
+&gmac0 {
+	starfive,tx-use-rgmii-clk;
+	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
+	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&mmc0 {
+	/* TODO: Ampak AP6256 Wi-Fi module attached here */
+	status = "disabled";
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
+	motorcomm,tx-clk-adj-enabled;
+	motorcomm,tx-clk-10-inverted;
+	motorcomm,tx-clk-100-inverted;
+	motorcomm,tx-clk-1000-inverted;
+	motorcomm,rx-clk-drv-microamp = <3970>;
+	motorcomm,rx-data-drv-microamp = <2910>;
+	rx-internal-delay-ps = <1500>;
+	tx-internal-delay-ps = <1500>;
+};
+
+&pwmdac {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+};
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
