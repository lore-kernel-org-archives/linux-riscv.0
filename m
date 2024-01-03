Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38537C47074
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W1gAJpRHnPuKq6ipE67ieSi3pKySBLBh/7bEQz6NZgU=; b=QUdM1JQLEHynHq
	eVMBAjImf//O8H6ZTzhAH2p/3QFuomlukysBfKP9bA7PrZOIoUXKOT0Y3Nl/tWy9AZ4RGkl48ym43
	kRhi+Y+OCnwiwtyMUxITD50Drvu4Al2XarmZ+8dxbKHwpDUTkmuuxdP24RjQ9k8Wa/sgVZkBZ2tRG
	0B5yhOPf+/EcWgWPMvhin8vXqjUIJKo5DgnkxM1JbD/kdXa1gnFrsfHU7vyCJb/H/FvFQs1/33EtM
	7GqnRht5X8W9JoHRb5aNdRf4FY3I6gN3+k7saJfzXUcUERXyHcFbLhEwydRy8aPW5BFfLXIvvKWMB
	bhO+Cyw0+5NUsdVMuO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1JH-00AwnB-2q;
	Wed, 03 Jan 2024 13:29:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1J9-00AwgP-26
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 13:29:25 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id BF25F3FB53
	for <linux-riscv@lists.infradead.org>; Wed,  3 Jan 2024 13:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1704288548;
	bh=j8polI0w/bjJ8tZqB1jGYw0XXYsOmvLZx8MNesRoCUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=h1JDRAVItzlZIT89xgdqRPFEH8rFLvas+JajMuJDX2CFh26uJ8xZaAfJEejzggVlf
	 pUzbyAU99xkILojsL/Pl+53bYztzsItx4WfZvgKWPh+s1D53WpI3Wq0fG4TDwGt8Ey
	 YqzSRUAak445oBbrRrxrXB0pf2N/Ktn4vtt+kjXc2AY3/zuWjYchSBIekAI1X1/fiK
	 SoejP+MsHet3oNoQuZBiKTCdTXWrUFcxSGEFdppXAk4th7oKC99MPv8y61JijA6ccu
	 sLbpKFKbXv5hifCnUCRYZvJK6hWug2aoETTy6/itV05O+Qfb0jtBvBAEj0vETZ/Mhl
	 sXDzopP8Z5W9A==
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2cccdcfea74so53207191fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 05:29:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704288542; x=1704893342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j8polI0w/bjJ8tZqB1jGYw0XXYsOmvLZx8MNesRoCUY=;
        b=ft73D2PrJK5YAb5ldejsExltDC/HpTog4+RC6TUOMVzcJ9/VfJTdEX1CGk6m0rUTrz
         E1mFmF1PRW94FhkxdYghOTZnf5gBxn3gyCowCM6eZijyeRAN/2mIKKUIabTrBeAW+lBl
         vz9pTbE7jbemv+IC+0xOTx8g509jctaBwJ/ku2LMreIiZGLTn7B6vYBcIXF/xrYKkXEj
         H1uQfByXNJbZ0CVWQiQpNwLqp+iJJ8zF0iWaVjlfQz7/FrkCBPm1JN6F4S0AtplemC3S
         Sx/r3wiV79FhYnEunRlzuDj2lFoaxDWVrJWPE+O+1UDB8XuEe1bly1LCMyZ1cQA4BgBY
         GmOQ==
X-Gm-Message-State: AOJu0YzEFQb4X/SMLJjbh5j9gW3L1Vs+E0KEMQ2Gst2JmtTgQaOeNzt0
	MTLbFBLTZ3AdEXTZiGWuIngrQDRUnMiIisV8I6pcfOAiYayZHhSHFiQdfNTAVWTu3THJ4vQsJlQ
	34gJhykY0uFKdm/r5btUxKeM58H5YFg0kgOhGyhP8uiBtn7ppLfDw
X-Received: by 2002:a05:6512:1145:b0:50e:3767:d381 with SMTP id m5-20020a056512114500b0050e3767d381mr7432119lfg.139.1704288541956;
        Wed, 03 Jan 2024 05:29:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJt4/P/j0GlWbqbKebsvHvV6+jrN2+ONRLeoH23443/k+kOFBIdKz9RoGU2lF8BDUFzg5rrQ==
X-Received: by 2002:a05:6512:1145:b0:50e:3767:d381 with SMTP id m5-20020a056512114500b0050e3767d381mr7432116lfg.139.1704288541775;
        Wed, 03 Jan 2024 05:29:01 -0800 (PST)
Received: from stitch.. ([2a01:4262:1ab:c:5af0:999b:bb78:7614])
        by smtp.gmail.com with ESMTPSA id eu18-20020a170907299200b00a26e53be089sm9549873ejc.44.2024.01.03.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 05:29:01 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2 8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
Date: Wed,  3 Jan 2024 14:28:45 +0100
Message-ID: <20240103132852.298964-9-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_052921_529721_AF6A4055 
X-CRM114-Status: GOOD (  11.58  )
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

Add nodes for the 5 user controllable LEDs on the BeagleV Ahead board.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/thead/th1520-beaglev-ahead.dts   | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index c697a50ca9b1..0b309c770202 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -7,6 +7,8 @@
 /dts-v1/;
 
 #include "th1520.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
 
 / {
 	model = "BeagleV Ahead";
@@ -34,7 +36,42 @@ chosen {
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0  0x00000000  0x1 0x00000000>;
+	};
 
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
+
+		led-5 {
+			gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led5";
+		};
 	};
 };
 
@@ -62,6 +99,24 @@ &dmac0 {
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
