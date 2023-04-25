Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3266DC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Apr 2023 08:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvtcYaRE3ZkiZV3efl97KM3GMuEmc1mIRwco4U3Se14=; b=dbK59db6a1bHrR
	7/7t0k5zU/mU4t/JAsA74wcBwJFBJmZ31ip9b8POzk0wLwjOHjyhhP1CPVKAE51sijn6QH7lqQ81J
	gPGaICQw9EzD736xYtdd/yKQZG+mLnRpALKU7BQF5yKrO0/qdUzjNeQjuq6YZBbDslR3aHay1NS2n
	CwgkjA5f5TJZAuDDMD8vBenFmjE0D5FlvJdQ+qbqZx9jlD+dOS1qu+tmnnoRMVtq0fOftxd4fX7ZD
	VvHjHlC0TDkKRkpxsuYnXEDiKLaB5guM/8KZpZ14t3riqnChyKAwSWgodRycUfPTrwLEzttbNjbnA
	x0GnqRC/ec0V7It326dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prDtW-000SxJ-1Q;
	Tue, 25 Apr 2023 08:19:26 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prDtT-000SwN-2o
	for linux-riscv@lists.infradead.org;
	Tue, 25 Apr 2023 08:19:25 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94a34a14a54so1009786866b.1
        for <linux-riscv@lists.infradead.org>; Tue, 25 Apr 2023 01:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682410759; x=1685002759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=znRV0nWYnqPOSY77B900qlMay8TPNkGb3s+FapEpgN0=;
        b=LrmBxu2EGogQSTBkcCYzasNpZW/pKKd+LqTsGa/ifcmlV7SrWEsRCLujLGcNA137kR
         lgwXt02NGHCJSzACgRty3LrKWmIf7PuMckGMm8d0LuQHfa3kRMdEE7xcneEgoDnt30pU
         ICbLRprS81Q5+UWB1qUS+Xz8ejauuXRB00g3emna+Fc5Uq0YzQKXiO1HCgOSVUYsofLg
         HAyRSdTObW2jp7yFUero1cT0zWgI5o8AgwOUvzA7wvYF/P5Igdaa8PA9CIAotIyyWhPE
         HQyi2HqeCP3YbfrWZ9wHHbqpVkFD2C3LQt4yqEcG14S1CGYcQHSyqFmpM6tPjofJhhJ9
         MN3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682410759; x=1685002759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=znRV0nWYnqPOSY77B900qlMay8TPNkGb3s+FapEpgN0=;
        b=JisYApeun7o4iOwUxSpCeBH7KC+I2sQ80QFpjcFKe/9UxWVSkrcAGco9I1XyOajuq3
         aGOvw+PgP6vnuF+osYBxqb89l+KmrfHytoV5QExQOqDPyt/qkzbDMuHebJOFVVQOtH2g
         rZYWEXk1Pwsy0422+3YkuZEtFAt79VNfGHK7PZOLZqLPt7F+G+ZsQFg5u01LjAgzYncc
         vlz6IarRTxx/ol6d9vfv8iFQOlAPl5vb3TKvW20TH6+xGRWQax/oUxJjU0c6Fla8hch9
         PjqwUMrPPlbb/LDdbFJwIAqwNBeOoGzqJYCO2E34wPdua9j2mPJc1hj2mgRKaJfaUUTn
         7f4g==
X-Gm-Message-State: AAQBX9d2KQ5GAxp2Xft7hOLVANVaX+WxVXq8a7jXcNCw4uI87Qnmb9y2
	q/CZ+x5Gdhr632FmR8cLaO7Uyg==
X-Google-Smtp-Source: AKy350baIrrRrmfaPcUDOSj2l2OdIXPrZ1RbEUf1vTKFBK8BjYDz6c/Q0be38k6esdo6bxwhgxnskg==
X-Received: by 2002:a17:907:76ea:b0:94f:7486:85a7 with SMTP id kg10-20020a17090776ea00b0094f748685a7mr12083094ejc.31.1682410759554;
        Tue, 25 Apr 2023 01:19:19 -0700 (PDT)
Received: from [192.168.9.102] ([195.167.132.10])
        by smtp.gmail.com with ESMTPSA id la5-20020a170906ad8500b0094e877ec197sm6587131ejb.148.2023.04.25.01.19.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 01:19:18 -0700 (PDT)
Message-ID: <68cb565d-bf39-10b0-9e3e-35ba7f54b90b@linaro.org>
Date: Tue, 25 Apr 2023 10:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [RESEND v2 1/6] dt-bindings: power: Add JH7110 AON PMU support
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Walker Chen <walker.chen@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 vkoul@kernel.org, linux-phy@lists.infradead.org
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-2-changhuang.liang@starfivetech.com>
 <20230419-labored-camper-644d51a7ca96@spud>
 <1a5b15fa-4f20-51c2-2ba1-a04a2911a694@starfivetech.com>
 <20230424-baffle-punch-ec73098f2b6a@spud>
 <d685a1d4-c07d-7dfa-f1fb-b35ceb2aa0eb@starfivetech.com>
 <20230425-unquote-eligible-09f743d81981@wendy>
 <a7cdfabf-2312-eaf3-f462-5bda7f0a120d@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a7cdfabf-2312-eaf3-f462-5bda7f0a120d@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_011923_914169_C02F5A90 
X-CRM114-Status: GOOD (  13.87  )
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

On 25/04/2023 09:57, Changhuang Liang wrote:
>>>>>>>  
>>>>>>>  description: |
>>>>>>>    StarFive JH7110 SoC includes support for multiple power domains which can be
>>>>>>> @@ -17,6 +18,7 @@ properties:
>>>>>>>    compatible:
>>>>>>>      enum:
>>>>>>>        - starfive,jh7110-pmu
>>>>>>> +      - starfive,jh7110-aon-pmu
>>>>
>>>> I was speaking to Rob about this over the weekend, he asked:
>>>> 'Why isn't "starfive,jh7110-aon-syscon" just the power-domain provider
>>>> itself?'
>>>
>>> Maybe not, this syscon only offset "0x00" configure power switch.
>>> other offset configure other functions, maybe not power, so this
>>> "starfive,jh7110-aon-syscon" not the power-domain itself.
>>>
>>>> Do we actually need to add a new binding for this at all?
>>>>
>>>> Cheers,
>>>> Conor.
>>>>
>>>
>>> Maybe this patch do that.
>>> https://lore.kernel.org/all/20230414024157.53203-6-xingyu.wu@starfivetech.com/
>>
>> This makes it a child-node right? I think Rob already said no to that in
>> and earlier revision of this series. What he meant the other day was
>> making the syscon itself a power domain controller, since the child node
>> has no meaningful properties (reg, interrupts etc).
>>
>> Cheers,
>> Conor.
> 
> Yes, "starfive,jh7110-aon-pmu" is a child-node of "starfive,jh7110-aon-syscon".
> In my opinion, "0x17010000" is "aon-syscon" on JH7110 SoC, and this "aon-pmu" is just 
> a part of "aon-syscon" function, so I think it is inappropriate to make "aon-syscon"
> to a power domain controller. I think using the child-node description is closer to
> JH7110 SoC. 

Unfortunately, I do not see the correlation between these, any
connection. Why being a child of syscon block would mean that this
should no be power domain controller? Really, why? These are two
unrelated things.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
