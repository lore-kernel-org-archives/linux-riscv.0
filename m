Return-Path: <SRS0=xmGS=GL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F67BC433E0
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 19:13:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C53E723975
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jan 2021 19:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C53E723975
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wicc8VTUzkwLb/25m8FUhBueMKH5pGIMScuo1EEZFZ0=; b=tyNb1DXUStL6qH2q8190r9m5J
	9OmUXT7LPey+4z0GlyFP0+Z/9UzGIiAC482S+d5RfEVlbQ/e+hAKwsKLURLpt4NY/mhrzHvfFgTHq
	/iM1uWTCgYu6e/OKirULry2tPN663l3918eeLFB+d/IXYmMTflIXOnwRXeW6X/R2IRXfWk+s5a2E+
	B+tJ+1MuxfVR484LioevG8Re+zbTxSsfzX93UE/Skkuugzjgnw+vliBQAAkMMDZ6jhKgqcG/O9cwy
	9ZjBFcFtJr1Q8mbgDRWEvakqxOGwgmdt5i/vkt2Iaf0J9odGzJFNJ8MFNwnfgBm6sQ5Gh9mbuuESy
	VG1GGHNXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxxBn-0004E5-Sg; Fri, 08 Jan 2021 19:12:47 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxxBk-0004D5-3B
 for linux-riscv@lists.infradead.org; Fri, 08 Jan 2021 19:12:45 +0000
Received: by mail-io1-xd2e.google.com with SMTP id p187so10790567iod.4
 for <linux-riscv@lists.infradead.org>; Fri, 08 Jan 2021 11:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ONgKMPD9HfTy/glol3KYO0y2hPMyQAU//zhyxkzVUhY=;
 b=bssQYAHAtwNUogSebD3eKjGmwdSbJ/36V/wFQEPjKLS9EgQZRM7V4o0TDUeCDobykz
 p+SwW9VhwAAX7rhXHRKTyWPrgsLOoDlTN3EnKc7OG704W04tQQUxz/kmFawfFoZ4IRNd
 L3ehWunTqXSQLm1xWrqGFtVxPsOIylkX2aVoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ONgKMPD9HfTy/glol3KYO0y2hPMyQAU//zhyxkzVUhY=;
 b=YtHGSVn9gmNGlEJsi8DvtTpl9wvW/Ey4DzwyGGdcxRUN/FayXjFVlN+9PAjG5Aj4Bv
 E6S2ygHPVPwLVmzq0PYirxk7G9mD8i98v9tnCJ0jdHMVfsptme4XE3U42CL9Ha5fM8Be
 3w1qI5uVInHhvgJlzkjTIvBDzQRwBQoStpEwqpCKhyVUujE5gYc9rftEdKlAzFKzSshh
 Xj0SjXXez4B1UCz9JiAVo+O6XfKeR2y0TdpVm13hNrDSlUgplHIf0iCWnzNyMmmwVsGF
 fffcBrIqy5uGPC+qEVjpWNInrANEWi9ZjPt1ZrTrjVNWyfG2YgdpX36HMLQTLNJX8DSl
 AmeQ==
X-Gm-Message-State: AOAM531xbVPdMYxO8PCmWG4VKA6oJwlxqb8lqLZxkfsvkyxYzNxtZa0j
 WOxn/x1YMe6G4gHRx9v6vJzjzRYxe59eHxUHK2y1
X-Google-Smtp-Source: ABdhPJzfpJCjoEIuIo0tj669nhXWbaF1NB39rAzkEui0WvOumungvOQNdqKxVnvhf17/m38Fa7pYwYM3Zr15kLYjb5o=
X-Received: by 2002:a02:6a0e:: with SMTP id l14mr4706368jac.58.1610133159985; 
 Fri, 08 Jan 2021 11:12:39 -0800 (PST)
MIME-Version: 1.0
References: <3ba42880e5b43fc238aac8d30da271516fb281ac.camel@gmail.com>
 <CAMuHMdXFf4=7D_SLBgju2qaUzwC8dMkxq3zWDTmZ3AgWkBMQig@mail.gmail.com>
In-Reply-To: <CAMuHMdXFf4=7D_SLBgju2qaUzwC8dMkxq3zWDTmZ3AgWkBMQig@mail.gmail.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 8 Jan 2021 11:12:28 -0800
Message-ID: <CAOnJCU+pwTMktUfcY_GrL6_tfk8APyh7jOh=VJtCW2B8=t4wnw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_141244_263467_9DC5E4EE 
X-CRM114-Status: GOOD (  22.23  )
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

On Fri, Jan 8, 2021 at 8:37 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Sebastien,
>
> On Mon, Nov 16, 2020 at 1:59 PM Sebastien Van Cauwenberghe
> <svancau@gmail.com> wrote:
> > From 5690c2f91d87a007babb13e2d2c9c45d1ff68b7a Mon Sep 17 00:00:00 2001
> > From: Sebastien Van Cauwenberghe <svancau@gmail.com>
> > Date: Mon, 16 Nov 2020 13:37:32 +0100
> > Subject: [PATCH] riscv: Align on L1_CACHE_BYTES when STRICT_KERNEL_RWX is
> >  disabled
> >
> > Allows the sections to be aligned on smaller boundaries and
> > therefore results in a smaller kernel image size.
> >
> > Signed-off-by: Sebastien Van Cauwenberghe <svancau@gmail.com>
>
> Thanks for your patch!
>
> > --- a/arch/riscv/include/asm/set_memory.h
> > +++ b/arch/riscv/include/asm/set_memory.h
> > @@ -27,14 +27,14 @@ int set_direct_map_default_noflush(struct page *page);
> >
> >  #endif /* __ASSEMBLY__ */
> >
> > -#ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
> > +#ifdef CONFIG_STRICT_KERNEL_RWX
> >  #ifdef CONFIG_64BIT
> >  #define SECTION_ALIGN (1 << 21)
> >  #else
> >  #define SECTION_ALIGN (1 << 22)
> >  #endif
> > -#else /* !CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> > +#else /* !CONFIG_STRICT_KERNEL_RWX */
> >  #define SECTION_ALIGN L1_CACHE_BYTES
> > -#endif /* CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
> > +#endif /* CONFIG_STRICT_KERNEL_RWX */
> >
> >  #endif /* _ASM_RISCV_SET_MEMORY_H */
>
> Since commit 19a00869028f4a28 ("RISC-V: Protect all kernel sections
> including init early"), you also need (whitespace-damaged-gmail-patch):
>
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -293,6 +293,8 @@ void free_initmem(void)
>         unsigned long init_begin = (unsigned long)__init_begin;
>         unsigned long init_end = (unsigned long)__init_end;
>
> -       set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
> +       if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +               set_memory_rw_nx(init_begin,
> +                                (init_end - init_begin) >> PAGE_SHIFT);
>         free_initmem_default(POISON_FREE_INITMEM);
>  }
>

Thanks for the fix. I guess you need to disable
CONFIG_STRICT_KERNEL_RWX explicitly
to notice this issue.

> Else it crashes here without any kernel output.
>
> Feel free to fold this into your patch.
>

IMO, this can be a separate patch with Fixes tag.

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
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
