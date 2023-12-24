Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE46C47073
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Dec 2023 10:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UspO3OzpATZYM0jp7aTXVMSoIXh56I8Lz5YXNUWgC4A=; b=Vdy3ArvqyUU6/e14lW747ZDSkZ
	yjirvWltDZfuc2b6IJjlD9tMCki1y7IouscdVUlK5yLROuuceOdJzLBhJD31PCG9+2PTtGuGXbFX3
	T/i/xgWph5aw1Cww4PMXS+qY4YmLNBtGrWGUziuygwGcUueWey7U4+Ys8FZT/8x3hmXXq4m7nlYSc
	5OqtaLDtn8n7Hsd9XTzoG3d692a3x3emacSiwIIW/l+PMacleOicb7W6NFZYeEDJ3LNtIEu3mWAdS
	k7GFoCd0MKvSrxEyZP0OKjQ1UWltiUbAhU/PKCPKIAGaBU47P1+e2wlOt+BPylo7iJQq2esgp24KS
	M7de/AfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHM3F-009AYs-2D;
	Sun, 24 Dec 2023 10:49:45 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHM3B-009AXt-3D
	for linux-riscv@lists.infradead.org;
	Sun, 24 Dec 2023 10:49:43 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9BF583F3EE
	for <linux-riscv@lists.infradead.org>; Sun, 24 Dec 2023 10:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1703414976;
	bh=T6CV/w/Oj4/yKhfarK+UEYWwoSl7TNmHch082+K72XA=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=s/fRoIh8SY0TKT7w5PsksY/lcSI8UApq2MHVl8DyiQFRguc04FhM2gmwAcF2L2Wqr
	 maVTFHaZ8WlhYPCnsTHJSzSkKAk6M/mF/6qbwS8udCB69dW+ysX20SaQaBi7KlF/V+
	 7/2rK3KJSsZ0UH7Vh03wqWQh4PV3LGpf6Yatn9er5sHGnZ+tgaqDd8giffpzbdpnWu
	 dJyQ910RIv9vzqM4GWKoz9bGIRFi8EQTxzzGOf8dH2UuQv76aCnC4GcKviDr+B5X74
	 UeJexQqFxIX14gYoVZYSYd7A0NNakCaxgveR9p0uUkiiiQHA4qdqyP2SEBBpJH10t7
	 fcOxCrUkZ7Gsw==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4278740faedso39882781cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 24 Dec 2023 02:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703414975; x=1704019775;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T6CV/w/Oj4/yKhfarK+UEYWwoSl7TNmHch082+K72XA=;
        b=bgNv7Nsv/G3oyAmtTVEvxjd0Ha9yUtEWf0cZKVVwLtXrUM83NAQoM4KIGXZEbCC++v
         HsXzdemUERR8nkr4rKbmE7YkB7WYEqkLUcu+ruOizEw+u0ffsPrbuFvIAWZO3jCmQglf
         HudGiotjR62mJolCePkKz8zHfB69tSLCup/3lpZWnUMhPvyOFpwfgEbz24V+OCic1nWR
         aQlz42F0bNP/4M+DmMfDDdSyZ9VAVNJ8qVcrnDLBjSXDlgo4X4BZNDntAzsy0DpE1A83
         arvvpft5oeHTWAhN4VkRv2RJVK0ygjdlbW4sNzikvneKAShUGopd5gW7cetf3jXyImsg
         cIDA==
X-Gm-Message-State: AOJu0YxxiF2EPvx1PQzBU7x5Qu6HoeExZ+3xk0Ww7A5iKjk3Tv9rpyLZ
	VoVzUjNbMKjQC205hFg7cLPTv+sqVyLuPHfRvtmwfI2QArU994MkOn66jVNPryJwhZhhltOb5Ow
	gUCJSIOy1P/XsSptPLkrWO4tp2UvTFma7uCkBGKHN261Absr2zKXD+2HjmWWdWs0SDXJu
X-Received: by 2002:a05:622a:590:b0:425:4043:8d55 with SMTP id c16-20020a05622a059000b0042540438d55mr4267080qtb.112.1703414975568;
        Sun, 24 Dec 2023 02:49:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqn8DRlJOSAfcEfKAUiBJCl7hAhOpHxzVr7CqiVH5tkrER/1XMKIqe4ro6dC36GAEU2oObR93Kusddr00jIj4=
X-Received: by 2002:a05:622a:590:b0:425:4043:8d55 with SMTP id
 c16-20020a05622a059000b0042540438d55mr4267060qtb.112.1703414975298; Sun, 24
 Dec 2023 02:49:35 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 24 Dec 2023 02:49:34 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231222094548.54103-4-william.qiu@starfivetech.com>
References: <20231222094548.54103-1-william.qiu@starfivetech.com> <20231222094548.54103-4-william.qiu@starfivetech.com>
Mime-Version: 1.0
Date: Sun, 24 Dec 2023 02:49:34 -0800
Message-ID: <CAJM55Z9tyrR7emEBrY0+Fnc_LUFQHkqYHLQ4ptL=XQMy52qtVw@mail.gmail.com>
Subject: Re: [PATCH v10 3/4] riscv: dts: starfive: jh7100: Add PWM node and
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
X-CRM114-CacheID: sfid-20231224_024942_327865_40751FB3 
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

William Qiu wrote:
> Add OpenCores PWM controller node and add PWM pins configuration
> on VisionFive 1 board.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

Sorry, I thought I already sent my review. This looks good.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../boot/dts/starfive/jh7100-common.dtsi      | 24 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      |  9 +++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index b93ce351a90f..11876906cc05 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -84,6 +84,24 @@ GPO_I2C2_PAD_SDA_OEN,
>  		};
>  	};
>
> +	pwm_pins: pwm-0 {
> +		pwm-pins {
> +			pinmux = <GPIOMUX(7,
> +				  GPO_PWM_PAD_OUT_BIT0,
> +				  GPO_PWM_PAD_OE_N_BIT0,
> +				  GPI_NONE)>,
> +				 <GPIOMUX(5,
> +				  GPO_PWM_PAD_OUT_BIT1,
> +				  GPO_PWM_PAD_OE_N_BIT1,
> +				  GPI_NONE)>;
> +			bias-disable;
> +			drive-strength = <35>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	uart3_pins: uart3-0 {
>  		rx-pins {
>  			pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
> @@ -154,6 +172,12 @@ &osc_aud {
>  	clock-frequency = <27000000>;
>  };
>
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm_pins>;
> +	status = "okay";
> +};
> +
>  &uart3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart3_pins>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index e68cafe7545f..4f5eb2f60856 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -280,6 +280,15 @@ watchdog@12480000 {
>  				 <&rstgen JH7100_RSTN_WDT>;
>  		};
>
> +		pwm: pwm@12490000 {
> +			compatible = "starfive,jh7100-pwm", "opencores,pwm-v1";
> +			reg = <0x0 0x12490000 0x0 0x10000>;
> +			clocks = <&clkgen JH7100_CLK_PWM_APB>;
> +			resets = <&rstgen JH7100_RSTN_PWM_APB>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		sfctemp: temperature-sensor@124a0000 {
>  			compatible = "starfive,jh7100-temp";
>  			reg = <0x0 0x124a0000 0x0 0x10000>;
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
