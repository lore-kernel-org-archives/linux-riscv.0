Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E3BC10F1B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Dec 2022 08:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oiZ8CE+KCPV/fmJD/E4YmLXvCpwsRhut1OJGeCsUco=; b=urJgCIaD/zXs6Z
	4h3saJWBXEOre0vfVfM9Q8rL636V7YFcl3DtLfejH7ZlxSbsD+EBwbdE3NOP2DBzT6JR6zwXtuW4d
	oK5dGU8O8dZ91RkZLPKi5rR1LsZ/WI8ZxCX552Rw2WhqhfDsMjwARy5813DN/vvjANMihuFdy8/rJ
	LtaIFqkDWGm5Y1KIYtncOORK8TYIbvXhfGTQd0WW0F/XHg4mCR6QOIXNJ7F/bDwQ+oGD4MUutrjgo
	B+4VNn709uuPdvSDlf6U7RVgG4zPEvzeMFgcjiNbSnIdKKgdfW+g7ZCHRAEvEFOCwnv5jT4Bog0wM
	F/g71p0t+ojaQ3ivE5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5Ex-00BJeN-HZ; Tue, 27 Dec 2022 08:23:15 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5AL-00BHMe-I8
	for linux-riscv@lists.infradead.org; Tue, 27 Dec 2022 08:18:31 +0000
Received: by mail-lf1-x12e.google.com with SMTP id j17so9172352lfr.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Dec 2022 00:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ln/8Ql524XEPoI9ew3MSboAB3m1N4yBN0rK6DAhoSQc=;
        b=Gn8jP14aqJUl2sYT/CC74nEl6iK3r3GlM8+8U3U2+YDVio9yhnwmgt8kiSBHdIbqcZ
         ddDMnFUk4+QFTQuGirYV8QtkNE66naw29OBxcx0z8sYGypp/mQy3TidxPa/umQ3qgxGz
         P1fF5EZWv1mavEyymtzMJLNrgXuv8eaYS9qZNKXSxRAs8scvzL8HOiGSFuoA29gIrDU4
         CgwZGcGgIiqXJ+CU6dt7sBv3UVEMDJ1Kz6CfdlAqz5RUv7scScTe1mDYrPxpGJ+8ihmW
         jwh+XoTRXbJmB1BtsNOBREKB4Ka/6luOkNqYop1dp7ZxBs3D1q/P1SGWcAGjkFq1cs7w
         U2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ln/8Ql524XEPoI9ew3MSboAB3m1N4yBN0rK6DAhoSQc=;
        b=LjZ0n+LN6jBqPbx4HFxVvj2pSHZQQrEVgc/QwK22SaUeSLlA+0NyUZUEWEWS8o7mLF
         yt8VgB5AYREpS7PeF4g1ovWcjHP8jTGRTKas9ud0kcD6H4qwX49lFS1Q3rOrMcNVEXZ2
         X0wm6zQ0anDxK1mta2+Xvw8CjQooajtFmUhNv8HhtY1gMpWEATgl6CVPpxgZA5selGAF
         TTVprWrJ6tjITR6sf3aBox8/qpsVQWFlrKFK2k3QNTmp+7kim/H9+hZP51/QtX++UgTE
         bKPYrQc+ns7uM4y+QK4jknzuccOXqrVw0ESNn/bPP+RJNuAtQ2YVZEKnjzpTurutqVij
         XukQ==
X-Gm-Message-State: AFqh2kruZ/oedxldWgz8bM4WToNz6qUaoltSO/a0TltRUADp9yDel5KF
	BIlU+RvQoaW3YvWRe3+6sobhvw==
X-Google-Smtp-Source: AMrXdXtinLKfEQpXrboACp/LM0hIqO/J5ZwM/NFnK4xJuv9eNoY6MPwpJBHtI2U0eFo6wqOde5ngRg==
X-Received: by 2002:a05:6512:3ba1:b0:4b5:8fbf:7dd6 with SMTP id g33-20020a0565123ba100b004b58fbf7dd6mr10587170lfv.61.1672129106302;
        Tue, 27 Dec 2022 00:18:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m1-20020a197101000000b004b094730074sm2142854lfc.267.2022.12.27.00.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Dec 2022 00:18:25 -0800 (PST)
Message-ID: <526ab8a0-f77c-64f8-7209-c33bec8cb3e6@linaro.org>
Date: Tue, 27 Dec 2022 09:18:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 2/9] dt-bindings: net: snps,dwmac: Update the maxitems
 number of resets and reset-names
Content-Language: en-US
To: yanhong wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-3-yanhong.wang@starfivetech.com>
 <040b56b1-c65c-34c3-e4a1-5cae4428d1d2@linaro.org>
 <7f4339df-6616-120f-f16a-cd38a2b6ea1d@starfivetech.com>
 <1a696768-45ef-0144-07f3-d356af9659e5@linaro.org>
 <25fce6e7-604e-6c07-3ff1-b65a5115a491@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <25fce6e7-604e-6c07-3ff1-b65a5115a491@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_001829_772041_DFD2BCCB 
X-CRM114-Status: GOOD (  14.40  )
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

On 27/12/2022 08:48, yanhong wang wrote:
> 
> 
> On 2022/12/20 17:21, Krzysztof Kozlowski wrote:
>> On 20/12/2022 07:48, yanhong wang wrote:
>>
>>>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>>> index e26c3e76ebb7..7870228b4cd3 100644
>>>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>>> @@ -133,12 +133,19 @@ properties:
>>>>>          - ptp_ref
>>>>>  
>>>>>    resets:
>>>>> -    maxItems: 1
>>>>> -    description:
>>>>> -      MAC Reset signal.
>>>>> +    minItems: 1
>>>>> +    maxItems: 3
>>>>> +    additionalItems: true
>>>>> +    items:
>>>>> +      - description: MAC Reset signal
>>>>>  
>>>>>    reset-names:
>>>>> -    const: stmmaceth
>>>>> +    minItems: 1
>>>>> +    maxItems: 3
>>>>> +    additionalItems: true
>>>>> +    contains:
>>>>> +      enum:
>>>>> +        - stmmaceth
>>>>
>>>> No, this is highly unspecific and you know affect all the schemas using
>>>> snps,dwmac.yaml. Both lists must be specific - for your device and for
>>>> others.
>>>>
>>>
>>> I have tried to define the resets in "starfive,jh71x0-dwmac.yaml", but it can not over-write the maxItems limit in "snps,dwmac.yaml",therefore, it will report error "reset-names: ['stmmaceth', 'ahb'] is too long"  running "make dt_binding_check". Do you have any suggestions to deal with this situation?
>>
>> The solution is not to affect all schemas with allowing anything as reset.
>>
>> If you need more items for your case, you can change snps,dwmac.yaml and
>> add constraints in allOf:if:then: allowing it only for your compatible.
>> There are plenty of examples how this is done, e.g.:
>>
>> https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57
>>
> 
> Thanks. Refer to the definition in the example and update the definition as follows:
> 
> snps,dwmac.yaml[Partial Content]:
> 
> properties:
>   resets:
>     maxItems: 1
>     description:
>       MAC Reset signal.
> 
>   reset-names:
>     const: stmmaceth
> 
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: starfive,jh7110-dwmac
> 
>     then:
>       properties:
>         resets:
>           minItems: 2
>           maxItems: 2
>         reset-names:
>           items:
>             - const: stmmaceth
>             - const: ahb
>       required:
>         - resets
>         - reset-names
> 
> 
> starfive,jh7110-dwmac.yaml[Partial Content]:
> 
> properties:
>   resets:
>     items:
>       - description: MAC Reset signal.
>       - description: AHB Reset signal.
> 
>   reset-names:
>     items:
>       - const: stmmaceth
>       - const: ahb
> 
> allOf:
>   - $ref: snps,dwmac.yaml#
> 
> It will also report error "reset-names: ['stmmaceth', 'ahb'] is too long"  running "make dt_binding_check" with 'starfive,jh7110-dwmac.yaml'. Do you have any better suggestions to solve this problem?

Because it is not correct. The top-level properties must have the widest
constraints which in allOf:if:then:else you are further narrowing for
all of variants. ALL.

https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
