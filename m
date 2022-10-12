Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77473C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 11:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TOAUHue/YtMewLkJXpy3q0f+upQkXno9ZIVt6sohNZY=; b=Nrqk0SdV/jRQ3b
	wDSm4TR7JLF9PiXnm5+g3wqUYg4JTuTErcUAwBthb6ELeDrOytcdhVc6zTVzGrCofYj8Ku7Wviqxu
	csRCN4uBAnrIDpVec+/dAxEijI4AnyU4GMgJ2CTpydFVO0sZhdfjknSZsbsMRDB5IM/Qdu6IhgViR
	E+3j8GJk8K/IIVJd2MW6rXhhlAwryVmAt5lpBpSrmMUdLXYZ0CS2BaeKPFZj71N16R3uAigDkKBew
	Y1i7PXJoq9abgYHlD7K0eOuPguawxlCMWp3hvh4tXGtZlHxH78LzYD7KVQUgm7Xad2Kd25UT95629
	Uo6DEAqfgAzSOSSJbq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZcL-007nAi-Mw; Wed, 12 Oct 2022 11:09:41 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiZcH-007n9i-Te
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 11:09:40 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C0F453F482
	for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 11:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1665572970;
	bh=fc0TPfCo+ClitIo96MsU8YKIJ7fVwtsiPqV5IcK9L04=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=MJPduzQCL+phho4TWDHGhXKe8m64a6Q40gpt1B1O9L9KizIx6Y1f7xISs+gz35Jel
	 jGbm6m+xPZvcWV9DpCc7yc8rfXkOLV2xmLTvv72aFUzUY5lfjAqyj3fstLfEkAhLWx
	 PSNRGAjbL/sTGi1qU4lq/NjaUBmuFTOidRTC+iedPEvkxfRryAAHgE3uk6lePAx8qO
	 IgLHI4AvEGCjDCa+QXpulRHXeddjHgfU51umteyFygtJLeKc1STr1QBAyNl6oHVbTe
	 SOsFI51+mpxYjourDn6EFq3roENXtNEoeDOCDwpWqKPnDVOAQSqZoPRPb69pNAl3M0
	 +WGlZCHBstHTw==
Received: by mail-wm1-f69.google.com with SMTP id i5-20020a1c3b05000000b003c47c8569easo979508wma.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 04:09:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fc0TPfCo+ClitIo96MsU8YKIJ7fVwtsiPqV5IcK9L04=;
        b=I2PRhSQWWkhOpC5T9nInnPNaQcdCK+4pvSKqum0fxvYX2FXzjb6IA9hjAR8+fhGRah
         KZg/Gz5hisDyOqX97daAdQQwX8d4cCih6xzf/BOXTVBwxTgXFpsBHGxUQ7bcgtHxrGJt
         p2WSOxByZpSKPd/H8NbdFgfg63Qow86a1I6rxadDtceljeKQ3rsFlY5RSnoyZ2T33EON
         TAm1Dq0n12DB9E3OnIUyRWui10GeWZJiukA8fgdMGN4p22mk7CQXjmkNPrPeVzYF7+qX
         60lixTr2K56g98kyuz/RjSPBQmTN1SEbIST3YB0UrEdBzDmaWGDEp/paPDkQ83Gahucz
         Ew5Q==
X-Gm-Message-State: ACrzQf1C5L5ahmfKgMZnpqcDdNHJRkZAFVyMhT08m9CqGyhVp8BM+CE3
	X1IOTt3a+wbVEc9jR7HY/19oxlp35UNGmRsomQUIzj65gFJTvjEQ5lWw7ezUSQ16GRAFluRVJuQ
	DGvd5dSstUz9PXAXAg3FRwfjRLftubpvo0mpgSDXndoD1Nw==
X-Received: by 2002:a05:6000:2cd:b0:22e:5cef:4332 with SMTP id o13-20020a05600002cd00b0022e5cef4332mr17179913wry.540.1665572970226;
        Wed, 12 Oct 2022 04:09:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM53N08D5AYNC9olOgNeBcGL9x6hkBytfGMbsk1rdhYnQNCfZEJHiySv6wFWFyPBnmO6XE6fhg==
X-Received: by 2002:a05:6000:2cd:b0:22e:5cef:4332 with SMTP id o13-20020a05600002cd00b0022e5cef4332mr17179899wry.540.1665572970000;
        Wed, 12 Oct 2022 04:09:30 -0700 (PDT)
Received: from stitch.. (194.62.169.87.ipv4.parknet.dk. [194.62.169.87])
        by smtp.gmail.com with ESMTPSA id i188-20020a1c3bc5000000b003b492753826sm1580616wma.43.2022.10.12.04.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 04:09:29 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Bin Meng <bin.meng@windriver.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: sifive unleashed: Add PWM controlled LEDs
Date: Wed, 12 Oct 2022 13:09:28 +0200
Message-Id: <20221012110928.352910-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_040938_258424_4B6FAD5C 
X-CRM114-Status: GOOD (  12.69  )
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

This adds the 4 PWM controlled green LEDs to the HiFive Unleashed device
tree. The schematic doesn't specify any special function for the LEDs,
so they're added here without any default triggers and named d1, d2, d3
and d4 just like in the schematic.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---

Yes this board is old, but I'm trying to get rid of custom riscv patches in
the Ubuntu kernel.

 .../boot/dts/sifive/hifive-unleashed-a00.dts  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index ced0d4e47938..900a50526d77 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -3,6 +3,8 @@
 
 #include "fu540-c000.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
 
 /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
 #define RTCCLK_FREQ		1000000
@@ -42,6 +44,42 @@ gpio-restart {
 		compatible = "gpio-restart";
 		gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
 	};
+
+	led-controller {
+		compatible = "pwm-leds";
+
+		led-d1 {
+			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
+			active-low;
+			color = <LED_COLOR_ID_GREEN>;
+			max-brightness = <255>;
+			label = "d1";
+		};
+
+		led-d2 {
+			pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
+			active-low;
+			color = <LED_COLOR_ID_GREEN>;
+			max-brightness = <255>;
+			label = "d2";
+		};
+
+		led-d3 {
+			pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
+			active-low;
+			color = <LED_COLOR_ID_GREEN>;
+			max-brightness = <255>;
+			label = "d3";
+		};
+
+		led-d4 {
+			pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
+			active-low;
+			color = <LED_COLOR_ID_GREEN>;
+			max-brightness = <255>;
+			label = "d4";
+		};
+	};
 };
 
 &uart0 {
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
