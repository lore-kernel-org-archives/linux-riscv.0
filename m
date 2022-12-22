Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F14C001B2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 09:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KDPURqScWZCtci0hRCvkZsGIvB56028q+jaTEDjZe4Y=; b=aXC6goNsjX2Jfy
	YeILsBgmODopccCcvxdwSGgViTtLoL3ywesJ4ex0cT3drmU+hMxatuS6oziUSepoBEVukTy/tqsWU
	4NHuQ9FlwwY3lRFG2jwtVKpWwt2X3m3kovVFYMPZsk0NHia3JSirXbwy63qFI/IqcTBiu8yC8iGkG
	1S7gdNsmbSddLbq0ZsenDaI6FlMU9RuOEglmd/b82ZiPQa0heCeFn/Y3ERCTCR8m1zmNZVAknA82+
	6Z0F1qqbJZUh5N8M49VBVdTxN6ki+XnUSnc1x3YgJtkrMqSvfoZWw3y7b0sCYXM1fc999Z0yPugAB
	y4ZfOmVqL9rKOTmHh/xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8I7I-00A4i2-BY; Thu, 22 Dec 2022 09:43:56 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8I6z-00A4aj-0J
	for linux-riscv@lists.infradead.org; Thu, 22 Dec 2022 09:43:38 +0000
Received: by mail-lf1-x136.google.com with SMTP id b3so1939695lfv.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Dec 2022 01:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbnftUr0skysBxQQtBVmUp3dl+iPH1CkZ/Pevi319Z4=;
        b=tu5TQQc2y5XhDDuW5z1bMNpX9zKfROA3s5jKB9G0KQjOJuNM2bcBSmMPCvwgakyl5O
         uL6oS7md17Acf9ENu9PcB0kxW4Coynu1r1eUkQWdVgV1NSRIxpc8r+QvnR4n0GmhSPlz
         NW+6+Un28/jlsP/TVjS202yZFoW38ETk9BCzr60pUDqT+pMNb/+kBEme71AG7oFnBEvB
         tch9duUW2ZeBOftJyGZojAM7ZbJz//uWip1R8Qnald2rMy3Ip6hviGMJJAzxjZLLgMAZ
         cylKCWrrFaG2G1VV7AtoiPrpLACzWpYQOAkWKtkXXDPlXeyJd70fqFc/3+I+7CwnseFK
         ORvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbnftUr0skysBxQQtBVmUp3dl+iPH1CkZ/Pevi319Z4=;
        b=2qFkemxlIHIBdrMaBd09jH0wD3iXHjlmpkX9Bx5t5FArX4ZJYEqLo34b9tFZVanbze
         VvYNjZg37xKYVrGL9tfMNgsyQ8w9ByOiU56+pVTLcnnGJmNXNiqBZ9Th3TNMppleaUoi
         GABskb7UKwQO7Wkhi8QKSMEbUeGATBAj8qURB0sPHxE6vMfElgtTh6DwYiXKRgaE1x1+
         OHbGmyRmLBuuNvV5K1Jpv89+FOup1HDrd7wKKbADNzAQ28rWirxbwLpPQMhkMGtkNCvp
         JpNd0XDniVYp5QSgied2QyIeFF6tsOmyicXAn+Fa24Va6RW+B+pgVuIgKba32VFYso/N
         9uog==
X-Gm-Message-State: AFqh2koVJPEWTfeAYTreNW7fMhmEos0fnLQn+I4RV8F3Cfs+qrJJj7lg
	eMg+IRRtAAB5Wa1sXs2ytnSvPg==
X-Google-Smtp-Source: AMrXdXtIO/l/UEsk2MV0XgK6wMm0UkQrCvnZKcwe7Ug7pLVDdSRQxWA3YLc4a7ZfaL4xaMUG9Yifzg==
X-Received: by 2002:ac2:4ecd:0:b0:4a4:68b9:6085 with SMTP id p13-20020ac24ecd000000b004a468b96085mr1334382lfr.16.1671702212876;
        Thu, 22 Dec 2022 01:43:32 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z1-20020a0565120c0100b004b4b600c093sm15902lfu.92.2022.12.22.01.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 01:43:32 -0800 (PST)
Message-ID: <27f1c084-60b4-daeb-0ffe-c0500aecbd49@linaro.org>
Date: Thu, 22 Dec 2022 10:43:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
Content-Language: en-US
To: JiaJie Ho <jiajie.ho@starfivetech.com>,
 Olivia Mackall <olivia@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Conor Dooley <conor.dooley@microchip.com>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20221221090819.1259443-1-jiajie.ho@starfivetech.com>
 <20221221090819.1259443-3-jiajie.ho@starfivetech.com>
 <05aaa9f8-7a97-51c9-e18a-1c3753f2006b@linaro.org>
 <69dca1be673a40729d750c00d927b437@EXMBX168.cuchost.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <69dca1be673a40729d750c00d927b437@EXMBX168.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_014337_174489_8247CF98 
X-CRM114-Status: GOOD (  22.11  )
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

On 22/12/2022 10:35, JiaJie Ho wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, December 21, 2022 5:49 PM
>> To: JiaJie Ho <jiajie.ho@starfivetech.com>; Olivia Mackall
>> <olivia@selenic.com>; Herbert Xu <herbert@gondor.apana.org.au>; Rob
>> Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>
>> Cc: Emil Renner Berthing <kernel@esmil.dk>; Conor Dooley
>> <conor.dooley@microchip.com>; linux-crypto@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
>> riscv@lists.infradead.org
>> Subject: Re: [PATCH 2/3] hwrng: starfive - Add TRNG driver for StarFive SoC
>>
>> On 21/12/2022 10:08, Jia Jie Ho wrote:
>>> This adds driver support for the hardware random number generator in
>>> Starfive SoCs and adds StarFive TRNG entry to MAINTAINERS.
>>>
>>> Co-developed-by: Jenny Zhang <jenny.zhang@starfivetech.com>
>>> Signed-off-by: Jenny Zhang <jenny.zhang@starfivetech.com>
>>> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
>>> ---
>>>  MAINTAINERS                            |   6 +
>>>  drivers/char/hw_random/Kconfig         |  11 +
>>>  drivers/char/hw_random/Makefile        |   1 +
>>>  drivers/char/hw_random/starfive-trng.c | 403
>>> +++++++++++++++++++++++++
>>>  4 files changed, 421 insertions(+)
>>>  create mode 100644 drivers/char/hw_random/starfive-trng.c
>>>
>>
>> (...)
>>
>>> +static const struct of_device_id trng_dt_ids[] = {
>>> +	{ .compatible = "starfive,jh7110-trng" },
>>> +	{ }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, trng_dt_ids);
>>> +
>>> +static struct platform_driver starfive_trng_driver = {
>>> +	.probe	= starfive_trng_probe,
>>> +	.driver	= {
>>> +		.name		= "starfive-trng",
>>> +		.pm		= &starfive_trng_pm_ops,
>>> +		.of_match_table	= of_match_ptr(trng_dt_ids),
>>
>> of_match_ptr goes with __maybe_unused. You will have now warnings, so
>> please test more your patches (W=1, sparse, smatch).
>>
> 
> Hi Krzysztof,
> 
> Thanks for reviewing this patch.
> How do I properly handle __maybe_unused functions in this scenario?

The same as in other files. Use `git grep`

> Will it help if I add #define as follows:
> 
> #ifdef CONFIG_PM
> #define STARFIVE_RNG_PM_OPS (&starfive_rng_pm_ops)
> #else
> #define STARFIVE_RNG_PM_OPS NULL
> #endif

I talked only about of_match_ptr(). This is not of_match_ptr and should
have its own syntax (pm_sleep_ptr + static DEFINE_SIMPLE_DEV_PM_OPS)

> 
> static struct platform_driver starfive_trng_driver = {
>         .probe  = starfive_trng_probe,
>         .driver = {
>                 .name           = "starfive-trng",
>                 .pm             = STARFIVE_RNG_PM_OPS,
>                 .of_match_table = of_match_ptr(trng_dt_ids),
>         },
> };
> 
> I did build the patches with the tools mentioned but did not get warnings.
> Do I need a specific version, or have I done something wrong?

You just need proper COMPILE_TEST config with OF disabled.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
