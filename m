Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB1DC83F17
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Jul 2025 13:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVw59ADMTfuCkmxMFSkMmYqtyrFbEqN98j4nsjFzNt4=; b=YI5tNQzd9lxr1h
	idnUNHidJu9VUeZb+ehDQrzjY5JDTKu07jydPtpubxXQ3bT1YkOSa9aDpP9oihR2Gv+KlpWrb+sux
	/rrGYL9LGxOiricuzRASbYKk9xioImd36Y61ow0S4CFuNuHVct4uCbPCqV9ddii/jxj+pI79zBnX0
	yJmMBbyyfr9ln5oocqGRqk1NO8Ee2KY5ENXtmF/542J8c1JN7yOiywiqHFkjFbvUZQcfxnk/ebs1Q
	lIK4D5uE1GQ+5xTQhHBOXU0kLSnPl6SSaBT9qbiorNYrKoz3FixlfSgfu9Uo3KCL13Zx5jzT7iI9D
	oTnIdp5aZ6gEhm0qWUGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefP-0000000BUBx-2cNs;
	Sat, 26 Jul 2025 13:10:23 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufefN-0000000BU9l-29s4
	for linux-riscv@lists.infradead.org;
	Sat, 26 Jul 2025 13:10:22 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-87c070b2dfbso114514139f.3
        for <linux-riscv@lists.infradead.org>; Sat, 26 Jul 2025 06:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753535420; x=1754140220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XO2Fy/81E/WhCOJwM6NoWD+/CZxHHhnDjYEWoZW3i/Q=;
        b=GOpOYhijpZUXoa0CF2hGVbk0CvMxHeKXgE3d8tyodDJl5bjRy/wR/O/zjN/Yn+oSs2
         PTHW6WOlNccYwNDNkXe0jVwD+oXT9lmYC4pclbZSoi1PxY2LsuVVJicLsLDuCtIrH9OD
         iw1dT36un89VsXNNz2CnsgFWywrbKp/eHpKaOKADTXLLdFLELk01wYw6ewd6VCgLxb+J
         JuC9FI90cHc+EXsF1fjIICd8wmSkLQCxIUyISib0tYhsAayH96D+UoM6ycvoJEPxh9+3
         iR9lKiOZARDI8R8prsmBcYpPbM521QzCqSOFqfkbE4s5dN5cnqXGhn0n6YjQVKPJRiiG
         1GQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753535420; x=1754140220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XO2Fy/81E/WhCOJwM6NoWD+/CZxHHhnDjYEWoZW3i/Q=;
        b=G4J1wJJ6tAFG/fZlQg0nMd8kU6hS/9kdwK/GyNAFuQaLSbZK+u85RQt6gDh6v+Lsdn
         VNF1Ynpr0I66fWPtCX/tzOXcFwCeynT8iL1MRfJM6g8BHTckCqYULzgVVVL/ihWkgRFw
         liCxuzXZfn4N4EI346mAHxAhunu1q8RkD1zrVgknv0MoKYQPnZ1M72oCho5nO8+gZdBp
         ZKtfR59udmJJlRRPgffCOjgOTAKBdI8shbc4N8/EtA3mVnpvltUiote89SgOOl/dySfw
         wRILFf/LnH7lK7tf5P758J6TqCqHkzcpFcgOc3cqQmQskeoh+wMyadMfSDCyGK21LRpD
         8Gwg==
X-Forwarded-Encrypted: i=1; AJvYcCX9s+Qpsm1074rgXGD2lNZHKKWZesRvU7oIvp1lt4Z/ZkLMXsjARlDw5WKhjwgijGreoa6oQ1m9odxtxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwKwmAf0697QlPi7gK/77eSkiYiqt+fRxTy9WnNezGaPhcBoPfv
	5aIdAfF5TlsRh3wkEI9nyn2vPtYLa26o8OV9vGTNvKlacpnBGBVhFVqSrQVVnU45N30=
X-Gm-Gg: ASbGncsDhxwMs3DOJgA2/bJ4eDVAGs/ID4NWtHyzz6yvumF2c8zTDKjHSnYdFNva1Vk
	3tif3OOCBGkn+XSY1HbRsdUdFYvqd9Hzc9JQWbaDqqWD9wr9RRMH84fU9sNc4LOoEdfJzuCaWaF
	7CNUg1f88C0g7H4/B3K6ylIkIEDpcTeyIYa9lhCKW+tF3HsNXhtnEu0IPWqS11AvUBjZX1/zoZe
	xO5cmqK82GJipgHC6VLYgquDgoYMqK1alIi1mLKujYCvOX0oK9liRGL0gmrsOzwPpOUWqFA/Pfz
	Tlsf/F4qxHoxqsGKIv79O3eU0uWe3Q7FxbWmvsABEjXg7QSW/xDV894FNe4tA7LcaFLv2CrgohO
	cwm1Rn2jH6VD4v7pic/afExEifya981fu45Mbgk1cPBqxUlhrDW+ZW4n+/BnomgQqrQ==
X-Google-Smtp-Source: AGHT+IFowWZBk8AVURVAXWPSaWfOPiE/GFgKH2Cki+djIREns99xE2XqEQbxbnTzUozYyQveuIR00w==
X-Received: by 2002:a05:6602:2dd0:b0:86d:60:702f with SMTP id ca18e2360f4ac-87fff9442fcmr893288639f.0.1753535420282;
        Sat, 26 Jul 2025 06:10:20 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-880f7a4ee9fsm49551439f.33.2025.07.26.06.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Jul 2025 06:10:19 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Sat, 26 Jul 2025 08:10:00 -0500
Message-ID: <20250726131003.3137282-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250726131003.3137282-1-elder@riscstar.com>
References: <20250726131003.3137282-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250726_061021_550405_9533F548 
X-CRM114-Status: UNSURE (   9.90  )
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

Define properties for the I2C adapter that provides access to the
SpacemiT P1 PMIC.  Enable this adapter on the Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v10: - Move a few things around as suggested by Yixun Lan

 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 13 +++++++++++++
 3 files changed, 32 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index fe22c747c5012..ae9409fe398b2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,18 @@ &emmc {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 3810557374228..96d7a46d4bf77 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -11,6 +11,13 @@
 #define K1_GPIO(x)	(x / 32) (x % 32)
 
 &pinctrl {
+	i2c8_cfg: i2c8-cfg {
+		i2c8-0-pins {
+			pinmux = <K1_PADCONF(93, 0)>,	/* PWR_SCL */
+				 <K1_PADCONF(94, 0)>;	/* PWR_SDA */
+		};
+	};
+
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
 			pinmux = <K1_PADCONF(68, 2)>,
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c..580f77b5e838a 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -459,6 +459,19 @@ pwm7: pwm@d401bc00 {
 			status = "disabled";
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			interrupts = <19>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
