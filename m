Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A13BD4660F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 19:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PoSmlNSeiA5wO+ByAFCi9KWtEcEm7Q6g8BjntMlHdw=; b=Wbhn42wtEU+fAT
	dVeMdocxu/ixtm58vpSzx6m5Rbw36T1GivDcrchpoDlxcI1oF7VgGpYa2qpip//B8kLTddMlmwuzG
	rXaWl2VYi+ha9ceqgqwMvg8CaNVQrgMsPAzBPmTUG9eeAfAruN/HoYOCxm+DJjBGwZWurY1siVNUx
	KGeO3PCEd4vZ9lLn0e8QXlXZ60ZEsiPetfF89qWDRJPTpkFNjFR/PmmN1FhWd7Nifj3SZf8MlVllz
	S4D4rCXzX8TnDh/GmSPV6rF192omK+wF7oL64TOJHIBNIMtosn2tyLXohQWeF2pPd70cWVWQpedyd
	LDy89MC/uMBy0mVC9Y8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrY-0000000D2v3-2VS7;
	Thu, 15 Jan 2026 19:18:32 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSrU-0000000D2qj-1LmQ
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 19:18:30 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4327555464cso728416f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 11:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768504706; x=1769109506; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4OBbtgA8tqfAE3cwS/lYCrnVUiM8rMD+darqSO7wyo=;
        b=GIJLChW4lnoaGOciSupye9i1YU7a90uWYZbxxJupKQGnJsDI0YGbT/g2wpYoxDuOQn
         pmXLlOWF8HQyRuaSuIMkok97c70+s/wBfctFvoWOnizIyncinu7AdZdxHTtHIHgUAZyC
         VM3pNwiJLDZVC6ABP12b8RG/shSTWVwBCS1xkNPtVkKaiJ7tLevYKLYRuNbC99Scron4
         65ale2n9b0O7lKlLExAsKwDyXAtdwVIeP5EzKxJ2e17hCzEECObWiReyEWKBJtoZ0Gnq
         j5/njnJOZwOdU8miDr16bt9vv1UoPJD0JeSpbS0JpXVkUySSO5mCu0Y3Dp94HMoN+L88
         BndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768504706; x=1769109506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u4OBbtgA8tqfAE3cwS/lYCrnVUiM8rMD+darqSO7wyo=;
        b=Z0CtpafmwlN/xKZAaCyCdyB1t0teUNe/297+SW/CRBFNAb50a3X+wrfu4aFxFRMK8G
         RCzEEpdKsgsnAqGm9sJl68NkRMAnaqqOLIg9PGoNSC4lkHOLFPQQQKEga9f/cGSRul/w
         3Nu1Hgeoew7DxtiWlBvXe5zm4a+10jd2opXihr1Uhb8joF2ZYjG4KCxNHfRDiHI6SWLp
         p4caEcN+fiw2rqjWlR49I6fNGKlJDzbW7GvQqacInRcgVw+2cuKbFvhdtTqqwKsHEgKJ
         JQQoop3HuahLEgbGV6jBx5JLzPm3KdYWQFNZMUTIiBsO2h0FLHpqK1QI1pTCxM/My6le
         NR0w==
X-Forwarded-Encrypted: i=1; AJvYcCVH68pCJaqNa8p/MdLkbCmKduZqFSK4HzkDYqaJG6UatOfQc3tyfBj5KsPm/M16v37oAnKmQR5id5JCgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlnQSz+v/Y9HPdFvLG/jvl2cNkGehTZEWjYw9KFBB+LQeFz9Ag
	TI+TnmCd3VhcXsgiyD/ZvwPZ6xYGD6ApdnmS6ptalTRGnYXU45u4LUE4
X-Gm-Gg: AY/fxX4L9v7SSjWTmdmCxav18S1r5mIAYrwZ6MjCJuljC20S0U9rnuESut5/OfdDdRC
	bP+48VWfApDM4EGS4PbzqloWer6t/c9OuWnhrCA0GgO3acdnvc5zDbRL6zEvbP3y6HwQ7JLojYP
	MLm/EGEGUqELl82z244xvvxgieTvNrbm+BVzZp03i57WBF1nKimf2jpPrwYYBWgGpAr8p1ku/XM
	LHS+QpYVs3AqfoBPYUtwjh6ZHHwJGIDb5TgJd9KUdGfjQ/FfspmEMV/gqRI4TUxxyNiWR1ugPsm
	x6OAaRLY/T5tcVeJtAMxwP1DRAe9rVwmaRRuNke4QIT70sh6uHWFK1sPCxpBwOZtf9r6nGfqxip
	odFD5BfrAIu0srcRTarBzv37j1ZBR6t4rmI88Nsp2Q1qViUiCyKHLq1tynhjc82FAVOrxoY1vN9
	xmDgzU7tpzuFkPvlVEYaMEHBSvlqrJroFSgVCVUTXaJV+b
X-Received: by 2002:a5d:5848:0:b0:42c:b8fd:21b4 with SMTP id ffacd0b85a97d-43569bd3483mr527130f8f.57.1768504706222;
        Thu, 15 Jan 2026 11:18:26 -0800 (PST)
Received: from [127.0.1.1] (bba-94-59-215-181.alshamil.net.ae. [94.59.215.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569921dedsm692734f8f.9.2026.01.15.11.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 11:18:25 -0800 (PST)
From: "Anton D. Stavinskii" <stavinsky@gmail.com>
Date: Thu, 15 Jan 2026 23:17:45 +0400
Subject: [PATCH 8/8] riscv: dts: sophgo: add Milk-V Duo 256M board dts
MIME-Version: 1.0
Message-Id: <20260115-cv1800b-i2s-driver-v1-8-e8b22b8578ab@gmail.com>
References: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
In-Reply-To: <20260115-cv1800b-i2s-driver-v1-0-e8b22b8578ab@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 "Anton D. Stavinskii" <stavinsky@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768504677; l=6398;
 i=stavinsky@gmail.com; s=20260115; h=from:subject:message-id;
 bh=9hhnvku6/o7SnlNe4s7OxE/c/yY1MeLPXn9ZiuwHDts=;
 b=j7D/duGQ4GkjR/PUiJLYxY2ySpoiZWhKC8trthmiOSLexzpyG9Kh+TZAgY8WBeTjjKbHh/F7s
 iKkJ7H/r284CqabbvOv7ff/QWJ2jz2zIhswlcsz/Ux6bUvDo5XxUoDn
X-Developer-Key: i=stavinsky@gmail.com; a=ed25519;
 pk=2WxGZ1zd1vQwSPFCSks6zrADqUDBUdtq39lElk4ZE7Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_111828_416187_68F1670E 
X-CRM114-Status: GOOD (  14.91  )
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

Example of usage internal dac/adc and external I2S mic
The example shows how to use the card and
will actually work other boards.
Fixed clocks needed to make simple card make
initial .set_sysclk with proper clock rates.
Same for DAC. I2S3 has to be started not only
for DAC but for the ADC also because it
provides mclk for both.

dai-link@2 will only work if registers
are set according to this issue
https://github.com/sophgo/sophgo-doc/issues/174#event-21395297524
in other case i2s2 will not output clocks and data.
Those changes are not connected to the driver itself,
but for another subsystem which is not yet ipmlemented.
The following config properly works for MilkV Duo/256Mm, Module.
Basically everything with sg2000/sg2002 but on some boards
i2s2 output pins are soldered to Ethernet module.
In Milk 256M they are free to use as external DAC/ADC.

Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile                |   1 +
 .../boot/dts/sophgo/sg2002-milkv-duo-256m.dts      | 231 +++++++++++++++++++++
 2 files changed, 232 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..c8901ff680cb 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -6,3 +6,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo-256m.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo-256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo-256m.dts
new file mode 100644
index 000000000000..cc33c4355969
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo-256m.dts
@@ -0,0 +1,231 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2024 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
+ */
+
+/dts-v1/;
+
+#include "sg2002.dtsi"
+
+/ {
+	model = "Milk-V duo 256M";
+	compatible = "milkv,duo-256m",
+	"sipeed,licheerv-nano",
+	"sophgo,sg2002";
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	uart0_cfg: uart0-cfg {
+		uart0-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+			<PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-clk-pins {
+			pinmux = <PINMUX(PIN_SD0_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <16100>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cmd-pins {
+			pinmux = <PINMUX(PIN_SD0_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-data-pins {
+			pinmux = <PINMUX(PIN_SD0_D0, 0)>,
+			<PINMUX(PIN_SD0_D1, 0)>,
+			<PINMUX(PIN_SD0_D2, 0)>,
+			<PINMUX(PIN_SD0_D3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+	bus-width = <4>;
+	no-1-8-v;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+};
+
+&usb {
+	dr_mode = "peripheral";
+	status = "okay";
+	g-rx-fifo-size = <1536>;
+	g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&dmac {
+	status = "okay";
+};
+
+&dmamux {
+	status = "okay";
+};
+
+&pinctrl {
+	i2s2_cfg: i2s2-cfg {
+		i2s2-out-pins {
+			pinmux = <PINMUX(PIN_ETH_TXM, 7)>,
+			<PINMUX(PIN_ETH_RXP,  7)>,
+			<PINMUX(PIN_ETH_RXM,  7)>;
+
+			drive-strength-microamp = <15700>;
+			power-source = <1800>;
+		};
+
+		i2s2-in-pins {
+			pinmux = <PINMUX(PIN_ETH_TXP, 7)>;
+			power-source = <1800>;
+		};
+	};
+};
+
+&i2s0 {
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+&i2s2 {
+	pinctrl-0 = <&i2s2_cfg>;
+	pinctrl-names = "default";
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+&i2s3 {
+	#sound-dai-cells = <0>;
+	status = "okay";
+};
+
+/ {
+	int_adc: codec@300a100 {
+		compatible = "sophgo,cv1800b-sound-adc";
+		#sound-dai-cells = <0>;
+		reg = <0x300a100 0x100>;
+	};
+
+	int_dac: codec@300a000 {
+		compatible = "sophgo,cv1800b-sound-dac";
+		#sound-dai-cells = <0>;
+		reg = <0x300a000 0x100>;
+	};
+
+	ext_adc: my-ext-adc {
+		compatible = "invensense,ics43432";
+		#sound-dai-cells = <0>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "cv1800b card";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		simple-audio-card,dai-link@0 {
+			reg = <0>;
+			format = "i2s";
+			bitclock-master = <&clock_master0>;
+			frame-master = <&clock_master0>;
+
+			codec {
+				sound-dai = <&int_dac>;
+			};
+
+			clock_master0: cpu {
+				system-clock-frequency = <12288000>;
+				system-clock-fixed;
+				system-clock-direction-out;
+				mclk-fs = <256>;
+				sound-dai = <&i2s3>;
+			};
+		};
+
+		simple-audio-card,dai-link@1 {
+			reg = <1>;
+			format = "i2s";
+			bitclock-master = <&clock_master1>;
+			frame-master = <&clock_master1>;
+
+			clock_master1: codec {
+				mclk-fs = <256>;
+				system-clock-frequency = <12288000>;
+				system-clock-fixed;
+				sound-dai = <&int_adc>;
+			};
+
+			cpu {
+				mclk-fs = <256>;
+				system-clock-frequency = <12288000>;
+				system-clock-fixed;
+				sound-dai = <&i2s0>;
+			};
+		};
+
+		simple-audio-card,dai-link@2 {
+			reg = <2>;
+			format = "i2s";
+			bitclock-master = <&clock_master2>;
+			frame-master = <&clock_master2>;
+
+			codec {
+				sound-dai = <&ext_adc>;
+			};
+
+			clock_master2: cpu {
+				mclk-fs = <256>;
+				system-clock-frequency = <12288000>;
+				system-clock-fixed;
+				sound-dai = <&i2s2>;
+			};
+		};
+	};
+};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
