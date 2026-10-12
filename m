Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3EE5CA9ED0
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 23:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZkgYtlnWwYPzZEubWF+sa3X7udnUcvpeKhgSp2yFJZQ=; b=WKDfoeG71bHxoN
	GLBwSaxBRC82hacjF3mI3/k/TLNaPoGUUIOGYUNjS276EwHEAG4zSz3GT1ODatUIYiFbD8WzO7h+x
	8/tVJayaZst9gWDAo8ii+qM1LwjtXZe2ybw8GKN1YhWfrMuxSiAkwX/SAp4LvsvPkdvPFxsZF/dPE
	cm4XNob3Su7d2SFV9aeF3qYv6DyLhqV5kC8JUud7lAQwyUGHT2tTBI8/gWmSgQ5h6o61myHxOMyV4
	6pGVWdDY6pO97sHOahdoutXMYByZUMA3hwUbLAi6K1YpwmRGoBAoScOMjaFeSenmZ3T4qX3MyL8AU
	QR2mNRUS0rEDjFmkrFyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPss-0000000Bgep-2utT;
	Mon, 12 Oct 2026 23:56:46 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGPsi-0000000Bgcr-1kjL
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 23:56:45 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso6007221eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 16:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849396; x=1792454196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GIe3e2jypmCgxdV2fa+T8K7iVPWqEf6EkwCnIkIhFj0=;
        b=PbfRu3Cm5wHLHJ3zcMnXC+uskz85Pov6z+Z58oTLDyQ3ULfVnq2LNj6aBpMFa8Kx04
         lpn038B+ASN5NLkTMR1q+21/bGcnyQNruYDNc8mFtbqLyScSB7OqmjF/XHDv8BJGYW0W
         5c7ddvJeedk1Q7ZgkuqXe6j8wEhAnNP/L+Aje6MKsNw6uzMyeD1jEBidr9QygT8+7uca
         soeeFPbV8Fpe/gBj2C5F+K4c9QZULknPDVbocaUPQMbdK5ahmQJEvInWRuJGMDBcwGtU
         wCalfctwCF3UQuRrMpP8pJ3d1flIQ8GZq/sg7vCePhjO6AA6aA4rniwouYu1IbkQRDLZ
         f0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849396; x=1792454196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GIe3e2jypmCgxdV2fa+T8K7iVPWqEf6EkwCnIkIhFj0=;
        b=kFQy/TH4murroF1WyKbcSib7N7gF9Nvmx41Hs77ffxJkWlG3J0+lgTao1TThdacDZG
         by25I58zNYUY/24Td1a8ESu5EiiSqA0O2TS6DKejqqToBUR6FGjRzHTHGpNoIdWfmOL9
         qF9XbXVgi+w3SZLTywJXRE747LlJ837WxJhgMAPBaT1su3rU4NlJLBBNp4yAJtFoZx0d
         9fMUqOS6v+qqD3GpGT06/MyMjjIWxqjcpdOQqDZpiiYSF03maAJ3eKyr76Zm2onqwH8O
         0aEC5bBRObKYM4qdzccVzJ9hsWa5IPKof9WrWdPHq5lD8cPQ4L5BusYnlX6FX7otDmPE
         q/IQ==
X-Forwarded-Encrypted: i=1; AKwUvByEjAdB92Knf5IlebQowr1Gv2ITn9LDqwJjO+XEt97/jnfQHs2uKEUFciIyCSB69IjolPgDxkjM3Sk9vg==@lists.infradead.org
X-Gm-Message-State: AFq9FYKZOL71V3IXyGzuGRZ4Okx9i3xD9CdXze3Gr4B+lNz0AW6PErgd
	rzfKMBRufbfnbCUL4W3SOlHz+1qDVdn0vKvW5AMHRn925Y1M4vHTHoz2
X-Gm-Gg: AYBFou0CDvGOiMGSgEiz6rCdGw1UzgYE+4KlKekRd6Vy/9k+dKyJNh3/Fmi1aaw+IgX
	lHn4c7puWqKaD5Cr1d0e8ZAmOhfbAsgG/9LV9H6mK2nRSn2pIlho0qbvdE4oYrOBH2OG7PXy6+S
	7qjdv44g39pe7Zgz2aZddRs9psvAxxlwAaTnAQrdCTrtH14C5cO1O5sdxi69HeZMTk0sc+KWVgR
	da3S9X81PB3lNCFzp4xRAPdkrDQAxYjJ+6oj5HXjyvmkR1JgSVaPs2e2hC+GHosSZH5sBTQNAph
	4ElJKg3UszkwIVqAGZIaWbAybjK1qFNU/7C0xDD8GTPL6xqCarEG+edy0u7V+gvvJ0UZ7rsOg3x
	+IbZg7HBjUdD9pDlGuAgPH7W1RWS6F0pxPmxlnviCDlVlc9u4EsN0oc9vnKqcFHfGQEJEohP0fI
	u99T4hSvRXSM42pqeSLqj8OuVyetNuIE8eKHIVhnSYvN++LHBAbSRNyVweo3DPldpFhVXfkPkXL
	Bq1nwv1zvOv+1NmeCQfFx01MaYU+vPht8Zx9qPy67c1Fe5p2hCUH8JCm1O8AjagtgYkNmE75Mjq
	WuyXmCUITiIE96ZREtr+l0eT9AF72Uj14jo2AXQwdXoiOm8QITvc4Q==
X-Received: by 2002:a05:693c:26c1:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-3537ddd6142mr13773283eec.1.1791849395693;
        Mon, 12 Oct 2026 16:56:35 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm8686145eec.1.2026.10.12.16.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:56:35 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram
Date: Tue, 13 Oct 2026 07:56:24 +0800
Message-ID: <20261012235624.77993-3-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_165638_321277_2188D0B0 
X-CRM114-Status: GOOD (  11.16  )
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

On K1 boards an SPL reads the board EEPROM (0x50 on i2c2) to identify
the board, and before DRAM training it programs the P1 PMIC (0x41 on
i2c8) rails buck1, buck3 and aldo1. Boards that boot from SPI NOR also
need the flash on QSPI.

Mark these board peripherals, and the I2C buses they sit on,
bootph-pre-ram on the boards that have them.

Assisted-by: claude-opus-5-5 dtbs_check
Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 7 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 7 +++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 6 ++++++
 6 files changed, 41 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
index 81c40df2a..6269d2ba7 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
@@ -64,6 +64,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c2_0_cfg>;
 	status = "okay";
@@ -71,6 +72,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>;
 		pagesize = <16>;
 		read-only;
@@ -93,6 +95,7 @@ serial-number {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
@@ -100,6 +103,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -113,6 +117,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -127,6 +132,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -155,6 +161,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 58035d886..e74505984 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -187,6 +187,7 @@ &qspi {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -194,6 +195,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <16>;
 		read-only;
@@ -216,6 +218,7 @@ serial-number {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -223,6 +226,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -236,6 +240,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -250,6 +255,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -278,6 +284,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad..406b7ca16 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -201,6 +201,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -208,6 +209,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c04";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
 		pagesize = <16>;
 		read-only;
@@ -223,6 +225,7 @@ product-name {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -230,6 +233,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -243,6 +247,7 @@ pmic@41 {
 
 		regulators {
 			buck1_0v9: buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -257,6 +262,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -285,6 +291,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -386,6 +393,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 246f8f2ab..0531bd003 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -127,6 +127,7 @@ &pdma {
 };
 
 &i2c2 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c2_0_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -134,6 +135,7 @@ &i2c2 {
 	eeprom@50 {
 		compatible = "atmel,24c02";
 		reg = <0x50>;
+		bootph-pre-ram;
 		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
 		pagesize = <8>;
 		read-only;
@@ -159,6 +161,7 @@ num-macs {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-0 = <&i2c8_cfg>;
 	pinctrl-names = "default";
 	status = "okay";
@@ -166,6 +169,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&reg_vcc_4v>;
 		vin2-supply = <&reg_vcc_4v>;
@@ -179,6 +183,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -193,6 +198,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -221,6 +227,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -320,6 +327,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
index 2d1ba34cb..8e9bbbeb1 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
@@ -113,6 +113,7 @@ rgmii1: phy@1 {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
@@ -120,6 +121,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -133,6 +135,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -147,6 +150,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -175,6 +179,7 @@ buck6 {
 			};
 
 			aldo1_3v3: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396..857b4ebe3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -143,6 +143,7 @@ &pdma {
 };
 
 &i2c8 {
+	bootph-pre-ram;
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c8_cfg>;
 	status = "okay";
@@ -150,6 +151,7 @@ &i2c8 {
 	pmic@41 {
 		compatible = "spacemit,p1";
 		reg = <0x41>;
+		bootph-pre-ram;
 		interrupts = <64>;
 		vin1-supply = <&vcc4v0>;
 		vin2-supply = <&vcc4v0>;
@@ -163,6 +165,7 @@ pmic@41 {
 
 		regulators {
 			buck1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1050000>;
 				regulator-ramp-delay = <5000>;
@@ -177,6 +180,7 @@ buck2 {
 			};
 
 			buck3_1v8: buck3 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <5000>;
@@ -205,6 +209,7 @@ buck6 {
 			};
 
 			aldo1: aldo1 {
+				bootph-pre-ram;
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3400000>;
 				regulator-boot-on;
@@ -298,6 +303,7 @@ &qspi {
 	flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
+		bootph-pre-ram;
 		spi-max-frequency = <26500000>;
 		spi-rx-bus-width = <4>;
 		spi-tx-bus-width = <4>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
