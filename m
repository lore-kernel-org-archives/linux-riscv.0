Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7207AC3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 20:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hD7ElHkM20/nHAtmTPuIW4Bv5xJ90Nydm/TP/Mspd8Q=; b=qg8YpdYQpyq6ez
	pB9XsBVqhMpy5PTmzNaGK9bBXxHEC8gbrx/z5Fz7dPbOc5XFuIyNRS79jIg/kJy+75nxjTKVAfMRO
	qdKNLsVx+JnXeKP57Eh6avUdkGnYkORqe/tbNRInCoeIJRSFJtXm9ZhtS8u4k4IcrvWpqI5KNa54L
	9Bx+EZkX3oCpIxIl6SJJgJtAsVe/tc5j/cV03j5YcBghzdQu1vK6sAZX2Bql7Yfg3qJNzxRzIhx2e
	Zwlg/SINkuqEPS7eRsLNDR3HSSiTpi4S1UPvTmRPQBggGkdTpVUxnyfckzCNmVyc2rcpqcHNSh1fr
	GH6X6/ymqannMZjqRtGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJs-00000004osF-0Wvr;
	Fri, 09 May 2025 20:27:44 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDSEa-00000004XjK-2V3p
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 18:14:09 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-30abb2d5663so2440012a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 11:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746814448; x=1747419248; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sihitOI2VqTkUCTo505VuHegdwxIY4rc9L16IHG7UoU=;
        b=cXpKagZEHPXgOpgNO9mb+aJdJfop6Ffa5wETR92aH+p3ETKm82wuSbz9LvGKwu0Imt
         1WvT/pmRvuF6pgEWJiCY6OPmyhy3nzveiGP6gVG/ksDZN0wDpAZvcEfcgrokSrkOUKlC
         AFR0PtTPQ2SvYNUiDtuzQqO/ceO8WzHaFiEa3QxWC3mKoqTiB4+Qw9vWwEvPPd9ERmtu
         /RClFB25PWRm4hSou4GdLaeoyxS/RmIp/GxYzJ+lrbWknYqyJup2QrzlcqR67IurmTJI
         k93XV6zF257bSI531OJ4XcUa9R+wgLnBtBl3GEjpDYpCEp2xmlnUsHQioKXC151YWR8D
         S+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746814448; x=1747419248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sihitOI2VqTkUCTo505VuHegdwxIY4rc9L16IHG7UoU=;
        b=c+CKHZyhFIBDoAvf3fsGz8ZlHpOSkt+AuRadksmVPD9Bgg0YhXzx52MJRJFe2FJ6CV
         nTrA+XZbUe0bh4uq3FfTlhBMPagrEyCCfnnMxxxAG9o1CdbiVz00g6uCsMDvGV6XXXSX
         8WB4gqg7bDFBnEoQFhrrdDghppYD5I3N3I90A990GLUwH/2vu9sRwL20I6jSY9aVEHwt
         iUOFpJ4KMpaEkg4jMKr+rQxWQikfHlzsR2TvH9E3wYSaOAxayP+uInpOhxoCZDpolDb0
         fM3DEAdeKNMBgYNC8T9X/aCafBDTQ0S6BM/7bSeQA/WpPnzUzcDZnlGZRLSJC2tENA/F
         q7mw==
X-Forwarded-Encrypted: i=1; AJvYcCUblspQ8Vo3dSYCUbLdum+0NpLc31VOITjvMM59JWHjlsqznvxRvnoBOxUD8GL0cuSrN8TrPoLb3FwlFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKfzTNs9Et9sgZMdVq6qukr1PVhyCUd/PESeNSiDSR+3wlslUa
	HdzVcvDkp5j3w0IkeUWsEmYvCrtJNV24zswbx4LojiCGHCFcxSNoduJfknFi7A1J9Q==
X-Gm-Gg: ASbGncuL5y7g9hmrAdd8nwodrcqRE4Z1zIQRidmLyhR2u5h3cdCKqJ7OKYyojfEONfi
	7GV2IGgLgqKW4sx4rNds/0K3RGsRh7b0mFmsIyBfK9L8uFTePJYT1W/YPQchpczdDwPiqvgHjwt
	ATykXtmUHuZfsg6trLgbn4z9UH2P6ByHD+6yBA2CgKeCsfqprtvIbGilGIyzmJDBWeTKgOFXCuJ
	S0VOzDeoSSiXLeJySMznmdJnFNDXiilDGUjUo2mo07Dxdg+zgAnn2L7sNP01WH8qBPifzawR1QC
	5SEHiFHwn619Kf1WJ7yTkMVfZG2akAGh9BwllID1ZL4sJWb+PHA=
X-Google-Smtp-Source: AGHT+IEG4j7wKbPsUfKIgf/34I3dl6xnmZJzBzACRfx//R8GM6fu4AfBcZ+78vA/c1bBjrYM5m3Bfw==
X-Received: by 2002:a17:90b:3b4a:b0:30a:a034:bb0c with SMTP id 98e67ed59e1d1-30c3d62ec5dmr6818233a91.28.1746814447178;
        Fri, 09 May 2025 11:14:07 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e61083sm2127309a91.30.2025.05.09.11.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 11:14:06 -0700 (PDT)
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
Subject: [PATCH 2/4] riscv: dts: sophgo: add Sophgo x8 EVB board device tree
Date: Sat, 10 May 2025 02:13:28 +0800
Message-ID: <d3f5b2304d2156d7b39261ce507dfe21f18a2cba.1746811744.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1746811744.git.rabenda.cn@gmail.com>
References: <cover.1746811744.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_111408_634841_65C82699 
X-CRM114-Status: GOOD (  14.50  )
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

Sophgo x8 EVB [1] is a prototype development board based on SG2042

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2042-sophgo-x8evb.dts   | 247 ++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 47d4243a8f35..ee6495065521 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-sophgo-x8evb.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts b/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts
new file mode 100644
index 000000000000..a520b83948b7
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-sophgo-x8evb.dts
@@ -0,0 +1,247 @@
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
+	model = "Sophgo SG2042 X8 EVB";
+	compatible = "sophgo,sg2042-x8evb", "sophgo,sg2042";
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
