Return-Path: <SRS0=iP4b=E3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95598C63798
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 02:03:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3ECE922202
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Nov 2020 02:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pVqDDi6x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="sU0r9VvK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3ECE922202
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=8UZ5vyHJv9BjPoDzSTMtnjR0X8ouOwWC+Ec8WTliMb0=; b=pVqDDi6xutZ3z6rRQrxn6gOqH
	XdQT3xXOSHXhBslDazQ/fSm7boPkeVLieLTgA5TMiP7Bt3dFHi4s1/HTRyL6HtRbGMWOxWPNUJGBo
	Q5txwmbGKOttmnTn1/7aY9faqbScVGE7kE34fRZsPOfhqO0zRv4P/KdOiQOc1L6SKxHrXAr4Z7oRz
	Do8pbkeNTd7a7x3u6QG82ebeLSXM3IBR+5KEB0Qw5eI+GAusukxemXCQI7/pCdjanDlkqScql/jiw
	zQLWWu9jeWW1imV9fThSR++nvEz+of4LcVmmBF2b58BIG/rZV9TFnp1ZZmoC0FV7os0+D2UULvMkr
	LPInGpxog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgIFA-00060w-Iw; Sat, 21 Nov 2020 02:03:16 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgIF8-000609-Ry
 for linux-riscv@lists.infradead.org; Sat, 21 Nov 2020 02:03:15 +0000
Received: by mail-pg1-x543.google.com with SMTP id 34so8873997pgp.10
 for <linux-riscv@lists.infradead.org>; Fri, 20 Nov 2020 18:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5DPY1vOx809P/ji7WSLS+HQRWX/oPac7tdMVbcbRAD4=;
 b=sU0r9VvKPnh4YqmU6bjUbLanlL4K5gqvIvr35TrwINX52vvHu0W9Ffeo2kCIQTseit
 hM7y2s71tBb16iSHBhwD8sebf6akIouY/u4LgVglhHYeoQKYKKNoi8dQND3iKdiNT/6V
 VjzxmAdLdQlBJ2eC5wf+YxfqPmJDRCngz/XV4+s2/EznGKjB5lepnF16Cbx1Tx+jLAxB
 0ltxlvqw0ZXbPc8I1WJxcyUs8yXrWOKJ7zyNYqQAqfVQtGstg1eUxJAusRCBnKcZrtJD
 gxa4oPeT6uHoVmZzyTj0etq/j7PJ0butKBRnCGr+8fPreFxnwZj3vFaflQkK5rSBAi8s
 bFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5DPY1vOx809P/ji7WSLS+HQRWX/oPac7tdMVbcbRAD4=;
 b=S27r3v/xCTXqjd4Sev28EXRuj/Z2AjaghkKcY2qviecV1ok0bNnbu14q2xi5zymkhd
 cOr7l0jtrg0/m4F0mRfDW3CV25TVZ9I/g6Cit0hhmm2/yEaSON/nnLyd9NihAwFi8Jy4
 Ia4+9sRTiwEWZgx1tiKXbOrOGo+LY7N7DfT4T0nLRmumXOktyauwLT/wrqYqbtPFtH1D
 puV6NRMGUfytWbJLTv94mtVyQW9MQnkcCCT9LBL3mpE/L6TQJE2iZ1a3ZO6fjCP8mKup
 z2cFjhlh2E3BEFVbJ0mX+PpXLm3FSJOMMwefL4GH5I6zGg8uXxCpYvF+gNdVl7Uff2mZ
 vQ+A==
X-Gm-Message-State: AOAM533pwGLKGEUxgErkXjBOL/Rl7VyDwXvACQru439D0wUHJslXio8I
 7gF/0QgPvaRJtTweYRlmRBERNQ==
X-Google-Smtp-Source: ABdhPJyDP14AkgYpCgCR3YmCIbHfRj/o+Sq/K/gMiCMNAJo3ao8Juz4+eHDuhWxUATxv0ZoYRlNQmQ==
X-Received: by 2002:a65:6299:: with SMTP id f25mr8544549pgv.402.1605924192244; 
 Fri, 20 Nov 2020 18:03:12 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m9sm5924464pjf.20.2020.11.20.18.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 18:03:11 -0800 (PST)
Date: Fri, 20 Nov 2020 18:03:11 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 17:59:30 PST (-0800)
Subject: Re: [PATCH] riscv: Enable CMA support
In-Reply-To: <dfaee222-59a6-7a47-f174-046ff2c13e95@huawei.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-a2fc73b4-833b-46c3-aa5c-e1d09a69accb@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_210314_939117_71DA0534 
X-CRM114-Status: GOOD (  17.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 12 Nov 2020 00:55:30 PST (-0800), wangkefeng.wang@huawei.com wrote:
> Any comments, kindly ping...

Sorry, I must have missed this one.  It's on for-next.  Thanks!

>
> On 2020/10/31 14:01, Kefeng Wang wrote:
>> riscv has selected HAVE_DMA_CONTIGUOUS, but don't call
>> dma_contiguous_reserve(). let's enable CMA as expect.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   arch/riscv/mm/init.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index ea933b789a88..87ae4b99442a 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/of_fdt.h>
>>   #include <linux/libfdt.h>
>>   #include <linux/set_memory.h>
>> +#include <linux/dma-map-ops.h>
>>
>>   #include <asm/fixmap.h>
>>   #include <asm/tlbflush.h>
>> @@ -41,13 +42,14 @@ struct pt_alloc_ops {
>>   #endif
>>   };
>>
>> +static phys_addr_t dma32_phys_limit __ro_after_init;
>> +
>>   static void __init zone_sizes_init(void)
>>   {
>>   	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
>>
>>   #ifdef CONFIG_ZONE_DMA32
>> -	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G,
>> -			(unsigned long) PFN_PHYS(max_low_pfn)));
>> +	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(dma32_phys_limit);
>>   #endif
>>   	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
>>
>> @@ -185,6 +187,7 @@ void __init setup_bootmem(void)
>>
>>   	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
>>   	max_low_pfn = max_pfn;
>> +	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
>>   	set_max_mapnr(max_low_pfn);
>>
>>   #ifdef CONFIG_BLK_DEV_INITRD
>> @@ -198,6 +201,7 @@ void __init setup_bootmem(void)
>>   	memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>>
>>   	early_init_fdt_scan_reserved_mem();
>> +	dma_contiguous_reserve(dma32_phys_limit);
>>   	memblock_allow_resize();
>>   	memblock_dump_all();
>>   }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
