Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7955C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x9Aby79GwmHvXDAvtbHxDM6XQX17FejSZZmDbBWrAFI=; b=NmdVDZWhVyq3PI
	PBaP7m4hmSl5ZGW+nT26KXbFw1sEFrxqvxx4KISgvPVV9it33/heu5CnC8OxdG4k3ypMHM9wJ1IXZ
	eXE1uHIdWjLAIpEMYKlpa7hTLFQZs0jCCh7ahy1M+HD27iCHoss6j3kkxmUWP5DMx98s+sigfEnEn
	BiHRp5IuF5ePIZBEYVoTXmwNCDMAx/JBJNoi8sUZ1GagSn3o84QLF3931x+JKnMZMZgHEBXbEGUZA
	RRq8uTXGtWIMU9Zhe5TMbmdlgjNrPtp7m6LY3DyHbaRD8o9TF280w2mXUZpv+RDIRwDOsr6TITyyb
	BVAU0q5bTOLVIPQHOtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pp8-002qaf-T6; Tue, 05 Jul 2022 21:11:11 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8pgC-002nKB-RH
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:01:59 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DE8DE40AAE
	for <linux-riscv@lists.infradead.org>; Tue,  5 Jul 2022 21:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1657054910;
	bh=AoMSkRbSsal7DXav6tHJCoGyFX+s+KqI3+R+nsluk4Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=EZTV/g9pLZ7rlM3n6yiDtLZYy1oC+hcEXYERbK2b8kK/rj8Qm8CRLXwQ+PghI4H2g
	 7LIDwqYC+onvsnFd8xDqpWiyA/LkVzqo46Ok4SIBmzaNzgUrHx0UgmgOsDPZi0M+PN
	 WLbePTS1kftpdjutRBkwoI0XjKSfzI4SMmDyzzULl4IlAkQiwgoMbuhB80860a9ZPh
	 +6rUDZmt4oJkAaAYQHZVqvChtLXUB3MuThBHooR3ztMdqalolkm6E90MPBe6oTiYZo
	 TJwvXqAB1O23IwBGopAbbvKjX3NX2WXDfmp1tjdGGUitnw6OCLx+2kXqtEp2Fns8nQ
	 eCFiGKnpzA/XQ==
Received: by mail-wm1-f72.google.com with SMTP id 18-20020a05600c021200b003a19b2beb0aso3439905wmi.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AoMSkRbSsal7DXav6tHJCoGyFX+s+KqI3+R+nsluk4Y=;
        b=joZM3tE9lf69j0N0Koi44rUOnzMv+aH2JB5V0bCU5BpSbwaBWD+YomONwXL5cS+P3X
         bgDkKhnjmDgC3k52HjTyTG6z7qnFKP95injCBkO/tQI6QBlpcFfFQRP92e8m3dL9AL0A
         M4V7mrYOQPY+1bdyqMOvSQFxPoPphE5u2TRym6IcpkQS1Al580fYox+wbpgeaICtmgn+
         10zNMgDDMZ2PNXc3gpkAvO/xfYdQTxLkyiV3SGQYAeoEbsbFtoktbAdZGvgQ6aBWiYiO
         qHFx1iCSYPCapYpeAkqO1drRAz96EKmZmj5zCoIBQp/SuJqEsLkt1cpPsP+ZU8SWvWyu
         4sag==
X-Gm-Message-State: AJIora/5sT0sfFoFjLa6GtKFxJaWmhFxwFktz8m06fqZfPfKhuoSefX2
	rUnJfHc2CSNTydBLW9egsGA4iZqswcZioA32Hko40mCJEuUnZ6l3bSFSNkFxtM9UcpH8jvwlw7B
	BiAQebxyFYENzbhT3LPb+TSOa0+u1HlheQ4kXIPaj0DuRXw==
X-Received: by 2002:a5d:64ad:0:b0:21b:b412:a34b with SMTP id m13-20020a5d64ad000000b0021bb412a34bmr34737451wrp.161.1657054910462;
        Tue, 05 Jul 2022 14:01:50 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1utl+vdlW/hT+y0u8P/5xgHHhGX/aEi5Iu3pv5PVf+eB3fFB+ZuQGqJZ0/RfxSFhjz/+hEgCA==
X-Received: by 2002:a5d:64ad:0:b0:21b:b412:a34b with SMTP id m13-20020a5d64ad000000b0021bb412a34bmr34737424wrp.161.1657054910311;
        Tue, 05 Jul 2022 14:01:50 -0700 (PDT)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
        by smtp.gmail.com with ESMTPSA id r15-20020a0560001b8f00b0021d74906683sm2517667wru.28.2022.07.05.14.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:01:50 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org
Cc: Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Vincent Pelletier <plr.vincent@gmail.com>,
	Bin Meng <bin.meng@windriver.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Ron Economos <w6rz@comcast.net>,
	Qiu Wenbo <qiuwenbo@kylinos.com.cn>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Stephen L Arnold <nerdboy@gentoo.org>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Mark Kettenis <kettenis@openbsd.org>,
	Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	David Abdurachmanov <davidlt@rivosinc.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1 4/4] riscv: dts: sifive unmatched: Add PWM controlled LEDs
Date: Tue,  5 Jul 2022 23:01:43 +0200
Message-Id: <20220705210143.315151-5-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
References: <20220705210143.315151-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_140157_106755_F84A7E25 
X-CRM114-Status: GOOD (  11.46  )
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

This adds the two PWM controlled LEDs to the HiFive Unmatched device
tree. D12 is just a regular green diode, but D2 is an RGB diode with 3
PWM inputs controlling the three different colours.

Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 .../boot/dts/sifive/hifive-unmatched-a00.dts  | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index c4ed9efdff03..beaefe74755a 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -4,6 +4,8 @@
 #include "fu740-c000.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
 
 /* Clock frequency (in Hz) of the PCB crystal for rtcclk */
 #define RTCCLK_FREQ		1000000
@@ -44,6 +46,46 @@ gpio-poweroff {
 		compatible = "gpio-poweroff";
 		gpios = <&gpio 2 GPIO_ACTIVE_LOW>;
 	};
+
+	led-controller-1 {
+		compatible = "pwm-leds";
+
+		led-d12 {
+			pwms = <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
+			active-low;
+			color = <LED_COLOR_ID_GREEN>;
+			max-brightness = <255>;
+			label = "d12";
+		};
+	};
+
+	led-controller-2 {
+		compatible = "pwm-leds-multicolor";
+
+		multi-led {
+			color = <LED_COLOR_ID_RGB>;
+			max-brightness = <255>;
+			label = "d2";
+
+			led-red {
+				pwms = <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
+				active-low;
+				color = <LED_COLOR_ID_RED>;
+			};
+
+			led-green {
+				pwms = <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
+				active-low;
+				color = <LED_COLOR_ID_GREEN>;
+			};
+
+			led-blue {
+				pwms = <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
+				active-low;
+				color = <LED_COLOR_ID_BLUE>;
+			};
+		};
+	};
 };
 
 &uart0 {
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
