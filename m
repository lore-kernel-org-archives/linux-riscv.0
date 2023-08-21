Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380D0EE49A6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 14:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2W36+Z6GCsd6WiW2LJ/O7kZiVd/DIIyu4NN58eaR17U=; b=jVq1rdfOk3eS5K
	WXO/6Fszva+KXK5KYg3C2By/oHjaA/wxoRlLSy1dzx+1HdorHkEeyR/XssVnfnI3A6EdJckUGiusC
	ix6PmcT+QF6jMd0oZWZbbkYzjPOVPyRRSPhQTBBDm7u6LnnGQ3bUAfU05K6LCqBUkeaf//QLt4n+J
	BiAN5XN7HSNc5YU6Ig0nzgJTddkVVi5/bXJGfuXmbj9vfEfxO4SA6FEf5JVq5uLSBomMYfFTGPZCF
	quzjDgH39obUBYhmHk+FLjH1V7kQ5yRQe9t8AuEddPbok5RysX891VxxrPu2rJpIOVVrXbauN81kY
	3MoWT+dLmRvL7dCCiY2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY67J-00ECbJ-0R;
	Mon, 21 Aug 2023 14:42:53 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY67C-00ECSC-2B
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 14:42:51 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id DF0E924E2A8;
	Mon, 21 Aug 2023 22:41:56 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:56 +0800
Received: from localhost.localdomain (113.72.145.205) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 21 Aug
 2023 22:41:55 +0800
From: Xingyu Wu <xingyu.wu@starfivetech.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Maxim Kochetkov
	<fido_max@inbox.ru>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Walker Chen <walker.chen@starfivetech.com>, "Xingyu
 Wu" <xingyu.wu@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v2 5/5] riscv: dts: starfive: Add the nodes and pins of I2Srx/I2Stx0/I2Stx1
Date: Mon, 21 Aug 2023 22:41:51 +0800
Message-ID: <20230821144151.207339-6-xingyu.wu@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_074247_160456_7B29B22B 
X-CRM114-Status: GOOD (  10.30  )
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

Add I2Srx/I2Stx0/I2Stx1 nodes and pins configuration for the
StarFive JH7110 SoC.

Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 58 +++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 65 +++++++++++++++++++
 2 files changed, 123 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index d79f94432b27..7179f1a31cf2 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -203,6 +203,24 @@ &i2c6 {
 	status = "okay";
 };
 
+&i2srx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2srx_pins>;
+	status = "okay";
+};
+
+&i2stx0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mclk_ext_pins>;
+	status = "okay";
+};
+
+&i2stx1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2stx1_pins>;
+	status = "okay";
+};
+
 &mmc0 {
 	max-frequency = <100000000>;
 	bus-width = <8>;
@@ -337,6 +355,46 @@ GPOEN_SYS_I2C6_DATA,
 		};
 	};
 
+	i2srx_pins: i2srx-0 {
+		clk-sd-pins {
+			pinmux = <GPIOMUX(38, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2SRX_BCLK)>,
+				 <GPIOMUX(63, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2SRX_LRCK)>,
+				 <GPIOMUX(38, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2STX1_BCLK)>,
+				 <GPIOMUX(63, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2STX1_LRCK)>,
+				 <GPIOMUX(61, GPOUT_LOW,
+					      GPOEN_DISABLE,
+					      GPI_SYS_I2SRX_SDIN0)>;
+			input-enable;
+		};
+	};
+
+	i2stx1_pins: i2stx1-0 {
+		sd-pins {
+			pinmux = <GPIOMUX(44, GPOUT_SYS_I2STX1_SDO0,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-disable;
+			input-disable;
+		};
+	};
+
+	mclk_ext_pins: mclk-ext-0 {
+		mclk-ext-pins {
+			pinmux = <GPIOMUX(4, GPOUT_LOW,
+					     GPOEN_DISABLE,
+					     GPI_SYS_MCLK_EXT)>;
+			input-enable;
+		};
+	};
+
 	mmc0_pins: mmc0-0 {
 		 rst-pins {
 			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index e85464c328d0..621b68c02ea8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -512,6 +512,30 @@ tdm: tdm@10090000 {
 			status = "disabled";
 		};
 
+		i2srx: i2s@100e0000 {
+			compatible = "starfive,jh7110-i2srx";
+			reg = <0x0 0x100e0000 0x0 0x1000>;
+			clocks = <&syscrg JH7110_SYSCLK_I2SRX_BCLK_MST>,
+				 <&syscrg JH7110_SYSCLK_I2SRX_APB>,
+				 <&syscrg JH7110_SYSCLK_MCLK>,
+				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
+				 <&mclk_ext>,
+				 <&syscrg JH7110_SYSCLK_I2SRX_BCLK>,
+				 <&syscrg JH7110_SYSCLK_I2SRX_LRCK>,
+				 <&i2srx_bclk_ext>,
+				 <&i2srx_lrck_ext>;
+			clock-names = "i2sclk", "apb", "mclk",
+				      "mclk_inner", "mclk_ext", "bclk",
+				      "lrck", "bclk_ext", "lrck_ext";
+			resets = <&syscrg JH7110_SYSRST_I2SRX_APB>,
+				 <&syscrg JH7110_SYSRST_I2SRX_BCLK>;
+			dmas = <0>, <&dma 24>;
+			dma-names = "tx", "rx";
+			starfive,syscon = <&sys_syscon 0x18 0x2>;
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		usb0: usb@10100000 {
 			compatible = "starfive,jh7110-usb";
 			ranges = <0x0 0x0 0x10100000 0x100000>;
@@ -736,6 +760,47 @@ spi6: spi@120a0000 {
 			status = "disabled";
 		};
 
+		i2stx0: i2s@120b0000 {
+			compatible = "starfive,jh7110-i2stx0";
+			reg = <0x0 0x120b0000 0x0 0x1000>;
+			clocks = <&syscrg JH7110_SYSCLK_I2STX0_BCLK_MST>,
+				 <&syscrg JH7110_SYSCLK_I2STX0_APB>,
+				 <&syscrg JH7110_SYSCLK_MCLK>,
+				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
+				 <&mclk_ext>;
+			clock-names = "i2sclk", "apb", "mclk",
+				      "mclk_inner","mclk_ext";
+			resets = <&syscrg JH7110_SYSRST_I2STX0_APB>,
+				 <&syscrg JH7110_SYSRST_I2STX0_BCLK>;
+			dmas = <&dma 47>;
+			dma-names = "tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
+		i2stx1: i2s@120c0000 {
+			compatible = "starfive,jh7110-i2stx1";
+			reg = <0x0 0x120c0000 0x0 0x1000>;
+			clocks = <&syscrg JH7110_SYSCLK_I2STX1_BCLK_MST>,
+				 <&syscrg JH7110_SYSCLK_I2STX1_APB>,
+				 <&syscrg JH7110_SYSCLK_MCLK>,
+				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
+				 <&mclk_ext>,
+				 <&syscrg JH7110_SYSCLK_I2STX1_BCLK>,
+				 <&syscrg JH7110_SYSCLK_I2STX1_LRCK>,
+				 <&i2stx_bclk_ext>,
+				 <&i2stx_lrck_ext>;
+			clock-names = "i2sclk", "apb", "mclk",
+				      "mclk_inner", "mclk_ext", "bclk",
+				      "lrck", "bclk_ext", "lrck_ext";
+			resets = <&syscrg JH7110_SYSRST_I2STX1_APB>,
+				 <&syscrg JH7110_SYSRST_I2STX1_BCLK>;
+			dmas = <&dma 48>;
+			dma-names = "tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		sfctemp: temperature-sensor@120e0000 {
 			compatible = "starfive,jh7110-temp";
 			reg = <0x0 0x120e0000 0x0 0x10000>;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
