Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBF7C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F197A61214
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 15:11:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F197A61214
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=5+FKEFofYArE7uo8k+pyi/5YyPeVUcsQD396CVz9LCc=; b=eVopvSqFUbtO1/R7hNGvobH13O
	FPuAcG5sVnw/z9OYvetOJuFUB3Gwfh/YkA9vY6V+Tpcr668dozv+zCAZGC1eHlomVvcITKKeutpXq
	Eo2GVUt7twAUxsAOaqzpaOzvav7CaSWSsKlAKbi/BRPjz9zdz/6kQMipGkzLM2I9t0Ai6ufk8aWvD
	Va2riT+EYGuteMVcDHYC4Al7NghUsMMIzsRxu7w1oFhdaYI2+gqV58AHPeOXxIN/OFlt9FFqKUDRG
	+xjCqKWDryG2FYbAZzMNva4Gwqp830Xeq6EBjHtNyjZBRaJOPO8WuZefw7WdzSKTNnIEon0Ow4N57
	9VOAQ6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg73l-008NJz-O5; Thu, 28 Oct 2021 15:11:17 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg73j-008NIM-5S
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 15:11:17 +0000
Received: by mail-pf1-x435.google.com with SMTP id k26so6278368pfi.5
 for <linux-riscv@lists.infradead.org>; Thu, 28 Oct 2021 08:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=259aXqiOnA5iWuUV4ETs5uC0oUlsrJdMmweeqlD6Flw=;
 b=FSE7WAV8W97zgFBcxdpzW8qW6M4y5zLcv98iJDuq/vvHWgDfXsqVXKXCpuHZotL7Mg
 Ie3ZPWMKBqGUy6jF5Hg+dCQfBXlSRIWLMh9AbOrkraAM6pJDNwkDfuqlNnULGZhQeCZQ
 JpRFu0QBrCpzg8FzzgEm5jdfVtoME+pTfxYPXjpSIuo68ZXU4Pp/uNLUjaMO7Uvk9MzO
 VRWtxYVGNm0xrDpc1VJ3QogOPi2SNcx7ym6EQTr2dlDn7Se9TYgZkZuRBxwUB2VJ4GuM
 HQ+LXIjfLQHWkeACsjm+70PRgXVFmfPNcEF4Hq/wtI6dEMAo77D23kG+vuNlPYCk/PAz
 ViTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=259aXqiOnA5iWuUV4ETs5uC0oUlsrJdMmweeqlD6Flw=;
 b=kUXLOeE43ZgBU1M35rwIaqUgWPzHoEFNwoSa4FS3r2/37UE3IVDU257YBStrJX99fY
 pHa8/sN5QykMeyO/z+L0R/0Il5GmXOdktg2OUcj2GKY3UAXmrGD0xPMKCjbUndYUqqIL
 KmPmXeC9sbpWN3hWsfJckBBN/3hlUFX0TgZCKaSOKVMVgbmBbC6LTdG2D7fs78yUXk+o
 rmGJo2wNmtZ/MraxR1CSQTSTEXic86IpXlY40GL6RHtwhVhYT24pZCxdeIQjzBT4I/8Z
 S4yLDbnaKMSU+WgAFeCo+SyoNfg87I5LE69adADdC+3WLA0Z4DLJ/0J3DhKgnNam5k7+
 2SgA==
X-Gm-Message-State: AOAM532oqrFe+tgbanf4C01i9IMTxJ8ZBFg89/uvDyvX+0Ey4lEu+6Ad
 wr+Nu591M9xTxGjmRQ6E0uAJp9PcgiM23A==
X-Google-Smtp-Source: ABdhPJwKglkHjgwMStiVm2swRxL2R5ugLP4vxahA1WyfTlvuNO3MAlOeWJ5SytvsYU+mCPBpiPv54g==
X-Received: by 2002:a63:3446:: with SMTP id b67mr3614765pga.258.1635433871085; 
 Thu, 28 Oct 2021 08:11:11 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f14sm2956300pfv.5.2021.10.28.08.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:11:10 -0700 (PDT)
Date: Thu, 28 Oct 2021 08:11:10 -0700 (PDT)
X-Google-Original-Date: Thu, 28 Oct 2021 08:11:05 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: Fix asan-stack clang build
In-Reply-To: <CA+zEjCv+whmnL_SFf20j06NpikaMtA7MNQ9+o8Zz7=1_nAtTqw@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-4c43fe14-f36b-4232-a316-530a4d041d49@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_081115_236185_E895828F 
X-CRM114-Status: GOOD (  41.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 28 Oct 2021 00:13:06 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> On Thu, Oct 28, 2021 at 8:45 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Wed, 27 Oct 2021 22:34:32 PDT (-0700), alexandre.ghiti@canonical.com wrote:
>> > On Thu, Oct 28, 2021 at 7:30 AM Alexandre Ghiti
>> > <alexandre.ghiti@canonical.com> wrote:
>> >>
>> >> On Thu, Oct 28, 2021 at 7:02 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >> >
>> >> > On Wed, 27 Oct 2021 21:15:28 PDT (-0700), alexandre.ghiti@canonical.com wrote:
>> >> > > On Thu, Oct 28, 2021 at 1:06 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >> > >>
>> >> > >> On Tue, 26 Oct 2021 21:58:42 PDT (-0700), alexandre.ghiti@canonical.com wrote:
>> >> > >> > Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
>> >> > >> > Kconfig, it prevents asan-stack from getting disabled with clang even
>> >> > >> > when CONFIG_KASAN_STACK is disabled: fix this by defining the
>> >> > >> > corresponding config.
>> >> > >> >
>> >> > >> > Reported-by: Nathan Chancellor <nathan@kernel.org>
>> >> > >> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>> >> > >> > ---
>> >> > >> >  arch/riscv/Kconfig             | 6 ++++++
>> >> > >> >  arch/riscv/include/asm/kasan.h | 3 +--
>> >> > >> >  arch/riscv/mm/kasan_init.c     | 3 +++
>> >> > >> >  3 files changed, 10 insertions(+), 2 deletions(-)
>> >> > >> >
>> >> > >> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> >> > >> > index c1abbc876e5b..79250b1ed54e 100644
>> >> > >> > --- a/arch/riscv/Kconfig
>> >> > >> > +++ b/arch/riscv/Kconfig
>> >> > >> > @@ -162,6 +162,12 @@ config PAGE_OFFSET
>> >> > >> >       default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>> >> > >> >       default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>> >> > >> >
>> >> > >> > +config KASAN_SHADOW_OFFSET
>> >> > >> > +     hex
>> >> > >> > +     depends on KASAN_GENERIC
>> >> > >> > +     default 0xdfffffc800000000 if 64BIT
>> >> > >> > +     default 0xffffffff if 32BIT
>> >> > >>
>> >> > >> I thought I posted this somewhere, but this is exactly what my first
>> >> > >> guess was.  The problem is that it's hanging on boot for me.  I don't
>> >> > >> really have anything exotic going on, it's just a defconfig with
>> >> > >> CONFIG_KASAN=y running in QEMU.
>> >> > >>
>> >> > >> Does this boot for you?
>> >> > >
>> >> > > Yes with the 2nd patch of this series which fixes the issue
>> >> > > encountered here. And that's true I copied/pasted this part of your
>> >> > > patch which was better than what I had initially done, sorry I should
>> >> > > have mentioned you did that, please add a Codeveloped-by or something
>> >> > > like that.
>>
>> OK, those should probably be in the opposite order (though it looks like
>> they're inter-dependent, which makes things a bit trickier).
>>
>> >> >
>> >> > Not sure if I'm missing something, but it's still not booting for me.
>> >> > I've put what I'm testing on palmer/to-test, it's these two on top of
>> >> > fixes and merged into Linus' tree
>> >> >
>> >> >     *   6d7d351902ff - (HEAD -> to-test, palmer/to-test) Merge remote-tracking branch 'palmer/fixes' into to-test (7 minutes ago) <Palmer Dabbelt>
>> >> >     |\
>> >> >     | * 782551edf8f8 - (palmer/fixes) riscv: Fix CONFIG_KASAN_STACK build (6 hours ago) <Alexandre Ghiti>
>> >> >     | * 47383e5b3c4f - riscv: Fix asan-stack clang build (6 hours ago) <Alexandre Ghiti>
>> >> >     | * 64a19591a293 - (riscv/fixes) riscv: fix misalgned trap vector base address (9 hours ago) <Chen Lu>
>> >> >     * |   1fc596a56b33 - (palmer/master, linus/master, linus/HEAD, master) Merge tag 'trace-v5.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (11 hours ago) <Linus Torvalds>
>> >> >
>> >> > Am I missing something else?
>> >>
>> >> Hmm, that's weird, I have just done the same: cherry-picked both my
>> >> commits on top of fixes (64a19591a293) and it boots fine with KASAN
>> >> enabled. Maybe a config thing? I pushed my branch here:
>> >> https://github.com/AlexGhiti/riscv-linux/tree/int/alex/kasan_stack_fixes_rebase
>> >
>> > I pushed the config I use and that boots in that branch, maybe there's
>> > another issue somewhere.
>>
>> CONFIG_KASAN_VMALLOC=n is what's causing the failure.  I'm testing both
>> polarities of that, looks like your config has =y.  I haven't looked any
>> further as I'm pretty much cooked for tonight, but if you don't have
>> time then I'll try to find some time tomorrow.
>>
>
> Arf, that was obvious and just under my nose: without KASAN_VMALLOC,
> kasan_populate_early_shadow is called and creates the same issue that
> the second patch fixes.
>
> I'll send a v2 today and try to swap both patches to avoid having a
> non-bootable kernel commit.

Thanks.

>
> Alex
>
>> >
>> >>
>> >> >
>> >> > >
>> >> > > Thanks,
>> >> > >
>> >> > > Alex
>> >> > >
>> >> > >>
>> >> > >> > +
>> >> > >> >  config ARCH_FLATMEM_ENABLE
>> >> > >> >       def_bool !NUMA
>> >> > >> >
>> >> > >> > diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
>> >> > >> > index a2b3d9cdbc86..b00f503ec124 100644
>> >> > >> > --- a/arch/riscv/include/asm/kasan.h
>> >> > >> > +++ b/arch/riscv/include/asm/kasan.h
>> >> > >> > @@ -30,8 +30,7 @@
>> >> > >> >  #define KASAN_SHADOW_SIZE    (UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
>> >> > >> >  #define KASAN_SHADOW_START   KERN_VIRT_START
>> >> > >> >  #define KASAN_SHADOW_END     (KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
>> >> > >> > -#define KASAN_SHADOW_OFFSET  (KASAN_SHADOW_END - (1ULL << \
>> >> > >> > -                                     (64 - KASAN_SHADOW_SCALE_SHIFT)))
>> >> > >> > +#define KASAN_SHADOW_OFFSET  _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>> >> > >> >
>> >> > >> >  void kasan_init(void);
>> >> > >> >  asmlinkage void kasan_early_init(void);
>> >> > >> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>> >> > >> > index d7189c8714a9..8175e98b9073 100644
>> >> > >> > --- a/arch/riscv/mm/kasan_init.c
>> >> > >> > +++ b/arch/riscv/mm/kasan_init.c
>> >> > >> > @@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
>> >> > >> >       uintptr_t i;
>> >> > >> >       pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
>> >> > >> >
>> >> > >> > +     BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
>> >> > >> > +             KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
>> >> > >> > +
>> >> > >> >       for (i = 0; i < PTRS_PER_PTE; ++i)
>> >> > >> >               set_pte(kasan_early_shadow_pte + i,
>> >> > >> >                       mk_pte(virt_to_page(kasan_early_shadow_page),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
