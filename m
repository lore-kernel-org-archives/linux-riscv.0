Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94734C48BEB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 08:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPdIHb0vFTmr28qpHV3Lk7NPX6oEa6EAGDHaMy3Oatg=; b=oAUwiFPgmG7tvm
	HJ2hAr+I5HEEJdpM3pIrBpzPMIVu/GY4eFp7XLVRjT1lyPH0pzNrnHrTEQkYDzuiE8roKykhS9+Gx
	qVW87ccItq2eWhFG05usRZg4opCJqI74hcPFVrNAouv+dFAPdZg1R9M0stPjlZ8/iXgCqmHObWpZN
	67HZzti9gm4rPATYw6t4zritCIpzgfTLKbQ0whSWsQPmCtuOWlJBRpOjboWslQ0hoyrNkHIH/yD8Y
	epmXlZ0RHD62aDtOWHTxnwinC0vlLlg2TA+XshEY91d3S+YfvoU3UbTPxOCzg8mLdeD43oZxbP73h
	QxQAFFnANzyPKjPB08kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4CH-00000003wyH-43mt;
	Thu, 22 Feb 2024 08:12:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4CF-00000003wxo-11WY
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 08:12:48 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d746856d85so50564465ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 00:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1708589566; x=1709194366; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71zlVIznaIfi5FluR/+lVnei3BjKa6CskewcKRtvea4=;
        b=Ft57101Rf6IEHxy5lJ/X3MC19NF6evwlELlo4dwOo+LFXKASbcwcd+A2fhfMmoSsJ6
         uHmAyLe9myYj11aSaRM54tvSk7YGOaVy980DryZPPsCvKe093tg6ShRrbqPm6homrWv4
         WgxmSgwPcrtPBt8gMNZjBUsAf/euqCK3R45cLlCXBCouYExcuzPaZ+ElevHKRNeiR2qY
         9f/onBxBeCY1Lr+3TCI9J5zrdsu7zC1eFyWx8R+trIwRnRqptQOrGcgANDTQOdFKsTvQ
         M6nPVP1Zm+e3hiQF77I2+gV9tYIqiQBhdaCEtTGGGEM7Im/mjCWZtNm9LiyGltOE5RGV
         vn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708589566; x=1709194366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71zlVIznaIfi5FluR/+lVnei3BjKa6CskewcKRtvea4=;
        b=gFFpKw1mMfHtndc96s8G6CYPcvwcahHnlLO6sJoeAWhSQCn5fVE3YGEEBBcv6eoW1T
         VQcp38sFqi4VmgYZdx0GczprsXHBV8e12mXafJKhZrATJ4+SNnArMcNYpezTeDLiPyun
         WyZtc2UjljgrKcscOvyhSUY0EYQqSSCB37oO/kqeVpn64kEiishi9nE6SAV315bdcpUv
         TZMIicttSauJVPiWeqZR37Znr9yk/H+/27SysAPO4GMoPLBSAhy7zugBuZaxtm2xJap7
         TmhtatgTvlJYn8tsQt/OhNDxSDGoGR+8kdZLBRr/sj/EMebL+UmDyc0mZ4JzeIL+6H57
         aJCA==
X-Gm-Message-State: AOJu0YyzJGnqTnqU8kmL5gGsLlxA3BZ0Zykl1mEAi9kvobR5sFkjXU4l
	aoOYgU9TzvyNvQ3gk3TdkSyMN7H1jurln/ITSpA4oSxr9jJoVE3haXprH9cGaxafvjFOLRiZoZm
	zADDrkb7iS5Hf8HVowffINJ71QHkTZvCksNgl2lXEETVQYBBEQT0zpNBtS5NGbN1MERYHGDyR2E
	0rps9Sk6YC0sgY9y9SF3rbJbHZcW4oNQvtvqt1SwGiQ1OZNCMY0n8=
X-Google-Smtp-Source: AGHT+IHPAJL6cu7RSH3WE6fAmuaVyPcr1z1aP7UDfSisRlzZCtIioRHasqYMwaX0+k6zz4u5vDTy8Q==
X-Received: by 2002:a17:902:ecc1:b0:1dc:19e:3d9d with SMTP id a1-20020a170902ecc100b001dc019e3d9dmr11278580plh.30.1708589565722;
        Thu, 22 Feb 2024 00:12:45 -0800 (PST)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id lf8-20020a170902fb4800b001db5ea825b2sm9412796plb.123.2024.02.22.00.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:12:45 -0800 (PST)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	conor@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de
Cc: vincent.chen@sifive.com,
	zong.li@sifive.com,
	nylon.chen@sifive.com,
	nylon7717@gmail.com
Subject: [PATCH v9 1/3] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Thu, 22 Feb 2024 16:12:29 +0800
Message-ID: <20240222081231.213406-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240222081231.213406-1-nylon.chen@sifive.com>
References: <20240222081231.213406-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_001247_305263_FA23D80B 
X-CRM114-Status: UNSURE (   8.33  )
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

This removes the active-low properties of the PWM-controlled LEDs in
the HiFive Unmatched device tree.

The reference is hifive-unleashed-a00.pdf[0] and hifive-unmatched-schematics-v3.pdf[1].

Link: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f8698_hifive-unleashed-a00-schematics-1.pdf [0]
Link: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76f4192_hifive-unmatched-schematics-v3.pdf [1]

Co-developed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 12 ++++--------
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
 2 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 900a50526d77..06731b8c7bc3 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -49,32 +49,28 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-d1 {
-			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 0 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d1";
 		};
 
 		led-d2 {
-			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 1 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d2";
 		};
 
 		led-d3 {
-			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 2 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d3";
 		};
 
 		led-d4 {
-			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 3 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d4";
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 07387f9c135c..b328ee80693f 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -51,8 +51,7 @@ led-controller-1 {
 		compatible = "pwm-leds";
 
 		led-d12 {
-			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
+			pwms = <&pwm0 0 7812500 0>;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d12";
@@ -68,20 +67,17 @@ multi-led {
 			label = "d2";
 
 			led-red {
-				pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
+				pwms = <&pwm0 2 7812500 0>;
 				color = <LED_COLOR_ID_RED>;
 			};
 
 			led-green {
-				pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
+				pwms = <&pwm0 1 7812500 0>;
 				color = <LED_COLOR_ID_GREEN>;
 			};
 
 			led-blue {
-				pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
+				pwms = <&pwm0 3 7812500 0>;
 				color = <LED_COLOR_ID_BLUE>;
 			};
 		};
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
