Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEAEC433FE
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 00:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O9T/ZG6vGW1st6cV2cjlyk3FiQyWvjJvziPv0G14CqA=; b=sjescGRN51r7xh
	avT3g+ur/gz1jOPXWmhCq2ZzLvn9ZPsbZr+LoTmj60Njxd/z8nwzOexdr8UYK6F6x58edZIvT/mxZ
	YSu+IotH4Pw8IJg9oIFp4nHtpX61tnZc6IZ7eOA2LHHFlAx7WplW4we+L2IqXVntzGaqRjzmEf0VD
	xLr/o6s69yNoPVJyZqkuJhE9B8x9IKk1rjGpQhfmHuVgOCiz5fPaHNsdfGUa/rJFRw8tuKLf1iKRI
	Oi6+wxGWgG0WoLWpjWTxC8b++Z192HdwQN/4FQ/ifoONXq64yoaXK7BvgAwq8VaJThaHnkgJq9Hg1
	SwddEFbekr7KJdVMipsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogxW7-00B7Gq-Cz; Sat, 08 Oct 2022 00:16:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogxW3-00B7GV-8I
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 00:16:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B738961E11
	for <linux-riscv@lists.infradead.org>; Sat,  8 Oct 2022 00:16:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16205C433D7
	for <linux-riscv@lists.infradead.org>; Sat,  8 Oct 2022 00:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665188190;
	bh=tKlqxsHo20Enahra8YfrvZjF+pKAk4qtTXrrIJihk98=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZZKnsnSnxDvKI5NitxObJKKQ6Oyj2jlIqYSP1gLkqTAerHyn/dk9Yz2Sj+GSpLuF5
	 L3bYhxo+2YvDq70jY66ksvorYN2DcLYclKxNva6j3X0FcEDfWopjN/lrDKZNPNRE8q
	 IDUO/cY9qD7M79QLmWE39vE710hzgJwTvhpl6Pc4SwyrC0tuiogNpwO4pE6lfa1kKY
	 Z20jhNJ9LQWvRfSWuQG6rEq6sUItE7pF6iMPduMBZaxszYQCDJEkGin15dpP8TX6Xj
	 X815VfHJjIPUPKa928kUYE9Kl2rFMmM1Xmj431PT//E1WhphoCSxkX85EagMMNjAZt
	 Kjk/uRjP1KHvA==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-132fb4fd495so7205155fac.12
        for <linux-riscv@lists.infradead.org>; Fri, 07 Oct 2022 17:16:30 -0700 (PDT)
X-Gm-Message-State: ACrzQf2h8TKZFVMCXdMJSFmtJNmMXHl9QJ1aOa3P7dt5SFbJlAm7hqsj
	uA0JBd0W5d5/Gj67fxzaugiNwKKs/meMucbZOYI=
X-Google-Smtp-Source: AMsMyM41Gcl6h6pkyl/crq2ln5PqiEOzLNIwj846q0gvm1usYaqS4tBfQYmuhKfEA6YPVYq0f3zmdX9JiPt0J+aLTb8=
X-Received: by 2002:a05:6870:5803:b0:12c:c3e0:99dc with SMTP id
 r3-20020a056870580300b0012cc3e099dcmr9368571oap.19.1665188189193; Fri, 07 Oct
 2022 17:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20221002012451.2351127-1-guoren@kernel.org> <20221002012451.2351127-10-guoren@kernel.org>
 <YzrI1QFMpHnhvDnI@FVFF77S0Q05N>
In-Reply-To: <YzrI1QFMpHnhvDnI@FVFF77S0Q05N>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 8 Oct 2022 08:16:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQuPbLuR-eAm3_qjk04cEP6ntaqXfyHmm9jvjh=oGsMHg@mail.gmail.com>
Message-ID: <CAJF2gTQuPbLuR-eAm3_qjk04cEP6ntaqXfyHmm9jvjh=oGsMHg@mail.gmail.com>
Subject: Re: [PATCH V6 09/11] riscv: Add support for STACKLEAK gcc plugin
To: Mark Rutland <mark.rutland@arm.com>, palmer@rivosinc.com, Dao Lu <daolu@rivosinc.com>, 
	Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: arnd@arndb.de, tglx@linutronix.de, peterz@infradead.org, luto@kernel.org, 
	conor.dooley@microchip.com, heiko@sntech.de, jszhang@kernel.org, 
	lazyparser@gmail.com, falcon@tinylab.org, chenhuacai@kernel.org, 
	apatel@ventanamicro.com, atishp@atishpatra.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, zouyipeng@huawei.com, bigeasy@linutronix.de, 
	David.Laight@aculab.com, chenzhongjin@huawei.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_171631_395395_926D631A 
X-CRM114-Status: GOOD (  32.81  )
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

On Mon, Oct 3, 2022 at 7:34 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Sat, Oct 01, 2022 at 09:24:49PM -0400, guoren@kernel.org wrote:
> > From: Dao Lu <daolu@rivosinc.com>
> >
> > Add support for STACKLEAK gcc plugin to riscv by implementing
> > stackleak_check_alloca, based heavily on the arm64 version, and
> > modifying the entry.S. Additionally, this disables the plugin for EFI
> > stub code for riscv. All modifications base on generic_entry.
>
> I think this commit message is stale; `stackleak_check_alloca` doesn't exist
> any more.
>
> > Link: https://lore.kernel.org/linux-riscv/20220615213834.3116135-1-daolu@rivosinc.com/
> > Signed-off-by: Dao Lu <daolu@rivosinc.com>
> > Co-developed-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> > Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
> > Co-developed-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Conor Dooley <Conor.Dooley@microchip.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > ---
> >  arch/riscv/Kconfig                    | 1 +
> >  arch/riscv/kernel/entry.S             | 8 +++++++-
> >  drivers/firmware/efi/libstub/Makefile | 2 +-
> >  3 files changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index dfe600f3526c..76bde12d9f8c 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -81,6 +81,7 @@ config RISCV
> >       select HAVE_ARCH_MMAP_RND_BITS if MMU
> >       select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
> >       select HAVE_ARCH_SECCOMP_FILTER
> > +     select HAVE_ARCH_STACKLEAK
> >       select HAVE_ARCH_TRACEHOOK
> >       select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
> >       select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> > index 5f49517cd3a2..39097c1474a0 100644
> > --- a/arch/riscv/kernel/entry.S
> > +++ b/arch/riscv/kernel/entry.S
> > @@ -130,7 +130,6 @@ END(handle_exception)
> >  ENTRY(ret_from_exception)
> >       REG_L s0, PT_STATUS(sp)
> >
> > -     csrc CSR_STATUS, SR_IE
> >  #ifdef CONFIG_RISCV_M_MODE
> >       /* the MPP value is too large to be used as an immediate arg for addi */
> >       li t0, SR_MPP
> > @@ -139,6 +138,9 @@ ENTRY(ret_from_exception)
> >       andi s0, s0, SR_SPP
> >  #endif
> >       bnez s0, 1f
> > +#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
> > +     call stackleak_erase
> > +#endif
>
> I assume this can happen on an arbitrary stack, and so you can't use the
> stackleak_erase_{on,off}_task_stack variants?
Dao Lu first patch: call stackleak_erase in resume_userspace
Xianting second patch: call stackleak_erase only in resume_syscall

I just thought Dao Lu was right, so I included his patch. Your comment
is to let it call stackleak_erase in all ret_from_exception because
stack leak may have happened "the day before yesterday"/nested
interrupt context, right? So we need to clean up all the stacks.

Here is the new modification:

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 5f49517cd3a2..39097c1474a0 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -130,7 +130,6 @@ END(handle_exception)
 ENTRY(ret_from_exception)
+#ifdef CONFIG_GCC_PLUGIN_STACKLEAK
+       call stackleak_erase
+#endif
       REG_L s0, PT_STATUS(sp)

        csrc CSR_STATUS, SR_IE
 #ifdef CONFIG_RISCV_M_MODE
        /* the MPP value is too large to be used as an immediate arg for addi */
        li t0, SR_MPP
@@ -139,6 +138,9 @@ ENTRY(ret_from_exception)
        andi s0, s0, SR_SPP
 #endif
        bnez s0, 1f

        /* Save unwound kernel stack pointer in thread_info */
        addi s0, sp, PT_SIZE_ON_STACK
@@ -148,8 +150,12 @@ ENTRY(ret_from_exception)
         * Save TP into the scratch register , so we can find the kernel data
         * structures again.
         */
        csrw CSR_SCRATCH, tp
 1:

>
> Just to check, have you given this a spin with LKDTM and the STACKLEAK_ERASING
> test? If not, it'd be good to test that (and ideally, put some sample output
> from that into the commit message).
Okay, I would.

>
> For example, as per:
>
>   https://lore.kernel.org/all/20220427173128.2603085-1-mark.rutland@arm.com/
>
> ... on arm64 this looks something like:
>
> | # uname -a
> | Linux buildroot 5.18.0-rc1-00013-g26f638ab0d7c #3 SMP PREEMPT Wed Apr 27 16:21:37 BST 2022 aarch64 GNU/Linux
> | # echo STACKLEAK_ERASING > /sys/kernel/debug/provoke-crash/DIRECT
> | lkdtm: Performing direct entry STACKLEAK_ERASING
> | lkdtm: stackleak stack usage:
> |   high offset: 336 bytes
> |   current:     688 bytes
> |   lowest:      1232 bytes
> |   tracked:     1232 bytes
> |   untracked:   672 bytes
> |   poisoned:    14136 bytes
> |   low offset:  8 bytes
> | lkdtm: OK: the rest of the thread stack is properly erased
>
> Thanks,
> Mark.
>
> >
> >       /* Save unwound kernel stack pointer in thread_info */
> >       addi s0, sp, PT_SIZE_ON_STACK
> > @@ -148,8 +150,12 @@ ENTRY(ret_from_exception)
> >        * Save TP into the scratch register , so we can find the kernel data
> >        * structures again.
> >        */
> > +     csrc CSR_STATUS, SR_IE
> >       csrw CSR_SCRATCH, tp
> > +     j 2f
> >  1:
> > +     csrc CSR_STATUS, SR_IE
> > +2:
> >       /*
> >        * The current load reservation is effectively part of the processor's
> >        * state, in the sense that load reservations cannot be shared between
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
> > 2.36.1
> >



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
