Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F294CA0FE8
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Aug 2025 23:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAkHJZt/XaLSPQFbv7FM3/5HeK3lxVvC0yidhB5O+Ok=; b=DG06ReoCl0ym+C
	PxauD8SDCFXfoShb4UkxlpQ6c6nXCs42UjJzsxLDN6iJ1e29O6HEWFrXsJfkNBKCGjN3PH1cjQ9h6
	Wz7pSZUlbnNx0Ri4qS19ENOr15eaK1MYX/5XDGq9LEIyXAKSdgy/jg/EdsZDyao2D+kegru4EXtxI
	zcfbP5epKc8Zx6VQlERrpuvpoordm9wvHP3JbaEXRGKiccF1pI2frItK+cJO3UA2Bgrt/b6G2N7Yu
	MyBjPReS3mLZ/Mcy6sP9/JuDkwEqNgN4IQBMJ6JoQ2aP1/LOaIA5vxTwhHJjsLA6NAL8MT7MGGNpS
	9wxLuop2IGmLgtnbx+2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usr3o-0000000AnAi-1uJ6;
	Sun, 31 Aug 2025 23:02:08 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usr3l-0000000An99-2Ksr
	for linux-riscv@lists.infradead.org;
	Sun, 31 Aug 2025 23:02:06 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B0401B220254;
	Mon,  1 Sep 2025 01:02:01 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 3/5] riscv: dts: starfive: add Milk-V Mars CM system-on-module
Date: Sun, 31 Aug 2025 15:59:28 -0700
Message-ID: <20250831225959.531393-4-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250831225959.531393-1-e@freeshell.de>
References: <20250831225959.531393-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_160205_736259_FC546805 
X-CRM114-Status: GOOD (  12.79  )
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

Milk-V Mars CM is a System-on-Module based on the StarFive VisionFive 2
board and Radxa CM3 System-on-Module compatible with the Raspberry Pi
CM4IO Classic IO Board.

Mars CM SoM features:

- StarFive JH7110 System on Chip with RV64GC up to 1.5GHz
- AXP15060 Power Management Unit
- LPDDR4 2GB / 4GB / 8GB DRAM memory
- BL24C04F 4K bits (512 x 8) EEPROM
- GigaDevice 25LQ128EWIG QSPI NOR Flash 16M or SoC ROM UART loader for
  boot (selectable by GPIO)
- eMMC5.0 8GB / 16GB / 32GB flash storage onboard
- AP6256 via SDIO 2.0 onboard wireless connectivity WiFi 5 + Bluetooth
  5.2 (optional, present in models with WiFi feature)
- 1x Motorcomm YT8531C Gigabit Ethernet PHY
- IMG BXE-4-32 Integrated GPU with 3D Acceleration:
  - H.264 & H.265 4K@60fps Decoding
  - H.265 1080p@30fps Encoding
  - JPEG encoder / decoder

Additional features available via 2x 100-pin connectors for CM4IO Board:
- 1x HDMI 2.0
- 1x MIPI DSI (4-lanes)
- 1x 2CH Audio out (via GPIO)
- 1x MIPI CSI (2x2-lanes or 1x4-lanes)
- 1x USB 2.0
- 1x PCIe 1-lane Host, Gen 2 (5Gbps)
- Up to 28x GPIO, supporting 3.3V
- UART x6
- PWM x8
- I2C x7
- SPI
- I2S

Link to Milk-V Mars CM schematics: https://github.com/milkv-mars/mars-files/tree/main/Mars-CM_Hardware_Schematices
Link to StarFive JH7110 Technical Reference Manual: https://doc-en.rvspace.org/JH7110/TRM/index.html
Link to Raspberry Pi CM4IO datasheet: https://datasheets.raspberrypi.com/cm4io/cm4io-datasheet.pdf

Add the devicetree file to make use of StarFive JH7110 common supported
features PMIC, EEPROM, UART, I2C, GPIO, eMMC, PCIe, QSPI Flash, PWM, and
Ethernet. Also configure the common SD Card interface mmc1 for onboard
SDIO BT+WiFi.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/Makefile               |  1 +
 .../boot/dts/starfive/jh7110-milkv-marscm-emmc.dts  | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index b3bb12f78e7d..79742617ddab 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
 
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-marscm-emmc.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
new file mode 100644
index 000000000000..1cf8e52d4f65
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 E Shattow <e@freeshell.de>
+ */
+
+/dts-v1/;
+#include "jh7110-milkv-marscm.dtsi"
+
+/ {
+	model = "Milk-V Mars CM";
+	compatible = "milkv,marscm-emmc", "starfive,jh7110";
+};
+
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
