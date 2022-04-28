Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F0BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AbrUYO3atda5w2mSbe+YanpwcYjHq2Xaa7eaK9YeqiU=; b=nkMOX7KRhG+jc6gyBtR63ILl9J
	8NFRNuJ/nbsH9ZUxXFB+ltF32+qjnykzeEc2YYXK8QX4IomPFjkFCiAXrbiXRTJCXEx7Narkt/kO0
	lE1hq5EDVxQsPxFQP4qTKAWnMdBQXKWt3PegWs/+BOLEfZ1bKmliBrAmV0CmLo6HrZYJlryV9BdDC
	V6UD5hnAvvd48c6kLjquV7R9r0FZDKIgeRQr0w2FP7haIfcGmFmpoxSV1ZCzJg/BzEm3upY0PAgXR
	5E6SFzjIQejUiDjplMwBAVK4fD2DWOikkugdv1PlT1Vpo39giD2AukEw4ydUU3y5Szu6xcxctoR/P
	doGYAmbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkBzq-008Zbz-Lk; Thu, 28 Apr 2022 21:48:22 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkBzl-008ZZm-FM
 for linux-riscv@lists.infradead.org; Thu, 28 Apr 2022 21:48:19 +0000
Received: by mail-pj1-x102d.google.com with SMTP id iq10so5467425pjb.0
 for <linux-riscv@lists.infradead.org>; Thu, 28 Apr 2022 14:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6aiXY/c63MQElXVJZh4bp/etzqtyXVUX7hMM9mMLHGU=;
 b=CDsBib5aq7IfrlvyLb8w8JRjnuqiDUws2JBZNYWpIl+AzVDEcfcTizafbjhpqg0ZLx
 I7GTVsj6m9m6GY+fweX99+VGrsy2+dXb87n+3GxlYaXfih9dCeTEP4/5cJpUSeAI57mz
 u8/hiPJbx1G8a5A12C3DNrTZ6wtLaE90WGWuzrKwRplGHAQPknvu0oDde4DP7bj4WwJK
 Ng7pi649QKwig8o4B4iAOTrzskyaaU7F/P6lmynpCBcLZ2Z1RUkgQnhCDZ5UBnCSNcvF
 RKnZpRZmScCTudvfxfBPgjg3myOhVFe1BHRzg2DGkNXHdN0YOrg+HqCGCGLpL1Gv4EVh
 W6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6aiXY/c63MQElXVJZh4bp/etzqtyXVUX7hMM9mMLHGU=;
 b=LBstYKWD98/ooIG4pUxhWZBoe3mFRomaWXsIoNf0JfexpXKoG2DrdENexqHDSohxzc
 0Nih6RTzFUjYwrDyHWIUv+UUr2IcXYaw7O9cpzgql53mw5NnrfI6eNznWYv5K/ybrFx+
 WJfh8LJTCucnH6mizcxiQUWhO46JNgZOpZ/L1XauR9lqwec8pSH3mNN4rNSeZW/PHWoN
 UYqNt3mYnRUHP9TrWUpaZDgPN0nVLdy0d4f2FgTjvcxeTRZ5RGo7Xom4FGDFUDzYON2B
 ItScwYxuQmNhiT3HCrCvy9c+w2iyuM8/lgJ1EgQoMQzmWvs6uumvDZe12T1IuFWlqp18
 aiAw==
X-Gm-Message-State: AOAM533LI0KvAomhI/RQkoALVy+AMWXqCGl8WYA7ybPqKd8oTCWOWu7I
 EQCnAZS85hZmkQr7SQCPxeUk2w==
X-Google-Smtp-Source: ABdhPJy8Q8A0jLt1ox9LopY9ts+S70U0VlX1tlbLstodvaNMSxFJhocQiO6iKxVYqE0ssmlm72i2vA==
X-Received: by 2002:a17:902:dac1:b0:15d:356:887c with SMTP id
 q1-20020a170902dac100b0015d0356887cmr24921840plx.78.1651182493502; 
 Thu, 28 Apr 2022 14:48:13 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 a8-20020a17090a6d8800b001cd4c118b07sm8048593pjk.16.2022.04.28.14.48.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 14:48:12 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:48:12 -0700 (PDT)
X-Google-Original-Date: Thu, 28 Apr 2022 13:25:03 PDT (-0700)
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
In-Reply-To: <ebaa9b4e-9e37-e2f4-2bee-37d324e7302b@microchip.com>
CC: mick@ics.forth.gr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor.Dooley@microchip.com
Message-ID: <mhng-525e0b77-f9af-4cba-a985-f8872835574e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_144817_780981_86B6D1AF 
X-CRM114-Status: GOOD (  25.83  )
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

On Thu, 24 Mar 2022 02:37:29 PDT (-0700), Conor.Dooley@microchip.com wrote:
> 
> On 22/03/2022 13:28, Nick Kossifidis wrote:
>> In case the DTB provided by the bootloader/BootROM is before the kernel
>> image or outside /memory, we won't be able to access it through the
>> linear mapping, and get a segfault on setup_arch(). Currently OpenSBI
>> relocates DTB but that's not always the case (e.g. if FW_JUMP_FDT_ADDR
>> is not specified), and it's also not the most portable approach since
>> the default FW_JUMP_FDT_ADDR of the generic platform relocates the DTB
>> at a specific offset that may not be available. To avoid this situation
>> copy DTB so that it's visible through the linear mapping.
>> 
>> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
> 
> Albeit in a backport, I tested this on a PolarFire SoC based board.
> So I guess, Tested-by: Conor Dooley <conor.dooley@microchip.com>

My scripts don't pick these up unless they're on their own line, not 
sure if that's too conservative but it's on purpose.  I just sort of 
stumbled into this one so it's in.

> 
> And a lot cleaner than using create_pgd_mapping in setup_vm_final to do it :)
> 
> Thanks,
> Conor.
> 
>> ---
>>   arch/riscv/mm/init.c | 21 +++++++++++++++++++--
>>   1 file changed, 19 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>> index 0d588032d..697a9aed4 100644
>> --- a/arch/riscv/mm/init.c
>> +++ b/arch/riscv/mm/init.c
>> @@ -206,8 +206,25 @@ static void __init setup_bootmem(void)
>>   	 * early_init_fdt_reserve_self() since __pa() does
>>   	 * not work for DTB pointers that are fixmap addresses
>>   	 */
>> -	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
>> -		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>> +	if (!IS_ENABLED(CONFIG_BUILTIN_DTB)) {
>> +		/*
>> +		 * In case the DTB is not located in a memory region we won't
>> +		 * be able to locate it later on via the linear mapping and
>> +		 * get a segfault when accessing it via __va(dtb_early_pa).
>> +		 * To avoid this situation copy DTB to a memory region.
>> +		 * Note that memblock_phys_alloc will also reserve DTB region.
>> +		 */
>> +		if (!memblock_is_memory(dtb_early_pa)) {
>> +			size_t fdt_size = fdt_totalsize(dtb_early_va);
>> +			phys_addr_t new_dtb_early_pa = memblock_phys_alloc(fdt_size, PAGE_SIZE);
>> +			void *new_dtb_early_va = early_memremap(new_dtb_early_pa, fdt_size);
>> +
>> +			memcpy(new_dtb_early_va, dtb_early_va, fdt_size);
>> +			early_memunmap(new_dtb_early_va, fdt_size);
>> +			_dtb_early_pa = new_dtb_early_pa;
>> +		} else
>> +			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>> +	}
>>   
>>   	early_init_fdt_scan_reserved_mem();
>>   	dma_contiguous_reserve(dma32_phys_limit);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
