Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D23C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 06:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WZCQ3e3oKdRrRMLZ+4raGRObRKQb3IzTr85eQ5v/jnc=; b=g3PFX0UPPqv0LCb2UWwcX3ZLm0
	ywUGGVj+/MHwDUl+XGTiP6YCrnApPAu8e7v81h1DjF7FuIaIKNAxufu7dDbBXHv1R/u7h86knlp7w
	6VQeQiISyCqi4bn2TGWWQ3oZTqD9ftOcYhbZaKCg5xH8dlyV16hQs7ubagvDTTk1MJ2xAj1dYjDQ9
	1X6TfX9QDnZrE6+4Av7VswdmRDF4eD7s7qx0Ti7v35I3S4yOZvGSCN4/x9CPEZUC8gunKq3SUGijO
	yZoE9JOm3i3HECtIuxO9nedmUeKeeEMicbTO//ZrO6VifTAbN4BohGNw8P5KM29lBqTxMdXQEc2ju
	bTVbr+qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oztyD-006ddh-D6; Tue, 29 Nov 2022 06:19:53 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oztyA-006ddA-QE
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 06:19:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id o1so8191829pfp.12
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 22:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Js0gjBDbKbtqPXIM6JUxOixe0lBD0tB094nYU6rVat4=;
        b=lroD57v9dEwAtg03ZhTXdQVAU62o8N3hc1+1J3GmPygGKeKNKWfSVmyPN00vKFi2z5
         EOwhWKYA1qwCajZAq9Ahuk4ndxpWPWNUerYRgOUz4mbTnYMD23Ua4MyRwqgijrPn4YJD
         ytZOfDm8XFJvWEjHVH1c/CHwtIpvJaEHdTkKWH/au3ux3W53hj+0qPD4Ov82wHFvhT6a
         CPN9YyPhForjqSH6ZFXJY8o9gRwCEcmQ91maHjBwMWRUUZN55hu0sMzokyrS0rR62wJd
         CYpEIsPd6le7aHoyReaThQL2U/6NHq2ZZOY6YzpVH8jLc6sn1lrDQj9UyxjmCr4nO4hg
         UYoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Js0gjBDbKbtqPXIM6JUxOixe0lBD0tB094nYU6rVat4=;
        b=KVq/oFucHfX58ojCmvPKtNF8gN2NuQbPJzaBpd/QWHvTdnl+QbttBnjEkeMKLOpcN4
         hKD7PLSGbw9rXo/Lgp0phQw7I8sAFLDGG472wpvzDXuiPElSR08lGMBZ9c6kIYsewhEN
         bNiPKht73/A4bT/zyiNexmrDrYWtlGGJefFczbCWDuiK4elfKD4YEDC37NJP2PmwpDSR
         aCYPXuDySgHb7MvZ83qDglIzK5M2aTEQODxlO66+klTDjbxWXWag3YvxgFjce/ZT46IB
         AuIwoiqysedxiLSuYhsxucbyK30npAG8MKLe0QKsq0s8KofW0qLRau+Te5MIBwV2JjU0
         aApQ==
X-Gm-Message-State: ANoB5pnbGPE+QlUxsed8mXA1DZfzd8Gh9lU8acaodsVREeMxynIku6SX
	NlfQneTsVoxkdtR/sq4MwuzTBA==
X-Google-Smtp-Source: AA0mqf7ObivVlU4fuy6F28U1PSVzLyklT9l23bm8wub4SB0w+TZpWEBr+l7jKVXQTxEcbKjZ/glNYQ==
X-Received: by 2002:a05:6a00:1f0f:b0:56e:7424:bc0f with SMTP id be15-20020a056a001f0f00b0056e7424bc0fmr45342930pfb.11.1669702787331;
        Mon, 28 Nov 2022 22:19:47 -0800 (PST)
Received: from localhost ([135.180.226.51])
        by smtp.gmail.com with ESMTPSA id p22-20020a63f456000000b0046ff3634a78sm7714484pgk.71.2022.11.28.22.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 22:19:46 -0800 (PST)
Date: Mon, 28 Nov 2022 22:19:46 -0800 (PST)
X-Google-Original-Date: Mon, 28 Nov 2022 22:19:21 PST (-0800)
Subject: Re: [PATCH] riscv: head: use 0 as the default text_offset
In-Reply-To: <e39851df-251d-662d-3319-af9d948a9430@sholland.org>
CC: Atish Patra <atishp@rivosinc.com>, jszhang@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel@sholland.org
Message-ID: <mhng-028a3e75-6cd0-4775-ac68-3e0eb70c91ae@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_221950_874280_1C37EA87 
X-CRM114-Status: GOOD (  31.49  )
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

On Mon, 28 Nov 2022 21:04:48 PST (-0800), samuel@sholland.org wrote:
> On 11/28/22 14:11, Atish Kumar Patra wrote:
>> On Mon, Nov 28, 2022 at 7:34 AM Jisheng Zhang <jszhang@kernel.org> wrote:
>>>
>>> Commit 0f327f2aaad6 ("RISC-V: Add an Image header that boot loader can
>>> parse.") adds an image header which "is based on ARM64 boot image
>>> header and provides an opportunity to combine both ARM64 & RISC-V
>>> image headers in future.". At that time, arm64's default text_offset
>>> is 0x80000, this is to give "512 KB of guaranteed BSS space to put
>>> the swapper page tables" as commit cfa7ede20f13 ("arm64: set TEXT_OFFSET
>>> to 0x0 in preparation for removing it entirely") pointed out, but
>>> riscv doesn't need the space, so use 0 as the default text_offset.
>>>
>>> Before this patch, booting linux kernel on Sipeed bl808 M1s Dock
>>> with u-boot booti cmd:
>>> [    0.000000] OF: fdt: Ignoring memory range 0x50000000 - 0x50200000
>>> ...
>>> [    0.000000]   DMA32    [mem 0x0000000050200000-0x0000000053ffffff]
>>> As can be seen, 2MB DDR(0x50000000 - 0x501fffff) can't be used by
>>> linux.
>>>
>>> After this patch, the 64MB DDR is fully usable by linux
>>> [    0.000000]   DMA32    [mem 0x0000000050000000-0x0000000053ffffff]
>>>
>>> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>>> ---
>>>  arch/riscv/kernel/head.S | 12 +-----------
>>>  1 file changed, 1 insertion(+), 11 deletions(-)
>>>
>>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>>> index b865046e4dbb..ef95943f7a70 100644
>>> --- a/arch/riscv/kernel/head.S
>>> +++ b/arch/riscv/kernel/head.S
>>> @@ -38,18 +38,8 @@ ENTRY(_start)
>>>         .word 0
>>>  #endif
>>>         .balign 8
>>> -#ifdef CONFIG_RISCV_M_MODE
>>> -       /* Image load offset (0MB) from start of RAM for M-mode */
>>> +       /* Image load offset (0MB) from start of RAM */
>>>         .dword 0
>>> -#else
>>> -#if __riscv_xlen == 64
>>> -       /* Image load offset(2MB) from start of RAM */
>>> -       .dword 0x200000
>>> -#else
>>> -       /* Image load offset(4MB) from start of RAM */
>>> -       .dword 0x400000
>>> -#endif
>>> -#endif
>>
>> NACK.
>> RV64 needs to boot at a 2MB aligned address and RV32 needs to boot at
>> a 4MB aligned address.
>> The firmware is assumed to live at the start of DRAM for Linux running
>> in S-mode.
>
> What needs to happen so we can stop making this assumption? If the SBI
> implementation wants to reserve memory, it should use the devicetree to
> do so. OpenSBI already does this.

IMO we've really screwed up the boot flow on RISC-V.  Having Linux 
reserve space for the firmware is just all backwards, Linux can't know 
how much memory the firmware needs (which manifests under large hart 
counts in OpenSBI, for example).  Unfortunately there's no specification 
that defines these platform-level details, so we're stuck depending on  
unspecified behavior like this.

I think we could fix this by either making Linux's early boot relocation 
code work sanely (fix whatever bugs are there, document what can't be 
fixed, and then add some sort of Image flag to tell firmware the kernel 
can be relocated) or relying on relocatable firmware, but both of those 
come with some costs ...

> Throwing away 2 MiB of RAM is quite wasteful considering we have
> multiple SoCs (D1s, BL808) that are limited to 64 MiB of in-package RAM.

... and I'd argue that users on systems don't want to pay those costs.  
In fact, I'd argue that systems like that don't want resident firmware 
at all.

So let's just add a CONFIG_SBI=n, and then just use direct drivers for 
everything.  If the firmware doesn't need to be resident then it's 
pretty straight-forward to support these 0 offsets, so we can just add 
that as another Kconfig.  Sure this will trip up firmware that depends 
on these fixed reservations, but saying "the resident firmware fits in 0 
superpages" is just as much of a platform-specific dependency as saying 
"the resident firmware fits in 1 superpage".  If firmware can't handle 
this field in the Image format then we're going to end up with breakages 
at some point, it might as well be now.

If these systems don't have all the ISA bits necessary to avoid M-mode 
entirely then we can just implement a tiny M-mode stub in Linux that 
gets left around during early boot and then shims stuff to S-mode.  
That'll be a bit of a headache and with some extensions it can be 
avoided, the standard stuff won't allow for that until the latest round 
of specs is done but if it's possible via whatever custom extensions are 
in these things then that's probably the way to go.

We'll probably also end up shaking out some bugs in that early 
relocation code, but again no big deal: we'll need to chase those down 
at some point, it might as well be now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
