Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C341C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Nov 2022 14:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfewxoHgQ4kCxM7DDXsOVZ+ypTxOshJCoDhNkklJoeg=; b=IroIqtzuV20wOS
	kTmvF+rq8XsnwIXxnELfW3UXFzSn8AlaVZW/i1nzv6a1l//4vm3wp+IhHjjpf+SyYZJi0U8K1LSXD
	M3csF13iVA0UH6mLI5qoOcBSahwEksiwrPWbAiOlY8J3I16UTTaiL9OaFaSKt/SFjk0zvofDDFtAm
	KobeifM6BVQMmfYeBY5t4pgdgh5z1d1qJragIaHBQ4noMq3++NKjsJcIubDZbwKH4VbV8G7dCRiUv
	AjuLGFY04FdecFMQpv+GlMkXxKDpNBdcisTuJ2D59cW4JpaDkd83iRo4H+An/az7F99LNBV30Jdjq
	r7vA9D79IliKt5bPGceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwis-00BoaU-E1; Tue, 15 Nov 2022 14:15:34 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouwip-00BoYP-1J
	for linux-riscv@lists.infradead.org; Tue, 15 Nov 2022 14:15:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id l12so24610058lfp.6
        for <linux-riscv@lists.infradead.org>; Tue, 15 Nov 2022 06:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3diX76ypvjrVehA5dTE8kwpwanSYAnaRWdknsRKXCMI=;
        b=tJr375TFIl37vwPQoGTYpzPVXtpwqDq9idV7MjN/dt7uE8ze2e2dhZ3Ww9MMIg+MLw
         K/KAAtD18kxUzCjqKJ3H6vmBteMyoch9V4kxo6xrRapj7lftneiDT/olwD9WMxPvrQqR
         zes/Htl5uwYbJ+FloklFULDlbRHxr7YyCui4CBmDMZ9IoG5f0HfgpNCvqYaIPI2TtLyv
         SLfA+MlZ+pl7TNwKTHqRS0nfNw19iLPH0hWzX6zbY2ycwVLjgfFdsheK/dr411zS2GWx
         j32g0dPKdLf5ah6FBQutWhGS7BIMG6WLDx7X5C5u9I0UyrKkzPg4RbELsHrwJRq1YkwQ
         Sniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3diX76ypvjrVehA5dTE8kwpwanSYAnaRWdknsRKXCMI=;
        b=kc2mkEAOpotJaDnDDRWN82olQLq/KO4ywko9+G/lTs57T1eDT88BZWg1BJ1cUEt802
         HrxMZv7+9yNKI3vTYUcPudyo0rf3UrUAodIJi3hfn73ppG9CtoOXhfwr8VV/XgwuCb+f
         9PbuBklnTgJFbmGdDa4pyyejJbv/PcjcQO8hCwx0fKf0dOIrxww9hTRGVTaW4l4fAZs1
         oyRUxLn2jABRUk8ie7y43Vfy8DD48NR2IjHeg/8laqv1jhEsQMDEvtqtxLce0Z2QRwP0
         S+AJtQlCRGasCFIMssCE6VeE5VTIGJDhQ7ZFbg0/Xr1yfJT2eXsOEnjMhAubtxAAtRnf
         ILdQ==
X-Gm-Message-State: ANoB5pnsFgPpAdsrcKD1M+7gMbaBtAExfUg2/QmyIxaj8cKyAuEPJFbm
	PYBAXXJkFR6vS1Gvs/JrdV8iOQQCD44HOptM
X-Google-Smtp-Source: AA0mqf4mE5ZOMrdpLTeTOsuQnfibZuAC5L5TXWqQTyBRIOuSzsJ9KF97xlQp/3VxgdvlGpTphSVE2A==
X-Received: by 2002:a05:6512:4cd:b0:4b0:2da9:55d0 with SMTP id w13-20020a05651204cd00b004b02da955d0mr5347753lfq.187.1668521727232;
        Tue, 15 Nov 2022 06:15:27 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o20-20020ac25e34000000b004b40c2fccfdsm2226053lfg.59.2022.11.15.06.15.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 06:15:26 -0800 (PST)
Message-ID: <2505fcf3-6c0c-b5f2-6400-bea9a1f7a70b@linaro.org>
Date: Tue, 15 Nov 2022 15:15:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller
 bindings
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com>
 <9be58cb4-4ee8-a6e0-7a0a-f2f581e394d3@linaro.org>
 <CAK9=C2X55CG6tjjiTPrecnnZZiwTOS1BSH3UTPa-fLBm38WdLA@mail.gmail.com>
 <3f469c79-fc4e-9c29-9c47-6dd8e28484a5@linaro.org>
 <CAK9=C2VEZhxgqEDxxKRyvs7NdeRvPzVH=Yy_c_t-tLWhCt3wqA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK9=C2VEZhxgqEDxxKRyvs7NdeRvPzVH=Yy_c_t-tLWhCt3wqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_061531_138536_34699252 
X-CRM114-Status: GOOD (  14.91  )
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

On 14/11/2022 16:04, Anup Patel wrote:
> On Mon, Nov 14, 2022 at 5:52 PM Krzysztof Kozlowski

>>>>> +  riscv,slow-ipi:
>>>>> +    type: boolean
>>>>> +    description:
>>>>> +      The presence of this property implies that software interrupts (i.e.
>>>>> +      IPIs) using IMSIC software injected MSIs is slower compared to other
>>>>> +      software interrupt mechanisms (such as SBI IPI) on the underlying
>>>>> +      RISC-V platform.
>>>>
>>>> Is this a property of software or hardware?
>>>
>>> This is a property of hardware (or implementation) because IPIs
>>> in IMSIC are software injected MSIs so if IMSIC is trap-n-emulated
>>> by a hypervisor then all writes to MSI register will trap to hypervisor
>>> in which case IPI injection via IMSIC is slow.
>>>
>>> The presence of "riscv,slow-ipi" DT property provides a hint to
>>> driver that using IPIs through IMSIC is slow on this platform so
>>> if there are other IPI mechanisms (such as SBI IPI calls) then
>>> OS should prefer those mechanisms.
>>
>> If this is specific to implementation, why it is not included already in
>> the compatible?
>>
>> The name is anyway too vague. What is "slow"? Describe real
>> characteristics of hardware, e.g. trapped via hypervisor.
> 
> Okay, how about renaming it to "riscv,trap-n-emulated" ?

Sounds ok.

> 
> Alternately, we can add "riscv,soft-imsics" as an implementation
> specific compatible string which hypervisors can use to describe
> trap-n-emulated IMSICs. This "riscv,soft-imsics" can also replace
> "vendor,chip-imsics" dummy string ?

soft-imsics would work only if it is a real device. My question was
rather whether this is something configurable or fixed in given
implementation.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
