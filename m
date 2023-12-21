Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6ACC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 15:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCX5h83RTykoe8/16jZgOOw2ms9ds3qJ6c35ekchjm8=; b=PxOC+ciaxeNq/0
	0YJ7MeG7pLLnHaWLxQcCXtit+ShIo01vutX0kc0TkPwlrpUsbrI7vnIkhdVmlmBEaOMnmJ2kwfgeo
	7AqlvCU2aSuowmpPlz4mGW+THwiP30W5Mi3gEB+wnwAvJJAcuZRzAixpFQwaqhW4AB+cuXltnhBr0
	wxNRFuddVLr0vb7dNxPi08UX+5j2vmSZoSIDu3/1FqZZ7ZhI0AcxnnXyL/+TzagMz1cZGisEB3G8Y
	zkN9dkXOykPv32bJltaLyhap2gw6SKvjqj7XDSm+Fe4ECiztqd7llaG8soiZxNuX5IsqiotXrMGAW
	JcgOP7i8dPUvJ7ILmsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLMM-003QVw-25;
	Thu, 21 Dec 2023 15:53:18 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLMJ-003QVE-1J
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 15:53:17 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2cca502e642so4095321fa.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Dec 2023 07:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703173993; x=1703778793; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDrrIdjlKkAVYHhks69AqjX6/crnGDz7sEjm8hq2EtI=;
        b=v+05tjgx+FQrt+0fYu6ncVQIscccl90N+AB64jp1CEbtS/S2CcZgKwsIk3ZBgwyRHV
         gYxyd/M1RNqtfCvjANyF8u4HVI0v6vaqKNNNccyIbiarKewAvDq6FRRUa1HOpdm9p5HB
         hbS1S5M8GV2Am2+7+cauYp5+B0pf3niLYYnAdxwLOEmXOx5F6aTYA+bFgAFRB4O2UJTJ
         AP04xBGmZ4a6yLR2Fk3Kg8qeTho3mSqCnVbRZftNKO7LygJM3ABHQ7uFjeTp/bYSQS0j
         nxz10dYUy5arXDOw5455PHXwmwS1K86rBt6XF1prAR5gAuWfNRCg9UN3bczaalsT5ViV
         CBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703173993; x=1703778793;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDrrIdjlKkAVYHhks69AqjX6/crnGDz7sEjm8hq2EtI=;
        b=mqK9jJc52PMM8kQQg1pO0Gz6IhTD39D41kKGhApHlZv826lYqUd0RU0p1S1YwzdH6z
         Z9cB9B0fhnjPrbIlSgjAxTdSIvz4ThuagNma3r7b2Otn8e/0vgPZiFRJYr1YcqIFbFxj
         46td4QzRwg2qXGHFLBF2VAGGTa3RDgt8XTgXmUMKdY7lBloteyuB6+hOujvEcKAtiPlk
         WWri4UMFovOh7x0ETDPONo1lfe56WjtBrLSnqxTZCwVqlmKfXfds4yCgP8wWpVImPpI/
         +mfYTYF59Df036vH1HVAj0WHj7JKSZEjNWfOExaxnkyrmVzNWNLIUUxi9IDph/eLch5g
         NKtg==
X-Gm-Message-State: AOJu0Yz2oKcVDoB1StrscheJuFsj/TTOO0PsUk/+rLxMhK/RUB/OBew+
	Gk//RzvWwsQKEcb+1ydYcrMhmg==
X-Google-Smtp-Source: AGHT+IGMe6tn+9yupgK9xl4jzrWZFb4Y7XjFnFbDwcRcReEwEO/uEZjLbELU6cNodcI+K9XDidfxkQ==
X-Received: by 2002:a2e:be8b:0:b0:2cc:6bf0:8ea with SMTP id a11-20020a2ebe8b000000b002cc6bf008eamr2429410ljr.34.1703173993094;
        Thu, 21 Dec 2023 07:53:13 -0800 (PST)
Received: from [192.168.0.22] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id z23-20020aa7c657000000b0054ccac03945sm1319836edr.12.2023.12.21.07.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 07:53:12 -0800 (PST)
Message-ID: <f72b6ea4-a99b-4821-bb35-ee47b7b5cb8f@linaro.org>
Date: Thu, 21 Dec 2023 16:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 6/6] riscv: dts: starfive: jh8100: add pinctrl device
 tree nodes
Content-Language: en-US
To: Alex Soo <yuklin.soo@starfivetech.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Hal Feng <hal.feng@starfivetech.com>,
 Ley Foon Tan <leyfoon.tan@starfivetech.com>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <drew@beagleboard.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20231221083622.3445726-1-yuklin.soo@starfivetech.com>
 <20231221083622.3445726-7-yuklin.soo@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231221083622.3445726-7-yuklin.soo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_075315_473400_170A05CB 
X-CRM114-Status: GOOD (  18.37  )
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

On 21/12/2023 09:36, Alex Soo wrote:
> Add pinctrl_east/pinctrl_west/pinctrl_gmac/pinctrl_aon device
> tree nodes for JH8100 SoC.
> 
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

I have some doubts about it...

> ---
>  arch/riscv/boot/dts/starfive/jh8100-evb.dts   |   5 +
>  arch/riscv/boot/dts/starfive/jh8100-pinfunc.h | 418 ++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh8100.dtsi      |  44 ++
>  3 files changed, 467 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-pinfunc.h
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh8100-evb.dts b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
> index c16bc25d8988..8634e41984f8 100644
> --- a/arch/riscv/boot/dts/starfive/jh8100-evb.dts
> +++ b/arch/riscv/boot/dts/starfive/jh8100-evb.dts
> @@ -26,3 +26,8 @@ memory@40000000 {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&pinctrl_aon {

Wrong order. Nodes do not go to the end.

> +	wakeup-gpios = <&pinctrl_aon PAD_RGPIO2 GPIO_ACTIVE_HIGH>;
> +	wakeup-source;

None of these were tested.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).

> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh8100-pinfunc.h b/arch/riscv/boot/dts/starfive/jh8100-pinfunc.h
> new file mode 100644
> index 000000000000..3fb16ef62d90
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh8100-pinfunc.h
> @@ -0,0 +1,418 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + * Author: Alex Soo <yuklin.soo@starfivetech.com>
> + *
> + */
> +
> +#ifndef __JH8100_PINFUNC_H__
> +#define __JH8100_PINFUNC_H__
> +
> +/*
> + * mux bits:
> + *  | 31 - 24 | 23 - 16 | 15 - 10 |  9 - 8   |  7 - 0  |
> + *  |  din    |  dout   |  doen   | function | gpio nr |
> + *
> + * dout:     output signal
> + * doen:     output enable signal
> + * din:      optional input signal, 0xff = none
> + * function:
> + * gpio nr:  gpio number, 0 - 63
> + */
> +#define GPIOMUX(n, dout, doen, din) ( \
> +		(((din)  & 0xff) << 24) | \
> +		(((dout) & 0xff) << 16) | \
> +		(((doen) & 0x3f) << 10) | \
> +		((n) & 0x3f))
> +
> +#define PINMUX(n, func) ((1 << 10) | (((func) & 0x3) << 8) | ((n) & 0xff))
> +
> +/* sys_iomux_east dout */
> +#define GPOUT_LOW				0
> +#define GPOUT_HIGH				1

Where are these used?

> +#define GPOUT_SYS_CAN0_STBY			2
> +#define GPOUT_SYS_CAN0_TST_NEXT_BIT		3
> +#define GPOUT_SYS_CAN0_TST_SAMPLE_POINT		4
> +#define GPOUT_SYS_CAN0_TXD			5
> +#define GPOUT_SYS_I2C0_CLK			6
> +#define GPOUT_SYS_I2C0_DATA			7
> +#define GPOUT_SYS_I2S0_STEREO_RSCKO		8

You add here bunch of constants not used anywhere. No single example of
their usage, not a one.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
