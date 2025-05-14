Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B11C3ABD8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 May 2025 14:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6s7W8S7S1Hyd10lhwBEgNGL4oski0JWOxnnR/xWyD4s=; b=lEKcBHi70RpU5e
	xGX6EYvIbh1SAVBtPIAJ8grv2/qe2G4wunxQiB2rW+fi2y8BCtbZkhcz3zDgvQRU39m6B3Co1MpkR
	58fJKQsaq316TVfDfspT4Mo8hhEzrqOi1yLwezfD1nnfk0jBARSlJppw7qcu3xvXW1n3s/XMZD+yN
	dy8zgkJ88eQNMj5oPgPwDDY7VQHSQmd5MQ2lP0o0zZj18XLhoMFOfq7IgX1zflFMqMNTcMRQCJQ+E
	fzBMV8VjYOaTXgbh3OJcVUMUvRp7c9DCFEkeUpkoDryzvV6AivQjuw8gY6W1cqeA5P9iAVnq7uNd3
	VdY3grIQN/R6GsSQbW7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDGO-0000000FRDm-0aY7;
	Wed, 14 May 2025 14:39:16 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCo1-0000000FNCb-3o94
	for linux-riscv@lists.infradead.org;
	Wed, 14 May 2025 14:09:59 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22fbbf9c01bso56676275ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 14 May 2025 07:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747231797; x=1747836597; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rdKmRSuyPb6NIx8nY+1zDs9F4SWcGDkRxiLAkC20C8=;
        b=JEc1MF76m0EaukeK+ZqetRfwdDwaPBtA9Tjl4UJtXnuAjuqEV/PVAy+uxiw2BxaRnR
         2NtIVxnnBxjURbSLG4/nSkqogl9UlJ/IjgFVBHkG+thZEATOPpJz+1oiNZCdpeuuBl83
         jmR3mTgtbuau10m9nHPz+sMa+P1jlVTAke6yW2vB/7Z1SGDpgfV9Gc3sdUJNMeLoezHs
         KUI/sUm3me5eA+dA3ClVGEzIq3Sf2AAh5wxYEvBNNHpafETqcIyRDcfOhw9VgEsMLz3S
         ThlJuKgmc6ne0zYsDGamp512fBs+8Oc5BxiG1QXWjtL47N+hlRedpA4IpOiyFC143J4m
         4cYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747231797; x=1747836597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1rdKmRSuyPb6NIx8nY+1zDs9F4SWcGDkRxiLAkC20C8=;
        b=sAP+1VlEGuYbTO5O046Fi6j387kaeLtNsvkuH2WJCCCYKe5lAFYe8C8n3++xfnXuow
         0tDjwREax6lEsRWD3PBd/fpw3DP/ZDmnu7hNTRiOKlpbzkZypvsdlwDx+rStv/N0D3A7
         1rvCfau7XCTUG3KAJQVW7K8YepvyfLkjlP9BsvJ3fo+qyxfHbkakEwUeivPQ3SZwmjYK
         PWFSgK3pPdwh0A6/T+2lHTG3tSX8C1/kZGwzwC8edWEdUPSQrLO9zpLHriarSjWofmYv
         gLHm9LEuOJCbuXn97xu1f0w9cG0JW3450jAj5bvodLN7kzVvRX+lXZpuM+kgVvt/sQjy
         0ivg==
X-Forwarded-Encrypted: i=1; AJvYcCVVH3qXeQydm9nHXhjeu4JNPGJK2HhN1mX2ZKUkyBctB1mp4Q1nmFc44SsIDeJYLZkzAUaipxpUI6yv2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9Idj4ujOJOid4XFS6MFGsitXCE5B38Dq5Za5aKmtEgAw5M9Ml
	6IGDB/FuyEwH4CHC6GHpDBVJQ727IIfo3fWxGLN/mPXsM4JSeGz5
X-Gm-Gg: ASbGncvS1yi9IDzSdOC+Y9PouLJufwbVD5MErzM8ufb8h0mOaXhDfflZPD6Md27CRGi
	+noIPpDzQfoqBaq+joKBUOx6RRxCY7t2eAh7C6KpOxdNc8SKs7180qR6jkrQJFdYHgZmMfVPv8i
	Uv7ioWZnQKGIbB1t6eF6hmgg0zGWIAd6vwMGmQ5JRk6HtAjWZ7Pl2YqdFC4DfqwoPLWwTrYz4rK
	JKd3rwJex6G8h1+TJmsU7faIAysKK9S7q3y3Zpmipy3uUevVbZ2vJ5fdWZTb9ZDvIiDfthcl/u6
	Vz5koPZqzkKbdtF3o53UNNF7LyLzbG/FMehzsO0z+MMXcg/y5sOlNJCE7zO0rg==
X-Google-Smtp-Source: AGHT+IGqfxH9wcWonGS/XzWU03rDStXfIqzHF3ukgWS0gRVxFE/c9T2Pr76UvBAkI0eaUZGD7u71uw==
X-Received: by 2002:a17:903:1cd:b0:220:e156:63e0 with SMTP id d9443c01a7336-231980ce4b4mr46290725ad.8.1747231796258;
        Wed, 14 May 2025 07:09:56 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc8271ae0sm100407975ad.128.2025.05.14.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:09:55 -0700 (PDT)
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
Subject: [PATCH v2 4/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree
Date: Wed, 14 May 2025 22:09:02 +0800
Message-ID: <53a9a794641af697be9170e6d0af464a39d862ae.1747231254.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1747231254.git.rabenda.cn@gmail.com>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_070957_948993_4752B57D 
X-CRM114-Status: GOOD (  14.42  )
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

Sophgo SG2042_EVB_V2.0 [1] is a prototype development board based on SG2042

Currently supports serial port, sdcard/emmc, pwm, fan speed control.

Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]

Signed-off-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile          |   1 +
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 235 +++++++++++++++++++
 2 files changed, 236 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 2470e30ae901..31fa46ef3bf6 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
new file mode 100644
index 000000000000..8eba1a4ab1ee
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
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
+	model = "Sophgo SG2042 EVB V2.0";
+	compatible = "sophgo,sg2042-evb-v2", "sophgo,sg2042";
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
