Return-Path: <SRS0=oaCf=JC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895B9C433B4
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 05:54:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED407611C0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Apr 2021 05:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED407611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u0jx08J+Xs3QkAEZ+ja5uJBk0rse4APiiSbb+ufsLKA=; b=M7a0RATru43IeLrBwwKru5cTj
	WEohOQ37Fs5nKdxKtS5o+IMVPFg4NZdbyFG3+XDiAbaGbGPklxdcVbKy7aDOXBkmkqBb+5JOtNMMe
	RCdlFcEnrTZspjtqmjoBrR/FQ76BrOOVhNWLVgP6iJYPqv1vQcLfkqyK57zU5pN+aT/v3gQhLbsGn
	ACDxA1KnlM5OPRJeMauWDb6H3jo5FUuWopwr3ly7V3rgeZkDcCLaUY7JouDBkoviNNF3Psg5P05Zv
	GxZf8KchBPEQE3B9zdaQxg2tlQMueBav9J5eEC/vmfuo5NnGZ+Kce+21doKFxid53zstFgT1o00cB
	8HBnMd5uQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTIBx-00GmPM-9B; Mon, 05 Apr 2021 05:54:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTIBs-00GmOw-Dr
 for linux-riscv@lists.infradead.org; Mon, 05 Apr 2021 05:54:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 46357613A0
 for <linux-riscv@lists.infradead.org>; Mon,  5 Apr 2021 05:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617602062;
 bh=JiFMrkMx+0KZ/H6wRs19a5D3wV0zK+NjPnMfiNxQllA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QNV74FvKtTR9UWwWW+SVs18ha4h/JXOf8Hs2t+2QmXZVdvqcSBPR42ZmtUYOUo57+
 Mj3YxaF4PDmMtM1uJxe5nTi3vMmiOtjn9W159VMvjvQGEXuk371bXB7VOwahT/FSPt
 onxcn8oVPb4yH5yk/jhVKhP5KaXFsBI7iCcwJoTwEXUm1PBvOnz47o9H2Xb2Gx4zj+
 3jF9sGLK3f43MBgVDvN0PfITOLgXRPuBndWMnJ3A0fiJZhZc9NH2AAvdZdm0hq2vg5
 fkwZAkpHfs0xTP5hqAlNBJGM90pEjNCXNG/hJ3K1XkdM4XMcy/UORm/1zziAFcVw+F
 F94+MvWAMjARg==
Received: by mail-lf1-f48.google.com with SMTP id g8so15878033lfv.12
 for <linux-riscv@lists.infradead.org>; Sun, 04 Apr 2021 22:54:22 -0700 (PDT)
X-Gm-Message-State: AOAM532QwiEioEqXNINUPRIzTYthvreLXO09HZ7ojagU2Ly93jyBxg53
 jQtgRqcA6Kc6xJBXaHO5THa8PHH1hUMSqEXiViI=
X-Google-Smtp-Source: ABdhPJyzXhAKMVnILTiaRfbn+YIno4HeobyVoyCH/zyVOKo0SkJt6gv50ATy9e1+w5v2g1FpxbFE78pIt8C0WBtlsG8=
X-Received: by 2002:a05:6512:3ca7:: with SMTP id
 h39mr16908838lfv.346.1617602060393; 
 Sun, 04 Apr 2021 22:54:20 -0700 (PDT)
MIME-Version: 1.0
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-4-git-send-email-guoren@kernel.org>
In-Reply-To: <1617201040-83905-4-git-send-email-guoren@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 5 Apr 2021 13:54:08 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRWc1R7UHc2qjskA75OhSPgx+LQkcE_XtWppf4rGi-U8Q@mail.gmail.com>
Message-ID: <CAJF2gTRWc1R7UHc2qjskA75OhSPgx+LQkcE_XtWppf4rGi-U8Q@mail.gmail.com>
Subject: Re: [PATCH v6 3/9] riscv: locks: Introduce ticket-based spinlock
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 linux-xtensa@linux-xtensa.org, openrisc@lists.librecores.org, 
 sparclinux <sparclinux@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210405_065424_869999_A24546A1 
X-CRM114-Status: GOOD (  26.99  )
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

On Wed, Mar 31, 2021 at 10:32 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> This patch introduces a ticket lock implementation for riscv, along the
> same lines as the implementation for arch/arm & arch/csky.
>
> We still use qspinlock as default.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Anup Patel <anup@brainfault.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/Kconfig                      |  7 ++-
>  arch/riscv/include/asm/spinlock.h       | 84 +++++++++++++++++++++++++
>  arch/riscv/include/asm/spinlock_types.h | 17 +++++
>  3 files changed, 107 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 67cc65ba1ea1..34d0276f01d5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -34,7 +34,7 @@ config RISCV
>         select ARCH_WANT_FRAME_POINTERS
>         select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
>         select ARCH_USE_QUEUED_RWLOCKS
> -       select ARCH_USE_QUEUED_SPINLOCKS
> +       select ARCH_USE_QUEUED_SPINLOCKS        if !RISCV_TICKET_LOCK
>         select ARCH_USE_QUEUED_SPINLOCKS_XCHG32
>         select CLONE_BACKWARDS
>         select CLINT_TIMER if !MMU
> @@ -344,6 +344,11 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
>         def_bool y
>         depends on NUMA
>
> +config RISCV_TICKET_LOCK
> +       bool "Ticket-based spin-locking"
> +       help
> +         Say Y here to use ticket-based spin-locking.
> +
>  config RISCV_ISA_C
>         bool "Emit compressed instructions when building Linux"
>         default y
> diff --git a/arch/riscv/include/asm/spinlock.h b/arch/riscv/include/asm/spinlock.h
> index a557de67a425..90b7eaa950cf 100644
> --- a/arch/riscv/include/asm/spinlock.h
> +++ b/arch/riscv/include/asm/spinlock.h
> @@ -7,7 +7,91 @@
>  #ifndef _ASM_RISCV_SPINLOCK_H
>  #define _ASM_RISCV_SPINLOCK_H
>
> +#ifdef CONFIG_RISCV_TICKET_LOCK
> +#ifdef CONFIG_32BIT
> +#define __ASM_SLLIW "slli\t"
> +#define __ASM_SRLIW "srli\t"
> +#else
> +#define __ASM_SLLIW "slliw\t"
> +#define __ASM_SRLIW "srliw\t"
> +#endif
> +
> +/*
> + * Ticket-based spin-locking.
> + */
> +static inline void arch_spin_lock(arch_spinlock_t *lock)
> +{
> +       arch_spinlock_t lockval;
> +       u32 tmp;
> +
> +       asm volatile (
> +               "1:     lr.w    %0, %2          \n"
> +               "       mv      %1, %0          \n"
> +               "       addw    %0, %0, %3      \n"
> +               "       sc.w    %0, %0, %2      \n"
> +               "       bnez    %0, 1b          \n"
> +               : "=&r" (tmp), "=&r" (lockval), "+A" (lock->lock)
> +               : "r" (1 << TICKET_NEXT)
> +               : "memory");
It's could be optimized by amoadd.w with Anup advice, and I'll update
it in the next patchset version:
diff --git a/arch/riscv/include/asm/spinlock.h
b/arch/riscv/include/asm/spinlock.h
index 90b7eaa950cf..435286ad342b 100644
--- a/arch/riscv/include/asm/spinlock.h
+++ b/arch/riscv/include/asm/spinlock.h
@@ -22,15 +22,10 @@
 static inline void arch_spin_lock(arch_spinlock_t *lock)
 {
        arch_spinlock_t lockval;
-       u32 tmp;

        asm volatile (
-               "1:     lr.w    %0, %2          \n"
-               "       mv      %1, %0          \n"
-               "       addw    %0, %0, %3      \n"
-               "       sc.w    %0, %0, %2      \n"
-               "       bnez    %0, 1b          \n"
-               : "=&r" (tmp), "=&r" (lockval), "+A" (lock->lock)
+               "   amoadd.w    %0, %2, %1      \n"
+               : "=&r" (lockval), "+A" (lock->lock)
                : "r" (1 << TICKET_NEXT)
                : "memory");




> +
> +       smp_cond_load_acquire(&lock->tickets.owner,
> +                                       VAL == lockval.tickets.next);
> +}
> +
> +static inline int arch_spin_trylock(arch_spinlock_t *lock)
> +{
> +       u32 tmp, contended, res;
> +
> +       do {
> +               asm volatile (
> +               "       lr.w    %0, %3          \n"
> +               __ASM_SRLIW    "%1, %0, %5      \n"
> +               __ASM_SLLIW    "%2, %0, %5      \n"
> +               "       or      %1, %2, %1      \n"
> +               "       li      %2, 0           \n"
> +               "       sub     %1, %1, %0      \n"
> +               "       bnez    %1, 1f          \n"
> +               "       addw    %0, %0, %4      \n"
> +               "       sc.w    %2, %0, %3      \n"
> +               "1:                             \n"
> +               : "=&r" (tmp), "=&r" (contended), "=&r" (res),
> +                 "+A" (lock->lock)
> +               : "r" (1 << TICKET_NEXT), "I" (TICKET_NEXT)
> +               : "memory");
> +       } while (res);
> +
> +       if (!contended)
> +               __atomic_acquire_fence();
> +
> +       return !contended;
> +}
> +
> +static inline void arch_spin_unlock(arch_spinlock_t *lock)
> +{
> +       smp_store_release(&lock->tickets.owner, lock->tickets.owner + 1);
> +}
> +
> +static inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> +{
> +       return lock.tickets.owner == lock.tickets.next;
> +}
> +
> +static inline int arch_spin_is_locked(arch_spinlock_t *lock)
> +{
> +       return !arch_spin_value_unlocked(READ_ONCE(*lock));
> +}
> +
> +static inline int arch_spin_is_contended(arch_spinlock_t *lock)
> +{
> +       struct __raw_tickets tickets = READ_ONCE(lock->tickets);
> +
> +       return (tickets.next - tickets.owner) > 1;
> +}
> +#define arch_spin_is_contended arch_spin_is_contended
> +#else /* CONFIG_RISCV_TICKET_LOCK */
>  #include <asm/qspinlock.h>
> +#endif /* CONFIG_RISCV_TICKET_LOCK */
> +
>  #include <asm/qrwlock.h>
>
>  #endif /* _ASM_RISCV_SPINLOCK_H */
> diff --git a/arch/riscv/include/asm/spinlock_types.h b/arch/riscv/include/asm/spinlock_types.h
> index d033a973f287..afbb19841d0f 100644
> --- a/arch/riscv/include/asm/spinlock_types.h
> +++ b/arch/riscv/include/asm/spinlock_types.h
> @@ -10,7 +10,24 @@
>  # error "please don't include this file directly"
>  #endif
>
> +#ifdef CONFIG_RISCV_TICKET_LOCK
> +#define TICKET_NEXT    16
> +
> +typedef struct {
> +       union {
> +               u32 lock;
> +               struct __raw_tickets {
> +                       /* little endian */
> +                       u16 owner;
> +                       u16 next;
> +               } tickets;
> +       };
> +} arch_spinlock_t;
> +
> +#define __ARCH_SPIN_LOCK_UNLOCKED      { { 0 } }
> +#else
>  #include <asm-generic/qspinlock_types.h>
> +#endif
>  #include <asm-generic/qrwlock_types.h>
>
>  #endif /* _ASM_RISCV_SPINLOCK_TYPES_H */
> --
> 2.17.1
>


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
