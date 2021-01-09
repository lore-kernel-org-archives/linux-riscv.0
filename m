Return-Path: <SRS0=RTcI=GM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2C7C433DB
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 09:35:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF7823A3C
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jan 2021 09:35:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EF7823A3C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CIhmeVRFQ0CidBr5c2ikXHBGGH/Zfiq6ES5IfiMqVdk=; b=N9Ac8hTDp0xE7A17w4Vs3mONb
	TAtESobuChoSi4Z8rSsWOM1uxPfP9wJqeRe/aumR2B0wy2nEvDZSPOBJsjc7xiXF0TE6pbY+j0xvi
	xHskVjzQEOnLMBKBvEp/1y2zkwJLhVOIpuGLBDckM02RGWI4RVz8kC25kAGfG0vJehW5MaDmwKWxZ
	dD2/r42m3jJMhcjql5zQ4m77kjkjAL2n1tgvbmuAbd64anLqrhZcjabzyhx673FuZWVitFtxl0hQl
	Eoi1UdJKn1lC7ZRvy7ZOwAcieFzbg/0ZzRs11DptFYDzkMAE2FfuXR5tMk02NF/GfNf+aic4Twz7L
	zQnA1kj0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyAeX-0006yM-7X; Sat, 09 Jan 2021 09:35:21 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyAeR-0006xz-1D
 for linux-riscv@lists.infradead.org; Sat, 09 Jan 2021 09:35:18 +0000
Received: by mail-oi1-f179.google.com with SMTP id s2so14399825oij.2
 for <linux-riscv@lists.infradead.org>; Sat, 09 Jan 2021 01:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NvCuHktTX4d0abDTBExnGCodoVQo8XSUX2dp7JNucHQ=;
 b=pJiqvJolxAGFGimBjBpkLUZ1QmdjxzJ4lSiw4hkCnf8TbHmXYd/ChsKPkAK63X2IM5
 XP8WlnSP7y3/iOvQ3lmt3XWhOB0tVa/E338c2e+A7ij5bcN5dmoHdXwlK7+scvhK72Uw
 0FISCPG3wmHcJI3DTefmhWp49QTeNEG8n/MHNlHDniWrkx5JDmrGbTiMLF0rr9UBTsq1
 78CboTdBxhW5rqanRpCjseBZCbj1S0EFFsdsHC3KV1Q7PlbBhHPNz3MdHihWzYolR+Q2
 T7XN1qClN6jJ1MffkwlHHVeDh0Vl43qK3QAgO8sU8CMqf6OjhdQBdAcMJaE3aGz3yuJf
 hOuA==
X-Gm-Message-State: AOAM531AucU8DwvCvHqfoeEF3DYDkiYg76f8v6mnEQ2MtTf4mroF/fyJ
 pm70bZyAOM5oBI1YWmqk9Y2F20NcTRyh+jdEb9Y=
X-Google-Smtp-Source: ABdhPJy0Cajyd/kz1omEWWlfVN0dXNhvN3/xsaUVskWXKnlwaW1PQNYIyiFx9ZdQl3hAKCPN2QB92KqNBysq0s7OeVM=
X-Received: by 2002:aca:3cc5:: with SMTP id j188mr4811645oia.54.1610184914230; 
 Sat, 09 Jan 2021 01:35:14 -0800 (PST)
MIME-Version: 1.0
References: <3ba42880e5b43fc238aac8d30da271516fb281ac.camel@gmail.com>
 <CAMuHMdXFf4=7D_SLBgju2qaUzwC8dMkxq3zWDTmZ3AgWkBMQig@mail.gmail.com>
 <CAOnJCU+pwTMktUfcY_GrL6_tfk8APyh7jOh=VJtCW2B8=t4wnw@mail.gmail.com>
In-Reply-To: <CAOnJCU+pwTMktUfcY_GrL6_tfk8APyh7jOh=VJtCW2B8=t4wnw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 9 Jan 2021 10:35:03 +0100
Message-ID: <CAMuHMdWSOQkY+ZFg1FrwSZp2NX4ofzxnBgxC_se-QpfMYThcFg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX
To: Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_043515_123247_D7E6802C 
X-CRM114-Status: GOOD (  20.24  )
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

Hi Atish,

On Fri, Jan 8, 2021 at 8:12 PM Atish Patra <atishp@atishpatra.org> wrote:
> On Fri, Jan 8, 2021 at 8:37 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Nov 16, 2020 at 1:59 PM Sebastien Van Cauwenberghe
> > <svancau@gmail.com> wrote:
> > > From 5690c2f91d87a007babb13e2d2c9c45d1ff68b7a Mon Sep 17 00:00:00 2001
> > > From: Sebastien Van Cauwenberghe <svancau@gmail.com>
> > > Date: Mon, 16 Nov 2020 13:37:32 +0100
> > > Subject: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX is
> > >  disabled
> > >
> > > Allows the sections to be aligned on smaller boundaries and
> > > therefore results in a smaller kernel image size.
> > >
> > > Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/riscv/include/asm/set_memory.h
> > > +++ b/arch/riscv/include/asm/set_memory.h
> > > @@ -27,14 +27,14 @@ int set_direct_map_default_noflush(struct page *page);
> > >
> > >  #endif /* __ASSEMBLY__ */
> > >
> > > -#ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
> > > +#ifdef CONFIG_STRICT_KERNEL_RWX
> > >  #ifdef CONFIG_64BIT
> > >  #define SECTION_ALIGN (1 << 21)
> > >  #else
> > >  #define SECTION_ALIGN (1 << 22)
> > >  #endif
> > > -#else /* !CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> > > +#else /* !CONFIG_STRICT_KERNEL_RWX */
> > >  #define SECTION_ALIGN L1_CACHE_BYTES
> > > -#endif /* CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> > > +#endif /* CONFIG_STRICT_KERNEL_RWX */
> > >
> > >  #endif /* _ASM_RISCV_SET_MEMORY_H */
> >
> > Since commit 19a00869028f4a28 ("RISC-V: Protect all kernel sections
> > including init early"), you also need (whitespace-damaged-gmail-patch):
> >
> > --- a/arch/riscv/kernel/setup.c
> > +++ b/arch/riscv/kernel/setup.c
> > @@ -293,6 +293,8 @@ void free_initmem(void)
> >         unsigned long init_begin = (unsigned long)__init_begin;
> >         unsigned long init_end = (unsigned long)__init_end;
> >
> > -       set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
> > +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> > +               set_memory_rw_nx(init_begin,
> > +                                (init_end - init_begin) >> PAGE_SHIFT);
> >         free_initmem_default(POISON_FREE_INITMEM);
> >  }
> >
>
> Thanks for the fix. I guess you need to disable
> CONFIG_STRICT_KERNEL_RWX explicitly
> to notice this issue.

Indeed.

> > Else it crashes here without any kernel output.
> >
> > Feel free to fold this into your patch.
> >
>
> IMO, this can be a separate patch with Fixes tag.

Why? Sebastien's patch (which hasn't been applied yet) no longer works
due to interaction with a commit in v5.11-rc1.

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
