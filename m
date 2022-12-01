Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2510C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 10:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OeVFhRGPWA6J5ykRjNUedhFT2kocHCkGjNITJYIUdkE=; b=16IStygXUHEnf9
	LS7WolIRy8aP2nC0AFCYHfPA/bh44sIE9UsI4/grmf5/4fK+X7/jE1vHkrWmWt329BS1LvmnnHvKR
	e8HuvzcoR23aL0z9/q/GUe/cZV+s+fuTcefQyZkLbUHyruRRaeZXV1CgZ/216h/fVWXN7b5vyMjhA
	Ak6uTvDwUb6ZO9vKxzP3OVqwJLUeBqcAH7ewx5Bg1G1AIrWSs4EzlVnWl9tDFhEXH/SuWzQols+vU
	wiGCcVf8bUODPb4Ck05lskO3NueIHz1JGOcDrI+utBIkRjCd97QqCGUje0RsyqsFKaJE6LDpNrXtd
	OZgDV6SrN+ljttpX4rMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ggr-006fIp-2g; Thu, 01 Dec 2022 10:21:13 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ggo-006fFR-8v
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 10:21:11 +0000
Received: by mail-lf1-x131.google.com with SMTP id d6so1745677lfs.10
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 02:21:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yJWC4EnSIdOHOak+Y01i6W7TmDZjyxRR2uPhy+FOZLk=;
        b=czOauT1/LL1bLcLrnxMZ7LyUIUmobSmtcydtd7PTiowxd5khBSoAy8Q5Jh0363tYBX
         mK6jk8DukOA5/cDl1CBuODKtFLZZ4KfXpQGGA5QLqsxFd8hb8DU8/pWLYe5lT8KxvPHX
         2+605fUYdZQDOI8zSJuqoHxbtfkc1czcwu19yr+IB2DL/MOcMz5r+65zOnMIyKXdmHjH
         RR9S+Bb+UGytEvll9EFZUpNH1RYOlvOsEomq0QEkxeStmNzb8RCAKaFyyayaLEcisv8A
         kD0BdlRMNBTNf3S8XK1Jsl6LMH5QKLS/hEAotw654okuI+vL/RhU4XWmIcVm5hAEREqj
         s+Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yJWC4EnSIdOHOak+Y01i6W7TmDZjyxRR2uPhy+FOZLk=;
        b=SAgZMc/G8NMWfIhF1IEPIQZAWGEqFUvElpVAv1HFCdrjt259QC7EsaRXknsdqfv2p6
         MUs6XVF+0xys2ttmdiW93JFYXRlmcj31sKghWp9x/wW6018/8fdtuAWTWYaTNpa8PpDl
         Bvq2kKI3+wG7Res3/F3CNHT/I4aZ44Qyoo5/ucElwfZfSFPtOE37w7+jdfsr6HpEQ5c7
         WVy2NxM2tqffM1VMvEbIPFECR+z+wLsVZ1PQDpUsp26EaVnvT9ddEZu9bc9dEihAHNaQ
         IqJMfJfx1qyL7cc67NoJh4ON5UZRi42lYrjNvV3wrpw0t+GPzrGfcm4QskXd2z4ZcdWE
         H2xg==
X-Gm-Message-State: ANoB5pn3MeYehBZ4AdddOP9x9n0yGYckoB+zP7eeiuluCIuUGPLltAau
	Xi2w5HS/Mo9i+mQiUOTlzSDTUw==
X-Google-Smtp-Source: AA0mqf6CUSYZrSFSc59I2YqsCSJOMbf+X1AkF2Fb2hvkfIrHoAJHah4FhaNgx3RzM/yZ3iPB9Yg2fA==
X-Received: by 2002:ac2:4316:0:b0:4b5:d8e:c12 with SMTP id l22-20020ac24316000000b004b50d8e0c12mr7626503lfh.665.1669890066328;
        Thu, 01 Dec 2022 02:21:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b4-20020a2eb904000000b00279cbcfd7dbsm290384ljb.30.2022.12.01.02.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 02:21:05 -0800 (PST)
Message-ID: <4e94c635-4cbb-449e-24af-f6fee47fb45e@linaro.org>
Date: Thu, 1 Dec 2022 11:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 09/14] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-10-hal.feng@starfivetech.com>
 <1d62f95f-0edc-afd4-abb4-37fadc0b6a47@linaro.org>
 <72b3d10e-5a8e-ed42-6808-f53773913422@starfivetech.com>
 <768c2add-4c1f-0b36-5709-dbcdd560f504@starfivetech.com>
 <1fb1474b-ec13-e83a-973e-bd9e9a86cb44@linaro.org>
 <98d1bac7-8af5-f481-59b2-d58ca4c228ee@starfivetech.com>
 <9183bac6-121e-0027-a88b-d77d5c9a077e@linaro.org>
 <e954511b-e74a-2c3a-95ec-d33c938b146f@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e954511b-e74a-2c3a-95ec-d33c938b146f@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_022110_353988_D7D2AF6A 
X-CRM114-Status: GOOD (  18.92  )
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

On 30/11/2022 19:05, Hal Feng wrote:
> On Wed, 30 Nov 2022 16:19:06 +0100, Krzysztof Kozlowski wrote:
>> On 30/11/2022 16:12, Hal Feng wrote:
>>> On Wed, 30 Nov 2022 12:48:30 +0100, Krzysztof Kozlowski wrote:
>>>> On 30/11/2022 10:47, Hal Feng wrote:
>>>>> On Fri, 25 Nov 2022 14:41:12 +0800, Hal Feng wrote:
>>>>>> On Mon, 21 Nov 2022 09:47:08 +0100, Krzysztof Kozlowski wrote:
>>>>>>> On 18/11/2022 02:06, Hal Feng wrote:
>>>>>>>> From: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>>>
>>>>>>>> Add bindings for the system clock and reset generator (SYSCRG) on the
>>>>>>>> JH7110 RISC-V SoC by StarFive Ltd.
>>>>>>>>
>>>>>>>> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
>>>>>>>> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
>>>>>>>
>>>>>>> Binding headers are coming with the file bringing bindings for the
>>>>>>> device, so you need to squash patches.
>>>>>>
>>>>>> As we discussed in patch 7, could I merge patch 7, 8, 9, 10 and add the
>>>>>> following files in one commit?
>>>>>>
>>>>>> include/dt-bindings/clock/starfive,jh7110-crg.h
>>>>>> include/dt-bindings/reset/starfive,jh7110-crg.h
>>>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
>>>>>> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml
>>>>>
>>>>> Hi, Krzysztof,
>>>>>
>>>>> Could you please give me some suggestions?
>>>>
>>>> You can keep aon and sys split. First add one of them with their own
>>>> headers. Then add second with their own defines.
>>>
>>> You mean split patch 7 and patch 8 into sys part and aon part
>>> respectively? There are totally five regions (sys/aon/stg/isp/vout)
>>> for clocks and resets in JH7110. If we do that, there will be 5
>>> headers for JH7110 in either clock or reset directory finally. Is
>>> that OK if there are too many headers for just one SoC?
>>
>>
>> Sorry, I lost the track of what patches you have. The comment was -
>> bindings include both the doc and headers. You want to split some, some
>> merge, sorry, no clue. I did not propose splitting headers...
> 
> It's ok. The problem was that the header
> 
> include/dt-bindings/clock/starfive,jh7110-crg.h
> 
> was used in both
> 
> Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> 
> and
> 
> Documentation/devicetree/bindings/clock/starfive,jh7110-aoncrg.yaml.
> 
> The same for include/dt-bindings/reset/starfive,jh7110-crg.h.
> So should I add these four files in one patch?

No. I think I wrote proposed flow of patches:
1. syscrg bindings with header
2. aoncrg bindings with changes to header

Why do you need to merge anything?

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
