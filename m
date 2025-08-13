Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B382CA0EE7
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 02:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fuQygWH0NAZhK+iewdTm59Y+A0nx4FFzi+bxQtWYzw4=; b=NCxQEXLoOCpDUr
	W0akbhUUBoK/bMyZqYnQyLIGTof4KVaoOkHbEey/JZOKqcEUT8/PldAziub0z7aPghWe2lG+qlzxG
	F2SGb4qf+2jJwr+3aqmsx170rbVjaoKuliB7oB+0B07cmvCiYvnxaIyRgP2bOkD4efDlk4beOvac3
	9Kc9mhr6vdWTLicrxf8ID99mPcQbpWUKi4diJxARBAGcls9qcfrxSFB+yCvpX09NlXX4pGlc9rSvZ
	K1vXSIdF+0b41lBZsdmv4p/ScRIOYuhKByRKopAUNWify3gcfn4qbbmR/uk2f3vyq3ML4wkPQcy2o
	CLmeyQWAT3FcrKKPHybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1Wz-0000000CRIw-0AxK;
	Wed, 13 Aug 2025 02:48:01 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1US-0000000CQiR-03T0
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 02:45:25 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3e5477e8effso14620715ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 19:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053123; x=1755657923; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=b38jM9myJpIS21DZDudb4rq5S65NMMxZrzFGGfU9xab/mhAiQ2BoiTMCxb+M4HDmoO
         N0kVWmgL1ZYyl4Mqi0wMtnMKN6BtR6eaoCFDaC92jAV8D/KH41L7Rw8awJj1VJ3AT6Gk
         ZeHKbL8E8xicP4rgBON8PDYVusFtuZ+lG1JyiNKlL1NEkvr7g2XUHLfdCGjveWSTNXp6
         3/Oxgxo+TDJo3ILwUUyfu3CD4futDZwWOB31kpVOq91pbr3rasRJlfHfbUHoDZ4/qCf8
         x5hB3f70QQwyjkAfpFbQraiIQCmlsdb82wqkNDnQsVJEjNjw0ujG2HU/8C9LMNkaKNNA
         5sZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053123; x=1755657923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A4wudv5OTn00PNZ8isBITe1KCx3hdy2uajB+8N6UIZI=;
        b=NmQjvnuqvK9chshJ/B6sEAum5RypFEVggDEV5s1MH1e5mLecd2NEH4wvamo/Lfp4ff
         XUkxrcTTUfaAJRfw4czC4f/JLO1Qtmz/VWZNN/f22RkAgmP5cXtP1ra4yjyv1Y0zCrZR
         W4mt6NYTpAie9UVF8MnJh4gxHIfrhug1k25F2xeD83K4E1NLZUzTzG4bFUII0b27Owsp
         FTsc+5hqbeBZa/gt60+LkJKXNMLRARuIvrHmZ+sMrEIg5lLsueXzvoTOPhY49r5yB0OO
         OsA+7zp4NdotLvSMzup0GFx1D2n6BxSOzBPel9cr5MMeZYTtlmT/gSbWwusQ1Z/98/dn
         vPXA==
X-Forwarded-Encrypted: i=1; AJvYcCVlPGi+7836Cj8Z+ba8jOXxVJAMMsPWJbTRtSo37tiuPAdjguyYNRMUQh5/oh4mFVxZ4ambjqzVpjbq8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YztjCJ7SYuMpH9xJEIi6povIOlgRbfCdgc4ZkCiGwz04q+cbbuX
	CBKeVefQUuOR94iFSb2eKGe4tmd+RiVOv6ucnw7i77vzgit6TS35jARox1RXUoJFEfU=
X-Gm-Gg: ASbGncvRVr7++Fj4syUaVPshk1heTTDj6PUaLifnsMQ3FVTEdWvcFCUOwtdzeHTfbA1
	eBDtlj4mefWXvCxZsl3iLl1oqMHLBIhMdsxQvt2x1+ABCABYR95iUQSyImvFWFAAzYhXOd6X4vG
	3AU7tQuJYTYxizA8b2apThuA62VPkjpepUuuH4ulowIXoWIUQC/gLynlnDNaC1tVbge4aMOZwUF
	u8sLhs0wTm/DlSoxJdy8lLxOUo3Kx43XFp2I/MbaYicC6h31k2bG+pKihEa4+c1aMDeGydrDYXO
	FMBSGkXnuP1JZQamU0R7HEAPwdlM2pmopisbl/ltePvEhSr39Usr6/d3GN7R7szOWXNGXGJotRC
	36iMDCiYsMzKzwhR2UfA4ftXuvxuOAB/ij3e+2orpAxLKXJ69XYeBe6ym6jW1gwypKQ==
X-Google-Smtp-Source: AGHT+IHNbGkypv04NReHT7LS3KpLc44/pbzlP8yxnO8gc+9CBy6bawzkc+ztCNL8hpgqnMvaPSvV6A==
X-Received: by 2002:a05:6e02:154d:b0:3e5:5357:6df3 with SMTP id e9e14a558f8ab-3e56738b0e7mr29089105ab.8.1755053123016;
        Tue, 12 Aug 2025 19:45:23 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:22 -0700 (PDT)
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
Subject: [PATCH v12 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Tue, 12 Aug 2025 21:45:06 -0500
Message-ID: <20250813024509.2325988-6-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_194524_052745_B401B5AE 
X-CRM114-Status: GOOD (  10.34  )
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
