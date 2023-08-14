Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B26EC001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Aug 2023 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/iolEXbImYwso23U95jpWOx2+Hhl77SP5UTF6ZhOPpo=; b=rKMrg5eqRWBhNy
	pKQE9NdZZfJSld9noD1i0bVhbD8ZEdZgA+KVQFxKdFGCqzSyoZiEACUb/USKX7lhGmIaFFlLqmbt1
	Eh2b6AQ8JdjmsWrXPwOcZ0TG8zVvNC0bosH83/LOM5RowrnteODVXxKhAbZ74DnQO2rK9vMEUceJL
	wN7h9vIo3zimPJlCAqGsVWcJhgOU5JLG3ncLyisY4PW7JlBHJNxQsR4mzbfHc6YuwlP3cwuyHymuo
	DhIM7ShFNiwiWPf/QdBpjHskC9O/CF0TuO5sh8bGnsXi8Gp/6rHyYjO1Egp7vrG3TJ92lI+JqaegV
	CJo2zDu/lN8dAbHxk7Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSbY-00GRDX-2T;
	Mon, 14 Aug 2023 08:07:12 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSbV-00GR6x-2r
	for linux-riscv@lists.infradead.org;
	Mon, 14 Aug 2023 08:07:11 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A1D7E24E225;
	Mon, 14 Aug 2023 16:06:22 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 16:06:22 +0800
Received: from ubuntu.localdomain (183.27.98.20) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 14 Aug
 2023 16:06:21 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Claudiu
 Beznea" <claudiu.beznea@microchip.com>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Walker Chen <walker.chen@starfivetech.com>, Xingyu Wu
	<xingyu.wu@starfivetech.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>
CC: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] riscv: dts: starfive: Add JH7110 PWM-DAC support
Date: Mon, 14 Aug 2023 16:06:18 +0800
Message-ID: <20230814080618.10036-4-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230814080618.10036-1-hal.feng@starfivetech.com>
References: <20230814080618.10036-1-hal.feng@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.20]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_010710_220886_76F90D84 
X-CRM114-Status: UNSURE (   9.94  )
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

Add PWM-DAC support for StarFive JH7110 SoC.

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---
 .../jh7110-starfive-visionfive-2.dtsi         | 49 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 13 +++++
 2 files changed, 62 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index d2f3b9eb859b..0e98fcba3203 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -38,6 +38,33 @@ gpio-restart {
 		gpios = <&sysgpio 35 GPIO_ACTIVE_HIGH>;
 		priority = <224>;
 	};
+
+	pwmdac_codec: pwmdac-codec {
+		compatible = "linux,spdif-dit";
+		#sound-dai-cells = <0>;
+	};
+
+	sound-pwmdac {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "left_j";
+			bitclock-master = <&sndcpu0>;
+			frame-master = <&sndcpu0>;
+
+			sndcpu0: cpu {
+				sound-dai = <&pwmdac>;
+			};
+
+			codec {
+				sound-dai = <&pwmdac_codec>;
+			};
+		};
+	};
 };
 
 &dvp_clk {
@@ -185,6 +212,12 @@ &i2c6 {
 	status = "okay";
 };
 
+&pwmdac {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwmdac_pins>;
+	status = "okay";
+};
+
 &qspi {
 	#address-cells = <1>;
 	#size-cells = <0>;
@@ -290,6 +323,22 @@ GPOEN_SYS_I2C6_DATA,
 		};
 	};
 
+	pwmdac_pins: pwmdac-0 {
+		pwmdac-pins {
+			pinmux = <GPIOMUX(33, GPOUT_SYS_PWMDAC_LEFT,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>,
+				 <GPIOMUX(34, GPOUT_SYS_PWMDAC_RIGHT,
+					      GPOEN_ENABLE,
+					      GPI_NONE)>;
+			bias-disable;
+			drive-strength = <2>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+
 	spi0_pins: spi0-0 {
 		mosi-pins {
 			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index a608433200e8..d3437a2cce3f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -512,6 +512,19 @@ tdm: tdm@10090000 {
 			status = "disabled";
 		};
 
+		pwmdac: pwmdac@100b0000 {
+			compatible = "starfive,jh7110-pwmdac";
+			reg = <0x0 0x100b0000 0x0 0x1000>;
+			clocks = <&syscrg JH7110_SYSCLK_PWMDAC_APB>,
+				 <&syscrg JH7110_SYSCLK_PWMDAC_CORE>;
+			clock-names = "apb", "core";
+			resets = <&syscrg JH7110_SYSRST_PWMDAC_APB>;
+			dmas = <&dma 22>;
+			dma-names = "tx";
+			#sound-dai-cells = <0>;
+			status = "disabled";
+		};
+
 		usb0: usb@10100000 {
 			compatible = "starfive,jh7110-usb";
 			ranges = <0x0 0x0 0x10100000 0x100000>;
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
