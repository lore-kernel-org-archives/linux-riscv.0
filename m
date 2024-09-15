Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF0DC35FE7
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Sep 2024 03:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUcLjpWS12fqTR0HDG64wUeEkA94zwQXJPmMhXICwgY=; b=oYD0lEaiwn6+We
	8vlAWXxCbyn/HEiOkBAHxAnjOv2e12CSQ2lzWfFxxdUGpQwxGrL0WBgNbQ7+HSmx0pOx3AYUYBtgA
	s12FB1O1sDyBQdHa1Hj1TU6YyAZdEzxGE/XDpSsNOypX4henXz8Sb03/Q5ontfzzi0X6vPkyzGqoG
	i/9puOH4PesdWbeKKXiJBlFZcDVvFMXC5eYsBAGInXCYSloV+B9Nl25UCgLiAQZeFuw6E1Ifs/shf
	hTeViuoYrYMy2r4J5QPvZAkiwDL49FWC03LJq4CvI/bpJqxzN0NReQ44xYVWRx5eLDYxk6g+Q6mPj
	FAj5I5IE3sLL11r4FZrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spgDR-00000001YdC-2kme;
	Sun, 15 Sep 2024 03:46:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spfFj-00000001WW2-3WoN
	for linux-riscv@bombadil.infradead.org;
	Sun, 15 Sep 2024 02:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Nq2qwoQ8fGvyakSE32KyqUjWPDGD9IAug2eijzHwHho=; b=rNPLJij6IJjofEWNzMrNC7UAH9
	VgdXjDzpLXRXH6feTnby+O6m/rjrUCBSD3+H9G419BMud4qkR6c7XRubmVAJDzT13tjomEsxMBPj2
	cW+y+9unPEgoDNqkx0WRgu5RLzlcgNIKr4FFFxlJF/GE3FBMy+GdgFf0BHSKkc9DM5UQg2EWpKTK6
	yU4sbJwHt65v/+bhRRYPGAs/bNb7XYtHwlUhLdoEpP878M2YOcMiMhq1Dmvj4QwyUqNXxNEbEJZWb
	hWs1Yp7jtA30QrJu3Pr739kW5S5IWnHHukfRQLDie0cDxbiOkmDH+qD0Ni/elfnz7Yt801eJObtV7
	Cc8hR24Q==;
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spfFP-0000000050P-3dQo
	for linux-riscv@lists.infradead.org;
	Sun, 15 Sep 2024 02:44:32 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e1ce8a675f7so2887293276.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Sep 2024 19:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1726368257; x=1726973057; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nq2qwoQ8fGvyakSE32KyqUjWPDGD9IAug2eijzHwHho=;
        b=PP98g+UG1GuIJur9JlXy28h2RvLzcNmbXBDu04FCVhc+dAyNwG3JGtbvJNRMtQUT4w
         WhBH7RNlvZOG7YvEbMVwVRVenBgeltZGFs3RExcwveuN6bJZJFUxzeJzD0SavoJZPK7y
         KSO4gsOrhjVJ/2XYRtGfIynxy43QJIAg87dIcxEQs9fSrGd1axW0pBEXx+W83UtH5/h6
         jeFSScNmZPzsY+zUPX6aa3DxgqN+Sw0j6YZ8BkCSCP7JcW0qBw8MtLeQhHZX8ZQE2519
         xZfyOsN1xzb22wKzYXKiTuC+jFF3cPEQn73clWv9EHPbb9yS6kNIcWwaoMsQsuY5LZYx
         QlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726368257; x=1726973057;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nq2qwoQ8fGvyakSE32KyqUjWPDGD9IAug2eijzHwHho=;
        b=Fyo1phQmZbLPgSwVz1Ev3aJCLpk2fnerdO9ON9b/4lKFjNI3hsyjle7A9cou43ONEV
         IPJFjgLvl3dct5OTu18v1RYobV9FDO23b2zKLP+57qwCtlBtiIREF10JHM0Qu6p8XXii
         NnsMk/+2K85xkkrhyeCfGjwLtIkOIoB8144QaYLaridp0M3QFA8jJfqhp8haKD1/rDWk
         b3D7ofaDj+29On7PqH59ohE1AOfG7FFuN8wCLt0Mob6OF0ifKG/9CRthVeljJ3UYcGIE
         hI+XBjApLB2twXdKS3MKkA2n8RGnbaqkWcnm7Ui8BVAonm4NrMG7nnb8GsMtbNEGu5Ub
         LKgg==
X-Gm-Message-State: AOJu0Yw+FFkOpNu12Fh5qyUU0pjoiOY2OE6J+u/XKn6L9IM0iDwURsSA
	UtCIDeHOBc9iHwSL7+XCMcxiSMZ1C/tUenYSqjVCPYyQJchUPYwmeEKlb1L3bSk=
X-Google-Smtp-Source: AGHT+IEClZ21Xn2I0tdDO6eQz5l4CSj9mqsoGgEda3xSmNTjGf1KEuzvGBfrhopXDCp2Yb4bN/rIaQ==
X-Received: by 2002:a05:6902:1881:b0:e0b:e47d:ccc9 with SMTP id 3f1490d57ef6-e1d9db98c66mr11206546276.8.1726368256818;
        Sat, 14 Sep 2024 19:44:16 -0700 (PDT)
Received: from [127.0.1.1] ([216.139.163.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6dbe2e0d924sm4129097b3.41.2024.09.14.19.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 19:44:16 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sat, 14 Sep 2024 19:40:56 -0700
Subject: [PATCH v2 8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
MIME-Version: 1.0
Message-Id: <20240914-th1520-pinctrl-v2-8-3ba67dde882c@tenstorrent.com>
References: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
In-Reply-To: <20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com>
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
X-CRM114-CacheID: sfid-20240915_034430_643332_B251500E 
X-CRM114-Status: UNSURE (   9.71  )
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
