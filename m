Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1791CC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 16:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iR5bpZV4ySRoP++ws8vKizan3Lnc3kg6mUSoh7tZbC0=; b=3/2ekjzbuhG6Bh
	t4OF72f8Cb2fVEtk3rjmapSrOJ/j2iOOzg4q2vhPgcJM+myXKJjNOHLjEGQOhE0yXk+pNBoPLCYwJ
	UDt/wSAR/uh0QcBbd6w2Ag4bhlKOxB2/rT/JEUdKjQfqGTssl8GTzEapOrVGyg3sZP4Fm/MfvhGMz
	ONPNFVuuKKNC6cqhDIJgwuzwGaLiPwkvwvxrfMsbfM3Q1jFSLxGflNC2HlgAsfEZIvUCh8XbEIIwY
	jb0k9muZfWl5l5RF1VgWRVU4YbQlbu+hMwJVMGA96Y70gf2QXgdJirGJO+p1DYGnzpk0yzMKN9KzR
	FDum0kcVxsIyMPnAmQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Eu3-008F8W-SH; Fri, 17 Jun 2022 16:32:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Eu0-008F7Y-EM
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 16:32:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id k7so4311476plg.7
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9u51CE6MuvCEUihOmshcU90j7YwKJB4q4TkXfgvMtC0=;
        b=h3N1IudI9o50D0w+VbgATrzUm5tzxG8m5/3TIip9oD12Q5E2hSppZ8I3Ao/7MHZf3r
         GSGupEluqHTR9AxlhXqS4ak/vmOIqx5dzkTrmQJNcfNmygbJ8LZ0iHf/qodAaRl9yY62
         Ds0bfB68mVpCbq5/QCsnTbps1RUPWyspfVItNBtc2D68V7KC4ydDei4dmGTDGj1CO5SR
         fHr2I7WDXpZsqM8hTWO7JcJmwiUeJTwEMtJsb/uoRIvHAAPafc6Gq04hi4GOuNSpXTom
         m8ugJOGII/Icyer8wllOpTsgl/X2ilNol3br2svETk6je0Bnncg7LRPnHf9Fii3izYDf
         aGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9u51CE6MuvCEUihOmshcU90j7YwKJB4q4TkXfgvMtC0=;
        b=hmAi1v/oJ1itbPX0SlJBRfd7FI57X/RnJWiKGYww8eOH0ZGN32DJ/HBLHdDtRU36oC
         GYz3wafVqGC2Xy/JauySa0HF8db4Hmiuq+mDxiVDljq4YL7I9kbHTM1Kv4eRWm3zRVh/
         MJmJV1Rze5WL4JSVHcyG5RpS4fY/dK+TtZOOevLQ0nr9EaLPjoRmWqEpA4PLvrnaXZ18
         3Hncwg1bWtTGLFCgSgIjoMtWAl+XfEV+s+iEdiwIf9CO8jyrA3iboEgJ7hdZKgKG1fzt
         tbt1mcAWZSNMPPMtXr4DRyMWsCgbFCPMY5VkOqWkNVUoDoubvM6n9oCw+cE4YhEkpHju
         yrug==
X-Gm-Message-State: AJIora+LU57yqdh9+rq0O019cYW5EuBA3zYx0sVZHRpioF1CcrS5SYxe
	jG4aQgg/3rCrX5TsJtfKeabVuDq9pGR0mSERsdqNFA==
X-Google-Smtp-Source: AGRyM1uf7VCaHqSgIUjTnPjgfFEPONMk5ZxvJTqh8FMyfXm1LN7UasCXa61qYfMu2xHbnmKSQUqX4h2Mug1YdAvz1Jk=
X-Received: by 2002:a17:902:e552:b0:163:6a5e:4e08 with SMTP id
 n18-20020a170902e55200b001636a5e4e08mr10171956plf.130.1655483571756; Fri, 17
 Jun 2022 09:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220615213834.3116135-1-daolu@rivosinc.com> <202206152234.DE7FC51F9@keescook>
In-Reply-To: <202206152234.DE7FC51F9@keescook>
From: Dao Lu <daolu@rivosinc.com>
Date: Fri, 17 Jun 2022 09:32:41 -0700
Message-ID: <CAKh7v-Rjk+35mmgZ3eE1_9fu7_fkqD-EB4RM6DBOKPhCLcts1g@mail.gmail.com>
Subject: Re: [PATCH] arch/riscv: Add support for STACKLEAK gcc plugin
To: Kees Cook <keescook@chromium.org>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Ard Biesheuvel <ardb@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>, 
	Tong Tiangen <tongtiangen@huawei.com>, Mark Rutland <mark.rutland@arm.com>, 
	Changbin Du <changbin.du@intel.com>, Vincent Chen <vincent.chen@sifive.com>, 
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>, 
	"open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)" <linux-efi@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_093256_527659_22BC9CD5 
X-CRM114-Status: GOOD (  32.62  )
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

Thanks Kees.

> stackleak_check_alloca does not exist. Was this maybe from an older
commit log?

Yeah it was from an older version and was later removed, I will take it away
from the commit message in the next version.

Thanks,
Dao


On Wed, Jun 15, 2022 at 10:36 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Jun 15, 2022 at 02:38:29PM -0700, Dao Lu wrote:
> > This adds support for STACKLEAK gcc plugin to ricv by implementing
>
> typo: riscv
>
> > stackleak_check_alloca, based heavily on the arm64 version, and adding
>
> stackleak_check_alloca does not exist. Was this maybe from an older
> commit log?
>
> > the two helpers used by the stackleak common code:
> > current_top_of_stack() and on_thread_stack(). This also adds the missing
> > helper functions for riscv, on_stack() and on_task_stack().
> > Additionally, this disables the plugin for EFI stub code for riscv.
>
> I can't speak to the arch-specific bits here, but if this passes the
> current LKDTM tests, then that should be a good indication that it's
> working. :)
>
> >
> > Signed-off-by: Dao Lu <daolu@rivosinc.com>
> > ---
> >  arch/riscv/Kconfig                    |  1 +
> >  arch/riscv/include/asm/processor.h    | 18 ++++++++++++++++++
> >  arch/riscv/include/asm/stacktrace.h   | 27 +++++++++++++++++++++++++++
> >  arch/riscv/kernel/entry.S             |  3 +++
> >  drivers/firmware/efi/libstub/Makefile |  2 +-
> >  5 files changed, 50 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index c22f58155948..22aa146acd25 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -80,6 +80,7 @@ config RISCV
> >       select HAVE_ARCH_MMAP_RND_BITS if MMU
> >       select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
> >       select HAVE_ARCH_SECCOMP_FILTER
> > +     select HAVE_ARCH_STACKLEAK
> >       select HAVE_ARCH_TRACEHOOK
> >       select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
> >       select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index 21c8072dce17..3a7505ab7f58 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -85,6 +85,24 @@ int riscv_of_parent_hartid(struct device_node *node);
> >  extern void riscv_fill_hwcap(void);
> >  extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
> >
> > +/*
> > + * For CONFIG_GCC_PLUGIN_STACKLEAK
> > + *
> > + * These need to be macros because otherwise we get stuck in a nightmare
> > + * of header definitions for the use of task_stack_page.
> > + */
> > +
> > +struct stack_info {
> > +     unsigned long low;
> > +     unsigned long high;
> > +};
> > +
> > +/*
> > + * The top of the current task's task stack
> > + */
> > +#define current_top_of_stack()       ((unsigned long)current->stack + THREAD_SIZE)
> > +#define on_thread_stack()    (on_task_stack(current, current_stack_pointer, 1, NULL))
> > +
> >  #endif /* __ASSEMBLY__ */
> >
> >  #endif /* _ASM_RISCV_PROCESSOR_H */
> > diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
> > index 3450c1912afd..afb66b677b6a 100644
> > --- a/arch/riscv/include/asm/stacktrace.h
> > +++ b/arch/riscv/include/asm/stacktrace.h
> > @@ -16,4 +16,31 @@ extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *re
> >  extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
> >                          const char *loglvl);
> >
> > +static inline bool on_stack(unsigned long sp, unsigned long size,
> > +                         unsigned long low, unsigned long high,
> > +                         struct stack_info *info)
> > +{
> > +     if (!low)
> > +             return false;
> > +
> > +     if (sp < low || sp + size < sp || sp + size > high)
> > +             return false;
> > +
> > +     if (info) {
> > +             info->low = low;
> > +             info->high = high;
> > +     }
> > +     return true;
> > +}
> > +
> > +static inline bool on_task_stack(const struct task_struct *tsk,
> > +                              unsigned long sp, unsigned long size,
> > +                              struct stack_info *info)
> > +{
> > +     unsigned long low = (unsigned long)task_stack_page(tsk);
> > +     unsigned long high = low + THREAD_SIZE;
> > +
> > +     return on_stack(sp, size, low, high, info);
> > +}
> > +
> >  #endif /* _ASM_RISCV_STACKTRACE_H */
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 2e5b88ca11ce..65d441cb560f 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -264,6 +264,9 @@ ret_from_exception:
> >       bnez s0, resume_kernel
> >
> >  resume_userspace:
> > +#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
> > +     call stackleak_erase
> > +#endif
> >       /* Interrupts must be disabled here so flags are checked atomically */
> >       REG_L s0, TASK_TI_FLAGS(tp) /* current_thread_info->flags */
> >       andi s1, s0, _TIF_WORK_MASK
> > diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> > index d0537573501e..5e1fc4f82883 100644
> > --- a/drivers/firmware/efi/libstub/Makefile
> > +++ b/drivers/firmware/efi/libstub/Makefile
> > @@ -25,7 +25,7 @@ cflags-$(CONFIG_ARM)                := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> >                                  -fno-builtin -fpic \
> >                                  $(call cc-option,-mno-single-pic-base)
> >  cflags-$(CONFIG_RISCV)               := $(subst $(CC_FLAGS_FTRACE),,$(KBUILD_CFLAGS)) \
> > -                                -fpic
> > +                                -fpic $(DISABLE_STACKLEAK_PLUGIN)
> >
> >  cflags-$(CONFIG_EFI_GENERIC_STUB) += -I$(srctree)/scripts/dtc/libfdt
> >
> > --
> > 2.25.1
> >
>
> --
> Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
