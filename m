Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87030D59F7C
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 00:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tj0zv5Qs/Sq90j8NhwO5yrrHiBctCJTPV+EBvctXLDc=; b=N9xfercVpB32rV
	fmTfxjwHVqVCR2TF08Qc3/ySRzljSF3pbTQubT9sOC4v5Qb10OdTpMpl7vkZriE3iVL2tDikmoBAC
	sZWV6waSgu51ARSLJD3K9VO+tXv9LEArqzeZUwzEXPeFsCktfnWhmltilptFhgtJuSQo4XZqVAyFo
	Jw3pzds9BfsYpfGLpiaUrvaKvpX0RFoseF5rhbl/RhgaPmZYq6IuAtrvIWUtL8n8zGvnxAwPELqbB
	g9389inOyZ6vFI8pPMqm4/XmbxXrrDgYM2j4xLKEKyEEisjO5peWR4/XheOdWoNjjzmVM20xJDcvn
	Af9B1n9ZYr3fziQ+sJ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8qQ3-00000005ABT-2zxx;
	Thu, 07 Nov 2024 00:30:39 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8qPP-00000005A5F-3qui
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 00:30:38 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-82cd93a6617so14742839f.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730939398; x=1731544198; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3Z19IHRqfxS578Ys483rX+/hvz8ULIan1ekFWOQaVI=;
        b=C4aGoSWbsevqsq1cdwiRbHal8zKrkYwVPi4m88qd6Yz16WVnD2/LXtOr+ZlConByKK
         OV7MyuADyMHS9lYQPqn7YPtIaAJ6bzEGu+y0W4pp3N9bp8imXLfSxuwMSU/ijaW6dsJi
         X+boKtxrWU3djnZF7XWEUnf6NlQA83teEWDEsR7DDqnmz3oiEILd9F3gtrYhb2FsKcrD
         4y/E1nN+Yc/wYJUrW5GimH/uY5X6L2ruYz+PKDo41c0RdnwTcHyySdXspoqt8OzX3jKJ
         1KkpJiytyTy82+Q9jJis6XVPBC4CekBaCN6E+z3lPjNjAbDDAkrqDPpVzYtSTz8hpx3r
         un1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730939398; x=1731544198;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3Z19IHRqfxS578Ys483rX+/hvz8ULIan1ekFWOQaVI=;
        b=FTxzTMteMyz+AjR66sqGzjHEewVYK4mbFn5xb7ekLJVizGzIaUJMkngMYLOZ9c0pbh
         /5qD/XhGQkdiemDVFuw9zf7+/gjQ+pZUgVsiZsUL19rMwV51wk8cJGK1z6SlklyFeTZp
         OQQ7mkQG2avOsddIHQ0+Vc4+m2CthXDIaOub5vnoEFj26BghGYoDYvhHMb2yt9cK4xnO
         NNf3tgVifXYf2oRxm5k3CqgRvWI6JrvD6O/kINHsRZELeFEXHVNTQPqSe+mWARNofTts
         ldX0a9MeXM3mPwCFYKFV2U8gJhDNHX/n+USKgye2R1VOduInrKCZHmuXCDGPQzoAOho+
         QCNg==
X-Forwarded-Encrypted: i=1; AJvYcCUdQ+TxqAHFxXyyaOeidIBYi6nZKm7w90DpxFfNrlPYvi3tV7/TMO2O7M2cMgNTzW/nf9ZvPMZjruYxLA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9mPLto2dF2/b7Rq8uLVb+3cjKyO3n0lsDKb/b0h5PfxOOATd8
	yM2u7dfAaQPjT7FJB2WaPeATTy3FLlGAgigifEYYf9tC4r0qZhNOg7TlhFgru8xaQEyHw8CwP1n
	t
X-Google-Smtp-Source: AGHT+IEHbvezWSNRUJM0X1HoonUf45bTn5xrbNazcCjs5Xe/xtZ22FiANoIgp4EDA+vYIihd3QT+SA==
X-Received: by 2002:a05:6602:3413:b0:83a:b235:2d74 with SMTP id ca18e2360f4ac-83b1c40d531mr4199202539f.7.1730939398525;
        Wed, 06 Nov 2024 16:29:58 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de5f8d0ba8sm64230173.110.2024.11.06.16.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 16:29:58 -0800 (PST)
Message-ID: <a9f59ffb-23e9-4c83-8d44-4c766e32b3bf@sifive.com>
Date: Wed, 6 Nov 2024 18:29:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <846b4f2a-602e-431e-affc-0e995db5eee5@sifive.com>
 <9dfb250c-d8a1-4536-8658-48b3a2585abd@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <9dfb250c-d8a1-4536-8658-48b3a2585abd@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_163000_039060_6E639BA0 
X-CRM114-Status: GOOD (  23.92  )
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

Hi Troy,

On 2024-11-06 1:58 AM, Troy Mitchell wrote:
> On 2024/11/2 11:48, Samuel Holland wrote:
>> On 2024-10-28 12:32 AM, Troy Mitchell wrote:
>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>> and supports FIFO transmission.
>>>
>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>> ---
>>>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>>>  1 file changed, 51 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>> new file mode 100644
>>> index 000000000000..57af66f494e7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>> @@ -0,0 +1,51 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: I2C controller embedded in SpacemiT's K1 SoC
>>> +
>>> +maintainers:
>>> +  - Troy Mitchell <troymitchell988@gmail.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: spacemit,k1-i2c
>>> +
>>> +  reg:
>>> +    maxItems: 2
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>
>> Looking at the K1 user manual (9.1.4.77 RCPU I2C0 CLOCK RESET CONTROL
>> REGISTER(RCPU_I2C0_CLK_RST)), I see two clocks (pclk, fclk) and a reset, which
>> looks to be standard across the peripherals in this SoC. Please be sure that the
>> binding covers all resources needed to use this peripheral.
>
> RCPU stands for Real-time CPU, which is typically used for low power consumption
> applications.
> We should be using the APBC_TWSIx_CLK_RST register, but it's not listed in the
> user manual. However, you can find this register referenced in the K1 clock patch:
> https://lore.kernel.org/all/SEYPR01MB4221AA2CA9C91A695FEFA777D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Ah, well that driver is missing most of the bus clocks. For example, from a
quick comparison with the manual, the driver includes sdh_axi_aclk, but misses
all of the PWM APB clocks at APBC_PWMx_CLK_RST bit 0.

If the clock gate exists in the hardware, even if it is enabled by default, it
needs to be modeled in the devicetree.

> Also, to see how to enable the I2C clock in the device tree (note that the
> spacemit,apb_clock property is unused in the driver), check out the example here:
> https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi#L1048

The devicetree describes the hardware, irrespective of which features the driver
may or may not use.

>>> +
>>> +  clock-frequency:
>>> +    description:
>>> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
>>> +      modes are supported by hardware, possible values are 100000 and 400000.
>>> +    enum: [100000, 400000]
>>
>> This looks wrong. In the manual I see:
>>
>> * Supports standard-mode operation up to 100 Kbps
>> * Supports fast-mode operation up to 400Kbps
>> * Supports high-speed mode (HS mode) slave operation up to 3.4Mbps(High-speed
>> I2C only)
>> * Supports high-speed mode (HS mode) master operation up to 3.3 Mbps (High-speed
>> I2C only)
>>
>> So even ignoring HS mode, 100 kHz and 400 kHz are only the maximums, not fixed
>> frequencies.
> okay. I will fix it in next version.
> and should I keep to ignore high-speed mode here?
> if not, how about this:
> 
>   clock-frequency:
>     description:
>       Desired I2C bus clock frequency in Hz.
>       K1 supports standard, fast, high-speed modes, from 1 to 3300000.
>     default: 100000
>     minimum: 1
>     maximum: 3300000

I don't know if high-speed mode should be included, since it requires some extra
negotiation to use. Assuming it should be, that looks reasonable.

Regards,
Samuel

>>
>> Regards,
>> Samuel
>>
>>> +    default: 100000
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    i2c@d4010800 {
>>> +        compatible = "spacemit,k1-i2c";
>>> +        reg = <0x0 0xd4010800 0x0 0x38>;
>>> +        interrupt-parent = <&plic>;
>>> +        interrupts = <36>;
>>> +        clocks = <&ccu 90>;
>>> +        clock-frequency = <100000>;
>>> +    };
>>> +
>>> +...
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
