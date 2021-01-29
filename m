Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6969CC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:03:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1018E64DE3
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1018E64DE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q+qZ5xYi1kXDses6MKDqcW/SVL8hqyV0ImidPWE9ZHs=; b=M1lw6mmHOtxyqPVtmpekZiSpF
	xHTBwkqKGcBU70cSZVxeeLLKGbG6WEBjiLbBu6Q/Bc5cUtFY9TugUx2xvUJv3t7+YYvExChHE4gyf
	NBRGKUsOKtBJy93u29eHH+DJ2Lz5cX2694arap7st3ASzd5KlhrJomwJmJjqKOe3794tMyRqZn7Xp
	AkLMdcCfCmUq1WYCFKTaJU+T1lU+aXLwzSJNwedC8mAi7HtgeVArKvO3iQcjp1oLz5yy0Tc9IYXjI
	Z9Oi6drFTmw/U4mYQ8GLUbnxWML6O2aDbGyg0Ss0NbzUh6g3OmOlgF/kkTM8SQ+CltTgIrL+1Rsuz
	At71NUR/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Z34-0006Fo-SX; Fri, 29 Jan 2021 19:03:14 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Z32-0006F6-Gv
 for linux-riscv@lists.infradead.org; Fri, 29 Jan 2021 19:03:13 +0000
Received: by mail-io1-xd2e.google.com with SMTP id h11so10371940ioh.11
 for <linux-riscv@lists.infradead.org>; Fri, 29 Jan 2021 11:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=klIusWUoJ/Hron7cItKtsF4YWgKJsObiyCX5BYQnJDY=;
 b=L0hqCSKVF1f1klLHzc+fDvxcXIISIWx8Xgji3Ai60LPe8wp/erH5Ip4dSlMt8aEWXg
 83yjx4CoiUC6Gd1NzHPjXZB9xYg8V5hG+KbARYtP+jsQ8ZlLFti6WcSWqAOZv4Z2I+QU
 GgTsrB9wyhp5Br4QT21yEy0+j8p3ZrrBltpYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=klIusWUoJ/Hron7cItKtsF4YWgKJsObiyCX5BYQnJDY=;
 b=umpOxAaj+TMKYdQTspZMu3oDqEBVEqRirq8BZ0PPWibJqkllTllo9Z6C/eo6ULfC50
 Vx28VJy/5D6MEP7FOoR/jxsj+LjGAE+Y3W2EiMyLqpi+tI+rjxeLPe9EQsa8VMhzNkzx
 CWCW2KefMHBUu/6EnphbNK3aKvYr24eiLLBWLMmP0yHAP4Z1wFkCl+KF5d1IxZgVZhDr
 7f3Iuzhq6/6XjbYpno96oOEP6oS7Tz4uT0AuPtntSUzxzbhIuzgWnD3Sg9Sxhzl57DWy
 +w5TM5N4zh7CHlE+Wi2F/KfWimCBOBl9ljBZqvuvTUrDImC8d2Ky2C6pZXbmKMV2gxsN
 FUvw==
X-Gm-Message-State: AOAM533E44FJ1TNuagdR9XwWwujfqSAiZ247GbGi0zqm8oQBh4hHitTG
 VHaLg40hStwI0alSU2XLeWXMQfwfdFfPcIu+jZmP
X-Google-Smtp-Source: ABdhPJwsJqFDwcbDhscdLNvF9uM3IvbWY8aaiABfh+5ejGHdagXpZuUhm2+ApFrKJf+RQu7zPJIaUBpBFKKPQqqIzoo=
X-Received: by 2002:a5e:aa15:: with SMTP id s21mr4241141ioe.113.1611946990366; 
 Fri, 29 Jan 2021 11:03:10 -0800 (PST)
MIME-Version: 1.0
References: <3ba42880e5b43fc238aac8d30da271516fb281ac.camel@gmail.com>
 <CAMuHMdXFf4=7D_SLBgju2qaUzwC8dMkxq3zWDTmZ3AgWkBMQig@mail.gmail.com>
 <CAOnJCU+pwTMktUfcY_GrL6_tfk8APyh7jOh=VJtCW2B8=t4wnw@mail.gmail.com>
 <CAMuHMdWSOQkY+ZFg1FrwSZp2NX4ofzxnBgxC_se-QpfMYThcFg@mail.gmail.com>
 <CAOnJCUK8FdrhYXhFpGPfzpEy8wxpbdSQQn-D6mCPCwxYrNyuog@mail.gmail.com>
In-Reply-To: <CAOnJCUK8FdrhYXhFpGPfzpEy8wxpbdSQQn-D6mCPCwxYrNyuog@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 29 Jan 2021 11:02:58 -0800
Message-ID: <CAOnJCUJ-QbDHoMzrGE0QBJaBpFWMaYxJum=UUFY+UzRWLfrZ_g@mail.gmail.com>
Subject: Re: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_140313_046298_C8425643 
X-CRM114-Status: GOOD (  28.96  )
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
Cc: Sebastien Van Cauwenberghe <svancau@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 11:40 AM Atish Patra <atishp@atishpatra.org> wrote:
>
> On Sat, Jan 9, 2021 at 1:35 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Atish,
> >
> > On Fri, Jan 8, 2021 at 8:12 PM Atish Patra <atishp@atishpatra.org> wrote:
> > > On Fri, Jan 8, 2021 at 8:37 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Mon, Nov 16, 2020 at 1:59 PM Sebastien Van Cauwenberghe
> > > > <svancau@gmail.com> wrote:
> > > > > From 5690c2f91d87a007babb13e2d2c9c45d1ff68b7a Mon Sep 17 00:00:00 2001
> > > > > From: Sebastien Van Cauwenberghe <svancau@gmail.com>
> > > > > Date: Mon, 16 Nov 2020 13:37:32 +0100
> > > > > Subject: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX is
> > > > >  disabled
> > > > >
> > > > > Allows the sections to be aligned on smaller boundaries and
> > > > > therefore results in a smaller kernel image size.
> > > > >
> > > > > Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/arch/riscv/include/asm/set_memory.h
> > > > > +++ b/arch/riscv/include/asm/set_memory.h
> > > > > @@ -27,14 +27,14 @@ int set_direct_map_default_noflush(struct page *page);
> > > > >
> > > > >  #endif /* __ASSEMBLY__ */
> > > > >
> > > > > -#ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
> > > > > +#ifdef CONFIG_STRICT_KERNEL_RWX
> > > > >  #ifdef CONFIG_64BIT
> > > > >  #define SECTION_ALIGN (1 << 21)
> > > > >  #else
> > > > >  #define SECTION_ALIGN (1 << 22)
> > > > >  #endif
> > > > > -#else /* !CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> > > > > +#else /* !CONFIG_STRICT_KERNEL_RWX */
> > > > >  #define SECTION_ALIGN L1_CACHE_BYTES
> > > > > -#endif /* CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> > > > > +#endif /* CONFIG_STRICT_KERNEL_RWX */
> > > > >
> > > > >  #endif /* _ASM_RISCV_SET_MEMORY_H */
> > > >
> > > > Since commit 19a00869028f4a28 ("RISC-V: Protect all kernel sections
> > > > including init early"), you also need (whitespace-damaged-gmail-patch):
> > > >
> > > > --- a/arch/riscv/kernel/setup.c
> > > > +++ b/arch/riscv/kernel/setup.c
> > > > @@ -293,6 +293,8 @@ void free_initmem(void)
> > > >         unsigned long init_begin = (unsigned long)__init_begin;
> > > >         unsigned long init_end = (unsigned long)__init_end;
> > > >
> > > > -       set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
> > > > +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > > > +               set_memory_rw_nx(init_begin,
> > > > +                                (init_end - init_begin) >> PAGE_SHIFT);
> > > >         free_initmem_default(POISON_FREE_INITMEM);
> > > >  }
> > > >
> > >
> > > Thanks for the fix. I guess you need to disable
> > > CONFIG_STRICT_KERNEL_RWX explicitly
> > > to notice this issue.
> >
> > Indeed.
> >
> > > > Else it crashes here without any kernel output.
> > > >
> > > > Feel free to fold this into your patch.
> > > >
> > >
> > > IMO, this can be a separate patch with Fixes tag.
> >
> > Why? Sebastien's patch (which hasn't been applied yet) no longer works
> > due to interaction with a commit in v5.11-rc1.
> >
>
> Technically, Sebastien's patch was an improvement while this one fixes
> an issue so that the Fixes tag can be added.
> But the original patch was merged in this cycle only. So these changes
> can be a single change as long as it is sent as an rc fix.
> I am fine with either way.
>
> @Sebastien: Can you send the updated patch soon so that palmer can
> pull this one as an RC fix?
>

I have sent the fixes to the mailing list with appropriate tags.

>
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
>
>
>
> --
> Regards,
> Atish



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
