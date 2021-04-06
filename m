Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4573CC433B4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 16:53:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2277613D3
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 16:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2277613D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/WzRZ4vq2iuWXFuuSsvhOQjYFTmXdKDQn0sYYBV7Ykw=; b=Es27rvYixvx8E8hGZ8UAq4Cyh
	sd73bogAV8//7+v0chB3zp+MuSAnELfi4QfsQAG6sARvhwouTaiFt+d8Ljqi26QoGkFRro7NwnUg/
	wP0QCujtlAl/2xr45dWITeQYYrx2ES5cvxeW3Ss+qqLKRbf364I1idCZDdhCFGnh26dp2D+sZt/Iu
	mdVge3pDHZGIJfZddm0p1e0EWYmpoFPj/tuc1o0pop5fdVjAZ8Rlb8BLUiWCQC7d4QWFzo64Tgnq2
	DUubzpHbTSxFuMPqU4YKlEopeSBquFjl50Pmrgly+J2Qw4rJNFd2sluRnR2QHNFxZR8qFBa8rio2L
	utJz5Pgow==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTox5-0032ow-Kr; Tue, 06 Apr 2021 16:53:19 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTox0-0032mz-3H
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 16:53:16 +0000
Received: by mail-qt1-x833.google.com with SMTP id y2so11643385qtw.13
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 09:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1O6341K+omlIB9wJ2hXLKkbsOLGoNgyMzo2Q8jp14ns=;
 b=FbSNaujCj4GQzt69czEYT9yzhdS82ILA0XySjA6WjU4aT1lYaj3SHxv1vX2vdur6FA
 YTPONs9m8qYw+wIijaGHll5+ej9HxKg+KQFlasntXZAtvkkwMbwniIgts8YWN+JrAH8w
 t36s62MjwnpWse52CNM+le4w4F/04vOQA3nJDDv342SOv74Z/0cWBHZ/gdXD8UNv9bpp
 BXz5kIUkEtqWteih/Slzdl0lXYk3whfXldJhCGinRXTLZRQW7X8u9XyIrFGgg8ywjhjL
 /t5bDygYdKZ/ZR3zXYOZevX0iznuq6YpLkE3K4148KcvXxeVyj5tP0mDaxzX/P41zFxB
 PxwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1O6341K+omlIB9wJ2hXLKkbsOLGoNgyMzo2Q8jp14ns=;
 b=UrphvUuhF+ioWjCOj53Y4oTgbH+FvHZ1YWKjc4YrwCHj6n6zakIP6I8cH/WAqv21T3
 YxwIO+M6lWY3NZxIqkdaO/Jx0YdRDrjVFqA/ShGfYqkkVONIBk50Bc96YtRHikquenuP
 QF29Xa2xcAvTd9yc2BXZNf6pRBTYG9GIXePwhSjXY1mHxle/UEN55YvNC6McM+agdZ8y
 YnOMt4mc1qIDLy7V4vznxjNHYn31MAM8HtKEArrhkJbmCIBAdNYjvuqONCALegWSOK1G
 M+MaXP6+M7Aj3OBemf9U0sgszy4oRInUC1mfElaKIDyDiowvlEVLPo/tUNR++FH8inok
 eIrA==
X-Gm-Message-State: AOAM5330zX1aP/QWNBVXgTW0/hIMC4Co1+zxP9lyHIpDxMQJpqDBZFwX
 TOcfLyqGq8aicg7mKGfsZYA=
X-Google-Smtp-Source: ABdhPJyW4+S5F6l2W1agZlUj1gpYEr0Uf+t0W/YgCPZTn1gKNE1/+tdskKTlKeUZn69qOWB+q27VRQ==
X-Received: by 2002:ac8:48c9:: with SMTP id l9mr27015485qtr.45.1617727991808; 
 Tue, 06 Apr 2021 09:53:11 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com.
 [66.111.4.227])
 by smtp.gmail.com with ESMTPSA id h9sm14206728qtk.6.2021.04.06.09.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 09:53:11 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailauth.nyi.internal (Postfix) with ESMTP id 7F86C27C0054;
 Tue,  6 Apr 2021 12:53:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Apr 2021 12:53:10 -0400
X-ME-Sender: <xms:9JFsYMMMB4elRpqW88wslIO0VD_ZuVTszgiLe53m6RtFpubegkKdjw>
 <xme:9JFsYE8MXi0atf2wVteuwUs_we8loq8w63R9a0MILCua2xmzVrjDONtnAkG70Nh2J
 6TEDAN_p0HEj2d89A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedgheefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhn
 ucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrth
 htvghrnhepieffvdeitdetheffuddugffggedvjeejieffheeltdeghfehueehteehleeg
 heffnecukfhppedufedurddutdejrddugeejrdduvdeinecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhh
 phgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunh
 drfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:9JFsYMq4YxOfdEdokTwtHIt8Xs3fdMVumzM05UrAuCb885zHu1qeOQ>
 <xmx:9JFsYG4f2ABAf5xcYkJq3i8ICvFbYvLRcOhmAelzMj2mqBPDUoaonQ>
 <xmx:9JFsYMMiVadePONpSxOFiYg59L0Ic8noXkJMwuZM5NpPxpf-w62L2g>
 <xmx:9pFsYLzWGz8_ImuEDqJ-UV6sD7gYKwTJ_oEj70-Phbq1gZbukxLw1hZzov7S0x96>
Received: from localhost (unknown [131.107.147.126])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0F9261080066;
 Tue,  6 Apr 2021 12:53:07 -0400 (EDT)
Date: Wed, 7 Apr 2021 00:51:56 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v6 1/9] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YGyRrBjomDCPOBUd@boqun-archlinux>
References: <1617201040-83905-1-git-send-email-guoren@kernel.org>
 <1617201040-83905-2-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617201040-83905-2-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_175314_961868_47467094 
X-CRM114-Status: GOOD (  28.49  )
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

Hi,

On Wed, Mar 31, 2021 at 02:30:32PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Some architectures don't have sub-word swap atomic instruction,
> they only have the full word's one.
> 
> The sub-word swap only improve the performance when:
> NR_CPUS < 16K
>  *  0- 7: locked byte
>  *     8: pending
>  *  9-15: not used
>  * 16-17: tail index
>  * 18-31: tail cpu (+1)
> 
> The 9-15 bits are wasted to use xchg16 in xchg_tail.
> 
> Please let architecture select xchg16/xchg32 to implement
> xchg_tail.
> 

If the architecture doesn't have sub-word swap atomic, won't it generate
the same/similar code no matter which version xchg_tail() is used? That
is even CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32=y, xchg_tail() acts
similar to an xchg16() implemented by cmpxchg(), which means we still
don't have forward progress guarantee. So this configuration doesn't
solve the problem.

I think it's OK to introduce this config and don't provide xchg16() for
risc-v. But I don't see the point of converting other architectures to
use it.

Regards,
Boqun

> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Waiman Long <longman@redhat.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Anup Patel <anup@brainfault.org>
> ---
>  kernel/Kconfig.locks       |  3 +++
>  kernel/locking/qspinlock.c | 46 +++++++++++++++++++++-----------------
>  2 files changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/kernel/Kconfig.locks b/kernel/Kconfig.locks
> index 3de8fd11873b..d02f1261f73f 100644
> --- a/kernel/Kconfig.locks
> +++ b/kernel/Kconfig.locks
> @@ -239,6 +239,9 @@ config LOCK_SPIN_ON_OWNER
>  config ARCH_USE_QUEUED_SPINLOCKS
>  	bool
>  
> +config ARCH_USE_QUEUED_SPINLOCKS_XCHG32
> +	bool
> +
>  config QUEUED_SPINLOCKS
>  	def_bool y if ARCH_USE_QUEUED_SPINLOCKS
>  	depends on SMP
> diff --git a/kernel/locking/qspinlock.c b/kernel/locking/qspinlock.c
> index cbff6ba53d56..4bfaa969bd15 100644
> --- a/kernel/locking/qspinlock.c
> +++ b/kernel/locking/qspinlock.c
> @@ -163,26 +163,6 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
>  	WRITE_ONCE(lock->locked_pending, _Q_LOCKED_VAL);
>  }
>  
> -/*
> - * xchg_tail - Put in the new queue tail code word & retrieve previous one
> - * @lock : Pointer to queued spinlock structure
> - * @tail : The new queue tail code word
> - * Return: The previous queue tail code word
> - *
> - * xchg(lock, tail), which heads an address dependency
> - *
> - * p,*,* -> n,*,* ; prev = xchg(lock, node)
> - */
> -static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> -{
> -	/*
> -	 * We can use relaxed semantics since the caller ensures that the
> -	 * MCS node is properly initialized before updating the tail.
> -	 */
> -	return (u32)xchg_relaxed(&lock->tail,
> -				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
> -}
> -
>  #else /* _Q_PENDING_BITS == 8 */
>  
>  /**
> @@ -206,6 +186,30 @@ static __always_inline void clear_pending_set_locked(struct qspinlock *lock)
>  {
>  	atomic_add(-_Q_PENDING_VAL + _Q_LOCKED_VAL, &lock->val);
>  }
> +#endif /* _Q_PENDING_BITS == 8 */
> +
> +#if _Q_PENDING_BITS == 8 && !defined(CONFIG_ARCH_USE_QUEUED_SPINLOCKS_XCHG32)
> +/*
> + * xchg_tail - Put in the new queue tail code word & retrieve previous one
> + * @lock : Pointer to queued spinlock structure
> + * @tail : The new queue tail code word
> + * Return: The previous queue tail code word
> + *
> + * xchg(lock, tail), which heads an address dependency
> + *
> + * p,*,* -> n,*,* ; prev = xchg(lock, node)
> + */
> +static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
> +{
> +	/*
> +	 * We can use relaxed semantics since the caller ensures that the
> +	 * MCS node is properly initialized before updating the tail.
> +	 */
> +	return (u32)xchg_relaxed(&lock->tail,
> +				 tail >> _Q_TAIL_OFFSET) << _Q_TAIL_OFFSET;
> +}
> +
> +#else
>  
>  /**
>   * xchg_tail - Put in the new queue tail code word & retrieve previous one
> @@ -236,7 +240,7 @@ static __always_inline u32 xchg_tail(struct qspinlock *lock, u32 tail)
>  	}
>  	return old;
>  }
> -#endif /* _Q_PENDING_BITS == 8 */
> +#endif
>  
>  /**
>   * queued_fetch_set_pending_acquire - fetch the whole lock value and set pending
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
