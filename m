Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F48C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 22 May 2022 13:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VdaqEFqi4xCOQ/9TLe7qQ85GSogc9CdiD1ddYv+/0IA=; b=ZcWchDzvWbHCBk
	fo6QD+ZmegEf4Ov+v610Ziq9CTgR9n1NpA4o7tQfXChoBiV1W+dbRBBPSp2QFKWhSqtLMGhGCHXK+
	pPvVfNGHZ91JbvG8WiQKYNxsYtFLLic/r+0Sf0ET7G6yzuEN45Ub2PexTFbsH8ruqtIUV0TVfh+o6
	o0FDZhjb+/R15IAnmEr+bqg5wmp9uTDKpFNSjCOm1BG5v98cx5H/zdTqE5qV+qy/6YqrVA7KKIbmi
	uBniUsIfbhaQYTeKHJHD2URxu0cP6IYcNL8f4RE/yDpMoZKn+g/tVhiHk/RZHG2xt8+B0qFXGjrVV
	NBeVZUe1Q7LNaTesbcuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nslOV-001NbG-Qx; Sun, 22 May 2022 13:13:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nslOS-001NaR-5r
 for linux-riscv@lists.infradead.org; Sun, 22 May 2022 13:13:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 77DB4B80ABE
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 13:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408A8C34117
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 13:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653225189;
 bh=8Ni5c6Xwwig839tx+SLYNI2uAV2C3Tn7rzb0ubCC4rA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=karEZOrVgKgEytAenz7Bf/6RrIZZPB+4IcNTvWZy1mdVVrGHIuuJwmPXjhUJ7C4wm
 qUaq+Gd1g9DH7Kh7I5ZCmlt5NY9NbZYd/GZXLt37EQxGjM8wfkk9ud1ppizlvDfJ05
 RkXq6vAPZYas2zOWziYSXJbX9y9mduKjbmfG/9JOz00HMAhbw8uk+hajuElu/gOvng
 OPYbQUtBWNW7d/EBZ/JebhCIsHUYQl19awBnkje0hgNzjg2hKEeD7zODUOHlC9TAm5
 nDaHDLaRlMZJYZBFaHn4JWTx0nypXKAtkkcnkoDV7EAkRB2zyGqgvoaHYLqTDMfOCi
 /L3dYo5GXzk3g==
Received: by mail-vs1-f52.google.com with SMTP id c62so12516909vsc.10
 for <linux-riscv@lists.infradead.org>; Sun, 22 May 2022 06:13:09 -0700 (PDT)
X-Gm-Message-State: AOAM53239+8w8PZ2XKb1abYfMGqlpjNfOPYh+Sn0wURYp+3W6AZUvk0y
 FXnyVahsyWd+MfEU2XdttChH92OSWGnYDU041HU=
X-Google-Smtp-Source: ABdhPJy8HI9+Y/4fRcZH066Zzcs0KxedHbq4UohdbaMcNOyoW86HIIdxARLxC4+Gktwa/Ikrj7UYTjod22nPGczBNwI=
X-Received: by 2002:a67:e046:0:b0:335:d1a2:6192 with SMTP id
 n6-20020a67e046000000b00335d1a26192mr7142077vsl.8.1653225188112; Sun, 22 May
 2022 06:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220505035526.2974382-6-guoren@kernel.org>
 <mhng-7ebff936-b0d8-4f65-bd51-46bcd7e0d5c8@palmer-ri-x1c9>
In-Reply-To: <mhng-7ebff936-b0d8-4f65-bd51-46bcd7e0d5c8@palmer-ri-x1c9>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 22 May 2022 21:12:56 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQoSQq_S4UvAiXgMviT040Ls8+VkDszQSke1a0zbXZ82A@mail.gmail.com>
Message-ID: <CAJF2gTQoSQq_S4UvAiXgMviT040Ls8+VkDszQSke1a0zbXZ82A@mail.gmail.com>
Subject: Re: [PATCH V4 5/5] riscv: atomic: Optimize LRSC-pairs atomic ops with
 .aqrl annotation
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Andrea Parri <parri.andrea@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Daniel Lustig <dlustig@nvidia.com>, linux-arch <linux-arch@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_061312_568134_71C9F639 
X-CRM114-Status: GOOD (  34.67  )
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

On Sun, May 22, 2022 at 4:46 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 04 May 2022 20:55:26 PDT (-0700), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > The current implementation is the same with 8e86f0b409a4
> > ("arm64: atomics: fix use of acquire + release for full barrier
> > semantics"). RISC-V could combine acquire and release into the SC
> > instructions and it could reduce a fence instruction to gain better
> > performance. Here is related descriptio from RISC-V ISA 10.2
> > Load-Reserved/Store-Conditional Instructions:
> >
> >  - .aq:   The LR/SC sequence can be given acquire semantics by
> >           setting the aq bit on the LR instruction.
> >  - .rl:   The LR/SC sequence can be given release semantics by
> >           setting the rl bit on the SC instruction.
> >  - .aqrl: Setting the aq bit on the LR instruction, and setting
> >           both the aq and the rl bit on the SC instruction makes
> >           the LR/SC sequence sequentially consistent, meaning that
> >           it cannot be reordered with earlier or later memory
> >           operations from the same hart.
> >
> >  Software should not set the rl bit on an LR instruction unless
> >  the aq bit is also set, nor should software set the aq bit on an
> >  SC instruction unless the rl bit is also set. LR.rl and SC.aq
> >  instructions are not guaranteed to provide any stronger ordering
> >  than those with both bits clear, but may result in lower
> >  performance.
> >
> > The only difference is when sc.w/d.aqrl failed, it would cause .aq
> > effect than before. But it's okay for sematic because overlap
> > address LR couldn't beyond relating SC.
>
> IIUC that's not accurate, or at least wasn't in 2018.  The ISA tends to
> drift around a bit, so it's possible things have changed since then.
> 5ce6c1f3535f ("riscv/atomic: Strengthen implementations with fences")
Thx for explaining, that why I suspected with the sentence in the comment:
"which do not give full-ordering with .aqrl"

> describes the issue more specifically, that's when we added these
> fences.  There have certainly been complains that these fences are too
> heavyweight for the HW to go fast, but IIUC it's the best option we have
Yeah, it would reduce the performance on D1 and our next-generation
processor has optimized fence performance a lot.

> given the current set of memory model primitives we implement in the
> ISA (ie, there's more in RVWMO but no way to encode that).
>
> The others all look good, though, and as these are really all
> independent cleanups I'm going to go ahead and put those three on
> for-next.
>
> There's also a bunch of checkpatch errors.  The ones about "*" seem
> spurious, but the alignment ones aren't.  Here's my fixups:
Thx for the fixup.

>
>     diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
>     index 34f757dfc8f2..0bde499fa8bc 100644
>     --- a/arch/riscv/include/asm/atomic.h
>     +++ b/arch/riscv/include/asm/atomic.h
>     @@ -86,9 +86,9 @@ ATOMIC_OPS(xor, xor,  i)
>       * versions, while the logical ops only have fetch versions.
>       */
>      #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)   \
>     -static __always_inline                                                     \
>     -c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,                \
>     -                                        atomic##prefix##_t *v)     \
>     +static __always_inline c_type                                              \
>     +arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,                       \
>     +                                      atomic##prefix##_t *v)       \
>      {                                                                  \
>         register c_type ret;                                            \
>         __asm__ __volatile__ (                                          \
>     @@ -98,9 +98,9 @@ c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,               \
>                 : "memory");                                            \
>         return ret;                                                     \
>      }                                                                  \
>     -static __always_inline                                                     \
>     -c_type arch_atomic##prefix##_fetch_##op##_acquire(c_type i,                \
>     -                                        atomic##prefix##_t *v)     \
>     +static __always_inline c_type                                              \
>     +arch_atomic##prefix##_fetch_##op##_acquire(c_type i,                       \
>     +                                      atomic##prefix##_t *v)       \
>      {                                                                  \
>         register c_type ret;                                            \
>         __asm__ __volatile__ (                                          \
>     @@ -110,9 +110,9 @@ c_type arch_atomic##prefix##_fetch_##op##_acquire(c_type i,             \
>                 : "memory");                                            \
>         return ret;                                                     \
>      }                                                                  \
>     -static __always_inline                                                     \
>     -c_type arch_atomic##prefix##_fetch_##op##_release(c_type i,                \
>     -                                        atomic##prefix##_t *v)     \
>     +static __always_inline c_type                                              \
>     +arch_atomic##prefix##_fetch_##op##_release(c_type i,                       \
>     +                                      atomic##prefix##_t *v)       \
>      {                                                                  \
>         register c_type ret;                                            \
>         __asm__ __volatile__ (                                          \
>     @@ -122,8 +122,8 @@ c_type arch_atomic##prefix##_fetch_##op##_release(c_type i,             \
>                 : "memory");                                            \
>         return ret;                                                     \
>      }                                                                  \
>     -static __always_inline                                                     \
>     -c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)   \
>     +static __always_inline c_type                                              \
>     +arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)  \
>      {                                                                  \
>         register c_type ret;                                            \
>         __asm__ __volatile__ (                                          \
>     @@ -135,28 +135,28 @@ c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)      \
>      }
>
>      #define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix)    \
>     -static __always_inline                                                     \
>     -c_type arch_atomic##prefix##_##op##_return_relaxed(c_type i,               \
>     -                                         atomic##prefix##_t *v)    \
>     +static __always_inline c_type                                              \
>     +arch_atomic##prefix##_##op##_return_relaxed(c_type i,                      \
>     +                                       atomic##prefix##_t *v)      \
>      {                                                                  \
>     -        return arch_atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;    \
>     +   return arch_atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I; \
>      }                                                                  \
>     -static __always_inline                                                     \
>     -c_type arch_atomic##prefix##_##op##_return_acquire(c_type i,               \
>     -                                         atomic##prefix##_t *v)    \
>     +static __always_inline c_type                                              \
>     +arch_atomic##prefix##_##op##_return_acquire(c_type i,                      \
>     +                                       atomic##prefix##_t *v)      \
>      {                                                                  \
>     -        return arch_atomic##prefix##_fetch_##op##_acquire(i, v) c_op I;    \
>     +   return arch_atomic##prefix##_fetch_##op##_acquire(i, v) c_op I; \
>      }                                                                  \
>     -static __always_inline                                                     \
>     -c_type arch_atomic##prefix##_##op##_return_release(c_type i,               \
>     -                                         atomic##prefix##_t *v)    \
>     +static __always_inline c_type                                              \
>     +arch_atomic##prefix##_##op##_return_release(c_type i,                      \
>     +                                       atomic##prefix##_t *v)      \
>      {                                                                  \
>     -        return arch_atomic##prefix##_fetch_##op##_release(i, v) c_op I;    \
>     +   return arch_atomic##prefix##_fetch_##op##_release(i, v) c_op I; \
>      }                                                                  \
>     -static __always_inline                                                     \
>     -c_type arch_atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)        \
>     +static __always_inline c_type                                              \
>     +arch_atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)       \
>      {                                                                  \
>     -        return arch_atomic##prefix##_fetch_##op(i, v) c_op I;              \
>     +   return arch_atomic##prefix##_fetch_##op(i, v) c_op I;           \
>      }
>
>      #ifdef CONFIG_GENERIC_ATOMIC64
>
>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Dan Lustig <dlustig@nvidia.com>
> > Cc: Andrea Parri <parri.andrea@gmail.com>
> > ---
> >  arch/riscv/include/asm/atomic.h  | 24 ++++++++----------------
> >  arch/riscv/include/asm/cmpxchg.h |  6 ++----
> >  2 files changed, 10 insertions(+), 20 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> > index 34f757dfc8f2..aef8aa9ac4f4 100644
> > --- a/arch/riscv/include/asm/atomic.h
> > +++ b/arch/riscv/include/asm/atomic.h
> > @@ -269,9 +269,8 @@ static __always_inline int arch_atomic_fetch_add_unless(atomic_t *v, int a, int
> >               "0:     lr.w     %[p],  %[c]\n"
> >               "       beq      %[p],  %[u], 1f\n"
> >               "       add      %[rc], %[p], %[a]\n"
> > -             "       sc.w.rl  %[rc], %[rc], %[c]\n"
> > +             "       sc.w.aqrl  %[rc], %[rc], %[c]\n"
> >               "       bnez     %[rc], 0b\n"
> > -             "       fence    rw, rw\n"
> >               "1:\n"
> >               : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> >               : [a]"r" (a), [u]"r" (u)
> > @@ -290,9 +289,8 @@ static __always_inline s64 arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a,
> >               "0:     lr.d     %[p],  %[c]\n"
> >               "       beq      %[p],  %[u], 1f\n"
> >               "       add      %[rc], %[p], %[a]\n"
> > -             "       sc.d.rl  %[rc], %[rc], %[c]\n"
> > +             "       sc.d.aqrl  %[rc], %[rc], %[c]\n"
> >               "       bnez     %[rc], 0b\n"
> > -             "       fence    rw, rw\n"
> >               "1:\n"
> >               : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> >               : [a]"r" (a), [u]"r" (u)
> > @@ -382,9 +380,8 @@ static __always_inline bool arch_atomic_inc_unless_negative(atomic_t *v)
> >               "0:     lr.w      %[p],  %[c]\n"
> >               "       bltz      %[p],  1f\n"
> >               "       addi      %[rc], %[p], 1\n"
> > -             "       sc.w.rl   %[rc], %[rc], %[c]\n"
> > +             "       sc.w.aqrl %[rc], %[rc], %[c]\n"
> >               "       bnez      %[rc], 0b\n"
> > -             "       fence     rw, rw\n"
> >               "1:\n"
> >               : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> >               :
> > @@ -402,9 +399,8 @@ static __always_inline bool arch_atomic_dec_unless_positive(atomic_t *v)
> >               "0:     lr.w      %[p],  %[c]\n"
> >               "       bgtz      %[p],  1f\n"
> >               "       addi      %[rc], %[p], -1\n"
> > -             "       sc.w.rl   %[rc], %[rc], %[c]\n"
> > +             "       sc.w.aqrl %[rc], %[rc], %[c]\n"
> >               "       bnez      %[rc], 0b\n"
> > -             "       fence     rw, rw\n"
> >               "1:\n"
> >               : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> >               :
> > @@ -422,9 +418,8 @@ static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
> >               "0:     lr.w     %[p],  %[c]\n"
> >               "       addi     %[rc], %[p], -1\n"
> >               "       bltz     %[rc], 1f\n"
> > -             "       sc.w.rl  %[rc], %[rc], %[c]\n"
> > +             "       sc.w.aqrl %[rc], %[rc], %[c]\n"
> >               "       bnez     %[rc], 0b\n"
> > -             "       fence    rw, rw\n"
> >               "1:\n"
> >               : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> >               :
> > @@ -444,9 +439,8 @@ static __always_inline bool arch_atomic64_inc_unless_negative(atomic64_t *v)
> >               "0:     lr.d      %[p],  %[c]\n"
> >               "       bltz      %[p],  1f\n"
> >               "       addi      %[rc], %[p], 1\n"
> > -             "       sc.d.rl   %[rc], %[rc], %[c]\n"
> > +             "       sc.d.aqrl %[rc], %[rc], %[c]\n"
> >               "       bnez      %[rc], 0b\n"
> > -             "       fence     rw, rw\n"
> >               "1:\n"
> >               : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> >               :
> > @@ -465,9 +459,8 @@ static __always_inline bool arch_atomic64_dec_unless_positive(atomic64_t *v)
> >               "0:     lr.d      %[p],  %[c]\n"
> >               "       bgtz      %[p],  1f\n"
> >               "       addi      %[rc], %[p], -1\n"
> > -             "       sc.d.rl   %[rc], %[rc], %[c]\n"
> > +             "       sc.d.aqrl %[rc], %[rc], %[c]\n"
> >               "       bnez      %[rc], 0b\n"
> > -             "       fence     rw, rw\n"
> >               "1:\n"
> >               : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> >               :
> > @@ -486,9 +479,8 @@ static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
> >               "0:     lr.d     %[p],  %[c]\n"
> >               "       addi      %[rc], %[p], -1\n"
> >               "       bltz     %[rc], 1f\n"
> > -             "       sc.d.rl  %[rc], %[rc], %[c]\n"
> > +             "       sc.d.aqrl %[rc], %[rc], %[c]\n"
> >               "       bnez     %[rc], 0b\n"
> > -             "       fence    rw, rw\n"
> >               "1:\n"
> >               : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> >               :
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > index 1af8db92250b..9269fceb86e0 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -307,9 +307,8 @@
> >               __asm__ __volatile__ (                                  \
> >                       "0:     lr.w %0, %2\n"                          \
> >                       "       bne  %0, %z3, 1f\n"                     \
> > -                     "       sc.w.rl %1, %z4, %2\n"                  \
> > +                     "       sc.w.aqrl %1, %z4, %2\n"                \
> >                       "       bnez %1, 0b\n"                          \
> > -                     "       fence rw, rw\n"                         \
> >                       "1:\n"                                          \
> >                       : "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)    \
> >                       : "rJ" ((long)__old), "rJ" (__new)              \
> > @@ -319,9 +318,8 @@
> >               __asm__ __volatile__ (                                  \
> >                       "0:     lr.d %0, %2\n"                          \
> >                       "       bne %0, %z3, 1f\n"                      \
> > -                     "       sc.d.rl %1, %z4, %2\n"                  \
> > +                     "       sc.d.aqrl %1, %z4, %2\n"                \
> >                       "       bnez %1, 0b\n"                          \
> > -                     "       fence rw, rw\n"                         \
> >                       "1:\n"                                          \
> >                       : "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)    \
> >                       : "rJ" (__old), "rJ" (__new)                    \



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
