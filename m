Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7100FC00140
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 08:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UUHK4zqEdOpT74MnErVC0BQmeF5Z+PajdM4XjV9C1PY=; b=MD6fHtQsN3kgqe
	J8kjR5oho91c4c7L0zSI92L1u0VunPQrI14/W+7zVPLALXgJlShCQ/MuDQJsedgC4HOdA/GjWWXUM
	vPL27T0Il9tVk2aVB94i86HDbPubqSeOZCFIztTH5sS2h/gEjj9uyutr9rGwnpIl+NX3tArX7Jhdx
	4cvKQKRVVIkAGdTzEu6KX19K3mwsiQ8DOKGfJGHX6v/l3Kd3We3BzR1ahOT0BOyUXiGP0V+ZqxhJh
	N3Uu80Bj06Oe+PcuThplOV/TvsvCIS2TuPj/a9Uvl0PkMEuhoe/TfP0hHyyV6qWeE1xtqNOa/VZmr
	CLZAI6NWYpJ1K4MuvsKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaia-000hj7-Qp; Thu, 18 Aug 2022 08:17:32 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOaiX-000hag-Fa
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 08:17:31 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1236740AA5
	for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 08:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1660810645;
	bh=nAL3OU0N2XYH48ZM4NQOXy6U04pGy/lEK4T1iote3O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=tmryZ2ymKo/+PAKEX79g5p+rRyVWkTT3XEpi5LV9uT3aYCN+los4tmU9TUcaDdJS1
	 mFxbIuq0QngfmXCw2txELgh74aVy2xZhojzAUdX+alJgdEaeGE1G94MvUYgZZ3RB+N
	 1vd3N4Y4SOB/QCd8wKq8hy9aCNZYT6dqT1vpHehbTqP5dlqgDxqyGZtXKUEZD4ZlQ7
	 upc5dzF1144Kr5WXnnxPDQvMuOkFP3i8gylh0Dph1drCWNG0KpBvxKGzix/nrfOHhg
	 eYEkwJqu7ryZ+rda++r1NzF8bQrtWzkbJC86RvZp3uGwJuOnPeqW1YyPNUQ4VeAR8v
	 moSzj7kgXPf0A==
Received: by mail-wm1-f70.google.com with SMTP id x16-20020a1c7c10000000b003a5cefa5578so336691wmc.7
        for <linux-riscv@lists.infradead.org>; Thu, 18 Aug 2022 01:17:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=nAL3OU0N2XYH48ZM4NQOXy6U04pGy/lEK4T1iote3O4=;
        b=wX+jbLokdwapxkTWUcgcVOCTYn6iAPzR0pyJ1dLLwczmd69bxFg+juZKB90k0uDugs
         FJ7XzRFCuA94GRsnP/xfQdOwdry7tKBGsMD3bOxKOQO+aZ03XXedmVtGJmB6vJpMMfrJ
         u+rHt85WW2gXKcoNwhfBPwsEF6+V00+yR5RMcEXCnaNM7J95plw31Mwb+z+BVgSA4eGv
         QhWrch/amKLO+GgAEGhqgiBDYC4tn5bqHyJY8m+v6sFwxgsHzSEhPyG5hPn36/YwEYiq
         9BAP+GWEgD+mIkq6lSU3rff7cJUV8ZoyTv7Wptb+7wmn8qBruMe2LgjUn5BgmHKE31DX
         R8nw==
X-Gm-Message-State: ACgBeo3M8XlZxxklQiIPS+6rjVJMTr08M7X3O+5Q7ZOj21kcPSW3O+Km
	yonlqnUWvlyQyg2z101LwkUguilFjwDUS1Y8JHJkw0i2IEXxvuTLemKK5CEz7wtC3qjzx1XDTrO
	xdcqZ77IxFq+1nmwfHNGw/iTbWKH2BPTUvgLZ6h3cxf52JQ==
X-Received: by 2002:a05:6000:1ac7:b0:225:1cb4:d443 with SMTP id i7-20020a0560001ac700b002251cb4d443mr894331wry.501.1660810644628;
        Thu, 18 Aug 2022 01:17:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7UtRK49PUfX6BblfH4ht1MDEm3+bFgKVoLlKnQBnqzYe1+RlQezcyltukJ4BVVP00eEq4X0g==
X-Received: by 2002:a05:6000:1ac7:b0:225:1cb4:d443 with SMTP id i7-20020a0560001ac700b002251cb4d443mr894310wry.501.1660810644376;
        Thu, 18 Aug 2022 01:17:24 -0700 (PDT)
Received: from [192.168.123.67] (ip-084-118-157-002.um23.pools.vodafone-ip.de. [84.118.157.2])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c359600b003a35516ccc3sm1415601wmq.26.2022.08.18.01.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 01:17:23 -0700 (PDT)
Message-ID: <00500974-474d-3559-c141-3cc758bc0423@canonical.com>
Date: Thu, 18 Aug 2022 10:17:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Content-Language: en-US
To: Daire.McNamara@microchip.com
Cc: linux-riscv@lists.infradead.org, emil.renner.berthing@canonical.com,
 devicetree@vger.kernel.org, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, geert@linux-m68k.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, atishp@rivosinc.com,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 Conor.Dooley@microchip.com
References: <20220817132521.3159388-1-heinrich.schuchardt@canonical.com>
 <32a72954-c692-6c5d-b07b-266d426c3cb4@microchip.com>
 <ccb5792bfe467dcc5046b7cb4de3a6af14cd3d5a.camel@microchip.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <ccb5792bfe467dcc5046b7cb4de3a6af14cd3d5a.camel@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_011729_878892_B340F274 
X-CRM114-Status: GOOD (  32.97  )
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

On 8/18/22 09:03, Daire.McNamara@microchip.com wrote:
> On Wed, 2022-08-17 at 18:04 +0000, Conor Dooley - M52691 wrote:
>> Hey Heinrich,
>> Interesting CC list you got there! Surprised the mailmap didn't sort
>> out Atish & Krzysztof's addresses, but I think I've fixed them up.
>>   I see Daire isn't there either so +CC him too.
>>
>> On 17/08/2022 14:25, Heinrich Schuchardt wrote:
>>> EXTERNAL EMAIL: Do not click links or open attachments unless you
>>> know the content is safe
>>>
>>> The "PolarFire SoC MSS Technical Reference Manual" documents the
>>> following PLIC interrupts:
>>>
>>> 1 - L2 Cache Controller Signals when a metadata correction event
>>> occurs
>>> 2 - L2 Cache Controller Signals when an uncorrectable metadata
>>> event occurs
>>> 3 - L2 Cache Controller Signals when a data correction event occurs
>>> 4 - L2 Cache Controller Signals when an uncorrectable data event
>>> occurs
>>>
>>> This differs from the SiFive FU540 which only has three L2 cache
>>> related
>>> interrupts.
>>>
>>> The sequence in the device tree is defined by an enum:
> in drivers/soc/sifive/sifive_l2_cache.c
>>>
>>>      enum {
>>>              DIR_CORR = 0,
>>>              DATA_CORR,
>>>              DATA_UNCORR,
>>>              DIR_UNCORR,
>>>      };
>>
>> Nit: more accurately by the dt-binding:
>>    interrupts:
>>      minItems: 3
>>      items:
>>        - description: DirError interrupt
>>        - description: DataError interrupt
>>        - description: DataFail interrupt
>>        - description: DirFail interrupt
>>
>> I do find the names in the enum to be a bit more understandable
>> however,
>> and ditto for the descriptions in our TRM... Maybe I should put that
>> on
>> my todo list of cleanups :)
>>
>>
>>> So the correct sequence of the L2 cache interrupts is
>>>
>>>      interrupts = <1>, <3>, <4>, <2>;
>>
>> This looks correct to me. You mentioned on IRC that what you were
>> seeing
>> was a wall of
>> L2CACHE: DataFail @ 0x00000000.0807FFD8
>>  From a quick look at the driver, what seems to be happening here is
>> that
>> at some point (possibly before Linux even comes into the picture)
>> there
>> is an uncorrectable data error. Because the ordering in the dt is
>> wrong,
>> we read the wrong register and so the interrupt is never actually
>> cleared. With this patch applied, I see a single DataFail right as
>> the
>> interrupt gets registed & nothing after that.
>>
>> I am not really sure what value there is in enabling that driver
>> though,
>> mostly just seems like a debugging tool & from our pov we would see
>> the
>> HSS running in the monitor core as being responsible for handling the
>> l2-cache errors.
>>
>> @Daire, maybe you have an opinion here?
> Likewise. The new ordering of the interrupts to what the driver expects
> looks correct - as far as it goes. However, I'm not convinced enabling
> the SiFive l2 cache driver out of the box makes sense. Using l2 cache
> driver doesn't align terribly well with the current MPFS roadmap for
> mgt of ECC errors.
>>
>> Patch LGTM, so I'll likely apply it in the next day or two, would
>> just
>> like to see what Daire has to say first.
> If l2-cache controller is enabled, then interrupts should be connected
> as per TRM.  I think this specific patch lgtm, ideally with a
> 'disabled' stanza and it's up to individual MPFS customers/boards to
> enable l2 cache controller if they want it.

Disabling the device in the device-tree is orthogonal to fixing the 
interrupt sequence. I would suggest that you use a separate patch for 
adding status = "disabled";.

Best regards

Heinrich

>>
>>> Fixes: e35b07a7df9b ("riscv: dts: microchip: mpfs: Group tuples in
>>> interrupt properties")
>>
>> BTW, it isn't really fixing this patch right? This is a dependency
>> for
>> backports to 5.15.
>>
>> Thanks for your patch,
>> Conor.
>>
>>> Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE
>>> board")
>>> Cc: Conor Dooley <conor.dooley@microchip.com>
>>> Cc: stable@vger.kernel.org
>>> Signed-off-by: Heinrich Schuchardt <
>>> heinrich.schuchardt@canonical.com>
>>> ---
>>>   arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi
>>> b/arch/riscv/boot/dts/microchip/mpfs.dtsi
>>> index 496d3b7642bd..ec1de6344be9 100644
>>> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
>>> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
>>> @@ -169,7 +169,7 @@ cctrllr: cache-controller@2010000 {
>>>                          cache-size = <2097152>;
>>>                          cache-unified;
>>>                          interrupt-parent = <&plic>;
>>> -                       interrupts = <1>, <2>, <3>;
>>> +                       interrupts = <1>, <3>, <4>, <2>;
>>>                  };
>>>
>>>                  clint: clint@2000000 {
>>> --
>>> 2.36.1
>>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
