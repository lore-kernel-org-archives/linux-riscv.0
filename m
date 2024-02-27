Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F565C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 19:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8pRZtVUw93jOF8BwlQ4kb4BfE4DCEU6zErtGZJLNLgs=; b=0bWqg+F0m86/nl
	8dRi3oWVe9OP4PIwALBXTnC0HnXByLg+m3OV8nhNnsC+AWS+OmX/mCJiBy//JaTc/432gAP5vw+cY
	3xSNQL/WN+mq+YH9Q3friSi8l+loJJ1W6Q8kFaguvhHJR+vcHZu56bac0T3tPEHEJhYnZndDyHSnd
	vq0oQvW91yGHLyud36RYBxyjD7c/RyUvbQ8mMfnU9hbuNVfR987p+T94D+dC5csyD80Qug+dnxRew
	d9VImFtiZLmcpDu4zAasty8tXN5WylsD1lc6G1wVIgqr1ooJYXZ/dXxs8jMJ6n9i1TBH9Z8qtBZtM
	+7sKSRTBTsxYaEeQEATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf31t-00000006bRK-30u4;
	Tue, 27 Feb 2024 19:22:17 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf31r-00000006bQf-11DH
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 19:22:16 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-36503a4980aso10653545ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 11:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1709061734; x=1709666534; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=daBiu+dTDOsAsy2yhxY8tXjMmdUYISpdMVSBjsClfNY=;
        b=SoZxlkHw8Fc+4wJ1hiZvxAgHBGgKoL+okx2+jiC9ZmswWXpzehxDrnpVE9cJVfWYoW
         XUZah7fjPQ+SVqa0ZUEg0pHYpFYVx3Q4vNttJdGjO7StNIzlA3ehi/CNb919rECEn0RL
         lVVK4F+rzEATTSiMfxzufWbENRLL0AFDR/vJrJqKoWb+R29jlxLYCXE7cwVXb46Q1fim
         T2q7NnvKJ645lpuppbPRdSUj9yQARKaEi49iHIHt6dLkXb/kgS5pBEvF5QbQxBp62dQk
         iPHKDPpEs6gxopBS0NNDMaYnmMY8/Didk/X7pz0CxtLBFQZ2AyNHS2XgJQuRkhKVOg3L
         XKrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709061734; x=1709666534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=daBiu+dTDOsAsy2yhxY8tXjMmdUYISpdMVSBjsClfNY=;
        b=nZwbxycaBISMk4e/FAm2eMVjsEaNEDNKRfqhHYhI1/9FmGLifHREvZGVo5Z2xbZ2kh
         j7DLQTpvoSVpNvBFxpWj8TTdeyimq7EFGBMnYJ2TFWsMr7YWCKAqDy+Yal5RM+HOAyXu
         PhmOWYWNx/3+ZioxsAKI/d94l4IUPCwnx4ipx4Z5f4r6cETYo44RK5KElmVgUGmXxM9M
         9KHadx1TtX2w4Yab6RsmkXyXMD+0kZix8d9Y0VOD9O69jicvYnUJNZHmmTq88vn1oYuv
         ZJLsE7ueG5rOiGsa6dhdLv3hcU7HEl9/DWxFPTXj8pI2njlLgsyRdhHzNaSh9BbU6uH6
         a5nw==
X-Forwarded-Encrypted: i=1; AJvYcCUHot0BJbS7ORcK/1Cvyj9PQM7mziPDQM97YeUeaw6zbcIWzGykIYphnVjeVd+swGy1GAsdrCDKXicpQv5D2pSF3on2zTKx2aZEWF5xXaBo
X-Gm-Message-State: AOJu0YzbfZMTmIHT0r/ir99iYXIYi0AHHB6/4nQxxU3aYD/AeunmPIYC
	7WOdLTOG3Pn9a9/iP39CcwJrdeMnbxSxo9PUv7a6py9je59dS7T2IjEUoss0vX8=
X-Google-Smtp-Source: AGHT+IE7+ucmoeU4TVIjogt9kPNfNJP4dPyAQIAV+r9O+fZrVXXrMhT/VTNnYBXqseweoo204evXfQ==
X-Received: by 2002:a92:650f:0:b0:365:c81:e02d with SMTP id z15-20020a92650f000000b003650c81e02dmr11843728ilb.14.1709061734132;
        Tue, 27 Feb 2024 11:22:14 -0800 (PST)
Received: from [100.64.0.1] ([170.85.6.200])
        by smtp.gmail.com with ESMTPSA id o2-20020a056e02114200b00364187af517sm2269051ill.80.2024.02.27.11.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 11:22:13 -0800 (PST)
Message-ID: <9673cbe7-41ec-4261-9be8-fc5191ade56c@sifive.com>
Date: Tue, 27 Feb 2024 13:22:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] riscv: Fix loading 64-bit NOMMU kernels past the
 start of RAM
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240227003630.3634533-1-samuel.holland@sifive.com>
 <20240227003630.3634533-3-samuel.holland@sifive.com>
 <20240227-unfitting-rectangle-cd0f23a4f3f1@wendy>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240227-unfitting-rectangle-cd0f23a4f3f1@wendy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_112215_348375_F4FA06B0 
X-CRM114-Status: GOOD (  20.92  )
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

Hi Conor,

On 2024-02-27 6:18 AM, Conor Dooley wrote:
> On Mon, Feb 26, 2024 at 04:34:47PM -0800, Samuel Holland wrote:
>> commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear
>> mapping") added logic to allow using RAM below the kernel load address.
>> However, this does not work for NOMMU, where PAGE_OFFSET is fixed to the
>> kernel load address. Since that range of memory corresponds to PFNs
>> below ARCH_PFN_OFFSET, mm initialization runs off the beginning of
>> mem_map and corrupts adjacent kernel memory. Fix this by restoring the
>> previous behavior for NOMMU kernels.
>>
>> Fixes: 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
> 
> This commit was a year ago, why has nobody reported this as being an
> issue before?

I can think of a few reasons:
1) NOMMU users are likely to be using RV32, which is not affected.
2) Before patch 4 of this series, NOMMU implied M-mode, so there was nothing in
the way to prevent loading Linux at the very beginning of RAM. (U-Boot/SPL
relocates itself to the end of RAM, so it would not cause a problem.)
3) Platforms where RAM does not begin at exactly 0x80000000 would be affected,
there are several workarounds: change the start of RAM (for soft cores), change
PAGE_OFFSET, or change the memory ranges in the devicetree to exclude anything
below PAGE_OFFSET.

It's possible that nobody was affected, but it's still technically a regression
(a hypothetical platform with RAM from 0x40000000 to 0xc0000000 would crash
instead of only being able to use half its RAM), so I thought it still deserved
the Fixes: tag.

Regards,
Samuel

>> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
>> ---
>>
>>  arch/riscv/include/asm/page.h | 2 +-
>>  arch/riscv/mm/init.c          | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
>> index 57e887bfa34c..94b3d6930fc3 100644
>> --- a/arch/riscv/include/asm/page.h
>> +++ b/arch/riscv/include/asm/page.h
>> @@ -89,7 +89,7 @@ typedef struct page *pgtable_t;
>>  #define PTE_FMT "%08lx"
>>  #endif
>>  
>> -#ifdef CONFIG_64BIT
>> +#if defined(CONFIG_64BIT) && defined(CONFIG_MMU)
>>  /*
>>   * We override this value as its generic definition uses __pa too early in
>>   * the boot process (before kernel_map.va_pa_offset is set).
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index fa34cf55037b..0c00efc75643 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -232,7 +232,7 @@ static void __init setup_bootmem(void)
>>  	 * In 64-bit, any use of __va/__pa before this point is wrong as we
>>  	 * did not know the start of DRAM before.
>>  	 */
>> -	if (IS_ENABLED(CONFIG_64BIT))
>> +	if (IS_ENABLED(CONFIG_64BIT) && IS_ENABLED(CONFIG_MMU))
>>  		kernel_map.va_pa_offset = PAGE_OFFSET - phys_ram_base;
>>  
>>  	/*
>> -- 
>> 2.43.0
>>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
