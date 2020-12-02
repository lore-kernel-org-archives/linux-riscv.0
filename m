Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F762C64E7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 19:44:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD9BE22201
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 19:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD9BE22201
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/AiYY+2uWNA9ztw7nHE6t8nvDy//tlgLXQE2KXara4E=; b=EcIKOZqzJWQvQMYeDEF51SqbM
	q6zKDuCS5Tr7gwl7/wfCGhC48D914QLkc/A67OsDtogv4ALxOk2XGewWR0b+oKXMtiyZJlzJakkzV
	alP8O7K4yy/8mkl0UD+wn3by87OQ/bd9U/I+cP6+o9/RO4uBwGrXVx83srIK0Xdw1qIDESXxWlAZ4
	1e2fvd9yH7U67tMfvZh4OwrnSCyH8Lm3g2zf+xGSVXD6PhV6VwbnTP75a9ukN0hx2wZs8E1YcpL9q
	CJZp+9VJtY6RFLmb6dEEs1aAWmNOHkhasaPSXy7JCIiySOvSA0ln0lo5W+gcjMHgrRSYYVL4kkY8K
	HbdwAadGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkY2y-0003uA-N1; Wed, 02 Dec 2020 19:44:16 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkY2v-0003se-Ik
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 19:44:16 +0000
Received: by mail-lj1-x244.google.com with SMTP id y10so5187438ljc.7
 for <linux-riscv@lists.infradead.org>; Wed, 02 Dec 2020 11:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7ASo7cCqcXZyF27JshUw9tbkwxz92r4JHPfrQwN2UAE=;
 b=imIWWEY0mN5B3vHaxTEjaQvhrDUR7Tu0ByKnzZSGuva5rE3l9WXlvNpn1pRZJHStz4
 7g/xc562ilJ/AKXLELFcWxann4x/PVmMDwiWOTxTLO37kyVi8tY/0QKVBAwYeZL7anec
 TyCLA/vl33wJhVYCS/mWWUbKGMfz5kismNzuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7ASo7cCqcXZyF27JshUw9tbkwxz92r4JHPfrQwN2UAE=;
 b=G55952fPMEiQ6TZsqleSJtrvx+sMFiD7hayf6dfEQpxIr/GgG2AVGypUHrKiOMXt1d
 vDbi+rjm+ARPbglNCKhSECSEJ8BJxby490/ABDhjWBdo+Y2XnXErBc0XjP7z2BQtXa/b
 352i+ZbRVbC95oBo9xdd+49ZBnsYjdcPdadTV6Mnn/dPU9EvrGpn+0nJRsA768kCbyEN
 YdrBgaE2WJNN4PzfqOTXmFUKu9Aj2Npaa8foL6m9Be5Ci1CH+UwE6gI7t+zanNmPwiXv
 QOzAoIyFzyEilHxMQ5lGyQOYKEOETIiYO5+EdNHXm1+ZdvEAWwfOAzXTr/uWVG887RR2
 DDIw==
X-Gm-Message-State: AOAM533eTSo3lgZlPFVeRNMG+ChmvZcYMzW4KJmy/tgTbN2L6ju8dmJx
 E4Ofn6fIGE9L/lpTdR+7Gm6wtdK23F1ruwQqRQNT0A==
X-Google-Smtp-Source: ABdhPJyb+Dc0VoTJrskKvre9Qz0z9lKQ/4uBTZcMF4TgMgma6EUQFJNr4Juf0rM8GGGrk1EMcgt0GjGMp3jZ6+Ef570=
X-Received: by 2002:a2e:8183:: with SMTP id e3mr1941702ljg.267.1606938251755; 
 Wed, 02 Dec 2020 11:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20201202150130.16936-1-vitaly.wool@konsulko.com>
 <5916q277-o720-n6q-9o2-oo9nsqr6q63q@syhkavp.arg>
In-Reply-To: <5916q277-o720-n6q-9o2-oo9nsqr6q63q@syhkavp.arg>
From: Vitaly Wool <vitaly.wool@konsulko.com>
Date: Wed, 2 Dec 2020 20:44:00 +0100
Message-ID: <CAM4kBBLSy=TJEFmzrdYCGHNLBBtnYYh64pFeYdh2Q7ytJvBwGg@mail.gmail.com>
Subject: Re: [PATCH] arch/riscv: enable XIP
To: Nicolas Pitre <nico@fluxnic.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_144413_788174_BD2689F6 
X-CRM114-Status: GOOD (  32.47  )
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
Cc: Bin Meng <bin.meng@windriver.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 2, 2020 at 7:06 PM Nicolas Pitre <nico@fluxnic.net> wrote:
>
> On Wed, 2 Dec 2020, Vitaly Wool wrote:
>
> > Introduce XIP (eXecute In Place) support for RISC-V platforms.
> > It allows code to be executed directly from non-volatile storage
> > directly addressable by the CPU, such as QSPI NOR flash which can
> > be found on many RISC-V platforms. This makes way for significant
> > optimization of RAM footprint. The XIP kernel is not compressed
> > since it has to run directly from flash, so it will occupy more
> > space on the non-volatile storage to The physical flash address
> > used to link the kernel object files and for storing it has to
> > be known at compile time and is represented by a Kconfig option.
> >
> > XIP on RISC-V will currently only work on MMU-enabled kernels.
> >
> > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
>
> That's nice!
>
> Suggestion for a future enhancement:
> To save on ROM storage, and given that the .data segment has to be
> copied to RAM anyway, you could store .data compressed and decompress it
> to RAM instead. See commit ca8b5d97d6bf for inspiration. In fact, many
> parts there could be shared.

Thanks! That's in my TODO list.

> More comments below.
>
> > +#define __XIP_FIXUP(addr) \
> > +     (((long)(addr) >= CONFIG_XIP_PHYS_ADDR && \
> > +       (long)(addr) <= CONFIG_XIP_PHYS_ADDR + SZ_16M) ? \
> > +     (long)(addr) - CONFIG_XIP_PHYS_ADDR + CONFIG_XIP_PHYS_RAM_BASE - XIP_OFFSET : \
> > +     (long)(addr))
>
> Here you should cast to unsigned long instead.

Right, or (just thought of it) uintptr_t for that matter. Does that sound right?

> > +#ifdef CONFIG_XIP_KERNEL
> > +     la a0, _trampoline_pg_dir
> > +     lw t0, _xip_fixup
> > +     add a0, a0, t0
> [...]
> > +_xip_fixup:
> > +     .dword CONFIG_XIP_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
> > +#endif
>
> Here _xip_fixup is a dword but you're loading it as a word.
> This won't work for both rv32 and rv64.

Well, at this point I believe it does, as long as we use little
endian. 64-bit version has been verified.
I do not argue though that it isn't nice and should be fixed.

> > +SECTIONS
> > +{
> > +     /* Beginning of code and text segment */
> > +     . = XIP_VIRT_ADDR(CONFIG_XIP_PHYS_ADDR);
> > +     _xiprom = .;
> > +     _start = .;
> > +     HEAD_TEXT_SECTION
> > +     INIT_TEXT_SECTION(PAGE_SIZE)
> > +     /* we have to discard exit text and such at runtime, not link time */
> > +     .exit.text :
> > +     {
> > +             EXIT_TEXT
> > +     }
> > +
> > +     .text : {
> > +             _text = .;
> > +             _stext = .;
> > +             TEXT_TEXT
> > +             SCHED_TEXT
> > +             CPUIDLE_TEXT
> > +             LOCK_TEXT
> > +             KPROBES_TEXT
> > +             ENTRY_TEXT
> > +             IRQENTRY_TEXT
> > +             SOFTIRQENTRY_TEXT
> > +             *(.fixup)
> > +             _etext = .;
> > +     }
> > +     RO_DATA(L1_CACHE_BYTES)
> > +     .srodata : {
> > +             *(.srodata*)
> > +     }
> > +     .init.rodata : {
> > +             INIT_SETUP(16)
> > +             INIT_CALLS
> > +             CON_INITCALL
> > +             INIT_RAM_FS
> > +     }
> > +     _exiprom = ALIGN(PAGE_SIZE);            /* End of XIP ROM area */
>
> Why do you align this to a page size?

TBH I just cut the corners here and below, did not have to worry about
partial pages and such.


> > +
> > +
> > +/*
> > + * From this point, stuff is considered writable and will be copied to RAM
> > + */
> > +     __data_loc = ALIGN(PAGE_SIZE);  /* location in file */
>
> Same question here?
>
> > +     . = PAGE_OFFSET;                /* location in memory */
> > +
> > +     _sdata = .;                     /* Start of data section */
> > +     _data = .;
> > +     RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
> > +     _edata = .;
> > +     __start_ro_after_init = .;
> > +     .data.ro_after_init : AT(ADDR(.data.ro_after_init) - LOAD_OFFSET) {
> > +             *(.data..ro_after_init)
> > +     }
> > +     __end_ro_after_init = .;
> > +
> > +     . = ALIGN(PAGE_SIZE);
>
> And again here?
>
> > +#ifdef CONFIG_XIP_KERNEL
> > +/* called from head.S with MMU off */
> > +asmlinkage void __init __copy_data(void)
> > +{
> > +     void *from = (void *)(&_sdata);
> > +     void *end = (void *)(&_end);
> > +     void *to = (void *)CONFIG_XIP_PHYS_RAM_BASE;
> > +     size_t sz = (size_t)(end - from);
> > +
> > +     memcpy(to, from, sz);
> > +}
> > +#endif
>
> Where is the stack located when this executes? The stack for the init
> task is typically found within the .data area. At least on ARM it is.
> You don't want to overwrite your stack here.

sp is set to within the .data area later, we rely on the u-boot sp
setting which is outside of the destination area for the image parts
that are copied. I agree that this makes the implementation fragile
and will explicitly set sp in the next path version.

Best regards,
   Vitaly

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
