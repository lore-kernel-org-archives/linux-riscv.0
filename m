Return-Path: <SRS0=CVeS=JT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE7AC433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Apr 2021 13:13:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28FE61435
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Apr 2021 13:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C28FE61435
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UBbA4oNEKhpTMfxcP6NiZkyoAiT+lc4BXi51gpi1pTU=; b=GBW319da9asB0/ilG52p2D5W3
	P/u+lxSR0uRQFpHt+rV5dA4G7up9VVQ2uzaNajAbcUkKoOksjpzCOpzZk9LuHPjUufKmuaB1Nl5wg
	eyTR/M3dJu0bfAVX4X0niPmU+8uWE+TqmADZkEaM7z1QY1jOReqw4aXVbqqzjLzIBlNUcWN461nwO
	1AX065EbBlz2TvCnoED/FzG3NLhsW5xTyCebs/i3nfoW9g3RUX8xExjXQG/ruIX/AG9+tHdAlBAmz
	lh3J3MYW06Nff75k+73ycQ9dXL3SQ6tbVzOo3/pKLckN6PDrJP5bqhLm3dYggudJZf+bs8CdEJoQ2
	BQdmJaVlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZZ8L-00GmlA-Dp; Thu, 22 Apr 2021 13:12:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZ8I-00Gmkz-IX
 for linux-riscv@desiato.infradead.org; Thu, 22 Apr 2021 13:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CuF/+mqMuXSvBnTQOaIxj292JX7dLi7X0hrFyoC6wFs=; b=u3sLTv6pNIWwiRWFq9WmCHFc0l
 K1tD1048DwsN0kpYpcQlCn+OR6zbTTmhJlC3ASrnCtxrBqTQWaFVvrn+NCpbCiUYbLQgcd05nz6hM
 sAQvwpTTg0jkfQIqnnGyHmMiblLzWGk8iW3wLkRXkM/OpMzvUed8UeZyklz2qdsnOaHuRmXjuS7lz
 ++UnccGwjCxTpW2/0vPCLnNgAqc9Q3SsJgZy85oQFn5ruKybJ+JllFrIrp0Ykqek9IA49mVDTY4FP
 A99fHW1KJSKwUh+iKjrzS+3t7egv9QsxW39XcDathi5F5GdkRuiLpbRhkXHsG+X8RCeT3RA+WTtHD
 DV1akcCw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZZ8D-00Dhuu-6Z
 for linux-riscv@lists.infradead.org; Thu, 22 Apr 2021 13:12:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B67261426
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 13:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619097152;
 bh=NRPaqtEsmUYwNyH+Sf5eK51rNGMJ920vK+sU/qyUaa4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=T5oBDFNuNg9n6OjL1ZFEj8iJVcrA4Z+e5AV70s6wccb0JalTnhAUwGtDWL/DREzsW
 glt++KMvFx9NS7UY4WmmB6v8j12L6l5AO94lXFuHF8aAjvUpMJqb+tbTR8zqYMyDz2
 r6uR2LY31aPT/asqDWq43SvFbDQGjig9ujBpnz7Ya775HFTk42lfCziLq1RloCJDvP
 anoyCQDtNvjPKEJUkjgwnZAGbFnr8aNI2Fu29Apry/9iwuPAOiThJdAo8gEMgxwW+W
 Zt3yE6FDgH6OvTQHDh0hG+VxuvGph8IVG0+6W2rfnEuWxefwDFjFWweWM4adECV4FR
 TjDdR/7lqjDTA==
Received: by mail-lf1-f54.google.com with SMTP id 12so71833902lfq.13
 for <linux-riscv@lists.infradead.org>; Thu, 22 Apr 2021 06:12:32 -0700 (PDT)
X-Gm-Message-State: AOAM530lP7IPvJuCEXrVNp4cBC9gccr1p99LiVcX4E1DhpdvQYTJwFuL
 TRBlQoMRguoDUFHJBh8wIgyeMN9cXqVWZJuA/Ec=
X-Google-Smtp-Source: ABdhPJxfutkjLP/5vTtrn+JRUE5c8Vh90V8p2MeanOxF8SOMdTUUb8/8jPc+nXC3YARCDdrB1O2LTLhx0vj9pslv+o8=
X-Received: by 2002:a19:e34c:: with SMTP id c12mr2542335lfk.555.1619097150692; 
 Thu, 22 Apr 2021 06:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <1619009626-93453-1-git-send-email-guoren@kernel.org>
 <20210422105945.GB62037@C02TD0UTHF1T.local>
In-Reply-To: <20210422105945.GB62037@C02TD0UTHF1T.local>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 22 Apr 2021 21:12:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQSrBM5rBH+2cG8-iTAw8C+A20S-WGtE33hjVVLVLCpJA@mail.gmail.com>
Message-ID: <CAJF2gTQSrBM5rBH+2cG8-iTAw8C+A20S-WGtE33hjVVLVLCpJA@mail.gmail.com>
Subject: Re: [PATCH] asm-generic: atomic64: handle ARCH_ATOMIC builds (was
 "Re: [PATCH v3 1/2] locking/atomics: Fixup GENERIC_ATOMIC64 conflict") with
 atomic-arch-fallback.h
To: Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-arch <linux-arch@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_061233_352089_41E8C2F7 
X-CRM114-Status: GOOD (  37.94  )
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

Hi Mark,

On Thu, Apr 22, 2021 at 6:59 PM Mark Rutland <mark.rutland@arm.com> wrote:
>
> Hi Guo,
>
> On Wed, Apr 21, 2021 at 12:53:45PM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Current GENERIC_ATOMIC64 in atomic-arch-fallback.h is broken. When a 32-bit
> > arch use atomic-arch-fallback.h will cause compile error.
> >
> > In file included from include/linux/atomic.h:81,
> >                     from include/linux/rcupdate.h:25,
> >                     from include/linux/rculist.h:11,
> >                     from include/linux/pid.h:5,
> >                     from include/linux/sched.h:14,
> >                     from arch/riscv/kernel/asm-offsets.c:10:
> >    include/linux/atomic-arch-fallback.h: In function 'arch_atomic64_inc':
> > >> include/linux/atomic-arch-fallback.h:1447:2: error: implicit declaration of function 'arch_atomic64_add'; did you mean 'arch_atomic_add'? [-Werror=implicit-function-declaration]
> >     1447 |  arch_atomic64_add(1, v);
> >          |  ^~~~~~~~~~~~~~~~~
> >          |  arch_atomic_add
>
> This is expected; GENERIC_ATOMIC64 doesn't implement arch_atomic64_*(),
> and thus violates the expectations of the fallback code.
>
> To make GENERIC_ATOMIC64 compatible with ARCH_ATOMIC, the
> GENERIC_ATOMIC64 implementation *must* provide arch_atomic64_*()
> functions.
How do you let a "static __always_inline" of
"asm-generic/atomic-instrumented.h" call a real function? See
lib/atomic64.c.

>
> > The atomic-arch-fallback.h & atomic-fallback.h &
> > atomic-instrumented.h are generated by gen-atomic-fallback.sh &
> > gen-atomic-instrumented.sh, so just take care the bash files.
> >
> > Remove the dependency of atomic-*-fallback.h in atomic64.h.
>
> Please don't duplicate the fallbacks; this'll make it harder to move
> other over and eventually remove the non-ARCH_ATOMIC implementations.
>
> Does the patch below make things work for you, or have I missed
> something?
RISC-V combines 32bit & 64bit together just like x86. Current
ARCH_ATOMIC could work perfectly with RV64, but not RV32.

RV32 still could use ARCH_ATOMIC to improve kasan check.

>
> I've given this a basic build test on an arm config using
> GENERIC_ATOMIC64 (but not ARCH_ATOMIC).
>
> Thanks,
> Mark.
> ---->8----
> From 7f0389c8a1f41ecb5b2700f6ba38ff2ba093eb33 Mon Sep 17 00:00:00 2001
> From: Mark Rutland <mark.rutland@arm.com>
> Date: Thu, 22 Apr 2021 11:26:04 +0100
> Subject: [PATCH] asm-generic: atomic64: handle ARCH_ATOMIC builds
>
> We'd like all architectures to convert to ARCH_ATOMIC, as this will
> enable functionality, and once all architectures are converted it will
> be possible to make significant cleanups to the atomic headers.
>
> A number of architectures use GENERIC_ATOMIC64, and it's impractical to
> convert them all in one go. To make it possible to convert them
> one-by-one, let's make the GENERIC_ATOMIC64 implementation function as
> either atomic64_*() or arch_atomic64_*() depending on whether
> ARCH_ATOMIC is selected. To do this, the C implementations are prefixed
> as generic_atomic64_*(), and the asm-generic/atomic64.h header maps
> atomic64_*()/arch_atomic64_*() onto these as appropriate via teh
> preprocessor.
>
> Once all users are moved over to ARCH_ATOMIC the ifdeffery in the header
> can be simplified and/or removed entirely.
>
> For existing users (none of which select ARCH_ATOMIC), there should be
> no functional change as a result of this patch.
>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Guo Ren <guoren@linux.alibaba.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> ---
>  include/asm-generic/atomic64.h | 74 ++++++++++++++++++++++++++++++++++--------
>  lib/atomic64.c                 | 36 ++++++++++----------
>  2 files changed, 79 insertions(+), 31 deletions(-)
>
> diff --git a/include/asm-generic/atomic64.h b/include/asm-generic/atomic64.h
> index 370f01d4450f..45c7ff8c9477 100644
> --- a/include/asm-generic/atomic64.h
> +++ b/include/asm-generic/atomic64.h
> @@ -15,19 +15,17 @@ typedef struct {
>
>  #define ATOMIC64_INIT(i)       { (i) }
>
> -extern s64 atomic64_read(const atomic64_t *v);
> -extern void atomic64_set(atomic64_t *v, s64 i);
> -
> -#define atomic64_set_release(v, i)     atomic64_set((v), (i))
> +extern s64 generic_atomic64_read(const atomic64_t *v);
> +extern void generic_atomic64_set(atomic64_t *v, s64 i);
>
>  #define ATOMIC64_OP(op)                                                        \
> -extern void     atomic64_##op(s64 a, atomic64_t *v);
> +extern void generic_atomic64_##op(s64 a, atomic64_t *v);
>
>  #define ATOMIC64_OP_RETURN(op)                                         \
> -extern s64 atomic64_##op##_return(s64 a, atomic64_t *v);
> +extern s64 generic_atomic64_##op##_return(s64 a, atomic64_t *v);
>
>  #define ATOMIC64_FETCH_OP(op)                                          \
> -extern s64 atomic64_fetch_##op(s64 a, atomic64_t *v);
> +extern s64 generic_atomic64_fetch_##op(s64 a, atomic64_t *v);
>
>  #define ATOMIC64_OPS(op)       ATOMIC64_OP(op) ATOMIC64_OP_RETURN(op) ATOMIC64_FETCH_OP(op)
>
> @@ -46,11 +44,61 @@ ATOMIC64_OPS(xor)
>  #undef ATOMIC64_OP_RETURN
>  #undef ATOMIC64_OP
>
> -extern s64 atomic64_dec_if_positive(atomic64_t *v);
> -#define atomic64_dec_if_positive atomic64_dec_if_positive
> -extern s64 atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n);
> -extern s64 atomic64_xchg(atomic64_t *v, s64 new);
> -extern s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u);
> -#define atomic64_fetch_add_unless atomic64_fetch_add_unless
> +extern s64 generic_atomic64_dec_if_positive(atomic64_t *v);
> +extern s64 generic_atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n);
> +extern s64 generic_atomic64_xchg(atomic64_t *v, s64 new);
> +extern s64 generic_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u);
> +
> +#ifdef ARCH_ATOMIC
> +
> +#define arch_atomic64_read             generic_atomic64_read
> +#define arch_atomic64_set              generic_atomic64_set
> +#define arch_atomic64_set_release      generic_atomic64_set
> +
> +#define        arch_atomic64_add               generic_atomic64_add
> +#define        arch_atomic64_add_return        generic_atomic64_add_return
> +#define        arch_atomic64_fetch_add         generic_atomic64_fetch_add
> +#define        arch_atomic64_sub               generic_atomic64_sub
> +#define        arch_atomic64_sub_return        generic_atomic64_sub_return
> +#define        arch_atomic64_fetch_sub         generic_atomic64_fetch_sub
> +
> +#define        arch_atomic64_and               generic_atomic64_and
> +#define        arch_atomic64_fetch_and         generic_atomic64_fetch_and
> +#define        arch_atomic64_or                generic_atomic64_or
> +#define        arch_atomic64_fetch_or          generic_atomic64_fetch_or
> +#define        arch_atomic64_xor               generic_atomic64_xor
> +#define        arch_atomic64_fetch_xor         generic_atomic64_fetch_xor
> +
> +#define arch_atomic64_dec_if_positive  generic_atomic64_dec_if_positive
> +#define arch_atomic64_cmpxchg          generic_atomic64_cmpxchg
> +#define arch_atomic64_xchg             generic_atomic64_xchg
> +#define arch_atomic64_fetch_add_unless generic_atomic64_fetch_add_unless
> +
> +#else /* ARCH_ATOMIC */
> +
> +#define atomic64_read                  generic_atomic64_read
> +#define atomic64_set                   generic_atomic64_set
> +#define atomic64_set_release           generic_atomic64_set
> +
> +#define        atomic64_add                    generic_atomic64_add
> +#define        atomic64_add_return             generic_atomic64_add_return
> +#define        atomic64_fetch_add              generic_atomic64_fetch_add
> +#define        atomic64_sub                    generic_atomic64_sub
> +#define        atomic64_sub_return             generic_atomic64_sub_return
> +#define        atomic64_fetch_sub              generic_atomic64_fetch_sub
> +
> +#define        atomic64_and                    generic_atomic64_and
> +#define        atomic64_fetch_and              generic_atomic64_fetch_and
> +#define        atomic64_or                     generic_atomic64_or
> +#define        atomic64_fetch_or               generic_atomic64_fetch_or
> +#define        atomic64_xor                    generic_atomic64_xor
> +#define        atomic64_fetch_xor              generic_atomic64_fetch_xor
> +
> +#define atomic64_dec_if_positive       generic_atomic64_dec_if_positive
> +#define atomic64_cmpxchg               generic_atomic64_cmpxchg
> +#define atomic64_xchg                  generic_atomic64_xchg
> +#define atomic64_fetch_add_unless      generic_atomic64_fetch_add_unless
> +
> +#endif /* ARCH_ATOMIC */
>
>  #endif  /*  _ASM_GENERIC_ATOMIC64_H  */
> diff --git a/lib/atomic64.c b/lib/atomic64.c
> index e98c85a99787..3df653994177 100644
> --- a/lib/atomic64.c
> +++ b/lib/atomic64.c
> @@ -42,7 +42,7 @@ static inline raw_spinlock_t *lock_addr(const atomic64_t *v)
>         return &atomic64_lock[addr & (NR_LOCKS - 1)].lock;
>  }
>
> -s64 atomic64_read(const atomic64_t *v)
> +s64 generic_atomic64_read(const atomic64_t *v)
>  {
>         unsigned long flags;
>         raw_spinlock_t *lock = lock_addr(v);
> @@ -53,9 +53,9 @@ s64 atomic64_read(const atomic64_t *v)
>         raw_spin_unlock_irqrestore(lock, flags);
>         return val;
>  }
> -EXPORT_SYMBOL(atomic64_read);
> +EXPORT_SYMBOL(generic_atomic64_read);
>
> -void atomic64_set(atomic64_t *v, s64 i)
> +void generic_atomic64_set(atomic64_t *v, s64 i)
>  {
>         unsigned long flags;
>         raw_spinlock_t *lock = lock_addr(v);
> @@ -64,10 +64,10 @@ void atomic64_set(atomic64_t *v, s64 i)
>         v->counter = i;
>         raw_spin_unlock_irqrestore(lock, flags);
>  }
> -EXPORT_SYMBOL(atomic64_set);
> +EXPORT_SYMBOL(generic_atomic64_set);
>
>  #define ATOMIC64_OP(op, c_op)                                          \
> -void atomic64_##op(s64 a, atomic64_t *v)                               \
> +void generic_atomic64_##op(s64 a, atomic64_t *v)                       \
>  {                                                                      \
>         unsigned long flags;                                            \
>         raw_spinlock_t *lock = lock_addr(v);                            \
> @@ -76,10 +76,10 @@ void atomic64_##op(s64 a, atomic64_t *v)                            \
>         v->counter c_op a;                                              \
>         raw_spin_unlock_irqrestore(lock, flags);                        \
>  }                                                                      \
> -EXPORT_SYMBOL(atomic64_##op);
> +EXPORT_SYMBOL(generic_atomic64_##op);
>
>  #define ATOMIC64_OP_RETURN(op, c_op)                                   \
> -s64 atomic64_##op##_return(s64 a, atomic64_t *v)                       \
> +s64 generic_atomic64_##op##_return(s64 a, atomic64_t *v)               \
>  {                                                                      \
>         unsigned long flags;                                            \
>         raw_spinlock_t *lock = lock_addr(v);                            \
> @@ -90,10 +90,10 @@ s64 atomic64_##op##_return(s64 a, atomic64_t *v)                    \
>         raw_spin_unlock_irqrestore(lock, flags);                        \
>         return val;                                                     \
>  }                                                                      \
> -EXPORT_SYMBOL(atomic64_##op##_return);
> +EXPORT_SYMBOL(generic_atomic64_##op##_return);
>
>  #define ATOMIC64_FETCH_OP(op, c_op)                                    \
> -s64 atomic64_fetch_##op(s64 a, atomic64_t *v)                          \
> +s64 generic_atomic64_fetch_##op(s64 a, atomic64_t *v)                  \
>  {                                                                      \
>         unsigned long flags;                                            \
>         raw_spinlock_t *lock = lock_addr(v);                            \
> @@ -105,7 +105,7 @@ s64 atomic64_fetch_##op(s64 a, atomic64_t *v)                               \
>         raw_spin_unlock_irqrestore(lock, flags);                        \
>         return val;                                                     \
>  }                                                                      \
> -EXPORT_SYMBOL(atomic64_fetch_##op);
> +EXPORT_SYMBOL(generic_atomic64_fetch_##op);
>
>  #define ATOMIC64_OPS(op, c_op)                                         \
>         ATOMIC64_OP(op, c_op)                                           \
> @@ -130,7 +130,7 @@ ATOMIC64_OPS(xor, ^=)
>  #undef ATOMIC64_OP_RETURN
>  #undef ATOMIC64_OP
>
> -s64 atomic64_dec_if_positive(atomic64_t *v)
> +s64 generic_atomic64_dec_if_positive(atomic64_t *v)
>  {
>         unsigned long flags;
>         raw_spinlock_t *lock = lock_addr(v);
> @@ -143,9 +143,9 @@ s64 atomic64_dec_if_positive(atomic64_t *v)
>         raw_spin_unlock_irqrestore(lock, flags);
>         return val;
>  }
> -EXPORT_SYMBOL(atomic64_dec_if_positive);
> +EXPORT_SYMBOL(generic_atomic64_dec_if_positive);
>
> -s64 atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n)
> +s64 generic_atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n)
>  {
>         unsigned long flags;
>         raw_spinlock_t *lock = lock_addr(v);
> @@ -158,9 +158,9 @@ s64 atomic64_cmpxchg(atomic64_t *v, s64 o, s64 n)
>         raw_spin_unlock_irqrestore(lock, flags);
>         return val;
>  }
> -EXPORT_SYMBOL(atomic64_cmpxchg);
> +EXPORT_SYMBOL(generic_atomic64_cmpxchg);
>
> -s64 atomic64_xchg(atomic64_t *v, s64 new)
> +s64 generic_atomic64_xchg(atomic64_t *v, s64 new)
>  {
>         unsigned long flags;
>         raw_spinlock_t *lock = lock_addr(v);
> @@ -172,9 +172,9 @@ s64 atomic64_xchg(atomic64_t *v, s64 new)
>         raw_spin_unlock_irqrestore(lock, flags);
>         return val;
>  }
> -EXPORT_SYMBOL(atomic64_xchg);
> +EXPORT_SYMBOL(generic_atomic64_xchg);
>
> -s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
> +s64 generic_atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
>  {
>         unsigned long flags;
>         raw_spinlock_t *lock = lock_addr(v);
> @@ -188,4 +188,4 @@ s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
>
>         return val;
>  }
> -EXPORT_SYMBOL(atomic64_fetch_add_unless);
> +EXPORT_SYMBOL(generic_atomic64_fetch_add_unless);
> --
> 2.11.0
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
