Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504F9C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 07:13:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03CE260FF2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 07:13:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 03CE260FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcLfA+0U+fRd/fFMLtrofrcuBh51GuKtTgrQlPQNvWk=; b=fX66Bg+jKoPXUL
	yLditdTydAWNR3H1JKPRp3mmRQh5re9XuCoedBOp08UOagakFYSFt+IAlMutlHqxGf9UzGtgHKxIW
	ZbAFU7C1cwGLFAjCxaFOeSI49SpRBdYADGyUwOy1PiqsEYHV4hpxIBifrpKUjr5I/rSJJwBGIK1pt
	20v8ApCk/VvdOGwodHNj9dFisieEXW0WQCw9INGnaeVzv7ubCP+xzfWf8DvS0XQ+tF8wYc726eWPx
	6U7Ey+Z5tGgz8Ew10CRZMXUtoazCct/qPWui12D3USJEDWnP9qgQhf+sHa9YPCZOhuWMmCiIwb9Ut
	QT+QESf3lyRDMYPa3QHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfzbL-00754a-Cz; Thu, 28 Oct 2021 07:13:27 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfzbI-00753f-7k
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 07:13:26 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B7E4A3F165
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 07:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635405197;
 bh=odvfeEDaRD9GtVNTdM8NO1Yqau879jijgr+/mlFCwcA=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=SG2iTgh7c6spKgqgMTgh+SrMKJ4rhy5ZSVyCrZhprfI9sUa0ARNWxjN+7anJ050dz
 icglZblkbXvg86BX9dRq3tXo4j6/X6l6Mt4zPzxqzqzKAbHpuJtlLkT9PfH16RpJ+P
 DwvxctV6L6petw75K0IrMGoZEayFNzRqvHSM5qdLmpCQq8jZVn/GgSQ5j/OkDjbNYN
 wVtpGRv6Af97Gd8hM5ZSjJ0mHdBEud9RT1Bq2zjduMszj9+i9Bo30TFTBvh/52yrQj
 aqJwGtP/F4qdXnb3x5Cj3XbNsk+eI2ZoUXaLMp/DvJy0pOEaGZ+cxNltsz9pv7Fyij
 VW8RBChlUHN6w==
Received: by mail-ed1-f69.google.com with SMTP id
 o22-20020a056402439600b003dd4f228451so4655558edc.16
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 00:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=odvfeEDaRD9GtVNTdM8NO1Yqau879jijgr+/mlFCwcA=;
 b=NEYmUpz5/BoZmwvYMkgBVHzDUGSf8D+l6CSUn+3R1F46nhujmNzOpt+L/DJzmiV0K9
 DNKqmrpQqDVhkAHv4HDy/2oqT4gdGGNXMZfPByuZaHSotWUGpmdqrU+NhkuxH3ZO+wVI
 Rchb2mnQOU6aUie7uB0+XY2Ga3oJp22eJPOUmtfX20D9CANNQ+VAjzU8BysZbrs2yvZ4
 lHvGLg7p4ZR1W8pF+oS6rtqyDYiayQe8V7DOQ5Hn6F9gnNMOY/4LraaYcR6GEFmTyEh8
 2n678N0tYjb5LpmW5D6iyv7RAzHB9+Z+SmGRn6WPW6tEhGlJNZBIvHAFz8960OpJGp1v
 sxhg==
X-Gm-Message-State: AOAM531B8GzyeGwrKPvSiltPWeZvAZgWv5Hf8A2FZeMLXKAVTN4c5mVr
 RV2/kgZw8mu4+604KxIXmq1QYqFeH9rjrd5P6LNJ/dPDGXzmRg7GtqHty8lj1bo4tdZFKX6DjdA
 jk3QtLt3sWn8Ca2jmluGz24iBJ8P014/VE1Q0qW+GMYKKakGdLpr0ybVna1ZK8g==
X-Received: by 2002:a17:907:d22:: with SMTP id
 gn34mr3130403ejc.463.1635405197377; 
 Thu, 28 Oct 2021 00:13:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk0nDAbtD9AECmNiTtn739UUuuAZr9AaFxmOTmd5txuEcfp070z9krdc2LVyf0o8fVCZ78hEjrwvUXJC465xw=
X-Received: by 2002:a17:907:d22:: with SMTP id
 gn34mr3130368ejc.463.1635405197149; 
 Thu, 28 Oct 2021 00:13:17 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zEjCus8+jzn074GwqhJ54Y180RASr_YaC=6zdBZSzonEtjDA@mail.gmail.com>
 <mhng-3ac5b2b9-c9da-42e5-bc56-d779fb4dd1dd@palmerdabbelt-glaptop>
In-Reply-To: <mhng-3ac5b2b9-c9da-42e5-bc56-d779fb4dd1dd@palmerdabbelt-glaptop>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 28 Oct 2021 09:13:06 +0200
Message-ID: <CA+zEjCv+whmnL_SFf20j06NpikaMtA7MNQ9+o8Zz7=1_nAtTqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Fix asan-stack clang build
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, 
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, nathan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_001324_441496_AA2B51D9 
X-CRM114-Status: GOOD (  45.12  )
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

On Thu, Oct 28, 2021 at 8:45 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 27 Oct 2021 22:34:32 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> > On Thu, Oct 28, 2021 at 7:30 AM Alexandre Ghiti
> > <alexandre.ghiti@canonical.com> wrote:
> >>
> >> On Thu, Oct 28, 2021 at 7:02 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> >
> >> > On Wed, 27 Oct 2021 21:15:28 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> >> > > On Thu, Oct 28, 2021 at 1:06 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >> > >>
> >> > >> On Tue, 26 Oct 2021 21:58:42 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> >> > >> > Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
> >> > >> > Kconfig, it prevents asan-stack from getting disabled with clang even
> >> > >> > when CONFIG_KASAN_STACK is disabled: fix this by defining the
> >> > >> > corresponding config.
> >> > >> >
> >> > >> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> >> > >> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> >> > >> > ---
> >> > >> >  arch/riscv/Kconfig             | 6 ++++++
> >> > >> >  arch/riscv/include/asm/kasan.h | 3 +--
> >> > >> >  arch/riscv/mm/kasan_init.c     | 3 +++
> >> > >> >  3 files changed, 10 insertions(+), 2 deletions(-)
> >> > >> >
> >> > >> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> > >> > index c1abbc876e5b..79250b1ed54e 100644
> >> > >> > --- a/arch/riscv/Kconfig
> >> > >> > +++ b/arch/riscv/Kconfig
> >> > >> > @@ -162,6 +162,12 @@ config PAGE_OFFSET
> >> > >> >       default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
> >> > >> >       default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
> >> > >> >
> >> > >> > +config KASAN_SHADOW_OFFSET
> >> > >> > +     hex
> >> > >> > +     depends on KASAN_GENERIC
> >> > >> > +     default 0xdfffffc800000000 if 64BIT
> >> > >> > +     default 0xffffffff if 32BIT
> >> > >>
> >> > >> I thought I posted this somewhere, but this is exactly what my first
> >> > >> guess was.  The problem is that it's hanging on boot for me.  I don't
> >> > >> really have anything exotic going on, it's just a defconfig with
> >> > >> CONFIG_KASAN=y running in QEMU.
> >> > >>
> >> > >> Does this boot for you?
> >> > >
> >> > > Yes with the 2nd patch of this series which fixes the issue
> >> > > encountered here. And that's true I copied/pasted this part of your
> >> > > patch which was better than what I had initially done, sorry I should
> >> > > have mentioned you did that, please add a Codeveloped-by or something
> >> > > like that.
>
> OK, those should probably be in the opposite order (though it looks like
> they're inter-dependent, which makes things a bit trickier).
>
> >> >
> >> > Not sure if I'm missing something, but it's still not booting for me.
> >> > I've put what I'm testing on palmer/to-test, it's these two on top of
> >> > fixes and merged into Linus' tree
> >> >
> >> >     *   6d7d351902ff - (HEAD -> to-test, palmer/to-test) Merge remote-tracking branch 'palmer/fixes' into to-test (7 minutes ago) <Palmer Dabbelt>
> >> >     |\
> >> >     | * 782551edf8f8 - (palmer/fixes) riscv: Fix CONFIG_KASAN_STACK build (6 hours ago) <Alexandre Ghiti>
> >> >     | * 47383e5b3c4f - riscv: Fix asan-stack clang build (6 hours ago) <Alexandre Ghiti>
> >> >     | * 64a19591a293 - (riscv/fixes) riscv: fix misalgned trap vector base address (9 hours ago) <Chen Lu>
> >> >     * |   1fc596a56b33 - (palmer/master, linus/master, linus/HEAD, master) Merge tag 'trace-v5.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (11 hours ago) <Linus Torvalds>
> >> >
> >> > Am I missing something else?
> >>
> >> Hmm, that's weird, I have just done the same: cherry-picked both my
> >> commits on top of fixes (64a19591a293) and it boots fine with KASAN
> >> enabled. Maybe a config thing? I pushed my branch here:
> >> https://github.com/AlexGhiti/riscv-linux/tree/int/alex/kasan_stack_fixes_rebase
> >
> > I pushed the config I use and that boots in that branch, maybe there's
> > another issue somewhere.
>
> CONFIG_KASAN_VMALLOC=n is what's causing the failure.  I'm testing both
> polarities of that, looks like your config has =y.  I haven't looked any
> further as I'm pretty much cooked for tonight, but if you don't have
> time then I'll try to find some time tomorrow.
>

Arf, that was obvious and just under my nose: without KASAN_VMALLOC,
kasan_populate_early_shadow is called and creates the same issue that
the second patch fixes.

I'll send a v2 today and try to swap both patches to avoid having a
non-bootable kernel commit.

Alex

> >
> >>
> >> >
> >> > >
> >> > > Thanks,
> >> > >
> >> > > Alex
> >> > >
> >> > >>
> >> > >> > +
> >> > >> >  config ARCH_FLATMEM_ENABLE
> >> > >> >       def_bool !NUMA
> >> > >> >
> >> > >> > diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> >> > >> > index a2b3d9cdbc86..b00f503ec124 100644
> >> > >> > --- a/arch/riscv/include/asm/kasan.h
> >> > >> > +++ b/arch/riscv/include/asm/kasan.h
> >> > >> > @@ -30,8 +30,7 @@
> >> > >> >  #define KASAN_SHADOW_SIZE    (UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
> >> > >> >  #define KASAN_SHADOW_START   KERN_VIRT_START
> >> > >> >  #define KASAN_SHADOW_END     (KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
> >> > >> > -#define KASAN_SHADOW_OFFSET  (KASAN_SHADOW_END - (1ULL << \
> >> > >> > -                                     (64 - KASAN_SHADOW_SCALE_SHIFT)))
> >> > >> > +#define KASAN_SHADOW_OFFSET  _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> >> > >> >
> >> > >> >  void kasan_init(void);
> >> > >> >  asmlinkage void kasan_early_init(void);
> >> > >> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> >> > >> > index d7189c8714a9..8175e98b9073 100644
> >> > >> > --- a/arch/riscv/mm/kasan_init.c
> >> > >> > +++ b/arch/riscv/mm/kasan_init.c
> >> > >> > @@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
> >> > >> >       uintptr_t i;
> >> > >> >       pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
> >> > >> >
> >> > >> > +     BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
> >> > >> > +             KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
> >> > >> > +
> >> > >> >       for (i = 0; i < PTRS_PER_PTE; ++i)
> >> > >> >               set_pte(kasan_early_shadow_pte + i,
> >> > >> >                       mk_pte(virt_to_page(kasan_early_shadow_page),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
