Return-Path: <SRS0=BStT=PQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D61C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 05:02:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D925D60F9C
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Oct 2021 05:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D925D60F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=VtXUHU2AeH9RAIrHH5zQ+9pU9XEpu4vYNsz5ftqc/H0=; b=HflyyBsYJKFFnNY8dzhgghFUWq
	RKYMCE16l5nj/f2R1Ps1tiTEzeLdNkeJqI+Q+a76OI1U3tiDSZbVJ9tbJgzEyaMykZxMnCF1aWQQw
	/NP4ti5K+3xbGf8czTlg1/zjjbc+9Wb2JQ87lyGOMzuq7/I6PHNOxHfZunHfFSWt8JJnU3791uVGp
	N4J1v3mS0y5+RaM2Sml4TQTfTgec3K6VVtDaiCcbR7gaBwsmuH1G+nuJ0AQENSEUPr4NkMAQmrNc3
	VM7o2jCbms7DAWxKbdbEuu20ZxLhTTP5gW68vlEaqBcc1b8QiTl5+gUUbSuqaEZqxVk5TS/+iwEd8
	og3b7/NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfxYu-006snb-UG; Thu, 28 Oct 2021 05:02:48 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfxYr-006snI-A4
 for linux-riscv@lists.infradead.org; Thu, 28 Oct 2021 05:02:47 +0000
Received: by mail-pj1-x1032.google.com with SMTP id gn3so3808921pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 22:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=ET9rgc2cPQO0D9fY/bz0XEDC7bhtrK0ZvnRrK6wQ7eU=;
 b=WxFhA8TZckMYBBHxPkT45pXRfhhAuA5TLksn3+jhe2UniPM+VgCSRN9knqFI2+mfR/
 tSsW9UmbE4i8fwnsR9gUbcAc74ThkukJ/QwqzpG7E4MMA05eLavgqwUQBQN5/ICtAUuB
 OXtb9ujB0ObDBev8152CdCY8SaC3C2vV0qUP0ZaW392Gm7lRQ643/jtEM/EeOETL2rGQ
 Qc+Teh5HTCEiWZaq2AsKtucP/FUniW4EG7ptd6qQvAVbT/3cixYp6hShn+hZLHeUkF0i
 XOrafyjMRZHHDCCK1ngLG9flycq1vCZ5RzSy/u4ri0kIP4AbVn5hYaN0p6vceJonlUcc
 jn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=ET9rgc2cPQO0D9fY/bz0XEDC7bhtrK0ZvnRrK6wQ7eU=;
 b=gJMgRz02R4dhbJ3ifQwsJpdVtxTlP2i3+uhh/Eql7phaL55XRdv8D1Urc0q3QJKxSx
 bvAXb5F494lcR1H6EOevSnOlMTPlIh0bNRrxAyXds2EcsBXzSArntNdGT7/G9t61fBt6
 ncPkjeyGMO16CDAkeMOvRlBNPkw2+2ZVq1sO36gyodirUxXZp+gNMzU+iOTS7XR+2e/c
 VegPWF1EjAV5yAkeh3tx8LV8AqP6j10oL20drmcE20KyjJXkD8dOTY3QcBGJiuZuQ0ck
 qTf8fsNPru4eY5qQa0DQWYRxm/ilfN73iYj049hEcF8seP3u+7nJ8jYaJrPPEltF04pO
 RG2w==
X-Gm-Message-State: AOAM532PJFxIXb6FCYgVZeeULrIdC/dyllMSGexx3viI6FuqTMesIF8a
 nDDl0CAYPAdxNi5Lr9Whk7rXVw==
X-Google-Smtp-Source: ABdhPJz4PU1uvJDhqa5URcYX83sYl0VtkoGCoIUdPAP38/HliPgU7ET3vEC7C0r7sFeERLSU5bOUOw==
X-Received: by 2002:a17:90b:f82:: with SMTP id
 ft2mr911134pjb.107.1635397363825; 
 Wed, 27 Oct 2021 22:02:43 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y6sm1667005pfi.154.2021.10.27.22.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 22:02:43 -0700 (PDT)
Date: Wed, 27 Oct 2021 22:02:43 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 22:02:39 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: Fix asan-stack clang build
In-Reply-To: <CA+zEjCuUCxqTtbox2K8c=ymHC8X97LV6CSO3ydJKgRR9cBXUEw@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-897d082f-5ca4-4d77-a69d-4efaa456bf3b@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_220245_375318_E8770883 
X-CRM114-Status: GOOD (  29.63  )
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

On Wed, 27 Oct 2021 21:15:28 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> On Thu, Oct 28, 2021 at 1:06 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> On Tue, 26 Oct 2021 21:58:42 PDT (-0700), alexandre.ghiti@canonical.com wrote:
>> > Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
>> > Kconfig, it prevents asan-stack from getting disabled with clang even
>> > when CONFIG_KASAN_STACK is disabled: fix this by defining the
>> > corresponding config.
>> >
>> > Reported-by: Nathan Chancellor <nathan@kernel.org>
>> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
>> > ---
>> >  arch/riscv/Kconfig             | 6 ++++++
>> >  arch/riscv/include/asm/kasan.h | 3 +--
>> >  arch/riscv/mm/kasan_init.c     | 3 +++
>> >  3 files changed, 10 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> > index c1abbc876e5b..79250b1ed54e 100644
>> > --- a/arch/riscv/Kconfig
>> > +++ b/arch/riscv/Kconfig
>> > @@ -162,6 +162,12 @@ config PAGE_OFFSET
>> >       default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>> >       default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>> >
>> > +config KASAN_SHADOW_OFFSET
>> > +     hex
>> > +     depends on KASAN_GENERIC
>> > +     default 0xdfffffc800000000 if 64BIT
>> > +     default 0xffffffff if 32BIT
>>
>> I thought I posted this somewhere, but this is exactly what my first
>> guess was.  The problem is that it's hanging on boot for me.  I don't
>> really have anything exotic going on, it's just a defconfig with
>> CONFIG_KASAN=y running in QEMU.
>>
>> Does this boot for you?
>
> Yes with the 2nd patch of this series which fixes the issue
> encountered here. And that's true I copied/pasted this part of your
> patch which was better than what I had initially done, sorry I should
> have mentioned you did that, please add a Codeveloped-by or something
> like that.

Not sure if I'm missing something, but it's still not booting for me.  
I've put what I'm testing on palmer/to-test, it's these two on top of 
fixes and merged into Linus' tree

    *   6d7d351902ff - (HEAD -> to-test, palmer/to-test) Merge remote-tracking branch 'palmer/fixes' into to-test (7 minutes ago) <Palmer Dabbelt>
    |\
    | * 782551edf8f8 - (palmer/fixes) riscv: Fix CONFIG_KASAN_STACK build (6 hours ago) <Alexandre Ghiti>
    | * 47383e5b3c4f - riscv: Fix asan-stack clang build (6 hours ago) <Alexandre Ghiti>
    | * 64a19591a293 - (riscv/fixes) riscv: fix misalgned trap vector base address (9 hours ago) <Chen Lu>
    * |   1fc596a56b33 - (palmer/master, linus/master, linus/HEAD, master) Merge tag 'trace-v5.15-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace (11 hours ago) <Linus Torvalds>

Am I missing something else?

>
> Thanks,
>
> Alex
>
>>
>> > +
>> >  config ARCH_FLATMEM_ENABLE
>> >       def_bool !NUMA
>> >
>> > diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
>> > index a2b3d9cdbc86..b00f503ec124 100644
>> > --- a/arch/riscv/include/asm/kasan.h
>> > +++ b/arch/riscv/include/asm/kasan.h
>> > @@ -30,8 +30,7 @@
>> >  #define KASAN_SHADOW_SIZE    (UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
>> >  #define KASAN_SHADOW_START   KERN_VIRT_START
>> >  #define KASAN_SHADOW_END     (KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
>> > -#define KASAN_SHADOW_OFFSET  (KASAN_SHADOW_END - (1ULL << \
>> > -                                     (64 - KASAN_SHADOW_SCALE_SHIFT)))
>> > +#define KASAN_SHADOW_OFFSET  _AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>> >
>> >  void kasan_init(void);
>> >  asmlinkage void kasan_early_init(void);
>> > diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
>> > index d7189c8714a9..8175e98b9073 100644
>> > --- a/arch/riscv/mm/kasan_init.c
>> > +++ b/arch/riscv/mm/kasan_init.c
>> > @@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
>> >       uintptr_t i;
>> >       pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
>> >
>> > +     BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
>> > +             KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
>> > +
>> >       for (i = 0; i < PTRS_PER_PTE; ++i)
>> >               set_pte(kasan_early_shadow_pte + i,
>> >                       mk_pte(virt_to_page(kasan_early_shadow_page),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
