Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1020AC46CC6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xtISpwUDzkTDOyqrrbElLqNIyEunarHom1pZ3zqoh6w=; b=ZqxL0JPqVU5Z0N
	tqrScgHaNdtobTEYtlG8bpBsQE3O6e0Kn5n/gM1y2dqWkRWG8jbj7EUafZIIgjsR+Yi+p9ale4f/2
	agQN7Sy+VhB0LPW9HueMN517fsRi+cYRE+i+H+AFcldc0oq/O39+/5GxbwOByqDJy4+BZtkLwtFte
	Kc96ye+6GuZUa0URJME5aZRZDYUl6ZoD85VCy6IbQ7qMZYp8kSeblAoeFFtnPxBd5yVi/DF9eTq7q
	qbE4taM43XbtN9jGLMxYfztIFCTdOMe/3ElLsidijnF1niPL0M8QQ4VXZgNdHo0QfGlkzjwvVelLd
	Oa5iO5dA8t7LJwOQZf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9Lb-003aId-2D;
	Fri, 15 Dec 2023 14:39:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE9LV-003aEV-1K
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 14:39:23 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 27A783F749
	for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702651160;
	bh=sqnkwNJyx4Y3XZP1ctBo+dwvCXDcRgLVJAObMWMc4no=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=rgEU2+8bHiexwoF/wJDklvHF2ff54gxNGsk3RG68+R/ZrFXJMG1wTv/e2IWFTbTmc
	 pSuEHLWnRgZdLK162TWxS1zGk0As1mgqQtin7FhPnqtILZ3Hhbep5ddZe2zqxs0qDH
	 J0oxZ26l1ZClvVt74ZXKdo6tu/LrWdpJJRTvuGoGuXLhEQwgBH+wQDDoWsmEiQUu/k
	 GUOVaiNa8R2gPsUFIXxkoLlgxZ48/XXbaXZzpkm+tmFIU3Ekxm9sUFt4AVTwNBylNX
	 N0cncReRWnOu/9366sm/oQ5ZRwdULliSOlwMWky/pPQfB0+v5OQFsXSpc6ZcnQEyQ5
	 LQuaKuOTjVkXA==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a19c5cbbe86so46677366b.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 06:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702651159; x=1703255959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sqnkwNJyx4Y3XZP1ctBo+dwvCXDcRgLVJAObMWMc4no=;
        b=Z4mJ3xTnQNsXFTyoC+OV7zLFwIgCHSiBr2P4LhupjsskcSY8Sex5B+sI47sWgzS3qy
         h3VZiFEFBqDVGrkYy+CJQcK8RYrfEg5S9ribJltxJ/zQq9bAO3OsoU/OxuES26J+YI3D
         awvX/JDQ04R1gzhlm7bb50rV/lL3Ytr1fPmZJNj1Nbcid8pHspCj+XamBVmKvOc874Ws
         r8lNgdtoEQxXsgYiwmP2srqEcEUrM+PjW9lF6S/4UVmlnN5EekARJL3b7p3AUZVqyIX+
         w0afpFZb1CCTIobTejANeJyWYAnxbWNq7WKOTMZmwLI1zI1SCSrQNglKRDYI3ZmxEQB0
         m9pg==
X-Gm-Message-State: AOJu0YwLbdBZISD+ir3d0lxRBg1kQyHYmxMuQKdXOuZHK68lZwdQP+8k
	9faAUfZ5RPpJgiTcrkEe3l4DlQuBrghgtip9D0dkhyIQm27jxqzpLiSOcw+2LyTZFkNPFu0otp3
	kLGpeTPVJlOErXjbqD2DTDiZOgDSj0bFsynVWoMOc55wMeA==
X-Received: by 2002:a17:906:2082:b0:a23:105c:4c58 with SMTP id 2-20020a170906208200b00a23105c4c58mr840399ejq.101.1702651159552;
        Fri, 15 Dec 2023 06:39:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdZavjGi1n85oMXyfE7FfrDma/NmyRnykjf5VznoZdUOncAJuIX1TOejqRPUe7VuV7Judxgw==
X-Received: by 2002:a17:906:2082:b0:a23:105c:4c58 with SMTP id 2-20020a170906208200b00a23105c4c58mr840384ejq.101.1702651159359;
        Fri, 15 Dec 2023 06:39:19 -0800 (PST)
Received: from stitch.. ([152.115.213.158])
        by smtp.gmail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm10789122ejc.73.2023.12.15.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Dec 2023 06:39:18 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Hoan Tran <hoan@os.amperecomputing.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v1 8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
Date: Fri, 15 Dec 2023 15:39:06 +0100
Message-Id: <20231215143906.3651122-9-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
References: <20231215143906.3651122-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_063921_586827_81F2047F 
X-CRM114-Status: GOOD (  11.41  )
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
index 54d86aab6656..35585eff6ab3 100644
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
 
@@ -58,6 +95,24 @@ &dmac0 {
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
+			function = "3";
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
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
