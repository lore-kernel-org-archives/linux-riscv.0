Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5CC1C46CD2
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Dec 2023 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Od+BcTIZr/Az27KaKvIgxAYxKYsq2bUunyE12gbe/c=; b=b2ukKP6L/0ax6HYGYfrpCk/x4d
	x/KDUi3UqXP7ZTI4/REZgN2wo647eR/6030jF96d1zLQPSKuNLJyE3WiAGVFwuHsLDrp2HjcNqzU/
	lGdjlVr0UD9iQ3vwFNyijfshhKcecnJ12E5hVpxIMGkjTlIJeWTkJjRert9kAs1eaXr3hvvT7XvMo
	YPzbTtUZrfXaX0rc0u4k+Znm7c4tvYUW2hujRShvo/pg58g8ojEabcCZoydcnl3Na+Siw54b37jOR
	kjT8Hi0aDBZGQ95/nXnMWHOl9wYl7AszjSqiotV4MtYd2J58lb9t0rjrbatTgY8EmHcneNM39C45C
	2nzvdyFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHM3x-009Aes-1M;
	Sun, 24 Dec 2023 10:50:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHM3u-009Adl-0H
	for linux-riscv@lists.infradead.org;
	Sun, 24 Dec 2023 10:50:27 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 359183F741
	for <linux-riscv@lists.infradead.org>; Sun, 24 Dec 2023 10:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703415023;
	bh=dRjx8VHHb0t27RVkqdYIaU34XdXmnq6meYjdKYyMtPA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=thqhKtA1iGLGAFuWRsq0+IJ6WBbNZ70Q6QIuc+7yVyOiXscq4cnE6aGYMDG8r1lUI
	 sUeljcBGoNwfg+neevC6crnZRyTyNwX2umj0C3s4TeNpJIZ+hZb8zF19dxDgUWrrvY
	 7GfS2foUFT5c/kJv/qs6xIJ8VQ+ATu+yt1SeQTXioklUCs0t0bPlGYYBAx/7XKsX5t
	 C3nIntqfQK2Iy+1Z5v/XIskQCmxQS4Dqz8cJ8kWs1FALAI6t7MIfYsUWWWea9GaD60
	 X4+jvRo38peF8SxTCz7z9r/oNu55g6kWlpE/3xB9nY93IL/EhmXm50WWIy8KuL2aYn
	 5yjQGo5ZcOaRQ==
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-781376310bcso152760485a.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 Dec 2023 02:50:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703415022; x=1704019822;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dRjx8VHHb0t27RVkqdYIaU34XdXmnq6meYjdKYyMtPA=;
        b=ExNIlFCRDT755nFXYyd/95Y0fRcUY5caOz9pbntCIS0R4JudZr7HpEnyoHZN+B3hOb
         s8VCxDEnSK54xO8RCtCyNR/MEkp+E2BdtgIMi3AhXyTJEc4aVx/8Qn/EY9+FNqtTCk6+
         0BoFYwCEhBpd2palTZ+jR7VXcQli3jpv9A8W+d5N/hADDrXA7zfWNSB9KcYWYrlnBjsn
         i2+ZPSoHt9h6CHhoSqj1ONYGKO0K4wwWkrNNrWhId/nWqxvoBfuMHeFhNSPJt6G4y9R+
         k2xq9l6B4skatVXcM+g10se3D6QTcPceLWbNXkEBhlhKOS3N+QfzS3CIdLOA5jMoPFGR
         3rXQ==
X-Gm-Message-State: AOJu0YxnV/Yt6fagH33iyD9tkbxJ54Z1eM965YgYuWeDttoZl0nAam0V
	t+bChrZgvAC7tCK6jjDqw0nhR0W06XcJt09T1RKu1CPFS41CETYuxJIam6OwtX4MpOfWwPBjA31
	myFmXOV4BlU98k42OjM+DXvoghNmPTdy+yKiYN+vjY23O2HBUxQazWVBSE7ZdsCkig4WNWe54A/
	Vv2sg=
X-Received: by 2002:a05:622a:182:b0:425:76df:7e6f with SMTP id s2-20020a05622a018200b0042576df7e6fmr5609346qtw.119.1703415021914;
        Sun, 24 Dec 2023 02:50:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ96r2eapvbnKdZyEB77jqFXRuTWzy2bUJJjzd8WXSuigvwDiMsomMEGU5kDYipZ+1aQleLT61MirQghPeNG0=
X-Received: by 2002:a05:622a:182:b0:425:76df:7e6f with SMTP id
 s2-20020a05622a018200b0042576df7e6fmr5609335qtw.119.1703415021493; Sun, 24
 Dec 2023 02:50:21 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 24 Dec 2023 02:50:21 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231222094548.54103-5-william.qiu@starfivetech.com>
References: <20231222094548.54103-1-william.qiu@starfivetech.com> <20231222094548.54103-5-william.qiu@starfivetech.com>
Mime-Version: 1.0
Date: Sun, 24 Dec 2023 02:50:21 -0800
Message-ID: <CAJM55Z8aGviAN0FzEPYtOuV_8q=OvVpNbid195BJTfVMnrA7aA@mail.gmail.com>
Subject: Re: [PATCH v10 4/4] riscv: dts: starfive: jh7110: Add PWM node and
 pins configuration
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231224_025026_262051_8A525B8A 
X-CRM114-Status: UNSURE (   9.62  )
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

William Qiu wrote:
> Add OpenCores PWM controller node and add PWM pins configuration
> on VisionFive 2 board.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 22 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  9 ++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index b89e9791efa7..e08af8a830ab 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -323,6 +323,12 @@ reserved-data@600000 {
>  	};
>  };
>
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm_pins>;
> +	status = "okay";
> +};
> +
>  &spi0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&spi0_pins>;
> @@ -513,6 +519,22 @@ GPOEN_ENABLE,
>  		};
>  	};
>
> +	pwm_pins: pwm-0 {
> +		pwm-pins {
> +			pinmux = <GPIOMUX(46, GPOUT_SYS_PWM_CHANNEL0,
> +					      GPOEN_SYS_PWM0_CHANNEL0,
> +					      GPI_NONE)>,
> +				 <GPIOMUX(59, GPOUT_SYS_PWM_CHANNEL1,
> +					      GPOEN_SYS_PWM0_CHANNEL1,
> +					      GPI_NONE)>;
> +			bias-disable;
> +			drive-strength = <12>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	spi0_pins: spi0-0 {
>  		mosi-pins {
>  			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 45213cdf50dc..1b782f2c1395 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -829,6 +829,15 @@ i2stx1: i2s@120c0000 {
>  			status = "disabled";
>  		};
>
> +		pwm: pwm@120d0000 {
> +			compatible = "starfive,jh7110-pwm", "opencores,pwm-v1";
> +			reg = <0x0 0x120d0000 0x0 0x10000>;
> +			clocks = <&syscrg JH7110_SYSCLK_PWM_APB>;
> +			resets = <&syscrg JH7110_SYSRST_PWM_APB>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		sfctemp: temperature-sensor@120e0000 {
>  			compatible = "starfive,jh7110-temp";
>  			reg = <0x0 0x120e0000 0x0 0x10000>;
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
