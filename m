Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0341C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 07:32:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 615DC60E8C
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 07:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 615DC60E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUo6FKzSSeKkJfeOhgj9lGwd4/Wuq/96gTer6RwHnvY=; b=knocuoiw88VG1c
	x2I0lDMAMKjvlljfhLI+z0VaFytmZy1RSfOvIn7oPxGDaKGJak+LHwcy2gozJMoz9JZ0rdx/QtKQN
	WgeiXl2FsOKaLLRsRo/F2iGEGbZOrISzxrQ/1slC15Yf/lYzi365J/+4RZE7xsEf9nu9ew/JAeH39
	F3ZOQAgqYJNKacdZq8kXcReu2vzmMofcs2f9c4tYaS0SzB6yl5KtchAVA0Wcbjk0E1raq50FTqkQQ
	mVx8vHgGgBL7zYmh2w95z1EK+oNN5fRjAmqe4FAusqUY8b6ZuLv8+Xt14lAdNA0QKx8KcQnioPaL3
	4aj+vjlLqi7VM3wyohNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfdPp-004AQY-Gf; Wed, 27 Oct 2021 07:32:05 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfdPm-004APC-BV
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 07:32:04 +0000
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7EB993F179
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 07:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635319916;
 bh=2s/FQ79PC6XkEYiIzPy8bx8P14QzrSmxySRxZyJ5I+g=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=U4fnaFa/z2KU9TFg768RKyGh87x5gDHO2CzNUQ2KjIW1VmIdGwRXRjbO46eYInSJp
 l0DSKW1YzntjOYetWoVIPJvE8FPJeLZ4aqhuAGw6mZoXr9i7/GBnbckjYAmRnBZw2E
 XhV7erGaIt/5R6UCvum+R4JnKjiWiMFnvrdcyLAPceT+wAExzNuWazpYaQc7yMUQwA
 y/NHi5iM0jZon80LKVIHuJ5Ps4jChJuNRIkSmsPUPPb3VYedozCNS6W7FW+xj6Bvw8
 1GQGJL+p5T7BxMHVAezauUhf6KH/OB80k3PR9Wx+knFTBr/jlJ1Nxg0kLRyg7GQacm
 1wz+4gB1jOPyQ==
Received: by mail-wr1-f70.google.com with SMTP id
 z11-20020adfd0cb000000b00170f3e37900so320710wrh.23
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 00:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2s/FQ79PC6XkEYiIzPy8bx8P14QzrSmxySRxZyJ5I+g=;
 b=Prdn0cDqIN9nZRpynwr2TvQuZl/Ze3A8ltVV2C+n/iKCSV9+iLaJAPodSC3aHZgNlD
 /ttLslkVkTQRKig7NOfrplet1Gz5GF4RD9y6vn0N58VAyRLM50JMlLmA13TtwuS0ilKz
 SL0v/WcROLsBHqyCdS1nmfsIJzaZwwR/LpCv4BI9DPrCHkb32G0P4PVEaI+PD/nBu9P0
 NJ2/CYpF/6sl5a2mPmn8jFhZ+Ud/cwfwEBv1qVHMx2FSeupLbXFKbcLNRYGarGdP+eEy
 r+WFuU2dAk5b4ybM6GUFFUrFDfzcF+V4Re3oFuO3fsZsGx1R2C1ZBLbwYizI+A4LwnXW
 XC1g==
X-Gm-Message-State: AOAM532VxDiFg7U3W0q8D7xrXDYUcdaNp6CPOnxNEONyzFai7Ho/E5+O
 i2rqlqugbHILRcgbEmztP5uj7NlwJIkM999dD/iTdsEhbdire028idwsULFs6HTT3+Npj24Yp5y
 5N/jhrNzChZW6A712UZsdurjsBPdd14DSsv8Sn82gVLvBPw==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr3910071wmc.165.1635319916230; 
 Wed, 27 Oct 2021 00:31:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAa8hTgfeIlBDfFWTQRAvviX6QL7re5ZcjzQ8pDZ7Uc0nekEP6wY4UvbzxYdJvKiPo7Oy8Xg==
X-Received: by 2002:a1c:7c02:: with SMTP id x2mr3910043wmc.165.1635319915921; 
 Wed, 27 Oct 2021 00:31:55 -0700 (PDT)
Received: from [192.168.123.55] (ip-88-152-144-157.hsi03.unitymediagroup.de.
 [88.152.144.157])
 by smtp.gmail.com with ESMTPSA id h22sm2872326wmq.42.2021.10.27.00.31.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 00:31:55 -0700 (PDT)
Message-ID: <a4f8fad0-4ae4-5a7e-1691-ae46abd061fa@canonical.com>
Date: Wed, 27 Oct 2021 09:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/1] riscv: defconfig: enable DRM_NOUVEAU
Content-Language: en-US
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 Anup Patel <Anup.Patel@wdc.com>, "axboe@kernel.dk" <axboe@kernel.dk>,
 "sagar.kadam@sifive.com" <sagar.kadam@sifive.com>,
 Atish Patra <Atish.Patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <mhng-5dc2aa26-9f1c-4764-9877-6d99569210b4@palmerdabbelt-glaptop>
 <DM6PR04MB7081C64D27D133CEDE728393E7859@DM6PR04MB7081.namprd04.prod.outlook.com>
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <DM6PR04MB7081C64D27D133CEDE728393E7859@DM6PR04MB7081.namprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_003202_581047_4BB676D8 
X-CRM114-Status: GOOD (  22.29  )
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

On 10/27/21 04:31, Damien Le Moal wrote:
> On 2021/10/27 8:58, Palmer Dabbelt wrote:
>> On Tue, 12 Oct 2021 09:46:58 PDT (-0700), heinrich.schuchardt@canonical.com wrote:
>>> Both RADEON and NOUVEAU graphics cards are supported on RISC-V. Enabling
>>> the one and not the other does not make sense.
>>>
>>> As typically at most one of RADEON, NOUVEAU, or VIRTIO GPU support will be
>>> needed DRM drivers should be compiled as modules.
>>
>> Do you have an nVidia card that works on real hardware?  Last I checked
>> was a while ago, but they weren't working at the time (IIRC it was
>> something to do with PCIe addressing, but it was a hardware limitation
>> so I don't remember exactly how it all fits together).
>>
>> If they work then I'm happy to flip them on.

My SiFive Unmatched is running KDE on a GT710.

It would be unfair to treat the two major GPU vendors AMD and Nvidia 
differently.

> 
> Why enable this at all ? If they do not work, then disabling theses cards make
> sense. But if they do work, isn't leaving the config to be the default defined
> by the driver the preferred approach ? Otherwise, we will eventually end-up with
> a defconfig that has everything enabled...

If you want to get your system up, having keyboard input and GPU output 
is the bare minimum that you need to proceed unless you are a developer 
working over UART and have a second system available.

To keep the kernel small DRM drivers should be modules.

Best regards

Heinrich

> 
>>
>>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>>> ---
>>>   arch/riscv/configs/defconfig | 7 ++++---
>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>>> index 4ebc80315f01..c252fd5706d2 100644
>>> --- a/arch/riscv/configs/defconfig
>>> +++ b/arch/riscv/configs/defconfig
>>> @@ -72,9 +72,10 @@ CONFIG_GPIOLIB=y
>>>   CONFIG_GPIO_SIFIVE=y
>>>   # CONFIG_PTP_1588_CLOCK is not set
>>>   CONFIG_POWER_RESET=y
>>> -CONFIG_DRM=y
>>> -CONFIG_DRM_RADEON=y
>>> -CONFIG_DRM_VIRTIO_GPU=y
>>> +CONFIG_DRM=m
>>> +CONFIG_DRM_RADEON=m
>>> +CONFIG_DRM_NOUVEAU=m
>>> +CONFIG_DRM_VIRTIO_GPU=m
>>>   CONFIG_FRAMEBUFFER_CONSOLE=y
>>>   CONFIG_USB=y
>>>   CONFIG_USB_XHCI_HCD=y
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
> 
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
