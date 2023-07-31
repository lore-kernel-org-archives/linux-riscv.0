Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6FEC001DF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 02:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCph5Z+JTyDMVtekKAGIaa781XRG8F07AZq6QmzHQWg=; b=R+HjslZwcIDjEV
	rezdlq7mXN2v8q1UKWRc/yPd/4UFRRfrcP2o+fEOzc9Q3psFWH4N2MrMQDaBJg1ZBeby0SoW1x5nl
	+Aq9J+FCcjXrUXlAz7mxQLtZ7nFziafw/41PsIrZ5Gg8hqbZy8GQ+v3K8H16XoHN5MyFmREDdpD+h
	xDjYlbPQK7SZLtkqWIY//VCKt1YAs5KqvkqWfVb2XylKRVi1g1+yb8yowibuIr1meSagZ5WxWmW3e
	bmAG0iOjWbsBsfNzFD6RbjiSeO7aKGyB5Gq8DbKjHyDjm5rJBfz6HnAIGH4lPx2+Nbh8ePHuSoiUx
	RNIwG1IaW2/pyU183qrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQIq7-00DXit-2k;
	Mon, 31 Jul 2023 02:40:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQIq4-00DXhS-1g
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 02:40:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0E0D60DFC;
	Mon, 31 Jul 2023 02:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2817FC433C8;
	Mon, 31 Jul 2023 02:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690771251;
	bh=J0ZdN6k+NXscFIa7xVIKz/qaVIETu93UOxamXbBvn2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AJTp3ft/1lYJCYw86qMq7cQ63uMTMGhxjoq3jOE9P1+oSPudfBtKDO2sS2RApnVx1
	 /eVcB9vFYhumKtBsHk7+wwxvFt4zn1Hg4lZ88BUtnpgJodb7jnRrrXGUlzv0ccqN6G
	 Vv8NJ70nv2rpQjx03sBBfP2aExCqq2kwnJ1eC94id/CVzqhx4+TzZvurTO1uPdzYK+
	 dsgpBCCb8PprfgDzDW3zl53okqTMdcvyvaruKdXNs0LnIU56lBQaklelAXAXypRbqR
	 QZ7Avok5fwmDvaQ5QQYKSlyRRFeLCg/Z/9Cgeg5Qm/p/n3N2kgem0k9b+AL399lAmT
	 gXr1oQyIBS5pg==
Date: Sun, 30 Jul 2023 22:40:40 -0400
From: Guo Ren <guoren@kernel.org>
To: Waiman Long <longman@redhat.com>
Cc: David.Laight@aculab.com, will@kernel.org, peterz@infradead.org,
	mingo@redhat.com, linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] asm-generic: ticket-lock: Optimize
 arch_spin_value_unlocked
Message-ID: <ZMcfKFWWUC0hI2kM@gmail.com>
References: <20230719070001.795010-1-guoren@kernel.org>
 <0e39d62d-44bc-731e-471e-4df621b4cdd5@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e39d62d-44bc-731e-471e-4df621b4cdd5@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_194052_642316_066D8194 
X-CRM114-Status: GOOD (  26.87  )
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

On Sat, Jul 22, 2023 at 10:07:19PM -0400, Waiman Long wrote:
> On 7/19/23 03:00, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > Using arch_spinlock_is_locked would cause another unnecessary memory
> > access to the contended value. Although it won't cause a significant
> > performance gap in most architectures, the arch_spin_value_unlocked
> > argument contains enough information. Thus, remove unnecessary
> > atomic_read in arch_spin_value_unlocked().
> 
> AFAICS, only one memory access is needed for the current
> arch_spinlock_is_locked(). So your description isn't quite right. OTOH,
Okay, I would improve it. Here means "arch_spin_value_unlocked using
arch_spinlock_is_locked" would cause "an" unnecessary ...

> caller of arch_spin_value_unlocked() could benefit from this change.
> Currently, the only caller is lockref.
Thx for comment, I would add it in the commit msg.

New version is here:
https://lore.kernel.org/linux-riscv/20230731023308.3748432-1-guoren@kernel.org/

> 
> Other than that, the patch looks good to me.
> 
> Cheers,
> Longman
> 
> > 
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: David Laight <David.Laight@ACULAB.COM>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > ---
> > Changelog:
> > This patch is separate from:
> > https://lore.kernel.org/linux-riscv/20220808071318.3335746-1-guoren@kernel.org/
> > 
> > Peter & David have commented on it:
> > https://lore.kernel.org/linux-riscv/YsK4Z9w0tFtgkni8@hirez.programming.kicks-ass.net/
> > ---
> >   include/asm-generic/spinlock.h | 16 +++++++++-------
> >   1 file changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
> > index fdfebcb050f4..90803a826ba0 100644
> > --- a/include/asm-generic/spinlock.h
> > +++ b/include/asm-generic/spinlock.h
> > @@ -68,11 +68,18 @@ static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
> >   	smp_store_release(ptr, (u16)val + 1);
> >   }
> > +static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> > +{
> > +	u32 val = lock.counter;
> > +
> > +	return ((val >> 16) == (val & 0xffff));
> > +}
> > +
> >   static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
> >   {
> > -	u32 val = atomic_read(lock);
> > +	arch_spinlock_t val = READ_ONCE(*lock);
> > -	return ((val >> 16) != (val & 0xffff));
> > +	return !arch_spin_value_unlocked(val);
> >   }
> >   static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> > @@ -82,11 +89,6 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
> >   	return (s16)((val >> 16) - (val & 0xffff)) > 1;
> >   }
> > -static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
> > -{
> > -	return !arch_spin_is_locked(&lock);
> > -}
> > -
> >   #include <asm/qrwlock.h>
> >   #endif /* __ASM_GENERIC_SPINLOCK_H */
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
