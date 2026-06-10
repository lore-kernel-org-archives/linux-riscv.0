Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDEBCD8CB9
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 11:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wG4VYs8blIPyGTyL+edwhqJ9L5SCUkuFQSSdsfmFAOY=; b=N59JvITttwC525
	xsS2FrP91XOQX8b3yuKcLlW52G43QY9QAgIF7KmWQzkApwNj2a25hfV6VdDClyqaaRL4eigU/fPew
	+JwyWXX7CVhwImfW2DBrVfVv5YdCjWKXl5f91WsB/AuK9HHgN6Qyk0lrQ2otR8yHfeiri9k5WR+Es
	fXwPrXrg+JLnQ8Uc0pOePapZw0DwbMmbsJO4v68EyeYYSIPGIrh33S18oJDtzuZ4+UI4gvzSQe4jy
	9cW5IeltiAQqpFWylHDzOZEvi1hkNntj9rmWz1S5jrmqoeYfzCNNFoiqyUACrs9Yb6xHYKshb+k6n
	jw4XsDWK99729ufiR0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGqz-00000007V3T-17x6;
	Wed, 10 Jun 2026 11:12:13 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXGqx-00000007V35-0BAS
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jun 2026 11:12:12 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bf20ddcaeeso5581875ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jun 2026 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781089930; x=1781694730; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ax95pId9QMw1FjsoGhe01/2Zutu0csI1tByOFuVoTk0=;
        b=jtMpBZCEl8odja8jnohl8vCiJC1wki0W/0E3tWerqBHTiCqAYKRyzrJ2aOIVwovY18
         lHml/s1U7G4F4ibd8vFaYU20lw9QibC2MMS13D4++BSpcdrwMj3Tq6KoE9l90xKGWQdE
         aHAqYks4zb9ywEydlhBcN9Xb+1GyY4oVNIODegKBVAmpIGr8tspqyJqbSoLgkmxCKndF
         tr4Qa28C1tJythzEEJvvyB/hFP+ErjwSYGGA1nqvGu9l6sDLftr0bt05UB91neVX+ahk
         /Tq5q8WDXGAkDuGrEb7SaAGzPyjCFK0E2Q+ZGttC7MLfVWe5ntYHqOIFsGpI+68GQkUb
         cLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781089930; x=1781694730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ax95pId9QMw1FjsoGhe01/2Zutu0csI1tByOFuVoTk0=;
        b=gWyWF+EGegEVkwIYEwJaKnRNAZ/PF/6WapuHS26LwmkpSz7zVGdSbtKY2oz6/tknp8
         oqcEGO31wyut4qlughid2u0bzpBnOEvr8SwWWr39G7y0lQlNVuaK5p0Dj3Ic8WH9hlYZ
         pEsz4djI1x7pO5JA2W8dOYihtahCSsFL2CddusTN046Zk2MBS9WH8Mh/H0cjfgnsZ2yC
         57R+e2HG3sfhKAPvm3j8GuIFd3oV+vFX0jsh5sOf304cCoQnZATicH3aDpF5T8cD4XS1
         6++n7/3cLarayuJLTie/YDOb+IYRLr6BNJQmN33IutRLTnmt/Rn8WTxYmjuojv/O0Bc1
         pGTw==
X-Forwarded-Encrypted: i=1; AFNElJ8WzmwLf7Wn/z5jF6tyq7BRu5pYWdoZ7QEhbxRlyV1nOW6ZpG6M7J5/yDqXLXm0sHnaLkoVdR8+E0oWDg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyqToQ+KZRgfwDZMoaW2jlqJS5zC36eQWWgGfAG2d2hV1oqZI3y
	R3bQAYEvfdaOEI42Luo2Px1lx3YJzmJN2sBBKeWqS/KVoB988J6TpnpQ
X-Gm-Gg: Acq92OEL6UKZ0j42H/86Txh7/c8gga0KfrKMNa58Qn9ywhtkSvkObYUxwor8xZQBYHZ
	KfXXa6OYLH2/UUpmWt/lQrOFcEbwhz7WbBNvnwknVCg+6PnT8jAjenbMV2zZQysiK0yHMBjikBK
	TzajjNd2pUeqagCU1ptuBbbYNXPTeyCRnPj6QixPO07OFpt+UyfeshOwUMf3/xpCdH1aEf1+AMj
	VB2Di/vDs7NztAlPDLKS230shG9SVu/hzFDTKB5jmRnqDlW5k+WWGr7/QsbLpG5q2LKPVlSQrHb
	MU5SBzbkUzQukkSZC9Y81Rqhfj+0tRR/ofBvjennR4WS1bW63fWFYlf9KajB3NKArUG3UkGNAFS
	O0ZeblVJ4M65h6Viwk1CAL8Iqy7U/JZtz6uyhpoLBy9j8Tui/T0WUGQmv0Tw6BCS3Nb0ccE0hGb
	+WSCv7w7nFYXrlX4eUYS/BS25hAHGeopz1yRQAsVAqBOTkPRs=
X-Received: by 2002:a17:903:46cf:b0:2c1:13cf:19a0 with SMTP id d9443c01a7336-2c1e8332ademr127346645ad.3.1781089929478;
        Wed, 10 Jun 2026 04:12:09 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16609e234sm251328535ad.53.2026.06.10.04.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 04:12:08 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: unicorn_wang@outlook.com,
	inochiama@gmail.com
Cc: Chen-Yu Yeh <chenyou910331@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 10 Jun 2026 19:11:21 +0800
Message-ID: <20260610111136.1514155-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610111136.1514155-1-chenyou910331@gmail.com>
References: <20260610111136.1514155-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_041211_110661_FA26F0DA 
X-CRM114-Status: GOOD (  13.68  )
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
 arch/riscv/boot/dts/sophgo/Makefile           |   2 +
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 119 ++++++++++++++++++
 2 files changed, 121 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..e49c8233ae1f 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -2,7 +2,9 @@
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
+
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
new file mode 100644
index 000000000000..882fba441396
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ */
+
+/dts-v1/;
+
+#include "sg2002.dtsi"
+#include <dt-bindings/gpio/gpio.h>
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
+		led-blue {
+			label = "milkv:blue:status";
+			gpios = <&porte 2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
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
