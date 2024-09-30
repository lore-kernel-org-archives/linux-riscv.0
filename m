Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E15CEB2C1
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvvYARKwJa2q47f/pSWyEkSe4B+pq+8xxRcIiS0u6gY=; b=dp0yrC9lpn6F78
	IRccmuBJ//lhazEL10g4d/S3zYOg7Ha82hoXJrdtjiMu6doVaJoWGNqNgzOtkpnuFc/gD5eiEyYwn
	JPLloe8hGW6Vj0mJv9+266BOjSfX8g1h4ZTAv3HNhDT4ZHv4Lal2HJoz0mPdjPQHtRG3Lzn/ylMkN
	da/DIdBYfLMU5p/c9zvjbYCCvQfMOp7ZXKkkVYEz1BfChiRN9CHuTY7SFYfSXVhEfpxacHVQir7N6
	zQCWJuaoMj8bNbr4zt/bCNZhiixO52UMuNGiHSxCl9E6s28VnJ2AQ8vWIJJeDY7v/7Ehc2e2DMSVn
	ND9Z8Sy/Qe3m9UgDYvWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svNVS-00000000q9v-1juj;
	Mon, 30 Sep 2024 21:00:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMQN-00000000g5F-2W4v
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 19:52:50 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-718d606726cso3392018b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 12:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727725875; x=1728330675; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZdSF4JqYyS0KQvdy68Lr3bkRoh68PGBl8bGIxtVBZI=;
        b=DnV5ihypYihoP4rjLOjN4PoqohriIiTBIHWoQS2yhn4Aa26rO1XmYBvKJ4B3d/+C20
         zRO+X+j3/7M8gyS0b2dajcLKvCTWyq/q5dyn/DIX3OcnVQawQ7il967Eoj2+1doSENWv
         MY9zMf4YimIv17TS5I+CIjcXriQm27JHP2dc+6afGMwypgJzgA4ZaM75BjFv5a+vlsBq
         6SjobyLNT66L3y1Jlju5YeXGIEDJRHdCNmUgru9XC8Fe1lLb/M898bWDLHGZW5uO9ZdO
         1+9jIfbonrhFCW6d1U2v5uR6aZR5tPTs/ec/NQ8I5n8SqTgWbFEpxd+p/YSY1+HTHBsH
         pRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725875; x=1728330675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZdSF4JqYyS0KQvdy68Lr3bkRoh68PGBl8bGIxtVBZI=;
        b=J4IEag8Qw1fzkspOZBFLOr4mtykjdT/5U6WblAAfbElrooB65HXD/YPNReFv/1pgPP
         plAEqvpsfeqJq9U9MsBmnis0sJ5Moske50+8Jf8LeSJKOF8QznNK0/eFITb7iJmmm8+Y
         Q4khMVgWYsNXfxG0RtLwiNB0/sPUVyth4FSFkvZPk1WOWrjteFiGCoWq1pBNpqR6yLDC
         2d0hxunb5+ScsEjI/jyyLtXgAP5/DcCpj7/pcBEMzBy7djelQXl3+MZZOCi9RGuPqO/w
         N0sDA9QA1jU4ohhWmUwfbu3yRG0ONrzaQU0+mVf9R0GNKoToJiyEyQqRLXycq0KUqEzL
         By7Q==
X-Gm-Message-State: AOJu0YwMeDxMpnTYgkveP4VgalNnj5B8/jI7tc3281fUbHIjCEwoXPO5
	pYkZI50Hj/xfOfcnRTjpSSWmVErxZ9I1dU20V89aLrCVqSbWEzg6/PVRrTAoNs4=
X-Google-Smtp-Source: AGHT+IH1UWn6GR0PSUwjld9YOqDEPEWUiDR7fiim+3Ls/OwdAW7upk1oDC+Mq7kZcHJ6ZqHR7mr4lQ==
X-Received: by 2002:a05:6a00:4b13:b0:70d:1b48:e362 with SMTP id d2e1a72fcca58-71b2607a58fmr18203751b3a.26.1727725874895;
        Mon, 30 Sep 2024 12:51:14 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d4bsm6630213b3a.158.2024.09.30.12.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:51:14 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 12:50:58 -0700
Subject: [PATCH v3 8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
MIME-Version: 1.0
Message-Id: <20240930-th1520-pinctrl-v3-8-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_125115_678881_2B63F544 
X-CRM114-Status: GOOD (  10.07  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add nodes for the 5 user controllable LEDs on the BeagleV Ahead board.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 6c0b768e8d17..5a5888f4eda6 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -7,6 +7,8 @@
 /dts-v1/;
 
 #include "th1520.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "BeagleV Ahead";
@@ -35,7 +37,42 @@ chosen {
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0  0x00000000  0x1 0x00000000>;
+	};
+
+	leds {
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+		compatible = "gpio-leds";
+
+		led-1 {
+			gpios = <&gpio4 8 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led1";
+		};
+
+		led-2 {
+			gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led2";
+		};
+
+		led-3 {
+			gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led3";
+		};
+
+		led-4 {
+			gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led4";
+		};
 
+		led-5 {
+			gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led5";
+		};
 	};
 };
 
@@ -71,6 +108,24 @@ &sdio0 {
 	status = "okay";
 };
 
+&padctrl_aosys {
+	led_pins: led-0 {
+		led-pins {
+			pins = "AUDIO_PA8",  /* GPIO4_8 */
+			       "AUDIO_PA9",  /* GPIO4_9 */
+			       "AUDIO_PA10", /* GPIO4_10 */
+			       "AUDIO_PA11", /* GPIO4_11 */
+			       "AUDIO_PA12"; /* GPIO4_12 */
+			function = "gpio";
+			bias-disable;
+			drive-strength = <3>;
+			input-disable;
+			input-schmitt-disable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &padctrl0_apsys {
 	uart0_pins: uart0-0 {
 		tx-pins {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
