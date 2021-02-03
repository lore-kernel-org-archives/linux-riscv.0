Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 558FFC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 23:14:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A3464F55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 23:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6A3464F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BDKhg8n4p0dVJwwSkpdiqlpWaiAcvTq5ZEXRjBXtHYk=; b=nIZ9AH9rsnox/6iWGhhVzRTkc
	3UTekAOhkHloip+kn5qtzInkbyRm7qZDALHeq5g0orDuuyUS1xdyHtpmB2/OI8VgKoLDVFQxL7I/+
	irWs46gJ+NpDwaQXsF3ppFHoyPHO5uudZRUdFWjCeekJ/AQM1APp4yIv8kIhLLCVnqpORxqcUoaN2
	HcalSolKfJYv7A/JhPqxd6Tm+w4qTM9MCVPO3tFMLcwrTZf+VtEOCS3Keu+0l6e6HRbuVdQKMlTLi
	5QS0sm1AJML0h3JnLF+8+QBEKqW9kbaK5tUu4ehaNKdYosWPw/RqLfdKfdmp3gyKym3mInwlSoUhY
	H56p/znqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7RLI-0006rz-AM; Wed, 03 Feb 2021 23:13:48 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7RLF-0006rF-RK
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 23:13:46 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id a1so847925qvd.13
 for <linux-riscv@lists.infradead.org>; Wed, 03 Feb 2021 15:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=voqQoZ3YZqf0Z/pR7YykXy9pqX6l4kg0PmwwwlXbpf4=;
 b=ZF06FB+nVWeMu0eOTcu4sFf24wJMdeXUtUl78TYWTv40ZVV042Wy6J1pTJ9ZKWSrP0
 qunFZAjufn96IU+36z8+rCK7oWnX7I+llftIUz8VkE0BsGbTW10j/+30UbXuPm76q/2I
 oO0eAxoDpNUc9O+1CGvXg32mHIjUq4Iiy9CX3wsRb66XqbaMBwzAuBCpOcxw2Xtq7K0h
 xpzp9fD00ZJ7AzPi2Z/Nq3SD06GXkN8VZFG6cWfUyuqRoJ+1K2Kv+QIqfJXKMjxFFGMr
 CA8ZTEgIg0TwcN8W9NmB9750RXjiy3ohF9YFHftb3DBp2+Tcrqy08Li0CGdYRvmJ5/kL
 9spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=voqQoZ3YZqf0Z/pR7YykXy9pqX6l4kg0PmwwwlXbpf4=;
 b=U5RdPN20+km3yNk2CZP3X4isqc2d9L0H308SCdER+rEGfLqYuBnAnbs5n1CgEgRwlQ
 0RJFMrI2VK0hyRTwpplHBSk5zPZwIzKTJc6UY2xZ3OYnXNA6DkgjFHL3baASODvZ+yFm
 R9pae1XZBeSlN1j++IhdOtsv2T+ScYCBQB8FjbAQygx4Cfg/vYJGgyR4BDAaT1BY6IhM
 hRfX6SG+xOg+M1MrgxUSXhkD4aY2yi+PKKvpyD6yzE7kXhaV7AOIKSMtJbGRW/kUYCMw
 OYgoaNmqYxc0N4au7oqJ9mD3YgScoAfNnnyetIpYP1fP/iBPdJ0JcMk+35xrVx9f4Hb6
 ViJA==
X-Gm-Message-State: AOAM530SiMx8mpRB+u/2aKCtpoguyHkMjTcxcUzghZ+olgsx2cC7oIG4
 CQSPOed0FL3EZu8RRaVf4WY=
X-Google-Smtp-Source: ABdhPJyFpJ/dpl4eW3S8VUV6yCIkLxoJjUVjOObZvUqRW/1Z8YUQV7iD1ocfSXkSDQ7kSxbyH7zOCg==
X-Received: by 2002:ad4:5be9:: with SMTP id k9mr5172756qvc.18.1612394023587;
 Wed, 03 Feb 2021 15:13:43 -0800 (PST)
Received: from [192.168.1.201] (pool-108-51-35-162.washdc.fios.verizon.net.
 [108.51.35.162]) by smtp.googlemail.com with ESMTPSA id
 u133sm3358665qka.116.2021.02.03.15.13.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 15:13:42 -0800 (PST)
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
To: Rob Herring <robh@kernel.org>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
 <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
 <700da807-a5c8-a552-3d50-948b3ff6a734@gmail.com>
 <CAL_JsqK-zuhq=rkHyXPMbcGyFhMdfShZYeNhSzLbCu8c7RvCGQ@mail.gmail.com>
From: Sean Anderson <seanga2@gmail.com>
Message-ID: <de7566fc-6b4d-3cdf-0cc5-1d2c5909bd5e@gmail.com>
Date: Wed, 3 Feb 2021 18:13:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK-zuhq=rkHyXPMbcGyFhMdfShZYeNhSzLbCu8c7RvCGQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_181345_941559_C3DAF435 
X-CRM114-Status: GOOD (  28.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2/3/21 3:23 PM, Rob Herring wrote:
> On Tue, Feb 2, 2021 at 6:01 PM Sean Anderson <seanga2@gmail.com> wrote:
>>
>> On 2/2/21 2:02 PM, Rob Herring wrote:
>>> On Tue, Feb 2, 2021 at 4:36 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>>>>
>>>> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
>>>> interrupts property description and maxItems. Also add the standard
>>>> ngpios property to describe the number of GPIOs available on the
>>>> implementation.
>>>>
>>>> Also add the "canaan,k210-gpiohs" compatible string to indicate the use
>>>> of this gpio controller in the Canaan Kendryte K210 SoC. If this
>>>> compatible string is used, do not define the clocks property as
>>>> required as the K210 SoC does not have a software controllable clock
>>>> for the Sifive gpio IP block.
>>>>
>>>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>>>> Cc: Rob Herring <robh@kernel.org>
>>>> Cc: devicetree@vger.kernel.org
>>>> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
>>>> ---
>>>>    .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
>>>>    1 file changed, 18 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>> index ab22056f8b44..2cef18ca737c 100644
>>>> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
>>>> @@ -16,6 +16,7 @@ properties:
>>>>          - enum:
>>>>              - sifive,fu540-c000-gpio
>>>>              - sifive,fu740-c000-gpio
>>>> +          - canaan,k210-gpiohs
>>>>          - const: sifive,gpio0
>>>>
>>>>      reg:
>>>> @@ -23,9 +24,9 @@ properties:
>>>>
>>>>      interrupts:
>>>>        description:
>>>> -      interrupt mapping one per GPIO. Maximum 16 GPIOs.
>>>> +      interrupt mapping one per GPIO. Maximum 32 GPIOs.
>>>>        minItems: 1
>>>> -    maxItems: 16
>>>> +    maxItems: 32
>>>>
>>>>      interrupt-controller: true
>>>>
>>>> @@ -38,6 +39,10 @@ properties:
>>>>      "#gpio-cells":
>>>>        const: 2
>>>>
>>>> +  ngpios:
>>>> +    minimum: 1
>>>> +    maximum: 32
>>>
>>> What's the default as obviously drivers already assume something.
>>
>> The driver currently assumes 16. However, as noted in reply to Atish,
>> the number of GPIOs is configurable.
> 
> So you need a 'default: 16' here.

There is no reasonable default. This device can be configured to have
any number of GPIOs between 1 and 32.

>>> Does a driver actually need to know this? For example, does the
>>> register stride change or something?
>>
>> No. I believe that the number of GPIOs sets which bits in the control
>> registers are valid. So the maximum number of GPIOs is the word width of
>> the bus.
> 
> So like register access size (e.g. readw vs readl)? If so, we have
> 'reg-io-width' for that purpose.

This is just the "maximum configurable" due to how the device's
registers are laid out. If you wanted to have more GPIOs than the
register access size, you would need to make more extensive (and likely
incompatible) modifications to the device. However, I don't believe
there are any devices with 64-bit register width (yet) and the driver
does not support 64-bit accesses.

> 
>>> Please don't add it if the only purpose is error check your DT (IOW,
>>> if it just checks the max cell value in gpios phandles).
>>
>> Why not? This seems like exactly the situation this property was
>> designed for.
> 
> Because it is redundant. All the GPIO lines you want to use should be
> connected to something with a *-gpios property. If not, then that's a
> failure to describe part of the h/w.

This is wrong. On SoCs with pinmuxing (such as this one), not all GPIO
lines may be connected for any particular board.

> For comparison, we generally don't define how many interrupts an
> interrupt controller has. Or how many power-domains a power domain
> provider has. I can go on with every provider/consumer binding...

And yet the in-kernel documentation *specifically* recommends using this
property in this situation. I suggest you submit a patch to remove that
paragraph if you think that it is not necessary.

--Sean

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
