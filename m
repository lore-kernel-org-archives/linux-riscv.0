Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDAAD18138
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 17:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Te+wOcYXzAqXC2yYyNLUOy7vFZmANLIM1v5WfT360K8=; b=Rz5XaJFYWAMqNO
	ehEsWz4VHobGZV6UuErKOXODINhFFjtnheb2WqCZgH80bRxYFwpARehSqklFlaSpEDoGKL6Ma7c1o
	uJAw4GpOUPTzIRSLD49WfaxHm+Rc8fqoTt/F+FW8HGehN4Cg4HiN+VuHjaggrMzIcQCsbGqsXatYi
	sPPi7CW3CwyYlrl8zI0a0TEU7X5wQj30VjHcjSVNusMIHOR+ILNuTtBpx5JBdfa24PSGdF1PJQn3Z
	wxi5DfNS8l1Wc0oChDdIy0EpB22u360rfIigS5z+K4USnf3AOaSuBnA0Dg5TAl+G22VJXlPEGkOUN
	A1dQtpisrXgLyVzs2g5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHM-000000066hK-1hmp;
	Mon, 14 Oct 2024 17:54:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0PHG-000000066cj-3AeF
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 17:54:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71e5130832aso1294241b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Oct 2024 10:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728928482; x=1729533282; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8k+Ak70OWe9Icimvivr1l9WRiR6s756j4FbBxJKO5A=;
        b=RzPNMqqw4qYANZW3RaGRNN+z3C6ZtiQpTgfAguaDGYUKt9ryYTLCVWH6VsTQtvUzBq
         qK3iiyUmWZ8/1wGbWDmbqUOT1+/N0WFqRrCdtAP5b8mQu8OvPW2c1Zync8Lu6uqPyzpl
         G1tIXxG+kC/5nh75lRW/QkRX4068iJKYk5d8T2h7YmNrgx6LjYuZq4HqqWJExL/rOPWw
         reAUyhQHvfO9ed4lp3ySmKs6GAz2glFfY9Yw0/K8l8/AekDFgkm6ohy5nOUCWpUMnKc9
         kelWBg8xjDSUn4m8KvwF+1JzFkM+Zm9CV3WWoQDePutjhRP4ZmIM99kEPj2aAgL/Bv9n
         73vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728928482; x=1729533282;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x8k+Ak70OWe9Icimvivr1l9WRiR6s756j4FbBxJKO5A=;
        b=szi8msR6lRnaV8nqRxD7itYGJLSkA8krUbFB6Ks26vPuTmTIe3JncRY1jPHZNWdzLk
         kppfohGtMwUnFyQCdtXBKADtxLRkiNgHMqiQO92lLQwMtuQJnYS2mxtug72RBIAUu/Gj
         iwyuGo9hqVRgX8e7HGovorpb9OILaD12/rePy8x5hdwkRVnXobx5hHZGGv+AfDYkELtS
         1oZWEVTXdRP2nOt9iGCeAGFgXwSEPbVtDw3jgURTSbTl9fbNkNC0Lwbsx6P53oOgxmIc
         MmDqt3zTmktbdjjcA7NncoecAlzjWaDxRVvpBliRfQ76b2RSlEuBMu/NkXusrmGhzKM1
         tbbg==
X-Gm-Message-State: AOJu0YzLXWUghyU5i3xACtTmJjWfRnGsCmfRqn5R5WcF1shF0GXjYJmh
	uyvyvh8euSqLYEAc8Qh9ZVIRvzVvtZF6MwdmnnkcGBjPkhFTqFbGIMA3Hn1GTNc=
X-Google-Smtp-Source: AGHT+IHqJLvucWLAGZ5AzhHinp9PbSR2cpVHqdqttcjIU+06NfsllWY/kPZKL7TywtCJgFpTSeOOxg==
X-Received: by 2002:aa7:8890:0:b0:71d:e93e:f542 with SMTP id d2e1a72fcca58-71e4c1cfdffmr15523167b3a.21.1728928482095;
        Mon, 14 Oct 2024 10:54:42 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e49a7e5e7sm5611109b3a.179.2024.10.14.10.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 10:54:41 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 14 Oct 2024 10:54:23 -0700
Subject: [PATCH 6/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
MIME-Version: 1.0
Message-Id: <20241014-th1520-pinctrl-dts-v1-6-268592ca786e@tenstorrent.com>
References: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
In-Reply-To: <20241014-th1520-pinctrl-dts-v1-0-268592ca786e@tenstorrent.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Kanak Shilledar <kanakshilledar@gmail.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_105442_837977_21326A40 
X-CRM114-Status: UNSURE (   9.79  )
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

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 54 ++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 0484fb390be4..c0cf9b086f81 100644
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
+			gpios = <&gpio4 8 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led1";
+		};
+
+		led-2 {
+			gpios = <&gpio4 9 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led2";
+		};
+
+		led-3 {
+			gpios = <&gpio4 10 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led3";
+		};
+
+		led-4 {
+			gpios = <&gpio4 11 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led4";
+		};
 
+		led-5 {
+			gpios = <&gpio4 12 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_BLUE>;
+			label = "led5";
+		};
 	};
 };
 
@@ -61,6 +98,23 @@ &emmc {
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
