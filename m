Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 367DBC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 05:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E684560295
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 05:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E684560295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YtA6RgecHUGQwDPjpmw1fQrJeC6/B1GUtJBBp8kjvOs=; b=d6PByhxJ1cbNlq
	nTrI4pzzomjZpDOK7PQBYnxXPJP6VqE/VjQmMd6B9AVT0H844Yal1eiQj2tdYMcbcbnca6GNE5XgN
	MF5zfnFO02X6/kT14mtra17GW2OkHxdo5sYnufhcnyiVLJnfWI070GM85iiXqsx/KhrMkkxiOzMnF
	ZvkNTa03yJE+mvn7sQUNggzUIpRrSFr+Ve6iaEqvRyzWujfZT7sVXV5djWHJQ6UeC5WqlU+2tSJVX
	KD1I3s5wNSRL5DPc92LMD7P7YhoT4twMks8i5Jj8LEQco0h7zeFBkApo30esub4J8HoeSOXFyBxh6
	Y+3wA+zsoEhFjs3XI3fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfy3t-006u53-6u; Thu, 28 Oct 2021 05:34:49 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfy3p-006u4L-Li
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 05:34:47 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7EDD93F177
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 05:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635399284;
 bh=lNwK2X60c7f9X7KPf6h2ScbG4X9q5dg3Bv4L43p8gyc=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=VR6NgBZSdn17dt4WZtBnwIcF+UYQO4Fy2DIfnhwzmgrJ9siB0Dtkdqls7jzpXcMIq
 eeuYzrkajXBEH5x0v0avekOhFu5Bo/D9LdNf0FMfCH//9kdpyjnIplIqUHhAMGUYL6
 6lUfcCMbPy4asWiWNuUl85L1awn0cKsg75dd1RDhEnEeqP9BJn4Z5vBuLVySxtIruV
 aLB6wBd3IJ5Moxer0r5/gx9eXbGxdnqSVmpgDTZG3akB6m8OSSsiq7wFygdFlcwcIi
 HnaaXG7kXtR10ZkzlmH0FYMHz+cZD4gloob3jv4LpqyNi/vp2w+bPnHyljYPxlxiL3
 Jirda2nj0FLMw==
Received: by mail-ed1-f70.google.com with SMTP id
 v21-20020a056402349500b003dfa41553f3so895908edc.11
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 22:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lNwK2X60c7f9X7KPf6h2ScbG4X9q5dg3Bv4L43p8gyc=;
 b=GPOHcOeIm6elJS+miheE51IqY7corBU0oe87of4BDb/g9DVuKid08Wwl0kb1PaTUPM
 E4qxpvQ+Zh1a2No3bueCW+CvHsmzU92s7KhiKOKq1N0QHQNGlYXkFTkEJz3maYVjWf0x
 w+rt/HZlq0WCnoC2frztiWI+VmRN8NR1yn0OeRav0zgvrUzogkbGVg0fhfids5w7jvIT
 HqLp9Fj6YQ2NX5ABUuQzNAX9odi2jzN1qmo5bF4U0CJQziLX5qOUCFRsZBSEnJNgdP6D
 M1nSErrSJnqW6UAMwnUxGJMN30H534qPf+R/ThWCqDjTlSYix5vwyLwefxFbz7/lTPDS
 VzJg==
X-Gm-Message-State: AOAM533lmSeniF2hC091XC0GUz4qVuU5QxtD4PFvSIOkvJ3VzQGe/v4A
 y+dor2h2QIGuMoo2xEZU1gVMsq7AXa/TwHa8u1uJeq/w3NmOKhZnSb+ZFiwCtBbqUN/ug5uKamU
 eiTm7bsPRf2BGyJYgLGz1yHRyQUyWJ5HCEpBl6rYrIhKEgYmojOW4sSRP8Rd31A==
X-Received: by 2002:a17:907:d22:: with SMTP id
 gn34mr2588262ejc.463.1635399284147; 
 Wed, 27 Oct 2021 22:34:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlcFK3g0aghHl1OqGtK1Bhn/y6XrnUQws1ghf+7gXW2GywHn20ADq7fIm32Iz1kaJxVTbcmDaMD6qhdD4uHhc=
X-Received: by 2002:a17:907:d22:: with SMTP id
 gn34mr2588238ejc.463.1635399283919; 
 Wed, 27 Oct 2021 22:34:43 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zEjCuUCxqTtbox2K8c=ymHC8X97LV6CSO3ydJKgRR9cBXUEw@mail.gmail.com>
 <mhng-897d082f-5ca4-4d77-a69d-4efaa456bf3b@palmerdabbelt-glaptop>
 <CA+zEjCvF7yCbA9KvsD+OaGXhEAF4x_jBB+OZ3C-Q6RctYSjd7w@mail.gmail.com>
In-Reply-To: <CA+zEjCvF7yCbA9KvsD+OaGXhEAF4x_jBB+OZ3C-Q6RctYSjd7w@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 28 Oct 2021 07:34:32 +0200
Message-ID: <CA+zEjCus8+jzn074GwqhJ54Y180RASr_YaC=6zdBZSzonEtjDA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Fix asan-stack clang build
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, 
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, nathan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_223445_866584_BF5C3D15 
X-CRM114-Status: GOOD (  38.71  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 28, 2021 at 7:30 AM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> On Thu, Oct 28, 2021 at 7:02 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > On Wed, 27 Oct 2021 21:15:28 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> > > On Thu, Oct 28, 2021 at 1:06 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> > >>
> > >> On Tue, 26 Oct 2021 21:58:42 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> > >> > Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
> > >> > Kconfig, it prevents asan-stack from getting disabled with clang even
> > >> > when CONFIG_KASAN_STACK is disabled: fix this by defining the
> > >> > corresponding config.
> > >> >
> > >> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> > >> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > >> > ---
> > >> >  arch/riscv/Kconfig             | 6 ++++++
> > >> >  arch/riscv/include/asm/kasan.h | 3 +--
> > >> >  arch/riscv/mm/kasan_init.c     | 3 +++
> > >> >  3 files changed, 10 insertions(+), 2 deletions(-)
> > >> >
> > >> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > >> > index c1abbc876e5b..79250b1ed54e 100644
> > >> > --- a/arch/riscv/Kconfig
> > >> > +++ b/arch/riscv/Kconfig
> > >> > @@ -162,6 +162,12 @@ config PAGE_OFFSET
> > >> >       default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
> > >> >       default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
> > >> >
> > >> > +config KASAN_SHADOW_OFFSET
> > >> > +     hex
> > >> > +     depends on KASAN_GENERIC
> > >> > +     default 0xdfffffc800000000 if 64BIT
> > >> > +     default 0xffffffff if 32BIT
> > >>
> > >> I thought I posted this somewhere, but this is exactly what my first
> > >> guess was.  The problem is that it's hanging on boot for me.  I don't
> > >> really have anything exotic going on, it's just a defconfig with
> > >> CONFIG_KASAN=y running in QEMU.
> > >>
> > >> Does this boot for you?
> > >
> > > Yes with the 2nd patch of this series which fixes the issue
> > > encountered here. And that's true I copied/pasted this part of your
> > > patch which was better than what I had initially done, sorry I should
> > > have mentioned you did that, please add a Codeveloped-by or something
> > > like that.
> >
> > Not sure if I'm missing something, but it's still not booting for me.
> > I've put what I'm testing on palmer/to-test, it's these two on top of
> > fixes and merged into Linus' tree
> >
> >     *   6d7d351902ff - (HEAD -> to-test, palmer/to-test) Merge remote-tracking branch 'palmer/fixes' into to-test (7 minutes ago) <Palmer Dabbelt>
> >     |\
> >     | * 782551edf8f8 - (palmer/fixes) riscv: Fix CONFIG_KASAN_STACK build (6 hours ago) <Alexandre Ghiti>
> >     | * 47383e5b3c4f - riscv: Fix asan-stack clang build (6 hours ago) <Alexandre Ghiti>
> >     | * 64a19591a293 - (riscv/fixes) riscv: fix misalgned trap vector base address (9 hours ago) <Chen Lu>
> >     * |   1fc596a56b33 - (palmer/master, linus/master, linus/HEAD, master) Merge tag 'trace-v5.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (11 hours ago) <Linus Torvalds>
> >
> > Am I missing something else?
>
> Hmm, that's weird, I have just done the same: cherry-picked both my
> commits on top of fixes (64a19591a293) and it boots fine with KASAN
> enabled. Maybe a config thing? I pushed my branch here:
> https://github.com/AlexGhiti/riscv-linux/tree/int/alex/kasan_stack_fixes_rebase

I pushed the config I use and that boots in that branch, maybe there's
another issue somewhere.

>
> >
> > >
> > > Thanks,
> > >
> > > Alex
> > >
> > >>
> > >> > +
> > >> >  config ARCH_FLATMEM_ENABLE
> > >> >       def_bool !NUMA
> > >> >
> > >> > diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> > >> > index a2b3d9cdbc86..b00f503ec124 100644
> > >> > --- a/arch/riscv/include/asm/kasan.h
> > >> > +++ b/arch/riscv/include/asm/kasan.h
> > >> > @@ -30,8 +30,7 @@
> > >> >  #define KASAN_SHADOW_SIZE    (UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
> > >> >  #define KASAN_SHADOW_START   KERN_VIRT_START
> > >> >  #define KASAN_SHADOW_END     (KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
> > >> > -#define KASAN_SHADOW_OFFSET  (KASAN_SHADOW_END - (1ULL << \
> > >> > -                                     (64 - KASAN_SHADOW_SCALE_SHIFT)))
> > >> > +#define KASAN_SHADOW_OFFSET  _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> > >> >
> > >> >  void kasan_init(void);
> > >> >  asmlinkage void kasan_early_init(void);
> > >> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> > >> > index d7189c8714a9..8175e98b9073 100644
> > >> > --- a/arch/riscv/mm/kasan_init.c
> > >> > +++ b/arch/riscv/mm/kasan_init.c
> > >> > @@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
> > >> >       uintptr_t i;
> > >> >       pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
> > >> >
> > >> > +     BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
> > >> > +             KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
> > >> > +
> > >> >       for (i = 0; i < PTRS_PER_PTE; ++i)
> > >> >               set_pte(kasan_early_shadow_pte + i,
> > >> >                       mk_pte(virt_to_page(kasan_early_shadow_page),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
