Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C1FC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HLLo3AZQ5WR7SbrTw2Lfl1V4PjCqUoZhtSooewcKXGk=; b=0UESA9Fk6rObch
	9bknSurodBqe2KdKwGEtSZYMWm8+SXsAj5zjzmHuFq+ffR9+oAIksAiNt593xthsgPRCxC/FKJQaS
	JtMSWM6ABfumvoRJUtb131m5VhGTqmnmSTfusAeZ8SLqAkffvTTzwit3FB8U8Qlytk5LKJN/iOxas
	UBhlmWSCZpE2PqAvGADhiTZkTpVEokXKRpQXFAcQmpeZsSA2VLlHI2YN/l4oPXG/VTqDhFwS/4W6q
	H12ptafft1Wn5E21+oqv+eq2U0XAYyvcjwmwFsc1Km6Q2IOt2Wr+vQAoTTm/UFwPAFX8BzMWNOWvV
	vY0dtSVqUzZex6eI144g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IC8-007sOi-2j;
	Wed, 29 Nov 2023 10:53:28 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IC5-007sNT-2k
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 10:53:27 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a013d22effcso884666466b.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Nov 2023 02:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701255203; x=1701860003; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l2jvWR/J4cBkDbvzBiC6ME393r+YwZ2uP+QwtlnTojA=;
        b=GF40d3gTIuQi36W8KcKciGJ4QskU9dNO/tnepeT/d2FhS5OAJbfInyxrvQ+NnYzfgC
         97euT/gFNteAX0Ma/6S3k34fl/l4D5IvC0f3zUA+fD+JpoZq4JkVdVPbzpr+LD0gsEUG
         NKWuVLnxUwxk74AHg/nIOKzv3EAUHTpOVZupYSEibcE++OIx40prQ08YGzXf1Z1ZKdxf
         3FYjP52+3NrfKl9+VlP2xAb9CYZNy6UkxI4304KKAWWphsR6O+JH/LqeCbeEMoVH4iKf
         LohQNZn1qJ1HElf9A8Q2LfXe8H/OaLehQ7Kzubt2apFy3dV1GBrFqIbu/plAqi1KxErJ
         rMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701255203; x=1701860003;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l2jvWR/J4cBkDbvzBiC6ME393r+YwZ2uP+QwtlnTojA=;
        b=mt6+tb3HB5vLIBZYvpi+4I3jSMfqG5oAPBwLUjcQTW+YK7Ig7quyFpTvhjQPAVIBO1
         NnLCFibGfKFJlmNtBaws++s84afFr0jzNc312E8B199b/ukyR3aQ5TiftybVBMXDyfmD
         8KU6/iZIMaVKC+UFEzlZdEzEGsi3I1j6feCYEdzQ0DtnLRf7Jty7UAiX7olSbFitblxr
         0506BxfOdG1VT1AbrZ7XMi7t5oKB1Wwsw875HkSruPQUqifmD2VTb76eEkL3YUTNmBOR
         8SK2XFFgcr+O1qw2P6En1JNSPdIS/qGlGOLWwtEsK+UgtGiZctAYiKzt9Zb3fXpNpr5q
         2YoA==
X-Gm-Message-State: AOJu0YyYJFApmFlehtGno0V+cXqsK+pGyy5FCZIwIBlHCbQZ1ucLA6KE
	jjn4vCu2CWun3b83K1sqOdvcWg==
X-Google-Smtp-Source: AGHT+IHNeo0Dghv67Ss3OsTU5+PvZkC+kVErbMHdZ1oK2rp8CmSce+8O/aLA2Q0KlJtETlAQPZTJlg==
X-Received: by 2002:a17:906:f6cf:b0:a10:a91f:e75e with SMTP id jo15-20020a170906f6cf00b00a10a91fe75emr6306762ejb.18.1701255203380;
        Wed, 29 Nov 2023 02:53:23 -0800 (PST)
Received: from [192.168.1.20] ([178.197.223.109])
        by smtp.gmail.com with ESMTPSA id k7-20020a17090627c700b009e50ea0a05asm7814793ejc.99.2023.11.29.02.53.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 02:53:22 -0800 (PST)
Message-ID: <068ca34d-a930-4542-bde3-4fbb4c228807@linaro.org>
Date: Wed, 29 Nov 2023 11:53:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] dt-bindings: serial: cdns: Add new compatible
 string for StarFive JH8100 UART
Content-Language: en-US
To: JeeHeng Sia <jeeheng.sia@starfivetech.com>,
 "kernel@esmil.dk" <kernel@esmil.dk>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "conor@kernel.org" <conor@kernel.org>,
 "anup@brainfault.org" <anup@brainfault.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "jirislaby@kernel.org" <jirislaby@kernel.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 Michael Zhu <michael.zhu@starfivetech.com>,
 "drew@beagleboard.org" <drew@beagleboard.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Leyfoon Tan <leyfoon.tan@starfivetech.com>
References: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
 <20231129060043.368874-6-jeeheng.sia@starfivetech.com>
 <8f2f241d-580a-4906-949a-b99b5a600868@linaro.org>
 <d5a3a8798333431fbb2aee573383a8e4@EXMBX066.cuchost.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <d5a3a8798333431fbb2aee573383a8e4@EXMBX066.cuchost.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_025325_901378_51E17997 
X-CRM114-Status: GOOD (  19.84  )
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

On 29/11/2023 11:33, JeeHeng Sia wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Wednesday, November 29, 2023 4:26 PM
>> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
>> krzk@kernel.org; conor+dt@kernel.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
>> daniel.lezcano@linaro.org; tglx@linutronix.de; conor@kernel.org; anup@brainfault.org; gregkh@linuxfoundation.org;
>> jirislaby@kernel.org; michal.simek@amd.com; Michael Zhu <michael.zhu@starfivetech.com>; drew@beagleboard.org
>> Cc: devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-kernel@vger.kernel.org; Leyfoon Tan
>> <leyfoon.tan@starfivetech.com>
>> Subject: Re: [PATCH v2 5/6] dt-bindings: serial: cdns: Add new compatible string for StarFive JH8100 UART
>>
>> On 29/11/2023 07:00, Sia Jee Heng wrote:
>>> Add new compatible string for UART in the StarFive JH8100 SoC.
>>>
>>> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
>>> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
>>
>> The patch is quite different than v1. Are you sure the review is
>> applicable? If it was given for v2, where is it?
> This patch is impacted by the comment suggesting the exclusion of patch 5 in V1. In V2, this patch adds compatible for cdns-uart-r1p8, allowing us to continue using the cdns uart.

Please wrap your replies.

How does this answer my concern about review tag?

Do you understand that my comments are inline under the exact line which
is questioned?

>>
>>> ---
>>>  Documentation/devicetree/bindings/serial/cdns,uart.yaml | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/serial/cdns,uart.yaml b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
>>> index e35ad1109efc..0d05305778f2 100644
>>> --- a/Documentation/devicetree/bindings/serial/cdns,uart.yaml
>>> +++ b/Documentation/devicetree/bindings/serial/cdns,uart.yaml
>>> @@ -20,6 +20,10 @@ properties:
>>>          items:
>>>            - const: xlnx,zynqmp-uart
>>>            - const: cdns,uart-r1p12
>>> +      - description: UART controller for StarFive JH8100 SoC
>>
>> This is duplicating compatible, drop.
> Do you mean drop compatible for starfive,jh8100-uart ?

No, drop description and use directly " - items"

>>
>>> +        items:
>>> +          - const: starfive,jh8100-uart
>>> +          - const: cdns,uart-r1p8
>>
>> Don't add things to the end of the list, but keep order. I would suggest
>> to put it at the beginning, so before Xilinx.
> I'm trying to get what you're asking, but it's a bit confusing for me. So, I thought it might be easier if I just share the code below. Please let me know if this addresses your comment?
> properties:
>   compatible:
>     oneOf:
>       - description: UART controller for StarFive JH8100 SoC
>         items:
>           - const: cdns,uart-r1p8

Order is fixed, thanks. But drop description and bring back specific
compatible. You must have specific compatibles, always.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
