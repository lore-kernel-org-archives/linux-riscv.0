Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A55C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 22:12:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59BB060EFE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 22:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59BB060EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vOJNlCZBaHVU1wnfUKRIS/1aDEjjaBOapAYIaZsG4MI=; b=IyD2TNrCLrOFANEpOhw//SiSyt
	9VPz3OBBrM2QJk+YNiaJ0fULN3BTGGRSq2nY9S5xUmNvsHnbEnwadJg1unvOoQSvXm1MGMJT91pEO
	IT7GsdNQFZSKtnDWCFs6YgjTZztRXHlYLJy17Lb2hULPag0fWhZVS2F16zOxRvXVFRLp6JtsHD9wx
	hEZIK0zysrZbFYr4ok421oQ3BIirfhmNTJ0BD19/fG9JGd82tjbY/gTirRIMzR7GkCCLquYE+sOSj
	wDCcwvWGUig4jab4pzKqOC1VztSFy5h9auqKHYnj4w6PtrKn9s/8QQeEE6EgA5vybEmbKtjuy1x6J
	ttoqQNpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfr9x-006Nr3-0A; Wed, 27 Oct 2021 22:12:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfr9u-006Npf-Gy
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 22:12:36 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 u6-20020a17090a3fc600b001a00250584aso6286238pjm.4
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 15:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=cHz5jop8T/lwVeHdgU4OLjqSsNE5NE66qnh2txZDW1Y=;
 b=nFVIZLP0EQ3/SLtcTkWFJP/CMOKtd/bG2t0y5hTrVxVnkcUEZunvqlmXPus15pq7Hp
 I6V/DM6OHjwldspqlh8sMcYjIUnbUiuj/q7DWUJKD0XuswSjNakf8d19SkWKKk4qIG93
 akQXrNqm22rLwNa1kh8qj/cLcuPWsZ81kXsG12O6I8fwxhlMM4VhyXTt+aXg6AgfulZL
 gVj3zKNcWvEIYpKEIib1AbGFfghUj8lIMmVh5HZAKPrI9bsQ47Z8ukOxiL+LXLzRnBZr
 TEgQvFkhkBxDBoRFCf4ZjwSULXMM3r1hFfxbhzQ2IbZOC1dPTr54a6FaSJJ7OZGpIbmm
 cn7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=cHz5jop8T/lwVeHdgU4OLjqSsNE5NE66qnh2txZDW1Y=;
 b=jV5XSx+ryk8PX2cSiKNXsmn5AWIlDFBo+YvJBNH3F8QzBg4voKf5FyzBjHofqmZ5jR
 gc7Ir8B84xrzDkRVWFR5KH8nJjNUzveaXNP342qf1jhAajR+i7kcMbHg0CWL4aLoZRI4
 G8cL5PCb7dDXN70v/3G8wXaJulLq3GWGHl+MY9UWkfb634/CHaWueSYXSygykdvV8IkH
 VDn/sqAdjYJ3DBK7MlGns5irZ0aCVWGDnxLBGFuhzoQNp5OkgkL963HB/by9yOGT+RCU
 +oC1C4OJiNT4qo/iTIDU088KVZNEe0jzZK8jTekLK4CQc/Yg26ABO71GMlmLX3BPY+cb
 kK+w==
X-Gm-Message-State: AOAM533C3u1PlXjRY6bS2E7YWPk4WnrcNXni3hvkoKRDkLLYle40tPzk
 WmRz4RUvo32adwTL3mMUG480mw==
X-Google-Smtp-Source: ABdhPJxd0TAmzkhB0bYq38wxLqY1jwO2hPoqQZhNmADDa6ISOp0edfYUas+ijiAcy3CeCojKor1IPA==
X-Received: by 2002:a17:90a:e7d0:: with SMTP id
 kb16mr378209pjb.9.1635372753231; 
 Wed, 27 Oct 2021 15:12:33 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:d96b:421d:2a73:9190])
 by smtp.gmail.com with ESMTPSA id d15sm1026200pfu.12.2021.10.27.15.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 15:12:32 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:12:32 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 14:58:57 PDT (-0700)
Subject: Re: [PATCH 1/1] riscv: defconfig: enable DRM_NOUVEAU
In-Reply-To: <a4f8fad0-4ae4-5a7e-1691-ae46abd061fa@canonical.com>
CC: Damien Le Moal <Damien.LeMoal@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>, axboe@kernel.dk,
 sagar.kadam@sifive.com, 
 Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heinrich.schuchardt@canonical.com
Message-ID: <mhng-ecb4debb-aa09-4102-bbf4-0223eff391d7@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_151234_649340_757F90A1 
X-CRM114-Status: GOOD (  26.21  )
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

On Wed, 27 Oct 2021 00:31:54 PDT (-0700), heinrich.schuchardt@canonical.com wrote:
> On 10/27/21 04:31, Damien Le Moal wrote:
>> On 2021/10/27 8:58, Palmer Dabbelt wrote:
>>> On Tue, 12 Oct 2021 09:46:58 PDT (-0700), heinrich.schuchardt@canonical.com wrote:
>>>> Both RADEON and NOUVEAU graphics cards are supported on RISC-V. Enabling
>>>> the one and not the other does not make sense.
>>>>
>>>> As typically at most one of RADEON, NOUVEAU, or VIRTIO GPU support will be
>>>> needed DRM drivers should be compiled as modules.
>>>
>>> Do you have an nVidia card that works on real hardware?  Last I checked
>>> was a while ago, but they weren't working at the time (IIRC it was
>>> something to do with PCIe addressing, but it was a hardware limitation
>>> so I don't remember exactly how it all fits together).
>>>
>>> If they work then I'm happy to flip them on.
>
> My SiFive Unmatched is running KDE on a GT710.
>
> It would be unfair to treat the two major GPU vendors AMD and Nvidia
> differently.
>
>>
>> Why enable this at all ? If they do not work, then disabling theses cards make
>> sense. But if they do work, isn't leaving the config to be the default defined
>> by the driver the preferred approach ? Otherwise, we will eventually end-up with
>> a defconfig that has everything enabled...
>
> If you want to get your system up, having keyboard input and GPU output
> is the bare minimum that you need to proceed unless you are a developer
> working over UART and have a second system available.
>
> To keep the kernel small DRM drivers should be modules.

I can buy the argument for not having any of this in arch defconfigs, 
but in practice there's a lot of stuff in defconfigs that I don't really 
think should be arch decisions (ext4, for example).  If we've got AMD in 
there and the nVidia cards work then I don't see any reason to 
differentiate between the two, so let's just do the same thing for both.

This is on for-next.

>
> Best regards
>
> Heinrich
>
>>
>>>
>>>> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>>>> ---
>>>>   arch/riscv/configs/defconfig | 7 ++++---
>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
>>>> index 4ebc80315f01..c252fd5706d2 100644
>>>> --- a/arch/riscv/configs/defconfig
>>>> +++ b/arch/riscv/configs/defconfig
>>>> @@ -72,9 +72,10 @@ CONFIG_GPIOLIB=y
>>>>   CONFIG_GPIO_SIFIVE=y
>>>>   # CONFIG_PTP_1588_CLOCK is not set
>>>>   CONFIG_POWER_RESET=y
>>>> -CONFIG_DRM=y
>>>> -CONFIG_DRM_RADEON=y
>>>> -CONFIG_DRM_VIRTIO_GPU=y
>>>> +CONFIG_DRM=m
>>>> +CONFIG_DRM_RADEON=m
>>>> +CONFIG_DRM_NOUVEAU=m
>>>> +CONFIG_DRM_VIRTIO_GPU=m
>>>>   CONFIG_FRAMEBUFFER_CONSOLE=y
>>>>   CONFIG_USB=y
>>>>   CONFIG_USB_XHCI_HCD=y
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>>
>>
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
