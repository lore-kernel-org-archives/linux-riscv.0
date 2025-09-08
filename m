Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC456CAC586
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 12:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PAg1fuCbcysby4OeTRSmLxJOoSXHvPmsFuB9PKuaMMY=; b=JmpnzqDEI01ryU
	K0t2dtegxaMx8XJHAoNBOq5cJUnATTLQQwYMfykPtyO0jZM9qU9bey4fGKVBaEj0SC4zkod/0waE2
	DdaPBTn1FQ/PYyZVklJK8c/3t+ydzrKdVuJgmp011///8qbSD3QKHzZEgDcqbeQExMbaa+OSEPw/J
	+SEz2B/IH3HkiKLv1UX4CjMP7KLv1w3ZReK63PrTRNuyp/w9S/cyqY2yCjH1uXtUS/D/X+tCXYdrb
	E/G1DyMHh0Gs+Yqba4mgbcSpFjZk79ioBmnNL+Zv4mRTJffHFu1xu7EETdPa1ChTlRdcHW/S+ldmK
	y4Q5SVtxKT6fjvdbP7ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbNN-0000000HAo6-1LvU;
	Mon, 08 Sep 2025 12:53:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaMm-0000000Gljb-2BBP
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 11:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757332140; x=1788868140;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=khzirs232ONv9Ti/rgyEG1nzqfuQZeNc7eGF+WvAWTw=;
  b=Cvn285LiBylx7OHXxTX+R3AfjzdTX4I6h1h7aDiz57WIkgGZoJ+GOgk5
   mR+Gd1hJKdYGbAVBecUCvuwNkXBjqquo8JaJP65bw19nFPIaOWAevYjIB
   7sJ9DEEGCo1L1njX2CT2dnANYVzEMMyMxO48F3KiSUsKTi8RQUCWgehu8
   NVuUGjSEdqRAkC5qhSK/DaynPJ6gpV3LKIs8x8eUp8BYvnYPqG7P3IYHV
   oLno4e70FwR/AHUkbW+1rqTayVpGgyU1mTJOgDYlnrKr6L5dsjeNz0B/i
   s7t+nWu6an6izR62Mah0B8V+zqTKn2n8E03dyq6YmfsUAAxr9CxCWwWl3
   Q==;
X-CSE-ConnectionGUID: vDOPHTnsQiaqmkXt9yltVw==
X-CSE-MsgGUID: CFRpFRBqQ0+zmhKj6MR+UA==
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="45634878"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Sep 2025 04:48:54 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 8 Sep 2025 04:48:43 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 8 Sep 2025 04:48:40 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 3/6] riscv: dts: microchip: add icicle kit with production device
Date: Mon, 8 Sep 2025 12:57:29 +0100
Message-ID: <20250908115732.31092-4-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
References: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_044900_633785_0C9FE3C6 
X-CRM114-Status: GOOD (  15.87  )
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

With the introduction of the Icicle Kit using the production MPFS250T
device, it's necessary to distinguish it from the engineering sample
(-es) variant. Engineering samples cannot write to flash from the MSS,
as noted in the PolarFire SoC FPGA ES errata.

Add a new device tree (mpfs-icicle-kit-prod.dts) for the production
board which includes the icicle kit common dtsi and enable the system
controller SPI flash, which is only accessible on production silicon.

Remove redundant board compatible from fabric dtsi and update board
compatibles for v2025.07 release, which includes Mi-V IHC v2 for AMP
cluster communication.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 arch/riscv/boot/dts/microchip/Makefile        |  1 +
 .../dts/microchip/mpfs-icicle-kit-common.dtsi |  4 ++++
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi | 23 ++++++++++++++++---
 .../dts/microchip/mpfs-icicle-kit-prod.dts    | 23 +++++++++++++++++++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  3 ++-
 5 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts

diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index f51aeeb9fd3b..1e2f4e41bf0d 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-beaglev-fire.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-icicle-kit-prod.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
 dtb-$(CONFIG_ARCH_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
index eafea3b69cd7..5c7a8ffad85b 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
@@ -134,6 +134,10 @@ &i2c2 {
 	status = "okay";
 };
 
+&ihc {
+	status = "okay";
+};
+
 &mac0 {
 	phy-mode = "sgmii";
 	phy-handle = <&phy0>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index a6dda55a2d1d..e673b676fd1a 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -2,9 +2,6 @@
 /* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 / {
-	compatible = "microchip,mpfs-icicle-reference-rtlv2210", "microchip,mpfs-icicle-kit",
-		     "microchip,mpfs";
-
 	core_pwm0: pwm@40000000 {
 		compatible = "microchip,corepwm-rtl-v4";
 		reg = <0x0 0x40000000 0x0 0xF0>;
@@ -26,6 +23,26 @@ i2c2: i2c@40000200 {
 		status = "disabled";
 	};
 
+	ihc: mailbox {
+		compatible = "microchip,sbi-ipc";
+		interrupt-parent = <&plic>;
+		interrupts = <180>, <179>, <178>, <177>;
+		interrupt-names = "hart-1", "hart-2", "hart-3", "hart-4";
+		#mbox-cells = <1>;
+		status = "disabled";
+	};
+
+	mailbox@50000000 {
+		compatible = "microchip,miv-ihc-rtl-v2";
+		reg = <0x0 0x50000000 0x0 0x1c000>;
+		interrupt-parent = <&plic>;
+		interrupts = <180>, <179>, <178>, <177>;
+		interrupt-names = "hart-1", "hart-2", "hart-3", "hart-4";
+		#mbox-cells = <1>;
+		microchip,ihc-chan-disabled-mask = /bits/ 16 <0>;
+		status = "disabled";
+	};
+
 	pcie: pcie@3000000000 {
 		compatible = "microchip,pcie-host-1.0";
 		#address-cells = <0x3>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
new file mode 100644
index 000000000000..8afedece89d1
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2025 Microchip Technology Inc */
+
+/dts-v1/;
+
+#include "mpfs-icicle-kit-common.dtsi"
+
+/ {
+	model = "Microchip PolarFire-SoC Icicle Kit (Production Silicon)";
+	compatible = "microchip,mpfs-icicle-prod-reference-rtl-v2507",
+		     "microchip,mpfs-icicle-kit-prod",
+		     "microchip,mpfs-icicle-kit",
+		     "microchip,mpfs-prod",
+		     "microchip,mpfs";
+};
+
+&syscontroller {
+	microchip,bitstream-flash = <&sys_ctrl_flash>;
+};
+
+&syscontroller_qspi {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 2cb08ed0946d..556aa9638282 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -7,6 +7,7 @@
 
 / {
 	model = "Microchip PolarFire-SoC Icicle Kit";
-	compatible = "microchip,mpfs-icicle-reference-rtlv2210", "microchip,mpfs-icicle-kit",
+	compatible = "microchip,mpfs-icicle-es-reference-rtl-v2507",
+		     "microchip,mpfs-icicle-kit",
 		     "microchip,mpfs";
 };
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
