Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3BBC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 06:46:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1634610C7
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 06:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F1634610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=87qk/sBW/d8KjVtkLAldr+C0RsPQAG9tgAyX7WOkyYU=; b=dpiFE1ZIeRYWY1RMhte/2Lz+H0
	jJAlXjR73KzqvLt1VIcQpMqevCbtEb6M1IshOH8tJMqfZz7zq+meIXjDrFFEviTjYAUEwv3B3AjnW
	MQTQ2/Z0SNGdoYfLalBJM2e4iJ9q1rf4/bv4giHPBCXCsfAc5rzQnTw9ljJNyTdVJdvM/3R2pdMUt
	olpjFSP5Tcihh7ivmyIqmCR5vZgTrOaGPhsRfYUyMafIak8P20ixDfuU32Rc7MpBW+J6rh3Xli7qn
	DjffaB0L6T1VSzjA4K+5b5pxl3fUyZpiHdjJiDnrU2cvNLJqDzqiqVajp076ESpixjAipz0s9NKAB
	rQqsovuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfzAj-0070uh-OA; Thu, 28 Oct 2021 06:45:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfzAe-0070sp-Tr
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 06:45:56 +0000
Received: by mail-pf1-x42d.google.com with SMTP id 187so5031560pfc.10
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 23:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=rs7fMWgOkQnNoOUFxUJo1UP4rGXZdVB5PK/ehuT/wOs=;
 b=moYXi3sCthKWqjd8aa1IB7s1sTlgAwpEU9pwCTB3RBgXWVVUDx9DpO87dByWToojHQ
 cbsxhmHWVBr6x+uOIyaQxzPCYoJdRTfabdhgVGJNuFvVbAEqvloIj/YAx4iPHx7EBU7t
 Kb+UKW6rHex2Q6TDgKTjjsd8rBD8MfB9PZOgvfZkGnNWACOTdW3Smz1nasT/9WpW7mfS
 yW/BJKn7nRM9xYiNEQ67dhZfTgked8WIww44DvOyshLVWtqBuM86/89q/1AWhGq1qfQ5
 sPiiv2peIDPXnVkXQ9qxDgwre8Xondj7WPevy4S1lpalGkOB3v5iZk6UaqUjtKKNsH1x
 kB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=rs7fMWgOkQnNoOUFxUJo1UP4rGXZdVB5PK/ehuT/wOs=;
 b=IfR9o5IMb9xJMrVaWoL4nioxWwFbm/h4mLdabzrUFy5oxxKSPLYQo3qYEA6FoBHEJt
 yuTGlCH1ynk1kd2EW8mBNsOnzHCUWoqb7xIoUYyv92qDDMwtpHzfOmxlU0DMu8vbLma4
 hd2p37uk6lRqZymxtOT4vow4NVi5GlMEFTn6hmDLH/al5DAoSEUaIhDCe8QG1vgjbVWJ
 05uQ3KaQ8Fg1IC4XTHDcMqSu3urfsLepryyNO6JrNsZjGsSHnSJWHCr3iGZR8XsR6pxQ
 RjFVacC7N2twbkTSH4AC9mPVsgM5QfzmZiJX4lseYmEJ9lDtIA9/MsaDJBWgpEHRrAaJ
 BSqg==
X-Gm-Message-State: AOAM533GOCDFuX6Fx5eg7cjGLaG8Og03o9aKbTslWAW2AtfWL40H1/Ru
 d31SRhV5wCMP5DHNP1XApsT9Eg==
X-Google-Smtp-Source: ABdhPJwb7hB8sIlsiK99j0jhU8ekIHeKGaRy1UlxJfMJKL+ayYtiUgpQpVTRgcy0HQmuSrqapahzhw==
X-Received: by 2002:a63:8f4c:: with SMTP id r12mr1863151pgn.0.1635403550335;
 Wed, 27 Oct 2021 23:45:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j16sm2310979pfj.16.2021.10.27.23.45.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 23:45:49 -0700 (PDT)
Date: Wed, 27 Oct 2021 23:45:49 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 23:40:23 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: Fix asan-stack clang build
In-Reply-To: <CA+zEjCus8+jzn074GwqhJ54Y180RASr_YaC=6zdBZSzonEtjDA@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-3ac5b2b9-c9da-42e5-bc56-d779fb4dd1dd@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_234552_992952_0D87C846 
X-CRM114-Status: GOOD (  40.03  )
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

On Wed, 27 Oct 2021 22:34:32 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> On Thu, Oct 28, 2021 at 7:30 AM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
>>
>> On Thu, Oct 28, 2021 at 7:02 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> >
>> > On Wed, 27 Oct 2021 21:15:28 PDT (-0700), alexandre.ghiti@canonical.com wrote:
>> > > On Thu, Oct 28, 2021 at 1:06 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> > >>
>> > >> On Tue, 26 Oct 2021 21:58:42 PDT (-0700), alexandre.ghiti@canonical.com wrote:
>> > >> > Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
>> > >> > Kconfig, it prevents asan-stack from getting disabled with clang even
>> > >> > when CONFIG_KASAN_STACK is disabled: fix this by defining the
>> > >> > corresponding config.
>> > >> >
>> > >> > Reported-by: Nathan Chancellor <nathan@kernel.org>
>> > >> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>> > >> > ---
>> > >> >  arch/riscv/Kconfig             | 6 ++++++
>> > >> >  arch/riscv/include/asm/kasan.h | 3 +--
>> > >> >  arch/riscv/mm/kasan_init.c     | 3 +++
>> > >> >  3 files changed, 10 insertions(+), 2 deletions(-)
>> > >> >
>> > >> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > >> > index c1abbc876e5b..79250b1ed54e 100644
>> > >> > --- a/arch/riscv/Kconfig
>> > >> > +++ b/arch/riscv/Kconfig
>> > >> > @@ -162,6 +162,12 @@ config PAGE_OFFSET
>> > >> >       default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>> > >> >       default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>> > >> >
>> > >> > +config KASAN_SHADOW_OFFSET
>> > >> > +     hex
>> > >> > +     depends on KASAN_GENERIC
>> > >> > +     default 0xdfffffc800000000 if 64BIT
>> > >> > +     default 0xffffffff if 32BIT
>> > >>
>> > >> I thought I posted this somewhere, but this is exactly what my first
>> > >> guess was.  The problem is that it's hanging on boot for me.  I don't
>> > >> really have anything exotic going on, it's just a defconfig with
>> > >> CONFIG_KASAN=y running in QEMU.
>> > >>
>> > >> Does this boot for you?
>> > >
>> > > Yes with the 2nd patch of this series which fixes the issue
>> > > encountered here. And that's true I copied/pasted this part of your
>> > > patch which was better than what I had initially done, sorry I should
>> > > have mentioned you did that, please add a Codeveloped-by or something
>> > > like that.

OK, those should probably be in the opposite order (though it looks like 
they're inter-dependent, which makes things a bit trickier).

>> >
>> > Not sure if I'm missing something, but it's still not booting for me.
>> > I've put what I'm testing on palmer/to-test, it's these two on top of
>> > fixes and merged into Linus' tree
>> >
>> >     *   6d7d351902ff - (HEAD -> to-test, palmer/to-test) Merge remote-tracking branch 'palmer/fixes' into to-test (7 minutes ago) <Palmer Dabbelt>
>> >     |\
>> >     | * 782551edf8f8 - (palmer/fixes) riscv: Fix CONFIG_KASAN_STACK build (6 hours ago) <Alexandre Ghiti>
>> >     | * 47383e5b3c4f - riscv: Fix asan-stack clang build (6 hours ago) <Alexandre Ghiti>
>> >     | * 64a19591a293 - (riscv/fixes) riscv: fix misalgned trap vector base address (9 hours ago) <Chen Lu>
>> >     * |   1fc596a56b33 - (palmer/master, linus/master, linus/HEAD, master) Merge tag 'trace-v5.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (11 hours ago) <Linus Torvalds>
>> >
>> > Am I missing something else?
>>
>> Hmm, that's weird, I have just done the same: cherry-picked both my
>> commits on top of fixes (64a19591a293) and it boots fine with KASAN
>> enabled. Maybe a config thing? I pushed my branch here:
>> https://github.com/AlexGhiti/riscv-linux/tree/int/alex/kasan_stack_fixes_rebase
>
> I pushed the config I use and that boots in that branch, maybe there's
> another issue somewhere.

CONFIG_KASAN_VMALLOC=n is what's causing the failure.  I'm testing both 
polarities of that, looks like your config has =y.  I haven't looked any 
further as I'm pretty much cooked for tonight, but if you don't have 
time then I'll try to find some time tomorrow.

>
>>
>> >
>> > >
>> > > Thanks,
>> > >
>> > > Alex
>> > >
>> > >>
>> > >> > +
>> > >> >  config ARCH_FLATMEM_ENABLE
>> > >> >       def_bool !NUMA
>> > >> >
>> > >> > diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
>> > >> > index a2b3d9cdbc86..b00f503ec124 100644
>> > >> > --- a/arch/riscv/include/asm/kasan.h
>> > >> > +++ b/arch/riscv/include/asm/kasan.h
>> > >> > @@ -30,8 +30,7 @@
>> > >> >  #define KASAN_SHADOW_SIZE    (UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
>> > >> >  #define KASAN_SHADOW_START   KERN_VIRT_START
>> > >> >  #define KASAN_SHADOW_END     (KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
>> > >> > -#define KASAN_SHADOW_OFFSET  (KASAN_SHADOW_END - (1ULL << \
>> > >> > -                                     (64 - KASAN_SHADOW_SCALE_SHIFT)))
>> > >> > +#define KASAN_SHADOW_OFFSET  _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>> > >> >
>> > >> >  void kasan_init(void);
>> > >> >  asmlinkage void kasan_early_init(void);
>> > >> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>> > >> > index d7189c8714a9..8175e98b9073 100644
>> > >> > --- a/arch/riscv/mm/kasan_init.c
>> > >> > +++ b/arch/riscv/mm/kasan_init.c
>> > >> > @@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
>> > >> >       uintptr_t i;
>> > >> >       pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
>> > >> >
>> > >> > +     BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
>> > >> > +             KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
>> > >> > +
>> > >> >       for (i = 0; i < PTRS_PER_PTE; ++i)
>> > >> >               set_pte(kasan_early_shadow_pte + i,
>> > >> >                       mk_pte(virt_to_page(kasan_early_shadow_page),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
