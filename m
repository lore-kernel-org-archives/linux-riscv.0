Return-Path: <SRS0=aCEi=AY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAC6C433E4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 13:20:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E40D20773
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2020 13:20:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I6+o38rF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E40D20773
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AbYHrD7jy7nVFSrDKmFWPEpq5MgOxoyGDvaX5Du6pJk=; b=I6+o38rFF98zyHx/PCZuegAut
	pu3CAvSrGXfvkRTF/IT7nTcM2CP+yHTKJu/EHLNYktRroTmxMgdD2MuXM1mhoA/gGeJCXgWAHRQLX
	YTBz+oWx4S0fgcVXuLHHPojao6x1xWYO6liKeWNEt0OT+ksSy3ZrME0ovLYxkUkv1MBDJUB976ZGe
	vS5OpXWwpLnHoBiLFvmovHIxvIDGPKxJ8lCE2C7inqgkrTMe/pFG5GAHL2j90zW/3UO95Xcd1dqTU
	CLhr+Sk2kvPeoDORk6rt+e+b8bNrzqwdGn+VOcjO1fObUA5hl7g2efl/GrTxLoiLsrZvBfWvX3p6I
	xwHKtNJmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juyNA-00063A-4W; Mon, 13 Jul 2020 13:19:56 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juyN8-00062l-6X
 for linux-riscv@lists.infradead.org; Mon, 13 Jul 2020 13:19:55 +0000
Received: by mail-ot1-f65.google.com with SMTP id 72so9472227otc.3
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 06:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SATb1dq9lhpVtePq4rLhojB0Hr7gHjZG7fllFCUlzZU=;
 b=ikyrjHksa/5TGuUtX8c7evatDFhzUl5kvrxe/2Btv37ksmAVIL55/kzOvjOO9zqz/N
 0sxocoielw9KzOJbXFX6+rQHvSXdS+oWVEM8Dvq9oyJRZ60JF7UkdnJfeWe7Y992dUAB
 TAEK+V9jAcI1fXt3UsIa2frTdTDSwnFMJXarwC7QtwoarULwEBjbbc2pVKG250E5LnSf
 U7aAC2m2gRG9Lam1z7xo4XIYfsiCqJdYIATRusYj17rQ9/U3b31Y2uzhqYLfiQZ+WWcG
 G6PXnm4T1NOQRJfOjzGGU03I6/tirONWyqmLrBYswYJoquGBrzG0fRkHUwOWScJE+m+J
 zt1A==
X-Gm-Message-State: AOAM5306Nq+EDR/6PHoq6ENTH2736+GW/DjVlu6v974TcEpTMAMwIPs5
 l/TQy98+deKSkiCUIoYSCV643Csz0JhhldJbkbQ=
X-Google-Smtp-Source: ABdhPJxrDHVPb8cSNkcVN2tMRT9a1iKussPsrWGym59W6ecTQuAg4tTKmjvM3pVTLMwzznFcAu0e7d72NIcQofeksAI=
X-Received: by 2002:a05:6830:1451:: with SMTP id
 w17mr57441798otp.250.1594646393513; 
 Mon, 13 Jul 2020 06:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200710135706.537715-1-hch@lst.de>
 <20200710135706.537715-6-hch@lst.de>
 <20200713122148.GA51007@lakrids.cambridge.arm.com>
In-Reply-To: <20200713122148.GA51007@lakrids.cambridge.arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2020 15:19:42 +0200
Message-ID: <CAMuHMdUCmEeU0G9wkUxZKm5tC9YoB-KXSSCLKwpSia746Myebw@mail.gmail.com>
Subject: Re: [PATCH 5/6] uaccess: add force_uaccess_{begin,end} helpers
To: Mark Rutland <mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_091954_274089_3ABE6862 
X-CRM114-Status: GOOD (  23.19  )
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, Nick Hu <nickhu@andestech.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Vincent Chen <deanbo422@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Mark,

On Mon, Jul 13, 2020 at 2:21 PM Mark Rutland <mark.rutland@arm.com> wrote:
> On Fri, Jul 10, 2020 at 03:57:05PM +0200, Christoph Hellwig wrote:
> > Add helpers to wraper the get_fs/set_fs magic for undoing any damange
> > done by set_fs(KERNEL_DS).  There is no real functional benefit, but this
> > documents the intent of these calls better, and will allow stubbing the
> > functions out easily for kernels builds that do not allow address space
> > overrides in the future.
>
> > diff --git a/arch/m68k/include/asm/tlbflush.h b/arch/m68k/include/asm/tlbflush.h
> > index 191e75a6bb249e..30471549e1e224 100644
> > --- a/arch/m68k/include/asm/tlbflush.h
> > +++ b/arch/m68k/include/asm/tlbflush.h
> > @@ -13,13 +13,13 @@ static inline void flush_tlb_kernel_page(void *addr)
> >       if (CPU_IS_COLDFIRE) {
> >               mmu_write(MMUOR, MMUOR_CNL);
> >       } else if (CPU_IS_040_OR_060) {
> > -             mm_segment_t old_fs = get_fs();
> > -             set_fs(KERNEL_DS);
> > +             mm_segment_t old_fs = force_uaccess_begin();
> > +
>
> This used to set KERNEL_DS, and now it sets USER_DS, which looks wrong
> superficially.

Thanks for noticing, and sorry for missing that myself.

The same issue is present for SuperH:

    -               set_fs(KERNEL_DS);
    +               oldfs = force_uaccess_begin();

So the patch description should be:

    "Add helpers to wraper the get_fs/set_fs magic for undoing any damage
     done by set_fs(USER_DS)."

and leave alone users setting KERNEL_DS?

> If the new behaviour is fine it suggests that the old behaviour was
> wrong, or that this is superfluous and could go entirely.
>
> Geert?

Nope, on m68k, TLB cache operations operate on the current address space.
Hence to flush a kernel TLB entry, you have to switch to KERNEL_DS first.

If we're guaranteed to be already using KERNEL_DS, I guess the
address space handling can be removed.  But can we be sure?


> >               __asm__ __volatile__(".chip 68040\n\t"
> >                                    "pflush (%0)\n\t"
> >                                    ".chip 68k"
> >                                    : : "a" (addr));
> > -             set_fs(old_fs);
> > +             force_uaccess_end(old_fs);
> >       } else if (CPU_IS_020_OR_030)
> >               __asm__ __volatile__("pflush #4,#4,(%0)" : : "a" (addr));
>
> > +/*
> > + * Force the uaccess routines to be wired up for actual userspace access,
> > + * overriding any possible set_fs(KERNEL_DS) still lingering around.  Undone
> > + * using force_uaccess_end below.
> > + */
> > +static inline mm_segment_t force_uaccess_begin(void)
> > +{
> > +     mm_segment_t fs = get_fs();
> > +
> > +     set_fs(USER_DS);
> > +     return fs;
> > +}
> > +
> > +static inline void force_uaccess_end(mm_segment_t oldfs)
> > +{
> > +     set_fs(oldfs);
> > +}

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
