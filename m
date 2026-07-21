Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF06AC4452D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 23:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSg3e9T96qzSGP1rIZ8x3XArje0BmHlyPgNKpgVEcKE=; b=ijFIHQ0ibD5SoH
	rwjkOcP2Z3V3yzokQ6M0ofGeSF8NGqU1efXnbMeu6+X0fjQX8zCGkxRVcVY2GF27ymyL3XLvFUjnB
	oNU+45hj4RQly+f7ITMGFyMcjXlgVgRMJu0tBvCZsjon5O2+uBO9BgF6bHXGBHodmnyr4+K/qldXk
	ooCNoHtFbA27l5Q+OikRCuNlimqZzgxyf9EdhkneV7wSTDBWDi9fxmQeLhNiJ4JzhyC+yKZcQuiH1
	xsOU70oyKW2NGRf4mb73kyWUteJae9Z++UjRjmINEuINSvwmOWrmE5uwJktSPJiUJGT19SBkWJZF2
	kKMoNjAHGTNbLAlnliJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJzp-0000000Ab3s-45Zv;
	Tue, 21 Jul 2026 23:35:34 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmJzn-0000000Ab2b-1IXX
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 23:35:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ccdce28edeso19675995ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2026 16:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784676930; x=1785281730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=UUFT4/QlGF2tRlXq40/fmlXm62ETamrof7CE8ta7riRgiMUL6r68AVphPTZR4HHJ2y
         wYBbqjgLvFp+0m6atxTp0q33iThVuwWiWB3c3vtqaMT+ZJvtkDzCRW1PumSBp5AGsGQa
         iqK8rcuIQUa5kMh8vXx9Sod6ztqihNz68Dg9pxgu7wny5lAxmvBGSCSNXIQZGjOpib9D
         hc9ksnq+2OVbWUdZo9LdzVKg1g4PgPKAGAYWuhdtwMSTtZ4Ey0JktE7O2njsoQGRTsvy
         maSQNFvaZYYF71YIxWD1pgMfa0w9cFgWBL296rZbBJrSs5jYt7CqJKGulBz16XU62fO6
         givw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784676930; x=1785281730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=EyMG7sh2sFFPkp5TutewaNrYNjbFr71W4ylOsbMovfnhLQPuRyGouZt+ar+n+g/Gpp
         7IDTbtu3goz2iEolA81p6wqeZlv8ARF8TLdo5jl3Dn1LIejc5vb86ZLWZ8zdZ320Pegs
         XHrRiNcqSDmuCLDXi1bT2+WWb1Qqhtpl/2n18cBfx+2PfujBI5FpmoUTn8PHdzWfSl4D
         BDCLvzs+157lTE59miRN4afz8mmSv1frLJS1glx2EfOwTuTIbhaxHBeBveK9w51M5eI4
         RyQw2UkemtJAQ9t9NfGXG+XjZdPiSHRX9fwx33+KiDXPfCVqfx8Pzqb7nDwPcGnCDjaK
         sU1A==
X-Forwarded-Encrypted: i=1; AHgh+RqAVzXLYWLHmHuVmjwkKjv9Wnp2fw4OelYPpI+9Ok2qgirck1HhsUqf97tGDp8+exvKnMX8lDspWLyYOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUxZRRQi8m+5urbsD4b3edW7m+bwbh86xnWUzD2usuCOuOFpYI
	OyikJ2FiGrcELa8FUTAv0T3J/gYGrNDHYBAszh2OiO+caqnQh3Ow6F1j
X-Gm-Gg: AR+sD13XGYGwfGQsz6x/Iyh2jZSJqdB0F0f7jvN+m31jY1kuW+HissQSslPo73g6R+7
	hcPA6nktS7KsbE0xi/14bVEbnt+gSRWMNR9k7485uolJ8YuEQtL1k3MC727W8qq3hQa2vA8v+xV
	TljHajBT11TYXmTkCRQXxBRr8jCp8+5/1nt12rjvB2aQtdrY4jfjNEw9IhZQqQK8/80rSVoNzjD
	1PlNAnd8m/OAxyPO0uIZSM/ynX/KNzzJrVGAqI+pP/HoqscmoEJC1efXXy7kNPzeMYy+3YLCan4
	nSU9Pva7x/H32OTDIwoiB8S7ArY4fUW0f5+hOmhGQwQGhopzS4l24lphy7Qplo0fCTSH9iAaLPK
	2KpYx7bTt6TyDofjxHi6IH75xzwr50JUHB9G1/oBretVCiiuLjLCe0GPGnFUbpKDvMWmgauX8o/
	V35D6vWSjATk6ui58ANkCfjJ+BX+iPvAuTtvkGD/JKNWLzxTU40ylY/wJNKp8abGwnSh3NVoaFO
	euZuSB4FSW5Ufi06YgyiuK+0Sh7z4XAFKC4ViaZ
X-Received: by 2002:a05:6a21:e0a6:b0:3bf:b84a:f3d8 with SMTP id adf61e73a8af0-3c42bd60404mr928427637.0.1784676930438;
        Tue, 21 Jul 2026 16:35:30 -0700 (PDT)
Received: from chenyou.R15NEW (112-104-169-66.adsl.dynamic.seed.net.tw. [112.104.169.66])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f0ebfcesm245353a12.11.2026.07.21.16.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 16:35:28 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: chen.wang@linux.dev,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 22 Jul 2026 07:34:44 +0800
Message-ID: <20260721233452.112204-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721233452.112204-1-chenyou910331@gmail.com>
References: <20260721233452.112204-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_163531_351524_4863EF91 
X-CRM114-Status: GOOD (  14.16  )
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

The Milk-V Duo 256M is a small form factor development board based on
the Sophgo SG2002 SoC.

This patch adds basic device tree support for the board, including:
- UART console
- SD/MMC controller
- USB host
- Onboard blue status LED (connected to PWR_GPIO[2] / porte 2)

Tested on actual Milk-V Duo 256M hardware, verified boot to shell and
heartbeat LED functionality.

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 121 ++++++++++++++++++
 2 files changed, 122 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..1ff69cf7f178 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -2,6 +2,7 @@
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
new file mode 100644
index 000000000000..21ef6ed9f0d2
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -0,0 +1,121 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2026 Chen-Yu Yeh <chenyou910331@gmail.com>
+ */
+
+/dts-v1/;
+
+#include "sg2002.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Milk-V Duo 256M";
+	compatible = "milkv,duo256m", "sophgo,sg2002";
+
+	aliases {
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
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&porte 2 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		coprocessor_rtos: region@83f40000 {
+			reg = <0x83f40000 0xc0000>;
+			no-map;
+		};
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
+				 <PINMUX(PIN_UART0_RX, 0)>;
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
+				 <PINMUX(PIN_SD0_D1, 0)>,
+				 <PINMUX(PIN_SD0_D2, 0)>,
+				 <PINMUX(PIN_SD0_D3, 0)>;
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
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
