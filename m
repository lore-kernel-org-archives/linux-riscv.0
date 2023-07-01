Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2C0EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jul 2023 08:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fedB6iPpHa7fe8lWrjfbXALhkylVmpXyZz8au7kV2iI=; b=oHf2GeOv6Ekjwf
	uBPh1BYoQ4p6MqVjpTFJ/ZWHiZSqGZRscUxZEG6DV/t929CSk12PwTkaMcahX3sgwE5UBXW8wq7ys
	aCHSXT1vUN+uWWdIgPwTRudZvQUyF0P0YF9/G7RaXZK3eoK9UNvikRjYZl/If5bc32lms3vFVgYZE
	ENz4mViQ2zA11C+KXOV53Z4aKEFwBkoP7t+h/AmRPQTrs8aft2hGWgdQuPGWAeVAjjDnuE5p/+yZu
	U+C2VAz4Wz01OEm/wqkzXB8Cclex8nysjw1jkGaiBteCns7eH+kkC08RyQ/hh6DU6oOfWyXZNu1ge
	l34mA2lfeYg9bvnvkhYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFVsF-005SCt-1U;
	Sat, 01 Jul 2023 08:22:31 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFVsD-005SCQ-1A
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jul 2023 08:22:30 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98e109525d6so478834066b.0
        for <linux-riscv@lists.infradead.org>; Sat, 01 Jul 2023 01:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688199747; x=1690791747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMzN5ldrDLudsFTYrIWTDNOwJnSoomZPJebktTnoU4I=;
        b=z0vr7th4jrnuqwOOGzCSY6B5JNYPSI9Q1lAB5/LAiCsFLpgAeHlZ9AP0z3cjr2grLr
         10l6wNeJX6XhSKFFjLl9yqKhmuQMZ5///4QLfTrb9Ctwa7DjXs75TxJFGTpwuGR9fggH
         egDYhRbJuK7VooVdV+BHbDNF8uRt8h+WIp4+2eI9R4NNO9EvdJQLu5FFk7agf80rdsvw
         6PFEGk8iC/GhsdXH93Z+EKtepKkCgj26eQevb3URGojIfPgReTD1tcZ0zpa0Gh2TPopR
         pZDCSaMSd2VhCWVQV4USmsOmFUib+gIvSyi7cZf07sxN37OQdqQwARTdFK+1JBPSBcXL
         F3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688199747; x=1690791747;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gMzN5ldrDLudsFTYrIWTDNOwJnSoomZPJebktTnoU4I=;
        b=dRCk/NLYzdqbtBhtxyFFOtwNdEw9xaGcIvYsEgK6EkNIsMTVZd7r/Q9+6Atr614qsP
         2ppASjmrq0+Tyc2ZPIAV06JlVPrslcC5jUpPj91K02lv7+vC/1f0VuuImW4dUuI4Iz0j
         LlQFbzEWn2dUSv0+UJD277CYZhD0n+xoBDhaVuYEm0KF577NKE+uMy27wsJpsuDM5TIs
         rRSu3emB1l9+JnMKzPkdHStQ6P9XjI1+747TNc1vIn5xjNBZezfX0nvXgvWxIL3VbyhQ
         LtexPRwvhkTVbMJzOzgTWi2pFkV5IkgQixgGnmcUuUWUmqsFaovWaJdNrNkAqNJfXLo/
         4Eeg==
X-Gm-Message-State: ABy/qLalbBCLuT95cEb/lRUsa9U8gP9y37B05ugWyPWiROHoyJ1Svf94
	8lNdiMNguUg3a88pT38JUPEhuA==
X-Google-Smtp-Source: APBJJlHQQAoTBEsW/Bor8efMuJEWqdkdKXwXOik6r7upNjbyBabBfFtmqbgej0SUq+B2EXp04+tBXg==
X-Received: by 2002:a17:907:212a:b0:992:6d73:5696 with SMTP id qo10-20020a170907212a00b009926d735696mr4386219ejb.5.1688199747015;
        Sat, 01 Jul 2023 01:22:27 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id b27-20020a170906195b00b00991e2b5a27dsm6356217eje.37.2023.07.01.01.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 01:22:26 -0700 (PDT)
Message-ID: <f5275617-d68c-c76b-d799-106f67cc2071@linaro.org>
Date: Sat, 1 Jul 2023 10:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Content-Language: en-US
To: Eric Lin <eric.lin@sifive.com>
Cc: conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dslin1010@gmail.com,
 Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-4-eric.lin@sifive.com>
 <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org>
 <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
 <8c9ed2d4-83ab-ecc0-a300-e6bc8e2047b6@linaro.org>
 <CAPqJEFqhmxksvEgvC61cJcRGR0DrSWDZxJC3J7tdgcG8UY+sFw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPqJEFqhmxksvEgvC61cJcRGR0DrSWDZxJC3J7tdgcG8UY+sFw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230701_012229_426628_75093EAE 
X-CRM114-Status: GOOD (  13.63  )
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

On 28/06/2023 18:31, Eric Lin wrote:

>>>>
>>>>> +      - enum:
>>>>> +          - sifive,pL2Cache0
>>>>> +          - sifive,pL2Cache1
>>>>
>>>> What is "0" and "1" here? What do these compatibles represent? Why they
>>>> do not have any SoC related part?
>>>
>>> The pL2Cache1 has minor changes in hardware, but it can use the same
>>> pl2 cache driver.
>>
>> Then why aren't they compatible?
>>
> 
> The pL2Cache1 has removed some unused bits in the register compared to
> pl2Cache0.
> From the hardware perspective, they are not compatible but they can
> share the same pl2 cache driver in software.

So they are compatible... If they were not compatible, you wouldn't be
able to use the same match in the driver.

> Thus, we would like to keep both. It would be great if you can provide
> some suggestions. Thanks.

I propose to make them compatible, like every other piece of SoC. I
don't see any benefit of having them separate.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
