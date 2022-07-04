Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 419F2C43334
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Jul 2022 09:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e2A8MwBhPZL0c3Pbadb8Z6GfrHO7oJweYrWBEMxwGqM=; b=mGZ1JVxBIdBkns
	zQxEUZ/lQeACuj26H+dIbTUJjQRj5f8L6dnNihcJtG6Z6G7q14/8na1dgWfN0I4UsgtxbXeyQFb3Y
	gn1fnfBWZA1Es1K34Abq6Z2DN+mbG7B5P5VORaTtlUZ141ergZkp+5zP89DHI4m2NTeaQ4W0FijOu
	aX3qvbOT2OBVsCzbgWfIJoPnza9Ll8rJuDTGIe3tXFVPBWUQ8Lv5nPkpkePtj/7g1+mNXJnGVBfRS
	U1l794l8/WvIsmG/Pnn1QSnmosZbYHByer6B+SOc/UbmXc+96/FmoR0Z32yg7spSYhOLvA4tFlw8T
	Ya5E2Beaqk3XDhJi3eRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Iq9-006fxU-Mj; Mon, 04 Jul 2022 09:58:01 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Iq8-006fvr-0B
	for linux-riscv@bombadil.infradead.org; Mon, 04 Jul 2022 09:58:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Px+ZKe9wAi2SGp+Y/6g7fKEpuudOqTemcnnZ84upXy8=; b=J/H0dEX0q7o0GxYYQ1CPY4uwG4
	veQdZPjrUKZLIzPt4BYfwjbS0U+zUGORZUnwe/nAIVwbzUjZ5Rcc3/OR2taXv/aiplUlOCNc+fN4X
	ZJPoZvfI3JhmfW5whl1MEn48DScYlBAk4XFwNW7UpiTWRjQf7InO/uZOOMp8+z2X0d1jJM9tyc4dp
	QhFROKJUMdYqQdLZOhn0pyXYkiIBKz+iDFmb/qYUIfa7I6CE9AlkvIDivPVXEASS3OdWUTikJcQLP
	WgMZLlG6T6yThW8rue0pP0/5gG8gk8tT1hRJg56z0lZLtAnZeiBZYDPnJA2ZsxvECu9J7/Adredgc
	kjC0K1fA==;
Received: from dhcp-077-249-017-003.chello.nl ([77.249.17.3] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8Iq4-00H9wK-Om; Mon, 04 Jul 2022 09:57:56 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1323630003A;
	Mon,  4 Jul 2022 11:57:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id EDF8120295B20; Mon,  4 Jul 2022 11:57:55 +0200 (CEST)
Date: Mon, 4 Jul 2022 11:57:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: palmer@rivosinc.com, arnd@arndb.de, mingo@redhat.com, will@kernel.org,
	longman@redhat.com, boqun.feng@gmail.com,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V7 4/5] asm-generic: spinlock: Add combo spinlock (ticket
 & queued)
Message-ID: <YsK5o8eiVHeS+7Iw@hirez.programming.kicks-ass.net>
References: <20220628081707.1997728-1-guoren@kernel.org>
 <20220628081707.1997728-5-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628081707.1997728-5-guoren@kernel.org>
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

On Tue, Jun 28, 2022 at 04:17:06AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Some architecture has a flexible requirement on the type of spinlock.
> Some LL/SC architectures of ISA don't force micro-arch to give a strong
> forward guarantee. Thus different kinds of memory model micro-arch would
> come out in one ISA. The ticket lock is suitable for exclusive monitor
> designed LL/SC micro-arch with limited cores and "!NUMA". The
> queue-spinlock could deal with NUMA/large-scale scenarios with a strong
> forward guarantee designed LL/SC micro-arch.
> 
> So, make the spinlock a combo with feature.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  include/asm-generic/spinlock.h | 43 ++++++++++++++++++++++++++++++++--
>  kernel/locking/qspinlock.c     |  2 ++
>  2 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> index f41dc7c2b900..a9b43089bf99 100644
> --- a/include/asm-generic/spinlock.h
> +++ b/include/asm-generic/spinlock.h
> @@ -28,34 +28,73 @@
>  #define __ASM_GENERIC_SPINLOCK_H
>  
>  #include <asm-generic/ticket_spinlock.h>
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +#include <linux/jump_label.h>
> +#include <asm-generic/qspinlock.h>
> +
> +DECLARE_STATIC_KEY_TRUE(use_qspinlock_key);
> +#endif
> +
> +#undef arch_spin_is_locked
> +#undef arch_spin_is_contended
> +#undef arch_spin_value_unlocked
> +#undef arch_spin_lock
> +#undef arch_spin_trylock
> +#undef arch_spin_unlock
>  
>  static __always_inline void arch_spin_lock(arch_spinlock_t *lock)
>  {
> -	ticket_spin_lock(lock);
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +	if (static_branch_likely(&use_qspinlock_key))
> +		queued_spin_lock(lock);
> +	else
> +#endif
> +		ticket_spin_lock(lock);
>  }
>  
>  static __always_inline bool arch_spin_trylock(arch_spinlock_t *lock)
>  {
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +	if (static_branch_likely(&use_qspinlock_key))
> +		return queued_spin_trylock(lock);
> +#endif
>  	return ticket_spin_trylock(lock);
>  }
>  
>  static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
>  {
> -	ticket_spin_unlock(lock);
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +	if (static_branch_likely(&use_qspinlock_key))
> +		queued_spin_unlock(lock);
> +	else
> +#endif
> +		ticket_spin_unlock(lock);
>  }
>  
>  static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
>  {
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +	if (static_branch_likely(&use_qspinlock_key))
> +		return queued_spin_is_locked(lock);
> +#endif
>  	return ticket_spin_is_locked(lock);
>  }
>  
>  static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
>  {
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +	if (static_branch_likely(&use_qspinlock_key))
> +		return queued_spin_is_contended(lock);
> +#endif
>  	return ticket_spin_is_contended(lock);
>  }
>  
>  static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
>  {
> +#ifdef CONFIG_ARCH_USE_QUEUED_SPINLOCKS
> +	if (static_branch_likely(&use_qspinlock_key))
> +		return queued_spin_value_unlocked(lock);
> +#endif
>  	return ticket_spin_value_unlocked(lock);
>  }

Urggghhhh....

I really don't think you want this in generic code. Also, I'm thinking
any arch that does this wants to make sure it doesn't inline any of this
stuff. That is, said arch must not have ARCH_INLINE_SPIN_*

And if you're going to force things out of line, then I think you can
get better code using static_call().

*shudder*...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
