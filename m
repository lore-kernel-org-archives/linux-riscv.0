Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8441ED0BB65
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4JfsczVGwADBGGAaXPFgso/WgYggRyzGiRxFiNwCIX0=; b=igc3AzAEaBXeHY
	S+kgQ0jV46ZxHz2gxU7/1QqHJvHNNr8IVX6RqpeZDchlQsgvKx+ZVLwujIT1GhvB7PlXUE/Yw7vJx
	eiiU13fD8R8nLCwot/KCgGksUBbQ14+q/ME0F7/GU0YgnByo89GO8EZcgM5TOSoQGmh2ZF3Yn9jCA
	lX0H/hg1rPKj3rUONpH9J18qruqBfwWyUo6bIBVAdfkG2qakmtn+u8HsJEORrthE1oqYEj8sK016E
	lcwHryjZ4W280uq0N1XtWtpuin4+A0/V5WZoEHNsG0ZRxr3ymN7B/G9eA8GW/+3/4wVayaDgBw41i
	cJ7l9c5O3YDv7HMuCRHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3raC-0000000GxUQ-2inu;
	Thu, 24 Oct 2024 06:44:32 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ra7-0000000GxS9-0kvu
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 06:44:28 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e3fca72a41so483772a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 23:44:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729752266; x=1730357066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bay9mS60FeLiI1d5QqZKnl9EEsDU1Ul/yUOBCdDGZ8s=;
        b=DPjtj0zAA4VTMjFy+GJS/nBpKMoalCkXkYHXSMuThhmsw7NAN1Y7pOgGrxU+d9f/QQ
         S0eTNMzrNkBQ5KkEHI2qC7+xeEVhK92sJzXqSSDSuuV674syWSgrOBW50Itjs7bQKXhl
         eeTuY2+t5oI4sFNE+ryEzn6VVeBedIXVx9m5sZpjMrocRay9RvGpVOk2i1JMCliB1cS9
         0hQ7X95V4c/kGUiE10kKLHTwuvYMWICaM5ZlLdMby/lY0spVhBEg8g2Df3JxJWrKtNkh
         KCRj7BrOcFsRvKw+HWYbl1eFuZuEP0ustfajytCP+CmNZ7HE5YZCDta1m88+DtenIRFR
         RM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729752266; x=1730357066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bay9mS60FeLiI1d5QqZKnl9EEsDU1Ul/yUOBCdDGZ8s=;
        b=n2AE/qR8fIySDkOEmEOV4p0cyG0K9fh8tYhXIsP4gBrZtfSDNBcxdQ5JiYOtPKhaqF
         dTdHwuLd0ve+dEumUqQK1xbxWheakEvb0a7Rg0tPKQlW7YGyB3ap7H7FOeGCf+tHiJlm
         UHqVYVJNRwrPW8BGiXcybyqJZF7j6ofdkJn5mCUvmoehE76sZR11lDx6+XSXIvvs1IXS
         6diJxaNOEuO8/wSMfY6LE1QQznjKMq2t4UdbTJ87QSJzA6yC8Fpoqxljc49Vj8u0y4s7
         Dm68pCowytvp8ttGoxy1RZ0BjX/SHyGEDg/MbrWVnU1NlZnVV7KY83iydh+DmB7Y+RGq
         2Emw==
X-Forwarded-Encrypted: i=1; AJvYcCWPWMhxSHedzJKKXBZMVc3ZXbEWqULWUF4N1qvS2QaaYx3/0HNloWP0YOmlEa29BJzmc5Hza+SdWtSIlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2PKbpCXcxYHp18LJ6HOrP/dR955Qbb5/dtDq9nwEvAJT993JC
	WeK5m8AHdh5Jrc7oak7DCqcZqElfHKVo7f3qU0huh2Im0hyl4R8x
X-Google-Smtp-Source: AGHT+IGvAXNeAgZ3B1Vd1rJpFjy1izpP8sqUkL3InWyofh+5HC6lm8M8dvlziCEjoiCDn10yt0EIlw==
X-Received: by 2002:a17:90a:6001:b0:2e2:a3aa:6509 with SMTP id 98e67ed59e1d1-2e76b5e2403mr5546364a91.14.1729752266180;
        Wed, 23 Oct 2024 23:44:26 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e76dfeece3sm2649693a91.57.2024.10.23.23.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 23:44:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] riscv: dts: sophgo: sg2042: add pinctrl support
Date: Thu, 24 Oct 2024 14:43:56 +0800
Message-ID: <20241024064356.865055-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241024064356.865055-1-inochiama@gmail.com>
References: <20241024064356.865055-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_234427_245145_3E879BD9 
X-CRM114-Status: GOOD (  10.12  )
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
index a3f9d6f22566..0654bcf00a52 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -27,6 +27,8 @@ &cgi_dpll1 {
 };
 
 &emmc {
+	pinctrl-0 = <&emmc_cfg>;
+	pinctrl-names = "default";
 	bus-width = <4>;
 	no-sdio;
 	no-sd;
@@ -36,6 +38,8 @@ &emmc {
 };
 
 &i2c1 {
+	pinctrl-0 = <&i2c1_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 
 	mcu: syscon@17 {
@@ -45,7 +49,73 @@ mcu: syscon@17 {
 	};
 };
 
+&pinctrl {
+	emmc_cfg: sdhci-emmc-cfg {
+		sdhci-emmc-wp-pins {
+			pinmux = <PINMUX(PIN_EMMC_WP, 0)>;
+			bias-disable;
+			drive-strength-microamp = <21200>;
+			input-schmitt-disable;
+		};
+
+		sdhci-emmc-cd-pins {
+			pinmux = <PINMUX(PIN_EMMC_CD, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <21200>;
+			input-schmitt-enable;
+		};
+
+		sdhci-emmc-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_EMMC_RST, 0)>,
+				 <PINMUX(PIN_EMMC_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <21200>;
+			input-schmitt-disable;
+		};
+	};
+
+	i2c1_cfg: i2c1-cfg {
+		i2c1-pins {
+			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
+				 <PINMUX(PIN_IIC1_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <21200>;
+			input-schmitt-enable;
+		};
+	};
+
+	sd_cfg: sdhci-sd-cfg {
+		sdhci-sd-cd-wp-pins {
+			pinmux = <PINMUX(PIN_SDIO_CD, 0)>,
+				 <PINMUX(PIN_SDIO_WP, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <21200>;
+			input-schmitt-enable;
+		};
+
+		sdhci-sd-rst-pwr-pins {
+			pinmux = <PINMUX(PIN_SDIO_RST, 0)>,
+				 <PINMUX(PIN_SDIO_PWR_EN, 0)>;
+			bias-disable;
+			drive-strength-microamp = <21200>;
+			input-schmitt-disable;
+		};
+	};
+
+	uart0_cfg: uart0-cfg {
+		uart0-rx-pins {
+			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
+				 <PINMUX(PIN_UART0_RX, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <21200>;
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
@@ -54,6 +124,8 @@ &sd {
 };
 
 &uart0 {
+	pinctrl-0 = <&uart0_cfg>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 4e5fa6591623..107565f22f79 100644
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
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
