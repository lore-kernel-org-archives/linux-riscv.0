Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3079F3D61E
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWGrYVTcR3Uov1vMOt77QWuj/JLwd1/2KvplffNRAm0=; b=rG552EDRCJR8+o
	lrZIpV1hY19zH/FC1YIcky/HediFd3u2WIg/Z3RwtPASMORgL1uSVmH2ZBXoVBDDOGLTJFXJVZzz3
	Hkz5N/W24HxSN6eBsLhiEeduXzzIl/8TJ4s6FFOlaEkwjf7S777/y4q2VETppVIRU6qZqdL+IBU3B
	sSiCOC8VA1cWZbXGgoyo5YyKnMNYfSMhzZ11881kaxiZzeXgC3gzAY4uRLuZAmwKw8D/rhDTZWoDm
	B7NRxV3HIeF83Utv0Mzcx95CzTyhvoBzyZkRXSQoUKpk8yCg0ehnhaGdR7CmvLjOEDfSy5hPFI8nr
	w4QDxKMzkKKeb05duf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788r-0000000Asxi-3ucY;
	Mon, 30 Mar 2026 08:38:37 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788p-0000000Asuq-2Oj5
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:38:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-486b96760easo45977975e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859914; x=1775464714; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=jLW8+iQwBXRJ8L5P5ly3oSMgoBa7z399H9fhP1+O4CRxWNIk904FOhtvHw8Jz+LSsP
         U4rwI7Pb8trv2rq0GLO/itMdgMCDtVF5U5lCFqs7oXiTzS6kz9LHtMJtbIx8C7MOFe0y
         TxNXaAxn7d0dFgqVoCooUPMjPJRvukgcmPach3qrzWY2KZBvJOfa3LIBxO5jwhxkSXCI
         QCsv8GliOOtMKQT6aL39jpEA2iabo9ii+3FT3shBSInEUXaAdh7XIlM57r0ir8L48Zfs
         QytMyPzgougNvg7JrRCdgNeOqFwgmfVc9Gk5x9LesYXfxrZl8dZZuhZsBCuejjJpjjLt
         ZhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859914; x=1775464714;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MilkKS52ju+/z2QrTRIvbE7nHZSA0fcfW7w+lU+2hFc=;
        b=l63vESF3iqT+XWldjj2ArBPEgn56TpkAXUfk3CKK/uLmCo0CYHmoJPCwEG91VFuWzv
         eT8GiSwhqSEh6ErszPY/Tpx+sfy8bct3/HuXfB6PDG7ucrBHVd2SkmxTz4J+Ow2x8z7e
         zzpQShFV8y1dxHPrt71x0D31ZmJ/eCiXljNLkaHb4eKhInG/0lfqxnk4hNHg4LSbeVIF
         G7LXPFyALNMhPEiJkQdlA12RAGoTWyjF12qV2Lspvlqkd5bzYovmPElKc7oKWjKLA30/
         HpsPXPnuLAokxTKxT3dCw+gFrkpsY+BEZmQCAYb5pYJiN5NjxjdQifmr2UkOrmli3jnp
         MXJw==
X-Forwarded-Encrypted: i=1; AJvYcCWxWwnc4BrQQHAHTaiyrg2RlS4uJFHojiJObXW2sGAzOANol9Z8GY3fttdknr2ck4ZtQrf/RL8SMviGPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvmZfWwscNYhBppx55bl7EWMKQ00b6JMB3bhOUdGWFXfyzXyAh
	Vlxo2S9jowVqN1/2r5KK6z9fkZq/msH/E+xK0S8+9hyLKC6kdYRO9x/J
X-Gm-Gg: ATEYQzxuMwEXe0/GnhqDNNtLdDaw80XZMtNSg0Jf87hnohc2mzi+W2FfQOQ03U7Xed9
	ZJITfC5mVTBMin3aAaEOAFGFiK/WWOOC5Mvp+EdmzfV5pfn9xc8v4ZKLqe1q98HrRuCNmvR27B6
	UUdefzqnwBw61UBPFcZP8Vo/PqLOlC5wyrME9rePIXW0i/MS3+7TBUd8GIXGU0MFR20taB6NsJC
	mK3ZfH+re0fmu5oiDP1IbZb7fkmoCiZ8rFbJorAiCCdTzCoJJMKXYDxPw6Wif2fZWHk+RErqtVc
	r1eaYdFEa7yxfYnQ5LjZWYfOkBtBJvf0M+6s3stms/ozbU7fHDzv8PXJlxAWzfFI5owC/rQaxYK
	Graq37AfObNyiFcApiYIjp5p3+U2nt+09HMSssfxuN7M5ppHQjTajOu1UWxL0XJ0n/M5I7B3mlP
	w7DeKQet03crgkQHRRTDiPJli3lJH3P7nwcD2WXVyyexAcoBG3vU0+A4qsDucOZLlH
X-Received: by 2002:a05:600c:c109:b0:486:f9d0:aac8 with SMTP id 5b1f17b1804b1-48727ec776bmr146972035e9.18.1774859913716;
        Mon, 30 Mar 2026 01:38:33 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:33 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:07 +0200
Subject: [PATCH v5 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
MIME-Version: 1.0
Message-Id: <20260330-orangepi-sd-card-uhs-v5-6-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013835_655251_47EBB197 
X-CRM114-Status: UNSURE (   9.03  )
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

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..9c417a483f6bad6e60617cf8d5400ca079588726 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -92,3 +111,32 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
