Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05A8C6FA82
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Sep 2022 12:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3FzxI+7zZfQJZqdj1gECqyJ6um9SHQmm9rW69e9YDE=; b=oeAmkm3buAhBr+
	vbXiX/T6nMimgg5a/vGBQReWFLUAAlAIDVlXvuh0vnHM4p++thCXJN7+MCMPxzy3GmGnDg1Q+ipG5
	aHJiSFJFUmbPxM5kPDgzSXKosRXao4HjlyyL5MKYXQbO3PrMTTJ5P/661A357VXcyUN4nZKchlm9f
	3Xb0A9DAxYTOoigXeRZG7mTHpOtPeEhk70bzmFzGale0vPQr+s5Mn9omCtHE/u9qtEJcr/ka9YiMl
	A0N5Y7BbZnvS4qr/W9YjqZ+SiaegDnixmYKcr6ycDUU+5h2/zuwO7NBPIfe5guGN7OFS/G8uANL6w
	M6GCjSzPttUG2QuQkFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWzyL-00A9UZ-IM; Sat, 10 Sep 2022 12:52:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWzyI-00A9U1-IP
	for linux-riscv@lists.infradead.org; Sat, 10 Sep 2022 12:52:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E181460C00
	for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 12:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FAE0C43146
	for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 12:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662814348;
	bh=2tPD73PUwNByykZiELOSQQaPr5qks/JmdleFlm/QVec=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NKTH4T8QKxI+RfuFdqJ9wiTMcif04ajqv09q6O6tucw+YvB7A6TTUT91GPtdsvzkh
	 pe5jOjhh7U91lHYC+qGbXXEgAaTOAjFCAiRVL3YSQ4f649hAahJD4OvG4vLFuCFNQK
	 K1c0tjC9iEZE/d5lw7FS0Pt+t9Gkfy0Dx9klrqJDvHuVvotStGbB9VxnFkV9dCnq79
	 rO109vBWGKxo5UXbCArfLXDBPgR91oNpTq7qFIQRvmCwlhKJs2AB0VbJ0lOc4rbjUX
	 EdmH3+FfCsuv6tRi57Wrx/zBn77BDFvpmKxXP5b0rt3RYpbEX0aXz6WR57kV/IfqD2
	 q54pt/pIbS63Q==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1279948d93dso10928669fac.10
        for <linux-riscv@lists.infradead.org>; Sat, 10 Sep 2022 05:52:28 -0700 (PDT)
X-Gm-Message-State: ACgBeo3X3Qa+X9oGU65+DM8HA5kSmGuG2wRsIx3mlR3ifgZ4esdzu/6d
	e1YYtRmRX17XyHpv5z3QgQqZoHuZ0z9UoHHd+G8=
X-Google-Smtp-Source: AA6agR65Oa38aWbm09BCgHbFLXjYAS6+CmrG9xS/0/IO3r68772SpxUviRaJW1XbIdT8ca3MTxjLmkWGH5/UfTnDfn4=
X-Received: by 2002:a05:6870:a78e:b0:12b:542b:e5b2 with SMTP id
 x14-20020a056870a78e00b0012b542be5b2mr456045oao.112.1662814347629; Sat, 10
 Sep 2022 05:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220908022506.1275799-1-guoren@kernel.org> <20220908022506.1275799-9-guoren@kernel.org>
 <4babce64-e96d-454c-aa35-243b3f2dc315@www.fastmail.com>
In-Reply-To: <4babce64-e96d-454c-aa35-243b3f2dc315@www.fastmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 10 Sep 2022 20:52:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQAMCjNyqrSOvqDAKR5Z-PZiTVxmoK9cvNAVQs+k2fZBg@mail.gmail.com>
Message-ID: <CAJF2gTQAMCjNyqrSOvqDAKR5Z-PZiTVxmoK9cvNAVQs+k2fZBg@mail.gmail.com>
Subject: Re: [PATCH V4 8/8] riscv: Add config of thread stack size
To: Arnd Bergmann <arnd@arndb.de>
Cc: palmer@rivosinc.com, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, luto@kernel.org, conor.dooley@microchip.com, 
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com, falcon@tinylab.org, 
	Huacai Chen <chenhuacai@kernel.org>, apatel@ventanamicro.com, atishp@atishpatra.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, bigeasy@linutronix.de, 
	Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	Andreas Schwab <schwab@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_055230_706829_58FBF2A1 
X-CRM114-Status: GOOD (  38.38  )
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

On Thu, Sep 8, 2022 at 3:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Sep 8, 2022, at 4:25 AM, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > 0cac21b02ba5 ("risc v: use 16KB kernel stack on 64-bit") increase the
> > thread size mandatory, but some scenarios, such as D1 with a small
> > memory footprint, would suffer from that. After independent irq stack
> > support, let's give users a choice to determine their custom stack size.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Andreas Schwab <schwab@suse.de>
> > ---
> >  arch/riscv/Kconfig                   | 9 +++++++++
> >  arch/riscv/include/asm/thread_info.h | 4 ++--
> >  2 files changed, 11 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index da548ed7d107..e436b5793ab6 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -442,6 +442,15 @@ config IRQ_STACKS
> >         Add independent irq & softirq stacks for percpu to prevent kernel stack
> >         overflows. We may save some memory footprint by disabling IRQ_STACKS.
> >
> > +config THREAD_SIZE_ORDER
> > +     int "Pages of thread stack size (as a power of 2)"
> > +     range 1 4
> > +     default "1" if 32BIT
> > +     default "2" if 64BIT
> > +     help
> > +       Specify the Pages of thread stack size (from 8KB to 64KB), which also
> > +       affects irq stack size, which is equal to thread stack size.
>
> I would suggest hiding this under 'depends on EXPERT', no
> need to bother normal users with that question because the
> defaults are probably what everyone should use unless they are
> extremely limited.
>
> > #ifdef CONFIG_64BIT
> > -#define THREAD_SIZE_ORDER    (2 + KASAN_STACK_ORDER)
> > +#define THREAD_SIZE_ORDER    (CONFIG_THREAD_SIZE_ORDER + KASAN_STACK_ORDER)
> >  #else
> > -#define THREAD_SIZE_ORDER    (1 + KASAN_STACK_ORDER)
> > +#define THREAD_SIZE_ORDER    (CONFIG_THREAD_SIZE_ORDER + KASAN_STACK_ORDER)
> >  #endif
>
> The two sides of the #ifdef are now the same, so you no longer
> need both. You could also consider expressing the KASAN_STACK_ORDER
> bit in Kconfig logic for consistency, and put those into the
> defaults as well. Unless you actually use CONFIG_KASAN_STACK,
> the stack requirements of KASAN are not too bad, so that way one
> could decide to still use a smaller stack even with KASAN.
>
> If you want to make the setting really useful, you can add two
> more ideas:
>
> - When VMAP_STACK is set, make it possible to select non-power-of-two
>   stack sizes. Most importantly, 12KB should be a really interesting
>   choice as 8KB is probably still not enough for many 64-bit workloads,
>   but 16KB is often more than what you need. You probably don't
>   want to allow 64BIT/8KB without VMAP_STACK anyway since that just
>   makes it really hard to debug, so hiding the option when VMAP_STACK
>   is disabled may also be a good idea.
I don't want this config to depend on VMAP_STACK. Some D1 chips would
run with an 8K stack size and !VMAP_STACK.

Here is the new patch:

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index da548ed7d107..e7fcc3fbf48e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -442,6 +442,24 @@ config IRQ_STACKS
          Add independent irq & softirq stacks for percpu to prevent
kernel stack
          overflows. We may save some memory footprint by disabling IRQ_STACKS.

+config THREAD_SIZE
+       int "Kernel stack size (in bytes)" if EXPERT
+       range 4096 65536
+       default 8192 if 32BIT && !KASAN
+       default 32768 if 64BIT && KASAN
+       default 16384
+       help
+         Specify the Pages of thread stack size (from 4KB to 64KB), which also
+         affects irq stack size, which is equal to thread stack size.
+
+config THREAD_SIZE_ORDER
+       int
+       default 0 if THREAD_SIZE = 4096
+       default 1 if THREAD_SIZE <= 8192
+       default 2 if THREAD_SIZE <= 16384
+       default 3 if THREAD_SIZE <= 32768
+       default 4
+
 endmenu # "Platform type"

 menu "Kernel features"
diff --git a/arch/riscv/include/asm/thread_info.h
b/arch/riscv/include/asm/thread_info.h
index 043da8ccc7e6..c970d41dc4c6 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -11,18 +11,8 @@
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
+#define THREAD_SIZE_ORDER      CONFIG_THREAD_SIZE_ORDER
 #define THREAD_SIZE            (PAGE_SIZE << THREAD_SIZE_ORDER)


>
> - For testing purposes, you can even allow byte-exact stack sizes
>   that allow finding out what the actual minimum is by adding a
>   fixed offset during kernel entry. See add_random_kstack_offset()
>   for how to adjust the stack.
>
> With all those ideas added in, the Kconfig logic would be
> something like (assuming you can use
>
> config THREAD_SIZE
>        int "Kernel stack size (in bytes)" if VMAP_STACK && EXPERT
>        range 4096 65536
>        default 8192 if 32BIT && !KASAN
>        default 32768 if 64BIT && KASAN
>        default 16384
>
> config THREAD_SIZE_ORDER
>        int
>        default 0 if THREAD_SIZE = 4096
>        default 1 if THREAD_SIZE <= 8192
>        default 2 if THREAD_SIZE <= 16384
>        default 3 if THREAD_SIZE <= 32768
>        default 4
>
>       Arnd



--
Best Regards

 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
