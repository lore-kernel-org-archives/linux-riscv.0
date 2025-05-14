Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887F8C3ABCC
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvQiJeNWlJ5K1YIJ5HGJhRPI3bUJgILj1GZIhblzplc=; b=cjeg17Cwt7XPxZ
	RFnivgTw7S2cXk0m6viO17wh96vHew34CUWjS7eNCnQEWO9AmLumH+WqwDFytmykD8RQVpWS9wUys
	yy8ZhE86f5xjt1J2DOQ+e4eukW2nPzuAuJEhAC5rFaBh2a3zQ52itxhsvimpAD32ZFcEt5mIUPuWp
	+AJdMLarhQiGbAwTHCHaGh/VkYv+Sx/cFnIqRaDCXYNaGeDiQyH2oTOyPlgKecOGFOcVzo0EP67wT
	p2ff5xBPtLfnBg6RT5M08YbOUx6aaozj6TqvZN2WrPGGG8VWIJtlt3G4mWLSPrdhFJ1q2l4klD33g
	Iwsp2BzjxCS8pCbrjq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDGM-0000000FRD6-3TDp;
	Wed, 14 May 2025 14:39:14 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCnr-0000000FN7x-0clL
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 14:09:48 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-74237a74f15so7663817b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 07:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231786; x=1747836586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l/tDDOsxJs07YQDlwg9apBuNhXsPbs8Zot7rURIZI90=;
        b=H+NmOISXMfh3BXfDyO4dRp51p1BTLAD5xEY28YyAnGvKrh+E1EWZ3JBaQ7of2c4ZqA
         ITcIHoIab2bIkWbSSSeIhaDBS2zluOlhFfSlNwrjrb7XEuPy/d7KnYyJnF5Pl/7yox4N
         KnH9th+5mKfGA9KdInJXSGFHIM9aEMWIZgq6ot0sAA00eE0I1kyRfJMAUSNaIFesXo/I
         bVSNkSCmVE68q+mkXbjmd1u4J2FbWuDdTWa6vjbp/QqLzjiTpBayS4bFgxtaAoNtF6an
         mRKF9zZ2xBhxVtJQP3fKZwHNf737dmKP0HPZGUyW/lNi1d2yCwEROxX+PvR8bsBfUyyr
         og7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231786; x=1747836586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l/tDDOsxJs07YQDlwg9apBuNhXsPbs8Zot7rURIZI90=;
        b=KPCskPFBFiATQGYgpLWvnxH7mtbrsktHYU23VRE7wvUSvfQ3f6SWSvdUyYHazJnkCc
         wmM0/02Lp7iirZQOW9RIF+hGRgSU8eci1zR9KO/xk7P/rXaFhZ9epx05aWLR4+ZudSak
         VjWvTTI5gA8qTggGEe17OoaFlpxJDNW6OPGfRWuDJtqbgXk1apVOLILrgCyPt4vA0LnR
         mFvRVbCJHE08oPsNWQHrLFzegc4G1E3JLJKvzhrfbFJmB41WmQE3ebUqawX0RCJJNsoh
         erjRH50JT5xDziNd5Ph33fGLaykb4O/i+ozaccpw/XQWA4ihd8KEVenbjWkH5qauwizz
         WzEg==
X-Forwarded-Encrypted: i=1; AJvYcCXQNzKqncd/xeGBUsFXXk/IXpFmJEyjr4qe65ZDXEKl9PHqrSn6OJKXfRmbbZ77HiNfH/3h6f3if7/Ucw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAmE5ffko0frKumvC9ZLxiwTFXegKbzuey67E47d3bzaky11sD
	IbvPTIexWQvGSPbUikgfAAPP7ZutN1g+i1lDtWih+fJV67GcjTPlKE6vCQb/U0BxUg==
X-Gm-Gg: ASbGncth8XDRGuA+LsiTA1rQg8gUWHst8J9eJfNxirxRzyX+JNZR0ZQPGtHxEmdQ/P1
	7P6O7FFDFKSflVQXLCQd/FlA103IQLOljb9a2loQx0j7mWTNB75H4uvKRM/7Js8+fYRH4nHPCZD
	fTV88HuVlP6s2q9OmyEXpfsLkCkC0L0qJ/YsU9W8dwmkgxVBpmPyPnegghTvlRK5zVpDON04u05
	zLtnbBGKlzaQqrjhGnoYujjDQ6rspK4bT1Nx7CJVM8qkwIpgbT3yvDw+V1R2ezn2oSaqu38kGJd
	ZU3zECLmlfdrJEoCe4eaZZYWe8Sth10VQ1C/OaePfHBQn0B5BDordKkB6nommA==
X-Google-Smtp-Source: AGHT+IGzNLrdYqEU43CSK9rgesMbr8KRwQz5fJHtv47C5HKikvyw5qElXCaTEkikOXWVLKIEBEZUBA==
X-Received: by 2002:a17:903:1109:b0:223:635d:3e38 with SMTP id d9443c01a7336-231980cf7c1mr51388775ad.15.1747231785418;
        Wed, 14 May 2025 07:09:45 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:45 -0700 (PDT)
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
Subject: [PATCH v2 2/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X board device tree
Date: Wed, 14 May 2025 22:09:00 +0800
Message-ID: <4f5eaf5285dbeb0de1c8aa4700ca0910273e7674.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747231254.git.rabenda.cn@gmail.com>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_070947_188602_0F8B941C 
X-CRM114-Status: GOOD (  14.31  )
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
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 247 +++++++++++++++++++
 2 files changed, 248 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 47d4243a8f35..2470e30ae901 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
new file mode 100644
index 000000000000..4f39a2575b8e
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
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
