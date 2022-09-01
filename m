Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EB2ECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJUadajNswZKpCPXTtz3uvnIXwPD1h2cLofVCGFcofM=; b=KxAC3n0HjoCodN
	St/lAM7WVL08LChaL40FbaKSJouzjOwJcHYohiF1CaCgGvnpZ9FyTboiPJsWmuEWyoK5ZWJ0f4R3p
	c7POkWChLdwBKGSoDEzPyLM5YNCzZ7N/hmSelwexooDedoixthnlmZoYUvv6n78+5wvASlSTluHwh
	82oGCK88g6rVWbENrhb/dI2RH1biJUBdVjgBN8FABin5R6C+bc6B2pG8/c1zwBDjC0f+K3GtGCfhO
	P9xZmHmJNu3baAeVvo40sLGmb2DvvF9gaFLEwwUXRvYfWGHiwetwdCib1dTjgb0eYcgLsVb+F7mjQ
	ZZV89dzdTpaG0BXNX3tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkPN-00C8H5-LC; Thu, 01 Sep 2022 13:39:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkLr-00C65D-W1
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 13:35:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662039323; x=1693575323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d2iUfrhEMIj32cIjtAG6kmTs6cmS2qn1d7T1i0Rrnpk=;
  b=V534PUchGakl4OOriq9Y5Hyz1jIj67faXMaFmAxLCrS7oPkNcaH0tozH
   EqAiifnx8zfe1Y10Eo/f1oAY1ypLqQAxt7rRLhWJBMf1iyoiHmfCsL2pN
   KJrMnAPUTZEI5uZVQBEKU8uUSwMFjz3STX6hc88Labkv3fBNyO2j/fTpW
   Cwkt+bGg89/j+S8zMG1aIyUNZHLitrbZaSvqZvH76zZT/gq8tkGTNh3ll
   BuJ9J7n74VLZ5jlF0rj/JE8tRCaHrv0r8bplQXhpPTidYvb48jx2vxA0F
   JNO2Fg80UP5n4KjGAPyz1HoOb+1e8DXA7qN5IbCrN0Cv91uQ0L6y0oa02
   A==;
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; 
   d="scan'208";a="111754634"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Sep 2022 06:35:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Sep 2022 06:35:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Sep 2022 06:35:11 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3 9/9] riscv: dts: microchip: add a devicetree for aries' m100pfsevp
Date: Thu, 1 Sep 2022 14:34:04 +0100
Message-ID: <20220901133403.3392291-10-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220901133403.3392291-1-conor.dooley@microchip.com>
References: <20220901133403.3392291-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_063524_181338_9237E167 
X-CRM114-Status: GOOD (  16.54  )
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

Add device trees for both configs used by the Aries Embedded
M100PFSEVP. The M100OFSEVP consists of a MPFS250T on a SOM,
featuring:
- 2GB DDR4 SDRAM dedicated to the HMS
- 512MB DDR4 SDRAM dedicated to the FPGA
- 32 MB SPI NOR Flash
- 4 GByte eMMC

and a carrier board with:
- 2x Gigabit Ethernet
- USB
- 2x UART
- 2x CAN
- TFT connector
- HSMC extension connector
- 3x PMOD extension connectors
- microSD-card slot

Link: https://www.aries-embedded.com/polarfire-soc-fpga-microsemi-m100pfs-som-mpfs025t-pcie-serdes
Link: https://www.aries-embedded.com/evaluation-kit/fpga/polarfire-microchip-soc-fpga-m100pfsevp-riscv-hsmc-pmod
Link: https://downloads.aries-embedded.de/products/M100PFS/Hardware/M100PFSEVP-Schematics.pdf
Co-developed-by: Wolfgang Grandegger <wg@aries-embedded.de>
Signed-off-by: Wolfgang Grandegger <wg@aries-embedded.de>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Note to self:
The amount of DDR at 0x10... is probably a fraction of what is actually there.

 arch/riscv/boot/dts/microchip/Makefile        |   1 +
 .../dts/microchip/mpfs-m100pfs-fabric.dtsi    |  45 +++++
 .../boot/dts/microchip/mpfs-m100pfsevp.dts    | 179 ++++++++++++++++++
 3 files changed, 225 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts

diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index f18477b2e86d..7427a20934f3 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
 dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
 dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
 obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
new file mode 100644
index 000000000000..7b9ee13b6a3a
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2022 Microchip Technology Inc */
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
diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
new file mode 100644
index 000000000000..184cb36a175e
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Original all-in-one devicetree:
+ * Copyright (C) 2021-2022 - Wolfgang Grandegger <wg@aries-embedded.de>
+ * Rewritten to use includes:
+ * Copyright (C) 2022 - Conor Dooley <conor.dooley@microchip.com>
+ */
+/dts-v1/;
+
+#include "mpfs.dtsi"
+#include "mpfs-m100pfs-fabric.dtsi"
+
+/* Clock frequency (in Hz) of the rtcclk */
+#define MTIMER_FREQ	1000000
+
+/ {
+	model = "Aries Embedded M100PFEVPS";
+	compatible = "aries,m100pfsevp", "microchip,mpfs";
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
+		reg = <0x0 0x80000000 0x0 0x40000000>;
+	};
+	ddrc_cache_hi: memory@1040000000 {
+		device_type = "memory";
+		reg = <0x10 0x40000000 0x0 0x40000000>;
+	};
+};
+
+&can0 {
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&gpio0 {
+	interrupts = <13>, <14>, <15>, <16>,
+		     <17>, <18>, <19>, <20>,
+		     <21>, <22>, <23>, <24>,
+		     <25>, <26>;
+	ngpios = <14>;
+	status = "okay";
+
+	pmic-irq-hog {
+		gpio-hog;
+		gpios = <13 0>;
+		input;
+	};
+
+	/* Set to low for eMMC, high for SD-card */
+	mmc-sel-hog {
+		gpio-hog;
+		gpios = <12 0>;
+		output-high;
+	};
+};
+
+&gpio2 {
+	interrupts = <13>, <14>, <15>, <16>,
+		     <17>, <18>, <19>, <20>,
+		     <21>, <22>, <23>, <24>,
+		     <25>, <26>, <27>, <28>,
+		     <29>, <30>, <31>, <32>,
+		     <33>, <34>, <35>, <36>,
+		     <37>, <38>, <39>, <40>,
+		     <41>, <42>, <43>, <44>;
+	status = "okay";
+};
+
+&mac0 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy0>;
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&mac1 {
+	status = "okay";
+	phy-mode = "gmii";
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@0 {
+		reg = <0>;
+	};
+};
+
+&mbox {
+	status = "okay";
+};
+
+&mmc {
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	no-1-8-v;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
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
+&pcie {
+	status = "okay";
+};
+
+&qspi {
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
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
