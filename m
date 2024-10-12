Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40362CF2568
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Oct 2024 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dRlEQm2TSOayYzHaAoHoLEEU4kb+FZvftIuNnzmXuT8=; b=as4l+lDgII8TZfDdd9CR0aJ3TY
	vt0WcEaMkuA0fbzKvqyncYW/lefzBQIoM7l1yrPFx6mPU7YmE7gINqksAJA5zjaUMTCHlCa0fUzuD
	F9D7RTPl09HBzsSN+eYYLunGKI1d+ynqm2Kv36rxsF1E2anfxhYnEG2h3fucwGAz0fHA8PnlhcaUD
	i3WVm+udioBKfKAtts1zWH7abfHK9s2lKmFaubHNWRHwihVl+5XoLkk0dv8SmO0xPnZHlo9Ib1Wr+
	Hy6fuLv2e/1Do5PVYLE/OBbbp1qif8BEvO9Z5sSups4q8YNCS/9e7Hv8fiBtGrLgpkrxwD4ACfx3l
	NxZscDkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szdTv-00000001O2D-3Pvv;
	Sat, 12 Oct 2024 14:52:35 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szdIw-00000001Lxu-2tWs
	for linux-riscv@lists.infradead.org;
	Sat, 12 Oct 2024 14:41:17 +0000
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5816A3F8E3
	for <linux-riscv@lists.infradead.org>; Sat, 12 Oct 2024 14:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1728744072;
	bh=u14OejdbWcG0velVojMwkvgHAoWWwEN6ANeyU44dL4U=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=YJCBOV1FxLgxMQxpF8Y1iSsfyYfccXfjAHyotS01tv0QxuWTTmaTWivkL+zwZ05EB
	 EA4z6Oy7YA6MlcJQhRivWBZFYKuaoVkKEYAp9ETB8cwIxMj7oNMkRoSN5hXM/91MLC
	 uNxwWqahK2iaSzny33oWWXT959jAKsISqK62MqL7vzvFP9xBiUWccM0YMKDeUFtpu/
	 9ymJX349XKG4ThIObs7e6lfPazv+uc49nP7QoTwpZJpnZD74DxgzuSYnbVoF1n0MRG
	 UJwFV5U7NRICI0zZU1Pe7v4aF8psQa0mecV2fBixEh/RPvo8yZN3cVytGLD6jJo65Q
	 hFhjOt9T8i2FQ==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2877e9bb313so2827093fac.1
        for <linux-riscv@lists.infradead.org>; Sat, 12 Oct 2024 07:41:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728744071; x=1729348871;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u14OejdbWcG0velVojMwkvgHAoWWwEN6ANeyU44dL4U=;
        b=qzqt2pEjessOVAwrBSVjsHEhinWo+Hw//4p+xIAp+hOjfTwP+jA0yLb0d/6283Uj+8
         XTm6ADbz2LAoSLm18d55sBoCAx6zAAaBVS0K+5D3pbCJm5SR6cjuEabUfbxRLBvvl0Hs
         ddLkoJFD6SGutGoIDTw6+Z3PpHBDkBOeu2RTcrAgrhe/K3cGyOQVto41EVQ+dfISWjpp
         lTe19qYiEpXb7qqCLzOAxy22sx/Kmi+BZLt13MTDV/xPfMWa18lc+dgBi91k7dfrVCgT
         EbIR6rRJJhkuuWciveZIu56t2Sz1m3CB2kr8COavcsZOAUfZPSjY04YVfWI4FIII5kA3
         2COQ==
X-Gm-Message-State: AOJu0Yy3zKmg1E9qpK3xaC5otJfyxNjgmqsjyQHP53+eyfyU13Ioh3jS
	jIYLO4y/cx7bw3lgzF1vtuHA5ZN+soedmWtSs7m9I//sTfpC/qtxEpKYK38X+8N4/6ZKQPAtOrH
	mlCjFrnhwHTtQx6umEj6seb8vUEIzzFfmHwcpM4uHbiFKigBMIjuRFuKeGzitqPFwKDPqlNZEtk
	0XxjuDArdEjoOWZPVMXxV90yhkFMzGY2d6TojVP++d2PwckUy5OpRCaLzL
X-Received: by 2002:a05:6870:b514:b0:261:1046:66fc with SMTP id 586e51a60fabf-2886dd3fac0mr3280047fac.4.1728744070948;
        Sat, 12 Oct 2024 07:41:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXUlMb3PnnEigp7yJsQv44SPpz2ujpyO0GZEe1m7y1otwwP5hPxCneu5J0+02C3ypjxxd7ArzHX3GpPmZvsRE=
X-Received: by 2002:a05:6870:b514:b0:261:1046:66fc with SMTP id
 586e51a60fabf-2886dd3fac0mr3280035fac.4.1728744070551; Sat, 12 Oct 2024
 07:41:10 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 12 Oct 2024 10:41:09 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-8-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com> <20240930-th1520-pinctrl-v3-8-32cea2bdbecb@tenstorrent.com>
Mime-Version: 1.0
Date: Sat, 12 Oct 2024 10:41:09 -0400
Message-ID: <CAJM55Z8rv587qAtiMoc5i4+ZkQk6DwQJQVmDP=3gG+wVe7h0EA@mail.gmail.com>
Subject: Re: [PATCH v3 8/8] riscv: dtb: thead: Add BeagleV Ahead LEDs
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241012_074115_630973_3128C0B0 
X-CRM114-Status: GOOD (  14.31  )
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

Drew Fustini wrote:
> From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
>
> Add nodes for the 5 user controllable LEDs on the BeagleV Ahead board.
>
> Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---
>  arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 55 ++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> index 6c0b768e8d17..5a5888f4eda6 100644
> --- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> +++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
> @@ -7,6 +7,8 @@
>  /dts-v1/;
>
>  #include "th1520.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>
>  / {
>  	model = "BeagleV Ahead";
> @@ -35,7 +37,42 @@ chosen {
>  	memory@0 {
>  		device_type = "memory";
>  		reg = <0x0  0x00000000  0x1 0x00000000>;
> +	};
> +
> +	leds {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&led_pins>;
> +		compatible = "gpio-leds";
> +
> +		led-1 {
> +			gpios = <&gpio4 8 GPIO_ACTIVE_LOW>;

Here you're also missing important changes from the tree I told you to use.
These should be GPIO_ACTIVE_HIGH otherwise the LEDs will be on when they should
be off.

> +			color = <LED_COLOR_ID_BLUE>;
> +			label = "led1";
> +		};
> +
> +		led-2 {
> +			gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> +			color = <LED_COLOR_ID_BLUE>;
> +			label = "led2";
> +		};
> +
> +		led-3 {
> +			gpios = <&gpio4 10 GPIO_ACTIVE_LOW>;
> +			color = <LED_COLOR_ID_BLUE>;
> +			label = "led3";
> +		};
> +
> +		led-4 {
> +			gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
> +			color = <LED_COLOR_ID_BLUE>;
> +			label = "led4";
> +		};
>
> +		led-5 {
> +			gpios = <&gpio4 12 GPIO_ACTIVE_LOW>;
> +			color = <LED_COLOR_ID_BLUE>;
> +			label = "led5";
> +		};
>  	};
>  };
>
> @@ -71,6 +108,24 @@ &sdio0 {
>  	status = "okay";
>  };
>
> +&padctrl_aosys {
> +	led_pins: led-0 {
> +		led-pins {
> +			pins = "AUDIO_PA8",  /* GPIO4_8 */
> +			       "AUDIO_PA9",  /* GPIO4_9 */
> +			       "AUDIO_PA10", /* GPIO4_10 */
> +			       "AUDIO_PA11", /* GPIO4_11 */
> +			       "AUDIO_PA12"; /* GPIO4_12 */
> +			function = "gpio";

You've also added this line which results in an error like this:

  pinctrl-th1520 fffff4a000.pinctrl: pin AUDIO_PA8 already requested
by leds; cannot claim for fffff52000.gpio:536

Did you run this on your BeagleV Ahead?

/Emil

> +			bias-disable;
> +			drive-strength = <3>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +};
> +
>  &padctrl0_apsys {
>  	uart0_pins: uart0-0 {
>  		tx-pins {
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
