Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B9DC0015E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 07:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHPeWijVNm5SmbFIC0ViQnjwwE48RO74xxI51CwOCWk=; b=xTz1k91yOyMp0l
	btf46sF6mQUCVvOBx8fuZ91JAJoc6ZxL19JZ5t5QEM3wCOJSvb/dIVHTuaBCEIObImqKc3wWwacY+
	C2kpicepx7qsKvdqwbddlvo2+sMxmnKxX9+WBs/Jn4HormHPrDpDO3uYNEhKvfcSrACm5ucvUSKr1
	TAUyzhNWD3PJ3HZNWcGyYTaI8C+IYzgVvaGeFcEzBPpIpN1THomUUHXzpxzWeSgCfGjijNw4ZIYVi
	nVhh/wiy0kWIDv77mCdBksezHCdLcQ0RQNI4tSMkAgTqujs7ESN93IgImTvUxb2l4RRK/IMkBEYeO
	sjnaYqDn7PI1UDYb2dMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSqe-006swc-1G;
	Thu, 03 Aug 2023 07:34:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSqb-006svy-0r
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 07:34:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 85EB761C2A;
	Thu,  3 Aug 2023 07:34:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8CEC433C8;
	Thu,  3 Aug 2023 07:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691048051;
	bh=M0/KnN63M+oG5LHRMhI/2AFUtVfFsD9k03JRjqSsC+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EiWKqKNEx0rlUi0TYT1DzAMNNR74ylyO4JQRIT+fYrw5aFgXzaEbhwFmWpNp/xeBA
	 ijXUQlrPLZ7udmp2wr54axnH4xbejIhvTDiX3alzUIg6lRy2G6gqAFHmQ/7E0L7XP9
	 7NfG1xBcVfPrppm3vpGvmF2xwOne2NtMKaZBfDiH+y4e+EIj3CSOt/bbmOCu7BbIrA
	 Pkoig5Bwth6iYxOoyeCaunQF9fNmkvRmQhZjUvv1q4Z0W6CrZshYCSH0LhgfhsTStf
	 d56zuQ/TzgSEtH39vsWx5w3Qj+iYRw4p4wu4p4xFH0woVTmcOTVkG92m+qPrYc8+Ia
	 IJmrjWnr4V2jQ==
Date: Thu, 3 Aug 2023 03:33:59 -0400
From: Guo Ren <guoren@kernel.org>
To: Leonardo Bras <leobras@redhat.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v2 3/3] riscv/atomic.h : Deduplicate arch_atomic.*
Message-ID: <ZMtYZ2jcgh5hePIe@gmail.com>
References: <20230803051401.710236-2-leobras@redhat.com>
 <20230803051401.710236-5-leobras@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803051401.710236-5-leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_003413_407084_33575270 
X-CRM114-Status: GOOD (  18.97  )
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

On Thu, Aug 03, 2023 at 02:14:00AM -0300, Leonardo Bras wrote:
> Some functions use mostly the same asm for 32-bit and 64-bit versions.
> 
> Make a macro that is generic enough and avoid code duplication.
> 
> (This did not cause any change in generated asm)
> 
> Signed-off-by: Leonardo Bras <leobras@redhat.com>
> ---
>  arch/riscv/include/asm/atomic.h | 164 +++++++++++++++-----------------
>  1 file changed, 76 insertions(+), 88 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
> index f5dfef6c2153..80cca7ac16fd 100644
> --- a/arch/riscv/include/asm/atomic.h
> +++ b/arch/riscv/include/asm/atomic.h
> @@ -196,22 +196,28 @@ ATOMIC_OPS(xor, xor, i)
>  #undef ATOMIC_FETCH_OP
>  #undef ATOMIC_OP_RETURN
>  
> +#define _arch_atomic_fetch_add_unless(_prev, _rc, counter, _a, _u, sfx)	\
> +({									\
> +	__asm__ __volatile__ (						\
> +		"0:	lr." sfx "     %[p],  %[c]\n"			\
> +		"	beq	       %[p],  %[u], 1f\n"		\
> +		"	add            %[rc], %[p], %[a]\n"		\
> +		"	sc." sfx ".rl  %[rc], %[rc], %[c]\n"		\
> +		"	bnez           %[rc], 0b\n"			\
> +		"	fence          rw, rw\n"			\
> +		"1:\n"							\
> +		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
> +		: [a]"r" (_a), [u]"r" (_u)				\
> +		: "memory");						\
> +})
> +
>  /* This is required to provide a full barrier on success. */
>  static __always_inline int arch_atomic_fetch_add_unless(atomic_t *v, int a, int u)
>  {
>         int prev, rc;
>  
> -	__asm__ __volatile__ (
> -		"0:	lr.w     %[p],  %[c]\n"
> -		"	beq      %[p],  %[u], 1f\n"
> -		"	add      %[rc], %[p], %[a]\n"
> -		"	sc.w.rl  %[rc], %[rc], %[c]\n"
> -		"	bnez     %[rc], 0b\n"
> -		"	fence    rw, rw\n"
> -		"1:\n"
> -		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> -		: [a]"r" (a), [u]"r" (u)
> -		: "memory");
> +	_arch_atomic_fetch_add_unless(prev, rc, v->counter, a, u, "w");
> +
>  	return prev;
>  }
>  #define arch_atomic_fetch_add_unless arch_atomic_fetch_add_unless
> @@ -222,77 +228,86 @@ static __always_inline s64 arch_atomic64_fetch_add_unless(atomic64_t *v, s64 a,
>         s64 prev;
>         long rc;
>  
> -	__asm__ __volatile__ (
> -		"0:	lr.d     %[p],  %[c]\n"
> -		"	beq      %[p],  %[u], 1f\n"
> -		"	add      %[rc], %[p], %[a]\n"
> -		"	sc.d.rl  %[rc], %[rc], %[c]\n"
> -		"	bnez     %[rc], 0b\n"
> -		"	fence    rw, rw\n"
> -		"1:\n"
> -		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> -		: [a]"r" (a), [u]"r" (u)
> -		: "memory");
> +	_arch_atomic_fetch_add_unless(prev, rc, v->counter, a, u, "d");
> +
>  	return prev;
>  }
>  #define arch_atomic64_fetch_add_unless arch_atomic64_fetch_add_unless
>  #endif
>  
> +#define _arch_atomic_inc_unless_negative(_prev, _rc, counter, sfx)	\
> +({									\
> +	__asm__ __volatile__ (						\
> +		"0:	lr." sfx "      %[p],  %[c]\n"			\
> +		"	bltz            %[p],  1f\n"			\
> +		"	addi            %[rc], %[p], 1\n"		\
> +		"	sc." sfx ".rl   %[rc], %[rc], %[c]\n"		\
> +		"	bnez            %[rc], 0b\n"			\
> +		"	fence           rw, rw\n"			\
> +		"1:\n"							\
> +		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
> +		:							\
> +		: "memory");						\
> +})
> +
>  static __always_inline bool arch_atomic_inc_unless_negative(atomic_t *v)
>  {
>  	int prev, rc;
>  
> -	__asm__ __volatile__ (
> -		"0:	lr.w      %[p],  %[c]\n"
> -		"	bltz      %[p],  1f\n"
> -		"	addi      %[rc], %[p], 1\n"
> -		"	sc.w.rl   %[rc], %[rc], %[c]\n"
> -		"	bnez      %[rc], 0b\n"
> -		"	fence     rw, rw\n"
> -		"1:\n"
> -		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> -		:
> -		: "memory");
> +	_arch_atomic_inc_unless_negative(prev, rc, v->counter, "w");
> +
>  	return !(prev < 0);
>  }
>  
>  #define arch_atomic_inc_unless_negative arch_atomic_inc_unless_negative
>  
> +#define _arch_atomic_dec_unless_positive(_prev, _rc, counter, sfx)	\
> +({									\
> +	__asm__ __volatile__ (						\
> +		"0:	lr." sfx "      %[p],  %[c]\n"			\
> +		"	bgtz            %[p],  1f\n"			\
> +		"	addi            %[rc], %[p], -1\n"		\
> +		"	sc." sfx ".rl   %[rc], %[rc], %[c]\n"		\
> +		"	bnez            %[rc], 0b\n"			\
> +		"	fence           rw, rw\n"			\
> +		"1:\n"							\
> +		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
> +		:							\
> +		: "memory");						\
> +})
> +
>  static __always_inline bool arch_atomic_dec_unless_positive(atomic_t *v)
>  {
>  	int prev, rc;
>  
> -	__asm__ __volatile__ (
> -		"0:	lr.w      %[p],  %[c]\n"
> -		"	bgtz      %[p],  1f\n"
> -		"	addi      %[rc], %[p], -1\n"
> -		"	sc.w.rl   %[rc], %[rc], %[c]\n"
> -		"	bnez      %[rc], 0b\n"
> -		"	fence     rw, rw\n"
> -		"1:\n"
> -		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> -		:
> -		: "memory");
> +	_arch_atomic_dec_unless_positive(prev, rc, v->counter, "w");
> +
>  	return !(prev > 0);
>  }
>  
>  #define arch_atomic_dec_unless_positive arch_atomic_dec_unless_positive
>  
> +#define _arch_atomic_dec_if_positive(_prev, _rc, counter, sfx)		\
> +({									\
> +	__asm__ __volatile__ (						\
> +		"0:	lr." sfx "     %[p],  %[c]\n"			\
> +		"	addi           %[rc], %[p], -1\n"		\
> +		"	bltz           %[rc], 1f\n"			\
> +		"	sc." sfx ".rl  %[rc], %[rc], %[c]\n"		\
> +		"	bnez           %[rc], 0b\n"			\
> +		"	fence          rw, rw\n"			\
> +		"1:\n"							\
> +		: [p]"=&r" (_prev), [rc]"=&r" (_rc), [c]"+A" (counter)	\
> +		:							\
> +		: "memory");						\
> +})
> +
>  static __always_inline int arch_atomic_dec_if_positive(atomic_t *v)
>  {
>         int prev, rc;
>  
> -	__asm__ __volatile__ (
> -		"0:	lr.w     %[p],  %[c]\n"
> -		"	addi     %[rc], %[p], -1\n"
> -		"	bltz     %[rc], 1f\n"
> -		"	sc.w.rl  %[rc], %[rc], %[c]\n"
> -		"	bnez     %[rc], 0b\n"
> -		"	fence    rw, rw\n"
> -		"1:\n"
> -		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> -		:
> -		: "memory");
> +	_arch_atomic_dec_if_positive(prev, rc, v->counter, "w");
> +
>  	return prev - 1;
>  }
>  
> @@ -304,17 +319,8 @@ static __always_inline bool arch_atomic64_inc_unless_negative(atomic64_t *v)
>  	s64 prev;
>  	long rc;
>  
> -	__asm__ __volatile__ (
> -		"0:	lr.d      %[p],  %[c]\n"
> -		"	bltz      %[p],  1f\n"
> -		"	addi      %[rc], %[p], 1\n"
> -		"	sc.d.rl   %[rc], %[rc], %[c]\n"
> -		"	bnez      %[rc], 0b\n"
> -		"	fence     rw, rw\n"
> -		"1:\n"
> -		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> -		:
> -		: "memory");
> +	_arch_atomic_inc_unless_negative(prev, rc, v->counter, "d");
> +
>  	return !(prev < 0);
>  }
>  
> @@ -325,17 +331,8 @@ static __always_inline bool arch_atomic64_dec_unless_positive(atomic64_t *v)
>  	s64 prev;
>  	long rc;
>  
> -	__asm__ __volatile__ (
> -		"0:	lr.d      %[p],  %[c]\n"
> -		"	bgtz      %[p],  1f\n"
> -		"	addi      %[rc], %[p], -1\n"
> -		"	sc.d.rl   %[rc], %[rc], %[c]\n"
> -		"	bnez      %[rc], 0b\n"
> -		"	fence     rw, rw\n"
> -		"1:\n"
> -		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> -		:
> -		: "memory");
> +	_arch_atomic_dec_unless_positive(prev, rc, v->counter, "d");
> +
>  	return !(prev > 0);
>  }
>  
> @@ -346,17 +343,8 @@ static __always_inline s64 arch_atomic64_dec_if_positive(atomic64_t *v)
>         s64 prev;
>         long rc;
>  
> -	__asm__ __volatile__ (
> -		"0:	lr.d     %[p],  %[c]\n"
> -		"	addi      %[rc], %[p], -1\n"
> -		"	bltz     %[rc], 1f\n"
> -		"	sc.d.rl  %[rc], %[rc], %[c]\n"
> -		"	bnez     %[rc], 0b\n"
> -		"	fence    rw, rw\n"
> -		"1:\n"
> -		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
> -		:
> -		: "memory");
> +	_arch_atomic_dec_if_positive(prev, rc, v->counter, "d");
> +
>  	return prev - 1;
>  }
I have no problem with this optimization.

Reviewed-by: Guo Ren <guoren@kernel.org> 

>  
> -- 
> 2.41.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
