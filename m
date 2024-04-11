Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB37CD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 01:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xl8NnO8hTQq2TbwBhM+fKnwpZiqNx6SwQMqtQlqANlg=; b=KjwNhfofFaA0SR
	omMeMWqtztiSmaPuVHi6COROgZLJqAoBxHPM9S83OIXr5Sp5rcodOA/EQ6YluZJ3rq2jkAcmid7rf
	l9bqdAnQ4P3Hnoqgd9IFgnb8TDcj8dxR/oqGq0uchVPR2FCMfXfAqzAdGpkzXOk0k5IR5jDVYJxDr
	PBdyv7vVeZC3cmoH5zPL2bPAXh27C07I4o201daVdeLQ8gALoLM163Ot3dhKWpjwrKdkq1yKKJbED
	6OisR5JyYhWQbG6wgqEZiKq/6QLF4GB/qbxzspCfb9tI2O9AULvjd9Q/kRvYeZRg54ojkydfWOpy2
	WJKWVvMVVdXKXjlXZG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruiy8-00000009mra-3Acr;
	Thu, 11 Apr 2024 01:11:12 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruiy6-00000009mqX-0Woj
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 01:11:11 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5a9c875ceecso4060511eaf.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 18:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1712797866; x=1713402666; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K7z1/Srv4eZ2vooDSDvwwBej5oDKDz5itKY0SDj8VoQ=;
        b=dulEynRC5znoxF5D0nIzYbbmUHPTKkKUPV0zJkkVhez+0O6RvMTeDvGEbgNMpXti3N
         iVXIQWtE1qPSCh0HkV8lDcYWQ6EZH9pbzk9AI4T9KgF67JBpJlrnbfOWdg58lAauXA5s
         qnNY29Z/tpfiP/jzcjHcKFRLS9hV9Ei2nelwirs0w6p1B6hkhz6fkh+uF+NE9jpVcsmp
         jgsZ0Zu33lCqVwUEtjutGraSln8CexqcBET5xlgIpjyEHi/NdRz9IjppTle3/7W7UbE9
         U7d4tu71NNUllcFscHrytYK3dpSkK1eBRsXMMv5FaVbZe7Xkd2hUxYS2Jgo++8h6/El4
         uGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712797866; x=1713402666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7z1/Srv4eZ2vooDSDvwwBej5oDKDz5itKY0SDj8VoQ=;
        b=ETW9I7RNeUaPBaBpdCdnCKPtt2IoJWU/cBYZzoC2+Omxo4wp7d/85dSdaS0AnsiYTR
         YHqjlycqKNst4oQIz7gJtiZav0Vj4faj2viuoobEoSK25KC193bsGDzQbqlWHXadyjTA
         cYv1HJDjd3xf9fL5U9RdnW8I3bzjibkW0Ab4CfoaYav9oK/+a0+f7Hcu/Ro8An6S2KJB
         EGTU9sSNQ2BIcAhw5lsMpr+imETn/xFxhRAHyNVj5+DGdv/c5L29pnSozU5IcJP1zTxw
         BRHw2bZ4BrQstE4+wVxuMyzVsvVsSJlMXv99smdRAQ4Os4xEz/oWMGMr9ZbwQ+3UONYA
         dRaA==
X-Forwarded-Encrypted: i=1; AJvYcCUB+2lwYLQcj+mQdolhQVBsD1YeWMd/K5syMRikr3hfXYYo2sFJs61llw0xbywn4qs5AvJ244bFBuR476DsBsCt8AN0G8kvDGHOmNkW9WiU
X-Gm-Message-State: AOJu0YxZvOKv2DcgkTUDgmZFHPR9Kx/ybnUn0Ico/2dqqlY/3pBfV/0X
	Dwp7iVei0jVpMs/yodnM2mDbXaig2eALYZmE6zzabQe9FvkHr9FJRo4T49xysGM=
X-Google-Smtp-Source: AGHT+IFvdAWGolMk2tEZ8bM2BAlC1TsYZtb/fNUYXyTQY+hWEfuiEC430lr0paNhGs3so4u/3MehIA==
X-Received: by 2002:a4a:e9f3:0:b0:5aa:6a28:27ea with SMTP id w19-20020a4ae9f3000000b005aa6a2827eamr3725829ooc.6.1712797866523;
        Wed, 10 Apr 2024 18:11:06 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.8.167])
        by smtp.gmail.com with ESMTPSA id db1-20020a056820270100b005a4bc907f0asm113158oob.15.2024.04.10.18.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 18:11:06 -0700 (PDT)
Message-ID: <4c8e63d6-ba33-47fe-8150-59eba8babf2d@sifive.com>
Date: Wed, 10 Apr 2024 20:11:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/15] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
To: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, loongarch@lists.linux.dev,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
 <20240329072441.591471-14-samuel.holland@sifive.com>
 <87wmp4oo3y.fsf@linaro.org> <75a37a4b-f516-40a3-b6b5-4aa1636f9b60@sifive.com>
 <87wmp4ogoe.fsf@linaro.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <87wmp4ogoe.fsf@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_181110_179811_1CCCDD75 
X-CRM114-Status: GOOD (  14.18  )
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

Hi Thiago,

On 2024-04-10 8:02 PM, Thiago Jung Bauermann wrote:
> Samuel Holland <samuel.holland@sifive.com> writes:
>> On 2024-04-10 5:21 PM, Thiago Jung Bauermann wrote:
>>>
>>> Unfortunately this patch causes build failures on arm with allyesconfig
>>> and allmodconfig. Tested with next-20240410.
> 
> <snip>
> 
>> In both cases, the issue is that the toolchain requires runtime support to
>> convert between `unsigned long long` and `double`, even when hardware FP is
>> enabled. There was some past discussion about GCC inlining some of these
>> conversions[1], but that did not get implemented.
> 
> Thank you for the explanation and the bugzilla reference. I added a
> comment there mentioning that the problem came up again with this patch
> series.
> 
>> The short-term fix would be to drop the `select ARCH_HAS_KERNEL_FPU_SUPPORT` for
>> 32-bit arm until we can provide these runtime library functions.
> 
> Does this mean that patch 2 in this series:
> 
> [PATCH v4 02/15] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
> 
> will be dropped?

No, because later patches in the series (3, 6) depend on the definition of
CC_FLAGS_FPU from that patch. I will need to send a fixup patch unless I can
find a GPL-2 compatible implementation of the runtime library functions.

Regards,
Samuel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
