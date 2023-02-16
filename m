Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CBBC636CC
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 08:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YZc96cYP8ctiWVE0gF9FcPRUQ5U//mNyvcFE2e9Lwf4=; b=18KPnmJ8tV9pHs
	eInyhiVa11v/0SCJjhPdPu0xWUZSAtk52a9mAnigGodAwOrrm823Jwtk9ktPX92cT9d4rcfBMPP6l
	WinT9DggUMudeR8eLYorKpBd/+e0DN/W2l0q6d35qmruVq8HUB1zXLWNbmOaTq15C41bTzZVfftYJ
	AtCH2YU3mopGXtPu0K8EKJ9PUATGR7Vin89p3/rpz59goXov8Ddn9svLJTumN+SlWsioFdcbaXNgq
	Mc7E5LJFF716nlVmnNRs+h/QoGyx+qXK3BL2OMlN2+OuiPbWAVqGstI8xVxPiO6cx+sV9NOnB7jp7
	0Y970ICvp08KD96jq0sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZOS-008wwP-Eo; Thu, 16 Feb 2023 08:13:28 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSZOP-008wv9-LH
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 08:13:27 +0000
Received: by mail-ej1-x633.google.com with SMTP id jg8so3219947ejc.6
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 00:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6MIr9w0JhLAMdjA5iNWKYrwooq+WRfPQyN5izB+i3U=;
        b=pM5IQ7LP/GCPE4auZwxMqseFV38G3mMxAdbs6vTFEwJjVhIfIsGImLrwsSeHpVXrbu
         /TFZ9CUB0VU3lHMSpNGgs0cVL6xrQT489uLY+s37f/W3rXBDMvYrbUg1rkHC9ZopIku6
         sAvxuqT64Tg7HF8NhlG0JylB6yCUyFGzrYYpnWcAUKjwGLSPsQAfWayFbKV3ezbTPBOT
         eAPPtHp1DApkbBPIbPd3NTOpTEfIieg97i18aor8pSWJ82izcLoObiv4ZHBqIpJeYz77
         Y2/jqAh/Gcdic+qAQVoUhVSrpcJ0dV8kYbl6yxbnxJN7uvDuANeY/dyM5z7emqCj3hNa
         9tSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6MIr9w0JhLAMdjA5iNWKYrwooq+WRfPQyN5izB+i3U=;
        b=C3+/zu63ynU1F0KRR1PlIMMStldb5Il2DnRLJu+Ymi7nRzX6pH4XgeemqF3FRRgm8f
         yCw9ycGiJ5UMOmPZQQq9ltvsevPQOlOvjdq583VBi0tOP+IrzppaD+LqjrghHKgqPQLr
         4ov2Dohoed84k6d4DBXcuWAAgGMRlwPmvdcTnEbyEk11RR/J7caRa9NFbCbpyT4x82Zh
         9tAzb6HF3hzfwquBZ2yE+AZF24vgG8Q0aCYi1MuxGJaFJ+5ryyKr1GtO5a1YuKKXFKoU
         Yfli09lpTAxH8f3cite+38kB36njLleqhYzZ3Nc3EGkJT52Ng2bQ1UhdidkaXy2nNyv6
         oisA==
X-Gm-Message-State: AO0yUKXh77mAn3NUpEAVPEkGiX98IcfaHMq+uAwg6Hy488l6KQ8kSRm2
	mD9euu3f4Q2r26GY61I3nbeeGw==
X-Google-Smtp-Source: AK7set/Uy+Hmc8Q4dAMmjxdpjZHwIV47rA2IrMvPHIp0cqv896niQ9ZsYsSe1BbZoyLJJfKLOqFwug==
X-Received: by 2002:a17:906:6c87:b0:7d3:c516:6ef4 with SMTP id s7-20020a1709066c8700b007d3c5166ef4mr5921075ejr.20.1676535203797;
        Thu, 16 Feb 2023 00:13:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id my10-20020a1709065a4a00b0084d35ffbc20sm483150ejc.68.2023.02.16.00.13.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 00:13:23 -0800 (PST)
Message-ID: <2bc63ab2-2fd6-3fae-33d5-a6096b78cec0@linaro.org>
Date: Thu, 16 Feb 2023 09:13:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 2/7] dt-bindings: net: snps,dwmac: Update the maxitems
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
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-3-yanhong.wang@starfivetech.com>
 <15a87640-d8c7-d7aa-bdfb-608fa2e497cb@linaro.org>
 <c9ab22b5-3ffb-d034-b8b8-b056b82a96ce@starfivetech.com>
 <aa85caa3-6051-46ab-d927-8c552d5a718d@linaro.org>
 <e066920c-26a9-0f0e-3304-2b9940274d57@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e066920c-26a9-0f0e-3304-2b9940274d57@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_001325_747604_9E0D42D6 
X-CRM114-Status: GOOD (  15.80  )
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

On 15/02/2023 08:46, yanhong wang wrote:
> 
> 
> On 2023/2/7 15:59, Krzysztof Kozlowski wrote:
>> On 07/02/2023 03:43, yanhong wang wrote:
>>>
>>>
>>> On 2023/1/18 23:47, Krzysztof Kozlowski wrote:
>>>> On 18/01/2023 07:16, Yanhong Wang wrote:
>>>>> Some boards(such as StarFive VisionFive v2) require more than one value
>>>>> which defined by resets property, so the original definition can not
>>>>> meet the requirements. In order to adapt to different requirements,
>>>>> adjust the maxitems number definition.
>>>>>
>>>>> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/net/snps,dwmac.yaml | 9 +++------
>>>>>  1 file changed, 3 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>>> index e26c3e76ebb7..baf2c5b9e92d 100644
>>>>> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>>> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
>>>>> @@ -133,12 +133,9 @@ properties:
>>>>>          - ptp_ref
>>>>>  
>>>>>    resets:
>>>>> -    maxItems: 1
>>>>
>>>> Also, this does not make sense on its own and messes constraints for all
>>>> other users. So another no for entire patch.
>>>>
>>>
>>> Thanks. Change the properties of 'resets' and reset-names like this:
>>>
>>>   resets:
>>>     minItems: 1
>>>     maxItems: 2
>>>
>>>   reset-names:
>>>     minItems: 1
>>>     maxItems: 2
>>>
>>> Is it right?  Do you have any other better suggestions?
>>
>> Isn't this allowing two reset items for every variant of snps,dwmac?
>>
> 
> Sorry for not getting back to you faster.
> After referring to the above modification, i used the command 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> to check all the bindings(including 'starfive,jh7110-dwmac.yaml'), no errors are reported,
> and the errors reported by Rob Herring are gone.

I don't see how does it answer my question. I claim you loosen the
constraints and allow now two resets for everyone. You say you don't see
errors. I never claimed there will be errors. I claimed what I said -
you allow now to reset everywhere, which might not be correct
description of every hardware.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
