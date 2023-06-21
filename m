Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B4AEB64DC
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 08:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVUB2n4dXuZzlyssRO4y04p/iCVYLFs+t7lsNO/e7OQ=; b=miRFe8pdzwGknn
	818MtZjqnyK1ohYdJbF6bIvwQOSn+6XdnX/JnfAhRupuhKiO2+baUQTW3cHbbwPhtSY+TMy49nZbV
	XaMRVbigfyVZDwbLW+Xqy7HDFnnkkHtODOPbg1Gv1iTh3ESwKlN5gnfi1X766v40Lmdd3u1lpQvTu
	pFvamhR4bHPqEv490/LCyVwTldY38jY0E/foOS+1LeWqYy6xyQUiCiWlgAhTSa/jszHOTePzUIWeA
	0oY6eOAhfO77EyJ6Y48CP4RsFt03eUoV9mZboZCDgDq3PhPzWMYKgsGq2mHKZaGny0m4LKDrBl1cD
	NWaRZXVay8h6spaYQzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsva-00Der6-1D;
	Wed, 21 Jun 2023 08:10:58 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsvX-00Dep8-1l
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 08:10:56 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-987c932883bso673374666b.0
        for <linux-riscv@lists.infradead.org>; Wed, 21 Jun 2023 01:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687335052; x=1689927052;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bALinTqbF/qOXgwdMyTFwrJC13kjvO/KOdsOe67RJS8=;
        b=HvemXir9m0Vmr9h4OBYoksSM7VKxai/edGasJTbOJ7/sO+PBuAydA2ohrP9V7/ypLF
         D6AvAbW9XbDUk0QdCUWjo2dDR/MN9r4K5ZpVdCH7DEoM2Zl3JW6sP6PLUb/Ms+FEnlXm
         rE2ayCc01rk9rdYDVHofbosWCgr9nhiwIWy7vF+6C/78ZNe/OdlmdXFXf0oHXmO4DKcr
         pkFSsEGrJj1NuNWML9lkNGQ2rWAtb42GVbmFatGwz4SGstSJadpFHv96DHuHof1rnhal
         tDPxfWIOWxLTisQ4NBapL8vqP0G31R+jYV/koiz6bsVCXJZQumjnShW7cImMOhBfqM9r
         bVsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687335052; x=1689927052;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bALinTqbF/qOXgwdMyTFwrJC13kjvO/KOdsOe67RJS8=;
        b=QYmOXyVeJRqvrPPsdfr0wQzD1Bjf8q5A9EVhfkuW5YjDgw3rqwYCTRAVj21offjPyI
         LxGUIJTHvgAetAYQX5zs0t7NbIGpnaqK2MbRnz5lyww/aSdGiEftHaSLH+HzHUMqmUsi
         fy2RDwZNxHqcCvEL/l5s83BwQ8gnN3HaMgsV/IhPybLSyi4ZUxayEVWe733zqHcTC3y9
         sUcmzDqvoLAmKKqqQlcP+H5jEt1lbFVT2Ut5/3Fr4DgfndvztAp2L/eK7hHqy4Yamlzk
         g8yhdnSWCQGVy2wziIQbm9lrT+KtmQCafxveN3qYBVZJWcsodwlHS1UcAr16Rxx9Mofe
         /V4A==
X-Gm-Message-State: AC+VfDx5hpxvVyG1mN7ZgEKLqnAjGN+hCg3CtjeD+xMfwJdRbVhguJL5
	S92BuAv9Vbm6VssKkX3ovhFxrg==
X-Google-Smtp-Source: ACHHUZ7wPyUWkTtvUQZCVeRO6eUm0VUxn3oehvqnzgwJIhLbSMEEEEDcfYDRdNFuKMIdlGMw1Tcd5g==
X-Received: by 2002:a17:907:a41e:b0:989:2368:20d9 with SMTP id sg30-20020a170907a41e00b00989236820d9mr4221444ejc.75.1687335051832;
        Wed, 21 Jun 2023 01:10:51 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id ox4-20020a170907100400b00987316d1585sm2738614ejb.145.2023.06.21.01.10.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 01:10:51 -0700 (PDT)
Message-ID: <adc4d83e-5bec-b925-b55e-43ad441ad8ee@linaro.org>
Date: Wed, 21 Jun 2023 10:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/3] dt-bindings: qspi: cdns,qspi-nor: Add clocks for
 StarFive JH7110 SoC
Content-Language: en-US
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Ziv Xu <ziv.xu@starfivetech.com>
References: <20230619083517.415597-1-william.qiu@starfivetech.com>
 <20230619083517.415597-2-william.qiu@starfivetech.com>
 <4937f9c4-a0e0-fd37-d71b-e7488b2a1062@linaro.org>
 <fb608232-f44d-21cf-7e0e-28829196e677@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fb608232-f44d-21cf-7e0e-28829196e677@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_011055_586787_0AB9FB56 
X-CRM114-Status: GOOD (  19.48  )
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

On 21/06/2023 08:45, William Qiu wrote:
> 
> 
> On 2023/6/19 20:17, Krzysztof Kozlowski wrote:
>> On 19/06/2023 10:35, William Qiu wrote:
>>> The QSPI controller needs three clock items to work properly on StarFive
>>> JH7110 SoC, so there is need to change the maxItems's value to 3. Other
>>> platforms do not have this constraint.
>>>
>>> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>>> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
>>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>>> ---
>>>  .../bindings/spi/cdns,qspi-nor.yaml           | 20 ++++++++++++++++++-
>>>  1 file changed, 19 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>>> index b310069762dd..1b83cbb9a086 100644
>>> --- a/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>>> +++ b/Documentation/devicetree/bindings/spi/cdns,qspi-nor.yaml
>>> @@ -26,6 +26,15 @@ allOf:
>>>              const: starfive,jh7110-qspi
>>>      then:
>>>        properties:
>>> +        clocks:
>>> +          maxItems: 3
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: ref
>>> +            - const: ahb
>>> +            - const: apb
>>
>> You are duplicating top-level property. Define the items only in one
>> place. If this list is applicable to everything, then in top-level property.
>>
> Only in JH7110 SoC need there clocks, other platforms do not have this constraint.
> So I need to duplicating top-level property.

You don't need, why? Why writing something twice is an answer to "JH7110
needs 3 clocks"? It's not related.

What is the clock for all other variants?

>>> +
>>>          resets:
>>>            minItems: 2
>>>            maxItems: 3
>>> @@ -38,6 +47,9 @@ allOf:
>>>  
>>>      else:
>>>        properties:
>>> +        clocks:
>>> +          maxItems: 1
>>
>> clock-names is missing. They must be in sync with clocks. What is the
>> first clock?
>>
> But there are no clock-names before, should I add it?

Then let's just disallow it. Either you define it or you not allow it.

>>> +
>>>          resets:
>>>            maxItems: 2
>>>  
>>> @@ -70,7 +82,13 @@ properties:
>>>      maxItems: 1
>>>  
>>>    clocks:
>>> -    maxItems: 1
>>> +    maxItems: 3
>>
>>
>> You did not test it before sending. minItems is missing.
>>
> I will add it.
> As for other platforms, should I use enum to constraint the clocks?

What is the clock on other platforms?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
