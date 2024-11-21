Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C5FD75BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Nov 2024 04:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h6Anr/bY8CdOpMtEPtU6hehGzu2f3HWRgy6bULz0F3U=; b=RtlvE0Mw23Xjom
	pGGp6+RKFNJ+nQtESqsqYOBOl8SYmMw8Bai6wLSlDjFpo0WHpe87qZoJjnmaTmxm/VYxeJOVf3czU
	kEZLuHEt4cJgW6Rhn1lp2euIxADr6z/2Qcw6rpg3dUyoIDAv7T34aciqYE72HuIcsi9ksxb+m1LW9
	3+2PzeA0GZ7I8lCkyFqB/i90RnRdj5rwX+ptlutl9ngAWAXHv5CmAhBr+RHjJNiAFkz4TFV56UeVr
	KflOQu7VkHnnn3yo28pUGP2nHRMUYks3XRRwoAB/bI780Fb6cSgMFU/T9c2BG4cPTpEIGY3iBrhN5
	rb4m0nasZIMmaQrd4T7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyYH-0000000GkvR-0cic;
	Thu, 21 Nov 2024 04:12:21 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDyYE-0000000Gkus-1Y8T
	for linux-riscv@lists.infradead.org;
	Thu, 21 Nov 2024 04:12:19 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-7f8095a200eso1259950a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Nov 2024 20:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732162337; x=1732767137; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exKez1cVDbnXT6rl2hY31i8NAVz7pgT+MF0bJD/FrI8=;
        b=S9m+8nSvffTWR5IbAIDeLBLgtOdgvKGHh2oF5nfQ21su+4SU2Fj72tjlZ4/e7ptQnc
         ZSnvSOkikWC4EEXzxuI6s87lLKUGelU1xe8IPzZ4pxvzhRSR/7aRy38GPTJa2mZcQBSx
         8ty/ebKb/21RMUjWoVVHm4kvPKS4I25Y/o3DaqwvI21td1zJONiHuRCNZbKf1enNOtea
         YH6wNK2gvNAetVhwvFregvueMp6WSrElCXGOKPQFzbS7tq0JaZ8x0NdmDdxCyZxgX/4x
         Srl1LdDogU+/b2UNBh234IziS0RRUZySG2qF5LRNTy4m0KkV5DvYdCMxFtWcSxukLxlC
         5Rug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162337; x=1732767137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exKez1cVDbnXT6rl2hY31i8NAVz7pgT+MF0bJD/FrI8=;
        b=TUbMgAZvGPA0WM/mMvxqzcWKzWy/V5BEz07prbyau37ZCrzTmblOQgC9gkzYS3zVkA
         l8cLAyfU+FxxvxQKn54NXtffL25sZvCSE6MLTgYWY17gz41Z88Mnu6GkBV9RlhmoVwrd
         RQqP8X7LnDNxXTeK1CjoGPsq5TCeH3EEmsFF9/Vw1FDIODUEFc1xVC+Yr9rxdHrjenKh
         57MkHOv/AAyBNW7uaj3pD4odEwr71oEjFfF9gHUS5iOlSynsuZ6yaMkYVd8soz2pMDsr
         +rvDdGqFYYtc6guUfec4M2A9ZqSiWET9DnXhiVQxz37qX/Kq8xkyXJF08eA8bEfeKEFk
         fJLA==
X-Forwarded-Encrypted: i=1; AJvYcCXgu+VkShaBeZ8jKiqxIPbwJ6FccT+nJq9VNNo4BMb39KnIXTwJ4ehbRm9klo/Ctzv8WN2gFbE0C6tiQw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzxQefDRmjtLANew/tEmmIk2xEuj/a1I4ZTYLE5et8H8tVFvfum
	CD6wkPTP12Ggzq727uCCM1782zOmwu6s69RvmpX2LQHcSMLnFaYM
X-Google-Smtp-Source: AGHT+IFbBC3R8kywIfLzFXI+0EAqpAjQMEKGdZuXjprw2fRIlUUyKvdgCICLjlTr54Bq/GOwyWWm3g==
X-Received: by 2002:a05:6a21:998f:b0:1d9:dc8:b80d with SMTP id adf61e73a8af0-1dfacc36566mr3164471637.20.1732162337164;
        Wed, 20 Nov 2024 20:12:17 -0800 (PST)
Received: from [127.0.0.1] ([2407:cdc0:8010::ec])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64ed022sm280846a12.20.2024.11.20.20.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 20:12:16 -0800 (PST)
Message-ID: <9a1e20a0-6a79-4bb3-990c-a1c6dfb22f1c@gmail.com>
Date: Thu, 21 Nov 2024 12:12:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor@kernel.org>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
 <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>
 <20241112-aged-trailing-cffda6af0944@spud> <20241114070601-GYA1001363@gentoo>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20241114070601-GYA1001363@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_201218_420228_C8BA0509 
X-CRM114-Status: GOOD (  14.85  )
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

Hi, Yixun. Thanks for ur review.

On 2024/11/14 15:06, Yixun Lan wrote:
> On 18:03 Tue 12 Nov     , Conor Dooley wrote:
>> On Tue, Nov 12, 2024 at 11:07:39AM +0800, Troy Mitchell wrote:
>>> From: Troy Mitchell <troymitchell988@gmail.com>
>>>
>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>> and supports FIFO transmission.
>>>
>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>> ---
>>>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 52 ++++++++++++++++++++++
>>>  1 file changed, 52 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>> new file mode 100644
>>> index 000000000000..e8cce360bf03
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>> @@ -0,0 +1,52 @@
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
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-frequency:
>>> +    description:
>>> +      Desired I2C bus clock frequency in Hz.
>>> +      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
> while we are here, I'd suggest rephrase the sentence above to align it better with the doc
> 
> K1 support three different modes which running different frequencies
> standard speed mode: up to 100000 (100Hz)
> fast speed mode    : up to 400000 (400Hz)
> high speed mode    : up to 3300000 (3.3Mhz)>
>>> +    default: 100000
>>> +    minimum: 1
I will modify `description` and drop `minimum` in next version
>>> +    maximum: 3300000
>>
>> It's sufficient to define just default and max btw, the min is set in
>> i2c-controller.yaml (in dt-schema itself). Don't respin for that alone.
> +1, the minimum settings isn't really useful, clearly not apply in the practical case
> 
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
>>> +        reg = <0xd4010800 0x38>;
>>> +        interrupt-parent = <&plic>;
>>> +        interrupts = <36>;
>>> +        clocks = <&ccu 90>;
>>> +        clock-frequency = <100000>;
>>> +    };
>>> +
>>> +...
>>>
>>> -- 
>>> 2.34.1
>>>
> 
> 
> 

-- 
Troy Mitchell

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
