Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3660C56201
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 14:29:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622A020674
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 14:29:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S276eYTl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZvC48PVv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622A020674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7F9OsG4czfLeOMURTdDEUTyxdUK+KCPbTyA+tERzgec=; b=S276eYTlebHfe3FzxowpdAs4v
	Jqhzi7GiqPjDN8720/xemSa9cJ8VO5x2CJ99Ocd+6cY+M1tnEi/o6Asatd3i4MmilfqIAVZdT8Vnx
	neV4XwPF8mp7UQV/waRveqeo7JoBm+mpYW6h+68o7EcYBKGOAJ2DLjBhEvw+UGDrtavmrNt4wj22f
	WIXA6k1z18Rf78qInF4sq5+WIwy46So8qnZRas6jzoWpqFS9Qnkems9Uv+JG62frxt38cpk5H0CaO
	TpcvKy+RSCI40cgiRXmr2k1kT33Hba9ksXxtaaDn+R3x5f7vAHNfGOD6HBoVN58uoNmrzaBZYP5qQ
	HFOMyLMdw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khZJl-00013t-5x; Tue, 24 Nov 2020 14:29:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khZJg-00011c-QD
 for linux-riscv@merlin.infradead.org; Tue, 24 Nov 2020 14:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=f3fcIKxHhOodlzZ3Xl2mDhvARrazRpJYqfbYOY9E1Hg=; b=ZvC48PVvb6e9xxZKtAlWV2gAzm
 mUu/M9+HXxyILHTsrw0l7U98q4LIzPSu4BCQYvOBP/IRJj3NMaxQ9FTCQcH6x9gfutvdjx9jvbhP0
 9YYmw1Rn2zqBxQiieOHHsqcR5ELvSuKkbZwgm1mdHR6kyTL1Fyx7Gt4ttm/IzEsuy7i36bpL4XQuT
 JqJSa9CIBFixmkwA/dhx4C5KSHQzOj7BDzYdpKnY40cF2t7YS+M/rcZIWJfLTeXVPvq9x5McGf8z4
 L7ROMBXxfyfaw0IKbD3iDSHYgJ9oaoFXTkBjX6TYK2wBxw86yeyoAhOBRNUhOy0cvSH5nP0oep55D
 uUv4Z5uw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khZJd-0003ca-9P; Tue, 24 Nov 2020 14:29:09 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8F862307005;
 Tue, 24 Nov 2020 15:29:05 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 75D6620222D7E; Tue, 24 Nov 2020 15:29:05 +0100 (CET)
Date: Tue, 24 Nov 2020 15:29:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Subject: Re: [PATCH 1/5] riscv: Coding convention for xchg
Message-ID: <20201124142905.GH2414@hirez.programming.kicks-ass.net>
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1606225437-22948-1-git-send-email-guoren@kernel.org>
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
Cc: Guo Ren <guoren@linux.alibaba.com>, arnd@arndb.de, anup@brainfault.org,
 palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 01:43:53PM +0000, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> This is prepare for QUEUED_SPINLOCKS which need xchg support short
> type value.
>  - Remove unused codes (xchg32, xchg64, cmpxchg32 ...)
>  - Combine xchg_relaxed, xchg_acquire, xchg_release into one asm
>  - Make atomic.aq/rl with seperated fence acquire & release

Every time you find yourself doing multiple things, make it multiple
patches.

> @@ -242,58 +239,58 @@ static __always_inline s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u
>   * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
>   * {cmp,}xchg and the operations that return, so they need a full barrier.
>   */
> +#define ATOMIC_OP(c_t, prefix)						\
>  static __always_inline							\
>  c_t atomic##prefix##_xchg_relaxed(atomic##prefix##_t *v, c_t n)		\
>  {									\
> +	return xchg_relaxed(&(v->counter), n);				\
>  }									\
>  static __always_inline							\
>  c_t atomic##prefix##_xchg_acquire(atomic##prefix##_t *v, c_t n)		\
>  {									\
> +	return xchg_acquire(&(v->counter), n);				\
>  }									\
>  static __always_inline							\
>  c_t atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)		\
>  {									\
> +	return xchg_release(&(v->counter), n);				\
>  }									\
>  static __always_inline							\
>  c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)			\
>  {									\
> +	return xchg(&(v->counter), n);					\
>  }									\
>  static __always_inline							\
>  c_t atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,		\
>  				     c_t o, c_t n)			\
>  {									\
> +	return cmpxchg_relaxed(&(v->counter), o, n);			\
>  }									\
>  static __always_inline							\
>  c_t atomic##prefix##_cmpxchg_acquire(atomic##prefix##_t *v,		\
>  				     c_t o, c_t n)			\
>  {									\
> +	return cmpxchg_acquire(&(v->counter), o, n);			\
>  }									\
>  static __always_inline							\
>  c_t atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,		\
>  				     c_t o, c_t n)			\
>  {									\
> +	return cmpxchg_release(&(v->counter), o, n);			\
>  }									\
>  static __always_inline							\
>  c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n)	\
>  {									\
> +	return cmpxchg(&(v->counter), o, n);				\
>  }

> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 262e5bb..5609185 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -44,118 +44,31 @@
>  					    _x_, sizeof(*(ptr)));	\
>  })
>  
>  #define xchg_acquire(ptr, x)						\
>  ({									\
> +	__typeof__(*(ptr)) _x_ = (x);					\
> +	__ret = __xchg_relaxed((ptr), _x_, sizeof(*(ptr)));		\
> +	__acquire_fence();						\
>  	__ret;								\
>  })
>  
>  #define xchg_release(ptr, x)						\
>  ({									\
>  	__typeof__(*(ptr)) _x_ = (x);					\
> +	__release_fence();						\
> +	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
>  					    _x_, sizeof(*(ptr)));	\
>  })
>  
>  #define xchg(ptr, x)							\
>  ({									\
> +	__typeof__(*(ptr)) __ret;					\
>  	__typeof__(*(ptr)) _x_ = (x);					\
> +	__smp_mb();							\
> +	__ret = __xchg_relaxed((ptr), _x_, sizeof(*(ptr)));		\
> +	__smp_mb();							\
> +	__ret;								\
>  })
>  
>  /*

Why are you defining *{,_acquire,_release}() at all, doesn't
atomic-fallback.h DTRT for you?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
