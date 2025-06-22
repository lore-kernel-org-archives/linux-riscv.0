Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B418BC7115C
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 03:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y56WcoUPPG1tcyFwmS2u+2bM7n1/SiEuqod/bBfDWVs=; b=D/q6g2PiaQE+sz
	kZ6qOBjPwAyNUGDhyogQkV9i9chGjXvW8M1dsqh+E1Oq0oXJfsStYhlO2FgGa89mqH5eq13N7yWq1
	swE76Cs/fc+V4SsH/qternHDG8BIGWVIX2AjB5Jg1LYwd47tCOKWqysEG0kXYixS1goN38wzTIDr2
	NxfDtqkthDuCf2VblRMRvCQmOwki6yuxmY6XpIgyzlBHvV9AaPQbDa3CFgy4iESHd7vHmClxZzyu1
	c1CXzPk06NT7Uci9dY5aWt75Qs++SfaqNU2gwJqfMf5/AcLGl3Ead0yq5bkVMt3XHfuPPI/Ya/5rB
	XDRwXIDEXudl884ASwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBP3-00000000Tj7-45ka;
	Sun, 22 Jun 2025 03:29:57 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTBOz-00000000ThK-2dsd
	for linux-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 03:29:54 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6fad3400ea3so31139176d6.0
        for <linux-riscv@lists.infradead.org>; Sat, 21 Jun 2025 20:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750562993; x=1751167793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=VtfjNSPgsdyjCmCp434gHANH0GXiPZ1dxcZCam16AbYo7Y+r+y8lbvFZE3tMxlv09k
         SVBWSKa3yeq+BeI8vMczgQg+9VIEuObTVnH5Ppfck5gN2oNXq8NDd3za/C/yBUJSB8iT
         KJ1rtBWpzq9y9SyTsulREHghSxhrJSrWYObOeJqwfZIPP53i9JkAPuV9S8gW6kR+JaGl
         51AHa5qZWMkMU6lBSho5x+P4TFd6oThnrnfuv43LGBir9bhYGSuX0+DIDfJyjkyacgjF
         Pm8BJgw9AD1Gbp2VB24I822+mePZ1Gz6xobEilVzglTlRdlza9EkX0VAK/hjgLQpaSWb
         SUPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750562993; x=1751167793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=g9Tg5bhROroGk6eyRJnKbdVJvxsO7sfInLmD2bhlcYB4Uvsbzeeq2A/An0FSytbqss
         fjec2Hk2urYBHsFHg8J/J0tsg7gzUomwkEVKhN3KGrOE/DS5OA5L1usdX3CWXBSvfdp5
         bor4zHG1Cr/VfQJmqfZxt0hKaHI0aFWtnJf6b3Y2NmubBuGa3z2EZy/tGj3wxO0G6i4r
         0fMZFLkEcmRPe73tURFpuQIpN3G7YYsVtk6o3J7/Pdhb+FvmTMtSc2Lzmv/oanA7Hcw5
         5yhdTVSFTqVkUNcAavsu1+TNf+uvqJ7Ic/Iv3iMOAEwiaeaHiZglIFgrzx2oCn1n5hCE
         wcmg==
X-Forwarded-Encrypted: i=1; AJvYcCVgLs7U/Ofa8SKSn8KYeHPHgPNJPKeStp4QbpPzMFnIRTT7kdTFj5sTUl3VKCUQVAyhpZXPhFJz1sXUfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7M4vunrYkd7Ad7J1UESCf+MYDdeXOk+tdR8tJD3zvNg6U8J4V
	6nw8Lofr3jwuZoecbS7CkQ41c3aixn8Qa8mOOttfemDEiNBwKEsOuv1rq5NuJTjIphE=
X-Gm-Gg: ASbGnctAH3Vu5PvbJr19rUKe7MkHxxncDrtbzVhzVCk/wcB5bKq+rMPNq1NwGpg78MC
	VpZtymby4qooT9uQzNaysvPPl1UUdauDhSQxr1e1mCWaVi6DMLNAtT+JSWLjCx3wywb2KzRg6jh
	1apzB5Ohdi3hDl9EGOvM9/sZTb/HtcnJ91gO2M2WNhWcUf8sVR871Lw1Cn+blkJJiyTMIfxOfBL
	QtVPILQFd27NPfxbXRG9jtVhzozGZ4QumtftkPqv6ZMDP6FA/fT95yXLQagP0YiEZApcYQX5FhI
	7GwlJ6LdWxhWz364O6Ax/vK/2gYA9nSxPG72hjZ8I4+FyTNfItCkUQG5p+LOIhcDxfVMrRUmhZK
	HzFFV74cemttaJBAlRV2dgArzKpRKb1VvsVPiJW9SQY65wg==
X-Google-Smtp-Source: AGHT+IEZ9RQ3qooYvQegxhYJwv4FcXekxCuxqEkQ4IfzYRI0IXuLRFYbafB1Ip22u1/MKqba1/A0aQ==
X-Received: by 2002:a05:6214:5413:b0:6fb:4c6d:d4d9 with SMTP id 6a1803df08f44-6fd0a46841emr132548106d6.13.1750562992722;
        Sat, 21 Jun 2025 20:29:52 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd0945183dsm30014526d6.44.2025.06.21.20.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 20:29:52 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	alexandre.belloni@bootlin.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	wangruikang@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Sat, 21 Jun 2025 22:29:37 -0500
Message-ID: <20250622032941.3768912-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250622032941.3768912-1-elder@riscstar.com>
References: <20250622032941.3768912-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_202953_663545_36581241 
X-CRM114-Status: UNSURE (   8.87  )
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
index fe22c747c5012..7c9f91c88e01a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -40,6 +40,21 @@ &emmc {
 	status = "okay";
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
index 14097f1f6f447..a85239e8e430b 100644
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
