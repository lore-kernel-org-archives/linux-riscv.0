Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB310C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 07:59:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BE2620706
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 07:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BE2620706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nILlg91QL8SgyYFLzr3EiXWNPsADE1QBIhHYd7l1GTg=; b=ZFnNJ0YNYyK3DyQjU/WGfErcq
	zIiQLs0rM089IJkNxPfRsB6YmyoZxSYrvTggqRdQSlJgVtoS20jVUN79u4Vhpoj8hVqbtHdTC7FD/
	FMYi8Gxiucwc1gk57dQJkLwBIL86nzcWGulD5HDNzumCQVFYw4R8mdtgrqxPyjLb/w/PCVAR8G8aV
	/a2XLbEsuIgxROyldxVI5X4yFQIV3EdLbB3F3sGI3AmV6RcmHqlAJS+FT3KK+YzXeQZs6p2Z/UlrG
	5oi8/LAuSQ6cQAlCNYKRBGviPTeNBv8ADHOVSJHNpvO7R1dYBGIJG/5IfE4lCQsiVuALSR/sYFhml
	pd3urn+ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0K0y-0003OH-BA; Fri, 15 Jan 2021 07:59:24 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0K0v-0003NS-9B
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 07:59:22 +0000
Received: by mail-oi1-f181.google.com with SMTP id d189so8691332oig.11
 for <linux-riscv@lists.infradead.org>; Thu, 14 Jan 2021 23:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=whTBbbuwzuSuP44Iueajqp/PtjcefDAsRVDPTDd0OnA=;
 b=jg/kxH/M1yxGFnIM9cJxqOzjGLkG9ByJo/FW2dlSzKCroR4fD7+LZun3SP9FElHvkA
 UFRsTEBpbkDgp+rGaoHGt21pPNLJIldSHSbRHpQqIftpP7YmZ278rdG36lO4wOnoSxSL
 upmHmHhnsVjtgmMYHuHUPp2hLaZEFMGM4K33xdd17+x78uwhYWx/8bbc5mdqjh48jQQl
 fLtXCWXN2zguUVOeRRdcxbeGLtD4RmmgG50m9rXc8Chi+v48Qm7Pg2THps5ffeCGOVSp
 RL689V4DQHt42qDfcD8eFpIj8O7QdAs9amDxMnTIho7dIsGC13+rf8P/H/SHWdvP9Lyk
 xbjw==
X-Gm-Message-State: AOAM533opWGcS3uzqOrTUwkmJUnplimoAl0q1TXGnBuGbFBBr88jI1kD
 tcfnU9bfG09kIWapleujHzXYpCs8sMjusOJmUYY=
X-Google-Smtp-Source: ABdhPJw4YHtZUQmyw3UW8zTcDJxg79aDbp8F9zJax8QDTZX46t+UYxWRQV9uM4jiNnSB6Rb1/7vVZmX9sliV1Ac3P/c=
X-Received: by 2002:aca:ec09:: with SMTP id k9mr4937946oih.153.1610697555949; 
 Thu, 14 Jan 2021 23:59:15 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCU+mCPwbeOQpmHmu3ar_17otmgftiKHLL+Z4_nExpj0=cA@mail.gmail.com>
 <mhng-4458ef4d-9443-491e-9118-aec3596058ed@penguin>
 <CAOnJCUJON3B6ugWDY1=rcDOMS2+m=SVBsiAEnwV=QDL7omnsfA@mail.gmail.com>
In-Reply-To: <CAOnJCUJON3B6ugWDY1=rcDOMS2+m=SVBsiAEnwV=QDL7omnsfA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Jan 2021 08:59:04 +0100
Message-ID: <CAMuHMdXQr-qNQ2aNVmgQFfs_dJ8=A-xzrhxRf9VUmzFXx+2o_w@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_025921_366260_13CF1D23 
X-CRM114-Status: GOOD (  42.09  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <Anup.Patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Atish,

On Thu, Jan 14, 2021 at 10:11 PM Atish Patra <atishp@atishpatra.org> wrote:
> On Thu, Jan 14, 2021 at 11:46 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > On Thu, 14 Jan 2021 10:33:01 PST (-0800), atishp@atishpatra.org wrote:
> > > On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > >>
> > >> On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
> > >> > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
> > >> > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
> > >> > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
> > >> >
> > >> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > >> > ---
> > >> >  arch/riscv/include/asm/cache.h | 4 ++++
> > >> >  1 file changed, 4 insertions(+)
> > >> >
> > >> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> > >> > index 9b58b104559e..c9c669ea2fe6 100644
> > >> > --- a/arch/riscv/include/asm/cache.h
> > >> > +++ b/arch/riscv/include/asm/cache.h
> > >> > @@ -7,7 +7,11 @@
> > >> >  #ifndef _ASM_RISCV_CACHE_H
> > >> >  #define _ASM_RISCV_CACHE_H
> > >> >
> > >> > +#ifdef CONFIG_64BIT
> > >> >  #define L1_CACHE_SHIFT               6
> > >> > +#else
> > >> > +#define L1_CACHE_SHIFT               5
> > >> > +#endif
> > >> >
> > >> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
> > >>
> > >> Should we not instead just
> > >>
> > >> #define SMP_CACHE_BYTES L1_CACHE_BYTES
> > >>
> > >> like a handful of architectures do?
> > >>
> > >
> > > The generic code already defines it that way in include/linux/cache.h
> > >
> > >> The cache size is sort of fake here, as we don't have any non-coherent
> > >> mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
> > >> cache lines in RISC-V implementations as software may assume that for
> > >> performance reasons.  Not really a strong reason, but I'd prefer to just make
> > >> these match.
> > >>
> > >
> > > If it is documented somewhere in the kernel, we should update that. I
> > > think SMP_CACHE_BYTES being 64
> > > actually degrades the performance as there will be a fragmented memory
> > > blocks with 32 bit bytes gap wherever
> > > SMP_CACHE_BYTES is used as an alignment requirement.
> >
> > I don't buy that: if you're trying to align to the cache size then the gaps are
> > the whole point.  IIUC the 64-byte cache lines come from DDR, not XLEN, so
> > there's really no reason for these to be different between the base ISAs.
> >
>
> Got your point. I noticed this when fixing the resource tree issue
> where the SMP_CACHE_BYTES
> alignment was not intentional but causing the issue. The real issue
> was solved via another patch in this series though.
>
> Just to clarify, if the allocation function intends to allocate
> consecutive memory, it should use 32 instead of SMP_CACHE_BYTES.
> This will lead to a #ifdef macro in the code.
>
> > > In addition to that, Geert Uytterhoeven mentioned some panic on vex32
> > > without this patch.
> > > I didn't see anything in Qemu though.
> >
> > Something like that is probably only going to show up on real hardware, QEMU
> > doesn't really do anything with the cache line size.  That said, as there's
> > nothing in our kernel now related to non-coherent memory there really should
> > only be performance issue (at least until we have non-coherent systems).
> >
> > I'd bet that the change is just masking some other bug, either in the software
> > or the hardware.  I'd prefer to root cause this rather than just working around
> > it, as it'll probably come back later and in a more difficult way to find.
> >
>
> Agreed. @Geert Uytterhoeven Can you do a further analysis of the panic
> you were saying ?
> We may need to change an alignment requirement to 32 for RV32 manually
> at some place in code.

My findings were in
https://lore.kernel.org/linux-riscv/CAMuHMdWf6K-5y02+WJ6Khu1cD6P0n5x1wYQikrECkuNtAA1pgg@mail.gmail.com/

Note that when the memblock.reserved list kept increasing, it kept on
adding the same entry to the list.  But that was fixed by "[PATCH 1/4]
RISC-V: Do not allocate memblock while iterating reserved memblocks".

After that, only the (reproducible) "Unable to handle kernel paging
request at virtual address 61636473" was left, always at the same place.
No idea where the actual corruption happened.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
