Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04436C8300F
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 14:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y56WcoUPPG1tcyFwmS2u+2bM7n1/SiEuqod/bBfDWVs=; b=wNP4ZZ8zS6psrP
	17e4RfJreYczm9BsE7piQ0tJ/HY4Z6oWa4QyKfmcxlVj5UYaL1xtzeqSQ4sBnEsp490jT2sl3TvAf
	cS1jkl0yuT3uh6Re5eH/LNjQhXLYHmUXUHlFqTiW8qQSPHy2O9erK+1Q5lDt72PTxi+tf1ZQg2xhJ
	1xzoA+ZLdXTuPBINQ2hp0V8Vzkfbuq0BWAB5BxA4yGOZm6N6IUI5z3P9AaWeSKsSB2sLo/GGgbh5J
	9UbpLi7u3hrvYOR3D7X6f9y/Ucse3BTzRwo/r2vb+xlz+6cqOtEyLt6+MeDRCB7sI2xi/JSDns09A
	RgNBzZWl2RPfCXWuaIBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUncu-0000000BvgT-1BKD;
	Thu, 26 Jun 2025 14:30:56 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnR2-0000000BtS6-3qgD
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 14:18:42 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a44b0ed780so15340501cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 07:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750947520; x=1751552320; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=fbmoqTM7ptGcfsPkoEuaIkfeD7HwWExo9Vmw/YxPjV7u/0vtkPQ1jZIQKPr18zy5kT
         /YCRT7PLa3FvgE2CNp/FL9UdLMq17OhUmMJWhvq1vDrOssN3fdkKHCE3MGQLB1su7Yo7
         EkiARQBEDeF+N3HTW5/AtsqTyvZqs0ka8rmMLqPFD96MdfDTsG8IE/p7Zn/JoGlbj7zE
         Vdf5kdyzsz8RfEmoNs15eR+cFFEnzb1oAzMXkjbM67DvuhrwL6bs7GwToG8Mf8BjkF7m
         9Zc7OpchDF4i4VBSHjn9yTysLwgU8KmZAvHSb+IKcyP2TeVh2obu6rkF59g/eIilOtid
         GH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750947520; x=1751552320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWnze/SjFdW+lfNDCsnEitBUx1r5ZcEMc14OReZ/axQ=;
        b=FbPa9TRC71QVJKQue/fIWZ8YSA12WP0jHuxv1/ur5g//hJ2Yk65UhPHt1eajMwonZ9
         b8pDtJcmFkZ1LOHe5MT4JUliQoUBShkuR00fliNpLbS9f1if1Xb6VW+8gNlRNBFrr7Wn
         Wn4GlRMOuxtjZzexz+XiMkzAtdKaMOx/GfwzAMfsnEYXOR2ou3gA3w6uxVv2F8U2b+VY
         UKr51gH1HK5UX0FaIynKXpY6gNFpz4YGUjOsrXNyrQuFDOfDQCpL5QGTKeYSETG80Ese
         Kyj4q4XsKQQTB5nHGVG/WdsAKTFWTcLmnN7O4hEj+l5VbWlIa6NPU79+M39mS23uoSlZ
         JzGg==
X-Forwarded-Encrypted: i=1; AJvYcCUboRX6o3Zc3cjHN9iQGoE/ONM8oV3+1V7PhGr15F1m2oYYSrL34KMP1Skg9gqTVWoSveP/hci4A/SP1g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7ZyYc8kUPDuENqGgdsrZeV36HthKxjN7LZ3O9Sx0Ge5LOsMnl
	d/2Br2JZJ2sdRil06zKVr/T2a28aLGT4FppC7q/KGOB8ta6MnMwXwULDOZN628VhEV0=
X-Gm-Gg: ASbGncsFMBWAkSIrMNpkZstgZgVIPmuWu5hGIHcZycpX+zKC41SG0pfKHOBxrSO64k0
	nahkRKoR+XM4K5T1DOhRy5orGvMhzYluyd1R4PtnSRhDpodfy2WVO/GanEWFTzl0ucoAyI/2YDv
	EwgGuoWWNiwXRZAQ3bMmLD1vo4am3lQWxoAuDnHcFJuZGCeRakyTW4twvLQqKnjmBR30oNzCmmp
	aH/8pACzKipQwPZ7s4o4808351kEcc0fFWOm9J2cbY4/zYrtsxpX/Kf+BtAOlIlXruk6RhU9O56
	kDcM4xaRZh9UlgLtd0YpE6rueS/NGsFufuRQzbA0EDco4S1O+qwaHCEfbpVFAViWPp6LlKCnG3g
	75Vajs8zfXikTsuwlvkcK7UFYvu2P65goYJ8=
X-Google-Smtp-Source: AGHT+IEI1vvxdVVtw24k3xjXm86y1FoYzkQAxQf+2Rv/Yd19jGEMG9C5oqEg531N9y5/GIYuWd0Wqg==
X-Received: by 2002:ac8:5ad4:0:b0:4a7:234b:222 with SMTP id d75a77b69052e-4a7f3e88976mr49122961cf.22.1750947519837;
        Thu, 26 Jun 2025 07:18:39 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779d6df17sm70266101cf.30.2025.06.26.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:18:39 -0700 (PDT)
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
Subject: [PATCH v5 5/7] riscv: dts: spacemit: enable the i2c8 adapter
Date: Thu, 26 Jun 2025 09:18:24 -0500
Message-ID: <20250626141827.1140403-6-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250626141827.1140403-1-elder@riscstar.com>
References: <20250626141827.1140403-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_071840_946645_7D44B90D 
X-CRM114-Status: UNSURE (   9.52  )
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
