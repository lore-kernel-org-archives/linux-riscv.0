Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A150C3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GTRCmNJVSw3tk6qPpRubcbbVoUFiW3dLocZMEZ48iM=; b=ix056wkh6xoBUr
	9P/LiutMCzHHiR7CK1IFLevHluBUHnclyA85wa49ey7Lj6yocbOF11b22+y9Jer/egg9K+C6Pan4g
	gQlh950PHxByet5J83yZrH+wi3FhdBfgLb5/tnjhYQF3w+rcS9CklM0MeUPHeY1z+dz2HWoUSuT7c
	LGY1UkGSTGLHsUI3H3mY07MLd5k4vg2lGmQI3pBB9pNBA/OHS0pmjv6hVrOV0sXEKgXIBGaRex8WK
	DSVFnU2Uw5/A5Kzvwp9E+BAKg7NzdpQLC+KW81PILjpdnw1+h+86+5jLqHT8Dbox/6MpzFn6+8uc6
	zsLntZKArSFDZkoEJD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDVJq-00000004xzo-1yeW;
	Fri, 09 May 2025 21:31:46 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSEj-00000004Xme-0KMs
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 18:14:18 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af548cb1f83so2071172a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 11:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814456; x=1747419256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psAvYOGXh6qfdM0gGsrmFRR1sHt1RBa6/E1HfecWQUQ=;
        b=hQgLohkyEnjBi/SLqEDe/D8hzgGXOuxC8G5Zqtls+NXnnPWwvvDPc4AROqlcsYE4RO
         iAH2alf7CiPhLz9xK1ICRK6qILG2JZsqG7UGb1S6rrC/tQWdq5H32pIX7tr2t5ykZBa4
         wQaiGxQGwQB1Nwyfxw4zZ0oQaGACqnl2xyOqI+6tHSTh5gcpRaHl2iVykxyV5qJvJQzB
         YPJKOptQV+mx/auj577D6XBarX5jk7S4xBZmwwG+60jQnf+jQAPfRAexIhA8X94EOJkl
         Lq3ZaRuDfRTtmKKJiaV63cd9qpTWJVKUY1omcfGL50PhzrNaI83CkSj9gdrCL2ZCG51D
         Vr/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814456; x=1747419256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psAvYOGXh6qfdM0gGsrmFRR1sHt1RBa6/E1HfecWQUQ=;
        b=SNlV3dr0pvvokUJisuv/RR+WtYFDPkcOIDtVbxfYaGi7fbsguTIRxjAmKE3X6hI1f+
         vXJ67CMKXwkfxcAVln0GO6iDpKZwgFmztlhVdmIT8rfhGzv2VbhQFMJZup8iKlvPy0k9
         pOg+2H/qSvc8KAKXVQ6dmwWVrvOEEcGJThyOkodXB12cWyNv0bGN2K1oHLT89+7Y0e6c
         CDriJJY+b7FYQgeqzBtVZ/NBsQfz74lpyih4T3cMDtwWov2+/GEN++00wVTZyNoJlbxP
         7B7rzsefmNkqRx6QRluoS539GqwaDMB/tLXgxFVR6J4zaZrCP14wRdA+Wqg1I811ximZ
         gdJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTwc0HGowBCuTxSp/F4Vu0K1aUfrKZig+nofWJBBV6yAh0ICwFDvZ698d/23PMCEfipwChYv9Ci48hag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa6s98v0hJXFKkbpihhQeq0H4Y+Mfu6m3zmJ2bddHnJiXVnbHm
	dX53q5qoN9i4nB5BYTA6NqdKkjWoXoTS3ZCQRHb6+AbIh1REnLq8
X-Gm-Gg: ASbGncsUCxhA0+Ua2iRJMNu9yQ668z4hTNsXctEzoL1bem+Yv3r+OiBd6JJ63lhDsLE
	i9MqpPGK1/9qi3FJxTSSJw7LWIPct3SRTYRavoqESeO0kzrI32fB+8pCGwg1epc1peOfQHQa6Wy
	hyHJUyKd7z42vgAVnxG8FJx6xZPb82wnQKFiu3mNsSN3mhq376j0r/vS19BRUn4UWy5j3CtRki6
	Mrco64ZtjQlwYVra7MNocPKmXQcdLxCv60ip1flssyzp0vZJFRDIRDIhdebfQjXObGPOcZg0hGF
	UCCb55UBbOJfduBaeRhl0C9Pwaodi6Bav6hOt08a7B/k3naiy4Y=
X-Google-Smtp-Source: AGHT+IEmvpSWc/iMW6qMXvu2u6JswvB2BzKJQqY7rwJhZRadXgo56zWgSuJT8/CI5hnAI5/90BDGng==
X-Received: by 2002:a17:902:e745:b0:22e:7e9d:9529 with SMTP id d9443c01a7336-22fc8b59806mr59755985ad.20.1746814455731;
        Fri, 09 May 2025 11:14:15 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:15 -0700 (PDT)
From: Han Gao <rabenda.cn@gmail.com>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Guo Ren <guoren@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] riscv: dts: sophgo: add Sophgo x4 EVB board device tree
Date: Sat, 10 May 2025 02:13:30 +0800
Message-ID: <b6ef6550da398d0440851854c6eec1e53f2d4a96.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746811744.git.rabenda.cn@gmail.com>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_111417_148631_8CBAC893 
X-CRM114-Status: GOOD (  14.69  )
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

Sophgo x4 EVB [1] is a prototype development board based on SG2042

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2042-sophgo-x4evb.dts   | 235 ++++++++++++++++++
 2 files changed, 236 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index ee6495065521..4d39e644c2d1 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-sophgo-x8evb.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-sophgo-x4evb.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts b/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts
new file mode 100644
index 000000000000..7165d49c3887
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x4evb.dts
@@ -0,0 +1,235 @@
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
+	model = "Sophgo SG2042 X4 EVB";
+	compatible = "sophgo,sg2042-x4evb", "sophgo,sg2042";
+
+	chosen {
+		stdout-path = "serial0";
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
+
+/ {
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
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
