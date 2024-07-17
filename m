Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D323C3DA5D
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 20:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZwIg9CjrtTLmCzqGXUOhkwdYayulkh89/26cmLVLck=; b=nTMvTO6m7IiGTF
	axNC30FMj4CwdG6O4m6WsMg8KEQYkU4MemyNOA27nXaB+DMDNyUwQI6WYbAI/BarYcvcFwhpEc5f5
	y4V3/XvVplaTYgtB+wFPPZL/wyzicWqjEF+hoW82cWJVOOrc3REUTYzP/acAVDihIawIDRSgaIAem
	rVCyu4LMsvyU1/Y8T4XZQNWblRVN5Q9007TdnrlwNYLzmifKlFR2QbrpFNBs/2TdfMqlE2eVNsEsS
	H63r0/6qT+QjJUTuVz6rYMzxBTe4tF5egE+BuNS3mVaHe2U3L1zhBVV74iM1riswH7KT6FmdmOyZQ
	Mq9phDpd+44APq1fBdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUBM2-0000000ErHP-1vVQ;
	Wed, 17 Jul 2024 20:34:26 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUBM0-0000000ErGd-2bhy
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 20:34:25 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-8076cee8088so859439f.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 13:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721248462; x=1721853262; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QtpPpWXQtBAQXDHo2JGT2guS8/BS/6ypKf9JkIYf/zw=;
        b=Z2m6mUBnyEGibwTRSh98j3sGDLjUWBFBW3JcV+CRYCNwhOoViVf/X7WXhpkX8IS6b+
         6kIMno66kY0pH3o5/AehE60qYVNswazE8HK2BO/WlXLxctTD4sHU4PdGkvz6/ujFLGeW
         j/LNqFloVJ3vXxTMEpvnmE2zSCH3DbEuLJ3T5viTKd/eJ/JXbQ4mGZsIb1z9w3WSJYHb
         w506fsM4R6NqOfGv9gL5VbHImKlJ/k/deRfXqSxKJZb/VVuqjbB3w6uDDcStGJ6hiMf6
         xikvZAMLHfjKdgSAognTQQPNU8DsslueE9+dPMDMWIO8bbXPeidYr+iaqY2XVlcVcQA8
         LYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721248462; x=1721853262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QtpPpWXQtBAQXDHo2JGT2guS8/BS/6ypKf9JkIYf/zw=;
        b=Tgml/PjEvZ6sAurhUBG2pp0xZsFfxIrmg7Gxw9Z+JrjgLRgvRDoORO+HR0En20WUV2
         oBkeEqFJgn1lL6xbW5B4NZv+HxLgSpN/0q2zvsLpwPd/uANZtiAq/paRTFGpf08/3HjP
         6pflhVF6JgxUGTiDAIjR1mgEPeDQzzvBx4GcNW5BepUTTh7Um9ZE71yjALYt/Iol7Cqj
         p1VZ3vb+c99DN5YqXpj/gjU5C0rqleSz8lJRj+fAhyt9LCxCggHfV9lArnTKosueq1ja
         OKyUF7bGVQVwSpS9dzyU9+yk+Bh2UlicuatTLP2JXprIGHEZ/SwYB/8u+aLWATinDoeK
         gPEg==
X-Forwarded-Encrypted: i=1; AJvYcCUv/NUNTwZSDFpMqrRLTmEWE6XZiJCfsRJ5Lg5oUBA3VXGAzVJnryWi+vT52fSBKxrNaIr0hVNVPyLsgqBQZ+LBzXTe9uNOVYJByhqUuN+z
X-Gm-Message-State: AOJu0YyQAMIah5zHp6Lc+Jbe/vG1jrQutDpAp3LO9cNNAO9Wp4ibAqSs
	YiXgvrXxvJWwN5hKNIzi8MbwMv9/4JExFjeh/gzR4UYzMJ47gwodVUQ7lJgRwQA=
X-Google-Smtp-Source: AGHT+IHyCNDFTJdIYTV8x1lKWJ0BtFynN8TnK0DaK0VfJ1LVOKNTWdGlSb4Lpwcr3wySQQZq+iwxAA==
X-Received: by 2002:a05:6e02:1e04:b0:376:492e:a13b with SMTP id e9e14a558f8ab-39557424e40mr40107885ab.28.1721248462329;
        Wed, 17 Jul 2024 13:34:22 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-395fb1529f2sm4017275ab.6.2024.07.17.13.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 13:34:21 -0700 (PDT)
Date: Wed, 17 Jul 2024 15:34:20 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v3 05/11] riscv: Implement arch_cmpxchg128() using Zacas
Message-ID: <20240717-94b49fbac3c6bf97a0f96281@orel>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-6-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240717061957.140712-6-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_133424_670123_80474553 
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

On Wed, Jul 17, 2024 at 08:19:51AM GMT, Alexandre Ghiti wrote:
> Now that Zacas is supported in the kernel, let's use the double word
> atomic version of amocas to improve the SLUB allocator.
> 
> Note that we have to select fixed registers, otherwise gcc fails to pick
> even registers and then produces a reserved encoding which fails to
> assemble.

Oh, that's quite unfortunate... I guess we should try to get some new
RISC-V inline assembly register constraints added to support register
pairs.

> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/include/asm/cmpxchg.h | 39 ++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d3b0f92f92da..0bbaec0444d0 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -104,6 +104,7 @@ config RISCV
>  	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
>  	select HARDIRQS_SW_RESEND
>  	select HAS_IOPORT if MMU
> +	select HAVE_ALIGNED_STRUCT_PAGE
>  	select HAVE_ARCH_AUDITSYSCALL
>  	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
>  	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 97b24da38897..608d98522557 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -289,4 +289,43 @@ end:;									\
>  	arch_cmpxchg_release((ptr), (o), (n));				\
>  })
>  
> +#ifdef CONFIG_RISCV_ISA_ZACAS

This is also 64-bit only, so needs a CONFIG_64BIT check too.

> +
> +#define system_has_cmpxchg128()						\
> +			riscv_has_extension_unlikely(RISCV_ISA_EXT_ZACAS)

nit: let's let this stick out since we have 100 chars

> +
> +union __u128_halves {
> +	u128 full;
> +	struct {
> +		u64 low, high;

Should we consider big endian too?

> +	};
> +};
> +
> +#define __arch_cmpxchg128(p, o, n, cas_sfx)					\
> +({										\
> +	__typeof__(*(p)) __o = (o);						\
> +	union __u128_halves __hn = { .full = (n) };				\
> +	union __u128_halves __ho = { .full = (__o) };				\
> +	register unsigned long x6 asm ("x6") = __hn.low;			\
> +	register unsigned long x7 asm ("x7") = __hn.high;			\
> +	register unsigned long x28 asm ("x28") = __ho.low;			\
> +	register unsigned long x29 asm ("x29") = __ho.high;			\

Can we use t1,t2,t3,t4 rather than the x names?

> +										\
> +	__asm__ __volatile__ (							\
> +		"	amocas.q" cas_sfx " %0, %z3, %2"			\
> +		: "+&r" (x28), "+&r" (x29), "+A" (*(p))				\
> +		: "rJ" (x6), "rJ" (x7)						\
> +		: "memory");							\
> +										\
> +	((u128)x29 << 64) | x28;						\
> +})
> +
> +#define arch_cmpxchg128(ptr, o, n)						\
> +	__arch_cmpxchg128((ptr), (o), (n), ".aqrl")
> +
> +#define arch_cmpxchg128_local(ptr, o, n)					\
> +	__arch_cmpxchg128((ptr), (o), (n), "")
> +
> +#endif /* CONFIG_RISCV_ISA_ZACAS */
> +
>  #endif /* _ASM_RISCV_CMPXCHG_H */
> -- 
> 2.39.2

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
