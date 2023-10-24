Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12C3C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p12ECkeaLp7W8GdQpTxF5YiMvtT471vwfFzP2YZidnc=; b=dvr284PvHl939V
	o6kpXCM08M8BXYcWfmgzu7PjXX8K1BgnsTJVtzjzjZcqmmQwHU9kMqSMGAMqd7PyVWaAwQWGMYoXd
	BZ/MZussLLF+s1o5bd0IzRlwNw/rwzq9xBISGECLs/bfAG/WKo06i8FS3yJ/LJ4D61LHZi9LFdBEm
	kpiBYr7FpDFBU/ijzhaMtSZoqFom7mowipFosszpsIDd4Y6z53OkIH9luwlOs8v/CElo5X3Sqw5we
	EfwzPi0H3EBscA6cuJYqzoHGFcxq3kENreHFyjgE9t9nC+hKpKMo9R1rTd/pcZy1xehNVwkhM4qpv
	lti7XjjrfNiMefzoDdCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvEVK-009QcM-2b;
	Tue, 24 Oct 2023 10:19:18 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvEVH-009QZA-2m
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 10:19:17 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-694ed847889so3562063b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Oct 2023 03:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698142754; x=1698747554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EJwUL7fMCKImWXLzNFL9tTBWmaxZdYaUnJ/ideRiHA=;
        b=N3fwfpcbYgsxdAWTkmTuYaaGj5V1mpMQcwlC1UIZAn1j1zI62L44auujmzWNtNfRA8
         tQEzzkdzHArhzlBDASn6Pe+S7/R25cseNKsnCzw5mD+Fi+G3edqQ+kRulaZ2B2qEgyty
         rvQdjbkNYn0TADBBExnQEXC6/YO+SRp16kwLLpWbL/6i8GhE00RIs1mCZ1n0bNocvK71
         JG6IcVb4CiZy9tL2Ic5ePv5QREnvE2/3J63KxbpV/Ogr2yW4d9slU1El+S9VU5jWT/Eb
         Kq0NrX4iFfJaUqzM0FhHfHMGOD4q56zmqsol3F/QaAmOQpZ5kXxgahkCCIWoQWCz/jBb
         tQ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698142754; x=1698747554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1EJwUL7fMCKImWXLzNFL9tTBWmaxZdYaUnJ/ideRiHA=;
        b=xBKk/X0BkbfKzlWynzxKgaSusreZZAFx+pZILTIe8FVUHwvRQkp5vnW1zmGNwVKx9E
         loYeVmRlyBOp2J5JDN8RbLKRTjOxtmDoeZ6boMZ3X5ZRiswpPAXR4d19vhb82oltR6X+
         3L/cw4iCg4wKuiGt7FEwgc6Ecz3gIBRlCsY4ZNi2nvcjshPmifXMZ5vyarDsdW9Xi/t1
         3fwx9Hos1BgCzxaDjW0faPwWFxDHbnEYuVnRa2uINHknQLDW7/9ILx/IXitOGn8NtY6Q
         ntmUzottsW+2VTUm51tRHziz3nZjrJtYMItGpD2OaVklOpZ/R0Jt4ZjJ9V2Ibn3sRWWx
         yDDQ==
X-Gm-Message-State: AOJu0YwJa2CrIkfgLl/bY1rHN2XREW0dCdcCLRIEZ1cwJX2OhbhkWM24
	Drd+zHny4l/9kkhqIHIxQgKcOA==
X-Google-Smtp-Source: AGHT+IGn0n8dz73CI6AtHoQrYIxfI7c9vkLAlzZ9pWxQTrLebZhEJz9sMQ+fmlRVn56oH2AE68HepQ==
X-Received: by 2002:aa7:8bcf:0:b0:68e:36b1:3d7f with SMTP id s15-20020aa78bcf000000b0068e36b13d7fmr9509301pfd.18.1698142753930;
        Tue, 24 Oct 2023 03:19:13 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id u202-20020a6279d3000000b006b3dc56c944sm7708372pfc.133.2023.10.24.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 03:19:13 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	emil.renner.berthing@canonical.com,
	vincent.chen@sifive.com
Cc: nylon.chen@sifive.com,
	greentime.hu@sifive.com,
	zong.li@sifive.com,
	nylon7717@gmail.com
Subject: [v5 1/2] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Tue, 24 Oct 2023 18:19:01 +0800
Message-ID: <20231024101902.6689-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231024101902.6689-1-nylon.chen@sifive.com>
References: <20231024101902.6689-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_031915_903861_7D38FEFA 
X-CRM114-Status: UNSURE (   8.89  )
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

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 900a50526d77..11e7ac1c54bb 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -49,7 +49,7 @@ led-controller {
 		compatible = "pwm-leds";
 
 		led-d1 {
-			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
+			pwms = <&pwm0 0 7812500 0>;
 			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
@@ -57,7 +57,7 @@ led-d1 {
 		};
 
 		led-d2 {
-			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
+			pwms = <&pwm0 1 7812500 0>;
 			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
@@ -65,7 +65,7 @@ led-d2 {
 		};
 
 		led-d3 {
-			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
+			pwms = <&pwm0 2 7812500 0>;
 			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
@@ -73,7 +73,7 @@ led-d3 {
 		};
 
 		led-d4 {
-			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
+			pwms = <&pwm0 3 7812500 0>;
 			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
