Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F6CD13569
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 14:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tglFULs1VTyUTmMZksK0aGvd0FD33AlEsYjWlcrCKZs=; b=pIT9+EVqRGx5qR
	uOsRqvSoxEvAY5yx2SCzQl6GAQFJQS3igcFsVCxoXXLb4GkwDnSirqoGvLRZnpVIBmgawZdwk9URQ
	d/Cei8rIc7XMQGmwUGI2u2DrrpIwkzDf5M+TXwWojQg1fNpfIU9OU/DC/iITzTUrMAd6VImBLeMqb
	H4gxxqg9ATLajavUi2/NP5KVpNYAZctJKq04wqxguAXMb0vMC26CHGyOxSWDRYhqs7nYgYnO0XfPa
	IA8d0MFJbsyYNVzWNncOGz0DuveddDS3h43b20NFNoCr9cGw1Xi2Td7PphKdT34T9GYGkPELIG9ML
	dAORr+Lhv9mPPfIMm4hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t54Wq-00000008Qns-0OyL;
	Sun, 27 Oct 2024 14:46:04 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t54Wm-00000008QnI-0rZl
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 14:46:01 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71ec997ad06so2457309b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 07:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730040359; x=1730645159; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWEEDIuoc+ubQpnTY3Wis5Eq7A0dylpkEwbr0VsXG/k=;
        b=jdqDvL2eTboCyNJErEg9Mpi1lPDyIrQFV8OklIUyV5AIUBFVWnbGlCYbk1kOegMW61
         Qsqwd8J60FWizXeO+K0QAj2y8GE/C4unX0JXIz3v4JdFAC9d9j9VaAF64nXIrsQk0+64
         JHcuiGB2dKTKGCVpXZtArtWl57FQa+Fh3K8/3Y4aKpHb57oG1f4sgW355QozdFKMHokB
         5uvBV/6j31IgjgS3DkAEL1mUSPMxk0rw8tKFI6Euyiat2sNSot30Djoj+7+nX0o5WxOe
         Jf1R0HDuCptAwyJa2BZVXgxQMYdeEG4mzU4RGS3XECSrYhEIvPfjMiCqe5vSAvW+r8kg
         faVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730040359; x=1730645159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWEEDIuoc+ubQpnTY3Wis5Eq7A0dylpkEwbr0VsXG/k=;
        b=JalaK61a+i5lrk4GxXJvGQ+Y3jznwVKQL6ZQX1ZthB7uqLyxvuuEnFKrgQ3mpmijSa
         iW7hc2qkLp6P6XyZexBPl0Ul/U7NCgBGvd7JaOeXgodji95J94hJZbs+zCwB9sv59iEu
         zLERH8mHaQp/F1RWh/JTjk7uAmC2JnWXGElpM6h+WCKbpnRAjlcGbVvZ4BWKJEI1TjWk
         MjgdgEMJCRl4xrXMLUf0KArJdTy09mgtEYKlCpgzpse4Ofvp5zNfNVAVT0GC2vCbeJ1P
         E4JwQqEK2Zp2WIW84PsrCkAxUknFyWPyKoUh68WGRMPfSLHjksxZJKzSQSFJmrA369bM
         1uhg==
X-Forwarded-Encrypted: i=1; AJvYcCX3hvK/N7ZN196afxymwwf+RqlXJ1zrINibc7yGMXz7Jbf8q4Tk/R14C/OY3dVy1yp+/XU7XQx28KZ12A==@lists.infradead.org
X-Gm-Message-State: AOJu0YycbarKPl03x25TdgLrcAjSLT7FsFsvsMyPNLdFvyroncZ6EqZ8
	kSaB+RIL2LzlQa2jXVOXQwfnzbPnJ8Vrbhn0GNtuZAN4+5e8Ce8HOiHRHV2AwcQ=
X-Google-Smtp-Source: AGHT+IH9/LAPD9XkxqAgDEzE/OAVQvWb8BYcvTb5Lysws0ZyjzOdHM8FJiGWnGHE78Q99U2WeQiUiQ==
X-Received: by 2002:a05:6a20:4499:b0:1d9:1f51:faeb with SMTP id adf61e73a8af0-1d9a85349ecmr7492678637.39.1730040358888;
        Sun, 27 Oct 2024 07:45:58 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0cb06sm4065110b3a.115.2024.10.27.07.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:45:58 -0700 (PDT)
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
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v6 1/5] riscv: dts: starfive: jh7110-common: revised device node
Date: Sun, 27 Oct 2024 22:44:44 +0800
Message-Id: <20241027144448.1813611-2-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027144448.1813611-1-guodong@riscstar.com>
References: <20241027144448.1813611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_074600_269559_C4BE28C4 
X-CRM114-Status: GOOD (  13.19  )
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
"jh711-common.dtsi", and enable them instead in these files:
   jh7110-milkv-mars.dts
   jh7110-pine64-star64.dts
   jh7110-starfive-visionfive-2.dtsi

Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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
