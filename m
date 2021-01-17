Return-Path: <SRS0=fQ+v=GU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15128C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 18:56:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAE94224BD
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 18:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAE94224BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UfoccwQqi8/OJ5UdEim39FNfeyk5lco7G3NqsnUIk3o=; b=WuX+O8ZzjPeSaD6edNrKq+VdK
	QCFnDmoI72d8Nb82ig+44lTrqJwd+/k8QmsCHcGhevd8Mhirsftc4r+7msDH0k2fcGrUGDubOHVIN
	DMO7/IRAxa9tbXqS/vQNPm515ApHr/IE7bMAU3TKC60AZSe+gnqSHoa+5aSqhyleS0v7ZNSRdAqdZ
	vmf+LyNU8mytleYv3fdzqCP4ESYj3XmlxaSp2zkN46dFrAH/QwUEsD3jFA+UL4ffziXBswHP457PF
	kDKPYNZOaWFjgbFBzz+KlPmFyk/ALYxlb1PsLwg12Jvr6hYtuGZT6dC5dbdTx2LBo0vYuQWvtGamn
	Rz/BuRn2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1DD9-0006yG-6C; Sun, 17 Jan 2021 18:55:39 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1DD4-0006xo-JX
 for linux-riscv@lists.infradead.org; Sun, 17 Jan 2021 18:55:36 +0000
Received: by mail-ot1-f53.google.com with SMTP id c18so8384479oto.3
 for <linux-riscv@lists.infradead.org>; Sun, 17 Jan 2021 10:55:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciY/9x8kUuaBeYyf+2YkcAZyzFDsQyL8uiXdT0ViaCA=;
 b=KRAYhZFkJKsGtJEXVaEXETAAt+XsI21sze1RE322/WPINO5FHC1aWI1XXS4ccAzx7C
 RPZMcYj3BvIkdaPQvDAGRhGpOicYCPDk8+Kr3FEQZxiYn1letfbZnzAKLVimaEqGm+qC
 0JmBcqz2S/kKqX6eYxwBeX1EqrnrqVDHvVYv+QQmpu17U49IOTAfBD7nZCt4x1sVuixG
 f2G6ePpyYKHLPGpbLCeGez4iojTWdJtCj258kmrgXDnZ2C5b3RmYSty8XxKu6TiR6Y4Z
 KmHOCvob//zMvCzwXO9JRbrzJY643iVD5Vie8KqPvBHPwSrjORqK1IUl4gZnZ5gTASlQ
 V27Q==
X-Gm-Message-State: AOAM530B2DZaNxCAIqw+UCv1dNE1nua88Ib2m0hbkBPubgSga+EakzbN
 5XNRZlr9nhiUvTbXsLBudA2KKL+l6vbBfy0IZJs=
X-Google-Smtp-Source: ABdhPJypfkMhm7oJaM3WyIRHY/JImqdUuP9wXDsOxtIltstM1QporVf3PKM7Bs4SDUXjo7aRdQIlnCxIZdGuoH+uLqY=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr15344536oth.250.1610909731958; 
 Sun, 17 Jan 2021 10:55:31 -0800 (PST)
MIME-Version: 1.0
References: <CAOnJCU+mCPwbeOQpmHmu3ar_17otmgftiKHLL+Z4_nExpj0=cA@mail.gmail.com>
 <mhng-4458ef4d-9443-491e-9118-aec3596058ed@penguin>
 <CAOnJCUJON3B6ugWDY1=rcDOMS2+m=SVBsiAEnwV=QDL7omnsfA@mail.gmail.com>
 <CAMuHMdXQr-qNQ2aNVmgQFfs_dJ8=A-xzrhxRf9VUmzFXx+2o_w@mail.gmail.com>
 <CAOnJCUJys9gacJ7kgTBit9tq0M51c3jdoGjcGxtMFRgOhU9AwQ@mail.gmail.com>
In-Reply-To: <CAOnJCUJys9gacJ7kgTBit9tq0M51c3jdoGjcGxtMFRgOhU9AwQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 17 Jan 2021 19:55:20 +0100
Message-ID: <CAMuHMdUPQCk1WQOeenoTunw-d3bW6t3fKYnWo7uKtyamnC9dvg@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_135534_718799_B384CAD8 
X-CRM114-Status: GOOD (  49.05  )
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

On Sat, Jan 16, 2021 at 2:39 AM Atish Patra <atishp@atishpatra.org> wrote:
> On Thu, Jan 14, 2021 at 11:59 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Thu, Jan 14, 2021 at 10:11 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > On Thu, Jan 14, 2021 at 11:46 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > > On Thu, 14 Jan 2021 10:33:01 PST (-0800), atishp@atishpatra.org wrote:
> > > > > On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > > > >>
> > > > >> On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
> > > > >> > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
> > > > >> > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
> > > > >> > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
> > > > >> >
> > > > >> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > >> > ---
> > > > >> >  arch/riscv/include/asm/cache.h | 4 ++++
> > > > >> >  1 file changed, 4 insertions(+)
> > > > >> >
> > > > >> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> > > > >> > index 9b58b104559e..c9c669ea2fe6 100644
> > > > >> > --- a/arch/riscv/include/asm/cache.h
> > > > >> > +++ b/arch/riscv/include/asm/cache.h
> > > > >> > @@ -7,7 +7,11 @@
> > > > >> >  #ifndef _ASM_RISCV_CACHE_H
> > > > >> >  #define _ASM_RISCV_CACHE_H
> > > > >> >
> > > > >> > +#ifdef CONFIG_64BIT
> > > > >> >  #define L1_CACHE_SHIFT               6
> > > > >> > +#else
> > > > >> > +#define L1_CACHE_SHIFT               5
> > > > >> > +#endif
> > > > >> >
> > > > >> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
> > > > >>
> > > > >> Should we not instead just
> > > > >>
> > > > >> #define SMP_CACHE_BYTES L1_CACHE_BYTES
> > > > >>
> > > > >> like a handful of architectures do?
> > > > >>
> > > > >
> > > > > The generic code already defines it that way in include/linux/cache.h
> > > > >
> > > > >> The cache size is sort of fake here, as we don't have any non-coherent
> > > > >> mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
> > > > >> cache lines in RISC-V implementations as software may assume that for
> > > > >> performance reasons.  Not really a strong reason, but I'd prefer to just make
> > > > >> these match.
> > > > >>
> > > > >
> > > > > If it is documented somewhere in the kernel, we should update that. I
> > > > > think SMP_CACHE_BYTES being 64
> > > > > actually degrades the performance as there will be a fragmented memory
> > > > > blocks with 32 bit bytes gap wherever
> > > > > SMP_CACHE_BYTES is used as an alignment requirement.
> > > >
> > > > I don't buy that: if you're trying to align to the cache size then the gaps are
> > > > the whole point.  IIUC the 64-byte cache lines come from DDR, not XLEN, so
> > > > there's really no reason for these to be different between the base ISAs.
> > > >
> > >
> > > Got your point. I noticed this when fixing the resource tree issue
> > > where the SMP_CACHE_BYTES
> > > alignment was not intentional but causing the issue. The real issue
> > > was solved via another patch in this series though.
> > >
> > > Just to clarify, if the allocation function intends to allocate
> > > consecutive memory, it should use 32 instead of SMP_CACHE_BYTES.
> > > This will lead to a #ifdef macro in the code.
> > >
> > > > > In addition to that, Geert Uytterhoeven mentioned some panic on vex32
> > > > > without this patch.
> > > > > I didn't see anything in Qemu though.
> > > >
> > > > Something like that is probably only going to show up on real hardware, QEMU
> > > > doesn't really do anything with the cache line size.  That said, as there's
> > > > nothing in our kernel now related to non-coherent memory there really should
> > > > only be performance issue (at least until we have non-coherent systems).
> > > >
> > > > I'd bet that the change is just masking some other bug, either in the software
> > > > or the hardware.  I'd prefer to root cause this rather than just working around
> > > > it, as it'll probably come back later and in a more difficult way to find.
> > > >
> > >
> > > Agreed. @Geert Uytterhoeven Can you do a further analysis of the panic
> > > you were saying ?
> > > We may need to change an alignment requirement to 32 for RV32 manually
> > > at some place in code.
> >
> > My findings were in
> > https://lore.kernel.org/linux-riscv/CAMuHMdWf6K-5y02+WJ6Khu1cD6P0n5x1wYQikrECkuNtAA1pgg@mail.gmail.com/
> >
> > Note that when the memblock.reserved list kept increasing, it kept on
> > adding the same entry to the list.  But that was fixed by "[PATCH 1/4]
> > RISC-V: Do not allocate memblock while iterating reserved memblocks".
> >
> > After that, only the (reproducible) "Unable to handle kernel paging
> > request at virtual address 61636473" was left, always at the same place.
> > No idea where the actual corruption happened.
> >
>
> Yes. I was asking about this panic. I don't have the litex fpga to
> reproduce this as well.
> Can you take a look at the epc & ra to figure out where exactly is the fault ?
>
> That will help to understand the real cause for this panic.

[...]
Freeing initrd memory: 8192K
workingset: timestamp_bits=30 max_order=15 bucket_order=0
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 253)
io scheduler mq-deadline registered
io scheduler kyber registered
Unable to handle kernel paging request at virtual address 61636473
Oops [#1]
CPU: 0 PID: 1 Comm: swapper/0 Not tainted
5.11.0-rc3-orangecrab-00068-g267ecb2e2e9d-dirty #37
epc: c000f8e4 ra : c00110e8 sp : c082bc70
 gp : c0665948 tp : c0830000 t0 : c08ba500
 t1 : 00000002 t2 : 00000000 s0 : c082bc80
 s1 : 00000000 a0 : c05e2dec a1 : c08ba4e0
 a2 : c0665d38 a3 : 61636473 a4 : f0004003
 a5 : f0004000 a6 : c7efffb8 a7 : c08ba4e0
 s2 : 01001f00 s3 : c0666000 s4 : c05e2e0c
 s5 : c0666000 s6 : 80000000 s7 : 00000006
 s8 : c05a4000 s9 : c08ba4e0 s10: c05e2dec
 s11: 00000000 t3 : c08ba500 t4 : 00000001
 t5 : 00076400 t6 : c08bbb5e
status: 00000120 badaddr: 61636473 cause: 0000000d
---[ end trace 50524759df172195 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
---[ end Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b ]---

Looking up epc and ra in System.map, closest symbols are:

    c000f8b0 t __request_resource
    c0010ff4 T __request_region

The above is with a kernel built from my own config, but using
litex_vexriscv_defconfig with https://github.com/geertu/linux branch
litex-v5.11 and commit 718aaf7d1c351035 ("RISC-V: Fix L1_CACHE_BYTES for
RV32") reverted gives the exact same results.

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
