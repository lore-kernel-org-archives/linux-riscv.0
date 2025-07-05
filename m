Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AD5C83F0B
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Jul 2025 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPGJvVDuVVmA6Zxt4MmdWMQ/VQ+/ALhzuO1pP602388=; b=yMc3TofcZ7+PJc
	OvjjNVeFuv5rH11FXIiQhqvP0pq4h0yO21o8fW23jvWlC3LBS8c/TdByJE0qZcQvW708a5OVEz1mi
	13S+j7NzdosISGiVeew9Gx46Ms5p1+haUy3zOZtlvrAfcy/BS15TUsdROlTEbT5RG2GFK51FQ++3K
	p5dR77yrsUBjIphG2ynDKYkPFlO/iWnOk7S/UQYhnwd0iLW3tPHAlD+0r0/zlvKDrTChayUh+OrDT
	emhkXNYWg7DrzxfCBlrWy0JdOfCawwZglQrgJQQV6TgaHHM2jzV99uhvtbg2OhGiP8KsqbnVJbKHn
	ufU3pQtuBSYjam3EfEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxi8-0000000GFZA-0wY2;
	Sat, 05 Jul 2025 07:53:24 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXxVi-0000000GEZc-2o7k
	for linux-riscv@lists.infradead.org;
	Sat, 05 Jul 2025 07:40:36 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-74264d1832eso2009331b3a.0
        for <linux-riscv@lists.infradead.org>; Sat, 05 Jul 2025 00:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751701234; x=1752306034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5pKCohS34WfPUKUpxcwZlTKqTz2/JTPjMDgBU0dsFE=;
        b=jpBwLlYeLFtDDplERhP1IKQ7HfCvS8dBe8KhLFQQClz40sjeb/pKUsMxWdY8cLub5x
         hzRpqRBH2ickknkXPuvJN7N1+01bsVQodxd2TqGal2efEi8GCVXpCAEgGSxK1TQ8H7vT
         UQxMH0ouuLAq017OOj7cH/a5HVgRRAronvTmMfPO3SBXUTSVHi9cV9ehEgurzYvyhXwL
         V329QCVwc/elbak62k+W8toh4+S//WBmKamNF/ti5PJkmW+BEIuYw/VwfRd9QdtF89rF
         n7MIVKyK1GpUHZ4hSxPr4i7HJdjnDxg5kTZeE6hy+3VcR7pWov5zGFASrzwLcP9je2P+
         3vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751701234; x=1752306034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z5pKCohS34WfPUKUpxcwZlTKqTz2/JTPjMDgBU0dsFE=;
        b=hBSFTtZ9HBIzSRoHZ/Ipi1wAqL4i5gV+akJJfqK+jB6R5muj5Ql6YKpPbhXPm+wUPm
         evQGZmbFXkynslL1ebDgdYge8BLQi6mDnqFcY0ZdLdtaz9egdn90ri/wyxH60SBuRw4N
         Y2NWDkO4Cni2NRPFyQfM6JyRKihEcniqmedOuHzPqUrdVutO1rO3Lyfe9tXLFe3dQtlP
         Bbr/Fu99AV8gnhCNo2gZWup7AHqPTPzcfT8oL4v8wCkDwk0Aqu/iS3fW1M4Yi2coxEnT
         76tYGPQNoCVpas8ApI4FmcX33N8btD5js4rbpbJLp9puqbtQec6uivXR8H33vWzUPWcv
         fhCA==
X-Forwarded-Encrypted: i=1; AJvYcCWu5ALcx4Ob/IwLM3Mn/nynR3hbJf4O4Vxzmfz4RcxAnjGNCDQ5LRWTFpf9yQU+rU8fgH6CBEKohRZ81g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4PTsQ5odCITAxFkB82XEKYESA7u//nQmaDFQSWmT4aY2AAWze
	4IfUMnTztskxYghCfH7HJT91tadi3GjevzVBDtnwn0msb9It1PdlOk62
X-Gm-Gg: ASbGncutHyHxQAVIanC0NJC5GYoFeMLswb19HJyclBsw+u3DhC8F94E1pYSJUONYfGV
	rDHYrBy74zALqb1QmwJ4ueFz3g9o2DOKNPitAofafT02wJE3gdmppjPJr/dy9MzHrUmtdYbER+C
	eUZ2/J5zEYHmu328A/4Umuyw0Hvl/mr5zBoO1PYxlUx760I82IVSmhzx28PFuI2LYgw9tKS1jw3
	kDLmYNNd04gt4zg2p6o9CHNrjdrlgqTScqILJOMlVLOuOmYAJfhL4GWbL6DnioJceMF0N7bjUBs
	c95q+UKz2/yX7YMHdOwnNb4RDT8dpmrVEnZGWXmKGmGoVS0mvSkZBPdytwUj+LhOJlzytbPd
X-Google-Smtp-Source: AGHT+IG9dNZaCVFQzrF7QkF/dQRjzMwk0JAyu5rEKfoJplsviezLQN6u7ejFaJg52GjdxcVnYOftLA==
X-Received: by 2002:a05:6a00:4613:b0:736:5b85:a911 with SMTP id d2e1a72fcca58-74ce884e035mr9064827b3a.8.1751701233432;
        Sat, 05 Jul 2025 00:40:33 -0700 (PDT)
Received: from localhost.localdomain ([119.8.44.69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e852sm3993616b3a.85.2025.07.05.00.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 00:40:32 -0700 (PDT)
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
Subject: [PATCH v3 3/3] riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree
Date: Sat,  5 Jul 2025 15:39:56 +0800
Message-ID: <c1b6ccdc69af0c1457fc1486a6bc8a1e83671537.1751700954.git.rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751700954.git.rabenda.cn@gmail.com>
References: <cover.1751700954.git.rabenda.cn@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_004034_707129_FD0F995D 
X-CRM114-Status: GOOD (  14.12  )
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
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 233 +++++++++++++++++++
 2 files changed, 234 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6c9b29681cad..6f65526d4193 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
new file mode 100644
index 000000000000..46980e41b886
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -0,0 +1,233 @@
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
