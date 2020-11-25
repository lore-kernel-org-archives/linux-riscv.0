Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5C6C5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 14:19:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89BA9206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 14:19:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rZvvQ2VY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUtK1yZs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89BA9206D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=95G6MwnE6dmjpVWVY0RAddzKpAx8MXBllaOJYAtknAM=; b=rZvvQ2VYaum9xMfkNkS+S8OgT
	RcHZjST3ve9vpEyQUPb/TxGMWRwJSYJSJUfPZ18LuX1WWk9NSetVlh4vYRRf0MKllTkJw+P1Yysd5
	azr3g6gDDXnYx9FH3E+luIDg2VzPLErCaBNQXurlYTweRqwTVbPRsBGIof7Lq4gwABN6rIcdL6J5P
	4gD0kICh6dXIGIPRDmVIHvPzYhy1n28V65rVJ2bZkAy7ntS8qdArKW5uumjYkVf50ktLoKj25SKb6
	+CZfxsE9DDr40plo6C1BH+t5N/BWVt1fO4HMy530D55AZDWMc//3Vt+ia7LDvtcoOku+4Ps1gVgJT
	VEx+fZ2Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khvdQ-0003tp-TP; Wed, 25 Nov 2020 14:19:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khvdJ-0003pS-Rr
 for linux-riscv@lists.infradead.org; Wed, 25 Nov 2020 14:19:00 +0000
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AC58021D91
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 14:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606313937;
 bh=G3pKsUj3Y7MzqCMy07442BtCwg0kgd1c+eqGkdIkBxg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OUtK1yZsKr9EB20Zas0QOukq2U6zpaeI2GvRrIIQ5YC5S4xbuePa5FwwfzJSJqfrJ
 YDAjz8XGY35WDLfV62iggl4nIAcd/ePRlRfv0wVlCbwA8sSrqWxEMcPuS5SYAywpkb
 q5goHjwXwNiI/RLabD6ffkrD0uPYctaL33eLGHV4=
Received: by mail-lj1-f181.google.com with SMTP id z1so2466002ljn.4
 for <linux-riscv@lists.infradead.org>; Wed, 25 Nov 2020 06:18:56 -0800 (PST)
X-Gm-Message-State: AOAM531fjB+XXJSKyHJoh2ck2NVgCdKMn0Cf6uIomLkKLINuEtO0yaRx
 4GtR4UgHbC7pH4yNk+KgYgLf1DB74TQ5K/uXGRU=
X-Google-Smtp-Source: ABdhPJxgFfiVO1tJMw+IlkBm+qpJtZ+m45Hz5edm98uNAaCgEFTkb8waAwCmWT0iq+PBDrL5/XItcg8ywCZ/q0v9zAM=
X-Received: by 2002:a05:651c:213:: with SMTP id
 y19mr1404910ljn.250.1606313934732; 
 Wed, 25 Nov 2020 06:18:54 -0800 (PST)
MIME-Version: 1.0
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
 <20201124142905.GH2414@hirez.programming.kicks-ass.net>
In-Reply-To: <20201124142905.GH2414@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 25 Nov 2020 22:18:43 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT1_mP-wiK2HsCpTeU61NqZVKZX1A5ye=TwqvGN4TPmrA@mail.gmail.com>
Message-ID: <CAJF2gTT1_mP-wiK2HsCpTeU61NqZVKZX1A5ye=TwqvGN4TPmrA@mail.gmail.com>
Subject: Re: [PATCH 1/5] riscv: Coding convention for xchg
To: Peter Zijlstra <peterz@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_091858_141426_EEBFDDF4 
X-CRM114-Status: GOOD (  19.15  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 10:29 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Nov 24, 2020 at 01:43:53PM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > This is prepare for QUEUED_SPINLOCKS which need xchg support short
> > type value.
> >  - Remove unused codes (xchg32, xchg64, cmpxchg32 ...)
> >  - Combine xchg_relaxed, xchg_acquire, xchg_release into one asm
> >  - Make atomic.aq/rl with seperated fence acquire & release
>
> Every time you find yourself doing multiple things, make it multiple
> patches.
Ok.

>
> > @@ -242,58 +239,58 @@ static __always_inline s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u
> >   * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
> >   * {cmp,}xchg and the operations that return, so they need a full barrier.
> >   */
> > +#define ATOMIC_OP(c_t, prefix)                                               \
> >  static __always_inline                                                       \
> >  c_t atomic##prefix##_xchg_relaxed(atomic##prefix##_t *v, c_t n)              \
> >  {                                                                    \
> > +     return xchg_relaxed(&(v->counter), n);                          \
> >  }                                                                    \
> >  static __always_inline                                                       \
> >  c_t atomic##prefix##_xchg_acquire(atomic##prefix##_t *v, c_t n)              \
> >  {                                                                    \
> > +     return xchg_acquire(&(v->counter), n);                          \
> >  }                                                                    \
> >  static __always_inline                                                       \
> >  c_t atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)              \
> >  {                                                                    \
> > +     return xchg_release(&(v->counter), n);                          \
> >  }                                                                    \
> >  static __always_inline                                                       \
> >  c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)                      \
> >  {                                                                    \
> > +     return xchg(&(v->counter), n);                                  \
> >  }                                                                    \
> >  static __always_inline                                                       \
> >  c_t atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,          \
> >                                    c_t o, c_t n)                      \
> >  {                                                                    \
> > +     return cmpxchg_relaxed(&(v->counter), o, n);                    \
> >  }                                                                    \
> >  static __always_inline                                                       \
> >  c_t atomic##prefix##_cmpxchg_acquire(atomic##prefix##_t *v,          \
> >                                    c_t o, c_t n)                      \
> >  {                                                                    \
> > +     return cmpxchg_acquire(&(v->counter), o, n);                    \
> >  }                                                                    \
> >  static __always_inline                                                       \
> >  c_t atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,          \
> >                                    c_t o, c_t n)                      \
> >  {                                                                    \
> > +     return cmpxchg_release(&(v->counter), o, n);                    \
> >  }                                                                    \
> >  static __always_inline                                                       \
> >  c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n)    \
> >  {                                                                    \
> > +     return cmpxchg(&(v->counter), o, n);                            \
> >  }
>
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > index 262e5bb..5609185 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -44,118 +44,31 @@
> >                                           _x_, sizeof(*(ptr)));       \
> >  })
> >
> >  #define xchg_acquire(ptr, x)                                         \
> >  ({                                                                   \
> > +     __typeof__(*(ptr)) _x_ = (x);                                   \
> > +     __ret = __xchg_relaxed((ptr), _x_, sizeof(*(ptr)));             \
> > +     __acquire_fence();                                              \
> >       __ret;                                                          \
> >  })
> >
> >  #define xchg_release(ptr, x)                                         \
> >  ({                                                                   \
> >       __typeof__(*(ptr)) _x_ = (x);                                   \
> > +     __release_fence();                                              \
> > +     (__typeof__(*(ptr))) __xchg_relaxed((ptr),                      \
> >                                           _x_, sizeof(*(ptr)));       \
> >  })
> >
> >  #define xchg(ptr, x)                                                 \
> >  ({                                                                   \
> > +     __typeof__(*(ptr)) __ret;                                       \
> >       __typeof__(*(ptr)) _x_ = (x);                                   \
> > +     __smp_mb();                                                     \
> > +     __ret = __xchg_relaxed((ptr), _x_, sizeof(*(ptr)));             \
> > +     __smp_mb();                                                     \
> > +     __ret;                                                          \
> >  })
> >
> >  /*
>
> Why are you defining *{,_acquire,_release}() at all, doesn't
> atomic-fallback.h DTRT for you?
Yes, you are right. I could reuse that. Thx

#define cmpxchg_acquire(...) \
        __atomic_op_acquire(cmpxchg, __VA_ARGS__)
#endif

#define __atomic_op_acquire(op, args...)                                \
({                                                                      \
        typeof(op##_relaxed(args)) __ret  = op##_relaxed(args);         \
        __atomic_acquire_fence();                                       \
        __ret;                                                          \
})


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
