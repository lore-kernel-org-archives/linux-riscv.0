Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE02C6FD1A
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 15:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lULGbOBHv6Z8vVo+2ONDiNSOcodx/1evfU2w98s3oHE=; b=4M0SousBQcY0WY
	mgBnFBQkj8G2Nq/VnosoxnLr+sBFgbeNzrtS0jO8GnAxnlpeEMQApKjjGxfHb+5vUqhD2sQiZg+r8
	3QloDMkpObSTcJGFX5cYfZh3eIM+dojOfGwQR2ChJiJ1auiJcyp705MW/JSxg1v/m8leWimaZYjvq
	ico9BtCqZ4iGtgcXNYyxfDZzPZWSB34RZyP7yJwqe2shm+zzdTHbESgcPkbBSbEhlKWKTcpro26FA
	1lqJBg9Hm8g26NpDDFBBcLy1HSo10Ot4tfGEYMvPGppr4veqlU4nGs1O07HGCJDaL1UgrjsSedrJo
	VZ4tEZDKiyWox5PcopgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZbc-001JD1-NK; Tue, 07 Mar 2023 15:52:00 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZbZ-001J9A-Ga
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 15:51:58 +0000
Received: by mail-ed1-x52d.google.com with SMTP id j11so34583973edq.4
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 07:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678204313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RcDQzVN19ofjg8Tgdw5tyOv/MuABZ5E/YdFtUvot80Q=;
        b=YFJygNIbp45Ch4nXFzOoHjdOtcWm38mODz32cOZACaptJnRWrDMIWR9xzC4+D1aXyB
         QUoUK6gEMMp6rabx4Hr1Uz50KlcGeOnUBPx6RCXOvBYGZoTgaraSCT15eVcTXieGo/SL
         id7Gt85z552OTBu98ZiqtTYdE/Rhc6Zs5a8SEJADZGQuUa+F5qIXCihEUGKlveW5/iV/
         T0h0Y9Oj3oolzzrWona14BG8KcuHcbW3eB9CRfoQeevRX0ceBnu82fIRdw5DMS0LRWaF
         gYlqrLdNrMBBxjA2SuK2d4T29F372atFGo7OYkpIJcpyXfN2qiFVfh4bKq3V/HfejG2C
         +VjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678204313;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcDQzVN19ofjg8Tgdw5tyOv/MuABZ5E/YdFtUvot80Q=;
        b=UFn6hRdf0RTImIo3Vk3cIAZefjuUF7Q8tCVBnDqzSeHSliOG/kMMPx8SkKUD+gyAof
         92rn8gPzCa9cGvGy6Jrr/IJEkpoGjEK/eoLxJ1m0dqv9hYcWQQ06C9wm2zuDFAafTxZA
         L0DpSIWEN6CWxgjR3VilMevj6kBu5WXBOR3ETa/kEZfVIrSTzW9yMzBGhNxDEk1N2JuH
         JRRhqjWg4hugPgZydID5iLZLlQquWBvp0iSZPGAyRzmW5RludfK78Nay/f1X9THJVLdy
         tSGkSx/ttLXqG44NharJgNnErBZRXjrWg2Hb5Hb5OHQzIEJdlfGKiJ8zXlERkVpPQYc4
         Uh2Q==
X-Gm-Message-State: AO0yUKWy6fyGTM5WK0bch7+DuRiz+T8a2/lmUOmHST4LtQhQxBZc2hLs
	tNOalmauVX2UpPpI4FItTDhiXg==
X-Google-Smtp-Source: AK7set9L4TCnhGG3SxprVoNK/2nNWxTQQ0uvBtCv1oRmv5bm89yo39bZ/2uW8VInhxLWFZixBqCbUw==
X-Received: by 2002:a17:907:86a5:b0:8b1:7fe9:ac69 with SMTP id qa37-20020a17090786a500b008b17fe9ac69mr19571063ejc.75.1678204313020;
        Tue, 07 Mar 2023 07:51:53 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:a60f:e604:c252:1f3d? ([2a02:810d:15c0:828:a60f:e604:c252:1f3d])
        by smtp.gmail.com with ESMTPSA id qw15-20020a170906fcaf00b008d57e796dcbsm6238380ejb.25.2023.03.07.07.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 07:51:52 -0800 (PST)
Message-ID: <e3da08df-a5cb-3fbd-2356-64416f48c073@linaro.org>
Date: Tue, 7 Mar 2023 16:51:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/3] dt-bindings: dma: snps,dw-axi-dmac: constrain
 resets items for JH7110 dma
Content-Language: en-US
To: Walker Chen <walker.chen@starfivetech.com>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul
 <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20230306140430.28951-1-walker.chen@starfivetech.com>
 <20230306140430.28951-2-walker.chen@starfivetech.com>
 <b2b36909-b0b1-7507-3145-141eb5ec0f3f@linaro.org>
 <0725e451-7c0b-0aac-ecd3-502b02276a9a@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0725e451-7c0b-0aac-ecd3-502b02276a9a@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_075157_583080_945AA5A9 
X-CRM114-Status: GOOD (  18.94  )
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

On 07/03/2023 11:30, Walker Chen wrote:
> 
> 
> On 2023/3/7 17:03, Krzysztof Kozlowski wrote:
>> On 06/03/2023 15:04, Walker Chen wrote:
>>> The DMA controller needs two reset items to work properly on JH7110 SoC,
>>> so there is need to constrain the items' value to 2, other platforms
>>> have 1 reset item at most.
>>>
>>> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
>>> ---
>>>  .../bindings/dma/snps,dw-axi-dmac.yaml        | 24 +++++++++++++++----
>>>  1 file changed, 20 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>>> index ad107a4d3b33..d8b5439f215c 100644
>>> --- a/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>>> +++ b/Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml
>>> @@ -12,14 +12,12 @@ maintainers:
>>>  description:
>>>    Synopsys DesignWare AXI DMA Controller DT Binding
>>>  
>>> -allOf:
>>> -  - $ref: "dma-controller.yaml#"
>>> -
>>>  properties:
>>>    compatible:
>>>      enum:
>>>        - snps,axi-dma-1.01a
>>>        - intel,kmb-axi-dma
>>> +      - starfive,jh7110-axi-dma
>>>  
>>>    reg:
>>>      minItems: 1
>>> @@ -58,7 +56,8 @@ properties:
>>>      maximum: 8
>>>  
>>>    resets:
>>> -    maxItems: 1
>>> +    minItems: 1
>>> +    maxItems: 2
>>>  
>>>    snps,dma-masters:
>>>      description: |
>>> @@ -109,6 +108,23 @@ required:
>>>    - snps,priority
>>>    - snps,block-size
>>>  
>>> +allOf:
>>> +  - $ref: "dma-controller.yaml#"
>>
>> Rebase your patches on something recent... I would argue that it should
>> be based on maintainer's (or linux-next) tree, but that would be too
>> good to be true.
> 
> This was written by referring to the syntax of other dt-binding, but your suggestion 
> is a good one, the next version of patches will be rebased on kernel 6.3.

Rebasing on old kernel was referring to syntax of other binding? I don't
understand this. How old code which you copied is related anyhow to
other binding? You are expected to send patches always based on recent
one, not something old.

> 
>>
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - starfive,jh7110-axi-dma
>>> +    then:
>>> +      properties:
>>> +        resets:
>>> +          minItems: 2
>>
>> What are the items expected here?
> 
> Do you mean to add descriptions for items here ?

Yes, because order of the items is fixed.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
