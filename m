Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD066D29FBC
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 02:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDQgMZxf+/mEQURCgS9DmEUXaIMqUZY8Fo6NDgF5Zkw=; b=Na1o4OVW3jiOgO
	areu3xO9krx+NMxbqOZwyhLOs7ffNZWxSdKm/J91UmycDaDk0jfaStg7KYTP2VjZpe4NlWA2uiiTK
	27kSzG1dWwCbG6Co8pGCGjgWBZtsqdhca7MDAjyjBPlryL7A58qpAQ5U5y2TjotyohEer9c8Jvd9y
	4Yc0RO6bib98N8ZOOCL3sS6PhGz55qzx0wDTtEXGwQWkAvB1Ol3p4sWZFoqYUYMeGyPQF2o4Pjgpk
	P3U3IcrWx8j/ZYvLJRMf57R8iikLcCzW8nTXQM1e4mmYuAEW56Zepx3uml7oaD0S6Rg3GJC/Y76xP
	CWjs661NFICarmjcBIyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8s34-00000005Ql8-3BEr;
	Thu, 07 Nov 2024 02:15:02 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8rmc-00000005Mgu-2cvf
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 01:58:04 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-720be27db74so373214b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 17:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730944682; x=1731549482; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=md8qGmUwucZsJOoKZLKFBDyoljb1kwIRUfgiJbBH7Io=;
        b=N9JHKbpWfXbeUbgd/jkWSg+z2cvtg9rLUbArNFffRBcZ1vdT/5KMJjTbZtHwSbstE2
         eHUW2/iARLzQYpgPkmC/I82MQhzKxuhYiXiMd4MY7W5B5ISv0Alu6BAtHA9syWbmMdq/
         H5oUP2beaWdxKuWd4Toka7VNHhakzgNwzjhW7f0/+iUnomtdyYg/lY3bE5Naef+g8RPI
         pMHs8dRzuest4QjwROCeukZuFzI7CrqbOXZZL9btkcHpBamGYKAWQIeDtI05NBAR7258
         wVfWVsxK+ioHwVazsue8NtBczebg2ZOufklKvc91n/Hy8psMExKJ2+6ftj3yuEruk8Pf
         bDDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730944682; x=1731549482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=md8qGmUwucZsJOoKZLKFBDyoljb1kwIRUfgiJbBH7Io=;
        b=UL+rCgv9DLoN+846pzjUZcbAGy02zS/v4txL0y+kkNaUyOKmLAAxIUOGn5VzusP/SE
         N6va6qct79BjZkmC6IiRtn1RdwCA/k2DsnwByaH9mZSo2exYcf9P6ji2ewKlQ7pkWvQZ
         GpCc5oq9LTAY9nlXEEGU1djUJkFWlPh13L7NYYaa+iEDcXp+Px7WNsAObsilyUAtieRQ
         16B8X9j2oJ1Gh4hkWVwpvgMvj26Kn1W+EhJz/WNN3uKiX58y26nq8ko3hgnonoxmvuw/
         fhzU9dgNzr+YXTHwhpbgB1f3M0Gh0E829iscUw0CER3/IgtWO+cXNRRB6e0XHZjvdoyj
         4lMg==
X-Forwarded-Encrypted: i=1; AJvYcCU64VEbvSC9D1y5imCuPBVaF4AoTMCO5NkFUZHW8S77gt+jR1kX9LJZsN5qTcs6kBmAP3IbM/zl6flUxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzLMUNHYl0RYjjdhC8j8HXilqWGJtTUn5s+MS2/eBUoqg+hBkzW
	+AD+NlJ04H6hUQCCdQKg6uqwq2Rks6ACKjcX0ZqH8t6yonVzxTcG
X-Google-Smtp-Source: AGHT+IGKzsYST9dTy5KUaBfUjEUHF7tB0ZZbVmni7Y8Yv6eVCopLlqVpmaqigbKcWQMobr4L/irIOg==
X-Received: by 2002:a05:6a00:b93:b0:71e:41a6:a0c6 with SMTP id d2e1a72fcca58-72404352136mr2116162b3a.13.1730944681646;
        Wed, 06 Nov 2024 17:58:01 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5c26a6sm202567a12.30.2024.11.06.17.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 17:58:01 -0800 (PST)
Message-ID: <53898c38-1ae4-476b-9782-fdef41a5c932@gmail.com>
Date: Thu, 7 Nov 2024 09:57:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Samuel Holland <samuel.holland@sifive.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <846b4f2a-602e-431e-affc-0e995db5eee5@sifive.com>
 <9dfb250c-d8a1-4536-8658-48b3a2585abd@gmail.com>
 <a9f59ffb-23e9-4c83-8d44-4c766e32b3bf@sifive.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <a9f59ffb-23e9-4c83-8d44-4c766e32b3bf@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_175802_749260_ACAFAFFF 
X-CRM114-Status: GOOD (  25.91  )
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


On 2024/11/7 08:29, Samuel Holland wrote:
> Hi Troy,
> 
> On 2024-11-06 1:58 AM, Troy Mitchell wrote:
>> On 2024/11/2 11:48, Samuel Holland wrote:
>>> On 2024-10-28 12:32 AM, Troy Mitchell wrote:
>>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>>> and supports FIFO transmission.
>>>>
>>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>>> ---
>>>>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>>>>  1 file changed, 51 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>>> new file mode 100644
>>>> index 000000000000..57af66f494e7
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>>> @@ -0,0 +1,51 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: I2C controller embedded in SpacemiT's K1 SoC
>>>> +
>>>> +maintainers:
>>>> +  - Troy Mitchell <troymitchell988@gmail.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: spacemit,k1-i2c
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>
>>> Looking at the K1 user manual (9.1.4.77 RCPU I2C0 CLOCK RESET CONTROL
>>> REGISTER(RCPU_I2C0_CLK_RST)), I see two clocks (pclk, fclk) and a reset, which
>>> looks to be standard across the peripherals in this SoC. Please be sure that the
>>> binding covers all resources needed to use this peripheral.
>>
>> RCPU stands for Real-time CPU, which is typically used for low power consumption
>> applications.
>> We should be using the APBC_TWSIx_CLK_RST register, but it's not listed in the
>> user manual. However, you can find this register referenced in the K1 clock patch:
>> https://lore.kernel.org/all/SEYPR01MB4221AA2CA9C91A695FEFA777D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/
> 
> Ah, well that driver is missing most of the bus clocks. For example, from a
> quick comparison with the manual, the driver includes sdh_axi_aclk, but misses
> all of the PWM APB clocks at APBC_PWMx_CLK_RST bit 0.
> 
> If the clock gate exists in the hardware, even if it is enabled by default, it
> needs to be modeled in the devicetree.
I think you mean `APBCSCR`? It will keep enable all time.Just a difference in
frequency.

Should I add it in clockc property? If yes, how about this:
    clocks:
        maxItems: 1

and in dts example:
    i2c@d4010800 {
	...
        clocks = <&clk_apbc>, <&ccu 90>;
	clock-names = "clk_apbc", "clk_twsi";
        ...
    };
But one thing is, apbc_twsi is the sub-clock of clk_apbc, is this a duplicate
listing?
> 
>> Also, to see how to enable the I2C clock in the device tree (note that the
>> spacemit,apb_clock property is unused in the driver), check out the example here:
>> https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi#L1048
> 
> The devicetree describes the hardware, irrespective of which features the driver
> may or may not use.
> 
>>>> +
>>>> +  clock-frequency:
>>>> +    description:
>>>> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
>>>> +      modes are supported by hardware, possible values are 100000 and 400000.
>>>> +    enum: [100000, 400000]
>>>
>>> This looks wrong. In the manual I see:
>>>
>>> * Supports standard-mode operation up to 100 Kbps
>>> * Supports fast-mode operation up to 400Kbps
>>> * Supports high-speed mode (HS mode) slave operation up to 3.4Mbps(High-speed
>>> I2C only)
>>> * Supports high-speed mode (HS mode) master operation up to 3.3 Mbps (High-speed
>>> I2C only)
>>>
>>> So even ignoring HS mode, 100 kHz and 400 kHz are only the maximums, not fixed
>>> frequencies.
>> okay. I will fix it in next version.
>> and should I keep to ignore high-speed mode here?
>> if not, how about this:
>>
>>   clock-frequency:
>>     description:
>>       Desired I2C bus clock frequency in Hz.
>>       K1 supports standard, fast, high-speed modes, from 1 to 3300000.
>>     default: 100000
>>     minimum: 1
>>     maximum: 3300000
> 
> I don't know if high-speed mode should be included, since it requires some extra
> negotiation to use. Assuming it should be, that looks reasonable.
thanks.
> 
> Regards,
> Samuel
> 
>>>
>>> Regards,
>>> Samuel
>>>
>>>> +    default: 100000
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - clocks
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    i2c@d4010800 {
>>>> +        compatible = "spacemit,k1-i2c";
>>>> +        reg = <0x0 0xd4010800 0x0 0x38>;
>>>> +        interrupt-parent = <&plic>;
>>>> +        interrupts = <36>;
>>>> +        clocks = <&ccu 90>;
>>>> +        clock-frequency = <100000>;
>>>> +    };
>>>> +
>>>> +...
>>>
>>
> 

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
