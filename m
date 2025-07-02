Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B0BC83F09
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 21:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y56WcoUPPG1tcyFwmS2u+2bM7n1/SiEuqod/bBfDWVs=; b=f8+bYpCUZ2LCfd
	sqLFaY2VM/xU08B+YPZNTLp9gNk6lqNiATom6YTr4zimwG6oeHC4u4LNJqfDnD4en5q1JEQ8TVHZ0
	3qweDMgTazU6Zzeu/Gkjw+uB1mwUvkdtlspn3q1mrjO2iXZ7Jfq2mshU4Kfwm9s64AZ7ZwZJxcbCP
	+jKGW8/blbcfzi1zeLCwiOTZLm30AOFMPMKGK1sCq7vmlSMryntPAcHSVhJLlw2EefCd0V/o4vFff
	jE9Y4Na43U/6O6Xpy+NFYS8FNgIhRwex0ih0D7DmhXOGSscuwd6JONHe275Qz49tnd8uonHUICKWG
	AUlvo6clpERkFUeOi3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58m-00000009be0-3BZM;
	Wed, 02 Jul 2025 21:37:16 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX58k-00000009bbp-0A6d
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 21:37:15 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6fd0a91ae98so34493296d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 14:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751492233; x=1752097033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=0x0JBQRsaecWS6rIgY1oo5k29Hk2TIw0j0sWU47bxK3dYwSdyLcD/vGRMrd7HNHN9D
         1ZxTFJL2RKjOHQCGt+FkXI0o3ZlpghlU0T4pNTl4Ehobwc4ezK1MUcmK2cEy1xCOEW1U
         0fb52zbhk+OWksRUZyh8Emmx2PL3dtwbOFpAvpJ7lkRxi/P/7hvw66Britagm+VLxuFN
         EYrLZEXsmM52Ep5ESoHl61kLePS2iTkYIcYYSJKpwP2A7acoTM7jZ3g8SlLMo5D/YiFu
         3e43dbnwmwFvHWnJvhekUXGZ+8ZcojbuZrGze4qI+FEeN7gLzDA7m03qUq+uAgLiKV88
         Ll1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751492233; x=1752097033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=QkSVE+5H4fDdU4gEpkA021uU5G0eTPMtyWR7vc6u4pKF/NFoVBvdjpxa4toC5/z6Y5
         Rj+xq/blkA9H8CF50KRhGK6ctjwIou//V/OAG8oipU8YIFXZWNezZqcqaDp15QYDmYft
         B2IcFHpWXwUSv7jB6l3c+i/JXncKkgfElthnrObGrhPbFlplk6MnsVDFFnNC5qViCoFp
         naD3KMQ3a+0yMz70GlEJ6PNdrNXhI9jwgi8YtFK/TgBHwdYvWWKLuIwyYS4TvUiPH5Cz
         uA/SQWArC0vGZ8nnaNyhgGNZrcjgM6KWVga6WEApOKcYEemzQpgMTzN2432RJpURWThG
         BJGg==
X-Forwarded-Encrypted: i=1; AJvYcCXRexw0iC2wECgxrngybjyquqhTB6zQepKxxEUgQHVr8Q4DmTpnL1lPogFv0T/H+i96R5i1TxTWV7WXSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm9Tt6/K6d+3iWfmXyk06L1/0C/epzgRCDLKZXYlQrHeVt9JgA
	/FNQ2VkO48sihMGAAcbJbqNuqs084hxao7JLO2AZhIumf6xdRZLHmi89WuYs1bwpdA0=
X-Gm-Gg: ASbGncsHQtdVeTGg8zDFLad2NuSGhAplDG7pxCtigLHQJL/70EKr5ENiASLuI/Innsl
	InYSEZt/f+lEetXNMihhkIDlRJP2FRBobdbDRNCXpm2TbH3yZFgGAwckQ5Fl0X5cWTNE/ExEo+r
	0ruOYrKVJgpgqLI4dRef4LPtGacevdyO5nqPLjhRMYVky9MOTly4ry7H0zFk36SVzzNj2p22qzg
	oUNeO28bMPntw1DN2l2k7VJ9oZJbBwYo4grjPa6IJ6OEdjVkt319vysLElpYnVosxyBZBn8kqPd
	SZEB0ILvAagW4plLkWYYizDcrq3JcGaskgrY/OgMeaIs8Sr/OdeE337IWog3ucQQIfXo3pKE0y4
	Y02ntUrT19CURAW3uW4gYm12nzFCplfxwxwE=
X-Google-Smtp-Source: AGHT+IEga/TTtKtehHBWPm0Nxknr/ZXL6aD2Mo+XTk+ksBSlzPaf8YwrBU7H07nYGA5bKsy1lKh2ew==
X-Received: by 2002:ad4:596d:0:b0:6fb:6732:a2c6 with SMTP id 6a1803df08f44-702b17d9115mr52706366d6.12.1751492233254;
        Wed, 02 Jul 2025 14:37:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd771bc01bsm105691746d6.40.2025.07.02.14.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 14:37:12 -0700 (PDT)
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
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/8] riscv: dts: spacemit: enable the i2c8 adapter
Date: Wed,  2 Jul 2025 16:36:55 -0500
Message-ID: <20250702213658.545163-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250702213658.545163-1-elder@riscstar.com>
References: <20250702213658.545163-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_143714_080230_C804DF0B 
X-CRM114-Status: GOOD (  10.17  )
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
