Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E25C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jan 2022 11:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D90Q7yoksgeQCcfmkQ1CjWYPNDDOj+nQ28wC5uABvN0=; b=ClC4eU3LKEtCib
	Svs/qXGPV4Lbb/klTF44nLL9u9ZbQCvrr0j5WvxIKjYpXYdfc6tONGXelNnleGmbAdOrMtVWb6rD4
	sbnqnLpTdnw3mJM3zKtfVoimiEEjn8EBLHuahGweHgNpsbfTtEAi2MK4pZUePvpMVBPo1PkdV21TV
	1LraptFctOi0qIR528uLglVUsjHM8cYc+iNOqRyjEMvNkFvUoSnbXJY5cdt5DUlgeM2bqFqDooFHe
	VoMd82SkAnxl57ILHw3tp1/ojUzS2J+2qbMeZ1AiAj91Iuyj9WkE+rxQ1W0YsIPvBqGp4nWPYKesF
	LzYe3sFpy/g7BzZ96mbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PrN-00Ebdd-QN; Mon, 17 Jan 2022 11:07:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9PrI-00Ebad-Of
 for linux-riscv@lists.infradead.org; Mon, 17 Jan 2022 11:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1642417652; x=1673953652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=p1G5ee3pgdFMKnb+mhUnYp/50B+T1lJZaLnKUgb4ozY=;
 b=zDbAEjHD4bljbWCrR/5OTKDhVq1DyysRtlDbfNG7Xa8R53ZAFc9pQ4Me
 PfLTj73C18exDptioASb/nhyW3U6F3dQ3KMtIN+m9d21VQMAADGIQoBo+
 bLTZ86o8vvmPBRFhaQ0Q5mT9GgAJ6NT35R1olI1EnEaOCwhxkUrHZKbkd
 6KinTlo0tY1+rz/H+1y0K3fRsWn4AShylzsZmMxNXjxsVQs7d6f54AhCN
 gLJoIAym1zgAjYpkYvg0HR/D/KCqS7qbC3Sp25w5WZ7IngD2guzxBKSra
 P4XX+1z1WozVigYQYSP1TApGPD9GgKkN7pKEQEmS25TgYepk6qgD5kC9T Q==;
IronPort-SDR: DyC4fjfnkpNlHJ6tXXb/TKpJQsYTPqJlZYsLDrA1Ty1bsEJZ5SNOWDA97QG5PkaWMYVuzudDt5
 kzkbSHivNJdUM3BOU9Sdo9F4jDy4QQJg3YTPDbvFqr8xnVlJf83MQb3oBELJd+GyfcauWJATeB
 kc0OPrcDDV0Subr5yaHqFuK5fPdPwlKdNdagN7e8nPh6W8Hoi+K/n5sjbYnKHu+S9o4Yr7V0ML
 a5pbB1ch6T1mmM2G/mZompOctHeecmamAnPtyDTvcI6T3tLj1ULbdjWOf3fK1+FbDrGIrbzUee
 2VgV6o5q8TtAz9TwxYzyvJzf
X-IronPort-AV: E=Sophos;i="5.88,295,1635231600"; d="scan'208";a="82713606"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 17 Jan 2022 04:07:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 17 Jan 2022 04:07:20 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 17 Jan 2022 04:07:14 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>, <heiko@sntech.de>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <ivan.griffin@microchip.com>, <atishp@rivosinc.com>
Subject: [PATCH v4 13/14] riscv: dts: microchip: add new peripherals to icicle
 kit device tree
Date: Mon, 17 Jan 2022 11:07:54 +0000
Message-ID: <20220117110755.3433142-14-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220117110755.3433142-1-conor.dooley@microchip.com>
References: <20220117110755.3433142-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_030732_925728_A2D6B603 
X-CRM114-Status: UNSURE (   7.48  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add new peripherals to the MPFS, and enable them in the Icicle kit
device tree:

2x SPI, QSPI, 3x GPIO, 2x I2C, Real Time Counter, PCIE controller,
USB host & system controller.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   |  53 ++++++
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 168 ++++++++++++++++++
 2 files changed, 221 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index dc5f351b10c4..cd2fe80fa81a 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -80,6 +80,26 @@ &mmc {
 	sd-uhs-sdr104;
 };
 
+&spi0 {
+	status = "okay";
+};
+
+&spi1 {
+	status = "okay";
+};
+
+&qspi {
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
 &i2c2 {
 	status = "okay";
 };
@@ -103,6 +123,39 @@ phy0: ethernet-phy@8 {
 	};
 };
 
+&gpio2 {
+	interrupts = <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>,
+		     <53>, <53>, <53>, <53>;
+	status = "okay";
+};
+
+&rtc {
+	status = "okay";
+};
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
+
+&mbox {
+	status = "okay";
+};
+
+&syscontroller {
+	status = "okay";
+};
+
+&pcie {
+	status = "okay";
+};
+
 &core_pwm0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 5e7aaaf42cde..a3ed06ab6392 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -266,6 +266,66 @@ mmc: mmc@20008000 {
 			status = "disabled";
 		};
 
+		spi0: spi@20108000 {
+			compatible = "microchip,mpfs-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20108000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <54>;
+			clocks = <&clkcfg CLK_SPI0>;
+			spi-max-frequency = <25000000>;
+			status = "disabled";
+		};
+
+		spi1: spi@20109000 {
+			compatible = "microchip,mpfs-spi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x20109000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <55>;
+			clocks = <&clkcfg CLK_SPI1>;
+			spi-max-frequency = <25000000>;
+			status = "disabled";
+		};
+
+		qspi: spi@21000000 {
+			compatible = "microchip,mpfs-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0x21000000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <85>;
+			clocks = <&clkcfg CLK_QSPI>;
+			spi-max-frequency = <25000000>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@2010a000 {
+			compatible = "microchip,mpfs-i2c";
+			reg = <0x0 0x2010a000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <58>;
+			clocks = <&clkcfg CLK_I2C0>;
+			clock-frequency = <100000>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@2010b000 {
+			compatible = "microchip,mpfs-i2c";
+			reg = <0x0 0x2010b000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			interrupt-parent = <&plic>;
+			interrupts = <61>;
+			clocks = <&clkcfg CLK_I2C1>;
+			clock-frequency = <100000>;
+			status = "disabled";
+		};
+
 		mac0: ethernet@20110000 {
 			compatible = "cdns,macb";
 			reg = <0x0 0x20110000 0x0 0x2000>;
@@ -291,5 +351,113 @@ mac1: ethernet@20112000 {
 			clock-names = "pclk", "hclk";
 			status = "disabled";
 		};
+
+		gpio0: gpio@20120000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <0x0 0x20120000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			clocks = <&clkcfg CLK_GPIO0>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio1: gpio@20121000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <000 0x20121000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			clocks = <&clkcfg CLK_GPIO1>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		gpio2: gpio@20122000 {
+			compatible = "microchip,mpfs-gpio";
+			reg = <0x0 0x20122000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+			clocks = <&clkcfg CLK_GPIO2>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			status = "disabled";
+		};
+
+		rtc: rtc@20124000 {
+			compatible = "microchip,mpfs-rtc";
+			reg = <0x0 0x20124000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <80>, <81>;
+			clocks = <&clkcfg CLK_RTC>;
+			clock-names = "rtc";
+			status = "disabled";
+		};
+
+		usb: usb@20201000 {
+			compatible = "microchip,mpfs-musb";
+			reg = <0x0 0x20201000 0x0 0x1000>;
+			interrupt-parent = <&plic>;
+			interrupts = <86>, <87>;
+			clocks = <&clkcfg CLK_USB>;
+			interrupt-names = "dma","mc";
+			status = "disabled";
+		};
+
+		pcie: pcie@2000000000 {
+			compatible = "microchip,pcie-host-1.0";
+			#address-cells = <0x3>;
+			#interrupt-cells = <0x1>;
+			#size-cells = <0x2>;
+			device_type = "pci";
+			reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
+			reg-names = "cfg", "apb";
+			bus-range = <0x0 0x7f>;
+			interrupt-parent = <&plic>;
+			interrupts = <119>;
+			interrupt-map = <0 0 0 1 &pcie_intc 0>,
+					<0 0 0 2 &pcie_intc 1>,
+					<0 0 0 3 &pcie_intc 2>,
+					<0 0 0 4 &pcie_intc 3>;
+			interrupt-map-mask = <0 0 0 7>;
+			clocks = <&clkcfg CLK_FIC0>, <&clkcfg CLK_FIC1>, <&clkcfg CLK_FIC3>;
+			clock-names = "fic0", "fic1", "fic3";
+			ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
+			msi-parent = <&pcie>;
+			msi-controller;
+			microchip,axi-m-atr0 = <0x10 0x0>;
+			status = "disabled";
+			pcie_intc: legacy-interrupt-controller {
+				#address-cells = <0>;
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+
+		mbox: mailbox@37020000 {
+			compatible = "microchip,mpfs-mailbox";
+			reg = <0x0 0x37020000 0x0 0x1000>, <0x0 0x2000318C 0x0 0x40>;
+			interrupt-parent = <&plic>;
+			interrupts = <96>;
+			#mbox-cells = <1>;
+			status = "disabled";
+		};
+
+		syscontroller: syscontroller {
+			compatible = "microchip,mpfs-sys-controller";
+			mboxes = <&mbox 0>;
+
+			rng: rng {
+				compatible = "microchip,mpfs-rng";
+			};
+
+			sysserv: sysserv {
+				compatible = "microchip,mpfs-generic-service";
+			};
+		};
 	};
 };
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
