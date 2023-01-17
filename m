Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA3CC3DA78
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 07:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gqrmuu0ewZEazuNzkNBl/jD1B1ST2me7EMymdHhsm/Y=; b=QKWwAWed0yJ5FN
	wQLRS3VAZNzKarOnp3+3270tyrBakmQCs90wVr61X2JP5bccdzf+8EDselKWrEODtfDuUvSvCeVWJ
	PSq9APFELQPNjYJIHl9MkcEpYuK1kXrnzefLvI1IaGkW6KEyhFA2yB2G9mxKrgxoPeULgkB0cXODh
	qPhstLz/UtuvSdQlepyq93xAQeMywr1HoVKOyFjGwSAY7/MYwsTc/eYJRjqwWKRC4izXaMMABGNCe
	bHTgJi/pEEVjOi0jyMBX3KepKhmm9cJegeXPL497jI+sSgGnkatvzlkIe4TnweQ+7RsgdFK17Jx13
	LUHdn/FCnuVkzglhSA+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHgfe-00DEoE-6Y; Tue, 17 Jan 2023 07:46:14 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHgfa-00DEmw-TH
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 07:46:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id r9so6850110wrw.4
        for <linux-riscv@lists.infradead.org>; Mon, 16 Jan 2023 23:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DMmc7/6yXt4mypmxVkgQDFhHLoHU+0OuLMviLqWVx+A=;
        b=JSyDCVbIbjBQ1xD2ArsijWppzNSE86iMsxJQ+4itnbir88y3d9yVVcRwLsdC7oQ+cg
         UrPyDarZRi4gwrrFCg2blJJKaTO7lYAl2CLauthE9EjaLCz1ufELFDIuCRMYuvWWUe47
         YLuySGp5G1jQiObp2sqR9c9NO/c7iLnkDbecmzXBO7Ag3Ay53v0bTcfJ7Y3BaXNJDoFI
         3O/ZTWfGflEe1U446bWlySQ9XqmlefUQG4jfIPI9UEvravTyZsNu/vczsAaALblx4gq4
         Ak1yaNfXziEuP3wB49E5afCS7aqst6+CBDIo1t4Q0iOK9LfYPhtA1tqcKx+G+S/+tVcN
         9jVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMmc7/6yXt4mypmxVkgQDFhHLoHU+0OuLMviLqWVx+A=;
        b=u9lINEghgLJ7FjAj8tonTvixuj3xuEiKeCgjQPszjwVPr7wu9cQWsfa3pzMoWvsQZQ
         OoIUIDg7aFrEd/2/0Zy4Hv/6aOHZfwwLF5o8pNPOktNIY++R6WoLA6JJ1rhspjY3hhQH
         uVL/kHlV+B7khwXgspYr8Mh5LCEBT5PnbfKcIlxxKlqw2+KRFWeDlbd+eGaKQLPC/rmu
         MRL89boZG0agSdrwF89pr07o036HKFxreIzkJt7xF+IHm9DEscLpCX2VrDyZbUqLH8cw
         2WyAdKOf9YDMzV6nesj947EEDwL1PcrYk2/7c5D6WXairXtlmPYqmbgarufQyTxeXnhx
         F4Qg==
X-Gm-Message-State: AFqh2kpqHHTYlhpn8CVCdXcFLYgwEvQMBhfMNPrxjkYGdH0KQW81cPvh
	MBrRD89DFrPMT1s7H//7UVpKBQ==
X-Google-Smtp-Source: AMrXdXtUxakW05hWNg2POhjXdlv3VgtuswvL3Udt4m7t6k4qlXSnBGFVf8dJ2ejUwjfcGDH9YjSn+A==
X-Received: by 2002:adf:fa88:0:b0:2bd:d85f:55cc with SMTP id h8-20020adffa88000000b002bdd85f55ccmr1960711wrr.21.1673941568684;
        Mon, 16 Jan 2023 23:46:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i6-20020adfe486000000b002423dc3b1a9sm27630444wrm.52.2023.01.16.23.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 23:46:08 -0800 (PST)
Message-ID: <8ee5f6ef-80cb-2e0f-6681-598ccc697291@linaro.org>
Date: Tue, 17 Jan 2023 08:46:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
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
References: <20230106030001.1952-1-yanhong.wang@starfivetech.com>
 <20230106030001.1952-3-yanhong.wang@starfivetech.com>
 <2328562d-59a2-f60e-b17b-6cf16392e01f@linaro.org>
 <84e783a6-0aea-a6ba-13a0-fb29c66cc81a@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <84e783a6-0aea-a6ba-13a0-fb29c66cc81a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_234610_987272_D5BB5663 
X-CRM114-Status: GOOD (  18.41  )
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

On 17/01/2023 07:52, yanhong wang wrote:
> 
> 
> On 2023/1/6 20:44, Krzysztof Kozlowski wrote:
>> On 06/01/2023 03:59, Yanhong Wang wrote:
>>> Some boards(such as StarFive VisionFive v2) require more than one value
>>> which defined by resets property, so the original definition can not
>>> meet the requirements. In order to adapt to different requirements,
>>> adjust the maxitems number definition.
>>>
>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>> ---
>>>  .../devicetree/bindings/net/snps,dwmac.yaml   | 36 ++++++++++++++-----
>>>  1 file changed, 28 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> index e26c3e76ebb7..f7693e8c8d6d 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -132,14 +132,6 @@ properties:
>>>          - pclk
>>>          - ptp_ref
>>>  
>>> -  resets:
>>> -    maxItems: 1
>>> -    description:
>>> -      MAC Reset signal.
>>> -
>>> -  reset-names:
>>> -    const: stmmaceth
>>> -
>>>    power-domains:
>>>      maxItems: 1
>>>  
>>> @@ -463,6 +455,34 @@ allOf:
>>>              Enables the TSO feature otherwise it will be managed by
>>>              MAC HW capability register.
>>>  
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: starfive,jh7110-dwmac
>>> +
>>
>> Looking at your next binding patch, this seems a bit clearer. First of
>> all, this patch on itself has little sense. It's not usable on its own,
>> because you need the next one.
>>
>> Probably the snps,dwmac should be just split into common parts used by
>> devices. It makes code much less readable and unnecessary complicated to
>> support in one schema both devices and re-usability.
>>
>> Otherwise I propose to make the resets/reset-names just like clocks are
>> made: define here wide constraints and update all other users of this
>> binding to explicitly restrict resets.
>>
>>
> 
> Thanks, refer to the definition of clocks. If it is defined as follows, is it OK?
> 
> properties:
>   resets:
>     minItems: 1
>     maxItems: 3
>     additionalItems: true

Drop

>     items:
>       - description: MAC Reset signal.

Drop both

> 
>   reset-names:
>     minItems: 1
>     maxItems: 3
>     additionalItems: true

Drop

>     contains:
>       enum:
>         - stmmaceth

Drop all

> 
> 
> allOf:
>   - if:
>       properties:
>         compatible:
>           contains:
>             const: starfive,jh7110-dwmac
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
>     else:
>       properties:
>         resets:
>           maxItems: 1
>           description:
>             MAC Reset signal.
> 
>         reset-names:
>           const: stmmaceth
> 
> Do you have any other better suggestions?

More or less like this but the allOf should not be in snps,dwmac schema
but in individual schemas. The snps,dwmac is growing unmaintainable...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
