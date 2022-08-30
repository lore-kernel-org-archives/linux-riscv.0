Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829DFECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B/VBxhvhLdNF4xpNjellKRJ7WOqCisWe9idbG8Aagxc=; b=mJIk0sNfEITUM9
	GLSY9P8ZHkFeLodmVjM7LxcAlFYAKusqtCkoMR888VL+ssa9Ci40nt8Ey71b/BBtLAZUqJuzs609y
	um7rFawJHEw/hw9aoMuleFZUQJZcn31eU3MXjHXsUkR6Fv1FFM1PKf9F/QlWD6FmaXevzrUXFfl04
	HR50tdH2cgNaEndU88CpISMWDvIYvzTjf3LT2dhi0gjziGcLVhp0AU4oZV8uhLbUflgKJIuyklsso
	eLizObwyWj4oCmK+EU0A5T86lDLlv6je2aFJd9WBGaKnTMjg/Hve+Ywu1noAXhZcfEQtltS8VcKUf
	Fh9ONoKpIRGk4HhoEaIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5LH-000yyF-CO; Tue, 30 Aug 2022 17:48:03 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT5LD-000yw9-Vy
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 17:48:01 +0000
Received: by mail-lf1-x12a.google.com with SMTP id bt10so16572713lfb.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 10:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=VbbC1Bh6r1meQW/qFxqr5r4rBsOPTTmmpQK0Kk/mnoM=;
        b=CLx2anEK5muMjHEy2z6C/ytE09XuuVbT66QitISohw8P5KeGxIDzu3b3thqQ0XbIPB
         KxIstQ1nTlrbMbsyAniPt1O+OUDo6NXpNPd8eFeiEzf9DdnTn9v/tpl8hMEejPORxwPf
         xevIa+Vg6ZZNZtopf1a8JGSJQ1pOFWlsvU4rEgwdKANRzQoyhnQk2oDaLTpJn6cvQdTN
         lRXu5okbtYkUH/DYBOPjr9Wd0N0cqUgyS2hfG1l4yL+ssbqSWoJpdR1pXn/4bzNo9Sg+
         5totB4e8qGoIOrGLeo5jhnDSU/YXMfTIk2SDmpq8luO+q/5AMtou5/vxxI1QkkL4sK9/
         vr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=VbbC1Bh6r1meQW/qFxqr5r4rBsOPTTmmpQK0Kk/mnoM=;
        b=ngVSA1Zqx9iY5tQQbQqIJyEvgijwaNyXNbbzVWaLaoAvM/ID3JCUCIkeoSlU4bbI5r
         iulgqewLSfNL9rgczcUcU36mvd3jV/CIw1vZjcGKIVf49ebnG8wOCJuzBgRcuxWnUVVi
         uExtFOsVMzQW2G4tNbEW7cA6RLAv4M88lOPAHq9GfWGgEjJNGdCjrIe9tSnK8NxV805R
         WUqM2xRuzALbV/1OhQMPyo/+J6g0xb+xDZ33h6OPYd8ZDxayOMt0AT2jy+SdhDvMouNY
         QywGaFD9PtqODwahr/rOPJbLoyPZw3XfhcBO92mH3qc5MuF415CQIMdKHfMNO0IZ+83m
         L1sg==
X-Gm-Message-State: ACgBeo0eIw+HPgbILutjMoLk5Kl1/SWMave+ZEiAD1UraOhxpp31mnXJ
	l7Cz1s5+p3/FS/y47gNmhbSgvlPUPeUaOM1x
X-Google-Smtp-Source: AA6agR4iL/IbKnyBOdWHHEfU9GGXJYgpKeaHWqUCTEAWeQ+yo7kn+yxnBWPHeQ6vQS/TgkpXkMzTiw==
X-Received: by 2002:ac2:4144:0:b0:492:eb38:d8e9 with SMTP id c4-20020ac24144000000b00492eb38d8e9mr8904249lfi.215.1661881676256;
        Tue, 30 Aug 2022 10:47:56 -0700 (PDT)
Received: from [192.168.28.124] (balticom-73-99-134.balticom.lv. [109.73.99.134])
        by smtp.gmail.com with ESMTPSA id q15-20020ac25fcf000000b0048b03ec561fsm1675010lfg.150.2022.08.30.10.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 10:47:55 -0700 (PDT)
Message-ID: <a494ab3f-fc43-e1c7-e30f-09838d743ed5@linaro.org>
Date: Tue, 30 Aug 2022 20:47:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/9] dt-bindings: riscv: microchip: document the aries
 m100pfsevp
Content-Language: en-US
To: Conor.Dooley@microchip.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, Daire.McNamara@microchip.com,
 Shravan.Chippa@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 Cyril.Jean@microchip.com, Lewis.Hanly@microchip.com,
 Praveen.Kumar@microchip.com, wg@aries-embedded.de,
 Hugh.Breslin@microchip.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220830101803.1456180-1-conor.dooley@microchip.com>
 <20220830101803.1456180-3-conor.dooley@microchip.com>
 <a3a8e2ba-a6bd-6e66-fd04-e3a46661a34d@linaro.org>
 <27b8aa9e-9173-b40e-8f9c-a53fa5ba36c8@microchip.com>
 <1065bc99-d73a-9d19-7f09-26cd862fe0c7@linaro.org>
 <69027950-f18d-c9a7-9f0b-d73ef68197c7@microchip.com>
 <dc3bd6c6-852d-30a5-2ec1-ab5f7fd1488c@linaro.org>
 <8ae5c383-1c04-e16e-83a6-26861640deb1@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8ae5c383-1c04-e16e-83a6-26861640deb1@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_104800_058112_83366D39 
X-CRM114-Status: GOOD (  13.77  )
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

On 30/08/2022 20:35, Conor.Dooley@microchip.com wrote:
> On 30/08/2022 18:30, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 30/08/2022 19:59, Conor.Dooley@microchip.com wrote:
>>>>> w dts were
>>>>> needed so that the gpio-hog could be set correctly. Out of curiosity, I can
>>>>> have the same compatible in multiple devicetrees right? In that case, it
>>>>> would just be "aries,m100pfsevp" here and I could put that in both?
>>>>> Would make things easier..
>>>>
>>>> Depends, but I would say for this case rather not. The compatible should
>>>> identify the board. If the boards are different, one compatible should
>>>> not identify both of them. Imagine U-Boot (or something else) trying to
>>>> match the DTS.
>>>
>>> It is the same board though, the way the bootloader works is that if it
>>> detects an SD-card it will use that to boot from, and if not will fall back
>>> to the emmc.
>>
>> Wait, I might miss that part. So this is exactly the same hardware with
>> the same SoM/SoC, same eMMC and SD card, except that one has plugged
>> this SD card (as it is hot-pluggable)?

Then two thoughts:
1. It is indeed one compatible because it is exactly the same hardware
(I don't consider plugged SD card as part of it, just like plugged USB).

2. Then I don't think you should have two boards in the kernel. It's
fine if bootloaders have two of them or to store an overlay in the
kernel or somewhere. But two boards for the same board differing by
hot-plug setup is not for Linux kernel.


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
