Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB2F2ECAAD8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uy3pZlWvcV6kMuSeTAxr2Ykcltd7ZtI2Mo6pkE78cTo=; b=bBygIM/9R+6WgC
	YRnbJxfbFX8ZQRlJU2PJPfqXgAWAj7ZYjsK5vq/lM2tIAG5MoI/H7ypX0MpKj7c+qOuSyJ/vB8hYE
	FOdYK3U7dLoUoybhT00lk2uaNx+4LD/99cvB6CEmTGUfMeIG/60iO+kfCL+tjJ6l7nfLNmWaK4rzS
	m0dAkjapkMpvhKoBw1xYPv1EAgWOpnS3inZ5JYL3DMVIuc1qXfWNovZ5Jy7UVKMVbZI6qrQicS6Ux
	+wlhsVEFrRT4Nnv6zbpPWaxlvsTYpi+NvsoBxyzVOfjKT3LNeR+skwzYqPSS2L7qyQLsC8XuaxTGV
	VxjMsiTjY8/hC1+5kMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavFC-00A1SN-Ob; Wed, 21 Sep 2022 08:38:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oav1r-009vby-HG
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 08:24:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9BCAFB82E97
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 08:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BFFAC43142
	for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 08:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663748660;
	bh=1NzIghPEBpq8uMJRc47K9lfgrGEpRXTiw8izcxlL2xQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OKkCGAhnkRBD6nidQpKm62U9gGhDP7WgV8TW6Usene59SdBqik2nH7gw16qADXB6Q
	 kGN59L+qRA7IlhnmvB0CjAY8ecmvGXDfM40+CS4p2ZDCyDOe+IdPd1Nbg+netY/gG3
	 DaLsZaJASrsTVZuJcY9A8HtsGfTnIi6xg3laWFI7FW4CY9QONjoSY91XqpN5guqjNv
	 NT0ailSc9zSbCHEc8hVikRtzGJRBea18pdRRQ2FZ9zRjFy2c1+NBqEmjb1Gf9kiz9T
	 h4G5/Y4hjWOWf6RZm/TLBKPfj6oeI3iuTkivN18rfwB5A5srEd1XAQaZhmXiroHJxH
	 AKvLfQkjQq9VA==
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-11e9a7135easo7983953fac.6
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 01:24:20 -0700 (PDT)
X-Gm-Message-State: ACrzQf1QHAgKJlLtqk3ZJhrLVhpY0V1ycLACUVhDk+8XwHu/hbNIlqnU
	Eun7650M5UIQqW8G0A6SYaFMfrw6V+I9G+EhJzg=
X-Google-Smtp-Source: AMsMyM4V0nR6rYDAsi882MI6/ftf77j2yigATQcPA5I8IsYUbEUPObkhTn6sRCtBUuHkFuJRwBsb3fkrstWT3g/H0Qk=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr4387625oao.112.1663748659200; Wed, 21
 Sep 2022 01:24:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-9-guoren@kernel.org>
 <4babce64-e96d-454c-aa35-243b3f2dc315@www.fastmail.com> <CAJF2gTQAMCjNyqrSOvqDAKR5Z-PZiTVxmoK9cvNAVQs+k2fZBg@mail.gmail.com>
 <8817af55-de0d-4e8f-a41b-25d01d5fa968@www.fastmail.com> <CAJF2gTRoKfJ25brnA=_CqNw9DPt8XKhcyNzmCbD6wX1q-jiR1w@mail.gmail.com>
 <CAJF2gTRVH6pVqBn+n+wbccBcMWraRP3m4CbXz4g_y+=nPEU=Yw@mail.gmail.com>
 <7a2379cf-c1cf-46af-9172-334d2b9b88d5@www.fastmail.com> <CAJF2gTSvaNh_m_hrub5Z=kqLAYJfRbpYzB1Mc5aOgdN+Bm8bag@mail.gmail.com>
In-Reply-To: <CAJF2gTSvaNh_m_hrub5Z=kqLAYJfRbpYzB1Mc5aOgdN+Bm8bag@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Sep 2022 16:23:58 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQGB97kh=47dsZ8MFpTTpy7pxYyd=MoLOUzgF9kTm1wdA@mail.gmail.com>
Message-ID: <CAJF2gTQGB97kh=47dsZ8MFpTTpy7pxYyd=MoLOUzgF9kTm1wdA@mail.gmail.com>
Subject: Re: [PATCH V4 8/8] riscv: Add config of thread stack size
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Jisheng Zhang <jszhang@kernel.org>, lazyparser@gmail.com, falcon@tinylab.org, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <apatel@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>, Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_012423_923222_F51A42AF 
X-CRM114-Status: GOOD (  25.11  )
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

On Wed, Sep 21, 2022 at 2:13 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Tue, Sep 20, 2022 at 3:18 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Tue, Sep 20, 2022, at 2:46 AM, Guo Ren wrote:
> >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index dfe600f3526c..8def456f328c 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -442,6 +442,16 @@ config IRQ_STACKS
> > >           Add independent irq & softirq stacks for percpu to prevent
> > > kernel stack
> > >           overflows. We may save some memory footprint by disabling IRQ_STACKS.
> > >
> > > +config THREAD_SIZE
> > > +       int "Kernel stack size (in bytes)" if EXPERT
> > > +       range 4096 65536
> > > +       default 8192 if 32BIT && !KASAN
> > > +       default 32768 if 64BIT && KASAN
> > > +       default 16384
> > > +       help
> > > +         Specify the Pages of thread stack size (from 4KB to 64KB), which also
> > > +         affects irq stack size, which is equal to thread stack size.
> >
> > I still think this should be guarded in a way that prevents
> > setting the stack to smaller than default values unless VMAP_STACK
> > is set as well.
> Current VMAP_STACK would double THREAD_SIZE. Let me see how to reduce
> the VMAP_STACK.
Sorry, for my miss understanding. I have no idea to reduce the
VMAP_STACK's THREAD_ALIGN, THREAD_SIZE*2 is fine. Here is my new
patch:

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 76bde12d9f8c..669ae57356a2 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -443,6 +443,16 @@ config IRQ_STACKS
          Add independent irq & softirq stacks for percpu to prevent
kernel stack
          overflows. We may save some memory footprint by disabling IRQ_STACKS.

+config THREAD_SIZE
+       int "Kernel stack size (in bytes)" if VMAP_STACK && EXPERT
+       range 4096 65536
+       default 8192 if 32BIT && !KASAN
+       default 32768 if 64BIT && KASAN
+       default 16384
+       help
+         Specify the Pages of thread stack size (from 4KB to 64KB), which also
+         affects irq stack size, which is equal to thread stack size.
+
 endmenu # "Platform type"

 menu "Kernel features"
diff --git a/arch/riscv/include/asm/thread_info.h
b/arch/riscv/include/asm/thread_info.h
index 043da8ccc7e6..e7ae3f13b879 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -11,32 +11,17 @@
 #include <asm/page.h>
 #include <linux/const.h>

-#ifdef CONFIG_KASAN
-#define KASAN_STACK_ORDER 1
-#else
-#define KASAN_STACK_ORDER 0
-#endif
-
 /* thread information allocation */
-#ifdef CONFIG_64BIT
-#define THREAD_SIZE_ORDER      (2 + KASAN_STACK_ORDER)
-#else
-#define THREAD_SIZE_ORDER      (1 + KASAN_STACK_ORDER)
-#endif
-#define THREAD_SIZE            (PAGE_SIZE << THREAD_SIZE_ORDER)
+#define THREAD_SIZE            CONFIG_THREAD_SIZE

 /*
  * By aligning VMAP'd stacks to 2 * THREAD_SIZE, we can detect overflow by
- * checking sp & (1 << THREAD_SHIFT), which we can do cheaply in the entry
- * assembly.
+ * checking sp & THREAD_SIZE, which we can do cheaply in the entry assembly.
  */
 #ifdef CONFIG_VMAP_STACK
 #define THREAD_ALIGN            (2 * THREAD_SIZE)
-#else
-#define THREAD_ALIGN            THREAD_SIZE
 #endif

-#define THREAD_SHIFT            (PAGE_SHIFT + THREAD_SIZE_ORDER)
 #define OVERFLOW_STACK_SIZE     SZ_4K
 #define SHADOW_OVERFLOW_STACK_SIZE (1024)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 2207cf44a3bc..71ea850ff0db 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -29,8 +29,8 @@ _restore_kernel_tpsp:

 #ifdef CONFIG_VMAP_STACK
        addi sp, sp, -(PT_SIZE_ON_STACK)
-       srli sp, sp, THREAD_SHIFT
-       andi sp, sp, 0x1
+       srli sp, sp, PAGE_SHIFT
+       andi sp, sp, (THREAD_ALIGN >> PAGE_SHIFT >> 1)
        bnez sp, handle_kernel_stack_overflow
        REG_L sp, TASK_TI_KERNEL_SP(tp)
 #endif


>
> >
> >     Arnd
>
>
>
> --
> Best Regards
>  Guo Ren



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
