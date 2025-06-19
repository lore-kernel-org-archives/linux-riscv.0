Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B84B0C7115D
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3DTZSHpPIv5ny23w6jZZx8MINT3GAu8eILy3+hzY3Y=; b=czgQ7xyrWIOh+I
	a1vQ0iyIK/+58UoEnT1XHOdH22XzXbRezE7xefbSOVv5Njrr9sMxa5rzwuqMnJQ5fao7Qd5NmZxJi
	0xx93UT4qENlUV+p71wTpFUZiMU02ERASHmJ6plOVnSYMufURx3Ee6ueL1Wa5Dy4hFrMhtCiRF4AY
	6pYUpOxbfo/sK8fb4wD+MP79p2J6+wW0mt93jjOBnuOQqxKAhXzGPrJKg2LWv2T14ctOEi4IWSOlu
	AY9AcKFdRmL9EOE62AVkm3bI3A3VX5usBr5NZ3C8cZPpcV7mQorbkqgqW4oPLVbJ31UL0rVQDwElH
	25hG4xJibXziU/Wnkz2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIef-0000000Denz-2nRr;
	Thu, 19 Jun 2025 17:02:25 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSFFC-0000000D9kF-17Ol
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 13:23:55 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-73a45bb2ac6so609118a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jun 2025 06:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750339433; x=1750944233; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMgLZ/LtsoXII7nkbaS4tPTkpnKfRrfyc3zePK7XFH4=;
        b=Me7crAB5yonXhXZk5zejaqaszMgdqwy9oDOdendweKvjLRjCWL7Du5Gpgmann7EBAO
         K1Fxdr+qyN/GX1zp2TjoLnZZIKuFolmunGNPWZ8Gp1fSH11buhoQWEqGIuOgy/VNXL+u
         /qEIEOOLvPuSCOY8l5/kA8itkAzYZ37VEGZLo0F6+CstR76mN3tDPuJFHj0HL3Gh97KC
         mu0c0czZZ7AOwWKWJ5wC02h8qUCnch7OwcSGOSMA2xDxjTsPc85Q2PymIa/a+YpiKUO9
         fh3qJSS5ARs75gsmNM1AbB3k3To/9mmFlRGqcNs6/V/S/MchQQ4i0e62KrHlQ47mcNlp
         aI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750339433; x=1750944233;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMgLZ/LtsoXII7nkbaS4tPTkpnKfRrfyc3zePK7XFH4=;
        b=SsrTdCcT6MrlDBTvY5R3Sg233uUJYMATTqWnvAh+skTTId926YsEnl8g0C8PodDGuq
         0Xye3A9ZuMKSJWOj0ekXh9SPuQcRv6PD8i/6yaBHlumRNGxgxzDf9XCV2W3RhPyM2eW3
         zvRsPlCfHvUTsvBuFDSGwHD3zSaH32lLppum6xN/0pPJ2z6bjXNeAUFlzsEVFME5IerV
         7hfpHzsBvkOZwH3f5Anb3wcH9yoWcXhZmzwUA6/e6Wt4t3Tff/IEDXYmFPIciB/ftwk0
         cDv26KcrodXior+pLE9pC9i8VWwC3gonPak90Dnyy88bRUDINh4nL+so3pwbBsmlBgTv
         t2VA==
X-Forwarded-Encrypted: i=1; AJvYcCXnYM7U5Y2SVDV2JyM42Ww6ly25ZWUp6rsoEbbi2d8eDdZrUgjwe9xBDfTtN4CQwTyLaFTiioPqUq0Rag==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDeXfhSNFSh9glVDxJdIQMvjZHSOxLkcTS2OOi7SkMWBDO8CZw
	zUpC2l377lzK2B3M6AUOBxsh8OjeBzz8utP+ULOS2RuC4rQmI3B16wQxwHh6KnywHE4=
X-Gm-Gg: ASbGnctYAiDrFkXl1g+7xEfpAU6VKiNl0G4QGC1rs7pMQPqLZ+pd4FVKd/ZPhnwhOQH
	prglS+MjKhQjtmLA/xuO5kzCADxdFbC4tkWuILAsUZ1S9D12EbME24lYHjkL2hLergbKQ+7edad
	Kj2LmunnPV3Y5vCUG/evQEg3kueSZhP6kNoi+anBIJE8MdWSOXHh1toAfb2N0mfGpeQwHhjfe1Q
	CcCr3xxht3vkmf15uksi4vVYJJ2Vsv25UYe8BLHFGGCqr56f/ie9XnINtbRGkZCzVcWTKH2zzrF
	qjU/hwgo/dRwNTeXupvMn6RelkEk1ycLhslP8AalxH0u9inxByWFPgpY4u2QTQec7Jun/KlgepG
	29YqWfJs9cZErQvBrhdiAKxel+w==
X-Google-Smtp-Source: AGHT+IFv7xGd3UTr9p6P6RvePe4D/mQncFt71O03oqdU9wFu4hav14OEVRV5ZjR0JYA/8QQYzl/Uag==
X-Received: by 2002:a05:6830:8207:b0:736:8a4:6835 with SMTP id 46e09a7af769-73a36297f86mr11682241a34.2.1750339433423;
        Thu, 19 Jun 2025 06:23:53 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a6e73284fsm645977a34.64.2025.06.19.06.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 06:23:53 -0700 (PDT)
Message-ID: <6504c609-f8b5-42e3-88ad-5cbee30a52ed@riscstar.com>
Date: Thu, 19 Jun 2025 08:23:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] regulator: spacemit: support SpacemiT P1 regulators
To: Vivian Wang <wangruikang@iscas.ac.cn>, lee@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@gentoo.org
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, troymitchell988@gmail.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250613210150.1468845-1-elder@riscstar.com>
 <20250613210150.1468845-4-elder@riscstar.com>
 <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <acac9522-fb19-4659-8e1a-544bf75f3864@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_062354_307906_AC56CC02 
X-CRM114-Status: GOOD (  17.79  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 6/19/25 1:15 AM, Vivian Wang wrote:
> On 6/14/25 05:01, Alex Elder wrote:
>> <snip>
>>
>> diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
>> index 6d8988387da45..7bb7b8fad24f2 100644
>> --- a/drivers/regulator/Kconfig
>> +++ b/drivers/regulator/Kconfig
>> @@ -1384,6 +1384,15 @@ config REGULATOR_SLG51000
>>   	  The SLG51000 is seven compact and customizable low dropout
>>   	  regulators.
>>   
>> +config REGULATOR_SPACEMIT_P1
>> +	tristate "SpacemiT P1 regulators"
>> +	depends on ARCH_SPACEMIT || COMPILE_TEST
>> +	default ARCH_SPACEMIT
>> +	help
>> +	  Enable support for regulators implemented by the SpacemiT P1
>> +	  power controller.  The P1 implements 6 high-efficiency buck
>> +	  converters and 12 programmable LDO regulators.
> Needs module name in help text, as is the case with spacemit-pmic.

I will add this text.

>> +
>>   config REGULATOR_STM32_BOOSTER
>>   	tristate "STMicroelectronics STM32 BOOSTER"
>>   	depends on ARCH_STM32 || COMPILE_TEST
>>
>> <snip>
>>
>> +static struct platform_driver p1_regulator_driver = {
>> +	.probe = p1_regulator_probe,
>> +	.driver = {
>> +		.name = "spacemit-p1-regulator",
>> +	},
>> +};
>> +
>> +module_platform_driver(p1_regulator_driver);
>> +
>> +MODULE_DESCRIPTION("SpacemiT P1 regulator driver");
>> +MODULE_LICENSE("GPL");
> 
> If this driver is compiled as a module, it needs to be found by modalias
> so the driver auto-loads after spacemit-pmic registers the regulator
> device, so you need:
> 
> +MODULE_ALIAS("platform:spacemit-p1-regulator");
> 
> Also, consider extracting the name to a macro:
> 
> #define DRV_NAME "spacemit-p1-regulator"

I will implement both of these suggestions (and will do so in
the PMIC driver as well).

> Also, consider naming this consistently: "spacemit-p1", or
> "spacemit-p1-regulator"?

Let me see if I understand your comment, by explaining the
naming I used.

The PMIC driver could support a different PMIC.  Its OF
match table specifies a compatible string with matching
data, and the data describes attributes of the P1 PMIC.
So that driver uses MOD_NAME "spacemit-pmic".

This driver describes specifically the regulators found
in the P1 PMIC, so it uses "spacemit-p1-regulator" as
its MOD_NAME.

You might still be right; but does this change what you
are suggesting?

Thanks.

					-Alex

> 
> Regards,
> Vivian "dramforever" Wang
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
