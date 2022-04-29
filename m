Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BFBC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 15:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EZbetuxMEE/V6QUzMiNk15kUj3iJ2iL0BCU5YjDlIUU=; b=biz/Bz0f1viT+NGcOqtiIc7AyB
	IqxsoR36kaPOOirHIA1s9k394n34JetAV2J/GDUQlMY23FCwdQQeyH/IeiHxx5Cw0gto3BFMtkAoz
	AS7OW39jTCAWedXvysXyNQFY+woNlWg/MTAXOObkuVE+iptnDbk/282XuMYeQgcwOy7XsWHtziJDO
	LFbmgXFzFnK7yPRa+LOn/QfHJ34R3hEqqGblCr7xhRGr2bZ6rRI8mIGaMY8HhdzesODI4/97l86yo
	ZyZlrBQSiBJ9cM9xXenZ3lcxA00Cw46MsS6ysAYPIpcHQ6PAVimyjNAmXEGSMLOMR2cYMJJ0YM84K
	qxPdEw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkSXy-00BmGk-UG; Fri, 29 Apr 2022 15:28:42 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkSXt-00BmFF-Ms
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 15:28:41 +0000
Received: by mail-pg1-x529.google.com with SMTP id bg9so6783234pgb.9
 for <linux-riscv@lists.infradead.org>; Fri, 29 Apr 2022 08:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=e37KpWOvnJl8DV6RpvFm8R8ciIf9e11j1e98qdA+nR0=;
 b=CQH14jLE8Ms+j8J1oP8clFORtMf0mx0Gh4b+0HDNYIdpNqAe7n8P3wKFp+gPmBt4C2
 XGh14y7IZWaD/d1rfA5DQcS1OJMA/A89Ahx765rBST+rLzMPQKxuGe47JP9qORF7tHsu
 0vLmqZAjh4Z4o4FaPUwFm3n74p6oo5io3GYhFz8FjY1dsOISjYDkrBzh72QbOfO3q3+R
 tnq81POYf+Q1TKbz/w6ZQ3lVKILKwFfBsLJPMqOrTbYtPEgJ87ITuyvw3V0UMTCBPojD
 gLqEgErM/FJraX1LagRCx1d20ZNyakv3/QZlO8Z+a1+Gbat/3H6QYtbAtIzAokzNNuL7
 EHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=e37KpWOvnJl8DV6RpvFm8R8ciIf9e11j1e98qdA+nR0=;
 b=106QajanyqP/1xligRM504MjsAHUhjH1MObXsMCCV3k70oeUcjn3+xseaVhNgG6QdC
 zP06lVfq7qYPnBU5PHyxX0CKKAw64jM58dAP030cS7eBWtDKEOR3VVa50Vua9KJt18YH
 rb40JwpxLXPDfuWKHNCXHp+45YvbJ9evx9QhpZG0I3R1d2/nlBZaWe4xdDd42+Nx9w8m
 lqGHmkqtxqvXt/aNejAVDtLCWOHP1mJL9VHpKycQBRlyGp/qiLpq+5qSBboS9UmBtP8v
 g8rtkNQqiO6i2jfNlCse/kBvsv/mDJ/QjcI6MLFsNSMYU1O/9k9VLfTtKfIUHXc3ahdw
 tqCA==
X-Gm-Message-State: AOAM533W64iILETby2WZ9nPgn8HUQUNcT5sGbbLrGIoS3ddxOeAxDjIY
 DkMqQImkhPtxhGZvfLSeH+A/aQ==
X-Google-Smtp-Source: ABdhPJzo5Fg9L/6IHNj66qUgf0n1g8y00zwYhwFSYEOwGBZ58KZH+MxD4trY5ygLoSvgdmUYu2btMg==
X-Received: by 2002:a63:e513:0:b0:3ab:a3fb:f100 with SMTP id
 r19-20020a63e513000000b003aba3fbf100mr13900099pgh.70.1651246115507; 
 Fri, 29 Apr 2022 08:28:35 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 m1-20020a637d41000000b003c14af5063esm6628648pgn.86.2022.04.29.08.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 08:28:34 -0700 (PDT)
Date: Fri, 29 Apr 2022 08:28:34 -0700 (PDT)
X-Google-Original-Date: Fri, 29 Apr 2022 08:12:57 PDT (-0700)
Subject: Re: [PATCH] RISC-V-fixes: relocate DTB if it's outside memory region
In-Reply-To: <mhng-9aafbd90-eb33-4f43-afa3-b9f9338c2a70@palmer-ri-x1c9>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: mick@ics.forth.gr
Message-ID: <mhng-6c123e84-9530-46f6-a5ec-6b908bb92f95@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_082837_973970_83F236A4 
X-CRM114-Status: GOOD (  24.07  )
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

On Thu, 28 Apr 2022 14:48:14 PDT (-0700), Palmer Dabbelt wrote:
> On Mon, 25 Apr 2022 23:11:23 PDT (-0700), mick@ics.forth.gr wrote:
>> Hello Palmer,
>>
>> Any updates on this ?
>
> Sorry about that, it's on fixes.

Not sure if I just wasn't paying attention yesterday or if I'm grumpier 
this morning, but that "RISC-V-fixes: " prefix is just a bit too odd -- 
I know we've got a split between "RISC-V" and "riscv" so maybe it 
doesn't matter, but even that is kind of ugly.

I re-wrote it, but I'm going to let it round trip through linux-next so 
I'll send it up next time.

Sorry, I know this happened twice recently but I'll try not to make a 
habit of it.

>
>>
>> Regards,
>> Nick
>>
>> On 3/22/22 15:28, Nick Kossifidis wrote:
>>> In case the DTB provided by the bootloader/BootROM is before the kernel
>>> image or outside /memory, we won't be able to access it through the
>>> linear mapping, and get a segfault on setup_arch(). Currently OpenSBI
>>> relocates DTB but that's not always the case (e.g. if FW_JUMP_FDT_ADDR
>>> is not specified), and it's also not the most portable approach since
>>> the default FW_JUMP_FDT_ADDR of the generic platform relocates the DTB
>>> at a specific offset that may not be available. To avoid this situation
>>> copy DTB so that it's visible through the linear mapping.
>>>
>>> Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
>>> ---
>>>   arch/riscv/mm/init.c | 21 +++++++++++++++++++--
>>>   1 file changed, 19 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>> index 0d588032d..697a9aed4 100644
>>> --- a/arch/riscv/mm/init.c
>>> +++ b/arch/riscv/mm/init.c
>>> @@ -206,8 +206,25 @@ static void __init setup_bootmem(void)
>>>   	 * early_init_fdt_reserve_self() since __pa() does
>>>   	 * not work for DTB pointers that are fixmap addresses
>>>   	 */
>>> -	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
>>> -		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>>> +	if (!IS_ENABLED(CONFIG_BUILTIN_DTB)) {
>>> +		/*
>>> +		 * In case the DTB is not located in a memory region we won't
>>> +		 * be able to locate it later on via the linear mapping and
>>> +		 * get a segfault when accessing it via __va(dtb_early_pa).
>>> +		 * To avoid this situation copy DTB to a memory region.
>>> +		 * Note that memblock_phys_alloc will also reserve DTB region.
>>> +		 */
>>> +		if (!memblock_is_memory(dtb_early_pa)) {
>>> +			size_t fdt_size = fdt_totalsize(dtb_early_va);
>>> +			phys_addr_t new_dtb_early_pa = memblock_phys_alloc(fdt_size, PAGE_SIZE);
>>> +			void *new_dtb_early_va = early_memremap(new_dtb_early_pa, fdt_size);
>>> +
>>> +			memcpy(new_dtb_early_va, dtb_early_va, fdt_size);
>>> +			early_memunmap(new_dtb_early_va, fdt_size);
>>> +			_dtb_early_pa = new_dtb_early_pa;
>>> +		} else
>>> +			memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
>>> +	}
>>>
>>>   	early_init_fdt_scan_reserved_mem();
>>>   	dma_contiguous_reserve(dma32_phys_limit);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
