Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEE8C83F0A
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbfzmfYvrXDTmo81kJG3g72vVcRDygSiyYXp8LUG8V0=; b=FkCLnVB2p5Z7HE
	BBP93FYcuTgU7oECgB+QnpDEOxWJKCQeGPmPZ8cKFOZ6uYixqfnDH5uYVRYmWhZhIl0VrBCiLcVah
	SxFhNjGUCTocZXmzkj4qqoEf88enCUp0sQoaz0EqzsqG1GzCnn/ds5hltQfCGJTJPk5SMwlDkglpl
	827GqcP9gnrQgM37eGDDiNBoWdNUpISicYjmyCdqI5d1KLMP46oIY9Lj0ONgTONXCVTar5iK5Brxj
	9G+OVSyZCpfO2uIvBBdGfJg7IfKKO7w+kBaV8F4aIfmgLiOZe5fxcE5uhrb/qXMefTVVLAB5iPRN2
	5pqtva5kKtxVVtuvAwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxi7-0000000GFYq-2LNO;
	Sat, 05 Jul 2025 07:53:23 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxVe-0000000GEY7-230C
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 07:40:31 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-74b56b1d301so935657b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Jul 2025 00:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701230; x=1752306030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jmNEezpRloOjJ1XA5ZHok3ZVRRcPJg09tTrd/q1+ELE=;
        b=mmxRzrhdidiJkA2u/JaZNKgoTC00kJC0i1dvIdmjOLZH5nfU09rFF0Eik2G579UHD+
         Ogm1AlXDoCTo7MzpFGm4dmO2VRQBaxfaNScE7gAp/bCaJz0lSK99tJKEelCsfzWYHlVf
         /lAAcgPxVYbo0HmbwMvluWhITZC04vqHr0tu+LhWKYRxjfhOOqgQOnCJXinBebJgpVIE
         wPFy+Orl21kjSbRwL+AbbqNoque5w1h9Hy4su6A+R+zF01ZFjeQ4Fr5qHr+w3hqO8qQj
         zSY7HGyHtz2e00tTLfJWCkrifEKfmDgqFWX1zPqSxOfOuYo84i/mbxQQ0f5fYCvrUTPe
         taag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701230; x=1752306030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jmNEezpRloOjJ1XA5ZHok3ZVRRcPJg09tTrd/q1+ELE=;
        b=DGHn2Kdq4kYWRck0Y0UTX0/PkPEVUusmq0srf0N61YpF15AtnUJ0qE2NieZefOyhbp
         vLeHkp1/WMrNUkSa9V5EC690bAfA5GRBe1ivqsAlc/jQkD5eVlanBQ/fE8HfUdxyNAEM
         TAYqkp1bLAxS0A8B5fAwEVKmSczRKGDqoBKu958+fv9DvBN3gQ+hdAHfSf6334kNAA8b
         wqLdiEw8IZVdpXwFx759p6C4OifVVVxuGzYCZcVm2Rw233BXUGk4T/Jn468NM+LJG0Pc
         voAsSZF5KRtMiG95S5VpvaMYDL9Ww46spsP65aIqyql+CcNtQUl0UM+k92Im2cDT8if6
         To/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpB2hQFOi/HG5gUl1USXDiCrouYE7H36i5eJmXWupQ1g0pOSK0/M8NFxNp2luNoixGGA/ENJ0h6Kft7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8DAjo3ElipDpiM5kCkjn3GdQwIMOHX/NUTv0xCvW2qE3Oh2fl
	TneEjuLrWtIbbsOqty2XH6XDCYrZ+fwBxT059nbKJp3CVwW7XB1lhvJr
X-Gm-Gg: ASbGncteipyNx6I4kFTtVXF0T3f2DS5+nWQJlmzbNIN8rC6EnhqH1VVBpvqAcFADjVM
	GuaVjHsa1tMignpN4GDhvpSYVsKU8jNDM1b3FNoEVGgbGZrWpdxIJHLrQS/Sew8UeRHXPaNPzua
	4qhOpZQy/alV5MQ0DpcWYea3HxsXHmC2oxW5wf2a8Ga3oZtrGS1JLBkf9SMccxk6un9LCVoQzTd
	hSJEtB4pSoe9h2lo62yqF/teV4DPZ5Q1ac5r4vyUI4EV9EjR52YWDEv9vGhZKPQOxElLsdP6DTt
	Zeqt2rJVbukDV+DLAZf//gguDwiTyJt9HCcsU0gO0kEYCHNTW6LvKhFVDPqNAGcu8Th8GZSc
X-Google-Smtp-Source: AGHT+IEWPPOF2x85dNlyqkl6KGAF0hJCqYC/MuMMyXCXQDACKIzhBOs8cP+9xAeVsasrbcf8U8MyBw==
X-Received: by 2002:a05:6a00:1412:b0:748:fe3a:49f2 with SMTP id d2e1a72fcca58-74ce8ae79dbmr6487010b3a.21.1751701229085;
        Sat, 05 Jul 2025 00:40:29 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:28 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
Date: Sat,  5 Jul 2025 15:39:55 +0800
Message-ID: <27091134ce1f8a6541a349afc324d6f7402ea606.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751700954.git.rabenda.cn@gmail.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_004030_527521_ABD37EA0 
X-CRM114-Status: GOOD (  13.81  )
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

Sophgo SG2042_EVB_V1.X [1] is a prototype development board based on SG2042

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile          |   1 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 245 +++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 85966306801e..6c9b29681cad 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -3,4 +3,5 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
new file mode 100644
index 000000000000..3320bc1dd2c6
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 Sophgo Technology Inc. All rights reserved.
+ */
+
+#include "sg2042.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+
+/ {
+	model = "Sophgo SG2042 EVB V1.X";
+	compatible = "sophgo,sg2042-evb-v1", "sophgo,sg2042";
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	gpio-power {
+		compatible = "gpio-keys";
+
+		key-power {
+			label = "Power Key";
+			linux,code = <KEY_POWER>;
+			gpios = <&port0a 22 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_KEY>;
+			debounce-interval = <100>;
+		};
+	};
+
+	pwmfan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <103 128 179 230 255>;
+		pwms = <&pwm 0 40000 0>;
+		#cooling-cells = <2>;
+	};
+
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 0>;
+
+			trips {
+				soc_active1: soc-active1 {
+					temperature = <30000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+
+				soc_active2: soc-active2 {
+					temperature = <58000>;
+					hysteresis = <12000>;
+					type = "active";
+				};
+
+				soc_active3: soc-active3 {
+					temperature = <70000>;
+					hysteresis = <10000>;
+					type = "active";
+				};
+
+				soc_hot: soc-hot {
+					temperature = <80000>;
+					hysteresis = <5000>;
+					type = "hot";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&soc_active1>;
+					cooling-device = <&pwmfan 0 1>;
+				};
+
+				map1 {
+					trip = <&soc_active2>;
+					cooling-device = <&pwmfan 1 2>;
+				};
+
+				map2 {
+					trip = <&soc_active3>;
+					cooling-device = <&pwmfan 2 3>;
+				};
+
+				map3 {
+					trip = <&soc_hot>;
+					cooling-device = <&pwmfan 3 4>;
+				};
+			};
+		};
+
+		board-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <1000>;
+			thermal-sensors = <&mcu 1>;
+
+			trips {
+				board_active: board-active {
+					temperature = <75000>;
+					hysteresis = <8000>;
+					type = "active";
+				};
+			};
+
+			cooling-maps {
+				map4 {
+					trip = <&board_active>;
+					cooling-device = <&pwmfan 3 4>;
+				};
+			};
+		};
+	};
+};
+
+&cgi_main {
+	clock-frequency = <25000000>;
+};
+
+&cgi_dpll0 {
+	clock-frequency = <25000000>;
+};
+
+&cgi_dpll1 {
+	clock-frequency = <25000000>;
+};
+
+&emmc {
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	wp-inverted;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-0 = <&i2c1_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	mcu: syscon@17 {
+		compatible = "sophgo,sg2042-hwmon-mcu";
+		reg = <0x17>;
+		#thermal-sensor-cells = <1>;
+	};
+};
+
+&gmac0 {
+	phy-handle = <&phy0>;
+	phy-mode = "rgmii-id";
+	status = "okay";
+
+	mdio {
+		phy0: phy@0 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0>;
+			reset-gpios = <&port0a 27 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <100000>;
+			reset-deassert-us = <100000>;
+		};
+	};
+};
+
+&pinctrl {
+	emmc_cfg: sdhci-emmc-cfg {
+		sdhci-emmc-wp-pins {
+			pinmux = <PINMUX(PIN_EMMC_WP, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+
+		sdhci-emmc-cd-pins {
+			pinmux = <PINMUX(PIN_EMMC_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+
+		sdhci-emmc-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_EMMC_RST, 0)>,
+				 <PINMUX(PIN_EMMC_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+	};
+
+	i2c1_cfg: i2c1-cfg {
+		i2c1-pins {
+			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
+				 <PINMUX(PIN_IIC1_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+
+	sd_cfg: sdhci-sd-cfg {
+		sdhci-sd-cd-wp-pins {
+			pinmux = <PINMUX(PIN_SDIO_CD, 0)>,
+				 <PINMUX(PIN_SDIO_WP, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+
+		sdhci-sd-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_SDIO_RST, 0)>,
+				 <PINMUX(PIN_SDIO_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <26800>;
+			input-schmitt-disable;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-rx-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+};
+
+&sd {
+	pinctrl-0 = <&sd_cfg>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+	wp-inverted;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
