Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2228CC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 21:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Odw7i8q4zn2RH3Q9d812l7Y8UuKLmFFyGMaTdZXgwEo=; b=OwufK6Eogvz/tsCjKS9erqA+7q
	3dp3JJHXC3OMSuKZYsJp58aHQjqsu86v+LaMnTwGqJLcBLRoJIdN/MmEoFq63xUoGceuh6TiqJf76
	EqQ5I7LblPqSnJg7mmGGzjc7Ru4wwyox90AMWfRZoGtYXJvFVXtp9q5YM7O9WwL9JK39j5O3xzj1F
	PEg3X+I6yf4//s492EsQ1FTWrauskrxjrU1dxn3KstzgTc3BP6BR1rbuaflVVseos4DNXOAfMM0pu
	aclJq+MTFH1asJGsTMNocT4fLZwKPEfBIwZUvdkZ7s9WzB197IQBWcWJD/gNMCyT0fOD+447mcwBw
	K0sMwsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkBzp-008Zat-6z; Thu, 28 Apr 2022 21:48:21 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkBzl-008ZZq-HR
 for linux-riscv@lists.infradead.org; Thu, 28 Apr 2022 21:48:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 iq2-20020a17090afb4200b001d93cf33ae9so8821707pjb.5
 for <linux-riscv@lists.infradead.org>; Thu, 28 Apr 2022 14:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=sLdFSM+gbbluSAusN2hlLl8hXUCFXq74MUxOmPI7lC0=;
 b=3c5J22p40msR1l4Xh1SUIN5QgolDrzxQVQG2JpLcEVDr9mNIJeAISUgdjeEfg1sJyi
 YL/8puFtsiANQ6jN74xg+Hp1RLFxl41WZ4wGvwETlk7A9r9pIpLJtq81CEkMEHo7ir6z
 PD4U3xSe9A0v4VdHDz/bVNlrA9NFKHBTQ7VXgy1HMVYmy68DRh1qk4rvKvHw50zqPRYQ
 NC/YJg+JCBA9uUTBlqOD9WqfZOEUAXg6Li01tkS+2A2TyMECJ/bcbRDjCwInb+27Yq1z
 gdmycesrmfxSR74zLeak0/mshq8XIL8hVLVMqH0zosqpFmlxRdeTyXenBQqp3mUCd+WW
 xkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=sLdFSM+gbbluSAusN2hlLl8hXUCFXq74MUxOmPI7lC0=;
 b=KqKhpJUEzOJDkMSE3DQ8wUKyfGUFQysg9tP0O2pXGXUZYKHO3IiuFxsUvoIa5waV7g
 nrtz++iWypBRr270hiAkRinFaIfm4y0Ji6EHeqCCW3uH8KL4zVZBuTMiofkSZDfVI40q
 m/HKMud1i5C3MTEsm6biEYp/jvniOvJmw4wyydqMCEZGAHP3bibKdjVHVxxpzL2aI5aW
 Nl2Ra4dS//1uiMWZa6RTfo8jDEfsHzighh8ZuAfkGzKdhC9PR7fIZSu1Ij5lqlTMqwbx
 Ugp5Fr6CrIM0cywH2zvNAhcVpLBWaSrk6ynjT8UH5FF3ee8baIDXbCCcXmvheD7sNdAC
 DpOw==
X-Gm-Message-State: AOAM532vu/TwnErl3VO54Pz9XVUjHBRNQxBg5HumncnFbMZJqyCXFsRO
 2PRSWJRsdS5HYQvcGDZQlDc6pw==
X-Google-Smtp-Source: ABdhPJyZ461f7KmmDTWkjWxNRvaneb+mjQfX0cue1QcDfBWULJ9LAvQD9+v472RbAJl4R22HUghsdg==
X-Received: by 2002:a17:90b:4b4f:b0:1db:d2ac:8f8c with SMTP id
 mi15-20020a17090b4b4f00b001dbd2ac8f8cmr306376pjb.237.1651182495382; 
 Thu, 28 Apr 2022 14:48:15 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 l22-20020a17090a071600b001d9781de67fsm7631976pjl.31.2022.04.28.14.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 14:48:14 -0700 (PDT)
Date: Thu, 28 Apr 2022 14:48:14 -0700 (PDT)
X-Google-Original-Date: Thu, 28 Apr 2022 14:48:01 PDT (-0700)
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
In-Reply-To: <8491e0c3-3e6e-325e-0cc1-5b237ce4f9fd@ics.forth.gr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-9aafbd90-eb33-4f43-afa3-b9f9338c2a70@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_144817_781076_FC777A98 
X-CRM114-Status: GOOD (  22.84  )
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

On Mon, 25 Apr 2022 23:11:23 PDT (-0700), mick@ics.forth.gr wrote:
> Hello Palmer,
>
> Any updates on this ?

Sorry about that, it's on fixes.

>
> Regards,
> Nick
>
> On 3/22/22 15:28, Nick Kossifidis wrote:
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
