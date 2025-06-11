Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDEAC71134
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3eZpkx4hyrJYnWZnca6/j8B6ZrHANOy9wl3H4y4izw8=; b=gc5ISwYWC8gXi+
	WEDzEwHZfYs4Gt9B51tnDrfZEDYF6j2XXtueTzEeIolhW8bOi4Jn9yTSaiY0LZqYPZmN4/m4+WaYu
	k83Biy7kCmA1sEaOzdS8qMK9jRAbZbU6xJQd1Q4yE9nGwY0WtgA492G+nsSad2ACckoRO8Zi7SBC+
	5f2dEYP6wNU1hyZkMzLHLzOYRL3eDYq/4mFEAlIZYGsqGhlioSETUdZKNwzSeB3mB1xJQ9qVWmn0P
	WmQkTQklGG9Nwdriowf/hyRO5cPWyrCuS/++HIw458R6fxZ5QoN5dc0XvfcUlfc6fR4BKqStxsDBN
	FKwzV9z0+TqDGz53BV6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGf2-00000009Emc-0IT5;
	Wed, 11 Jun 2025 08:18:16 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPGIE-00000009APD-2W6X
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 07:54:43 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7cad6a4fae4so1016494685a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 00:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749628481; x=1750233281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UymgIkDUFmAW2hJ2k6aLRjbZp7eBofh8hO/e/40bbVU=;
        b=dfdkC0LjcbWGl4oaX4I0LdHWyoI16XDq6lsrsPe34+1Bjb1+Tu0TossOD3dA/HFDm8
         V4VQuUToIROZVQCYWy7adQ3O5WjWnPn0zEpVbjesiBmjdCC8HOKiENAmA332PL+ZAaGD
         3kXPP9WpBirxcL+aQFzgscvoDqc7coDCs26CplfffI+pQmqvtEcSvDsyBxdBloO6G1h9
         I7JtinLhd5wsYcMsahbYc+oMW6gZHZOKOGQfhynHXX5Bul3VwcEZFS5BS2yc5n7Bk5sw
         3JO16n/lI4WHRu6mc3FWdBOap+MPFpdIFk3kC1QMkGxV40VbroC5MCzLqlAAebSgrWBn
         R4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628481; x=1750233281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UymgIkDUFmAW2hJ2k6aLRjbZp7eBofh8hO/e/40bbVU=;
        b=ElvdDmgRgogbxJIBrc20/wRI5Gy2sq5AfFgK7txTOfpNtX4MHnBDsh4s6sQCHWLCET
         kDLWCy+4MNXIOopXMd4HAv4mpc0Unviy45nrqo4Soa43wI3YxFJKUwxEiAgJ1mTsOQdG
         K8KmnuLnNqnkfNnSjhU8hf/qgvOgtGxCO/b7qgVa4R49s6Flk0gzP/WouvK2kAH3CFXu
         L8I5+6QfVpdpVNS8T1bgdbTLheaZQqNPtgIipp5uxOo3mHTADmV9QBdt2/WHReGQ2OmZ
         pD3TyDVO1LT5tovAsMuZI1OnTUitMblJ5pxjuJNbSG757DdKYLkQT+TD/6AwH1x/xq2v
         U2Vw==
X-Forwarded-Encrypted: i=1; AJvYcCXxYJT5vi+qu8ugtoJ2a6QNwDNz97YW7FmeaJEZWis4k0jbWdjULWSW3rkUows7GgavLsBYpNzfnn9TZg==@lists.infradead.org
X-Gm-Message-State: AOJu0YycJ/OouXhg+GWYA4jk/YILopgRSvkdIA/BfdUaciumzOpD5vkH
	0T4bH4eoRSuJ1nqhl+Rj1iKXRX2H2tFcRsfxNgeDIqVzsEd2zRQb5JWZ
X-Gm-Gg: ASbGncsX0PPU7EXA+/rMYK9ytI3/ZGWnrjphiPPXzlJFi/Ozh9FHQvYK8RMaTa6zQb/
	VvtJYFAls7zBsmc5g+8pTbHwB0nilMrcTsuXS4/gJSgnQEFflujKfwXBL2taCqkjP9yxA0PkBu9
	GOMxrlqNXiIgx7IZeYFRAg2arihw2qYVwMOz+gg1sw6JhoINYob4GfkJPxVW7x8OwSNvthcAYaq
	RQFislJ6RMq0dp9v98OUHWaJ4tYxQ2fzalkD8VLFPx/4Ln8JvxQoaoUJzFWu5oihboEB055MA6p
	LU2y1Wq868hlBExh021Tci54R3k0J+z3uhdJ2Q==
X-Google-Smtp-Source: AGHT+IFcYfRlGLgXB5F75tcWrqlrnxZDfFg6hV8DyibBKxLYVxu4hGJ8Kf67guFwXWUTsXHBzsnNvg==
X-Received: by 2002:a05:620a:29c1:b0:7c5:562d:ccf4 with SMTP id af79cd13be357-7d3a955398amr275831685a.4.1749628481494;
        Wed, 11 Jun 2025 00:54:41 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d250d7c2b8sm832873585a.16.2025.06.11.00.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:54:41 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dmaengine@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 3/4] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
Date: Wed, 11 Jun 2025 15:53:17 +0800
Message-ID: <20250611075321.1160973-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611075321.1160973-1-inochiama@gmail.com>
References: <20250611075321.1160973-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_005442_636075_50F7EEEC 
X-CRM114-Status: GOOD (  12.48  )
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

Add reset generator node for all CV18XX series SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi    |  7 ++
 arch/riscv/boot/dts/sophgo/cv18xx-reset.h | 98 +++++++++++++++++++++++
 2 files changed, 105 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-reset.h

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ed06c3609fb2..4c3d16764131 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/sophgo,cv1800.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include "cv18xx-reset.h"
 
 / {
 	#address-cells = <1>;
@@ -24,6 +25,12 @@ soc {
 		#size-cells = <1>;
 		ranges;
 
+		rst: reset-controller@3003000 {
+			compatible = "sophgo,cv1800b-reset";
+			reg = <0x3003000 0x1000>;
+			#reset-cells = <1>;
+		};
+
 		gpio0: gpio@3020000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0x3020000 0x1000>;
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-reset.h b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
new file mode 100644
index 000000000000..7e7c5ca2dbbd
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv18xx-reset.h
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
+/*
+ * Copyright (C) 2025 Inochi Amaoto <inochiama@outlook.com>
+ */
+
+#ifndef _SOPHGO_CV18XX_RESET
+#define _SOPHGO_CV18XX_RESET
+
+#define RST_DDR				2
+#define RST_H264C			3
+#define RST_JPEG			4
+#define RST_H265C			5
+#define RST_VIPSYS			6
+#define RST_TDMA			7
+#define RST_TPU				8
+#define RST_TPUSYS			9
+#define RST_USB				11
+#define RST_ETH0			12
+#define RST_ETH1			13
+#define RST_NAND			14
+#define RST_EMMC			15
+#define RST_SD0				16
+#define RST_SDMA			18
+#define RST_I2S0			19
+#define RST_I2S1			20
+#define RST_I2S2			21
+#define RST_I2S3			22
+#define RST_UART0			23
+#define RST_UART1			24
+#define RST_UART2			25
+#define RST_UART3			26
+#define RST_I2C0			27
+#define RST_I2C1			28
+#define RST_I2C2			29
+#define RST_I2C3			30
+#define RST_I2C4			31
+#define RST_PWM0			32
+#define RST_PWM1			33
+#define RST_PWM2			34
+#define RST_PWM3			35
+#define RST_SPI0			40
+#define RST_SPI1			41
+#define RST_SPI2			42
+#define RST_SPI3			43
+#define RST_GPIO0			44
+#define RST_GPIO1			45
+#define RST_GPIO2			46
+#define RST_EFUSE			47
+#define RST_WDT				48
+#define RST_AHB_ROM			49
+#define RST_SPIC			50
+#define RST_TEMPSEN			51
+#define RST_SARADC			52
+#define RST_COMBO_PHY0			58
+#define RST_SPI_NAND			61
+#define RST_SE				62
+#define RST_UART4			74
+#define RST_GPIO3			75
+#define RST_SYSTEM			76
+#define RST_TIMER			77
+#define RST_TIMER0			78
+#define RST_TIMER1			79
+#define RST_TIMER2			80
+#define RST_TIMER3			81
+#define RST_TIMER4			82
+#define RST_TIMER5			83
+#define RST_TIMER6			84
+#define RST_TIMER7			85
+#define RST_WGN0			86
+#define RST_WGN1			87
+#define RST_WGN2			88
+#define RST_KEYSCAN			89
+#define RST_AUDDAC			91
+#define RST_AUDDAC_APB			92
+#define RST_AUDADC			93
+#define RST_VCSYS			95
+#define RST_ETHPHY			96
+#define RST_ETHPHY_APB			97
+#define RST_AUDSRC			98
+#define RST_VIP_CAM0			99
+#define RST_WDT1			100
+#define RST_WDT2			101
+#define RST_AUTOCLEAR_CPUCORE0		256
+#define RST_AUTOCLEAR_CPUCORE1		257
+#define RST_AUTOCLEAR_CPUCORE2		258
+#define RST_AUTOCLEAR_CPUCORE3		259
+#define RST_AUTOCLEAR_CPUSYS0		260
+#define RST_AUTOCLEAR_CPUSYS1		261
+#define RST_AUTOCLEAR_CPUSYS2		262
+#define RST_CPUCORE0			288
+#define RST_CPUCORE1			289
+#define RST_CPUCORE2			290
+#define RST_CPUCORE3			291
+#define RST_CPUSYS0			292
+#define RST_CPUSYS1			293
+#define RST_CPUSYS2			294
+
+#endif /* _SOPHGO_CV18XX_RESET */
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
