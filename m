Return-Path: <SRS0=xwCb=FG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B88C64E7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 20:03:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AD5421527
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Dec 2020 20:03:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AD5421527
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fluxnic.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oCffIyrAal9v3TXaEcoosezfZhiDVDBYmxUAUUWRklw=; b=uXQT3DGt4BiVGEnjkZ46KVXZz
	UNhtsB9x4fpsZdq5S2q0xDg0pZMzT/kvMzI9+SPidqduhxn1EAyZmHhNAB4CEU8M4IApvN9ZH5nHT
	g5bNoZabcJJdW8DdvIax7uv3JTsjgmbwG7m1R59xU581M4A7A0mN407Xker0JWHsA9EWlgOrkm3dI
	HQdTCNYQnZdG2CUMgrucfzi/N4eQbAhptaN2JRmXUQhrZoxL130usHOrso8dvEVI20PIebwf63DMq
	AQqxNdt/kaTh9dT9SLpZfPCwbKZ1JTPnHfqmtY3B4gAKDGtUEZ3u8veXtPs0uqK0XwZlUakBpBFeU
	PG9Xl0IFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkYLI-00063l-SG; Wed, 02 Dec 2020 20:03:12 +0000
Received: from pb-smtp21.pobox.com ([173.228.157.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkYLF-000623-4g
 for linux-riscv@lists.infradead.org; Wed, 02 Dec 2020 20:03:10 +0000
Received: from pb-smtp21.pobox.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 5436DFD5B6;
 Wed,  2 Dec 2020 15:03:06 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
 :cc:subject:in-reply-to:message-id:references:mime-version
 :content-type; s=sasl; bh=bBIuNaNXCoxrC1Or6o8GInkYmVQ=; b=WMV49c
 H/fdBImQ10kburu++8LqB/TzYs8XY8dAXhvwH1zp/KwH/OTqlg5/BgenLfVCmTOR
 arlXoxSf1QZDC/FbZ3s49y6cv6b89S5+g7AuDGan7H+Jmxhghl6NmGxIvi8Hr+d4
 p9ExsjYGXv30gb3JfvBCOkhTfg8/DEkQENcFo=
Received: from pb-smtp21.sea.icgroup.com (unknown [127.0.0.1])
 by pb-smtp21.pobox.com (Postfix) with ESMTP id 4C934FD5B5;
 Wed,  2 Dec 2020 15:03:06 -0500 (EST)
 (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type;
 s=2016-12.pbsmtp; bh=LiILUzwhqrFKVhBF/6z0N+B1dqKmy2+793gMCx1UQG0=;
 b=jj31JKGSbsWB9cs8u79OrUIKBFbHRPPPItq83KX/2bc4Hi9ztwDLZLvddSSv7nu89aidB1hnzRQcVa4JeFQ75B4OOfJQwvkgs2h6PUt2eKiP5a/J4YwMB+SM/v4c0Nu4hoR8wdhwkrm9FoZXBiOC7PJVwvLXRbmxBtfnybCnZ58=
Received: from yoda.home (unknown [24.203.50.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by pb-smtp21.pobox.com (Postfix) with ESMTPSA id 3B1D7FD5B1;
 Wed,  2 Dec 2020 15:03:03 -0500 (EST)
 (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
 by yoda.home (Postfix) with ESMTPSA id 4BB1F2DA0208;
 Wed,  2 Dec 2020 15:03:01 -0500 (EST)
Date: Wed, 2 Dec 2020 15:03:01 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Subject: Re: [PATCH] arch/riscv: enable XIP
In-Reply-To: <CAM4kBBLSy=TJEFmzrdYCGHNLBBtnYYh64pFeYdh2Q7ytJvBwGg@mail.gmail.com>
Message-ID: <rnn9n519-pq72-7r3-57q3-3rns2s50s049@syhkavp.arg>
References: <20201202150130.16936-1-vitaly.wool@konsulko.com>
 <5916q277-o720-n6q-9o2-oo9nsqr6q63q@syhkavp.arg>
 <CAM4kBBLSy=TJEFmzrdYCGHNLBBtnYYh64pFeYdh2Q7ytJvBwGg@mail.gmail.com>
MIME-Version: 1.0
X-Pobox-Relay-ID: 62A661B8-34D9-11EB-BCF4-D609E328BF65-78420484!pb-smtp21.pobox.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_150309_400931_34D579FC 
X-CRM114-Status: GOOD (  32.76  )
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

On Wed, 2 Dec 2020, Vitaly Wool wrote:

> On Wed, Dec 2, 2020 at 7:06 PM Nicolas Pitre <nico@fluxnic.net> wrote:
> >
> > On Wed, 2 Dec 2020, Vitaly Wool wrote:
> >
> > > Introduce XIP (eXecute In Place) support for RISC-V platforms.
> > > It allows code to be executed directly from non-volatile storage
> > > directly addressable by the CPU, such as QSPI NOR flash which can
> > > be found on many RISC-V platforms. This makes way for significant
> > > optimization of RAM footprint. The XIP kernel is not compressed
> > > since it has to run directly from flash, so it will occupy more
> > > space on the non-volatile storage to The physical flash address
> > > used to link the kernel object files and for storing it has to
> > > be known at compile time and is represented by a Kconfig option.
> > >
> > > XIP on RISC-V will currently only work on MMU-enabled kernels.
> > >
> > > Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> >
> > That's nice!
> >
> > Suggestion for a future enhancement:
> > To save on ROM storage, and given that the .data segment has to be
> > copied to RAM anyway, you could store .data compressed and decompress it
> > to RAM instead. See commit ca8b5d97d6bf for inspiration. In fact, many
> > parts there could be shared.
> 
> Thanks! That's in my TODO list.
> 
> > More comments below.
> >
> > > +#define __XIP_FIXUP(addr) \
> > > +     (((long)(addr) >= CONFIG_XIP_PHYS_ADDR && \
> > > +       (long)(addr) <= CONFIG_XIP_PHYS_ADDR + SZ_16M) ? \
> > > +     (long)(addr) - CONFIG_XIP_PHYS_ADDR + CONFIG_XIP_PHYS_RAM_BASE - XIP_OFFSET : \
> > > +     (long)(addr))
> >
> > Here you should cast to unsigned long instead.
> 
> Right, or (just thought of it) uintptr_t for that matter. Does that sound right?

Sure.

> > > +#ifdef CONFIG_XIP_KERNEL
> > > +     la a0, _trampoline_pg_dir
> > > +     lw t0, _xip_fixup
> > > +     add a0, a0, t0
> > [...]
> > > +_xip_fixup:
> > > +     .dword CONFIG_XIP_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
> > > +#endif
> >
> > Here _xip_fixup is a dword but you're loading it as a word.
> > This won't work for both rv32 and rv64.
> 
> Well, at this point I believe it does, as long as we use little
> endian.

... and the fixup is not larger than 32 bits.

> 64-bit version has been verified.

Won't work if ROM and RAM are far-enough apart.

> I do not argue though that it isn't nice and should be fixed.
> 
> > > +SECTIONS
> > > +{
> > > +     /* Beginning of code and text segment */
> > > +     . = XIP_VIRT_ADDR(CONFIG_XIP_PHYS_ADDR);
> > > +     _xiprom = .;
> > > +     _start = .;
> > > +     HEAD_TEXT_SECTION
> > > +     INIT_TEXT_SECTION(PAGE_SIZE)
> > > +     /* we have to discard exit text and such at runtime, not link time */
> > > +     .exit.text :
> > > +     {
> > > +             EXIT_TEXT
> > > +     }
> > > +
> > > +     .text : {
> > > +             _text = .;
> > > +             _stext = .;
> > > +             TEXT_TEXT
> > > +             SCHED_TEXT
> > > +             CPUIDLE_TEXT
> > > +             LOCK_TEXT
> > > +             KPROBES_TEXT
> > > +             ENTRY_TEXT
> > > +             IRQENTRY_TEXT
> > > +             SOFTIRQENTRY_TEXT
> > > +             *(.fixup)
> > > +             _etext = .;
> > > +     }
> > > +     RO_DATA(L1_CACHE_BYTES)
> > > +     .srodata : {
> > > +             *(.srodata*)
> > > +     }
> > > +     .init.rodata : {
> > > +             INIT_SETUP(16)
> > > +             INIT_CALLS
> > > +             CON_INITCALL
> > > +             INIT_RAM_FS
> > > +     }
> > > +     _exiprom = ALIGN(PAGE_SIZE);            /* End of XIP ROM area */
> >
> > Why do you align this to a page size?
> 
> TBH I just cut the corners here and below, did not have to worry about
> partial pages and such.

You're wasting ROM space though.

> > > +
> > > +
> > > +/*
> > > + * From this point, stuff is considered writable and will be copied to RAM
> > > + */
> > > +     __data_loc = ALIGN(PAGE_SIZE);  /* location in file */
> >
> > Same question here?
> >
> > > +     . = PAGE_OFFSET;                /* location in memory */
> > > +
> > > +     _sdata = .;                     /* Start of data section */
> > > +     _data = .;
> > > +     RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
> > > +     _edata = .;
> > > +     __start_ro_after_init = .;
> > > +     .data.ro_after_init : AT(ADDR(.data.ro_after_init) - LOAD_OFFSET) {
> > > +             *(.data..ro_after_init)
> > > +     }
> > > +     __end_ro_after_init = .;
> > > +
> > > +     . = ALIGN(PAGE_SIZE);
> >
> > And again here?

Forget this particular one. It is fine.


Nicolas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
