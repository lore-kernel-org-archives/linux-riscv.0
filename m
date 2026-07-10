Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715CDC43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 08:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSg3e9T96qzSGP1rIZ8x3XArje0BmHlyPgNKpgVEcKE=; b=vZcZQgAdtmplOf
	O8qurROI/B/ZM/W7OfBdlVlfMuhRxcCNlCjrAXoaMFZfwIX/PXYJgLlAr3o33uflxGhuzwcNOQIsZ
	6QP9aGXU04QChm6fNs32N61wGbIMtH/qATfIOnSpq4zsTFtlGjCqbxNHFzmXo9ZfS16K7QaGl1Og+
	AIo0O5kbQR65Br/AjbONi4sKFA888+oi7XGr1FWtCPxoISxW3agYIhFE978ZnXd+93dpIamzwydtR
	wss1AnhYhv1yUpMyQyA/b80ptROMD+sMuECB0qErNt4PbMFGN+zERs3LLOP54t0qUMDFG1yLV3Jma
	yA9Z1KfzXxB6j+nisQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi69I-00000004Owx-2hmx;
	Fri, 10 Jul 2026 07:59:52 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi69G-00000004Ova-006Y
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 07:59:51 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3800f0907d5so143565a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 00:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783670389; x=1784275189; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=q/A+BBhbIQo0KRrI9xWT8dNGkIEEBMZ9vylZm9mP7UesuhoPeAMaMZaLw9BlG5sRJ/
         uwXTezNISvRYBGbBOTEPs7bjqxiD7xcZW2lNxjxSKeBYsQVhRwpqDx+hbAZOvDolMgQ4
         H5CI4jcCC9Gj6nq+UTYT81QWx32GypFdKrH+pUl7NR+BWPfNsqZ8UslvKMbzCCvAFn4B
         MqDthWoC2cAxEHSYKHtEldbwBdSWGZFkcNdPxLNmtljtAXAyMBZvSj2RCtMiRJT6zKvu
         E2TbiM29iMdgX8YAhO9id9tqDzZ4izwnA1vsvYtgK8wtW5H9yCdhEz+KrY3+9/f63GgK
         NjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783670389; x=1784275189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SJgBeOO3ejSAAenm/fnjt2f8BccFZ7Q+isSN8vs0qFY=;
        b=Z7gsEgqmEwuvm8YHUzmZrmkLMWkaj6UR3TjGM+vVp1u/ByolfYbaBGwzDYCZ/eamWi
         m2ir5znAAUQ3AHhZRqUnJIlxg7mTfZq4I4i2aNoIEf5nJo5xG0fNkyc3CTXrfmfurXuK
         mYcLRg4BcX8ips/hcW+Sz6Uoj1LCSjK8UxsHHL5ZEn86KcZZS1IqYbdG8rNmHAop5Out
         rmkk/o9SIVYyFbiZbLteqE+2RkPr47el9yQ1bnv0pAvwqvH7awWlm6bRI6LZtyHqrYHr
         UFQEfsqqo1MOHqSRY2iZsk0KmS9G7PgHBgu1OEf+mFOuLxxNKx/gU9KppCkuMuyeGzyv
         D3Vg==
X-Forwarded-Encrypted: i=1; AHgh+RrWxIhiV7cPS7sB03YWd/kSKYEOeVWl3UZsvWdHunIEiqE70otYSEzdcgsjZhsRO+387+3bCosKXjHmvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOvu2cbX/0yUsMCbnQOroDoLVZmtOudxSdZHZUyAl6JnvFOIWs
	OavnrnsfbRaLn4EXJ06j+WSuqkyjpk5Z5t8j3BwMttUaY4oMmVyE955g
X-Gm-Gg: AfdE7cnqa9FF8/yX96oZHEOFeEXZDkVBXRhrHIFxnV6C/v1/eLyDoCGuE0H53VMwWd9
	/d/aL1Bm+ndlpTpJIOyS+uuAWbD7ukMrnrxWeDTBXrwTXpc//p3fvj6F2F47Stgj4LmD3fZydDD
	2kfp9MlbfR/aZ7+Z8P13Ji0NwHLvL+HLV7hcuMweUSW5nEf9JGfG5IzunHxTqq3ZF1l+0opzNOd
	kGTZFL7e1KpbVpYNK3BV4TBRicOEv7VktCWUZcZYRLiEu1Eqj/JAIC7XUyC20rsxvkNA8dz0d12
	dTn5PvQC07N6zzZPNpH68kH7piIwl5OwoO+6gyrPPLicttgbbevESiMjfLf3zlZmz0AwSadLQoB
	Y0B6mFuYiJcQ4NVktz+ntbNcZLRmZLHzJerytTEleHw6b7iNLBnhN97N/cVrcwczE9/9v3zTCMF
	F5cZ6fq94J4gT/uTo=
X-Received: by 2002:a17:90a:d606:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-389421acc3cmr8740580a91.6.1783670388957;
        Fri, 10 Jul 2026 00:59:48 -0700 (PDT)
Received: from chenyou.. ([140.116.78.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31198cb2b99sm19044999eec.26.2026.07.10.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:59:48 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: Inochi Amaoto <inochiama@outlook.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v3 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Fri, 10 Jul 2026 15:59:17 +0800
Message-ID: <20260710075917.159969-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710075917.159969-1-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005950_049917_690CF56B 
X-CRM114-Status: GOOD (  14.08  )
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
