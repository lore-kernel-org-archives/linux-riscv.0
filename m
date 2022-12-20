Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56801C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 09:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fJUKckO0WricrgnI12JrVkFp0ryu7U2OHTLKSzAFZQ=; b=DJa+qHtJAb+Q6X
	mmwjdEIdrKDddcmhMF9bAyCic5LmJNaVZzqoFHi9seLQNNvNcDMLci01X81tIhZ4eSQXnMiJ0w3LX
	DLRTDm8mGQh1qNMdEuHgphVNv+OoHHm+fS+QvXE8hyvtBlo2UUcLCh0Lys0cG79kRoEYPVA/btz3C
	NZu6CveqBn1cBb93JoovDBPaA8vp4hcJCOj9IzIpWNr+dnn0bpPqApyNIZCjDtI1OX3IZ6uZzQ26y
	zLbx9/9E51GN2TCWad6dNPMCckbrQonIibwy+nLyZYZCZHYhNugT2d8tn7LdgtC0hq5S6sXcbYzFw
	u0QWkD0aJ826jtU8XcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7YpH-00CodT-W6; Tue, 20 Dec 2022 09:22:20 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7You-00CoOA-Uh
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 09:21:59 +0000
Received: by mail-lj1-x22b.google.com with SMTP id n1so11825742ljg.3
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 01:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DazyWikdI/OzsaaGF39wdaaOlC0XReiy+hFbZZu2Q1I=;
        b=Hjx00EFpYwP45LwbOziknhwz2zKD+sbAMQ86G061nKhGmmw4qE9jTARKz07mPQht/T
         1k3StqDnfBGg121+F/oghnfJ9rq45ATS7T/HkmOYgKWBy4gkWf1knqsSRRSXgICSBb64
         LOnH0EU+gXHUGouF9PyD26nOG17gg7A6Ree5Xf6VXHvU3FD28v/R/8J3IMmUXbgrPHuZ
         PwNTg1Ah8mxrVtEKBQ+uyoqNGDocJ5EoyqxLd3xjEQiPYtsUzWa5ZBVVxPSI8FTARB/J
         UQc7cBaoU0zJ6qX97ehqfCmzi4XGWcNRqqIsqHj3v6iy/p7nocOFGOsMiylkAUKKB76R
         KD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DazyWikdI/OzsaaGF39wdaaOlC0XReiy+hFbZZu2Q1I=;
        b=kplyaCgsfkikza/GhTMfjb6HI1fm3vS9ri0O7goh62dnwP71DLZ3QandmN4AFGcoJ+
         2fUb/uvUlmdYfExTXrXcVY6UHgCr5gT1P3DPWTxg1fKWz5AO5CgJkpq9vwGnsONCJL5h
         qpBO0QMpyAxSI8y0Km3pN7N5rNaXltJI8FZaDeeGGUdfIaVeXaJk8Nu4EQejfvDEToSi
         yZNHIRc5770D1mkWHGrg6ju+2OO87i9sdB62ksaRjEfSR87ZEmduG8taoBgAHYnBqOZi
         G5lUry+NgJjN8Yf+7Rh7aiM5Udud6dUw2YxufxNg+WVHCfov4Bb2qA7TlbD0f142M6Fa
         lelg==
X-Gm-Message-State: ANoB5pk9TuKmAGPM0Q6rbR24dzSyxMMY/+geGfKcI0tUc0l2Vuop+/xd
	zUyHcgOGHw8MqjEsWCkv+ON+yA==
X-Google-Smtp-Source: AA0mqf7cINmxUQTVHIA51W+eyOnDgUmlNBK3MC35Vz0emZ06VI2+JlnPdeEHi9nVd6I2/sVZYIoByA==
X-Received: by 2002:a2e:3205:0:b0:27b:490b:8478 with SMTP id y5-20020a2e3205000000b0027b490b8478mr10500411ljy.36.1671528111530;
        Tue, 20 Dec 2022 01:21:51 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s8-20020a05651c048800b00279d73cdf83sm943007ljc.128.2022.12.20.01.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 01:21:51 -0800 (PST)
Message-ID: <1a696768-45ef-0144-07f3-d356af9659e5@linaro.org>
Date: Tue, 20 Dec 2022 10:21:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7f4339df-6616-120f-f16a-cd38a2b6ea1d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_012157_137684_D5212E10 
X-CRM114-Status: GOOD (  11.97  )
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

On 20/12/2022 07:48, yanhong wang wrote:

>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> index e26c3e76ebb7..7870228b4cd3 100644
>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>> @@ -133,12 +133,19 @@ properties:
>>>          - ptp_ref
>>>  
>>>    resets:
>>> -    maxItems: 1
>>> -    description:
>>> -      MAC Reset signal.
>>> +    minItems: 1
>>> +    maxItems: 3
>>> +    additionalItems: true
>>> +    items:
>>> +      - description: MAC Reset signal
>>>  
>>>    reset-names:
>>> -    const: stmmaceth
>>> +    minItems: 1
>>> +    maxItems: 3
>>> +    additionalItems: true
>>> +    contains:
>>> +      enum:
>>> +        - stmmaceth
>>
>> No, this is highly unspecific and you know affect all the schemas using
>> snps,dwmac.yaml. Both lists must be specific - for your device and for
>> others.
>>
> 
> I have tried to define the resets in "starfive,jh71x0-dwmac.yaml", but it can not over-write the maxItems limit in "snps,dwmac.yaml",therefore, it will report error "reset-names: ['stmmaceth', 'ahb'] is too long"  running "make dt_binding_check". Do you have any suggestions to deal with this situation?

The solution is not to affect all schemas with allowing anything as reset.

If you need more items for your case, you can change snps,dwmac.yaml and
add constraints in allOf:if:then: allowing it only for your compatible.
There are plenty of examples how this is done, e.g.:

https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

> 
>> Best regards,
>> Krzysztof
>>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
