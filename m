Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9BCEB64D9
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 12:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3wBlhdJluhE9QH52oL5gZG3/RWwJZ49WhH5O8DZ3A4=; b=gCPhkprC1TqYW5
	Mw62H/aHj2EWxV9lKTQjWELdngGhDk6mXlMtwHmB9or0SqLJ3NksYG6yA1TfV5V5oKlfdx41Vl7Rn
	ewZwDxTbDH9LjXssDryDyNXHzd1DiLLU3zPpfQ9hp04SoFwv++gVUdr/9pqnt37NFjD4xkS0Eosj0
	WF79gNc5bSkiET9iGBuNRa1Dh9LEd2dIhnnNifAXERXPQwypf04yLH96KDdjtrot6K/6BGhJf4kjP
	1sxgj84ba/9mWZKpnYFeOtw1s828f4Efqn/b7/EQIYzGem43hs74dAqtJHvHnsjbvl4YK/gDkGOdd
	LG10QjagBhgxG7egv+JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYyz-00HXDc-0j;
	Wed, 12 Jul 2023 12:30:13 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJYyw-00HXCp-2k
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 12:30:12 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so1563892a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 05:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689165008; x=1691757008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=As5jovVz/stLB9HCpNmduJGzBJFBIZbh6f6RqqdbEgU=;
        b=FywtFp7I+uYfwVkjEUr6hIuKhYCX/lOI70IZ16WSmcisfLjfp9CqVlbuAjPivT97/p
         +i2j14ibDGIHhmVmUBWtu9zNpsdpkPR4iMDqs9qlGq3r4NnXChlqeh1TXXK562wMg+kk
         gVDJPSKt8fn1Aw4WiUndWEUX8HOfclhEowcRrAUdbzVcg6IjGDiVDCkRwPKBS5rRjfYE
         IXiBgQoaBkT+OPrQKqAY6qnIJeHMD63qxz0Zt3YNBsO8Iw+pnOR/K0Du9s2K/uAM2DY8
         7nskj9lBRgyVUCXNQpQZ0NtL/noyrsRo1/CVrDq1Yc+H9ZIFdBY29OrWsr54tyqnPfzr
         6pqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689165008; x=1691757008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=As5jovVz/stLB9HCpNmduJGzBJFBIZbh6f6RqqdbEgU=;
        b=DNE79SS34WhlV83EweImGKrHRiPw1JgUERKxRFWfrw/MO17KRh5UkPZILq52agln7E
         W5X8O9HJwwaZEAn9EC4sgcIVe45ow6m18q7QbE5N/0PuKqhhyOYVDybqORq5EMPfnXls
         OtJall98nY0hy1LAPdVTB5/X0sPPJJYshQoXqTIKMsFEa/lhLg6yTs/c1JQ9gj6DZVvc
         BSyxgvA4eeCrFi82dVv+yga9R6aKY1Z8wef9UIGsqsG/PIiH0aSR/ZNzeW6StcdwAn1l
         Ippsr0zDxwytC5ZCyuwTOTfMrJSwntpUfRfcKBtuueCVZr79FhJAXtRfWJRMon48Tqv1
         Sp0A==
X-Gm-Message-State: ABy/qLYgDMouHqQ7IEsSNjngwCX9wGOxYpzcsVyPAimhY0fovddirqPK
	RDtOwKJ1b6Qb5sWvxIOD035E5A==
X-Google-Smtp-Source: APBJJlFyqdAsr2Xmn7ERB3sVUUTbBaVW3d7pl/dph84q5U/gYteuRGrHlU/zsVSve6Jjadzi3Tfy8A==
X-Received: by 2002:aa7:cd78:0:b0:51d:a2d9:85a3 with SMTP id ca24-20020aa7cd78000000b0051da2d985a3mr2463329edb.8.1689165008692;
        Wed, 12 Jul 2023 05:30:08 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s17-20020a056402165100b0051dd19d6d6esm2732667edx.73.2023.07.12.05.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 05:30:08 -0700 (PDT)
Message-ID: <0865b422-d587-c1c7-9463-510832ddddf4@linaro.org>
Date: Wed, 12 Jul 2023 14:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
Content-Language: en-US
To: Eric Lin <eric.lin@sifive.com>
Cc: conor@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dslin1010@gmail.com,
 Zong Li <zong.li@sifive.com>, vincent.chen@sifive.com,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-4-eric.lin@sifive.com>
 <2437bda9-bbdb-ad80-7201-1e16e1388890@linaro.org>
 <CAPqJEFoTsmVZ4kvsSB0RkQZaQGyXC96KV6RvdpeC5XxURCOZ0w@mail.gmail.com>
 <8c9ed2d4-83ab-ecc0-a300-e6bc8e2047b6@linaro.org>
 <CAPqJEFqhmxksvEgvC61cJcRGR0DrSWDZxJC3J7tdgcG8UY+sFw@mail.gmail.com>
 <f5275617-d68c-c76b-d799-106f67cc2071@linaro.org>
 <20230712110908.GA23216@hsinchu16>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230712110908.GA23216@hsinchu16>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_053010_904955_3CF6F5C2 
X-CRM114-Status: GOOD (  19.71  )
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

On 12/07/2023 13:09, Eric Lin wrote:
> On Sat, Jul 01, 2023 at 10:22:25AM +0200, Krzysztof Kozlowski wrote:
>> On 28/06/2023 18:31, Eric Lin wrote:
>>
>>>>>>
>>>>>>> +      - enum:
>>>>>>> +          - sifive,pL2Cache0
>>>>>>> +          - sifive,pL2Cache1
>>>>>>
>>>>>> What is "0" and "1" here? What do these compatibles represent? Why they
>>>>>> do not have any SoC related part?
>>>>>
>>>>> The pL2Cache1 has minor changes in hardware, but it can use the same
>>>>> pl2 cache driver.
>>>>
>>>> Then why aren't they compatible?
>>>>
>>>
>>> The pL2Cache1 has removed some unused bits in the register compared to
>>> pl2Cache0.
>>> From the hardware perspective, they are not compatible but they can
>>> share the same pl2 cache driver in software.
>>
>> So they are compatible... If they were not compatible, you wouldn't be
>> able to use the same match in the driver.
>>
>>> Thus, we would like to keep both. It would be great if you can provide
>>> some suggestions. Thanks.
>>
>> I propose to make them compatible, like every other piece of SoC. I
>> don't see any benefit of having them separate.
>>
> 
> Hi Krzysztof,
> 
> Sorry for the late reply.
> The pl2 cache is our internal platform IP and is not part of any SoC. 
> 
> The reason why this driver is compatible with the hardware "pl2cache0" and hardware "pl2cache1"
> is that it doesn't program the different parts of the config register
> However, our internal software (e.g., bare-metal software) will program these different parts,
> so it needs to rely on the different compatible string to identify the hardware.
>   
> Additionally, we would like the compatible strings to reflect which hardware is being used Thanks.

I don't understand how does it contradicts anything I said. So you do
agree with me? Or what?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
