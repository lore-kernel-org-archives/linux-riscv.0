Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A568C43602
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2afFWWQ/vNK1GjqGoW3gyImsW2p7I2n9iOYze01Sfoc=; b=Uk2hlAG1pOHV/5
	aOP913JfbbiZ+GeG6nhK5OyF4Pmt0eJI2jVxnLKv5OyM5YArKW6RTwxgUSvyiZTygkt63F2HSLG85
	N4sHGUjxBJrJjG32Z1mztu6p69y1VVwoRZgN73HEZygt2jxo5X8b8MTx3yE00XDBMQ/nQhLOUcCsM
	PFhe7SQsUHxUdI2IrVyF7g/e1RZjsQmg8yluZCs+Rn4FeYLf8FoYKJmNQNcYYyZfCWZoiBpU2Bebd
	VDtiQw2q2Iny6BIENO9K0htqdgIsUqWZNmg499udFK1quaKkfWT57LdRb0/93O4bM6W5w65cpZTK7
	gsfBdeaH9tOr9iLqhzgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeQ1-0000000Bmns-3wZF;
	Mon, 06 Jul 2026 08:11:09 +0000
Received: from naesa04.arrow.com ([216.150.161.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgePz-0000000Bmhy-0eU6
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 08:11:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=6621; q=dns/txt;
  s=NAESA-Selector1; t=1783325467; x=1814861467;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WM5v2Ov/1VfplXhonbtPoNhtShun/4PVQ7VllRkCxbE=;
  b=mr9FJIwB1XrgrlOg3Fd5H16Ym1aif+Ih/m6c2DTH//Y/J5EpomDbKd8z
   2qWoRFEuTrOBX6Dmt7DFuuKVFIAmoJUOSVOK1LFL4BqPEtXuZYlmhyEza
   5my2fYDwy5KiRYihkikkA83qR6r3p99pF3t1TT6pmi4YuewqQ6K7VA290
   VKH92XK6S4pQesoxa9k30b+niBSMgcx7jk9OxIGhNG+3E+VQBNZrwFHDB
   4mWba0spL0Gaj/IIKW5gt59djgkv/A5qxrUjYvyKT6W5wlKp6WBkKtUrs
   98Q1WddsLKx01xIlK8oKLKfElaBNZYpxUNcui/EKu4DiSdfTQmzWKHW3E
   g==;
X-CSE-ConnectionGUID: imV2PBl4SNuTTd4r/dzqmQ==
X-CSE-MsgGUID: o7TuTPD1TIusmzN4l9I2WQ==
X-IronPort-AV: E=Sophos;i="6.25,149,1779170400"; 
   d="scan'208";a="116963518"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 06 Jul 2026 02:11:04 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 6 Jul 2026 13:40:56 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v2 7/8] riscv: dts: eswin: add I2C controller support
Date: Mon,  6 Jul 2026 13:40:54 +0530
Message-Id: <20260706081055.1126275-8-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Jul 2026 08:10:56.0199 (UTC) FILETIME=[F899C570:01DD0D1E]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_011107_312148_552C6DA9 
X-CRM114-Status: UNSURE (   7.77  )
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add I2C nodes for EIC7700 SoC.
Also add nodes for corresponding slave devices in dts file and
enable them for HiFive Premier P550 board

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  52 ++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 156 ++++++++++++++++++
 2 files changed, 208 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 743dedbdb081..1e8c5a0da0b3 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -130,6 +130,58 @@ &gpio111_pins {
 	input-disable;
 };
 
+&aon_i2c0 {
+	status = "okay";
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+	};
+};
+
+&aon_i2c1 {
+	status = "okay";
+
+	adc@10 {
+		compatible = "microchip,pac1934";
+		reg = <0x10>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@1 {
+			reg = <0x1>;
+			shunt-resistor-micro-ohms = <1000>;
+			label = "VDD_SOM";
+		};
+
+		channel@2 {
+			reg = <0x2>;
+			shunt-resistor-micro-ohms = <1000>;
+			label = "VDD_SOC";
+		};
+
+		channel@3 {
+			reg = <0x3>;
+			shunt-resistor-micro-ohms = <1000>;
+			label = "VDD_CPU";
+		};
+
+		channel@4 {
+			reg = <0x4>;
+			shunt-resistor-micro-ohms = <1000>;
+			label = "VDD_LPDDR";
+		};
+	};
+
+	power-sensor@44 {
+		compatible = "ti,ina226";
+		reg = <0x44>;
+		#io-channel-cells = <1>;
+		label = "sys_power";
+		shunt-resistor = <1000>;
+	};
+};
+
 &pinctrl {
 	vrgmii-supply = <&vcc_1v8>;
 };
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 08067d0c634b..6d328befc623 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -315,6 +315,162 @@ uart4: serial@50940000 {
 			status = "disabled";
 		};
 
+		i2c0: i2c@50950000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x50950000 0x0 0x8000>;
+			interrupts = <105>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C0_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@50960000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x50960000 0x0 0x8000>;
+			interrupts = <106>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C1_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@50970000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x50970000 0x0 0x8000>;
+			interrupts = <107>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C2_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@50980000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x50980000 0x0 0x8000>;
+			interrupts = <108>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C3_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@50990000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x50990000 0x0 0x8000>;
+			interrupts = <109>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C4_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c5: i2c@509a0000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x509a0000 0x0 0x8000>;
+			interrupts = <110>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C5_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c6: i2c@509b0000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x509b0000 0x0 0x8000>;
+			interrupts = <111>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C6_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c7: i2c@509c0000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x509c0000 0x0 0x8000>;
+			interrupts = <112>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C7_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c8: i2c@509d0000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x509d0000 0x0 0x8000>;
+			interrupts = <113>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C8_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C8>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c9: i2c@509e0000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x509e0000 0x0 0x8000>;
+			interrupts = <114>;
+			clocks = <&clk EIC7700_CLK_GATE_LSP_I2C9_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_I2C9>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		aon_i2c0: i2c@51830000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x51830000 0x0 0x8000>;
+			interrupts = <290>;
+			clocks = <&clk EIC7700_CLK_GATE_AON_I2C0_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_ANO0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		aon_i2c1: i2c@51838000 {
+			compatible = "eswin,eic7700-i2c", "snps,designware-i2c";
+			reg = <0x0 0x51838000 0x0 0x8000>;
+			interrupts = <291>;
+			clocks = <&clk EIC7700_CLK_GATE_AON_I2C1_PCLK>;
+			clock-names = "ref";
+			clock-frequency = <100000>;
+			resets = <&reset EIC7700_RESET_ANO1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		gpio@51600000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x0 0x51600000 0x0 0x80>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
