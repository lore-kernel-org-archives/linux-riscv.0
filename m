Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AD8CD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Sep 2024 04:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUcLjpWS12fqTR0HDG64wUeEkA94zwQXJPmMhXICwgY=; b=358GQOEcvH9eO5
	DdSe4IdC4na6sctOJ2QHVhLWdkAvl3m6ZnF+FIE3Z9301y6KL1ODLNaYl1IUJRy3fyZf3hLqhokeM
	lD1+KA1pYq4CgFn5kmw3k0E6ZWXFEyFfipWjMmd2S3qVWrDXycdPkOSSfGaVUcG75Tu0x2PdVdgeM
	F82UbDYV2kYd3E74d4hHUPTvucaRW+fnWX+yzVlxmTzcpGJhCH+OtV/WsBN+j1J6DJz09asRxHsWB
	f3xc5D+X37meKs7lfZSmSWPyjpX+eA8gudEcFpyRDWte262jDsG1HZBhVUNON44VkJWw8Kg8rvq+6
	34XnHQ0SSZuoZJoChxyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqo-0000000GFnu-0RGP;
	Tue, 03 Sep 2024 04:09:06 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slKqj-0000000GFjD-0yNy
	for linux-riscv@lists.infradead.org;
	Tue, 03 Sep 2024 04:09:03 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7176645e440so588692b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Sep 2024 21:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1725336540; x=1725941340; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq2qwoQ8fGvyakSE32KyqUjWPDGD9IAug2eijzHwHho=;
        b=GpCMbApaovpTbFw0ZGJn9tzIvuoRDYV5BAE5t54C63VLvdy+ZMYBnAKxqfNjYAH/9i
         PS/svqOhuCQl9p91jiOQEOONzv5WgPYZOsh9/piKlakuxRkAc5AZ/SRKTIBVvK8Wcxp0
         nsGf5ZDm9v+xVVZFD78OhTbf4NkV6s1xrAVzP8VqeiKjiEMsoIwulQUaHHntPi/y2AYV
         X5KQgoFwJSykCAmvmm41+KQnFfwVo67fuNrbzH4kg9DV2JVkux5NPla0qR/OcYsd9Bpw
         o51peSoCnOoNrkvEyzLFB5O1nhvS3QbeZo3Yp4bGcuMJv3D1s8zpNZW3n186Y3tYMORi
         9Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725336540; x=1725941340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq2qwoQ8fGvyakSE32KyqUjWPDGD9IAug2eijzHwHho=;
        b=B5Qn4QhLAF+gCZ5FamQ5ps6oHkmRyT7naJreVmxCPelcitbZ36ERNR1jhVnvph4YRj
         BSYA218sL4NAP0XnIwZsq2D65SGk/Slb7ERKPMMDcbTQIZR3ky/ME25sPGO3aoVMXw7F
         MU4R6aQpCcbFIQjmL+mYP06qQutdiHyvb2KYvghNMgiQI2HHwWpNdv3pC3Y0mm32UO80
         PoyDz40VCsq6G49Taa2nApR7bEnTKnqzmBuaHMQmp73EPaiJNGuDGORjMllyrfJs9z3f
         QpeUeniqA0gisfgF7Qg4ysSqmiXOkFNnrO02PTiIF1n2yoqCkvpkqC1qBTUB5UEgsRWA
         coIA==
X-Gm-Message-State: AOJu0YwFxRkg4/Oj29dZvVRR8coruU6Q468xOBuptNUFLpR6qilvTffj
	pkwFK2GZbR1oh2omIXz5lcT6vAf9StijLlB8IfWbZdswCDENh808wBut/WXjrJo=
X-Google-Smtp-Source: AGHT+IFNAPzS6NfqW5WUiKK6YWRUIPCTsa89ov5gA3kZvZyE5KG2NssyQ0TR5AepdwMXQxdhjgwENQ==
X-Received: by 2002:a05:6a00:2d1c:b0:70d:26cd:9741 with SMTP id d2e1a72fcca58-7170a85aaafmr19264523b3a.12.1725336540085;
        Mon, 02 Sep 2024 21:09:00 -0700 (PDT)
Received: from [127.0.1.1] (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e569ef39sm7532701b3a.122.2024.09.02.21.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:08:59 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 02 Sep 2024 21:07:01 -0700
Subject: [PATCH 8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
MIME-Version: 1.0
Message-Id: <20240902-th1520-pinctrl-v1-8-639bf83ef50a@tenstorrent.com>
References: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
In-Reply-To: <20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_210901_368185_85793F2F 
X-CRM114-Status: GOOD (  10.03  )
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
index c5356f674f85..823aa5b44efb 100644
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
 
@@ -82,6 +119,24 @@ &sdio0 {
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
