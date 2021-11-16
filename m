Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30374C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:03:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E02AE6103B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 15:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E02AE6103B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gYWzRJnS0uYkRRiyo7RBBF8nMU5mq2AIhSV4AHgCUPE=; b=wOiVSOP5jM1BtQ
	y7L0nJfdpiLA2jSRnmJ84RAsQBXhHwTlcmk0yVGvCDCiDtLStG7C/ZycxTXrk6/fKAqsNY9LO9T1u
	coDwmrgyHI+dPNE24DCv7emuKNESvwh00I1tkJHKSnTOpoJTZr0y7KZN6Rxz9tkUH1hEQ8dUcRdyM
	v9o6171QOcqEafukc0RgwdZ8ANMYVKMH2rBXcx5u9GH7Id8jNuIYck9HFEk+RDN9lr6zYiN2A9UuV
	7uLhIT/p43YxhqyLvfBdpeGshUK/Dlag3SdnImborc1r0apxGTdYCuR2G7132hX2SP8x7wDc8o14m
	Px6Dh9Mg5LJWwiB1rWOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmzz4-0024LW-Tg; Tue, 16 Nov 2021 15:02:55 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmzyh-002430-VM
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 15:02:33 +0000
Received: by mail-ed1-x52c.google.com with SMTP id r11so25352096edd.9
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 07:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n3D3isQYQoZt8oK+QagFyG/F4ee/acgQw48favSVe0E=;
 b=iHtjl/nfmPQHpfqvVe7OLbfIuLYEAbPeHSJuoW8MqzMXzXOag9XBTIRgw6kZ1h0PQ2
 7vV/sAo6B0TUNocYJ5r8MQdhv5ZeMi6dcttI06A77+9Tdl3eudJis97cTMjuLIlISOPb
 VC11VpvkRo8eZZlAY20con9fibd6R6nxz5dzDB243tc6nkwEWXG4awvk+fiHoavDQfoB
 CULxGMBfTjUXQT+jj0fP/Xk5EaRFrRHjZKfJ0JgSfLRfyDsd1Igh/iq4ViSujhhR91jy
 HYSCoe8ipljVHJwjhRsg7KjgyRwCe61hv3SFzN+es8VXpXmSIsHEp4OQk5+cXjGtVFoo
 Mjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=n3D3isQYQoZt8oK+QagFyG/F4ee/acgQw48favSVe0E=;
 b=aW9Lzam8W0BiErB57Tk+U7bh4hLnkKgIL9PFkEbBmFQw133ZS0FZFOhQCdKnr+2HCk
 UAfNGWZUXz8dN9SMYUtku32HeXOOtfr2A+FYT4HZICtyAfOydSzHAe8gH1hqSC0/3IVt
 jbXRWUxAQZLtJ2gKiNrFNksnKWNtj79Yyzjj7A/WShc/DzX3BGLdIVY7QE2DzBqSql0M
 lnZCuHpB/pRV5JSQmranWmJzmriIqxdT9EW3zzmJm0+LYfv0Ag9gw6xx+hh31yAZhPbq
 HMVF76ftrJdrdkYzPndWfbF2kEgLHvRrvJ8KG/N9QuBROHjS7cSh/rRGZHPhHecbrkAl
 OL9Q==
X-Gm-Message-State: AOAM530l/gJTKe4SfwIvbnunp07+fkr4WZAmS9chIOg+3AXCglnQZNi4
 H7Gb3cZcTlZQSYla3SbOvHWg0pCuOY7HfA==
X-Google-Smtp-Source: ABdhPJzT/NUBHx0bHf0OxPsubbU8JaUF7vSGJZwT5jNIsSUak4miN+RnN3IM9rNPAph6p5SyUnHU5Q==
X-Received: by 2002:a17:907:97c3:: with SMTP id
 js3mr10922236ejc.240.1637074948242; 
 Tue, 16 Nov 2021 07:02:28 -0800 (PST)
Received: from stitch.. ([2a02:aa7:4600:b4ae:a375:e7a0:9eaf:8d7b])
 by smtp.gmail.com with ESMTPSA id u16sm9414311edr.43.2021.11.16.07.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 07:02:27 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-serial@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Drew Fustini <drew@beagleboard.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 Fu Wei <tekkamanninja@gmail.com>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/16] RISC-V: Add BeagleV Starlight Beta device tree
Date: Tue, 16 Nov 2021 16:01:19 +0100
Message-Id: <20211116150119.2171-17-kernel@esmil.dk>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211116150119.2171-1-kernel@esmil.dk>
References: <20211116150119.2171-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_070232_090980_6FC91CFA 
X-CRM114-Status: GOOD (  16.43  )
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

Add initial device tree for the BeagleV Starlight Beta board. About 300
of these boards were sent out as part of a now cancelled BeagleBoard.org
project.

I2C timing data is based on the device tree in the vendor u-boot port.
Heartbeat LED added by Geert.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
Co-developed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/starfive/Makefile         |   2 +
 .../dts/starfive/jh7100-beaglev-starlight.dts | 164 ++++++++++++++++++
 3 files changed, 167 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/Makefile
 create mode 100644 arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index fe996b88319e..ff174996cdfd 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += sifive
+subdir-y += starfive
 subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
 subdir-y += microchip
 
diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
new file mode 100644
index 000000000000..0ea1bc15ab30
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_STARFIVE) += jh7100-beaglev-starlight.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
new file mode 100644
index 000000000000..c9af67f7a0d2
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7100-beaglev-starlight.dts
@@ -0,0 +1,164 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2021 StarFive Technology Co., Ltd.
+ * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
+ */
+
+/dts-v1/;
+#include "jh7100.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/pinctrl-starfive.h>
+
+/ {
+	model = "BeagleV Starlight Beta";
+	compatible = "beagle,beaglev-starlight-jh7100-r0", "starfive,jh7100";
+
+	aliases {
+		serial0 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cpus {
+		timebase-frequency = <6250000>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x2 0x0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-ack {
+			gpios = <&gpio 43 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			linux,default-trigger = "heartbeat";
+			label = "ack";
+		};
+	};
+};
+
+&gpio {
+	i2c0_pins: i2c0-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(62, GPO_LOW,
+				  GPO_I2C0_PAD_SCK_OEN,
+				  GPI_I2C0_PAD_SCK_IN)>,
+				 <GPIOMUX(61, GPO_LOW,
+				  GPO_I2C0_PAD_SDA_OEN,
+				  GPI_I2C0_PAD_SDA_IN)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c1_pins: i2c1-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(47, GPO_LOW,
+				  GPO_I2C1_PAD_SCK_OEN,
+				  GPI_I2C1_PAD_SCK_IN)>,
+				 <GPIOMUX(48, GPO_LOW,
+				  GPO_I2C1_PAD_SDA_OEN,
+				  GPI_I2C1_PAD_SDA_IN)>;
+			bias-pull-up;
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	i2c2_pins: i2c2-0 {
+		i2c-pins {
+			pinmux = <GPIOMUX(60, GPO_LOW,
+				  GPO_I2C2_PAD_SCK_OEN,
+				  GPI_I2C2_PAD_SCK_IN)>,
+				 <GPIOMUX(59, GPO_LOW,
+				  GPO_I2C2_PAD_SDA_OEN,
+				  GPI_I2C2_PAD_SDA_IN)>;
+			bias-disable; /* external pull-up */
+			input-enable;
+			input-schmitt-enable;
+		};
+	};
+
+	uart3_pins: uart3-0 {
+		rx-pins {
+			pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
+				  GPI_UART3_PAD_SIN)>;
+			bias-pull-up;
+			drive-strength = <14>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+		tx-pins {
+			pinmux = <GPIOMUX(14, GPO_UART3_PAD_SOUT,
+				  GPO_ENABLE, GPI_NONE)>;
+			bias-disable;
+			drive-strength = <35>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <500>;
+	i2c-scl-falling-time-ns = <500>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	pmic@5e {
+		compatible = "ti,tps65086";
+		reg = <0x5e>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		regulators {
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <100>;
+	i2c-scl-falling-time-ns = <100>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	i2c-sda-hold-time-ns = <300>;
+	i2c-sda-falling-time-ns = <500>;
+	i2c-scl-falling-time-ns = <500>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c2_pins>;
+	status = "okay";
+};
+
+&osc_sys {
+	clock-frequency = <25000000>;
+};
+
+&osc_aud {
+	clock-frequency = <27000000>;
+};
+
+&uart3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart3_pins>;
+	status = "okay";
+};
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
