Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F839C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 21:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jVtWKVCB3de8rtVSXrmTQHWcQIg4sD8UEYqsartMwKw=; b=Dol86OClToOp5I
	Ro92VEi8Z59iHn+O5Fw3nqKdSF3B0BG4NvLf1nIUkr6qakaEzHFMctDlJAU1kMc80g3slHa8on8zS
	spYh2phByOGkgkDkjqIM7fZjzqcfo8zze6S6MjkYKWzpJB3d+oMhWFyjLj5fYRn2pl8m1lLlXRMfm
	rCEyQ8iIEKiF90WSTS6voo9qG7DGRezP6ZfA2repuBn/BX/ZsC8NzJ/MAg5xEMq3NJ9HUnYCoz1/h
	xCEx1h8RU0MGdg0hd64nGH/LGVojx5Cl4c7HBsmRcMmNBkF2DJanOrFTIz/k2CDcFdpPKcamkFIr0
	YeQqZWI1SFw5XJn4E0ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBaB-000000003wC-3KRk;
	Fri, 13 Jun 2025 21:05:03 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBXE-000000003Kb-3rH8
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 21:02:02 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3ddd2710d14so20586045ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 13 Jun 2025 14:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749848520; x=1750453320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r2mgtiYfhNYD39L2Q37c064MNMF3bvcCZcMAWhqDZfw=;
        b=mAIMEev6KGIpZ1KncBPbFdH5IozllJdSHQJPguotpu6paKpmtluft99KODoAR87XFY
         QA0D3Gwc4qUBBBUG3ujNUj6N9f+6XhrlCa0ynAbWKz3+3sym/aD+amvQCuElXh21B4jI
         Agn9ulFARzUOGNQmibYlli//ZQMyhiVWI2k/3PEYMXEiZFr8BoQb4ghFAA4sGgH9fWyI
         3A2h/+fAznFmh2hBaB88iEN1he+SsW6dTo5Gg4LFFfO6znjVbm3Ji5nksX5JQW15rd/6
         rk7poQi38Z4+vfiv5acE3EFxVHliYuTy/9B3e2P+YGmzwjprMe38Ll4MIP1EtOPzZqjn
         Jl4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848520; x=1750453320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r2mgtiYfhNYD39L2Q37c064MNMF3bvcCZcMAWhqDZfw=;
        b=P5GeGJ0blndVnXElcnLy4Pr7QezyZa+Y6Dx9Gtb8tsncjhbtesljhO6YsDAc8VlAup
         Qt8p6C2GcPcse79cHlqK57rjVar2oE6N5WxoJnoOe0b7hrjZEMX1Ni5oBIkw1o+3aku4
         ZBSnxvYT2OzS3tkT5IXNZ5xyT33OcvFKc9mmhvL1q6K13Ng6L5lbd69caKkfCHGxtgXt
         /Fxv7tEVTAd3a8H/PsyNrKq6y2qHFJGF/PfdnsGH9mrattboH/UdI95PhRZaVbJdNNep
         B49zoX5VGSlaikmBXiopPyR/a1Z3zKZFlRdC7Dgm5rfFAuaSTtKZLVARbJ1rWFVUyj9P
         0M4A==
X-Forwarded-Encrypted: i=1; AJvYcCW7hwT4kX7Qva/8oYQbmNu5F/Uewy4Hi1lPWZSyugLGP2yWWtYAFaVoVm4jvNo7nEdRB4eHII8eyEW1iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNVhUtkxF92Ui7+bKlB/0HIshYCtRsj0yhGtKn6rV1I3E7G/52
	/pjpB0OAt7atpBxNXNS6foOBVdxpCz6o8xUAfuyGlbITa8H3r3oWOb8qIkL8O6njlcQ=
X-Gm-Gg: ASbGnctABB7Nnytka3dGAhR2AkOh3rkGhVOr3sqrBsDes3vORbSHt0+VSRkyeQUDKVU
	a9ZCVt4I/ZBXI+QYs8Dric9DAjB3xqesTFQk6T4PcFrjtt1OlC2qvA+ifdzPr5+ECadXtYkj8pZ
	WP4M5uNEw9nH9SCmrVC7o8mJmL37Fz/Kvx9MUi8mCOMiNjrtr5Ti9gPpZUNAnyTRFcIrHjBBmsv
	TwIQJroJOeOjFzXO2HbQPhS5wR+V2wtmYTvnsxsnPU0MG/z2m295YXgLx/W2cB95qXKP+UNtRbQ
	LKYBttqOITzziMANLQ0+2lQJUz4B8hNHqkhiedjIXIr2O9iT4Jef5c4yfUPr87Z+u/8i/RObSB8
	XLhI1fLkq5oHh/AkCJ54NWFAJiFNrKJQ=
X-Google-Smtp-Source: AGHT+IFJnN+44P/6kI3Vi3znat08kUjPZnFLip3bdnFcT5akCn5z9CQ3kkgTwKRZIufa7kf1G/Q2CA==
X-Received: by 2002:a05:6e02:3601:b0:3dd:b523:7abe with SMTP id e9e14a558f8ab-3de07cee497mr18084105ab.18.1749848520290;
        Fri, 13 Jun 2025 14:02:00 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b44b3sm4996315ab.10.2025.06.13.14.01.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 14:01:59 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] riscv: dts: spacemit: enable the i2c8 adapter
Date: Fri, 13 Jun 2025 16:01:47 -0500
Message-ID: <20250613210150.1468845-5-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613210150.1468845-1-elder@riscstar.com>
References: <20250613210150.1468845-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140200_954184_BDF5138E 
X-CRM114-Status: UNSURE (   9.05  )
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
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 15 +++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi            | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 816ef1bc358ec..f5d454937d300 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -30,6 +30,21 @@ led1 {
 	};
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		status = "okay";
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index 283663647a86f..9d6d4503fe751 100644
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
index c0f8c5fca975d..34e843bd275fa 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -483,6 +483,17 @@ gpio: gpio@d4019000 {
 				      <&pinctrl 3 0 96 32>;
 		};
 
+		i2c8: i2c@d401d800 {
+			compatible = "spacemit,k1-i2c";
+			reg = <0x0 0xd401d800 0x0 0x38>;
+			interrupts = <19>;
+			clocks = <&syscon_apbc CLK_TWSI8>,
+				 <&syscon_apbc CLK_TWSI8_BUS>;
+			clock-names = "func", "bus";
+			clock-frequency = <400000>;
+			status = "disabled";
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
