Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D4310706DC
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Mar 2026 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9eM+Zhxw92galGjmwIEjtpDXaeQk28x2qwyWqXXTq0=; b=qKD6MeNFKrLv1Y
	lysORBhrNAvNz5ND6OXApfo7PDijbxpePPI8LLfkEUWr7HCYLaLDu+2DbWb005NjltMEFg8XFsEpm
	t8l0rP1/LamaIJVzAr2bk7ZWTq0gXZhJgjIURLKmFOe7xeVmieP4DaL5cr1aOQmMyv6Dkw6spZCGt
	7pCCKlL+xKsO02XR2SGdzkQwclUv577pZw8PUH+buZQuEeodkJXopbKGJN4SOKfWqqj3nQRJVIAL2
	wZ50sezv8qn8bT71W/yNx6iN9Xy70TrN+AL4cqEDnzhq8Ab26oTcq8lRxLjRvdgB1Z4gVVUixcm63
	PWTdIsPp0mXGJrQR+Wmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Pjo-00000001uKC-1awK;
	Sat, 14 Mar 2026 14:13:08 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Pjl-00000001uJr-3xxY
	for linux-riscv@lists.infradead.org;
	Sat, 14 Mar 2026 14:13:07 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so3290245d50.0
        for <linux-riscv@lists.infradead.org>; Sat, 14 Mar 2026 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1773497585; x=1774102385; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kb1CjrStBIIzJ9sGHwsiJsF+p3lIqo/Alx3Y+vVcnNg=;
        b=B+aLoC1G5lO8ICNwiyl/UKTWByqlPa0iMx7/cspfeDfr8j40XVZm1CQClAw7lL33a2
         ZbmXDfI136br4dPtVxHPG8hEEjOPURUZTbPwN0LefKdwFw5wyCmQ+PqcgWWZljn5h6hp
         f2aAdv1PMrYcBSwZBh1AHpBCwaYjqcQCTJIu89c1BW9mhYg0COF5iacfCmuxdce5b9c4
         m/o3b0O7ZeOo6Hf3M3tFeSiv6ksYo+iySSe4MbKWqbvuNCBw0CW/nx1svFHWPup6e1Gw
         CPOlbziHT9A2sZfb3FRLeDQJJneCl6fBV+C5fiSGNdQ+ydDLZEsP3Jsn4D80H6js9hKf
         sChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773497585; x=1774102385;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kb1CjrStBIIzJ9sGHwsiJsF+p3lIqo/Alx3Y+vVcnNg=;
        b=czjMz8nr2nbP6Er7HgzLoI/uTXYVpiXpHDLUlxFbTzxFHSxJco9yI/NyyPbuBs14hB
         jRzrT4Rk1nNjj16J/gYr4SW+AhWBLLLHRIbiILqj9RTL/kKdeDY8f/j4OoMy6oISOjN+
         7JeqgG71+IcXgjCaOij+jTvo9p50+rkDKxQA7MbB8nD0xETZAai7Y8rXv+HumDbnlohF
         OxbvBW/1UWEkSi9PK0F/ALP9GANaLJKStQfYVNBXFvq6t94YUJCftO4ulUGLq3vxwS1P
         XkcrAHTYvNv4ZcwHZtYeg6iFk/mVLHuKIzholnTq5Q7vvzWKtIg3Bp6htMLYMpBbmvOw
         j9tA==
X-Forwarded-Encrypted: i=1; AJvYcCU8ZVbiClH/P1VvrK4pqwRuvhB4T+gvKynaPNz/zIMshD3zzuAx7jka5Wkb8ILM9rMiBbnzYq/3FhwVUw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzDpEGThx4YL/w5n5Zy1IYvsSBzNxK2gAl8hfYW1Vdl+F7uFJv
	jKkrNN/tFoLBFhKBzqWDw0IdMZBRh1ocU/dGpNUvFCtOKl+blFSFF96o+MUdvBK7XSY=
X-Gm-Gg: ATEYQzwtWhpHK010n/yueU8wYGzP/2qk3NbQwf+vse0RlrvOERbEfGTcIW70BTkyoY2
	/bDnALcfnPWDevKXnFNUDlKNfheTyL0zldoMKBB1WwRuyhieoHiS3vvcPRUQuBkN49E3rO9/P8H
	k9lLmaRYhVDotwsTDxwb0Q+9fYzwODLGs8N/6xv9gbyf1rT5TJI1pc8JWlz/dsavKj7BlZljCRE
	CENur0yIavvTZJ1OXonoElsWaEZGH6uxNXxtIoqZYh7Ovw0SA/VbHXmdjDb/cEX13S54n8gwcJ+
	EHyAdKsa39xB3p2e0nFVX7yD7bCnwD9K8AegTLwPf2ZfWnR1cBiIgEO9d2cVRDDkHpgJJ+Qq4B0
	ZXSEucA2g3b924Ec/d8Q2UR+Z/ybqfOJOqnnFi0B3x4weotkJcxAMrKiKVlVfTVydTmKX1YSHw7
	i79ccNfItFVACYCYj4Rla0APAPRZOngDWugAH0ibimhjKTHVoKO8g=
X-Received: by 2002:a53:ee65:0:b0:64d:6193:a752 with SMTP id 956f58d0204a3-64e62fc1f7amr5251930d50.28.1773497584611;
        Sat, 14 Mar 2026 07:13:04 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b39f56sm2709456d50.15.2026.03.14.07.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Mar 2026 07:13:04 -0700 (PDT)
Message-ID: <b885158f-3859-4bfa-96b0-39c274a856cf@sifive.com>
Date: Sat, 14 Mar 2026 09:13:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] riscv: dts: spacemit: k3: add clock tree
To: Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org>
 <20260304-01-dts-uart-full-v1-1-50a0aa53a245@kernel.org>
 <fecadd41-ee3e-4452-bf25-4a70eaeb5f3f@sifive.com>
 <20260314085252-GKB415778@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260314085252-GKB415778@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_071306_032159_EE2096F3 
X-CRM114-Status: GOOD (  18.04  )
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

Hi Yixun,

On 2026-03-14 3:52 AM, Yixun Lan wrote:
> On 20:44 Fri 13 Mar     , Samuel Holland wrote:
>> On 2026-03-04 1:36 AM, Yixun Lan wrote:
>>> Add clock support to SpacemiT K3 SoC, the clock tree consist of several
>>> blocks which are APBC, APMU, DCIU, MPUM.
>>>
>>> Signed-off-by: Yixun Lan <dlan@kernel.org>
>>> ---
>>>  arch/riscv/boot/dts/spacemit/k3.dtsi | 75 ++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 75 insertions(+)
>>>
>>> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> index b69cf81b5d55..e3d7f3102fd5 100644
>>> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
>>> @@ -4,6 +4,7 @@
>>>   * Copyright (c) 2026 Guodong Xu <guodong@riscstar.com>
>>>   */
>>>  
>>> +#include <dt-bindings/clock/spacemit,k3-clocks.h>
>>>  #include <dt-bindings/interrupt-controller/irq.h>
>>>  
>>>  /dts-v1/;
>>> @@ -398,6 +399,36 @@ core3 {
>>>  		};
>>>  	};
>>>  
>>> +	clocks {
>>> +		vctcxo_1m: clock-1m {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <1000000>;
>>> +			clock-output-names = "vctcxo_1m";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		vctcxo_24m: clock-24m {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <24000000>;
>>> +			clock-output-names = "vctcxo_24m";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		vctcxo_3m: clock-3m {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <3000000>;
>>> +			clock-output-names = "vctcxo_3m";
>>> +			#clock-cells = <0>;
>>> +		};
>>> +
>>> +		osc_32k: clock-32k {
>>> +			compatible = "fixed-clock";
>>> +			clock-frequency = <32000>;
>>> +			clock-output-names = "osc_32k";
>>> +			#clock-cells = <0>;
>>> +		};
>>
>> Are these clocks provided by SoC or by the board? Usually there's a crystal
>> external to the SoC that provides the root of the clock tree. If these clocks
>> are provided by the board, they (or at least the clock-frequency property)
>> should be in the board DT, not the SoC dtsi.
>>
> It's true, as a quick check, osc_32k provided by P1 PMU, while vctcxo_24m is
> a crystal, vctcxo_1m and vctcxo_3m are also marked as external in the clock
> tree, but I would confirm them later..

In that case, osc_32k should ideally be a reference to the P1 PMU clock
provider, not a fixed-clock. But this may be infeasible if it creates dependency
loops (PMU depends on I2C, I2C depends on clocks, clocks depend on PMU).

> I agree to move them out of SoC dtsi file - k3.dtsi, while due to all boards share
> the same clock topology, what if I creating a k3-clock.dtsi and making it shared 
> between all board dts file? to avoid massive DTS duplication

Yes, it is common practice to create a .dtsi file for things shared among
several boards for a SoC (for example if they are all based on a reference
platform). You may want to name it something more generic if more than just
clocks can be shared (like k3-common.dtsi, compare jh7110-common.dtsi).

>> Also, the /clocks node is out of order.
>>
> I will move osc_32k before vtccxo_1m, assuming it's the problem you
> refered to?

I mean that /clocks sorts alphabetically before /cpus. Your ordering of the
fixed-clocks nodes themselves is fine.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
