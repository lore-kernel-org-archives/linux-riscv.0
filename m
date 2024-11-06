Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043B6D29FBB
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fILurTbNYji3SKO/djXMGMnwuP3Kt7Sk6gnmoN4zzn4=; b=CgwRs2KUNm2kBT
	6ByNSF+Ga1ccezOLDeA9SQEqO3W/ep9AtZCGef0XNSSRRWx7UuhFFabhDBJK9zJJULssfZfWC5nRL
	kmHD9nMU0sdhiD9V+A77Fw8IuBVgYXrjDhtCA2e2iqUUsDt7bH2A++fJg1nbxhqnU30UZz2Y3ljO+
	MLx78JcImI2uaTscfAKubV63nQTM69Cs11OkglMyXsIYO2SiMgwFXardQ3LtiueG3IvIrvQVRJt4w
	sHRMoGLeaWSL0inZhhtDrRoKalMMuuo5k6o1z/nVSv09Pon/eCMYwSxCSwzJ/M2SoLKlA9uUdHQI0
	vQIz9sGPGbmKGiU/QWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8b0p-00000002DIz-1FgT;
	Wed, 06 Nov 2024 08:03:35 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8avj-00000002CAJ-0hYv
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 07:58:20 +0000
Received: by mail-ot1-x344.google.com with SMTP id 46e09a7af769-71822fabf4fso3469224a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Nov 2024 23:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730879897; x=1731484697; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8psUYuHR9az8zgJ1oylNVLYOsPxn1uHhNIMrELt9TE=;
        b=gbaY53HdIRDovseRzXshke1O2eJ2P4kR8bTFcUqlL03Arh4NLMwu7/6l97Tczj7922
         OpqLqq77cLSBhI+JEVSDp9SZM1VwF4N4hojzZyTFsHv64mqkitKSZ3wTxCRT6ZR4yMce
         XgTCSuIrlj0Y1JbeLW+Egeqhq7wWV9ZQDX3a60mDi2dTdVcQBXlbivyl4lvCMeovAkGI
         8SAHCMe9MC3JMimmRI9sSKnqZn9ESGesrWh4LKR8PI85y2LmBEhxBl5wQ41ImHbeTQCa
         Vr4M9Rp2p8qywmwuTk5upWibbLZFYLJub9Ty0VdL/ndsD/M1+yahKxzxn3BnAXPB1HcM
         7Ucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730879897; x=1731484697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8psUYuHR9az8zgJ1oylNVLYOsPxn1uHhNIMrELt9TE=;
        b=PB8eOL4+Cn1zgg/9NNuv/4IirUsYuWjEbrZz8gKPiM8L+U4sUwDodXmOyburdf7mLb
         fhWSNcH0k6Bom6qXWw/MzFbyg9LXpjtXzfYmtoDhAc3xVd7w4twB4cOF3SWA77/WOhxM
         G150dZtYB3xNEUQaPDAM4eTIuUK5SWLptKr9F9FGDRVyjecMy5znO4u+9R3LfuC8wrfU
         eiETySkwf80Px5OTwzheaYZF4bAH9jeN3jQm4eSLcusnVY9/YrnAQvfN6w5YS9xRReOU
         qOWfL1um9/SQ3Kp6IrufFM5KYiCwvl5Khq4SHIrTXFLob0k4Yr42F2ny1utz+Gvg5+tc
         dLnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCO++fWKYyNxF2GbrEXzMFjFJ88rAEFds4ObJMjuggfW1SM0OcCUKEXvda9Lmg4BteQSekrtYH/AnXQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGPMYZDbmPVznb5F5KVYYEslUHkVkb3xeUd1fbMq471WG01M5A
	fdYkcSVgnMP5WkHOf7jnesCc8jPV68ObghUuAv4KWt0Tm8vBN7ProSmC7gxD+BJWfo1806k=
X-Google-Smtp-Source: AGHT+IFrXzaetGUAe+PmZoXe7bpi2F9Ja9fYIYo6kVRm/kL2GR7CSdjt1a7AGE7QuPTp7+nmhzcSLw==
X-Received: by 2002:a05:6871:72b:b0:260:eb3a:1be with SMTP id 586e51a60fabf-29051db9bdcmr34104242fac.34.1730879897165;
        Tue, 05 Nov 2024 23:58:17 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:100::2b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc20f494sm11369627b3a.93.2024.11.05.23.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 23:58:16 -0800 (PST)
Message-ID: <9dfb250c-d8a1-4536-8658-48b3a2585abd@gmail.com>
Date: Wed, 6 Nov 2024 15:58:10 +0800
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
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <846b4f2a-602e-431e-affc-0e995db5eee5@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_235819_353848_B0DF1D4A 
X-CRM114-Status: GOOD (  21.31  )
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


On 2024/11/2 11:48, Samuel Holland wrote:
> Hi Troy,
> 
> On 2024-10-28 12:32 AM, Troy Mitchell wrote:
>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>> and supports FIFO transmission.
>>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> ---
>>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> new file mode 100644
>> index 000000000000..57af66f494e7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: I2C controller embedded in SpacemiT's K1 SoC
>> +
>> +maintainers:
>> +  - Troy Mitchell <troymitchell988@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-i2c
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
> 
> Looking at the K1 user manual (9.1.4.77 RCPU I2C0 CLOCK RESET CONTROL
> REGISTER(RCPU_I2C0_CLK_RST)), I see two clocks (pclk, fclk) and a reset, which
> looks to be standard across the peripherals in this SoC. Please be sure that the
> binding covers all resources needed to use this peripheral.RCPU stands for Real-time CPU, which is typically used for low power consumption
applications.
We should be using the APBC_TWSIx_CLK_RST register, but it's not listed in the
user manual. However, you can find this register referenced in the K1 clock patch:
https://lore.kernel.org/all/SEYPR01MB4221AA2CA9C91A695FEFA777D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Also, to see how to enable the I2C clock in the device tree (note that the
spacemit,apb_clock property is unused in the driver), check out the example here:
https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi#L1048

> 
>> +
>> +  clock-frequency:
>> +    description:
>> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
>> +      modes are supported by hardware, possible values are 100000 and 400000.
>> +    enum: [100000, 400000]
> 
> This looks wrong. In the manual I see:
> 
> * Supports standard-mode operation up to 100 Kbps
> * Supports fast-mode operation up to 400Kbps
> * Supports high-speed mode (HS mode) slave operation up to 3.4Mbps(High-speed
> I2C only)
> * Supports high-speed mode (HS mode) master operation up to 3.3 Mbps (High-speed
> I2C only)
> 
> So even ignoring HS mode, 100 kHz and 400 kHz are only the maximums, not fixed
> frequencies.
okay. I will fix it in next version.
and should I keep to ignore high-speed mode here?
if not, how about this:

  clock-frequency:
    description:
      Desired I2C bus clock frequency in Hz.
      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
    default: 100000
    minimum: 1
    maximum: 3300000

> 
> Regards,
> Samuel
> 
>> +    default: 100000
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c@d4010800 {
>> +        compatible = "spacemit,k1-i2c";
>> +        reg = <0x0 0xd4010800 0x0 0x38>;
>> +        interrupt-parent = <&plic>;
>> +        interrupts = <36>;
>> +        clocks = <&ccu 90>;
>> +        clock-frequency = <100000>;
>> +    };
>> +
>> +...
> 

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
