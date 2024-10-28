Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFDDD13598
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 08:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DO7GLYszKhNXGhogZFM5TTrCVOMTkl+d6h3cIbuGBRQ=; b=bkAbXjbuFwFg9C
	BDVxaEkphPJ+kt+FF6Inf0DDIZbgM15t1pMNmMeHoKiATuBikV+fr+CQowSd2UhW0kf1c+Zuzz7oI
	Z1x0qUhyg8zYTDwQamJfAYgQz2onp6qKmR/YadDmNRpqaqMq96RUjVKlqM6V+1R2Exp6JJHIFtgpe
	kdIjIq9kzo0gkz45MHT7/qhSt88HPMqnqFEVrjgMG689nbNB1jxmUUfWGnm/tPsHnrzYlA3aFpz/o
	Gz2PWJYjoyCiuTA55c3DaKgCXCBZWZZHMnAgCTUdWFI4zMsw+N+xxbCVY3jFc/rqi74v+97bDE3uX
	1RKaLtJjxY1lnBEmRzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L7I-0000000A5fF-02qQ;
	Mon, 28 Oct 2024 08:28:48 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L67-0000000A5Kl-0SCI
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 08:27:36 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-29066daf9e2so626750fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 01:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730104054; x=1730708854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUnDdF1NqKOBG1QC1W/FMRUH7DBiKtvIz//4z8kfSg0=;
        b=bsfgotkKoS0WaUHUWY8J/hPtZzXW4jK/W4eVX9wKRQoEYmceV1xkw01k5QhDuu3nkm
         UqJpzzNGoesDdV/zgDYLWE9ObqPECx5mbCc8KR82IILNGudWsKNvyJT4+nyvycs7K8pR
         QL5O72w0kMXWeZmrzv6I7PKeO2cgIcoJxPwh/ojTsS5Cf/FTGLija+HmBV1hXyHXTZMa
         JCV269tx9ELDc0NPYKid6LjMdrznUqFbBA+/WAiIEMJqJzEb9StvOHgsJMOL5j/qf0Ol
         E7UlwBrkSObRMdNMIac1hj9JXLMD02yEuKcdF46kwpG0G6zCZtmFrrwvpAL/FdgCr0uk
         29VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104054; x=1730708854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JUnDdF1NqKOBG1QC1W/FMRUH7DBiKtvIz//4z8kfSg0=;
        b=jMSiwo8MXvMjB3NChDIZW/kKlJHKChCYokQfaHk3hwkzVzkipkRkdlZKj3gmg6iD1F
         jqOqmA3jQDrVwVdEaPlyflZSEalobVk0IA/sabGcsxBx5/zgqhanI8qtHsNQPpk9U5F5
         uns3GPIEHvQS9sqWoyuj00Erd5AtYu7RvojWzPwY3RMvIUT6OUjKOrKMaQG+0yCaWCjl
         +vHIOtsMM65v6sY+A6G5dBAVoKCNZ4ceu1VQsgvHJMNo7nWYXVgFihluXhhlwjsJkd8c
         X5WB32pzMzcbZ2qpapf/BQ2laj6kXDG2WzI6qZpjeWpnQgKYN9Mdni47K4C4ppX2yIat
         uZ0w==
X-Forwarded-Encrypted: i=1; AJvYcCWIjghEq3owj3fMCtQQA7JBGoahJyP9N1AoFt7y1ocAfr/OagoUXHLWVAa0DSyq1crEJ8cVHDnC4iPThg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/r3jyr9vBWLXru7l+0pz7gnml2lfvKXnBCfxVleDXny98HZl6
	UcpTVaqnd3fESLTNPVvqYnVcLW9eGsUJe19Qz7wym5HaZbDIl0BKWDqojEuePIY=
X-Google-Smtp-Source: AGHT+IGPk4YXrutX/vs8AXtEdItCylcwMp3wJPOtQTv6GW7g//NaYI/dS10bOiYT0NqDk06ZhYnIQQ==
X-Received: by 2002:a05:6870:1614:b0:277:7147:26ff with SMTP id 586e51a60fabf-29051d728ebmr4639045fac.35.1730104052900;
        Mon, 28 Oct 2024 01:27:32 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e451sm5195419b3a.24.2024.10.28.01.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:27:32 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v7 1/5] riscv: dts: starfive: jh7110-common: revised device node
Date: Mon, 28 Oct 2024 16:25:49 +0800
Message-Id: <20241028082553.1989797-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028082553.1989797-1-guodong@riscstar.com>
References: <20241028082553.1989797-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_012735_173640_2175BC2A 
X-CRM114-Status: GOOD (  13.07  )
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

Earlier this year a new DTSI file was created to define common
properties for the StarFive VisionFive 2 and Milk-V Mars boards,
both of which use the StarFive JH7110 SoC.  The Pine64 Star64
board has also been added since that time.

Some of the nodes defined in "jh7110-common.dtsi" are enabled in
that file because all of the boards including it "want" them
enabled.

An upcoming patch enables another JH7110 board, but for that
board not all of these common nodes should be enabled.  Prepare
for supporting the new board by avoiding enabling these nodes in
"jh7110-common.dtsi", and enable them instead in these files:
   jh7110-milkv-mars.dts
   jh7110-pine64-star64.dts
   jh7110-starfive-visionfive-2.dtsi

Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
v7: Add Emil's Reviewed-by
    Fixed a typo in description
v6: New patch

 .../boot/dts/starfive/jh7110-common.dtsi      |  5 -----
 .../boot/dts/starfive/jh7110-milkv-mars.dts   | 17 ++++++++++++++++
 .../dts/starfive/jh7110-pine64-star64.dts     | 17 ++++++++++++++++
 .../jh7110-starfive-visionfive-2.dtsi         | 20 +++++++++++++++++++
 4 files changed, 54 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index c7771b3b6475..9e77f79ec162 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -176,7 +176,6 @@ csi2rx_to_camss: endpoint {
 &gmac0 {
 	phy-handle = <&phy0>;
 	phy-mode = "rgmii-id";
-	status = "okay";
 
 	mdio {
 		#address-cells = <1>;
@@ -196,7 +195,6 @@ &i2c0 {
 	i2c-scl-falling-time-ns = <510>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
-	status = "okay";
 };
 
 &i2c2 {
@@ -311,7 +309,6 @@ &pcie1 {
 &pwmdac {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwmdac_pins>;
-	status = "okay";
 };
 
 &qspi {
@@ -350,13 +347,11 @@ uboot@100000 {
 &pwm {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pwm_pins>;
-	status = "okay";
 };
 
 &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>;
-	status = "okay";
 
 	spi_dev0: spi@0 {
 		compatible = "rohm,dh2228fv";
diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
index 5cb9e99e1dac..66ad3eb2fd66 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
@@ -15,6 +15,11 @@ &gmac0 {
 	starfive,tx-use-rgmii-clk;
 	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
 	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
+	status = "okay";
+};
+
+&i2c0 {
+	status = "okay";
 };
 
 &pcie0 {
@@ -35,3 +40,15 @@ &phy0 {
 	rx-internal-delay-ps = <1500>;
 	tx-internal-delay-ps = <1500>;
 };
+
+&pwm {
+	status = "okay";
+};
+
+&pwmdac {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index b720cdd15ed6..dbc8612b8464 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -18,6 +18,7 @@ &gmac0 {
 	starfive,tx-use-rgmii-clk;
 	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
 	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
+	status = "okay";
 };
 
 &gmac1 {
@@ -39,6 +40,10 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&i2c0 {
+	status = "okay";
+};
+
 &pcie1 {
 	status = "okay";
 };
@@ -63,3 +68,15 @@ &phy1 {
 	motorcomm,tx-clk-10-inverted;
 	motorcomm,tx-clk-100-inverted;
 };
+
+&pwm {
+	status = "okay";
+};
+
+&pwmdac {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 18f38fc790a4..ef93a394bb2f 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -13,6 +13,10 @@ aliases {
 	};
 };
 
+&gmac0 {
+	status = "okay";
+};
+
 &gmac1 {
 	phy-handle = <&phy1>;
 	phy-mode = "rgmii-id";
@@ -29,6 +33,10 @@ phy1: ethernet-phy@1 {
 	};
 };
 
+&i2c0 {
+	status = "okay";
+};
+
 &mmc0 {
 	non-removable;
 };
@@ -40,3 +48,15 @@ &pcie0 {
 &pcie1 {
 	status = "okay";
 };
+
+&pwm {
+	status = "okay";
+};
+
+&pwmdac {
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
