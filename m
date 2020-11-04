Return-Path: <SRS0=Bqyv=EK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4323C2D0A3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 12:05:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 325FE21734
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2020 12:05:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DBLCRWiz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpK4MAjb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 325FE21734
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XQZLlXbI27mBSflAcMrzH/0pQYBpUY4jOQgEWzGGpg8=; b=DBLCRWiz3LGATZGObY1nJlGa6
	DIkc423i76ed0ryq4/n1ZXDfhoT1zjC6ZAqoAbirCjgHBx3CMwdgLmU4VvlB9klKc8LFelO/bte/E
	xS1rai0ynDF0W6oOdS/FAnJmDpOJefrg7BpiIKC4wAKKFCPQcLPIXqqTsjMYoqOjelWThp5omy145
	HkzYknMUBCG8GibvX+GFBIWWfMmszeDLQUTtB2KmAIs8B3ZrsIjJie2ajr9TNFJp6mRV+4mlZiuUK
	+vZzAz005pOad8mwtCujoy7i8jKA75FsagdTtdRg08ga0niULzJ/YSr9fQ5cYlHG/zjF9/BwU+YbK
	zP9vHbHVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaHXc-0003K9-Ma; Wed, 04 Nov 2020 12:05:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaHXY-0003JZ-2x
 for linux-riscv@lists.infradead.org; Wed, 04 Nov 2020 12:05:26 +0000
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C8C2F2240C
 for <linux-riscv@lists.infradead.org>; Wed,  4 Nov 2020 12:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604491522;
 bh=qU9E28va32MDluGSIgWVAZFeinMkYl77t4qiztLxQNM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WpK4MAjbCld8pwgsMYuhtxW5cv+75sPkU8pHMlvRdCjbraF4P/XS7Ry/h/LMXxjvm
 1jVlhuzDuBqPRDeaUgvTBx1OhewIXk1ZrdT5paa4NTmahhQEei3fo0j9pm5MmHPC02
 UJijQLI5LzcDp7qoduEdZJz94th6dEYkyaLKRFlA=
Received: by mail-lf1-f42.google.com with SMTP id b1so26742103lfp.11
 for <linux-riscv@lists.infradead.org>; Wed, 04 Nov 2020 04:05:21 -0800 (PST)
X-Gm-Message-State: AOAM532e+AlGX42EuvtW7TPinjMQzBhXpxc1xE7xw8N98RaOr2Y+XXmy
 qvOhv7vjvp9Ruvl/8OPlK7MTSpwxJ4Dr4sADQZk=
X-Google-Smtp-Source: ABdhPJyj+GlUeh+betCbBjBwTpjb30L2PBMuPgLXzT3ufIa6UCAwJb2qRe3EvVv94WyWWx1h5k6kNSyyx1zg6IcqtsI=
X-Received: by 2002:a19:6b10:: with SMTP id d16mr9061556lfa.121.1604491519890; 
 Wed, 04 Nov 2020 04:05:19 -0800 (PST)
MIME-Version: 1.0
References: <1603024697-30080-1-git-send-email-guoren@kernel.org>
In-Reply-To: <1603024697-30080-1-git-send-email-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 4 Nov 2020 20:05:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTE4CX9rhV5YzeBt4W7mxc1EzD0YJdm=g940SFS7+-=uQ@mail.gmail.com>
Message-ID: <CAJF2gTTE4CX9rhV5YzeBt4W7mxc1EzD0YJdm=g940SFS7+-=uQ@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: Enable per-task stack canaries
To: Kees Cook <keescook@chromium.org>, cooper.qu@linux.alibaba.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_070524_913957_B6C8983A 
X-CRM114-Status: GOOD (  31.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Kees,

Ping? Any feedback?

On Sun, Oct 18, 2020 at 8:39 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This enables the use of per-task stack canary values if GCC has
> support for emitting the stack canary reference relative to the
> value of tp, which holds the task struct pointer in the riscv
> kernel.
>
> After compare arm64 and x86 implementations, seems arm64's is more
> flexible and readable. The key point is how gcc get the offset of
> stack_canary from gs/el0_sp.
>
> x86: Use a fix offset from gs, not flexible.
>
> struct fixed_percpu_data {
>         /*
>          * GCC hardcodes the stack canary as %gs:40.  Since the
>          * irq_stack is the object at %gs:0, we reserve the bottom
>          * 48 bytes of the irq stack for the canary.
>          */
>         char            gs_base[40]; // :(
>         unsigned long   stack_canary;
> };
>
> arm64: Use -mstack-protector-guard-offset & guard-reg
>         gcc options:
>         -mstack-protector-guard=sysreg
>         -mstack-protector-guard-reg=sp_el0
>         -mstack-protector-guard-offset=xxx
>
> riscv: Use -mstack-protector-guard-offset & guard-reg
>         gcc options:
>         -mstack-protector-guard=tls
>         -mstack-protector-guard-reg=tp
>         -mstack-protector-guard-offset=xxx
>
>  GCC's implementation has been merged:
>  commit c931e8d5a96463427040b0d11f9c4352ac22b2b0
>  Author: Cooper Qu <cooper.qu@linux.alibaba.com>
>  Date:   Mon Jul 13 16:15:08 2020 +0800
>
>      RISC-V: Add support for TLS stack protector canary access
>
> In the end, these codes are inserted by gcc before return:
>
> *  0xffffffe00020b396 <+120>:   ld      a5,1008(tp) # 0x3f0
> *  0xffffffe00020b39a <+124>:   xor     a5,a5,a4
> *  0xffffffe00020b39c <+126>:   mv      a0,s5
> *  0xffffffe00020b39e <+128>:   bnez    a5,0xffffffe00020b61c <_do_fork+766>
>    0xffffffe00020b3a2 <+132>:   ld      ra,136(sp)
>    0xffffffe00020b3a4 <+134>:   ld      s0,128(sp)
>    0xffffffe00020b3a6 <+136>:   ld      s1,120(sp)
>    0xffffffe00020b3a8 <+138>:   ld      s2,112(sp)
>    0xffffffe00020b3aa <+140>:   ld      s3,104(sp)
>    0xffffffe00020b3ac <+142>:   ld      s4,96(sp)
>    0xffffffe00020b3ae <+144>:   ld      s5,88(sp)
>    0xffffffe00020b3b0 <+146>:   ld      s6,80(sp)
>    0xffffffe00020b3b2 <+148>:   ld      s7,72(sp)
>    0xffffffe00020b3b4 <+150>:   addi    sp,sp,144
>    0xffffffe00020b3b6 <+152>:   ret
>    ...
> *  0xffffffe00020b61c <+766>:   auipc   ra,0x7f8
> *  0xffffffe00020b620 <+770>:   jalr    -1764(ra) # 0xffffffe000a02f38 <__stack_chk_fail>
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Cooper Qu <cooper.qu@linux.alibaba.com>
> Cc: Kees Cook <keescook@chromium.org>
> ---
>  arch/riscv/Kconfig                      |  7 +++++++
>  arch/riscv/Makefile                     | 10 ++++++++++
>  arch/riscv/include/asm/stackprotector.h |  3 ++-
>  arch/riscv/kernel/asm-offsets.c         |  3 +++
>  arch/riscv/kernel/process.c             |  2 +-
>  5 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b7821ac..95a0608 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -388,6 +388,13 @@ config CMDLINE_FORCE
>
>  endchoice
>
> +config CC_HAVE_STACKPROTECTOR_TLS
> +       def_bool $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
> +
> +config STACKPROTECTOR_PER_TASK
> +       def_bool y
> +       depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
> +
>  endmenu
>
>  config BUILTIN_DTB
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index fb6e37d..f5f8ee9 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -68,6 +68,16 @@ KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
>  # architectures.  It's faster to have GCC emit only aligned accesses.
>  KBUILD_CFLAGS += $(call cc-option,-mstrict-align)
>
> +ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
> +prepare: stack_protector_prepare
> +stack_protector_prepare: prepare0
> +       $(eval KBUILD_CFLAGS += -mstack-protector-guard=tls               \
> +                               -mstack-protector-guard-reg=tp            \
> +                               -mstack-protector-guard-offset=$(shell    \
> +                       awk '{if ($$2 == "TSK_STACK_CANARY") print $$3;}' \
> +                                       include/generated/asm-offsets.h))
> +endif
> +
>  # arch specific predefines for sparse
>  CHECKFLAGS += -D__riscv -D__riscv_xlen=$(BITS)
>
> diff --git a/arch/riscv/include/asm/stackprotector.h b/arch/riscv/include/asm/stackprotector.h
> index 5962f88..09093af 100644
> --- a/arch/riscv/include/asm/stackprotector.h
> +++ b/arch/riscv/include/asm/stackprotector.h
> @@ -24,6 +24,7 @@ static __always_inline void boot_init_stack_canary(void)
>         canary &= CANARY_MASK;
>
>         current->stack_canary = canary;
> -       __stack_chk_guard = current->stack_canary;
> +       if (!IS_ENABLED(CONFIG_STACKPROTECTOR_PER_TASK))
> +               __stack_chk_guard = current->stack_canary;
>  }
>  #endif /* _ASM_RISCV_STACKPROTECTOR_H */
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index db20344..877ff65 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -66,6 +66,9 @@ void asm_offsets(void)
>         OFFSET(TASK_THREAD_F30, task_struct, thread.fstate.f[30]);
>         OFFSET(TASK_THREAD_F31, task_struct, thread.fstate.f[31]);
>         OFFSET(TASK_THREAD_FCSR, task_struct, thread.fstate.fcsr);
> +#ifdef CONFIG_STACKPROTECTOR
> +       OFFSET(TSK_STACK_CANARY, task_struct, stack_canary);
> +#endif
>
>         DEFINE(PT_SIZE, sizeof(struct pt_regs));
>         OFFSET(PT_EPC, pt_regs, epc);
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 2b97c49..51ddc27 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -24,7 +24,7 @@
>
>  register unsigned long gp_in_global __asm__("gp");
>
> -#ifdef CONFIG_STACKPROTECTOR
> +#if defined(CONFIG_STACKPROTECTOR) && !defined(CONFIG_STACKPROTECTOR_PER_TASK)
>  #include <linux/stackprotector.h>
>  unsigned long __stack_chk_guard __read_mostly;
>  EXPORT_SYMBOL(__stack_chk_guard);
> --
> 2.7.4
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
