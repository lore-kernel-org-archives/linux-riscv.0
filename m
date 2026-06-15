Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43C8CD98C7
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7qaZ/PfiV1YAAw+kRFqBtYv3BH5UZw2uvalZUy4a1c=; b=VNthlIjI/UzWr4
	vdnNhLF9P8XSkNsjlgonvb1MrrvHGd3pbX2qfpXGxPLJQMwIxrWmr1JYZ5qcCRyprVQMEBAh37XHL
	+wO6U17Ovr0sUk7RFsM3/nxwzxMUU3TJTe0Gux/aWwa2FVeN2v8U9K/V/yiPpjqo8WH0vsKATCfpu
	pCZInJfuGhzsGDRwc3D0t1tcYLN4HhdyCIt3hXAAtWhKLgpNqlboMXon8Tw0UmGrYOQBGcCRqSzLV
	BstyMgcZmXSqyjYOuzG/JAQ6lrB795olCRwvwj0fRYEerM1QsCRulilQa15t9/YKTgYiNmiAO1+pO
	/fWW7/aGRaJSx2dvVgog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ639-0000000E8jY-3ofO;
	Mon, 15 Jun 2026 12:04:19 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ636-0000000E8hw-49Mv
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 12:04:18 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-517863a2edfso26076341cf.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 05:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525056; x=1782129856; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VaaLk3EgsloTd17mTIl3bCyAeJenYIahR3avArgMblQ=;
        b=LnjpruExxKVcbVBrzp8+70RL1VRS/C83ChOsoXZ7MTbYxkv4P8DDQbnfpIEj2801F+
         DtJlltSzyc5kERYgHYj0eGrKtD/XjT5bnu/FzkrKmcdCQ+7NubdLgSNc91553CyVOI8O
         yzmWXI5ihPri0tNsTecbghd0Y4U+1JP0USEnf2QfYk/ONStGDfbT/LmwCw5CuarX5Zg6
         fkuxqkoZ+VThPZYGykOs7250J/f1UKtB+ELPbSfLOat6VVkKXdglMlRME9eiPtlGoZto
         Tp1O2u9Xl/VT4W76MTJL9w46pWr2Dex3Ei98Pq8+7boDs7B27LlJD1bwDW00UfKLx7zA
         TAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525056; x=1782129856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VaaLk3EgsloTd17mTIl3bCyAeJenYIahR3avArgMblQ=;
        b=MvVrIkmQBrHY01aEXUuerT6hR3suCEGaUokWEHbadi+jRk5nj4gLCQBN9BYJ1gY652
         Y2qsbX2DVny83GlYkOXFyapQXfKGqbGrSAcM9gAuUeFPy5EZP1EQsQuKVZ/zs1fqmnqF
         7A7Kk1LaV25P5vIszmtT1ywjb2+cfFmy+Knyt6UqBpUQJ9qOaEHMxoaq9MHyfr8WAUa+
         ue6E3pUNVUq7qxaxufM4DA19LAmcsMek0mwv563g2e8mBXgjGmJLQjRow6mmQJWP/dUu
         USKOTEXFwqp+jpfJzGtI8DdRqlLDbuFzzc7fV1lPUl4+6ZqtH/s/mmlup9GINkLxaOU8
         k0Zw==
X-Forwarded-Encrypted: i=1; AFNElJ8Ly+jeBkbnqu+DEaerhVZoYjm6kPJ/a6tZY9EQ/jPvyV5ZjuuQVmnEMFyMP3no59Zf6VqAYCp/mYzQ3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCOVVJQrl/geWazOHsM6iJ1tZ/nbNpmCAK2JkynxM+KyYK/LJi
	MELK1MwBIxD5TotEZYXC+3vTmkHKAyIfHsMaPkGa7qzNNLRWgunbks/C
X-Gm-Gg: Acq92OFnfP3KB6WYwYalNEKJwyhxLi2tlUR5sTR0bphj2ty3kitMX/wFs3YwXNyaRpb
	uEZEvgKhT8Hm5v+sxwxcaNwbXrRdl7TZmQMdsTu/bn6PobcIW6W6e1WYjEUDdZOkoyMT+d0cfBe
	abinR8wkwhgKuMBZ+N8Giq/k5PFSzjlHBXziHEtU4EfUZBPmcTOoXOL2XpjLLPGWl5k95yCdW/N
	VhC9kowCYJYscXVYpxIV4mky1Dp3zNWpPdI4kBe869yFwHo2oV62BmKl3AIU7D8FQDrWkR/ciev
	k080J8CelkSDLmYdUITsWJDlekYrsFUtYJjqE5a2NjCnwfJhiKpFv5wMWrEZXmUTZIe3x0dqa4R
	cewl6VDB+Fa94G3wgxYyrAY44n0pC2ghiAqancdZY7+qNmqxlNHR89nCjz6pQ+bKjzzTySH6rRq
	X15qnKo7mc9cU4+9pnvkVnw2RaQtQdGyyIiD27nXqTXSI4FFJT3qMRATul
X-Received: by 2002:a05:622a:229f:b0:517:8242:5bc1 with SMTP id d75a77b69052e-517fe200008mr205748761cf.15.1781525055524;
        Mon, 15 Jun 2026 05:04:15 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.04.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:04:15 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v6 3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Mon, 15 Jun 2026 08:03:24 -0400
Message-ID: <20260615120324.1527881-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615120324.1527881-1-josh.milas@gmail.com>
References: <20260615120324.1527881-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_050417_049412_1C2EFB93 
X-CRM114-Status: GOOD (  13.03  )
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

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 2 files changed, 246 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..58cc6b70d8de 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
new file mode 100644
index 000000000000..f56bfddeacc4
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
@@ -0,0 +1,245 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
+#include "sg2000.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,sg2000";
+
+	aliases {
+		i2c4 = &i2c4;
+		mmc0 = &sdhci0;
+		mmc1 = &emmc;
+		mmc2 = &sdhci1;
+		serial0 = &uart0;
+		serial4 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&porta 15 GPIO_ACTIVE_LOW>;
+		power-off-delay-us = <50000>;
+		post-power-on-delay-ms = <200>;
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&pinctrl {
+	emmc_cfg: emmc-cfg {
+		emmc-rstn-pins {
+			pinmux = <PINMUX(PIN_EMMC_RSTN, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		emmc-clk-pins {
+			pinmux = <PINMUX(PIN_EMMC_CLK, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		emmc-cmd-pins {
+			pinmux = <PINMUX(PIN_EMMC_CMD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		emmc-data-pins {
+			pinmux = <PINMUX(PIN_EMMC_DAT0, 0)>,
+				 <PINMUX(PIN_EMMC_DAT1, 0)>,
+				 <PINMUX(PIN_EMMC_DAT2, 0)>,
+				 <PINMUX(PIN_EMMC_DAT3, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+	};
+
+	i2c4_cfg: i2c4-cfg {
+		i2c4-pins {
+			pinmux = <PINMUX(PIN_VIVO_D1, 7)>,
+				 <PINMUX(PIN_VIVO_D0, 7)>;
+			bias-pull-up;
+			drive-strength-microamp = <4000>;
+			power-source = <1800>;
+		};
+	};
+
+	sdhci0_cfg: sdhci0-cfg {
+		sdhci0-cd-pins {
+			pinmux = <PINMUX(PIN_SD0_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
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
+	};
+
+	sdhci1_cfg: sdhci1-cfg {
+		sdhci1-clk-pins {
+			pinmux = <PINMUX(PIN_MIPI_TXM4, 1)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		sdhci1-cmd-pins {
+			pinmux = <PINMUX(PIN_MIPI_TXP4, 1)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+
+		sdhci1-data-pins {
+			pinmux = <PINMUX(PIN_MIPI_TXM3, 1)>,
+				 <PINMUX(PIN_MIPI_TXP3, 1)>,
+				 <PINMUX(PIN_MIPI_TXM2, 7)>,
+				 <PINMUX(PIN_MIPI_TXP2, 7)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <1800>;
+		};
+	};
+
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
+	uart4_cfg: uart4-cfg {
+		uart4-data-pins {
+			pinmux = <PINMUX(PIN_UART2_TX, 5)>,
+				 <PINMUX(PIN_UART2_RX, 5)>;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+
+		uart4-control-pins {
+			pinmux = <PINMUX(PIN_UART2_CTS, 5)>,
+				 <PINMUX(PIN_UART2_RTS, 5)>;
+			bias-pull-up;
+			drive-strength-microamp = <10800>;
+			power-source = <3300>;
+		};
+	};
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c4 {
+	pinctrl-0 = <&i2c4_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	disable-wp;
+	no-1-8-v;
+	pinctrl-0 = <&sdhci0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	cap-sd-highspeed;
+	keep-power-in-suspend;
+	no-mmc;
+	no-sd;
+	non-removable;
+	max-frequency = <150000000>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	pinctrl-0 = <&sdhci1_cfg>;
+	pinctrl-names = "default";
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart4 {
+	pinctrl-0 = <&uart4_cfg>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+};
+
+&usb {
+	dr_mode = "host";
+	status = "okay";
+};
+
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
