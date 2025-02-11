Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA865C021A5
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Feb 2025 05:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFiv9hteN9w65jXZKZqfbulaUGVvmxflkqpfVPXLlR8=; b=oPsogSqxPHo+Rr
	+xzo7oGp18eF5O9vjzC3wndnxQPxKgB0RMjvGSgbEPBdkCgWeEJgrhPOEiPC0a3St6uXiex5iPXpD
	upl3nIILruJYU94zdL2I8lD+Nj/mWrFY8R1Vf0lRnJLvmANYJygfgLaxMXIS2/peEirS+SUl+x817
	wh1y8OvAsNbgAyM6EuQRn9G/9PqexCz6l4eSNIEj/QXL+ER4gR5JuUePqgbl41PtK25MEOGqJlzX4
	PcyfHHS6u5J2NNtPRzN4/EkOCX83kkIvzbOcn4OAnKZN/f69EHBtn3I+HuMT5sgTRsRQ6NuOsAwhO
	bqxy0Pq9f3o9nvzPgl9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thifX-00000002Zll-2QSv;
	Tue, 11 Feb 2025 05:18:47 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thifV-00000002Zj4-0NrG
	for linux-riscv@lists.infradead.org;
	Tue, 11 Feb 2025 05:18:46 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-7be3d681e74so473749885a.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Feb 2025 21:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739251124; x=1739855924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U9a/XI8nUmJ0m3ojAWn0RJ8VqdbALaTRgX2keukdkZc=;
        b=TPrE7OLL7VMq45BLeaIfSO31cB/nAuTnwVoPB1RPGHq5XhH1QbIWpN//AnY/QhGwqV
         7Q6Lhl5HCBihY0JNtvaRjtgnklhuwIEKyyIbtSKDSachDATo7AGIJIJtsqsz7TraSNRe
         VS0dU1XrHpTTVKBz4+U3KKLAPiO9giDjUddjD9YYX/0w3uLLK0BfekB5Ezi4i6I+Vr4O
         5NxOM0REpYolOMbhcKs2OdaY4gr0etXIqyw2OkLtAYiE8rJ2SkazHGp3WJW5/uyhEZC4
         OcehWsMYKIKf870XzYHUhYwBtDgRo806GQvB0isPXrHbjTJArLuWd5+FTY03Cw98ZlNx
         0MOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739251124; x=1739855924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9a/XI8nUmJ0m3ojAWn0RJ8VqdbALaTRgX2keukdkZc=;
        b=K9VALgx0h8qzsoVXoLelmZ5b+1BJjCWtkQ4UbvZw3U+6UMEE1j2JHfhYj9sQTrENSg
         I7viYNJRMzpvqfjNF0mg2hPdqrTZnfrRku5v4tizE3B66wIA/ARWxY2uPeFarHQhglGz
         S9ipbOBxDUOxYQ+V65glib8M8LT3QxZdtbKYYl/PFVNrFeY5ii1PcOp1PwP69Tej5O4g
         Qy9hpi88TI6Wx3RXKrwfSjlvl0CDtbQtTnZh/Uo8qT1csOLt6EdtCJhrOfTmKEG4XIwH
         3l2BRyfIQZC+EYl5wB0ySln9BO88FTweYIK8BkeCmcAH3TVvLIbCp5b1SewduLmkq0az
         C/cg==
X-Forwarded-Encrypted: i=1; AJvYcCWp2CGvmaRvOYKDJ0XefR591diBlv4KlkX/q4oNxlh6YBJvD7nF9y/nPlm2WCPXRpNTKDsWuelMggBYig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx//3rG3bymhnQXfDnJsQeBC4+/bO05NlxUmzajbu+DR1v0R6Mv
	o3TiBi8n8+ZJor/358tunQapSOLc9h3mboJrsIO2J0mjNQHjCrWz
X-Gm-Gg: ASbGncuO8+51d28yT5c6rTWxxlajbrtKwXDx8AfNqLkDgcpXtbwSILGkgFvOX8jEgR9
	x1Hzve9giVqyjFLyXyohF01xScv1TADKZFUfqqYD1cRBvUWnQiRcYmAcivhs2hl5+vjnGm9jvGv
	O1w/w62y8RWkTAwcZsXlNXxuijKvZfO6pf6Kri/ZMGm1Mm4DpRfCeBlJ/R0mU1/OOcTSZZmbzKh
	InPZGDffp6/kJr4WB97hI97xPwvTtCZ60AafsALZQVvmESM43VA2lLRTg+LLfbPOSM=
X-Google-Smtp-Source: AGHT+IF8RD8sYCPfHojBOSb3Bevtt7AgKe5hJyuI6s7bYeF2WfCLnOJzuuudlCz/10cter+ga10QrA==
X-Received: by 2002:a05:620a:4454:b0:7a3:5f3f:c084 with SMTP id af79cd13be357-7c0686fa3ffmr379450785a.30.1739251123960;
        Mon, 10 Feb 2025 21:18:43 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c041debe6bsm623193585a.15.2025.02.10.21.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 21:18:43 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 8/8] riscv: dts: sophgo: sg2042: add pinctrl support
Date: Tue, 11 Feb 2025 13:17:56 +0800
Message-ID: <20250211051801.470800-9-inochiama@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_211845_143876_C1EE49F7 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

Add pinctrl node and related pin configuration for SG2042 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  | 72 +++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  6 ++
 2 files changed, 78 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index be596d01ff8d..a36e8843ab0e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -42,6 +42,8 @@ &cgi_dpll1 {
 };
 
 &emmc {
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
 	bus-width = <4>;
 	no-sdio;
 	no-sd;
@@ -51,6 +53,8 @@ &emmc {
 };
 
 &i2c1 {
+	pinctrl-0 = <&i2c1_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	mcu: syscon@17 {
@@ -60,7 +64,73 @@ mcu: syscon@17 {
 	};
 };
 
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
 &sd {
+	pinctrl-0 = <&sd_cfg>;
+	pinctrl-names = "default";
 	bus-width = <4>;
 	no-sdio;
 	no-mmc;
@@ -69,6 +139,8 @@ &sd {
 };
 
 &uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..aca2e88fcb63 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/sophgo,sg2042-pll.h>
 #include <dt-bindings/clock/sophgo,sg2042-rpgate.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/pinctrl/pinctrl-sg2042.h>
 #include <dt-bindings/reset/sophgo,sg2042-reset.h>
 
 #include "sg2042-cpus.dtsi"
@@ -181,6 +182,11 @@ rpgate: clock-controller@7030010368 {
 			#clock-cells = <1>;
 		};
 
+		pinctrl: pinctrl@7030011000 {
+			compatible = "sophgo,sg2042-pinctrl";
+			reg = <0x70 0x30011000 0x0 0x1000>;
+		};
+
 		clkgen: clock-controller@7030012000 {
 			compatible = "sophgo,sg2042-clkgen";
 			reg = <0x70 0x30012000 0x0 0x1000>;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
