Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E94CD8CB2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jun 2026 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ewmnr9CONa1CM3bR6mgcBSSsYh5jpLhrWKSrhwvUvhQ=; b=s3Nz0gmfMJNTGp
	Hle0R+FrvyDn+ROIBAe0Zo9yfaPRlBeaLMqqyvCH/9Iodcs1gIKyECCJ++M6/inMoZhzj/P9f1Ea3
	uJshnOpndnOUId7DFgsCHeaPqKUeilNH7MM67PRTBAlzGVZ/U2gxYmtJ/llscPz+UIE5BO88zUqyA
	VjtDGV2ERSWkzSjne0OeYUr+yNXMagPP23MDeGsjBwTzezII+QxTWkNzAbSWkexuJsVTWtpf/NwNX
	hFsQrsdXc74vWgvqOIoPzPz0v8JMExFkvcGVgWfwK6x5du++smJXJR0MhJWQhtqWb7MQg0J2Qm5aB
	0JswKyi4plZXwi6wuY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHm8-00000007cWf-1qqw;
	Wed, 10 Jun 2026 12:11:16 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHm4-00000007cVc-0JRe
	for linux-riscv@lists.infradead.org;
	Wed, 10 Jun 2026 12:11:16 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2bf258aba12so12483505ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 10 Jun 2026 05:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781093471; x=1781698271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gwId8hSTsYhCm9cW+cozWhD85/5ipdH4k4BKIr8DdEc=;
        b=m39sY1auCS2CMFC5XS9FWZXx9ehqZnKsVLZ/vbvBS+pYt7qxE1gd1VhFhHo8LbXmmD
         65b+20u+BCCtcaNMz8XLV0BkxK7e50Sz2Xbey699SpoUTOuN4n5coFCd2XIi0ktpB3HT
         xDqGITMOlaKUpZbcgeJrwJ2xY7qKpl4fbx1y0VURGcc4MkN61kf/lyBJ0XXCpE150GOr
         zQ5pPlsZ3bJRGMsUflpXUpO4G2o2BYQGF/F00UUcCTAo26cOaATsC3gsrMYX0TjbQXJD
         g+1/+ReyzV1dIij5n1iX1Ttl/NU2VNF9POE7bIffBl80PUWug8nG11/SW1eSz/ZIi9AA
         fh1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781093471; x=1781698271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gwId8hSTsYhCm9cW+cozWhD85/5ipdH4k4BKIr8DdEc=;
        b=tBmX7kLz6HYbdDwCSMXvkUH8RZ5/27NG8GIrTsQ1B4EtmoiNx6aj2UMUBs34O5kVWr
         1t7mUPZ0lOMuHKYKgT1qPuNHE1SguTdUC0qXjUAIk1VoZaoCuvdPkRG3D2ePNxSzSxMA
         TR9Y1DTJZvEm/m+IQLZmOo2j6P8p97v/JpkS43ghP+izMqo/rXMF13FT3bQgTRSFbF8E
         6G8eTgQxAbWSKPXtnxM0MjGBoDlMZQv1xrdZjxDykQB+V0NA+AmbTo8n+ap9Gqzb5J40
         xUATfOrSh2sZAmKngCOar9+XuAmuPQA2v5YeGM8dwrdnebLUXmi6DH5YSY09YyI8xIQv
         MyAA==
X-Forwarded-Encrypted: i=1; AFNElJ/5ct26LhAvOiNfaOGzSC7wxIYd4n0afH9CFLlWvT7ziZjwSdmeNl3Bwzo1txS52Ivw6lanljH7HVJXyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGCaHktgEfDq9YZ5nnHr54zKYJfy4fFXDAFkKA6tiGHdrejdLk
	zuSGJJ4V/3W+Od6x1OdN8urY0hhWBUBWsNFkiD5fqbwHZoMyGLaGyUKD
X-Gm-Gg: Acq92OEUgMxMh9txpjkQnnJeWCpqO/T54sega8uibmiVvTnsdsXs3GB7CirwmJjqLY7
	tsviItb+8CA0lc+hC6qGI8p+sR0A6xujdsEzcvO4Jm9Msm1A5HXXzjbHqnmm2uoA9ucfRIELsAn
	7F5GQI16bCCG1SS2JhsD+BsAvm9IqqNcN808Sw4wbHjld0S13uJdi+4zrfRpBJ2BPREKrAKreCS
	kgfcFPShF7Wsir+/ipc8+drDeeAYTGxjsPFiZGyMulrwuZedG+9IPQNYro+cmYLeeFIKbZN73VQ
	kW7RPvs23ZMgRUcjj1xfu4P4G/P8Q9OSD23ryaWw30hWSMO50rVYATKo2B7uSuGfgP99VazmIAA
	kI+Z2zSjsHrW+C/kT03rJMz+1+hgrBQ6/dOL61OgAchaKl3OkJSiMVjhI3i9wkUSJbON6eWPSUV
	2Ad5LSw8OxSFuKciQPiEmjl7hTgxcIMBlzEcg3
X-Received: by 2002:a17:902:da8c:b0:2ba:1e94:d03b with SMTP id d9443c01a7336-2c2a1948011mr39804155ad.6.1781093471133;
        Wed, 10 Jun 2026 05:11:11 -0700 (PDT)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm245738445ad.26.2026.06.10.05.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 05:11:10 -0700 (PDT)
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
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 2/2] riscv: dts: sophgo: Add Milk-V Duo 256M board support
Date: Wed, 10 Jun 2026 20:10:10 +0800
Message-ID: <20260610121026.1517621-2-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610121026.1517621-1-chenyou910331@gmail.com>
References: <20260610121026.1517621-1-chenyou910331@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_051112_117512_A7F6D665 
X-CRM114-Status: GOOD (  15.84  )
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
Changes since v1:
- Removed the leds node because &porte is not yet supported in cv180x.dtsi,
  which would cause a dtc compilation error.
- Retained the &usb node because it is already defined in cv180x.dtsi.
- Cleaned up the trailing blank line in the Makefile.

 arch/riscv/boot/dts/sophgo/Makefile           |   3 +-
 .../boot/dts/sophgo/sg2002-milkv-duo256m.dts  | 108 ++++++++++++++++++
 2 files changed, 110 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..f9415c30a2c5 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -2,7 +2,8 @@
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-milkv-duo256m.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
-dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
\ No newline at end of file
diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
new file mode 100644
index 000000000000..4cf441ab3790
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
@@ -0,0 +1,108 @@
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
