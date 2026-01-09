Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE878D232EA
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 07:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LayP5aPZn1iB54vbV3/d7H/XJhTDFgJBL8Bbn2MSlYA=; b=dA1xBjR//V/FHm
	WKRl2O0+WWj0gZGbuMs56pB0WqGyfh2qBfmt9+ooKP4pbvvp3tYlYnkEo8MQkv4YqmU/itkRBviYF
	GntMOmIa/yz79VsW2p1gCMy7A6gJ65gBcxZw9hqOv2g8+rKnQ94RAdkKHbm0POyVmvYD7IF0hKOJZ
	kQQInn65I9uiCpS9rm0KJr9H5ZtdwjjKMBXl5HSJ9Misf7DvbOd9p3lNApMppyrvMixauXXHTyglQ
	MAMW1UVcsl6/roc3rXvzmm/8D7xT3krvbUhAqQQAaG/s2UF/rtUSGEMcqyau9f9ZjfTD26t0G8sb8
	v35J/8+uDQprdTOprxtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6pM-00000001hat-3Qye;
	Fri, 09 Jan 2026 07:22:32 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve6pJ-00000001hZr-2ddd
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 07:22:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so42750115e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 23:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767943347; x=1768548147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sRdipr7aeHoIxEX2vKQujSCZ90MZhOGqhcCSnr+qqyI=;
        b=X2VTvUu/TqdekZp1za+1lYhZwNVApHp+3enGJsmidxvLGHbqb4LTtDCMantQW6QHCT
         Qf1qBZ46HMZIj5AxM8CQjJd9H4XFGx5lzPgIUjJt2WOcLTKB1oGYkYdmvVBT525XYyGf
         KJ8lQQAsC0s3tEud1CBaadKj0qYMmrCl94YnnwZALdIvO5vbyAHtXR5oOUtJImNCQTyU
         L4Ht5PfslnGaJwL2yQBVnmqAul8SXf/ArensTY8YWYte8cQwDciSTCACFoFNv55jFQPo
         izzi5SwuJWR3gXZclHXOymhcGXZ5HZR1nvnuJtcwM3ZLkDW7RrXs/xD3cVXfjacKLRwP
         dCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767943347; x=1768548147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRdipr7aeHoIxEX2vKQujSCZ90MZhOGqhcCSnr+qqyI=;
        b=i/SUUMQFdcpcHzMV1uOHXdDK67K6gzEVQ0yBoq+1SU0j2qiiN+ioviGZLqfK9iYlo6
         2iAgM+pmDYAb6aUCJb36ET+iOXuymil/7v92gzJ6goe7FCg7SBV5sRXGlsR15M70siw9
         2ict3LRLop2+UuGJI1gOK/18lXLXOOg8wIp0dd+RO22zAcmZqP33T9b5Pogr09z9jAif
         ibJpxN9hma4O/ZKQziJAWgzcO/AjkOuMNv9lAkgEcjoVhTWTr4SWWDblie8MR3+K0/Rv
         HE4DBJK7VARvmlDR/ZynDhNA8oc08Kqi8CtqghX0M15IK1dQ0Ptg/uRKyUtPZZmijs9I
         1UZA==
X-Forwarded-Encrypted: i=1; AJvYcCVOhICC7eMspDSljQnetiZXb+Y/WHcqbgXHIf3xbm8DiCLt8X/6J8YSHPkLgIX9ZD/1R0gNeQS7Aou+mg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRY6JElCKrTDw2vQYKzcAjnI7vmSVcCpR5bnNlX+uki9AdTX3n
	9CJfzOe+dR/gQ/skIyF7xoBzvkhc8IPS0totHoPevvxOcWvz67Do7B/1kghq0oS3KEs=
X-Gm-Gg: AY/fxX56VRjAmNVmVQyCpOh3x6Vph0z1srIWavpU7ETAjGZRji2qKRPsmk7GpblisAl
	/+9UBzPg93uBX4KSwvP/oD5WyG25XzeO1k/UDaoxhmR1jj4rjFkwzgVSLyNs3zSipAQmift+QYP
	rS1PoJE5Ipn5hLJ/uRJjoNC/SSP9njxRgzbEVOsEMsEfQpyqotvaEslZ0mHiqsUVHQdD9xDhwQz
	Ik1VR2thAZa2OcbHj7aDsSOAyw3dQz7GySFQR92mJrdsKC9MU2W/F7rt1Z6sEDPKruq1JpyEzmG
	Jr+z3vOH9zbkjTRqA/sFfRfgvW4wOqn4V6AuRIYLPtwNCEt9JboOJMVRJoMyvP6/EyTEDvSWNkb
	85aEtw2eUNMfmK9rRU2tAtfOvmFVTvQcKplMqBQ9TGb6+tvlBgh2oOEiOS0enZcB6ZPPP/QdqSi
	L13OCSI3ZWQKEJUBmJKg==
X-Google-Smtp-Source: AGHT+IE2w6FBykX8O9VP91rZPx4SMD5MYP+siiUCDk4NBBI8RnGVXjy6MSR8IirXqwWDEZtmmeIing==
X-Received: by 2002:a05:6000:290e:b0:430:f704:4da with SMTP id ffacd0b85a97d-432c37a74dfmr9227189f8f.58.1767943347109;
        Thu, 08 Jan 2026 23:22:27 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee243sm20575451f8f.31.2026.01.08.23.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 23:22:26 -0800 (PST)
Message-ID: <af02ffd7-4876-4bce-8a79-2b34114d6ccc@tuxon.dev>
Date: Fri, 9 Jan 2026 09:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-prude-dilation-79d275fec296@spud>
 <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>
 <20251208-flatten-devious-56abcfecd510@spud>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20251208-flatten-devious-56abcfecd510@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_232229_710861_31B44818 
X-CRM114-Status: GOOD (  13.21  )
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



On 12/8/25 20:02, Conor Dooley wrote:
> On Sat, Dec 06, 2025 at 01:18:30PM +0200, Claudiu Beznea wrote:
>>
>>
>> On 11/21/25 15:44, Conor Dooley wrote:
>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>
>>> This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
>>> symbol has been defined for some time on RISCV so drop it without any
>>> functional change.
>>>
>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>   drivers/clk/microchip/Kconfig | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
>>> index cab9a909893b..a0ef14310417 100644
>>> --- a/drivers/clk/microchip/Kconfig
>>> +++ b/drivers/clk/microchip/Kconfig
>>> @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
>>>   
>>>   config MCHP_CLK_MPFS
>>>   	bool "Clk driver for PolarFire SoC"
>>> -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
>>> -	default ARCH_MICROCHIP_POLARFIRE
>>> +	depends on ARCH_MICROCHIP || COMPILE_TEST
>>> +	default y
>>>   	depends on MFD_SYSCON
>>>   	select AUXILIARY_BUS
>>>   	select COMMON_CLK_DIVIDER_REGMAP
>>
>> OK, I found v2 in my inbox. Same symptom here. It doesn't apply on top of
>> the current at91-next either.
> 
> I think this should sort itself out after -rc1, but I'll resend if it
> doesn't.

Still doesn't apply. It conflicts at least with
commit c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")

Thank you,
Claudiu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
