Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF13DC00528
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 08:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyS9bAoR8rC8IwRC9MVvGC6UDFWFxQcs+SkTKTKxDfQ=; b=lGuy1TUq63eWiV
	f5QpyVxFcAGn16JC9sTkNfnfTYT1g/21eJUf3sZDrrS/NylgG2y21hQ/S0khLo0FF1gTnay1v0Hkt
	TSG8ViXThsaUR6phHFc3fYChhWMkxX/Tit5iAX/xhV7YBZeo/NX07p5ZjY2r0OUA4ay4rZG0JH2OF
	LBA++Cfbjyhiw4x3/PnZB0qlqblqcBQyHRHiQl6l7v8sZepgivgjPO1AvYHm1J2EugcXQejqDxf3M
	i9qO+Nwh8wmnvpglu/trS3lTh/cDwWfjYhNYXHLWKzCoV1sGUnNwJJWcXnFJKpp53oKrIbLEpJDg2
	NE7Dz69rG5WIh/CAGzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRU9X-0075gX-16;
	Thu, 03 Aug 2023 08:57:51 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRU9U-0075fa-1g
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 08:57:50 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3a76d882080so148634b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 01:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691053067; x=1691657867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8jNn+NP9j7pIA4Gvr3RjVfWCo1xNEk9xbLxp+U9DEU=;
        b=dUCjuE/YmR0/8JPJZVzOLMSntUMrvBHBGDA65WMxmJlES6nUM2VmooTuiNK1OE1tzU
         OGO7KiY7VKkwRh1umpSTkMAtVnIx+K2N4ppj7+D3/SiDMMZnvXnwMzMq+shLT9uFC+ye
         5X27QK9DK2d49JR1JJUZFRL4LKEupHJrs3tD9Ea8tvc1cuysV9juAhWG/b5dcz75o7t2
         +aJ7K/AscsGiLN9vgISi/Ow02ITDPLV/njd6G8MUDlJsoPDl8Yx/ckP07QKMYG11AnHk
         MtqjIJbDVWa06b4Z4DDW+xgCuHWdjnGzIYq5VyfTGu6UMZcBSJnOqbCPK8XaFElkD21W
         QVvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691053067; x=1691657867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B8jNn+NP9j7pIA4Gvr3RjVfWCo1xNEk9xbLxp+U9DEU=;
        b=aE43IAFiUNszvasYCn8pIcRrEDrgHdxm+jZxzIlam4pqsIT4Pz18v3jvDMscYnTTSy
         GB9CQowzFK+mqDL217dNQl95zn2S6JAg7Kzljz138s1vbPV3tcC4yCcuVvUjDgvhDber
         Ec2Up9pukZp/anB4mEt4762Yu5NlKR1gW+KFuAGnDB0kDvnc9DKjWaRDYOLEkDTLFDX/
         B2mr6eYWrfnZh5QWooN9gcedL28tcFUbBNlEMFYOeExzD3JpHgbvjZpFl6yQkqn5VHYL
         F4tEN0nTBi9NnWDXC7U6sUGy/HgDnT6nA+G4I8WqWwmxbz8dspXK7Omw6/WX1Ev5juGZ
         1XvA==
X-Gm-Message-State: ABy/qLb1zk3I8WKi5RZthmbB2DJXEqCWDSui9jwF3AqO5qTvnd6dE2Ej
	X9n2/F46q8lz9/+K9/K2zEnT5Q==
X-Google-Smtp-Source: APBJJlHYkyaQstJnkzI/nrMEdCFBI7JwgG/Clj2L5mYZWErvDAJf7HkkrBz83mlUGVdkJrUB3++vPw==
X-Received: by 2002:a05:6358:5e0a:b0:133:a8e:6feb with SMTP id q10-20020a0563585e0a00b001330a8e6febmr8982344rwn.12.1691053067366;
        Thu, 03 Aug 2023 01:57:47 -0700 (PDT)
Received: from hsinchu15.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id i6-20020a633c46000000b0056334a7b9b2sm12941735pgn.33.2023.08.03.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 01:57:47 -0700 (PDT)
From: Nylon Chen <nylon.chen@sifive.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	geert+renesas@glider.be,
	pavel@ucw.cz,
	vincent.chen@sifive.com,
	nylon.chen@sifive.com,
	emil.renner.berthing@canonical.com,
	aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	conor@kernel.org,
	zong.li@sifive.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/1] riscv: dts: sifive: unleashed/unmatched: Remove PWM controlled LED's active-low properties
Date: Thu,  3 Aug 2023 16:57:34 +0800
Message-Id: <20230803085734.340-2-nylon.chen@sifive.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230803085734.340-1-nylon.chen@sifive.com>
References: <20230803085734.340-1-nylon.chen@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_015748_577920_1F9C3703 
X-CRM114-Status: UNSURE (   8.90  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
---
 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 4 ----
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index 900a50526d77..7a9f336a391c 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -50,7 +50,6 @@ led-controller {
 
 		led-d1 {
 			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d1";
@@ -58,7 +57,6 @@ led-d1 {
 
 		led-d2 {
 			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d2";
@@ -66,7 +64,6 @@ led-d2 {
 
 		led-d3 {
 			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d3";
@@ -74,7 +71,6 @@ led-d3 {
 
 		led-d4 {
 			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d4";
diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index 07387f9c135c..11f08a545ee6 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -52,7 +52,6 @@ led-controller-1 {
 
 		led-d12 {
 			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
-			active-low;
 			color = <LED_COLOR_ID_GREEN>;
 			max-brightness = <255>;
 			label = "d12";
@@ -69,19 +68,16 @@ multi-led {
 
 			led-red {
 				pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
 				color = <LED_COLOR_ID_RED>;
 			};
 
 			led-green {
 				pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
 				color = <LED_COLOR_ID_GREEN>;
 			};
 
 			led-blue {
 				pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
-				active-low;
 				color = <LED_COLOR_ID_BLUE>;
 			};
 		};
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
