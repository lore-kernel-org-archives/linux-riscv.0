Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48A6E77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 03:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5sRBT2dh0cKM3PKfeqEBcWnPIfjVGY/HRKhrTGkF6rQ=; b=RqgUK32nwUails
	tNfrzTgoFXxtElCdyuiQyaGspNSSrN4cajoyjy02Fwj5o6ydh+fI425t/SeCDoFmErrrFs7CLoOpN
	7qRXUXEB9rk11BsM+NbmcT+Ck5hOKbAXWkBtEHKIFYPcDj11RUjrtCOU/X+19FaI0t3lpeIg770ug
	LExGAs+sm09zX+tWUhpYpFItpBCZWcvWZTAaAEAoM69fhsZxhYhBZr2qbRx3ozAareLp24XYxUX8F
	JrX+pPJZKZ7swv5mzv/7kJ4XuxEf6yCtzwjB3Dp93v+Fon9+s1J3blE70+87AxXbBYynbL7glV+dj
	FPm6f99uyKSAaLktwAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW5cK-0000000Du8R-2AGO;
	Fri, 10 Jan 2025 03:23:24 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW5cH-0000000Du7j-3OYt
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 03:23:23 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ef72924e53so2689421a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 Jan 2025 19:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736479401; x=1737084201; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=clQhZ1TDp43t4ggMp7zDgEwaoq0E6UaHXrDqB5DGoyw=;
        b=LPj1Gsl64uU8VaMWiDtihs5AVcnN1UlaJwqowb+7VZZjHDmSwI7vDMvWfw++dtprDt
         WE57/cLMT65FNsaZhczFh4dTmeTWkZWfOClwdMGjQlSH7rhVpaw1CmNyQJvLRwtD/Xzz
         pW+Noyt7fv+BDEEEbMDolGDFTUy5Tx+LeJCKjrhB4zDPColSIfVMazWRp/Lt2DawSSzU
         1YZ/WZAq8FoE5O4PfIGgqCrK3VhunHOYhmrPY6h40e2GRYkpBaBS4OqrDFwGN73RyWEJ
         Z9Hxbtaje1y3JXMsDE5hY0J72vzMKOPIH/nFQMWe1cUwg2dQT5vSL0pnDQ8RjFRt3FVI
         PGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736479401; x=1737084201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=clQhZ1TDp43t4ggMp7zDgEwaoq0E6UaHXrDqB5DGoyw=;
        b=OmuFNt1/aILgSvEB7KRArIpfk5ibecMeSAoh6fwjhjX0Vm5Qlf0b7DoObRL7QgZZ9r
         1uZLPMfrVPgjJ6w2kUsVFw3H++VELx/5PJZNcYM59VHK8maUcnke4z0id8u85UR5og3q
         3u524+IrEPk+wmqebTQwOXg2lf+zSTRvEeYJJ6SVcyrn/iKc4XHjeCORdprFvvCQ8l9e
         4z7rvPH8UtPsIGaUEHod3+EvLP0cMYGCZa1Kq5fUg0WvUL4noHWWwAfAHZA1ncRAvLEG
         y1bjOsosie08w6MVAq57MKeB0UuM2DZTgoqrCn1sjfor/DP7RSgCBJFY1LzkilRAlf8a
         mwCQ==
X-Gm-Message-State: AOJu0YxmRxQNp1kGs2+P92KYZ3y98ikAXjT1gipCyCtNtYTi2lyn5qEG
	ZCeVEYjqROzXi0Zr/vhuqZTz4akeWfPA/WKlJbDd0L7z2aG7Iyq8bSFzqI5PaVA=
X-Gm-Gg: ASbGncv2U/SHkv03o4w+o/l9q9REghJMQZ4d5r2i6xifwz5IbNonyh5M/3r929y4HIf
	7TVUshzVa8j7ChXKXxH3EiQjcIeYtLFwBFkSbr3IfC8a3YRswIyvVMDnthnCXn6ryhE2E9OcGBI
	kSS6tEy3y2Bj9t0siqAK/LgTjU5ZQoK++l3EfefpltNYC7CZ1SvhAniD2lZm+mvcVhYxgqb3JN2
	Fq12CdnPUCJnmx3TuqE0yyGKS4rWegZzxHGTVDHVjlP7XCDpcvC
X-Google-Smtp-Source: AGHT+IHFZVD/6qMyskck0l2KvmNWtKKRRDUxLDz82nwTm095rEwhROcdj+1UcFdrr3MUrReOjamdvw==
X-Received: by 2002:a17:90b:5241:b0:2ee:edae:75e with SMTP id 98e67ed59e1d1-2f548eb325cmr13130170a91.13.1736479400809;
        Thu, 09 Jan 2025 19:23:20 -0800 (PST)
Received: from ghost ([2601:647:6700:64d0:691c:638a:ff10:3765])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a369e30sm4814462a91.45.2025.01.09.19.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 19:23:20 -0800 (PST)
Date: Thu, 9 Jan 2025 19:23:16 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Aleksandar Rikalo <arikalo@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrea Parri <parri.andrea@gmail.com>,
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Eric Chan <ericchancf@google.com>, linux-kernel@vger.kernel.org,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>
Subject: Re: [PATCH v2] riscv: Use Zalrsc extension to implement atomic
 functions
Message-ID: <Z4CSpE9UKkJNM_g5@ghost>
References: <20241225082412.36727-1-arikalo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241225082412.36727-1-arikalo@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_192321_863309_12EFA139 
X-CRM114-Status: GOOD (  32.40  )
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

On Wed, Dec 25, 2024 at 09:24:12AM +0100, Aleksandar Rikalo wrote:
> From: Chao-ying Fu <cfu@mips.com>
> 
> Use only LR/SC instructions to implement atomic functions.

In the previous patch you mention that this is to support MIPS P8700. Can
you expand on why this change is required? The datasheet at [1] says:

"The P8700 core is configured to support the RV64GCZba_Zbb (G = IMAFD)
Standard ISA. It includes the RV64I base ISA, Multiply (M), Atomic (A),
Single-Precision Floating Point (F), Double (D), Compressed (C) RISC-V
extensions, as well as the as well as the bit-manipulation extensions
(Zba) and (Zbb)"

The "A" extension is a part of "G" which is mostly assumed to exist in
the kernel. Additionally, having this be a compilation flag will cause
traps on generic kernels. We generally try to push everything we can
into runtime feature detection since there are so many possible variants
of riscv.

Expressing not being able to perform a feature like this is normally
better expressed as an errata. Then generic kernels will be able to
include this, and anybody who doesn't want to have the extra nops
introduced can disable the errata. A similar approach to what I pointed
out last time should work here too (but with more places to replace)
[2].

[1] https://mips.com/wp-content/uploads/2024/11/P8700_Data_Sheet.pdf
[2] https://lore.kernel.org/lkml/Z2-UNfwcAQYZqVBU@ghost/T/

> 
> Add config RISCV_AMO_USE_ZALRSC.
> 
> Signed-off-by: Chao-ying Fu <cfu@mips.com>
> Signed-off-by: Aleksandar Rikalo <arikalo@gmail.com>
> ---
>  arch/riscv/Kconfig               | 11 +++++++
>  arch/riscv/include/asm/atomic.h  | 52 +++++++++++++++++++++++++++++++-
>  arch/riscv/include/asm/bitops.h  | 45 +++++++++++++++++++++++++++
>  arch/riscv/include/asm/cmpxchg.h | 16 ++++++++++
>  arch/riscv/include/asm/futex.h   | 46 ++++++++++++++++++++++++++++
>  5 files changed, 169 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index cc63aef41e94..9fb020b49408 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -715,6 +715,17 @@ config RISCV_ISA_ZACAS
>  
>  	  If you don't know what to do here, say Y.
>  
> +config RISCV_AMO_USE_ZALRSC
> +	bool "Use Zalrsc extension to implement atomic functions"
> +	help
> +	   Kernel uses only LR/SC instructions to implement atomic functions.
> +
> +	   It makes sense to enable this option if your platform only
> +	   implements the Zalrsc extension (a subset of the A extension),
> +	   and not the complete A extension.
> +
> +	   If you don't know what to do here, say N.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> index 5b96c2f61adb..88f62e33a545 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -50,6 +50,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
>   * have the AQ or RL bits set.  These don't return anything, so there's only
>   * one version to worry about.
>   */
> +#ifndef RISCV_AMO_USE_ZALRSC
>  #define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
>  static __always_inline							\
>  void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
> @@ -59,7 +60,23 @@ void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
>  		: "+A" (v->counter)					\
>  		: "r" (I)						\
>  		: "memory");						\
> -}									\
> +}
> +#else
> +#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
> +static __always_inline							\
> +void arch_atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)	\
> +{									\
> +	register c_type ret, temp;					\
> +	__asm__ __volatile__ (						\
> +		"1:	lr." #asm_type " %1, %0\n"			\
> +		"	" #asm_op " %2, %1, %3\n"			\
> +		"	sc." #asm_type " %2, %2, %0\n"			\
> +		"	bnez %2, 1b\n"					\
> +		: "+A" (v->counter), "=&r" (ret), "=&r" (temp)		\
> +		: "r" (I)						\
> +		: "memory");						\
> +}
> +#endif
>  
>  #ifdef CONFIG_GENERIC_ATOMIC64
>  #define ATOMIC_OPS(op, asm_op, I)					\
> @@ -84,6 +101,7 @@ ATOMIC_OPS(xor, xor,  i)
>   * There's two flavors of these: the arithmatic ops have both fetch and return
>   * versions, while the logical ops only have fetch versions.
>   */
> +#ifndef RISCV_AMO_USE_ZALRSC
>  #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
>  static __always_inline							\
>  c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
> @@ -108,6 +126,38 @@ c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
>  		: "memory");						\
>  	return ret;							\
>  }
> +#else
> +#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
> +static __always_inline							\
> +c_type arch_atomic##prefix##_fetch_##op##_relaxed(c_type i,		\
> +					     atomic##prefix##_t *v)	\
> +{									\
> +	register c_type ret, temp;					\
> +	__asm__ __volatile__ (						\
> +		"1:	lr." #asm_type " %1, %0\n"			\
> +		"	" #asm_op " %2, %1, %3\n"			\
> +		"	sc." #asm_type " %2, %2, %0\n"			\
> +		"	bnez %2, 1b\n"					\
> +		: "+A" (v->counter), "=&r" (ret), "=&r" (temp)		\
> +		: "r" (I)						\
> +		: "memory");						\
> +	return ret;							\
> +}									\
> +static __always_inline							\
> +c_type arch_atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
> +{									\
> +	register c_type ret, temp;					\
> +	__asm__ __volatile__ (						\
> +		"1:	lr." #asm_type ".aqrl %1, %0\n"			\
> +		"	" #asm_op " %2, %1, %3\n"			\
> +		"	sc." #asm_type ".aqrl %2, %2, %0\n"		\
> +		"	bnez %2, 1b\n"					\
> +		: "+A" (v->counter), "=&r" (ret), "=&r" (temp)		\
> +		: "r" (I)						\
> +		: "memory");						\
> +	return ret;							\
> +}
> +#endif
>  
>  #define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix)	\
>  static __always_inline							\
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index fae152ea0508..0051de1cf471 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -187,12 +187,17 @@ static __always_inline int variable_fls(unsigned int x)
>  
>  #if (BITS_PER_LONG == 64)
>  #define __AMO(op)	"amo" #op ".d"
> +#define __LR	"lr.d"
> +#define __SC	"sc.d"
>  #elif (BITS_PER_LONG == 32)
>  #define __AMO(op)	"amo" #op ".w"
> +#define __LR	"lr.w"
> +#define __SC	"sc.w"
>  #else
>  #error "Unexpected BITS_PER_LONG"
>  #endif
>  
> +#ifndef RISCV_AMO_USE_ZALRSC
>  #define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
>  ({								\
>  	unsigned long __res, __mask;				\
> @@ -211,6 +216,33 @@ static __always_inline int variable_fls(unsigned int x)
>  		: "+A" (addr[BIT_WORD(nr)])			\
>  		: "r" (mod(BIT_MASK(nr)))			\
>  		: "memory");
> +#else
> +#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
> +({								\
> +	unsigned long __res, __mask, __temp;			\
> +	__mask = BIT_MASK(nr);					\
> +	__asm__ __volatile__ (					\
> +		"1: " __LR #ord " %0, %1\n"			\
> +		#op " %2, %0, %3\n"				\
> +		__SC #ord " %2, %2, %1\n"			\
> +		"bnez %2, 1b\n"					\
> +		: "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)	\
> +		: "r" (mod(__mask))				\
> +		: "memory");					\
> +	((__res & __mask) != 0);				\
> +})
> +
> +#define __op_bit_ord(op, mod, nr, addr, ord)			\
> +	unsigned long __res, __temp;				\
> +	__asm__ __volatile__ (					\
> +		"1: " __LR #ord " %0, %1\n"			\
> +		#op " %2, %0, %3\n"				\
> +		__SC #ord " %2, %2, %1\n"			\
> +		"bnez %2, 1b\n"					\
> +		: "=&r" (__res), "+A" (addr[BIT_WORD(nr)]), "=&r" (__temp)	\
> +		: "r" (mod(BIT_MASK(nr)))			\
> +		: "memory")
> +#endif
>  
>  #define __test_and_op_bit(op, mod, nr, addr) 			\
>  	__test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
> @@ -354,12 +386,25 @@ static inline void arch___clear_bit_unlock(
>  static inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
>  		volatile unsigned long *addr)
>  {
> +#ifndef RISCV_AMO_USE_ZALRSC
>  	unsigned long res;
>  	__asm__ __volatile__ (
>  		__AMO(xor) ".rl %0, %2, %1"
>  		: "=r" (res), "+A" (*addr)
>  		: "r" (__NOP(mask))
>  		: "memory");
> +#else
> +	unsigned long res, temp;
> +
> +	__asm__ __volatile__ (
> +		"1: " __LR ".rl %0, %1\n"
> +		"xor %2, %0, %3\n"
> +		__SC ".rl %2, %2, %1\n"
> +		"bnez %2, 1b\n"
> +		: "=&r" (res), "+A" (*addr), "=&r" (temp)
> +		: "r" (__NOP(mask))
> +		: "memory");
> +#endif
>  	return (res & BIT(7)) != 0;
>  }
>  
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..aba60f427060 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -51,6 +51,7 @@
>  	}									\
>  })
>  
> +#ifndef RISCV_AMO_USE_ZALRSC
>  #define __arch_xchg(sfx, prepend, append, r, p, n)			\
>  ({									\
>  	__asm__ __volatile__ (						\
> @@ -61,6 +62,21 @@
>  		: "r" (n)						\
>  		: "memory");						\
>  })
> +#else
> +#define __arch_xchg(sfx, prepend, append, r, p, n)			\
> +({									\
> +	__typeof__(*(__ptr)) temp;					\
> +	__asm__ __volatile__ (						\
> +		prepend							\
> +		"1:	lr" sfx " %0, %1\n"				\
> +		"	sc" sfx " %2, %3, %1\n"				\
> +		"	bnez %2, 1b\n"					\
> +		append							\
> +		: "=&r" (r), "+A" (*(p)), "=&r" (temp)			\
> +		: "r" (n)						\
> +		: "memory");						\
> +})
> +#endif
>  
>  #define _arch_xchg(ptr, new, sc_sfx, swap_sfx, prepend,			\
>  		   sc_append, swap_append)				\
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index fc8130f995c1..dc63065e707e 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -19,6 +19,7 @@
>  #define __disable_user_access()		do { } while (0)
>  #endif
>  
> +#ifndef RISCV_AMO_USE_ZALRSC
>  #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
>  {								\
>  	__enable_user_access();					\
> @@ -32,16 +33,39 @@
>  	: "memory");						\
>  	__disable_user_access();				\
>  }
> +#else
> +#define __futex_atomic_op(insn, ret, oldval, uaddr, oparg)	\
> +{								\
> +	__enable_user_access();					\
> +	__asm__ __volatile__ (					\
> +	"1:	lr.w.aqrl %[ov], %[u]\n"			\
> +	"	" insn "\n"					\
> +	"	sc.w.aqrl %[t], %[t], %[u]\n"			\
> +	"	bnez %[t], 1b\n"				\
> +	"2:\n"							\
> +	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %[r])			\
> +	: [r] "+r" (ret), [ov] "=&r" (oldval),			\
> +	  [t] "=&r" (temp), [u] "+m" (*uaddr)			\
> +	: [op] "Jr" (oparg)					\
> +	: "memory");						\
> +	__disable_user_access();				\
> +}
> +#endif
>  
>  static inline int
>  arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>  {
> +#ifndef RISCV_AMO_USE_ZALRSC
>  	int oldval = 0, ret = 0;
> +#else
> +	int oldval = 0, ret = 0, temp = 0;

I think it's better to define this temp variable inside of
__futex_atomic_op() instead of requiring it to be defined in the scope
where the macro is called.

- Charlie

> +#endif
>  
>  	if (!access_ok(uaddr, sizeof(u32)))
>  		return -EFAULT;
>  
>  	switch (op) {
> +#ifndef RISCV_AMO_USE_ZALRSC
>  	case FUTEX_OP_SET:
>  		__futex_atomic_op("amoswap.w.aqrl %[ov],%z[op],%[u]",
>  				  ret, oldval, uaddr, oparg);
> @@ -62,6 +86,28 @@ arch_futex_atomic_op_inuser(int op, int oparg, int *oval, u32 __user *uaddr)
>  		__futex_atomic_op("amoxor.w.aqrl %[ov],%z[op],%[u]",
>  				  ret, oldval, uaddr, oparg);
>  		break;
> +#else
> +	case FUTEX_OP_SET:
> +		__futex_atomic_op("mv %[t], %z[op]",
> +				  ret, oldval, uaddr, oparg);
> +		break;
> +	case FUTEX_OP_ADD:
> +		__futex_atomic_op("add %[t], %[ov], %z[op]",
> +				  ret, oldval, uaddr, oparg);
> +		break;
> +	case FUTEX_OP_OR:
> +		__futex_atomic_op("or %[t], %[ov], %z[op]",
> +				  ret, oldval, uaddr, oparg);
> +		break;
> +	case FUTEX_OP_ANDN:
> +		__futex_atomic_op("and %[t], %[ov], %z[op]",
> +				  ret, oldval, uaddr, ~oparg);
> +		break;
> +	case FUTEX_OP_XOR:
> +		__futex_atomic_op("xor %[t], %[ov], %z[op]",
> +				  ret, oldval, uaddr, oparg);
> +		break;
> +#endif
>  	default:
>  		ret = -ENOSYS;
>  	}
> -- 
> 2.25.1
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
