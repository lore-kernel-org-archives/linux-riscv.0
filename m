Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AC6CAC587
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 16:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hLleIFR4dBPRd1FpWRkB/s7gVX1vX+t03dxwFz6vHq4=; b=GkUpV/obAj7eu0d658HN/xhLpl
	aBOrVAX3BJdpBJitb28LMQhmgElpu4UGuJXfExGVQ08Tkad+Ooc3iFQePEkDZwjI+Yx6Q58GBkVYB
	u+zVUcdz5Nnn2QOd7iHE4MXLxkthcgyYMpbeah8K0cu0aIWv0JYlzvfBV38h+RLFEl9RayRYEaQig
	mbO+dUEc7UVBYSAN0FV38iYki0wAg+o4J7YiYK2ESv/K74if0u8Wg/k4Cd5Pb3zlQNQ6TZu4xhyrX
	KrakDPRkMjY0eZ2+SofWqQkPW6qdxp67jq5H7oq/+pEEaDOLAHecGz6z/Ftd1XVHKTYX7AkCEPG3C
	ad7r0eqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb5K-00000006VQk-2CNQ;
	Tue, 17 Sep 2024 16:29:50 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqb5H-00000006VQI-23j5
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 16:29:49 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2db85775c43so4028400a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 17 Sep 2024 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726590585; x=1727195385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A2kc/L2YjO2OwuQjRkJNsXULcMId6f29Mvxc8fPsN10=;
        b=Y+V49qr9qTxpf2vepoYrMQF4t28dOrIp/Kr1ziavYQVBVhJD3DOB+rRkXvBjh+VdKb
         VHeiyVAvfNWyc6pYXAlBBGyI8JjYUdq4tDl0JCXiDbRO4d27JSjexu+D7lThLqiZwQlc
         2x/JAeAyp9eoFBkewZDHZoLdO4CAsoW1JIZFLJOrnE8RWuXx90grBQlTr0rcTWoU5ujn
         be7V6dLkX3SOflNov72IRdh3d75QFpeyyZ0HuQ4EUU6cISAYYuIdl0y8o9KAoIjUrF/U
         v8YhEAV72qacAoKK7mHydeFLhLJbQRxlDEe7arw9qnQkzDTEOY0T2GSL9DJJinE6ZutE
         3vuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726590585; x=1727195385;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A2kc/L2YjO2OwuQjRkJNsXULcMId6f29Mvxc8fPsN10=;
        b=fGVNP+TXaMi9oa2CnuVZvPSlfEOLRwcLUk376TaWUXe70Y11qLW0+/U2NOcpxqbDYF
         GLcVWkJc+m0IEYoFmIYdlkTDZ8AJ1eH5GlpiSw94j5sbk9qu5JMjqoo4j51EBIHUQUBz
         DxrmI9NpshZaklvq2NlvW6dFah5eajvmlbctv3cJLH0DjlZ3NZXQkGRSM9BLaS0jXH3/
         mFqkDJ0g8El3aW4Wzx+dKkPBslylT1NFr0nDhNdenVP/dPKtfbL+7Xi0mA/sFrM5zdc8
         n2HuAlEg2V/E4PsBCsKZPm4zdCZOIIr4OK3eTvPpAi2pVC1ZKeNtTjJ7eAe1jeIHJ7iH
         kZeA==
X-Forwarded-Encrypted: i=1; AJvYcCUy8Gcvls8AD2INQSnenS1p1dYpQr8wtwWZ9eqFCwcK1WJE7X9Fi9CEwlRWmLq654BL4HjqogM9YRQZFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs3Lm4qGBd1HUZxuREs46W2yyjXlMS8LdGV5fULybK6jP03x/x
	B/9TECPTm7dln22UfmGLU/iagvtwohzNT3nNQ9qA1L2d9qkQdq0Kx2WVcZie6htPNhjf1cKlkD5
	7IMYxPg==
X-Google-Smtp-Source: AGHT+IEz2lf8MMBuM3fut8YAoVW8IAmG69zGMLidnqYv5xKsn3UxKNI3Y8Hl9KCepEfXpmw9hGIDfg==
X-Received: by 2002:a17:90a:ee86:b0:2d8:719d:98a2 with SMTP id 98e67ed59e1d1-2db9fc5416bmr29669648a91.7.1726590585245;
        Tue, 17 Sep 2024 09:29:45 -0700 (PDT)
Received: from localhost ([213.208.157.38])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dbb9c7c61dsm9669168a91.14.2024.09.17.09.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 09:29:44 -0700 (PDT)
Date: Tue, 17 Sep 2024 09:29:44 -0700 (PDT)
X-Google-Original-Date: Tue, 17 Sep 2024 09:29:39 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Don't have MAX_PHYSMEM_BITS exceed phys_addr_t
In-Reply-To: <5c715c23-ac44-49fd-b386-bdf226a56c8f@ghiti.fr>
CC: Charlie Jenkins <charlie@rivosinc.com>, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: alex@ghiti.fr
Message-ID: <mhng-4a253628-c0ca-4463-bf77-4ab1238ad69c@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_092947_836323_30DA785A 
X-CRM114-Status: GOOD (  29.87  )
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

On Thu, 01 Aug 2024 00:35:01 PDT (-0700), alex@ghiti.fr wrote:
> Hi Charlie,
>
> On 01/08/2024 03:24, Charlie Jenkins wrote:
>> On Wed, Jul 31, 2024 at 09:22:00AM -0700, Palmer Dabbelt wrote:
>>> I recently ended up with a warning on some compilers along the lines of
>>>
>>>        CC      kernel/resource.o
>>>      In file included from include/linux/ioport.h:16,
>>>                       from kernel/resource.c:15:
>>>      kernel/resource.c: In function 'gfr_start':
>>>      include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
>>>         49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>>>            |                                     ^
>>>      include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
>>>         52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>>>            |         ^~~~~~~~~~~~~~~~~
>>>      include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
>>>        161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>>>            |                           ^~~~~~~~~~
>>>      kernel/resource.c:1829:23: note: in expansion of macro 'min_t'
>>>       1829 |                 end = min_t(resource_size_t, base->end,
>>>            |                       ^~~~~
>>>      kernel/resource.c: In function 'gfr_continue':
>>>      include/linux/minmax.h:49:37: error: conversion from 'long long unsigned int' to 'resource_size_t' {aka 'unsigned int'} changes value from '17179869183' to '4294967295' [-Werror=overflow]
>>>         49 |         ({ type ux = (x); type uy = (y); __cmp(op, ux, uy); })
>>>            |                                     ^
>>>      include/linux/minmax.h:52:9: note: in expansion of macro '__cmp_once_unique'
>>>         52 |         __cmp_once_unique(op, type, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
>>>            |         ^~~~~~~~~~~~~~~~~
>>>      include/linux/minmax.h:161:27: note: in expansion of macro '__cmp_once'
>>>        161 | #define min_t(type, x, y) __cmp_once(min, type, x, y)
>>>            |                           ^~~~~~~~~~
>>>      kernel/resource.c:1847:24: note: in expansion of macro 'min_t'
>>>       1847 |                addr <= min_t(resource_size_t, base->end,
>>>            |                        ^~~~~
>>>      cc1: all warnings being treated as errors
>>>
>>> which looks like a real problem: our phys_addr_t is only 32 bits now, so
>>> having 34-bit masks is just going to result in overflows.
>>>
>>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>> ---
>>> This is sort of a v2 of
>>> https://lore.kernel.org/r/20240729151652.15063-2-palmer@rivosinc.com,
>>> but I think that was just bogus.
>>> ---
>>>   arch/riscv/include/asm/sparsemem.h | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/riscv/include/asm/sparsemem.h b/arch/riscv/include/asm/sparsemem.h
>>> index 63acaecc3374..2f901a410586 100644
>>> --- a/arch/riscv/include/asm/sparsemem.h
>>> +++ b/arch/riscv/include/asm/sparsemem.h
>>> @@ -7,7 +7,7 @@
>>>   #ifdef CONFIG_64BIT
>>>   #define MAX_PHYSMEM_BITS	56
>>>   #else
>>> -#define MAX_PHYSMEM_BITS	34
>> I was trying to figure out why this was set to 34. It looks like that
>> comes from this patch (which heavily changed over the course of review)
>> [1] and the following text:
>>
>> "On the Sifive hardware this allows us to provide struct pages for
>> the lower I/O TileLink address ranges, the 32-bit and 34-bit DRAM areas
>> and 172GB of 240GB of the high I/O TileLink region. Once we progress to
>> Sv48 we should be able to cover all the available memory regions."
>>
>> Seems like the max should be 32 though so:
>>
>> Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
>>
>> Link: https://lore.kernel.org/all/20190327213643.23789-4-logang@deltatee.com/ [1]
>
>
> Actually sv32 supports 34-bit of physical address because of the PTE
> format which allows for 22-bits of PPN, so we should in theory set
> MAX_PHYSMEM_BITS to 34. Then it would work with CONFIG_PHYS_ADDR_T_64BIT
> enabled, but @Palmer told me that it breaks something and then it was
> disabled (I don 't have time to look into that). But even if that

IIRC the breakages were nothing exciting, just the usual pile of drivers 
that didn't support the 64-bit phys_addr_t on 32-bit targets.  There 
aren't a lot of 32-bit targets left these days, so rv32 picks up a bunch 
of noise.

> worked, we are not currently not implementing HIGHMEM so we cannot
> access all the memory anyway (and I think HIGHMEM was deprecated some
> time ago).
>
> So, as long as someone tackles the above, I agree with this patch:

You mean until someone tackles the above?  IIUC we'd end up broken 
without this patch, if anyone had 34-bit PAs they'd just get truncated.

>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Thanks,
>
> Alex
>
>
>>
>>
>>> +#define MAX_PHYSMEM_BITS	32
>>>   #endif /* CONFIG_64BIT */
>>>   #define SECTION_SIZE_BITS	27
>>>   #endif /* CONFIG_SPARSEMEM */
>>> --
>>> 2.45.2
>>>
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
