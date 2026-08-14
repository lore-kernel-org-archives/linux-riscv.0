Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6D4C5DF6D
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 07:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEKX31/+caQrRU4MDQXE0cCRVzks21W4Y99iM8rJtA0=; b=Xa3eW+S4QXDcAS
	+EeFaq2TiPMR91LEt8Du6IXP+u/qtZoWqXGGTicDnv/JXftAptu+LLwqN89J16dKznTKqDi43DLGM
	dha27nClneVfDZQXQClnGF8vqh/9hhvXaoh/uuJD/mUItIe60Na2XJ5LZWZvZ2JMrnXWY8bB4rblK
	Tp0HeNnRHHD02gO0cZsTsx62fU6Zwao2ROcl4YEvQmxYnxt6Ur3FtoGH1uIv3Ij4WZTGZ3ghK5i6G
	zs+aN103F9tDbeQUaYSHC4V880YmIFC3wlojZ80Srje68PvHMg8u+NwPdyIUv9hObgsuddpKmee/4
	qS/xk/Nlw8dibd+z8i7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wultz-000000024L3-0XwF;
	Fri, 14 Aug 2026 07:00:28 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wults-000000024Gm-3Ts5
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 07:00:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=6796; q=dns/txt;
  s=NAESA-Selector1; t=1786690821; x=1818226821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rOKtpkTGdGns0ETXwiHN9NnoyHI2qk15A30U1lqOXGQ=;
  b=K8Za0p7ag6HsW+q/a55uTUt/XJ1ZJdxpMFDecreTQtO07p+g7CuMzKAs
   p4YFTyYQOQ/oYSCbAzsc61SENEMcw/8h6ePkzn7vvdiVUSTX5dx36kaKn
   qZkoDKK1uIMWdyrg4d+9pgcZQe7xsHtmU6vwSVLN1L001lOnAoH+92W5Q
   Kw2QY5TouXafKfgqAW4+Zp2sYcE22GxX/H+51or/bG5ijTWZVhq/fEtHI
   AU25lE274aQJzbdys/8W0IsVDb3k0cwXnNevSS8rU1S9qGVGVefqc9Geu
   ed/p46exxA++qUGHLmOUUgpLmoU9FnSMugPeFHA8YCGJEtYacKPiNvx4L
   w==;
X-CSE-ConnectionGUID: AdcqAVO8TTqR2dGz6EE+RQ==
X-CSE-MsgGUID: tPMH40QGSgy5LS5pepdBOg==
X-IronPort-AV: E=Sophos;i="6.25,222,1779170400"; 
   d="scan'208";a="60479757"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 14 Aug 2026 01:00:15 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Fri, 14 Aug 2026 12:30:07 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v4 6/7] riscv: dts: eswin: add I2C controller support
Date: Fri, 14 Aug 2026 12:30:06 +0530
Message-Id: <20260814070007.1662455-7-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Aug 2026 07:00:07.0787 (UTC) FILETIME=[8A75CBB0:01DD2BBA]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_000021_028984_AE7C17F4 
X-CRM114-Status: UNSURE (   7.24  )
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
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  56 +++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 156 ++++++++++++++++++
 2 files changed, 212 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 3101fd90d171..5dddcf13fd25 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -130,6 +130,62 @@ &gpio111_pins {
 	input-disable;
 };
 
+&aon_i2c0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c10_pins>;
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+	};
+};
+
+&aon_i2c1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c11_pins>;
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
 	pinctrl-names = "default";
 	pinctrl-0 = <&gpio0_pins>, <&gpio5_pins>, <&gpio11_pins>,
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 771a88645d83..c13432d14504 100644
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
