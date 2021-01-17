Return-Path: <SRS0=fQ+v=GU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347C7C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 19:04:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FDDC224BD
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 19:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FDDC224BD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+125BDsWQj7mDK2NV0tS6gdAGSnM9hhm3Xgpt7LkAc0=; b=CkcN8B6MCdUbZofIttPtkyZsL
	VzlA1qLUspaCtL4kZcrtbROAKUSROa5V/l83p9YI1obmPLVLqN8xBIPBHFIvcpFwviT3RsFPAyAHb
	0qCQ7fOvFTljsrJ160moDhHBHq8P2lYJzUmw3iw459BEhJUCl9H0TcidY0oVobIR0JVfnCHNsWyDg
	ALJRff1nwFruVGhnziXF7vTe32hLQMXHh43Y0ffOGgphRd88EDVjFg6tgPYPv8UHUGx7HOon+//hX
	RqlwWfqOShkR7xystp3l2ueXq7v62qa7bXy8m7bzgWlKVzFvgyDlJIkhuKJU9MCfQIn2yB+KGUQxl
	j6G8WiZmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1DL1-0007MU-Aw; Sun, 17 Jan 2021 19:03:47 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1DKy-0007Lz-4n
 for linux-riscv@lists.infradead.org; Sun, 17 Jan 2021 19:03:45 +0000
Received: by mail-ot1-f53.google.com with SMTP id a109so14222458otc.1
 for <linux-riscv@lists.infradead.org>; Sun, 17 Jan 2021 11:03:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mkM3YWWZspdvrNYoqdrKab5a2qxLff+ysqOvDvdYDNk=;
 b=dkrMTqIxuRNWRDecoES+6OIt58sJZXp9Uq/EaYOfRRjH1OVv5feQJNBS2KH7OvlbOW
 wPkAdZNRu/JwUTe2+E3+/CQFCjyfkYYVgjaShdowWRU6iwOr7A95emGe+5bCq4WxWiyO
 xZaMq27z4zsWd15dFK1WjuvStIElFvWitN3SFz5zi7CDUKV5m/LuhrZcttHyXVm+lRUM
 jRDxnsU699ASAqUINJ7M5h4ZdSm3LWut+ujga5QTN1Qyri9+4HtZcZDt4mVhuGKKxWwX
 6iYTnQE2/GM2vboDOI5D0fYS1a7wfO9BArIOnhbPWhq2SdqqKwHAfQ9Nt9stq9+kU96l
 G7Hw==
X-Gm-Message-State: AOAM530Ij48juzvy2zaVKdhAytEh5HmGObfHC5Hjv8WnT7CVWmBSyxAy
 OluLsvHVmKQpJ+9sOW93s/HkTEgrpMM74a8S2fk=
X-Google-Smtp-Source: ABdhPJzWDpTa8Ht1r4dE4/oYsWNNUQKYbCRTrxgzciYW/OWIpS63+k3K6aXfeSw/ugiuQNfISmfsmFjHOb20uGSse8o=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr15344643otc.145.1610910223630; 
 Sun, 17 Jan 2021 11:03:43 -0800 (PST)
MIME-Version: 1.0
References: <CAMuHMdXQr-qNQ2aNVmgQFfs_dJ8=A-xzrhxRf9VUmzFXx+2o_w@mail.gmail.com>
 <mhng-c5ceb653-6391-407e-acd9-bd5c43ca434a@penguin>
In-Reply-To: <mhng-c5ceb653-6391-407e-acd9-bd5c43ca434a@penguin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 17 Jan 2021 20:03:32 +0100
Message-ID: <CAMuHMdXoJ9-jM4sazFbHXEsaDFFMK1ybM53SDqy_2QqPMZEQ=g@mail.gmail.com>
Subject: Re: [PATCH 3/4] RISC-V: Fix L1_CACHE_BYTES for RV32
To: Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_140344_303607_358A8A0E 
X-CRM114-Status: GOOD (  45.62  )
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
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>,
 Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Palmer,

On Fri, Jan 15, 2021 at 11:44 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> On Thu, 14 Jan 2021 23:59:04 PST (-0800), geert@linux-m68k.org wrote:
> > On Thu, Jan 14, 2021 at 10:11 PM Atish Patra <atishp@atishpatra.org> wrote:
> >> On Thu, Jan 14, 2021 at 11:46 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> > On Thu, 14 Jan 2021 10:33:01 PST (-0800), atishp@atishpatra.org wrote:
> >> > > On Wed, Jan 13, 2021 at 9:10 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> > >>
> >> > >> On Thu, 07 Jan 2021 01:26:51 PST (-0800), Atish Patra wrote:
> >> > >> > SMP_CACHE_BYTES/L1_CACHE_BYTES should be defined as 32 instead of
> >> > >> > 64 for RV32. Otherwise, there will be hole of 32 bytes with each memblock
> >> > >> > allocation if it is requested to be aligned with SMP_CACHE_BYTES.
> >> > >> >
> >> > >> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> >> > >> > ---
> >> > >> >  arch/riscv/include/asm/cache.h | 4 ++++
> >> > >> >  1 file changed, 4 insertions(+)
> >> > >> >
> >> > >> > diff --git a/arch/riscv/include/asm/cache.h b/arch/riscv/include/asm/cache.h
> >> > >> > index 9b58b104559e..c9c669ea2fe6 100644
> >> > >> > --- a/arch/riscv/include/asm/cache.h
> >> > >> > +++ b/arch/riscv/include/asm/cache.h
> >> > >> > @@ -7,7 +7,11 @@
> >> > >> >  #ifndef _ASM_RISCV_CACHE_H
> >> > >> >  #define _ASM_RISCV_CACHE_H
> >> > >> >
> >> > >> > +#ifdef CONFIG_64BIT
> >> > >> >  #define L1_CACHE_SHIFT               6
> >> > >> > +#else
> >> > >> > +#define L1_CACHE_SHIFT               5
> >> > >> > +#endif
> >> > >> >
> >> > >> >  #define L1_CACHE_BYTES               (1 << L1_CACHE_SHIFT)
> >> > >>
> >> > >> Should we not instead just
> >> > >>
> >> > >> #define SMP_CACHE_BYTES L1_CACHE_BYTES
> >> > >>
> >> > >> like a handful of architectures do?
> >> > >>
> >> > >
> >> > > The generic code already defines it that way in include/linux/cache.h
> >> > >
> >> > >> The cache size is sort of fake here, as we don't have any non-coherent
> >> > >> mechanisms, but IIRC we wrote somewhere that it's recommended to have 64-byte
> >> > >> cache lines in RISC-V implementations as software may assume that for
> >> > >> performance reasons.  Not really a strong reason, but I'd prefer to just make
> >> > >> these match.
> >> > >>
> >> > >
> >> > > If it is documented somewhere in the kernel, we should update that. I
> >> > > think SMP_CACHE_BYTES being 64
> >> > > actually degrades the performance as there will be a fragmented memory
> >> > > blocks with 32 bit bytes gap wherever
> >> > > SMP_CACHE_BYTES is used as an alignment requirement.
> >> >
> >> > I don't buy that: if you're trying to align to the cache size then the gaps are
> >> > the whole point.  IIUC the 64-byte cache lines come from DDR, not XLEN, so
> >> > there's really no reason for these to be different between the base ISAs.
> >> >
> >>
> >> Got your point. I noticed this when fixing the resource tree issue
> >> where the SMP_CACHE_BYTES
> >> alignment was not intentional but causing the issue. The real issue
> >> was solved via another patch in this series though.
> >>
> >> Just to clarify, if the allocation function intends to allocate
> >> consecutive memory, it should use 32 instead of SMP_CACHE_BYTES.
> >> This will lead to a #ifdef macro in the code.
> >>
> >> > > In addition to that, Geert Uytterhoeven mentioned some panic on vex32
> >> > > without this patch.
> >> > > I didn't see anything in Qemu though.
> >> >
> >> > Something like that is probably only going to show up on real hardware, QEMU
> >> > doesn't really do anything with the cache line size.  That said, as there's
> >> > nothing in our kernel now related to non-coherent memory there really should
> >> > only be performance issue (at least until we have non-coherent systems).
> >> >
> >> > I'd bet that the change is just masking some other bug, either in the software
> >> > or the hardware.  I'd prefer to root cause this rather than just working around
> >> > it, as it'll probably come back later and in a more difficult way to find.
> >> >
> >>
> >> Agreed. @Geert Uytterhoeven Can you do a further analysis of the panic
> >> you were saying ?
> >> We may need to change an alignment requirement to 32 for RV32 manually
> >> at some place in code.
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
>
> Thanks.  Presumably I need an FPGA to run this?  That will make it tricky to
> find anything here on my end.

In theory, it should work with the LiteX simulation, too.
I.e. follow the instructions at
https://github.com/litex-hub/linux-on-litex-vexriscv
You can find prebuilt binaries at
https://github.com/litex-hub/linux-on-litex-vexriscv/issues/164
Take images/opensbi.bin from opensbi_2020_12_15.zip, and
images/rootfs.cpio from linux_2021_01_11.zip.
Take images/Image from your own kernel build.

Unfortunately it seems the simulator is currently broken, and kernels
(both prebuilt and my own config) hang after
"sched_clock: 64 bits at 1000kHz, resolution 1000ns, wraps every
2199023255500ns"

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
