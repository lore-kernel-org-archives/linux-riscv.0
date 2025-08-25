Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476B0CA0FF0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gz/o1Q6qEIcmVeRF3XcnSLaJeOIk2nKm7XciOCf/AUc=; b=f7ZsK2RaOZKRa2
	egyVMTJWlSo6TZ3mjYEAvP5kOSSe2LL79NIsT/kssJvMC/dMb9wcS3epAT/yDkGcixLlOYDScnA8y
	7Htb681PSAowAJrDs13sEG3uYlYD+LtMIDEYjKSO/au5RNiNreQj2ZwlUzMLyHkpNuo+rcwt8a9J9
	bmmt7Zez7i08xXgPuRLk4htz55ucUE3DJNrh8hUDwCj1HYryPAX496dRVJYGbzjq8SdMTexX/ugB0
	lQDoJHj095vDs+1zejli1EgqvLtlrRpH1kaWW1sloxEEyvE9/vXT1UMkC2UNFV568hxwYrVF6mcXL
	qL0XC1X/OJ0jVXG0E7KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqbNd-00000008sOF-0ba0;
	Mon, 25 Aug 2025 17:53:17 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqasa-00000008otx-2z5z
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 17:21:13 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3ec25655e38so8361505ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 25 Aug 2025 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1756142472; x=1756747272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaImj7HPDviB5XgBqpwJeOy4vyIIfyH+4F3V+wrd8Lk=;
        b=GDiRRUx028xMWeUsr6jt8F+56q34Qw7Cmkhz3CDI8KqY+1BU+5ji8WBmnTC9F3izPp
         3Ste+5NX1nOF83coRc1CvzIRp+yd5dFUoubmT0Q6r9eXBU1rAJVnyOx7d7FhAZK87Dvj
         WRsHYTKzTVuUpQMfBjq0mGMs6ZMutWZja8OK2REz0TP8BAp2E8LdMTRqoTWzyEWlSdUx
         oimr2jSvQyyryLG6JG5exrfK4QuB8vfp7jUgHTEGLP6wtWpwO/uG5MlERz2O0uulDg9A
         KPiDmTvwh5ku5w15agZpmUFlWN2mxpu9yyIX8i7gf9xWWuyad0WKG/RM+logtWc0YYiD
         5XMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142472; x=1756747272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vaImj7HPDviB5XgBqpwJeOy4vyIIfyH+4F3V+wrd8Lk=;
        b=scAbnFaWx4lgmA5JtKwfWQE5mS+i0rsbpfdNSBPKbQbdo66ZK8VXZjjq2S/aVyNXxr
         G5aI60d8KFgSPU0S3vwlWCisW6zngJi59AK7/qVhAVPS97Jw4mgTEtTeMCZtwzLARoW1
         hdOZaI7N/MT6XSvO3oGJj+iXpSc5GGr4ddRdaQ1wtKbwFCQs8B571lDZNW6zIPoid8zt
         vO2vP4A/itTRuhGDcbKgcM5QBnhchJcEZwD3OiXYzqPvYphbgurKE1gYjaO7mbwUIsGr
         JyWJpNLEJKZ+SiCsYHXNXh/EtyxBygmCA1dwMT03Jzd8dP7B0XTV/mdO7OBkaXPLEd5T
         34Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVGTJNc5pg8kDc41g2MhBowULHV0dzZ7/DaVt7BtuviFfQ2++Fg4yZuflkyQCzbiKyPqkn4hIDxYtcYvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzcOe6gnucffiHanDxYAZGbelypBfDAjaYk51maWWGjJvF8Ao1q
	uZlQFvN6X1fKDJnDWScqKmFK3NouEaU9m73TfKfjv8PucnhRHk4PxFPBR3/jzp7ys5s=
X-Gm-Gg: ASbGncsLS27UTkWS/CM4wB41MkZUUtJKGfTqzqB9VFGUeqdP3oEptUsttuCcwIHM6cL
	XqTvm8NenXqa+zx14T5kHFSL7VATbX13ap0CCQeq+rPqwQB4iPCQLRmeEI8d32/Sj8JWKd1Ge9d
	g+H/Belx1uXjfm/9o3asi+V9si7gkXBfkCN1x48+h8T7KKGhNSOa0Q3O6FMY9owGo/hV4Ht7B+3
	TTG7lenY0fIXmvTl72Q+XDv2mmEi/W+KA/ByxLOxQARboqHVOXxDM57VKs3KZsxRLHu1Es3Jsn+
	vV9xJPmmWl+6zxi4Tq5B/2GR1qtB7vA3V7cTRdfZCTki2oh8HeHrryi1v1TRaKW0B/XwSV4Yv8Q
	6hDLzjnJ7RbVS3kr6RDFn/GuLXwcIjevB68zYQrwZNgeSDgB/yvWYJQ8wLIhFrQNOAQ==
X-Google-Smtp-Source: AGHT+IGMjww54FRdV9usG2bAND6j/10A3PtBf2JERSU5gXA+1FH5dtg3t7ajGlDWVwIXh5UXyCucrg==
X-Received: by 2002:a92:c269:0:b0:3ed:fe91:7306 with SMTP id e9e14a558f8ab-3edfe91737dmr19680085ab.23.1756142471734;
        Mon, 25 Aug 2025 10:21:11 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886e60c4737sm76275439f.26.2025.08.25.10.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 10:21:11 -0700 (PDT)
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
Subject: [PATCH v13 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Mon, 25 Aug 2025 12:20:54 -0500
Message-ID: <20250825172057.163883-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250825172057.163883-1-elder@riscstar.com>
References: <20250825172057.163883-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_102112_747446_9A167208 
X-CRM114-Status: GOOD (  10.26  )
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
index 6c68b2e54675e..cd9b91c3358e4 100644
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
