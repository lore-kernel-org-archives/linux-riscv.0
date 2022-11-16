Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725C5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Nov 2022 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdxRpzeobNNo31qNSajSjZcgatGo97WehiEyJYPceBA=; b=AE84wMdBl4Tn4C
	FOYxx0oyIsdFOFSN7luxmPetAB0EfUGT1ZpgIYYtFsSC9udjtbYDy+CR4jrhde96mneHbxr+V/8J3
	84l1tV5FKKU/cofFMLdBFOTy183/VsZhd0ow5BzIqGyoWkHVSOdt7PfTJKf6GTw61r3DfbBGEHrqm
	Hg3ynJpvvfhOy/KeyUM1d8VKfT5YJ1A47+Kd3HGOxXRgZQW2YyuFk6lxZDE61HFRvM6z0Gzs4q1O+
	/RkoYwJ3yqkQ3aSxGIatDsJG7c/NRFkQF0ACEnYfNmdqznP9mHHm7w3aWqjITsRQKD2BiT1ZnGnLx
	MRXALZXXVWD566H64+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEcI-001deR-KO; Wed, 16 Nov 2022 09:21:58 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovEcC-001dZg-Kj
	for linux-riscv@lists.infradead.org; Wed, 16 Nov 2022 09:21:54 +0000
Received: by mail-lf1-x134.google.com with SMTP id g7so28577270lfv.5
        for <linux-riscv@lists.infradead.org>; Wed, 16 Nov 2022 01:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BJGDgjAYzHCIAoX8j9X+fWTaQJQAOPrS/p0kAef7wxk=;
        b=mONqG2odwNB/ARB8TqLKMmsnA7B9r4RtzDzCL4dTrWPhIpL+hWl+10qbXl06om0viA
         0ESHfIhTmuhMlBRdsNtdpkUKM5ebg/XE78C6BcPy+8h6FZfdmqiP52vni3I4IxG7jPl8
         qOQmDIBEVmohMeEuB95jnypjds7X3SGSPV+polz9oseF5fV3vCuFdUMTVDnwETHrrWr0
         vndpVI0jggOcMjStfg9G12FGcXbJ9ke2U9bsuXO0rhiFyJWeXVtJI4hp8xsPTaDJ4LHg
         DrCvcHqzLhKR61b5cewymmGG8fArZll1lsttXnFHKcN4kKRTyzcVGEtxqCJ4tMb4MI0k
         fqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BJGDgjAYzHCIAoX8j9X+fWTaQJQAOPrS/p0kAef7wxk=;
        b=WDNFNsMZUNZ+hVE8wSBZh8ap8MVfVqj+2CrIfEZKK17pSzyMEJ3UoOWHwv8zSoGXhh
         1u4cbU4w+hJntqQXNLWC8ALDltXgEbXprW+jO5omU5Ha50mfEo48RO6lab020LhyHVqQ
         szAjb1sANnG15LDbZU/prCWshYsf9PsgJOpMUpZpkIylY48WhhH9Dve4WSSDdf9o7pzv
         WF9wXO8+xOP0j8xUM2B72PDdGJ8z8MMBU3QoT5FZdOLjVnMxMv5NVQIWG0YM5rGWCGFN
         dW53SK8pyAtkL1ufYs3LjO4fC+G4g5tiHsI1gja6lBJaRjby8yM+Pu52dBJHgbAXgTrb
         JUYQ==
X-Gm-Message-State: ANoB5pll0Fd7nldwiubamnfhah2tS0VLXGn8EErUHeB/n7XERGOvkeUS
	X7/3uBHd3xNIoFkaz7bPGl3k+Q==
X-Google-Smtp-Source: AA0mqf4nQfEaPTARH+N7BGurePdhUCQlFUm5bUoqFbP9cLw0sv+nR0LJaVhlKtPAqmlhccJ75cNTgg==
X-Received: by 2002:a05:6512:370e:b0:4a2:4560:61e7 with SMTP id z14-20020a056512370e00b004a2456061e7mr6727723lfr.170.1668590508579;
        Wed, 16 Nov 2022 01:21:48 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a22-20020a056512201600b004b48cc444ccsm2399043lfb.100.2022.11.16.01.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:21:48 -0800 (PST)
Message-ID: <60e8ed22-b865-2ba1-1e34-248159746ea6@linaro.org>
Date: Wed, 16 Nov 2022 10:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller
 bindings
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com> <Y3EDuaW0zQSSfiQ/@spud>
 <CAK9=C2WDQCnVnxKR6SFspdwope2KffyASLJDF_Ygo_417ekJ5w@mail.gmail.com>
 <Y3QT5Vy3RnIXobHz@spud> <3037b4f9-268d-df03-380c-393a5d01f3ba@linaro.org>
 <Y3SrVMYjkWEx4wYw@wendy>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3SrVMYjkWEx4wYw@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_012152_759472_F88DBD54 
X-CRM114-Status: GOOD (  12.82  )
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

On 16/11/2022 10:20, Conor Dooley wrote:
> On Wed, Nov 16, 2022 at 10:00:27AM +0100, Krzysztof Kozlowski wrote:
>> On 15/11/2022 23:34, Conor Dooley wrote:
>>> On Mon, Nov 14, 2022 at 05:59:00PM +0530, Anup Patel wrote:
>>>> On Sun, Nov 13, 2022 at 8:18 PM Conor Dooley <conor@kernel.org> wrote:
>>>
>>>>> Also, the file name says "riscv,imsic", the description says "IMSIC" but
>>>>> you've used "imsics" in the compatible. Is this a typo, or a plural?
>>>>
>>>> Yes, the file name should be consistent. I will update the file name.
>>>
>>> Is there a reason why the compatible is plural when all of the other
>>> mentions etc do not have an "s"? It really did look like a typo to me.
>>>
>>> It's the "incoming MSI controller", so I am unsure as to where the "s"
>>> actually even comes from. Why not just use "riscv,imsic"?
>>
>> Yep, should be rather consistent with all others, and IMSIC stands for
>> Integrated Circuit?
> 
> Incoming Message Signalled Interrupts Controller, no?

Ah, then still singular :)

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
