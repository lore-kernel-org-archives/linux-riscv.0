Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111EBC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 15:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UiW2Cj4xsmQRBGIVPeLNY9BNUyv+nHkLgj4QQjcJCZY=; b=pGqHdNw2CFrWAk4MU0tuzqeOuq
	4R2SF4zM9vs+rxr/tfqvgv3NsxzQCFdZO/uJOg5nN7RhhVV5FKw+NGz+HOacM7Y/ZJxtyO6P5pJiJ
	wmdYUeI8Tr/29IJ0/wChkOWHPuKI2r1yefEHoRyKaQtW13/GuIS7ULAPDC2UO19YPuF54WTFaopS2
	mwoB7+y+cbte5piuZo/YOsOb3oOYDjL8lWf9jqgyH6zQ5hhP+SwCuo5XHsPlrgn/RAzQYy3Pe/GxX
	7q1FAITd3ykIpkSyXLVaFRdl34PYTxFkSudjusF4Xm319KFCzkZPS/5ZHJaX2KH42gVuv9PfuVXcR
	JYi8vwOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZv5z-00000009q68-0BGf;
	Tue, 13 Feb 2024 15:53:19 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZv5v-00000009q3i-2sQI
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 15:53:17 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7BE943F18F
	for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 15:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1707839592;
	bh=q5WAT9xlsrwi7nU49VclyEz1XabNb44H4w1xGoGEwPc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=SeXgpPJSTS6ALCD6UgkKT5pXqwKZ3e37YNF3YMHCYS76qRmLU/A0M/F2eH/XSxDiX
	 nYq7HqlXPTRPC+O2zbRfdkl57FhLwr3kVppeQkMEpB3/saA5mAchLjHlIhI+0BZbmw
	 p8c/zuHHnckdQXZGtJzQ7OLBLrZMf526vX5jOWFGSHXa2PVCFuacJERqVWylqKga0D
	 1DRzM0LDDIPpqyiSjGBXgCikddNAoL+PYiOTbQLV6ny/Dgp4xYi0y40vFP57uRy3IH
	 As4aFZGteKNxfSL08E2QqR343ICTiF3i1Hztjlobo83Ype91sGScS2FolqHYklIfH9
	 CiFQ3hTdl/9UA==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-42c95f8376dso18617961cf.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 07:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707839591; x=1708444391;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q5WAT9xlsrwi7nU49VclyEz1XabNb44H4w1xGoGEwPc=;
        b=e8ThXFN9/ogK8RhuI2SnTjKbjgUk/4B4fwPl9eSOIyEsSVbRe0Nv29Ct12sxAyXMoQ
         ABGp1lXJJ11HCfHgqOBUGO9c1MSee9lLpDik9i9Bgzut1UVKmxolbyikJsMfDJNd2ks/
         gbFZigvG4QuqCHgC6yRDEzFHB8RwunuJ2mR6pnSQOdCEMg2xLixSJvpPozpXCkn90m9E
         SubZrsxitDBZBXheulmGkTmOjsRyHODM/Oo2o+B4YWwQwYq4mqe4+vhK0HmsK0oK/Qri
         rL4Mm1QKnozoo0VyCBiM0b5e0REsh2xYrM0GeHqY7MHMU8i5eFw+4VDvqDD/sMO3Jchi
         z5ag==
X-Gm-Message-State: AOJu0Yw5uPgerl41yrchTT0r8eeCZgwYbRoIVIGqauJuJeLPnaEsgUMk
	Xr1TKzJs2egpkQ+sdkivKvhNGaDyRR2KUDKl27EmjYDErnX0dQPdY0kpw03M4dqYHii1/B/aNjh
	FsrknCzfSdLRotKUoqU1PGG8KXJo89TbnDSmxYtTrXdXulXkm8aZtYgEWAMhkBGIV829G1f7JGV
	VTl4izqcoYUvtk1gKAbVlRBLxz4yRSe253KSZEZylubYSzQYWOt4t3CBh+
X-Received: by 2002:a05:622a:10b:b0:42d:b08a:989a with SMTP id u11-20020a05622a010b00b0042db08a989amr1485775qtw.12.1707839591452;
        Tue, 13 Feb 2024 07:53:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeTEwmPdBmetgPyADcrTQz1p1Sm+PlqQJKgFlYISYShQDJYai6tEyxiizFvBKTYZWmTi1/3o6xjC8oXx9AJW0=
X-Received: by 2002:a05:622a:10b:b0:42d:b08a:989a with SMTP id
 u11-20020a05622a010b00b0042db08a989amr1485761qtw.12.1707839591207; Tue, 13
 Feb 2024 07:53:11 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Feb 2024 07:53:10 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240213143105.2418044-1-ericchancf@google.com>
References: <20240213142632.2415127-1-ericchancf@google.com> <20240213143105.2418044-1-ericchancf@google.com>
Mime-Version: 1.0
Date: Tue, 13 Feb 2024 07:53:10 -0800
Message-ID: <CAJM55Z9MOoZ3A=h4uFaO2hD461U3BMDyWxXLBt0tUdOuJJ5t+g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] riscv/barrier: Resolve checkpath.pl error
To: Eric Chan <ericchancf@google.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_075315_972585_76B4DE33 
X-CRM114-Status: GOOD (  23.79  )
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

Eric Chan wrote:
> The original form would cause checkpath.pl to issue a error.
> The error message is as follows:
> ERROR: space required after that ',' (ctx:VxV)
> +#define __atomic_acquire_fence()       RISCV_FENCE(r,rw)
>                                                      ^
> correct the form of RISCV_FENCE and RISCV_FENCE_ASM even if they
> already exist.

A lot of the changes in this patch fixes lines that was added in the previous
patches. I'd prefer to add new code correctly and then only fix the remaining
instances in this patch.

/Emil

>
> Signed-off-by: Eric Chan <ericchancf@google.com>
> ---
>  arch/riscv/include/asm/atomic.h  |  4 ++--
>  arch/riscv/include/asm/barrier.h | 18 +++++++++---------
>  arch/riscv/include/asm/fence.h   |  6 +++---
>  arch/riscv/include/asm/io.h      |  8 ++++----
>  arch/riscv/include/asm/mmio.h    |  4 ++--
>  arch/riscv/include/asm/mmiowb.h  |  2 +-
>  6 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> index 1b2ae3259f1d..19050d13b6c1 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -18,8 +18,8 @@
>
>  #include <asm/cmpxchg.h>
>
> -#define __atomic_acquire_fence()	RISCV_FENCE(r,rw)
> -#define __atomic_release_fence()	RISCV_FENCE(rw,r)
> +#define __atomic_acquire_fence()	RISCV_FENCE(r, rw)
> +#define __atomic_release_fence()	RISCV_FENCE(rw, r)
>
>  static __always_inline int arch_atomic_read(const atomic_t *v)
>  {
> diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/barrier.h
> index 4f4743d7440d..880b56d8480d 100644
> --- a/arch/riscv/include/asm/barrier.h
> +++ b/arch/riscv/include/asm/barrier.h
> @@ -19,19 +19,19 @@
>
>
>  /* These barriers need to enforce ordering on both devices or memory. */
> -#define __mb()		RISCV_FENCE(iorw,iorw)
> -#define __rmb()		RISCV_FENCE(ir,ir)
> -#define __wmb()		RISCV_FENCE(ow,ow)
> +#define __mb()		RISCV_FENCE(iorw, iorw)
> +#define __rmb()		RISCV_FENCE(ir, ir)
> +#define __wmb()		RISCV_FENCE(ow, ow)
>
>  /* These barriers do not need to enforce ordering on devices, just memory. */
> -#define __smp_mb()	RISCV_FENCE(rw,rw)
> -#define __smp_rmb()	RISCV_FENCE(r,r)
> -#define __smp_wmb()	RISCV_FENCE(w,w)
> +#define __smp_mb()	RISCV_FENCE(rw, rw)
> +#define __smp_rmb()	RISCV_FENCE(r, r)
> +#define __smp_wmb()	RISCV_FENCE(w, w)
>
>  #define __smp_store_release(p, v)					\
>  do {									\
>  	compiletime_assert_atomic_type(*p);				\
> -	RISCV_FENCE(rw,w);						\
> +	RISCV_FENCE(rw, w);						\
>  	WRITE_ONCE(*p, v);						\
>  } while (0)
>
> @@ -39,7 +39,7 @@ do {									\
>  ({									\
>  	typeof(*p) ___p1 = READ_ONCE(*p);				\
>  	compiletime_assert_atomic_type(*p);				\
> -	RISCV_FENCE(r,rw);						\
> +	RISCV_FENCE(r, rw);						\
>  	___p1;								\
>  })
>
> @@ -68,7 +68,7 @@ do {									\
>   * instances the scheduler pairs this with an mb(), so nothing is necessary on
>   * the new hart.
>   */
> -#define smp_mb__after_spinlock()	RISCV_FENCE(iorw,iorw)
> +#define smp_mb__after_spinlock()	RISCV_FENCE(iorw, iorw)
>
>  #include <asm-generic/barrier.h>
>
> diff --git a/arch/riscv/include/asm/fence.h b/arch/riscv/include/asm/fence.h
> index ca094d72ec20..5b46f96a3ec8 100644
> --- a/arch/riscv/include/asm/fence.h
> +++ b/arch/riscv/include/asm/fence.h
> @@ -6,9 +6,9 @@
>  	({ __asm__ __volatile__ (RISCV_FENCE_ASM(p, s) : : : "memory"); })
>
>  #ifdef CONFIG_SMP
> -#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r,rw)
> -#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw,r)
> -#define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw,rw)
> +#define RISCV_ACQUIRE_BARRIER		RISCV_FENCE_ASM(r, rw)
> +#define RISCV_RELEASE_BARRIER		RISCV_FENCE_ASM(rw, r)
> +#define RISCV_FULL_BARRIER		RISCV_FENCE_ASM(rw, rw)
>  #else
>  #define RISCV_ACQUIRE_BARRIER
>  #define RISCV_RELEASE_BARRIER
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index afb5ead7552e..1c5c641075d2 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -47,10 +47,10 @@
>   * sufficient to ensure this works sanely on controllers that support I/O
>   * writes.
>   */
> -#define __io_pbr()	RISCV_FENCE(io,i)
> -#define __io_par(v)	RISCV_FENCE(i,ior)
> -#define __io_pbw()	RISCV_FENCE(iow,o)
> -#define __io_paw()	RISCV_FENCE(o,io)
> +#define __io_pbr()	RISCV_FENCE(io, i)
> +#define __io_par(v)	RISCV_FENCE(i, ior)
> +#define __io_pbw()	RISCV_FENCE(iow, o)
> +#define __io_paw()	RISCV_FENCE(o, io)
>
>  /*
>   * Accesses from a single hart to a single I/O address must be ordered.  This
> diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
> index a708968d4a0f..06cadfd7a237 100644
> --- a/arch/riscv/include/asm/mmio.h
> +++ b/arch/riscv/include/asm/mmio.h
> @@ -132,8 +132,8 @@ static inline u64 __raw_readq(const volatile void __iomem *addr)
>   * doesn't define any ordering between the memory space and the I/O space.
>   */
>  #define __io_br()	do {} while (0)
> -#define __io_ar(v)	RISCV_FENCE(i,ir)
> -#define __io_bw()	RISCV_FENCE(w,o)
> +#define __io_ar(v)	RISCV_FENCE(i, ir)
> +#define __io_bw()	RISCV_FENCE(w, o)
>  #define __io_aw()	mmiowb_set_pending()
>
>  #define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
> diff --git a/arch/riscv/include/asm/mmiowb.h b/arch/riscv/include/asm/mmiowb.h
> index 3bcae97d4803..52ce4a399d9b 100644
> --- a/arch/riscv/include/asm/mmiowb.h
> +++ b/arch/riscv/include/asm/mmiowb.h
> @@ -7,7 +7,7 @@
>   * "o,w" is sufficient to ensure that all writes to the device have completed
>   * before the write to the spinlock is allowed to commit.
>   */
> -#define mmiowb()	RISCV_FENCE(o,w)
> +#define mmiowb()	RISCV_FENCE(o, w)
>
>  #include <linux/smp.h>
>  #include <asm-generic/mmiowb.h>
> --
> 2.43.0.687.g38aa6559b0-goog
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
