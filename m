Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD217C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 20:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPKUdPlmpDGO/lwXtNQzRqBAKnR/xcXQVj8flO7z62s=; b=mbRk2IkaylYZfN
	BRsS7rAHrkiSEVxdGq74DUIhrjS3BKQfMYXs32vyGBICogjP+gRv0854CQgCBvuBU/q9qPDuxCSoW
	ipKZPCN60mVnmlu7a2q84GB2bqo90j0MIAgvqwLNk5IwcuFPpzvDg2T/n0uh2+toiO/oBVj0br43r
	vICKvhFbFCyL/IrjOe+0wlcvyCDIHdqkLphaXRUq3nTTmlMA21ufveK3uCmuPiKsTUno5tkSmJb6a
	ya1jFnO/XIL61kvzTptWHcEf5ONDdRfZNbSK7S5qiMcFCwUpfapUFNCLAfZSIEbL7AwT0JwQZbJYW
	qJW3eNRy8tbTKEUoG8tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMyDa-00G0nW-HY; Wed, 23 Feb 2022 20:26:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMyDX-00G0n7-15
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 20:26:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso45784wme.1
 for <linux-riscv@lists.infradead.org>; Wed, 23 Feb 2022 12:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sJPlOaClwDYorktbDkd9+wDzEANKDnxO5CFuBVYHXe8=;
 b=BEEfhcPqiI+WT+Dpz7WzsUiLQTWWnMGmqoexEhw593Y8ZxjjKAZ7ao2qeB0VJZJh6k
 yBSGlRqkEIG8RCxnec2/BV4zUIEGx0OF8Z0I0bfqTwNgOa8x2ncKzuh104dOuGOtZ1lS
 Pl/HqYC6zKa9tsnnoJscfu/xMTAhahGI5qwNHxSmIynWSvlwR86mIWhHPYc3H0lbSp+i
 UFJZV0nEkO21ekUFWgd1zv3VMvxZCBmYVbVBhy9itkQQJOjFmaPzXJ+ryFjhgtMhYpFO
 ytEG9yc9J0dhY3k/Wlf+8huRfPo9Ivl7hXHsdB3UaPNiuB4LmsG/qt6jMKj3PfSqG7TA
 vWog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sJPlOaClwDYorktbDkd9+wDzEANKDnxO5CFuBVYHXe8=;
 b=mLIMAECVm664Pra8GgrZ2tk4bkdyRxNJFHRAqbvhPSvi8p7hyRGZwL0MsFKf5X2a8b
 AyAyTTPn9i7WlasiSI/wiHXXbEqXGkTECwkXWfeWBA7DADWaVpbKr3nBbu6wurDRaXpk
 PlBnRT6hyl8QcrKzHVqH1FCM5kXx3x3BFgpup76k5VjwhPc7sZ88qUKTQjFkYStWo4jZ
 aYs7dEXNOajnZ+C+MWdo8XkD0OaGV0Ib3EXF7vvxUE5Uv3D6gIcypQVSiDJv21C4Cimh
 o1+KMyQzcqtfKypQPl28dTgk3o9+RHWkQqIvprXcvAMWhLsfRUI0cq/UsWm5WZ81vU/j
 9R0w==
X-Gm-Message-State: AOAM5335GYMk/F53tOAyF8S35IvCMwWaPfGtFK1Ys2PZ9IAIyDtlf5HI
 vTnq1Az2lxAzoCmypTvaFeIH/A==
X-Google-Smtp-Source: ABdhPJwe3rIUpO4EQyWFQvq2poGfUjKuImrMQv+GNJQxf6u9vnwiDVZXhTabIndzGbOLOUpAfeVMzA==
X-Received: by 2002:a05:600c:4fd6:b0:352:c2c6:8f34 with SMTP id
 o22-20020a05600c4fd600b00352c2c68f34mr9133943wmq.186.1645647988449; 
 Wed, 23 Feb 2022 12:26:28 -0800 (PST)
Received: from [192.168.2.116] ([109.76.226.172])
 by smtp.gmail.com with ESMTPSA id e3sm466620wrr.94.2022.02.23.12.26.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:26:27 -0800 (PST)
Message-ID: <08bed815-5f34-634f-df6d-7c7371c33033@conchuod.ie>
Date: Wed, 23 Feb 2022 20:26:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v7 03/11] dt-bindings: rtc: add bindings for microchip
 mpfs rtc
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Conor.Dooley@microchip.com
Cc: a.zummo@towertech.it, Lewis.Hanly@microchip.com,
 Daire.McNamara@microchip.com, Ivan.Griffin@microchip.com,
 atishp@rivosinc.com, palmer@rivosinc.com, robh@kernel.org,
 linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, krzysztof.kozlowski@canonical.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-4-conor.dooley@microchip.com>
 <5b0681a0-ff46-7eb4-3644-0d1173c1f0d4@microchip.com>
 <YhZQRqHib2+GR7Ma@piout.net>
 <3483b6c4-67a7-5ed5-2953-728ea8ba5874@microchip.com>
 <YhaXJofTTTgaoEsn@piout.net>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <YhaXJofTTTgaoEsn@piout.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_122631_148974_A11630EB 
X-CRM114-Status: GOOD (  14.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 23/02/2022 20:20, Alexandre Belloni wrote:
> On 23/02/2022 15:25:00+0000, Conor.Dooley@microchip.com wrote:
>> On 23/02/2022 15:18, Alexandre Belloni wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>
>>> On 23/02/2022 07:41:27+0000, Conor.Dooley@microchip.com wrote:
>>>> Hi Alessandro, Alexandre,
>>>> If one of you could take a look at this, that'd be great.
>>>
>>> I actually expected someone else to apply this, what is your plan?
>>
>> I was going to ask Palmer to take the series via riscv. Since I have
>> Rob's R-b, I was just looking for a subsystem maintainer ack/R-b before
>> actually asking him.
>>
> 
> Rob's review is enough for a DT binding, no need to wait for me. but
> FWIW:
> 
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Great, thanks.
> 
> 
>> Thanks,
>> Conor.
>>
>>>
>>>> Thanks,
>>>> Conor.
>>>>
>>>> On 14/02/2022 13:58, conor.dooley@microchip.com wrote:
>>>>> From: Conor Dooley <conor.dooley@microchip.com>
>>>>>
>>>>> Add device tree bindings for the real time clock on
>>>>> the Microchip PolarFire SoC.
>>>>>
>>>>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>>>>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>>>>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>>>> Reviewed-by: Rob Herring <robh@kernel.org>
>>>>> ---
>>>>>     .../bindings/rtc/microchip,mfps-rtc.yaml      | 58 +++++++++++++++++++
>>>>>     1 file changed, 58 insertions(+)
>>>>>     create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..a2e984ea3553
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
>>>>> @@ -0,0 +1,58 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
>>>>> +
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
>>>>> +
>>>>> +allOf:
>>>>> +  - $ref: rtc.yaml#
>>>>> +
>>>>> +maintainers:
>>>>> +  - Daire McNamara <daire.mcnamara@microchip.com>
>>>>> +  - Lewis Hanly <lewis.hanly@microchip.com>
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - microchip,mpfs-rtc
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    items:
>>>>> +      - description: |
>>>>> +          RTC_WAKEUP interrupt
>>>>> +      - description: |
>>>>> +          RTC_MATCH, asserted when the content of the Alarm register is equal
>>>>> +          to that of the RTC's count register.
>>>>> +
>>>>> +  clocks:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: rtc
>>>>> +
>>>>> +required:
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - interrupts
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +
>>>>> +additionalProperties: false
>>>>> +
>>>>> +examples:
>>>>> +  - |
>>>>> +    rtc@20124000 {
>>>>> +        compatible = "microchip,mpfs-rtc";
>>>>> +        reg = <0x20124000 0x1000>;
>>>>> +        clocks = <&clkcfg 21>;
>>>>> +        clock-names = "rtc";
>>>>> +        interrupts = <80>, <81>;
>>>>> +    };
>>>>> +...
>>>>
>>>
>>> --
>>> Alexandre Belloni, co-owner and COO, Bootlin
>>> Embedded Linux and Kernel engineering
>>> https://bootlin.com
>>
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
