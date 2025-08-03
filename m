Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993DFC87FDB
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Aug 2025 02:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuQygWH0NAZhK+iewdTm59Y+A0nx4FFzi+bxQtWYzw4=; b=OzHVhoPxXjlhXN
	Gu596yofsKiFSL53BgDNw2FytVCgT0qpiQhAbkOnV/1OMWyJsAnHvCaADms4Ba12AH10gUCsAbOzt
	vSpSnOdmfed47tgCslh4KpIlbK8Qspb+ItujOGLV53mi2EY/RougTIkVzUt7wzxDwj/T44bnlyJ84
	Cz0Jit8CS2EaBclhXreRHHLe0iXvR+WFOeCBve8rfH+MKNhY83FgaZKtXCiiQ9yFZXfzVV+mw3gY2
	3py9O19s/AFubgWf7vJLrbIevYQfM9mlmQxzzjOXAdFCKXvBtl+41nqtW2LpsYZmdRoaKKlACPJC2
	7uASPxUMgKcg6YUb27yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOve-000000085Wq-1QZY;
	Sun, 03 Aug 2025 02:58:30 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiOvb-000000085UZ-2kQf
	for linux-riscv@lists.infradead.org;
	Sun, 03 Aug 2025 02:58:28 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-87c28e9e7ddso232921239f.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 Aug 2025 19:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1754189907; x=1754794707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=lN2tyPHAlPjc2hvxtuhsbVmD4oKG/YdRRTR0YyaIr62jitXSn5TdB6tWJUtgNwlCkV
         HqJYYG/RkqaNr0y5U0g2RBX4P2C3EHJli2Zf1Rmds2fuqs/M4W1LSqxa80AR/yTLD8qS
         /RNgYI7f6R6SAd2rTm9t73M+SnV8OOl85MiBcciJjn5DDcHEz6zGIdsNVySrVHcY7e5/
         EpAjDOAa9B8jGSF7L1ivOCBYmFcJp7YbyB7o+7A3XfrjN8NO2179tbPXR0Wx5OU1W/CB
         BUXdFGSMVXg5iiebmRNRyqw7qO6DOTWxETXwQVNhVa8vsAAC530+jJq2CkxdAJJPtYnQ
         m2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754189907; x=1754794707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=BtNqL1LdvFx7e/kZSEV+uK51MslNi69+fm6K9kyKNPRHJBQEJtgowLFbKO7SnqvZx0
         mokfG/7r6vVZpx8oauVx0GNsfqMjlpd0DYKbdjXfZZbTMSydZGueEnShrsKd1P3RopJP
         u1cwh1cIvGV4dTCWF57zoB94PLCcnXvY+hYacXM0j++hD7rW9DrBD3R5iSQRKWqa8Hj6
         09Mtgt71xXm8ZM7P/iYEWicm0/iTV/2rFJE9pySQsQFcllcTpWk9A6JNVFpSDv5ar6pk
         znhdyXPEEuGE+dUKrXJvZXD49jy+yBJid7bAgLVfo8vai9VXC0ijQ3RMOsUZOlc5ETUu
         UXeg==
X-Forwarded-Encrypted: i=1; AJvYcCV1hTMx99tm8H0PqGE93rXFVoGL2+VErTYp3y3k19ZCPy6wJhrejKlzSGvr7YUqqx6EXta4gMOKoSpCLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYXqUlyZbuXA1OvQtkPE1umP9+gRnfeict6BEVEh+H7AxBz2JN
	cF3/0CpDht6UTmDcwFxZB9AvMfUxhwDhDHpyetrJNKFx92E8ih79fNwhEnJ3Lk3fVUg=
X-Gm-Gg: ASbGnctc/JsqW4LN7QHsGNGqQp+oqw6Lf2sugeE0CFd+JuYcdAa1YO/4mmd9wMJvx56
	srHdg7PGLJakOOpZY1vWqISaiEFLorsO5AnXzNinZc6+1atbrCrJsovvPDOe3NtJ52V+OiBNHoB
	vpmVxh2uw1rCBM8m/yTXpfYIMvaLy5chsMSb3+lv/gkQ1xDAEcboI7INn2fubhwqKglEvkNa/Fe
	cTk3Pmlx3POk0pVZ7gmbFY5rxrqUii2Yay3lmhqQa2j38VyR86qY5QRW8G+apA0X3ySvjUP4NvJ
	E/z4ZxrdHpBjVoKGlJH3XehlJ4Ekf3305xgY621/fYPpubj940OCBZlSIbvKG4KHd4HOajgDs/Y
	XbMe13uoeBeH5jFoujwWQE2/qWwPbEebpQNzKGHW92zQ5pELYOaeCBcakZIZC2lKAPQ==
X-Google-Smtp-Source: AGHT+IG1jDuM19c32X7FZiZX2Nxo89FAdD6zwv+Hp+DkMIntJ+DFbyz02dTcR3RcFe7s1nLk4iRizg==
X-Received: by 2002:a05:6602:2292:b0:880:f66f:b896 with SMTP id ca18e2360f4ac-8816839db98mr738100639f.11.1754189906348;
        Sat, 02 Aug 2025 19:58:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50a55b1ac2esm2251906173.1.2025.08.02.19.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 19:58:25 -0700 (PDT)
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
Subject: [PATCH v11 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Sat,  2 Aug 2025 21:58:09 -0500
Message-ID: <20250803025812.373029-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250803025812.373029-1-elder@riscstar.com>
References: <20250803025812.373029-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_195827_697885_863FCED1 
X-CRM114-Status: UNSURE (   9.94  )
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
