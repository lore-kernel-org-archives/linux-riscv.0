Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEA9CCF2D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 10:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+f2ShsQlwmL2C84LpPtoI9KkScmlSo6qupOqTem/PrM=; b=Yn1rADSgx6CluE
	9DXA628phv+b//7YMG2LnXNSAm0coqPTLnIWTKjwXacfKQtaFCqG+rGH4usivQlEt+59WiFF1EOe8
	iPVwY9KRAu4yqAbx73As9m2C9UhU6Ct5lgCohQpnC7ESxhOSbD3+Ip6ml0GfFfYWoVgfw+qDJLyXv
	wqmyhJcVMnGl4hqUn5NQlCOZ4+Gj3aCZSn8pJlM6NP+BoWTA/5sLVd37KryN3lOfqR0xKIoSuGeNU
	7Y7Uu+bQxK8+cq6Kkr4Jew916UP3IF7tpY5k7ECem6YoOr+ohxax8j6XaJtxAuL0xqxXFD+zKdv9G
	DKdJ1GRtQ9rF1Es9phdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmSy-00000001lsg-1kV7;
	Mon, 19 Jan 2026 10:26:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmSv-00000001lrn-0hUc;
	Mon, 19 Jan 2026 10:26:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1246C153B;
	Mon, 19 Jan 2026 02:26:25 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B17E53F632;
	Mon, 19 Jan 2026 02:26:26 -0800 (PST)
Date: Mon, 19 Jan 2026 10:26:24 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Message-ID: <aW4G0PBEwx1RjbOl@J2N7QTR9R3>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
 <20260102131156.3265118-3-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260102131156.3265118-3-ryan.roberts@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_022633_356936_8FAF918B 
X-CRM114-Status: GOOD (  20.82  )
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

On Fri, Jan 02, 2026 at 01:11:53PM +0000, Ryan Roberts wrote:
> We will shortly use prandom_u32_state() to implement kstack offset
> randomization and some arches need to call it from non-instrumentable
> context. Given the function is just a handful of operations and doesn't
> call out to any other functions, let's take the easy path and make it
> __always_inline.
> 
> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>

I see there were some comments about keeping an out-of-line wrapper.
With or without that, this looks good to me, and either way:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  include/linux/prandom.h | 19 ++++++++++++++++++-
>  lib/random32.c          | 19 -------------------
>  2 files changed, 18 insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux/prandom.h b/include/linux/prandom.h
> index ff7dcc3fa105..e797b3709f5c 100644
> --- a/include/linux/prandom.h
> +++ b/include/linux/prandom.h
> @@ -17,7 +17,24 @@ struct rnd_state {
>  	__u32 s1, s2, s3, s4;
>  };
>  
> -u32 prandom_u32_state(struct rnd_state *state);
> +/**
> + * prandom_u32_state - seeded pseudo-random number generator.
> + * @state: pointer to state structure holding seeded state.
> + *
> + * This is used for pseudo-randomness with no outside seeding.
> + * For more random results, use get_random_u32().
> + */
> +static __always_inline u32 prandom_u32_state(struct rnd_state *state)
> +{
> +#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
> +	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
> +	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
> +	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
> +	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
> +
> +	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
> +}
> +
>  void prandom_bytes_state(struct rnd_state *state, void *buf, size_t nbytes);
>  void prandom_seed_full_state(struct rnd_state __percpu *pcpu_state);
>  
> diff --git a/lib/random32.c b/lib/random32.c
> index 24e7acd9343f..d57baf489d4a 100644
> --- a/lib/random32.c
> +++ b/lib/random32.c
> @@ -42,25 +42,6 @@
>  #include <linux/slab.h>
>  #include <linux/unaligned.h>
>  
> -/**
> - *	prandom_u32_state - seeded pseudo-random number generator.
> - *	@state: pointer to state structure holding seeded state.
> - *
> - *	This is used for pseudo-randomness with no outside seeding.
> - *	For more random results, use get_random_u32().
> - */
> -u32 prandom_u32_state(struct rnd_state *state)
> -{
> -#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
> -	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
> -	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
> -	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
> -	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
> -
> -	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
> -}
> -EXPORT_SYMBOL(prandom_u32_state);
> -
>  /**
>   *	prandom_bytes_state - get the requested number of pseudo-random bytes
>   *
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
