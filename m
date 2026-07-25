Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7CBC531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 17:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GQVAqRFhqMzjzhbv60NAtXVkMhE/jPZ04o8zC3W2zRs=; b=I3SMN5gXs1XlbJ
	qdA1TSweM566Cz9Oox43MECCFYFmDXfZy1rpo3IsyyjwlgGLDjomtFDoX5Te/itbOBJxs/ZMGKqog
	DMmaoNHnso1ZLfbAwhtEYPldz9Dv44wg9ou0LJ4SGtGGecSDGjeRvnI7UB4XADp6eyKPxt8CCd7tX
	QzkSgAA7MfmiMvyG/+NeAlV3mi80fNfmd+HHBiyyZOkAUlvkOgVpE8/iGA7paOm/YtIzG2/9HwmuH
	+g9Ahu4HxJi0a91nbCQIGQAVgmbZhPT5X6jy633lDNNtQ52aQIm4jhe62DnRFh/Ip1jWIcaBNPLS9
	tBN1SXewohuBg3veuygA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngZn-00000000cgR-47LD;
	Sat, 25 Jul 2026 17:54:19 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wngZm-00000000cfj-0SCO
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 17:54:19 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-84a3e5ca66eso140232b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jul 2026 10:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785002057; x=1785606857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvOKbp3xG4QlT34RdqQIXOPX+sCqsh5Q/jZI9nYCgFU=;
        b=WclwMJ+5YKARLzkvKk2zq1JRjGW04D7R2XkylxqEtoOsdy+HoKwFupG/6GU7xwYH7h
         366d+oTVjdPgPHvs6OcWbB1ZfsrmYKkt+IYth8MAONGQPcJZIYOEfSnjPYrLv7H5cm6X
         djMISmYL+l1aY3KDQp7IXDZKTmE9EwLBpuamE2AMjJ0RrblpJ1ddoNYD61MJ6JlASHj4
         TnQt2YBqd16x8I8A+VCKNwhBzWzbv5NN3TaGu7H9tZXI/GPE1RMlMaiyi/XFjnXaaljp
         e8+fN0qbmb0+vEY8M42F4/Hn5DeRbVPtvW8DAJht1YZ+Mi4kUkBuaYU8GofDokV/35Ne
         cH0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785002057; x=1785606857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hvOKbp3xG4QlT34RdqQIXOPX+sCqsh5Q/jZI9nYCgFU=;
        b=E0uXNYBZxpv6Qehlgp0EMj7YBrfeXrJlFF4oN6X2WY57YyXNjbRNcGcLenbovh0EKr
         uXKpabwF1t1SJlPBExGAGaOW0Z/2CZOmDOd731bX4Xu8l7/qX3bq+19xrl3p/vYJruzP
         5UmqjXQVx4emlJNW/dJuzlNSX9NQ18Gf40MoywA2JAXEG7EIrP5sIlLVH9Dk44uJaBOy
         oq4oqsN++zvtw9YZLP9bAAsOGkwoyOqWSKJjo6zRum61DxUnwSYPw5SlW/+19WP4651a
         L6DbQRKIYcTVmNn0BjZHRTot5VRbFSHkfiIkXBoACEHyRiseSelTMrSpMw6k0FlrhpX6
         GWLg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/sENjKmZdm2R2zuwq2eKofoQpdrihdBL3JepsMJ+cM926yfsP7Ek4fDJD0/cnVAwz/mX1BzYS/TqTaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtraTCCY8S/cIdwcH3KII9SMw7dBQ84mW9m1IESzGNCkq0BtPq
	8CjzpVkBLiLJMlHzPZdtIRn+Wlgbx0U30CPemIMwJ6tOchuTSfFPzQaY
X-Gm-Gg: AR+sD10y4cW/MVjaBSQXwavj1kc22Zt+zcP8oi2bveV9I28+GbKoTP6b5WwSzv8CK4p
	ZCtbYNVuABRw9jgqzsywMM3Vwwc9UHcYTTtW3PZFmlWhfAdzmgro5RlEficEa18CMuMC6J1cqP2
	rD4NKQyMQJXAioNBj5kCBr/2UAMi/jj9Be6Uh6hrx+2s4w9JS2seVDWqPd6SgZ9f5TETWWpRBxK
	C1mh0LGKV4uSATM5Gs/q6bHrk6W6IZdm6P6yHJ0TeEi7igbNmBIuwKwpPy1lG2GJK94mo7Z/TOR
	3gwnooLBmY1tjgTF+ydo+Tm0Dw6IveS1nKHWKHJhh46nzMwri/Uv/p2ZTkIUKuPBxjToG5wv5gv
	v/EZvWTaAvU2A3W1qnjVAawVtVKL/AFsjARAgIFrLg++UF+BjEeTDD6dDDIrZKd/+aaw7j9DTeK
	v8YmYvk8hI9Tf8pq06A/csm8n/SWZRUQu09cSa5xMjdie/g3G8XyzVpVzCeV+Y4wr1HMKVxLNia
	Jt7ekFCNA==
X-Received: by 2002:a17:90b:314e:b0:38e:480b:99a5 with SMTP id 98e67ed59e1d1-38f293c6d6emr2056503a91.2.1785002057132;
        Sat, 25 Jul 2026 10:54:17 -0700 (PDT)
Received: from chenyou.hitronhub.home ([2407:4d00:cc10:114a:3b0:934a:d409:94fe])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f031d1d6csm3005276a91.0.2026.07.25.10.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 10:54:15 -0700 (PDT)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v5 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Sun, 26 Jul 2026 01:53:45 +0800
Message-ID: <20260725175346.139173-4-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725175346.139173-1-chenyou910331@gmail.com>
References: <20260725175346.139173-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260725_105418_154056_9973F198 
X-CRM114-Status: GOOD (  13.78  )
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
index 000000000000..a2797c0bd767
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
+		coprocessor_rtos: region@8fe00000 {
+			reg = <0x8fe00000 0x200000>;
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
