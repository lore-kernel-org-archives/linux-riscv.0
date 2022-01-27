Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB541C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rl+JPE7OgpquF9YGSSWJETh6fD7cbVfC2+0ONBW1/8=; b=nzrT3bZkWIPe7f
	MvyBxJP7YMZfUuUBTPjG7jiH+RJqmBm3tJO9scdZM55F8sRErsfxKPdfwbVb8z05OCJVW79fx3KEA
	DFB84ZKDcHPoG644JLx93sEjUZ7IxG7XRsS10Io84a7Nfmb1zBEGVqjiX7ntRYd8BPaO0UJ1bfixP
	Gggq++18WRIHKA4QDZtNYpLTikxynFt8q5DxS9t5urCB6mBkCgmwg2zr2ubhygAGMEx43ai2AY/6S
	LWYS3TfV7wWLU3cUZxvs3qz7C10NnsvjBSRbM2y/FmNXkErKol3791Wtxtic30euVSeMiu0/RXDMG
	jLG8XJEVHDjXcnT1QNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Ws-00GCTo-R6; Thu, 27 Jan 2022 15:17:42 +0000
Received: from out28-51.mail.aliyun.com ([115.124.28.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WR-00GC4T-N8
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:18 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07451715|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.277158-0.000105434-0.722737;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047212; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85P.V_1643296630; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85P.V_1643296630)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:12 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 09/12] riscv: dts: add device tree for Nuclei DemoSoC w/ UX600
 on DDR200T
Date: Thu, 27 Jan 2022 23:16:44 +0800
Message-Id: <20220127151647.2375449-10-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071716_032727_FED06CF1 
X-CRM114-Status: GOOD (  15.79  )
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

As we're supporting Nuclei DemoSoC for UX600 CPU cores on DDR200T FPGA
prototyping board, add device tree files for it, including DTSI files
for basic DemoSoC structure, DemoSoC with UX600 and DemoSoC running on
DDR200T for further reusing.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/nuclei/Makefile           |  2 +
 .../dts/nuclei/nuclei-demosoc-ddr200t.dtsi    | 41 ++++++++++++
 .../nuclei/nuclei-demosoc-ux600-ddr200t.dts   | 13 ++++
 .../boot/dts/nuclei/nuclei-demosoc-ux600.dtsi | 49 ++++++++++++++
 .../riscv/boot/dts/nuclei/nuclei-demosoc.dtsi | 67 +++++++++++++++++++
 6 files changed, 173 insertions(+)
 create mode 100644 arch/riscv/boot/dts/nuclei/Makefile
 create mode 100644 arch/riscv/boot/dts/nuclei/nuclei-demosoc-ddr200t.dtsi
 create mode 100644 arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600-ddr200t.dts
 create mode 100644 arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600.dtsi
 create mode 100644 arch/riscv/boot/dts/nuclei/nuclei-demosoc.dtsi

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index ff174996cdfd..fd31084986da 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -3,5 +3,6 @@ subdir-y += sifive
 subdir-y += starfive
 subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
 subdir-y += microchip
+subdir-y += nuclei
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
diff --git a/arch/riscv/boot/dts/nuclei/Makefile b/arch/riscv/boot/dts/nuclei/Makefile
new file mode 100644
index 000000000000..57970aabf01d
--- /dev/null
+++ b/arch/riscv/boot/dts/nuclei/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_NUCLEI) += nuclei-demosoc-ux600-ddr200t.dtb
diff --git a/arch/riscv/boot/dts/nuclei/nuclei-demosoc-ddr200t.dtsi b/arch/riscv/boot/dts/nuclei/nuclei-demosoc-ddr200t.dtsi
new file mode 100644
index 000000000000..4f44c6b564bb
--- /dev/null
+++ b/arch/riscv/boot/dts/nuclei/nuclei-demosoc-ddr200t.dtsi
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2022 Nuclei System Technology */
+
+/ {
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@a0000000 {
+		device_type = "memory";
+		reg = <0xa0000000 0xe000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&qspi0 {
+	status = "okay";
+
+	spi_nor: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <8000000>;
+	};
+};
+
+&qspi2 {
+	status = "okay";
+
+	spi_mmc: mmc@0 {
+		compatible = "mmc-spi-slot";
+		reg = <0>;
+		spi-max-frequency = <8000000>;
+	};
+};
diff --git a/arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600-ddr200t.dts b/arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600-ddr200t.dts
new file mode 100644
index 000000000000..cd15ec2c1376
--- /dev/null
+++ b/arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600-ddr200t.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2022 Nuclei System Technology */
+
+/dts-v1/;
+
+#include "nuclei-demosoc-ux600.dtsi"
+#include "nuclei-demosoc-ddr200t.dtsi"
+
+/ {
+	model = "Nuclei DemoSoC with UX600 on DDR200T";
+	compatible = "nuclei,demosoc-ux600-ddr200t",
+		     "nuclei,demosoc-ux600", "nuclei,demosoc";
+};
diff --git a/arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600.dtsi b/arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600.dtsi
new file mode 100644
index 000000000000..f3588907ce3f
--- /dev/null
+++ b/arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600.dtsi
@@ -0,0 +1,49 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2022 Nuclei System Technology */
+
+#include "nuclei-demosoc.dtsi"
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		/* The counting clock of the timer is the LF clock */
+		timebase-frequency = <32768>;
+
+		cpu0: cpu@0 {
+			compatible = "nuclei,ux607", "nuclei,ux600", "riscv";
+			device_type = "cpu";
+			reg = <0>;
+			riscv,isa = "rv64imafdc";
+			mmu-type = "riscv,sv39";
+			clock-frequency = <16000000>;
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+
+	clint: clint@2001000 {
+		compatible = "nuclei,ux600-clint", "sifive,clint0";
+		reg = <0x02001000 0xc000>;
+		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
+	};
+
+	plic: plic@8000000 {
+		compatible = "nuclei,ux600-plic", "sifive,plic-1.0.0";
+		reg = <0x08000000 0x4000000>;
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts-extended =
+			<&cpu0_intc 11>, <&cpu0_intc 9>;
+		riscv,ndev = <52>;
+	};
+};
+
+&ppi {
+	interrupt-parent = <&plic>;
+};
diff --git a/arch/riscv/boot/dts/nuclei/nuclei-demosoc.dtsi b/arch/riscv/boot/dts/nuclei/nuclei-demosoc.dtsi
new file mode 100644
index 000000000000..85a4f713d3d9
--- /dev/null
+++ b/arch/riscv/boot/dts/nuclei/nuclei-demosoc.dtsi
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2022 Nuclei System Technology */
+
+/ {
+	/*
+	 * Nuclei DemoSoC is a 32-bit design even if 64-bit CPU core is
+	 * integrated into it.
+	 */
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	clocks {
+		/* For most of the SoC */
+		hfclk: hfclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <16000000>;
+		};
+
+		/* For always-on zone */
+		lfclk: lfclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32768>;
+		};
+	};
+
+	/*
+	 * The interrupt controller and all peripherals' interrupt parent
+	 * are to be defined in individual CPU cores' DemoSoC DT.
+	 */
+	ppi: ppi {
+		compatible = "simple-bus";
+		ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		uart0: serial@10010000 {
+			compatible = "nuclei,demosoc-uart", "sifive,uart0";
+			reg = <0x10013000 0x1000>;
+			clocks = <&hfclk>;
+			interrupts = <33>;
+			status = "disabled";
+		};
+
+		qspi0: spi@10014000 {
+			compatible = "nuclei,demosoc-spi", "sifive,spi0";
+			reg = <0x10014000 0x1000>,
+			      <0x20000000 0x20000000>;
+			interrupts = <35>;
+			clocks = <&hfclk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		qspi2: spi@10034000 {
+			compatible = "nuclei,demosoc-spi", "sifive,spi0";
+			reg = <0x10034000 0x1000>;
+			interrupts = <37>;
+			clocks = <&hfclk>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
