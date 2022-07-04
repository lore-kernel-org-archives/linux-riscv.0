Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40187C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zQk7mOdcxk2ookDabSFnN8S33rHO2HnU6OVk6jIc15M=; b=sHZE0X+Fmemf0I
	YFfQTqP13WZCD8urjsHGpbEMHlZGp2ytcO+xiWeK89wZHPIqO6X3/nMdvNiqUWaUK+0k37sWEZ7Bk
	k6JJsiOLbKIzzJz7F7nhU8ie0HxuB7JuNBVK6wmU6jGzGJjvJjc1YRmrXLtzXAxhR+Ul8cL26A+Za
	SHNz7mNspmROtTy5hjWey9iwd9Q3L1VnxzI0LyoOvEH22tfP3cIKLxgKnbrlS6PrYrAFMhWaPTysb
	uRg1uK+QsOnFAX1WiqIUJic2GmPjQcCk06DUQza6vLMbD4oFh9Cla+pOzTiSIA7N72ZtzWTpyXkhZ
	0mVIU+bSIIY8z0QlJkxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8KMF-007prB-L1; Mon, 04 Jul 2022 11:35:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8JyJ-007VEf-78
	for linux-riscv@lists.infradead.org; Mon, 04 Jul 2022 11:10:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B01CC615F5
	for <linux-riscv@lists.infradead.org>; Mon,  4 Jul 2022 11:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22162C341CD
	for <linux-riscv@lists.infradead.org>; Mon,  4 Jul 2022 11:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656933030;
	bh=ot6Cywhg5Y74QsAqqjdnA7iQ1+9VGdvh4LvC/i3dOjU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qk6g9als6ERJTM7rL3rHUn2jKHchPkmFyKqleAn6liKL9sqGK9Ph+B181hl0DskoP
	 WvgZa9xt1DqAjubxp46ywcamgiWVwshg5P1AfVZYBHxrikNXskcynP9S2vviur34es
	 8/8qLfVWS8R+9orDIsUaoIwB46UAGJWE/nVDX3t8s5v9PHdn2l36bBpBVw7AfJlVS9
	 iaQK/4WPHYqlsBqRS2m0gYWCMWwvvw7A7WHYK6xnJJXF4RNljFxIZPKR6i9Xs2MBzu
	 dgsdLgVX1ri7kcTKSuiWafBh7YpiqfYBRYlj+maVC7OTD7uCshAu2KrdbzgHBcN2kq
	 YpvHkzDoEHfeQ==
Received: by mail-vs1-f52.google.com with SMTP id o13so8637546vsn.4
        for <linux-riscv@lists.infradead.org>; Mon, 04 Jul 2022 04:10:30 -0700 (PDT)
X-Gm-Message-State: AJIora9rnNUoNa/GiZN8C0rRfm9WhyuTHYcDNVqqMQIV21yDrLVhoAyn
	XCEzhFT04NBxoPeYuwHGStlZ0sme8XyUOMzJdOU=
X-Google-Smtp-Source: AGRyM1uk1FGNC9Dq3XZ8oH9EJNsX2SQ8QRIj2cAQaGvT9ZrDtktfrcKyEyV/z5OXo0zyRjs4k6ePRO+yPt1Kf1zPKR8=
X-Received: by 2002:a05:6102:366f:b0:356:352f:9de2 with SMTP id
 bg15-20020a056102366f00b00356352f9de2mr16599934vsb.2.1656933028989; Mon, 04
 Jul 2022 04:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220628081707.1997728-1-guoren@kernel.org> <20220628081707.1997728-2-guoren@kernel.org>
 <YsK4Z9w0tFtgkni8@hirez.programming.kicks-ass.net>
In-Reply-To: <YsK4Z9w0tFtgkni8@hirez.programming.kicks-ass.net>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 4 Jul 2022 19:10:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTJn7facrxSzU+_ZKhVdXxJEYfGWpP7QqArVUTazw_JHg@mail.gmail.com>
Message-ID: <CAJF2gTTJn7facrxSzU+_ZKhVdXxJEYfGWpP7QqArVUTazw_JHg@mail.gmail.com>
Subject: Re: [PATCH V7 1/5] asm-generic: ticket-lock: Remove unnecessary atomic_read
To: Peter Zijlstra <peterz@infradead.org>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, linux-arch <linux-arch@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_041031_532449_9F827C6D 
X-CRM114-Status: GOOD (  22.66  )
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

On Mon, Jul 4, 2022 at 5:52 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Tue, Jun 28, 2022 at 04:17:03AM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Remove unnecessary atomic_read in arch_spin_value_unlocked(lock),
> > because the value has been in lock. This patch could prevent
> > arch_spin_value_unlocked contend spin_lock data again.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Palmer Dabbelt <palmer@rivosinc.com>
> > ---
> >  include/asm-generic/spinlock.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> > index fdfebcb050f4..f1e4fa100f5a 100644
> > --- a/include/asm-generic/spinlock.h
> > +++ b/include/asm-generic/spinlock.h
> > @@ -84,7 +84,9 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> >
> >  static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> >  {
> > -     return !arch_spin_is_locked(&lock);
> > +     u32 val = lock.counter;
> > +
> > +     return ((val >> 16) == (val & 0xffff));
> >  }
>
> Wouldn't the right thing be to flip arch_spin_is_locked() and
> arch_spin_value_is_unlocked() ?
Okay, I agree with your patch. Next version, I would take the below code.

>
>
> diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> index fdfebcb050f4..63ab4da262f2 100644
> --- a/include/asm-generic/spinlock.h
> +++ b/include/asm-generic/spinlock.h
> @@ -68,23 +68,25 @@ static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
>         smp_store_release(ptr, (u16)val + 1);
>  }
>
> -static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
> +static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
>  {
>         u32 val = atomic_read(lock);
>
> -       return ((val >> 16) != (val & 0xffff));
> +       return (s16)((val >> 16) - (val & 0xffff)) > 1;
>  }
>
> -static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> +static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
>  {
> -       u32 val = atomic_read(lock);
> +       u32 val = lock.counter;
>
> -       return (s16)((val >> 16) - (val & 0xffff)) > 1;
> +       return ((val >> 16) == (val & 0xffff));
>  }
>
> -static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> +static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
>  {
> -       return !arch_spin_is_locked(&lock);
> +       arch_spinlock_t val = READ_ONCE(*lock);
> +
> +       return !arch_spin_value_unlocked(val);
>  }
>
>  #include <asm/qrwlock.h>
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
