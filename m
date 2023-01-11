Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8E8C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPCQ1Ja6xLnmwL2IGjuk57EEsI0n95GhzEPophWNN/M=; b=rNIuxdWCXhXSnw
	bgptK/wcyewE/UneV3997uNqpu6fxLf8PJB0zIOFAS7DY0dYYjNBpCklJFtxJpcpgpuumNVkjsgRP
	Z2ExtY2aijDfXcj9be1iiv6+YsdkO7L9gLKLtuc6s8ypb4/PP/txUDAQlnImQy/+VD3mTlwlc47yL
	Mao+eOUWZK1M8NPyUWS2/kQ/Q3onQ+6j6j2yGHZrPIaDrl14LA7rVUlSJcoFIl5nrhkpcQ7BUttZ5
	7k2EPclJGncQDYoUmsz65r4IbzocdT48W4HWlnqC8uVabpDAkhF9y8x6/lpu0sOw1wHmuUgBHHqOt
	Jac6PuScTjCHOvsqGrfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaR5-00BKGj-Fc; Wed, 11 Jan 2023 12:42:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaQy-00BKCw-5f
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673440944; x=1704976944;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Wseus8kp/X9CAEnsHUperS5cHDrTpFB2y883uyGOqEU=;
  b=Z85OjG14Lw0nEN3w7vJwsr6VumtalqsOfBkeeWkkDBAleyUJ0roZDt7g
   NG0f+UnTa8vJ62nRbSIZcj+r+3ND+gzJvlJsO9/vVLIfMSJsYJBHHiI1q
   Omp5UMHm2KH6DVKT0eAcnogcA7tixie++nGFVJi8AOq85oROaXAychlsF
   NPSOVeZ5vfRBR03ddsOdbWDIFWGFTQlWNbcUPUkrgntfCctdIErLOxFwz
   4SEu2ckth4lAz3UpjWtU/i+mXUlJaRowQ3dIVaLLPCgW5pP2NY8acjuyb
   cUs34UpgBNUprlL4+u2+1aFZBjY5CLuzfjDXzUKHmfKYa5Bf+pP5fWOt8
   g==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="195258642"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:42:15 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:42:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 05:42:12 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 3/3] riscv: dts: microchip: add the Aldec TySoM's devicetree
Date: Wed, 11 Jan 2023 12:41:07 +0000
Message-ID: <20230111124106.2417152-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111124106.2417152-1-conor.dooley@microchip.com>
References: <20230111124106.2417152-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_044224_373686_891819D8 
X-CRM114-Status: GOOD (  15.85  )
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

The TySOM-M-MPFS250 is a compact SoC prototyping board featuring
a Microchip PolarFire SoC MPFS250T-FCG1152. Features include:
- 16 GiB FPGA DDR4
- 16 GiB MSS DDR4 with ECC (Although only 2 GiB is mapped in the
  FPGA design)
- eMMC
- SPI flash memory
- 2x Ethernet 10/100/1000
- USB 2.0
- PCIe x4 Gen2
- HDMI OUT
- 2x FMC connector (HPC and LPC)

Specifically flag this board as rev2, in case later boards have an
FPGA design revision with more of DDR available for use in Linux etc.

Link: https://www.aldec.com/en/products/emulation/tysom_boards/polarfire_microchip/tysom_m_mpfs250
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
- removed some extra cells properties
- changed filename compatible to rev2
- dropped pcie from fabric.dtsi, does not appear to be mapped to the MSS
---
 arch/riscv/boot/dts/microchip/Makefile        |   1 +
 .../dts/microchip/mpfs-tysom-m-fabric.dtsi    |  47 +++++
 .../riscv/boot/dts/microchip/mpfs-tysom-m.dts | 165 ++++++++++++++++++
 3 files changed, 213 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts

diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index 7427a20934f3..c54922a325fd 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -3,4 +3,5 @@ dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
 dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
 dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
 dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
+dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
 obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
new file mode 100644
index 000000000000..51d0c5176b9e
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2022 Microchip Technology Inc */
+
+// #include "dt-bindings/mailbox/miv-ihc.h"
+
+/ {
+	fabric_clk3: fabric-clk3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <62500000>;
+	};
+
+	fabric_clk1: fabric-clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
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
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
new file mode 100644
index 000000000000..e0797c7e1b35
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Original all-in-one devicetree:
+ * Copyright (C) 2020-2022 - Aldec
+ * Rewritten to use includes:
+ * Copyright (C) 2022 - Conor Dooley <conor.dooley@microchip.com>
+ */
+
+/dts-v1/;
+
+#include "mpfs.dtsi"
+#include "mpfs-tysom-m-fabric.dtsi"
+
+/* Clock frequency (in Hz) of the rtcclk */
+#define MTIMER_FREQ		1000000
+
+/ {
+	model = "Aldec TySOM-M-MPFS250T-REV2";
+	compatible = "aldec,tysom-m-mpfs250t-rev2", "microchip,mpfs";
+
+	aliases {
+		ethernet0 = &mac0;
+		ethernet1 = &mac1;
+		serial0 = &mmuart0;
+		serial1 = &mmuart1;
+		serial2 = &mmuart2;
+		serial3 = &mmuart3;
+		serial4 = &mmuart4;
+		gpio0 = &gpio0;
+		gpio1 = &gpio2;
+	};
+
+	chosen {
+		stdout-path = "serial1:115200n8";
+	};
+
+	cpus {
+		timebase-frequency = <MTIMER_FREQ>;
+	};
+
+	ddrc_cache_lo: memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x30000000>;
+		status = "okay";
+	};
+
+	ddrc_cache_hi: memory@1000000000 {
+		device_type = "memory";
+		reg = <0x10 0x00000000 0x0 0x40000000>;
+		status = "okay";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		status = "okay";
+
+		led0 {
+			gpios = <&gpio1 23 1>;
+			default-state = "on";
+			linux,default-trigger = "heartbeat";
+		};
+	};
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+	hwmon: hwmon@45 {
+		status = "okay";
+		compatible = "ti,ina219";
+		reg = <0x45>;
+		shunt-resistor = <2000>;
+	};
+};
+
+&gpio1 {
+	interrupts = <27>, <28>, <29>, <30>,
+		     <31>, <32>, <33>, <47>,
+		     <35>, <36>, <37>, <38>,
+		     <39>, <40>, <41>, <42>,
+		     <43>, <44>, <45>, <46>,
+		     <47>, <48>, <49>, <50>;
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy0>;
+
+};
+
+&mac1 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@1 {
+		reg = <1>;
+	};
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&mbox {
+	status = "okay";
+};
+
+&mmc {
+	max-frequency = <200000000>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&mmuart1 {
+	status = "okay";
+};
+
+&mmuart2 {
+	status = "okay";
+};
+
+&mmuart3 {
+	status = "okay";
+};
+
+&mmuart4 {
+	status = "okay";
+};
+
+&refclk {
+	clock-frequency = <125000000>;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+};
+
+&spi1 {
+	status = "okay";
+	flash@0 {
+		compatible = "micron,n25q128a11", "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <10000000>;
+	};
+};
+
+&syscontroller {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
