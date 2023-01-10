Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43433C54EBE
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 08:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F7YAPgSh7zXABFdeutdf0/pxf4SisbnWXJdSQBz8Yzc=; b=aMXPxI41V7Ok4K
	crrvsXcZOVtnxxn96xKZG3hXeTCz+oi6wQFdZzGpkQC2frEt3T9GO10v8TEBoBqm32qBMdeBRONxc
	8+EPHTk3bFmYctCpiccqTW/JuwBOvGl1/8lDDw1hhciFDrvGMlrwp1Gz6I/ceMZhhzJqSe6B3ulO4
	ZmUAp8RAKj5+uMOFIeYnbYwzWKtN5WprKrku0QguEI29wqK/4I8jtP3uIQSqL2XHuI1mhRm+gtxnd
	NCIw0iJGb5Kdi54UQQ4nhkG/8nHA9zVpnUXkp82UyFKc9UsSDOQGtB3RO43WfTVs1D1/9NN7soaeb
	kDCcjKaIs5mTSKlCW/dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9wQ-005nBZ-UA; Tue, 10 Jan 2023 08:25:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9wN-005nAA-Jp
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 08:25:05 +0000
Received: by mail-wm1-x32d.google.com with SMTP id ja17so8171062wmb.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 00:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMoqZy8lL6lKnv3mK+SHjAH6f5V4KXyJJY9vMCQj/VM=;
        b=TV/zP38nT/DV77mwIwJKMtCilXcLYKNqFaSt4ttTXejVQPETGHaTze/gAgtQUETvZh
         x8MuR/5XO92gVTfPK4sbIgmeJ1giXD0x8jCqPRETWfHCEpPfi2VxeU+Jkw37+IgzYzNJ
         aDaD8rJzgn0485gyM4LgU0Ityeo5tL8MVyZ7lj1FZkCTZ4rH6Xf1lPaR3u6rKtqQfgGs
         EDGjisRz/4hvrQDBOkWvyIQMnAw+KRLExidd/YoMBJhrX8LTX8Yx5WFWLnE8QcW4UqS3
         P1XQq9wx/lbuw+k9lbrnrWglair+kGIjSphEoBBUrsPUIQdtXyWN09igCGzqQz7OcHoR
         w46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMoqZy8lL6lKnv3mK+SHjAH6f5V4KXyJJY9vMCQj/VM=;
        b=JCkRj5hpfeT8ttXgvj0MAUlzc9TglFiNyEbT7RTgztNj0s97+9rBJhV8xkx6//X9FH
         e5148p3dD0aCWaYoCFpLG2CsPMDcG0DgjRbYI+6kukUFdPSNwgo2iu02lkq2ZPS2ajsT
         0+eH2WQm0Naamle28a7CxR8xI0194eBdfZWf44tLAjIloyP7rDG2YTUzLYP5COl61oOh
         hASFxs7vc22lcpkzr6grJAa1mt60UXJ7C+QrOkpvV5NL40Rsw7IzYySYA021d3SU/z9Y
         uL/r3RvaVYZHxlYksCD9lArciW7XvSZnZtVyxRrJi0Hrfk6jrG+cJ19sR9D59LGSmgu8
         qJbQ==
X-Gm-Message-State: AFqh2kotDJq3tp/K1lob/qFtlkmHydt8BKkbUX/r4eBtwi0x5aOyPggx
	gsP3Gl5NwfpUFdZvt4+HRhdvPbiW/jg4++ru
X-Google-Smtp-Source: AMrXdXs5LDxIeadvFOYauvtpjU/gcobZo9BXdvfHf5RlHyauK1UfZsK3bydJnx2PQECskqIfaSL1Ig==
X-Received: by 2002:a05:600c:1f18:b0:3cf:5583:8b3f with SMTP id bd24-20020a05600c1f1800b003cf55838b3fmr47116237wmb.20.1673339100837;
        Tue, 10 Jan 2023 00:25:00 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m18-20020a05600c4f5200b003c6b70a4d69sm15783317wmq.42.2023.01.10.00.24.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 00:25:00 -0800 (PST)
Message-ID: <6f1c38fc-9586-8ed5-8403-947ed6863b03@linaro.org>
Date: Tue, 10 Jan 2023 09:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 1/3] dt-bindings: timer: Add timer for StarFive JH7110
 SoC
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org
References: <20221223094801.181315-1-xingyu.wu@starfivetech.com>
 <20221223094801.181315-2-xingyu.wu@starfivetech.com>
 <179e66a8-c6c0-6d3e-4f4a-6b884f532572@linaro.org>
 <4febeef1-a42a-7d6f-d1af-d8fe19582822@starfivetech.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4febeef1-a42a-7d6f-d1af-d8fe19582822@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_002503_693042_0F0006EC 
X-CRM114-Status: GOOD (  22.37  )
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

On 10/01/2023 03:14, Xingyu Wu wrote:
> On 2022/12/23 18:25, Krzysztof Kozlowski wrote:
>> On 23/12/2022 10:47, Xingyu Wu wrote:
>>> Add bindings for the timer on the JH7110
>>> RISC-V SoC by StarFive Technology Ltd.
>>
>> Please wrap commit message according to Linux coding style / submission
>> process (neither too early nor over the limit):
>> https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586
>>
>>
>>>
>>> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
>>> ---
>>>  .../timer/starfive,jh7110-timers.yaml         | 105 ++++++++++++++++++
>>>  1 file changed, 105 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml b/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
>>> new file mode 100644
>>> index 000000000000..fe58dc056313
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/timer/starfive,jh7110-timers.yaml
>>> @@ -0,0 +1,105 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/timer/starfive,jh7110-timers.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: StarFive Timers
>>
>>
>> Not enough, really not enough. Describe the hardware.
> 
> Will add. Thanks.
> 
>>
>>> +
>>> +maintainers:
>>> +  - Samin Guo <samin.guo@starfivetech.com>
>>> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: starfive,jh7110-timers
>>
>> Why plural "timers", not "timer"? The module is usually called timer -
>> see other hardware that type.
>>
> 
> Will fix. Thanks.
> 
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    items:
>>> +      - description: timer channel 0 interrupt
>>> +      - description: timer channel 1 interrupt
>>> +      - description: timer channel 2 interrupt
>>> +      - description: timer channel 3 interrupt
>>> +
>>> +  interrupt-names:
>>> +    items:
>>> +      - const: timer0
>>> +      - const: timer1
>>> +      - const: timer2
>>> +      - const: timer3
>>
>> I would just drop the names, not really useful. Unless you plan to add
>> here some generic interrupt (like you did for clock-names)?
> 
> Will drop. Thanks.
> 
>>
>>> +
>>> +  clocks:
>>> +    items:
>>> +      - description: timer channel 0 clock
>>> +      - description: timer channel 1 clock
>>> +      - description: timer channel 2 clock
>>> +      - description: timer channel 3 clock
>>> +      - description: APB clock
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: timer0
>>> +      - const: timer1
>>> +      - const: timer2
>>> +      - const: timer3
>>> +      - const: apb
>>> +
>>> +  resets:
>>> +    items:
>>> +      - description: timer channel 0 reset
>>> +      - description: timer channel 1 reset
>>> +      - description: timer channel 2 reset
>>> +      - description: timer channel 3 reset
>>> +      - description: APB reset
>>> +
>>> +  reset-names:
>>> +    items:
>>> +      - const: timer0
>>> +      - const: timer1
>>> +      - const: timer2
>>> +      - const: timer3
>>> +      - const: apb
>>> +
>>> +  clock-frequency:
>>> +    description: The frequency of the clock that drives the counter, in Hz.
>>
>> Why do you need it? Use common clk framework to get that frequency.
> 
> Because normally this timer driver is loaded earlier than the clock tree driver, it won't get
> that frequency by clk framework and this 'clock-frequency' node is used instead.

I don't think that clk framework or fixed clocks are not available at
this time... of_clk_init is before timer.

> 
>>
>> Also, sort the nodes somehow, e.g.
>> compatible/reg/clocks/clock-frequency/interrupts/resets.
> 
> Will reorder. Thanks.
> 
>>
>>
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - interrupt-names
>>> +  - clocks
>>> +  - clock-names
>>> +  - resets
>>> +  - reset-names
>>> +  - clock-frequency
>>> +
>>> +unevaluatedProperties: false
>>
>> Did you test the binding?
> 
> Yes, I had tested by 'dt_binding_check'. Do you mean the 'unevaluatedProperties' is wrong
> and use 'additionalProperties'?

Yes, previously it was generating a warning but I do not see Rob's bot
answer so maybe something changed.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
