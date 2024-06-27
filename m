Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5505C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 13:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTvdzizDKdt6sFVolB3ai7PaSI8jtPXR+kPJTh8dGQk=; b=g7jyVd4QYCW+nY
	qj9FLP0ufQT4ReTvr+Uj8u94JYWSp72FnVBewTE6LUJKt4UhmKUJcxBo9un3e8aKhk+fSO9GMTmN3
	HtCgs9gCwERrmmEu3eHA7pxnCGOFu1FjIvxdRSbCvqCQdI0WBDrdtUnFkUu7ecHNorNT7Pd4ratgr
	E54lhiJDUWeHo0XAqkCYsNeTaITVr9QgPCCAwQ5D4EI06k0k1mrE+nlOuCwLVjjlViF7qYG8qTDgz
	MULS/aeSR3TuARlGR17sgpUf1QvdzheaXiR25UzacB1d+miX/46lubjceDQ/Ap+rn3EhmnEDF9Vq/
	TxG8WicsXCou56zWB/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpDp-0000000ATgM-0Ilv;
	Thu, 27 Jun 2024 13:31:33 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMpDl-0000000ATfN-1k8e
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 13:31:31 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-57d05e0017aso1928023a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jun 2024 06:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719495088; x=1720099888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lP+sVvrhd6DReJOWrP3HQzV+W33wFRZLKWVuhhNnzJs=;
        b=LFyfnST5qVokspKqLeH339RJYC/DSHT3cXvDFy1CVt1aUHesWHkD4NfMHzxwPJHoDw
         ExHck55Y2vFD9gbDNZ48nzCEXjMWvLQk96bQn9ak3gINdWJv6UEjl6MNv0PRhOS2/3d1
         TujL9gHu2svh0WndumJchqAS7Zz5DCKEj5rzgJ82lVMXqs7FjKkFOMBJVXHpTfeTS1gj
         JAXMiTiay/uQCqcq0Ryr/vW2cc+S1Fi39tDBzj7WEhAB9EhVxMRI4KThYGMz3x4Y1d85
         1ry/P67WnOm3eJdqzMtP1A0IuN1NYk/dHdeZp9xkR/d+A2y/JrlihnxRnDEQgxQ/e2El
         PU5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719495088; x=1720099888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lP+sVvrhd6DReJOWrP3HQzV+W33wFRZLKWVuhhNnzJs=;
        b=MpXrCtBLGqfZw2lXxyeFwpBMoJVRtWQxEsn+6KwFiws378AYAQszAZJQF/uo+q8TeL
         WJaFKPQ/wlksUnkyYLIExVsMaEzyaYzKAqfhEXBei4+NLx4LyUURjYn4SXWpsX7/TpQc
         kPn1vmdVwIs0pn8W+VCOvvh7ThEndKp2RFO9xfTbn1G0zpxmK3oUnADR6YUwZdhp/0IX
         RMbcwSMAQVQ9lB9deMoDivbZvgcuVy+qf77AF5I6HN/rogOnEUO7moOXRT0Y0iobEWgU
         hjNw4TtfenaTLwN/qWyOLy8G8+hNy3BE33dDZhYDdaIjmnmtP2pOxDky2NqBjAggWIuu
         m0AA==
X-Forwarded-Encrypted: i=1; AJvYcCWvgDV6iOfK99RvK/kyovZMyc8HgBpBqUh0g8kmnHn2c2nZRiTEjmbVt8NITAylv76GVpsvgrkuJJOEUtistDS2NvHTUDeUFuWHjOlZ/Jry
X-Gm-Message-State: AOJu0Yyf+LQm58eMEPNUCfJkKd/nz2x9woYxZIDEnUIQj284o4ND/o/2
	5OLQXl7XR2jEJvK9/RqKTRIq1EHitzRbuXKuQJY/dr0gIXoz79Co
X-Google-Smtp-Source: AGHT+IEevBVKU5K21V3Vq/SktLrOLQKyBerQQj9QaS7MnXQfPuSD08AVh5Mvwuw5cmNmKbShIjuhSg==
X-Received: by 2002:a17:906:8a50:b0:a6f:1e88:37c1 with SMTP id a640c23a62f3a-a715f9798bemr854472266b.45.1719495086226;
        Thu, 27 Jun 2024 06:31:26 -0700 (PDT)
Received: from andrea ([217.201.220.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a729d778baesm60437266b.100.2024.06.27.06.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 06:31:25 -0700 (PDT)
Date: Thu, 27 Jun 2024 15:31:20 +0200
From: Andrea Parri <parri.andrea@gmail.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, Andrea Parri <andrea@rivosinc.com>
Subject: Re: [PATCH v2 04/10] riscv: Improve amocas.X use in cmpxchg()
Message-ID: <Zn1pqD7Aruo4XwN8@andrea>
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-5-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240626130347.520750-5-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_063129_511006_78E880A1 
X-CRM114-Status: GOOD (  18.00  )
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

On Wed, Jun 26, 2024 at 03:03:41PM +0200, Alexandre Ghiti wrote:
> cmpxchg() uses amocas.X instructions from Zacas and Zabha but still uses
> the LR/SC acquire/release semantics which require barriers.
> 
> Let's improve that by using proper amocas acquire/release semantics in
> order to avoid any of those barriers.

I can't really parse this changelog...


> Suggested-by: Andrea Parri <andrea@rivosinc.com>
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cmpxchg.h | 60 ++++++++++++++++++--------------
>  1 file changed, 33 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index b9a3fdcec919..3c65b00a0d36 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -105,7 +105,9 @@
>   * indicated by comparing RETURN with OLD.
>   */
>  
> -#define __arch_cmpxchg_masked(sc_sfx, cas_sfx, prepend, append, r, p, o, n)	\
> +#define __arch_cmpxchg_masked(sc_sfx, cas_sfx,				\
> +			      sc_prepend, sc_append,			\
> +			      r, p, o, n)				\
>  ({									\
>  	__label__ no_zacas, zabha, end;					\
>  									\
> @@ -129,7 +131,7 @@ no_zacas:;								\
>  	ulong __rc;							\
>  									\
>  	__asm__ __volatile__ (						\
> -		prepend							\
> +		sc_prepend							\
>  		"0:	lr.w %0, %2\n"					\
>  		"	and  %1, %0, %z5\n"				\
>  		"	bne  %1, %z3, 1f\n"				\
> @@ -137,7 +139,7 @@ no_zacas:;								\
>  		"	or   %1, %1, %z4\n"				\
>  		"	sc.w" sc_sfx " %1, %1, %2\n"			\
>  		"	bnez %1, 0b\n"					\
> -		append							\
> +		sc_append							\
>  		"1:\n"							\
>  		: "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
>  		: "rJ" ((long)__oldx), "rJ" (__newx),			\
> @@ -150,9 +152,7 @@ no_zacas:;								\
>  zabha:									\
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA)) {			\
>  		__asm__ __volatile__ (					\
> -			prepend						\
>  			"	amocas" cas_sfx " %0, %z2, %1\n"	\
> -			append						\
>  			: "+&r" (r), "+A" (*(p))			\
>  			: "rJ" (n)					\
>  			: "memory");					\
> @@ -160,7 +160,9 @@ zabha:									\
>  end:;									\
>  })
>  
> -#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\
> +#define __arch_cmpxchg(lr_sfx, sc_sfx, cas_sfx,				\
> +		       sc_prepend, sc_append,				\
> +		       r, p, co, o, n)					\
>  ({									\
>  	__label__ zacas, end;						\
>  	register unsigned int __rc;					\
> @@ -172,12 +174,12 @@ end:;									\
>  	}								\
>  									\
>  	__asm__ __volatile__ (						\
> -		prepend							\
> +		sc_prepend							\
>  		"0:	lr" lr_sfx " %0, %2\n"				\
>  		"	bne  %0, %z3, 1f\n"				\
> -		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
> +		"	sc" sc_sfx " %1, %z4, %2\n"			\
>  		"	bnez %1, 0b\n"					\
> -		append							\
> +		sc_append							\
>  		"1:\n"							\
>  		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
>  		: "rJ" (co o), "rJ" (n)					\
> @@ -187,9 +189,7 @@ end:;									\
>  zacas:									\
>  	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
>  		__asm__ __volatile__ (					\
> -			prepend						\
> -			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
> -			append						\
> +			"	amocas" cas_sfx " %0, %z2, %1\n"	\
>  			: "+&r" (r), "+A" (*(p))			\
>  			: "rJ" (n)					\
>  			: "memory");					\
> @@ -197,7 +197,8 @@ zacas:									\
>  end:;									\
>  })
>  
> -#define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
> +#define _arch_cmpxchg(ptr, old, new, sc_sfx, cas_sfx,			\
> +		      sc_prepend, sc_append)				\
>  ({									\
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(*(__ptr)) __old = (old);				\
> @@ -206,22 +207,24 @@ end:;									\
>  									\
>  	switch (sizeof(*__ptr)) {					\
>  	case 1:								\
> -		__arch_cmpxchg_masked(sc_sfx, ".b" sc_sfx,		\
> -					prepend, append,		\
> -					__ret, __ptr, __old, __new);    \
> +		__arch_cmpxchg_masked(sc_sfx, ".b" cas_sfx,		\
> +				      sc_prepend, sc_append,		\
> +				      __ret, __ptr, __old, __new);	\
>  		break;							\
>  	case 2:								\
> -		__arch_cmpxchg_masked(sc_sfx, ".h" sc_sfx,		\
> -					prepend, append,		\
> -					__ret, __ptr, __old, __new);	\
> +		__arch_cmpxchg_masked(sc_sfx, ".h" cas_sfx,		\
> +				      sc_prepend, sc_append,		\
> +				      __ret, __ptr, __old, __new);	\
>  		break;							\
>  	case 4:								\
> -		__arch_cmpxchg(".w", ".w" sc_sfx, prepend, append,	\
> -				__ret, __ptr, (long), __old, __new);	\
> +		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
> +			       sc_prepend, sc_append,			\
> +			       __ret, __ptr, (long), __old, __new);	\
>  		break;							\
>  	case 8:								\
> -		__arch_cmpxchg(".d", ".d" sc_sfx, prepend, append,	\
> -				__ret, __ptr, /**/, __old, __new);	\
> +		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\
> +			       sc_prepend, sc_append,			\
> +			       __ret, __ptr, /**/, __old, __new);	\
>  		break;							\
>  	default:							\
>  		BUILD_BUG();						\
> @@ -230,16 +233,19 @@ end:;									\
>  })
>  
>  #define arch_cmpxchg_relaxed(ptr, o, n)					\
> -	_arch_cmpxchg((ptr), (o), (n), "", "", "")
> +	_arch_cmpxchg((ptr), (o), (n), "", "", "", "")
>  
>  #define arch_cmpxchg_acquire(ptr, o, n)					\
> -	_arch_cmpxchg((ptr), (o), (n), "", "", RISCV_ACQUIRE_BARRIER)
> +	_arch_cmpxchg((ptr), (o), (n), "", ".aq",			\
> +		      "", RISCV_ACQUIRE_BARRIER)
>  
>  #define arch_cmpxchg_release(ptr, o, n)					\
> -	_arch_cmpxchg((ptr), (o), (n), "", RISCV_RELEASE_BARRIER, "")
> +	_arch_cmpxchg((ptr), (o), (n), "", ".rl",			\
> +		      RISCV_RELEASE_BARRIER, "")
>  
>  #define arch_cmpxchg(ptr, o, n)						\
> -	_arch_cmpxchg((ptr), (o), (n), ".rl", "", "	fence rw, rw\n")
> +	_arch_cmpxchg((ptr), (o), (n), ".rl", ".aqrl",			\
> +		      "", RISCV_FULL_BARRIER)

... but this is not what I suggested: my suggestion [1] was about (limited
to) the fully-ordered macro arch_cmpxchg().  In fact, I've recently raised
some concern about similar changes to the acquire/release macros, cf. [2].

Any particular reasons for doing this?

  Andrea

[1] https://lore.kernel.org/lkml/ZlYff9x12FICHoP0@andrea/
[2] https://lore.kernel.org/lkml/20240505123340.38495-1-puranjay@kernel.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
