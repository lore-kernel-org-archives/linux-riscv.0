Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78399C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 05:31:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BAAE6103B
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 05:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BAAE6103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9W/wtmKHCoIiZD3SyFPFjjQwqWpwnbcEvJxJhwa9Zxc=; b=jkMniKihmhOBWT
	mhL2uwutpWV88mqj/BNTpUPJG8+XtBtNqGneuTKw9MyF9jPqunCTWmbkqFitDeMqavc8d2/K1O1d3
	L4gY8yEuxzlT5zLvxHKhBHBdaT1wqIQjEv5FSZwFS87WZTJXoozaDL4IsS+pcagAs4jdxQWrJ9ZGX
	ryDXvuhwUaPjdbkU9wANgk7/QliLjrDGIwUUt/iuuvuvISbw4zxlO9cJzKKRL2R9X4sop0peSOuIq
	bXXY+zXdeV+a3Pf0YR8mreHvcIkvXg6IYtuGeiql8mR53nIfsSFYtgNy6+pfDhiRV1I8XDYClrAl8
	zJuPQYAfGZpE1aULXkWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfy0W-006tqF-BE; Thu, 28 Oct 2021 05:31:20 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfy0R-006toY-Re
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 05:31:19 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D4D933F179
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 05:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635399069;
 bh=noNS8SKbWs06fUT37mVtwhaSupIHvr5prwGIHsMJYxw=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=XmNKvwNbWLK+bOP6uiq6HEv6d6Qd/y30OZ9bsCt0jonBZtcm/UNvBUFX+pa2FDf6z
 /6lWe8ND2SfjrUhHu4Md980Nos75tsMm4ku9Ws6DDzYwzrZREZS4STgy1tktTLpqs4
 Lpt8px1vE2u6Hy4Gewk3E7qakXRF4bW6jz8teaRbr9IB9aMBWHjdPg331Chdc2dZim
 Extoedj44x7naj3ubHGM0igiAUecT5V1Ldc6dZ/LUw/MjiblQmSLvI45iy/CuSArTt
 4alfsb9Aak791wJ16LXQFMpuEtiuQZo8VSZgOLMqV8TS1ztORXY5ckbtGmL7+Qec1Q
 8NEZmjAf+QNmw==
Received: by mail-ed1-f71.google.com with SMTP id
 s12-20020a50dacc000000b003dbf7a78e88so4494580edj.2
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 22:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=noNS8SKbWs06fUT37mVtwhaSupIHvr5prwGIHsMJYxw=;
 b=xNAFz6/ZBuveKcASZDKzpbsYcHtQBPudTUgX3jZvbkATA1Jc85kaorerZJ35Za7EzR
 luFwvvXXor9aStqSYmRSpb72BZxWFaXgq+muyvdvL2tm0rW0p/dwdDcbijxJr7tVHth7
 pehQu7B8qznH55P4EGNPBF815kmfplD6HabUNaKu7UdjeDG9MR5wWoKvnD6bYgETz3AR
 9sWqVW+7ftxTm7wzSjWyXAecRHSelPhtY7xj5/AeGOMP/j3pT/6SB6CiVItZMQ0/7JNN
 PviXDqtHkqf4sGq1TWz4870VyFCabBMP69rsb3Hf/G4umL/WGbHsK57erbaAjEVOvSWq
 DlQA==
X-Gm-Message-State: AOAM530H05UZBF6BLfil7u2LI0zZ2HNU+ScUy4fFUSvBfxFbo52xFOV0
 CXCBxmoKChELaNWP631GhXZjAucpoDh5QPejRxRoMbr5FP1AjQ972Ny5QFVlZ+fMgWveh44drXE
 BnclUSg7Tb6X9spW8Bs1yEDU+M7EsnH5Dm0vUCcZ99IYdB4u6/MgCqElj/WhmUA==
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr3208500edz.20.1635399069429; 
 Wed, 27 Oct 2021 22:31:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEUJQkO9YMhMwSNt7uEYM8v75MpFk32+ztyU/ggxjoL6rKZE/Q857v/2Xu8+SA5aTcN9XFyBw7AWTV/dWC93U=
X-Received: by 2002:a05:6402:190e:: with SMTP id
 e14mr3208483edz.20.1635399069250; 
 Wed, 27 Oct 2021 22:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <CA+zEjCuUCxqTtbox2K8c=ymHC8X97LV6CSO3ydJKgRR9cBXUEw@mail.gmail.com>
 <mhng-897d082f-5ca4-4d77-a69d-4efaa456bf3b@palmerdabbelt-glaptop>
In-Reply-To: <mhng-897d082f-5ca4-4d77-a69d-4efaa456bf3b@palmerdabbelt-glaptop>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Thu, 28 Oct 2021 07:30:58 +0200
Message-ID: <CA+zEjCvF7yCbA9KvsD+OaGXhEAF4x_jBB+OZ3C-Q6RctYSjd7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: Fix asan-stack clang build
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, 
 glider@google.com, andreyknvl@gmail.com, dvyukov@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, nathan@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_223116_081637_1CE1BFFE 
X-CRM114-Status: GOOD (  35.18  )
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

On Thu, Oct 28, 2021 at 7:02 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 27 Oct 2021 21:15:28 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> > On Thu, Oct 28, 2021 at 1:06 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >>
> >> On Tue, 26 Oct 2021 21:58:42 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> >> > Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
> >> > Kconfig, it prevents asan-stack from getting disabled with clang even
> >> > when CONFIG_KASAN_STACK is disabled: fix this by defining the
> >> > corresponding config.
> >> >
> >> > Reported-by: Nathan Chancellor <nathan@kernel.org>
> >> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> >> > ---
> >> >  arch/riscv/Kconfig             | 6 ++++++
> >> >  arch/riscv/include/asm/kasan.h | 3 +--
> >> >  arch/riscv/mm/kasan_init.c     | 3 +++
> >> >  3 files changed, 10 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> >> > index c1abbc876e5b..79250b1ed54e 100644
> >> > --- a/arch/riscv/Kconfig
> >> > +++ b/arch/riscv/Kconfig
> >> > @@ -162,6 +162,12 @@ config PAGE_OFFSET
> >> >       default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
> >> >       default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
> >> >
> >> > +config KASAN_SHADOW_OFFSET
> >> > +     hex
> >> > +     depends on KASAN_GENERIC
> >> > +     default 0xdfffffc800000000 if 64BIT
> >> > +     default 0xffffffff if 32BIT
> >>
> >> I thought I posted this somewhere, but this is exactly what my first
> >> guess was.  The problem is that it's hanging on boot for me.  I don't
> >> really have anything exotic going on, it's just a defconfig with
> >> CONFIG_KASAN=y running in QEMU.
> >>
> >> Does this boot for you?
> >
> > Yes with the 2nd patch of this series which fixes the issue
> > encountered here. And that's true I copied/pasted this part of your
> > patch which was better than what I had initially done, sorry I should
> > have mentioned you did that, please add a Codeveloped-by or something
> > like that.
>
> Not sure if I'm missing something, but it's still not booting for me.
> I've put what I'm testing on palmer/to-test, it's these two on top of
> fixes and merged into Linus' tree
>
>     *   6d7d351902ff - (HEAD -> to-test, palmer/to-test) Merge remote-tracking branch 'palmer/fixes' into to-test (7 minutes ago) <Palmer Dabbelt>
>     |\
>     | * 782551edf8f8 - (palmer/fixes) riscv: Fix CONFIG_KASAN_STACK build (6 hours ago) <Alexandre Ghiti>
>     | * 47383e5b3c4f - riscv: Fix asan-stack clang build (6 hours ago) <Alexandre Ghiti>
>     | * 64a19591a293 - (riscv/fixes) riscv: fix misalgned trap vector base address (9 hours ago) <Chen Lu>
>     * |   1fc596a56b33 - (palmer/master, linus/master, linus/HEAD, master) Merge tag 'trace-v5.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (11 hours ago) <Linus Torvalds>
>
> Am I missing something else?

Hmm, that's weird, I have just done the same: cherry-picked both my
commits on top of fixes (64a19591a293) and it boots fine with KASAN
enabled. Maybe a config thing? I pushed my branch here:
https://github.com/AlexGhiti/riscv-linux/tree/int/alex/kasan_stack_fixes_rebase

>
> >
> > Thanks,
> >
> > Alex
> >
> >>
> >> > +
> >> >  config ARCH_FLATMEM_ENABLE
> >> >       def_bool !NUMA
> >> >
> >> > diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> >> > index a2b3d9cdbc86..b00f503ec124 100644
> >> > --- a/arch/riscv/include/asm/kasan.h
> >> > +++ b/arch/riscv/include/asm/kasan.h
> >> > @@ -30,8 +30,7 @@
> >> >  #define KASAN_SHADOW_SIZE    (UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
> >> >  #define KASAN_SHADOW_START   KERN_VIRT_START
> >> >  #define KASAN_SHADOW_END     (KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
> >> > -#define KASAN_SHADOW_OFFSET  (KASAN_SHADOW_END - (1ULL << \
> >> > -                                     (64 - KASAN_SHADOW_SCALE_SHIFT)))
> >> > +#define KASAN_SHADOW_OFFSET  _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
> >> >
> >> >  void kasan_init(void);
> >> >  asmlinkage void kasan_early_init(void);
> >> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> >> > index d7189c8714a9..8175e98b9073 100644
> >> > --- a/arch/riscv/mm/kasan_init.c
> >> > +++ b/arch/riscv/mm/kasan_init.c
> >> > @@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
> >> >       uintptr_t i;
> >> >       pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
> >> >
> >> > +     BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
> >> > +             KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
> >> > +
> >> >       for (i = 0; i < PTRS_PER_PTE; ++i)
> >> >               set_pte(kasan_early_shadow_pte + i,
> >> >                       mk_pte(virt_to_page(kasan_early_shadow_page),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
