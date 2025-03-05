Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 034D1C19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 03:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AqXCdlIXgqblbqvFfMZHtf6Jgt29ijlUXSYwJcvtE4=; b=1tO43rFO4cyrfd
	esf0pdeYv/+RYjMzHC43fac/0ldae7sD0NPKVCAacUassVP8midhHZQ4oR1ewbquM/Pnd57GYgnjm
	oyZLAX6IHIU4c462TsWrVoBrbfh5C3LO66Gs8492ZfILOPCEoZLfrRvwCU6Zmnbb02UhIrPyUunIX
	kMghvL9h6kcp3SDZTyQeGnjbeqqMwmvCWwhMmM9XSEme+iYeEiOy1LISo8Bu3KehphySlNpPp48FI
	2mmrp/+AtnmY0ZtzKRRcr9IKCtMPsSSvRtmr/MWl4/VsEDTilp5VPgPvQM56BCFx/o/fBZAH1Qfxu
	afpp6CpkE7IXvpFfYfCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfDe-00000006rxN-0rh1;
	Wed, 05 Mar 2025 03:14:50 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpeEC-00000006mBU-0Ebb
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 02:11:21 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-85aec8c95c4so154033239f.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 18:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1741140678; x=1741745478; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IPu6iJQJZK/agzAsjhgRU4s3OBRGcgTM6nYh8CRHfM=;
        b=cqI02PxCTMR/ANYeDG18VcviU+Tawj28Oigs0zSMfDJTZMG1/Ls9Q/S2LnGtPkGE+G
         knaxu9nzZcaWAQe6KPP2INaKszZ9wlgT+fH+WQlfHiosNL9w32EprtGiiGs9DC8hLx2W
         AFc1LbCmNH+y6xNnT4/xrPERHo0hB6ZNiyxzDF9b1Dt43A+DubsWuzLKRwxX8rg9eeD/
         Fc5ju1LT+0xmJ0cqMVcVBH1JTR2185WVTeMmyy2bRhMBEGjLoO12/RWSnAmQPXV/RqTG
         0v/A4t2zs7cqonxELTF445y/gPuTUeXMuWTYeVQ33JHkwrlOqSeiekLQZ9urlMYfuvNg
         H5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741140678; x=1741745478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IPu6iJQJZK/agzAsjhgRU4s3OBRGcgTM6nYh8CRHfM=;
        b=iI1HmITwF/cH/WglwlUPGS5QtmoHCkEHw+snPHsmBgHAWIEVH6w2yqcits1j8+Lf5D
         ylf3y4ERENh5IjqVo5gG+b4Hk9uoFEHbNSrSvTpehGX4q6P7spzoxYGZOrj4kGtHa+HB
         95NJyacZVuFp9BASRF7K2ZSrGBHVQKAJCDmZfKpKMfqmgGimcqiEMQVh9/OD2w2Nmaep
         A1y3N7uFmzYqRwRtfIK3ttg3CvrXbNnYjDRjzcNiJ9+7E7pEeKxpF1D65QrjGQdiewf4
         18dPQQKZwpryi8lQUPH8qZFfSEurOUh64CL27IttmQias3JHmN5qpKNyDh+M+lUm+rP3
         fn6w==
X-Forwarded-Encrypted: i=1; AJvYcCXM6WO3L2pIStlRQdZFisnN5eWZ6N8wFu64dOjI1Y9UXA8KOcalWNo3Njz/hgtR2oDGQboCIhdY4U+zgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiZnPlD2bOwjrWdxQUTmk+jk7ZalToNAy6cwTsoNmKQNuhwfjJ
	LrybZ6DctwGOeJX27mIIfpcbJ3EvX4M7pp0O/kcE18cWONrZtii7ijfszSrd57g=
X-Gm-Gg: ASbGncsCiHgRiTTMIczvrYfEMYn7qmfeX32m2gB4oz2nrzIQ55UweG0a8xgXlB4a7qP
	wFaBHUEmkqQjubIVmKT4y+qBjB30Kf4l8tXAFzBRXjmkdWUDydMyFxlluE2cKSMJmxUsUxxyRFm
	sOcgwWEaCgfj8b2UleVWur8KZAZzcYjOR2qbtrHx+rsuIoDS0qIxljNpHOfPEqtxT04WtF8nEVw
	MfcuK3HBYamnjnSH/xEwY30Exb6M2t+B6AlwV59rAmnHbnkxADoDU3Q2eXZam0nB5VuKbXTDpPm
	j4U+EtMuXkYBvgE2a1gMELaHkdcz4XlO9YRTATQ=
X-Google-Smtp-Source: AGHT+IG15YhzjdJR2FqfaMtHfCYjpuXOjr2GugugmrdEVDdT7gY0ODZ6/4j012jh/Swg9m4eJ6IseA==
X-Received: by 2002:a05:6602:388c:b0:85a:fd37:1c6d with SMTP id ca18e2360f4ac-85aff8abd43mr226317839f.6.1741140678617;
        Tue, 04 Mar 2025 18:11:18 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f07cd84f06sm2387028173.67.2025.03.04.18.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 18:11:18 -0800 (PST)
Message-ID: <ab10e069-d9e1-4df7-9454-8b0fc910443d@sifive.com>
Date: Tue, 4 Mar 2025 20:11:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support for
 K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Troy Mitchell <troymitchell988@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
 <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
 <20250303093506-GYA58937@gentoo>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250303093506-GYA58937@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_181120_106632_7CA2B02C 
X-CRM114-Status: GOOD (  15.73  )
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

On 2025-03-03 3:35 AM, Yixun Lan wrote:
> On 13:30 Mon 03 Mar     , Troy Mitchell wrote:
>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>> and supports FIFO transmission.
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>> Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
>> ---
>>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 59 ++++++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..db49f1f473e6f166f534b276c86b3951d86341c3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> @@ -0,0 +1,59 @@
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
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
> ..
>> +  clocks:
>> +    minItems: 2
>> +    maxItems: 2
>> +
>> +  clock-names:
>> +    minItems: 2
>> +    maxItems: 2
> I'd suggest to give a brief description and explicit clock name here,
> you can consult marvell,mv64xxx-i2c.yaml for example
> 
>> +
>> +  clock-frequency:
>> +    description: |
>> +      K1 support three different modes which running different frequencies
>> +      standard speed mode: up to 100000 (100Hz)
>> +      fast speed mode    : up to 400000 (400Hz)
>> +      high speed mode    : up to 3300000 (3.3Mhz)
>> +    default: 400000
>> +    maximum: 3300000
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
>> +        reg = <0xd4010800 0x38>;
>> +        interrupt-parent = <&plic>;
>> +        interrupts = <36>;
>> +        clocks = <&ccu 176>, <&ccu 90>;
>> +        clock-names = "apb", "twsi";
> 9.1.4.61 TWSI0 CLOCK RESET CONTROL REGISTER(APBC_TWSI0_CLK_RST)
> https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb#part594
> from above docs, there are two clocks 
> bit[1] - FNCLK, TWSI0 Functional Clock Enable/Disable
> bit[0] - APBCLK, TWSI0 APB Bus Clock Enable/Disable
> 
> I'd suggest to name it according to the functionality, thus 'func', 'bus'
> clock, not its source.. which would make it more system wide consistent

Also in that same register is:

2	RST	RW	0x1	TWSI0 Reset Generation
This field resets both the APB and functional domain.
- 0: No Reset
- 1: Reset

Which means you need a 'resets' property in the binding as well.

Regards,
Samuel

>> +        clock-frequency = <100000>;
>> +    };
>> +
>> +...
>>
>> -- 
>> 2.34.1
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
