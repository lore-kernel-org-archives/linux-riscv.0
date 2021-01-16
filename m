Return-Path: <SRS0=IOE3=GT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06E5C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 01:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83ECA23120
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jan 2021 01:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83ECA23120
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2bp4iQclTUw5YaicGKwPFMCWF9UKQnJVkIBH8Ob7EGQ=; b=ypzODPq/rW2oogDR8dioHHeRI
	lFnrJHODGNwYbBowpvnrFKIBSKXlaa/NorCPorgE80+ouHYrAWmcXfPxnTvPbJY1dvRzFF4Nb3pzr
	m6saUNR9REEsGwLE1CxJ3K1m2ZapkF/kuYrgwB8qrNPx6dh7JcdaTXY72nKyY6tvpqQVnU6HneH1C
	SCwQTK67J6BevLhabMnhzB7LJZiG/VQTmb7fV/wj+g4Pslh9P55h/lCCU5ohPE6ltIlG3++7FvQPx
	xqfiJr6zF/6l7ZfxcdAD0+X47nKLYX6Lvkx2zxBP/N6GvieVXUIV+DhMJ6dNgpoIKYKTJLb/uHV9A
	u8udKwtMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0aYs-0003sU-As; Sat, 16 Jan 2021 01:39:30 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0aYp-0003s7-Hu
 for linux-riscv@lists.infradead.org; Sat, 16 Jan 2021 01:39:28 +0000
Received: by mail-io1-xd31.google.com with SMTP id d9so21813460iob.6
 for <linux-riscv@lists.infradead.org>; Fri, 15 Jan 2021 17:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e/4EufOTObHXM0rTx80uVaCTX7YuAKaU4BEuP78cHf4=;
 b=ldBKALM8g+X2GX3CRc8eQLfhqViKHTRNSaK0oEodm8JTqoYuBvb4zPfHQHgEYRvuQH
 Hyj2MUKK+m7EHYgUCzU2MKbdd0ncYmZNfJO+nehV0UJ1bqCIO7cxlDapK6fSAl8PKtD9
 w8nw5mNdralJ3tmGtPPAOjPROn+hOxMyn32pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e/4EufOTObHXM0rTx80uVaCTX7YuAKaU4BEuP78cHf4=;
 b=bKA7C2kjCZnEl7Jmluv81P2dWCblrMSaLsgPVjDcon66TdicKFHMfZjd4Afvq3wYK2
 euIL8aFVfmwgXzot7qbR2cbfbuXRZkUdDu3ES4UNyHbjMRUco44QTExHpI41amfgJIXV
 DQQV+hHp/E2OURY/8rPIV57botiEKsL+/YR75SNPLa8Yqkbtjw6Tz0/V5BYwXdGmPosU
 ef6RGTVqAriyzwpast6VkEM3nZIfQo5Q/FLXGoS6cGUaOyf4y1mAu0TdwS13mQb4fufD
 rX7CPOjYhqh1UsF5Lac0+9LccYAzbRwMdCAFUwndK90rcij7cuVSVV8LVORLKDk9O5L+
 4UOw==
X-Gm-Message-State: AOAM531Jhb67gYAsLWT660Dql+SJAzi7Iw1qo5Lcns6CLWWxjTrG8fMW
 vlfx9zdwVHKi5G+YDzNJ7Hw79jsf6/ENiUnlhl/J
X-Google-Smtp-Source: ABdhPJzzdFwrDw9SiK/q+DIAIHxFu0mHFdNfa6wLm50s5Y+UbSLKZpMZVgn8CJyspeUuilAT6NvbUI8+SWjfdICgRNQ=
X-Received: by 2002:a92:6410:: with SMTP id y16mr13460228ilb.126.1610761164117; 
 Fri, 15 Jan 2021 17:39:24 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCU+mCPwbeOQpmHmu3ar_17otmgftiKHLL+Z4_nExpj0=cA@mail.gmail.com>
 <mhng-4458ef4d-9443-491e-9118-aec3596058ed@penguin>
 <CAOnJCUJON3B6ugWDY1=rcDOMS2+m=SVBsiAEnwV=QDL7omnsfA@mail.gmail.com>
 <CAMuHMdXQr-qNQ2aNVmgQFfs_dJ8=A-xzrhxRf9VUmzFXx+2o_w@mail.gmail.com>
In-Reply-To: <CAMuHMdXQr-qNQ2aNVmgQFfs_dJ8=A-xzrhxRf9VUmzFXx+2o_w@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 15 Jan 2021 17:39:13 -0800
Message-ID: <CAOnJCUJys9gacJ7kgTBit9tq0M51c3jdoGjcGxtMFRgOhU9AwQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_203927_747655_3AC7E860 
X-CRM114-Status: GOOD (  46.02  )
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

On Thu, Jan 14, 2021 at 11:59 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Atish,
>
> On Thu, Jan 14, 2021 at 10:11 PM Atish Patra <atishp@atishpatra.org> wrote:
> > On Thu, Jan 14, 2021 at 11:46 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > On Thu, 14 Jan 2021 10:33:01 PST (-0800), atishp@atishpatra.org wrote:
> > > > On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > >>
> > > >> On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
> > > >> > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
> > > >> > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
> > > >> > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
> > > >> >
> > > >> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > >> > ---
> > > >> >  arch/riscv/include/asm/cache.h | 4 ++++
> > > >> >  1 file changed, 4 insertions(+)
> > > >> >
> > > >> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> > > >> > index 9b58b104559e..c9c669ea2fe6 100644
> > > >> > --- a/arch/riscv/include/asm/cache.h
> > > >> > +++ b/arch/riscv/include/asm/cache.h
> > > >> > @@ -7,7 +7,11 @@
> > > >> >  #ifndef _ASM_RISCV_CACHE_H
> > > >> >  #define _ASM_RISCV_CACHE_H
> > > >> >
> > > >> > +#ifdef CONFIG_64BIT
> > > >> >  #define L1_CACHE_SHIFT               6
> > > >> > +#else
> > > >> > +#define L1_CACHE_SHIFT               5
> > > >> > +#endif
> > > >> >
> > > >> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
> > > >>
> > > >> Should we not instead just
> > > >>
> > > >> #define SMP_CACHE_BYTES L1_CACHE_BYTES
> > > >>
> > > >> like a handful of architectures do?
> > > >>
> > > >
> > > > The generic code already defines it that way in include/linux/cache.h
> > > >
> > > >> The cache size is sort of fake here, as we don't have any non-coherent
> > > >> mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
> > > >> cache lines in RISC-V implementations as software may assume that for
> > > >> performance reasons.  Not really a strong reason, but I'd prefer to just make
> > > >> these match.
> > > >>
> > > >
> > > > If it is documented somewhere in the kernel, we should update that. I
> > > > think SMP_CACHE_BYTES being 64
> > > > actually degrades the performance as there will be a fragmented memory
> > > > blocks with 32 bit bytes gap wherever
> > > > SMP_CACHE_BYTES is used as an alignment requirement.
> > >
> > > I don't buy that: if you're trying to align to the cache size then the gaps are
> > > the whole point.  IIUC the 64-byte cache lines come from DDR, not XLEN, so
> > > there's really no reason for these to be different between the base ISAs.
> > >
> >
> > Got your point. I noticed this when fixing the resource tree issue
> > where the SMP_CACHE_BYTES
> > alignment was not intentional but causing the issue. The real issue
> > was solved via another patch in this series though.
> >
> > Just to clarify, if the allocation function intends to allocate
> > consecutive memory, it should use 32 instead of SMP_CACHE_BYTES.
> > This will lead to a #ifdef macro in the code.
> >
> > > > In addition to that, Geert Uytterhoeven mentioned some panic on vex32
> > > > without this patch.
> > > > I didn't see anything in Qemu though.
> > >
> > > Something like that is probably only going to show up on real hardware, QEMU
> > > doesn't really do anything with the cache line size.  That said, as there's
> > > nothing in our kernel now related to non-coherent memory there really should
> > > only be performance issue (at least until we have non-coherent systems).
> > >
> > > I'd bet that the change is just masking some other bug, either in the software
> > > or the hardware.  I'd prefer to root cause this rather than just working around
> > > it, as it'll probably come back later and in a more difficult way to find.
> > >
> >
> > Agreed. @Geert Uytterhoeven Can you do a further analysis of the panic
> > you were saying ?
> > We may need to change an alignment requirement to 32 for RV32 manually
> > at some place in code.
>
> My findings were in
> https://lore.kernel.org/linux-riscv/CAMuHMdWf6K-5y02+WJ6Khu1cD6P0n5x1wYQikrECkuNtAA1pgg@mail.gmail.com/
>
> Note that when the memblock.reserved list kept increasing, it kept on
> adding the same entry to the list.  But that was fixed by "[PATCH 1/4]
> RISC-V: Do not allocate memblock while iterating reserved memblocks".
>
> After that, only the (reproducible) "Unable to handle kernel paging
> request at virtual address 61636473" was left, always at the same place.
> No idea where the actual corruption happened.
>

Yes. I was asking about this panic. I don't have the litex fpga to
reproduce this as well.
Can you take a look at the epc & ra to figure out where exactly is the fault ?

That will help to understand the real cause for this panic.

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
