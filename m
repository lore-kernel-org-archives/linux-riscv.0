Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586DEC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 15:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5BuJtJOXuuRtgPShi/inxOYzEvU130Xh8uR99pjtMOM=; b=z9mp7DNgqKhPZQ
	X38YztXwgOnVQYmg9RkI6tIl1H79zKCoEmjZ6GCJWcf2muyCmd/9B9PmI18VmVJaLT9mVp9p1YwDh
	XcUMmVRqBptHqovXA6fHgz+vwXUpeAEnzmB5B96pjMyz9V1R0XYy4GMqpDx532ThYUKFrcREbtC4A
	1uOmXEjKVY/qtCAoqg09eXPa3sAkxaWq2ky6W3ppxgo+FKxwu+TLgVRxlD2z1L9WWlLsq7MlCejnY
	+0LEOp/Kozkn/ddZaU12ECS0DzH1ZlyD4QCQtt2KqHb1qH2lMeQWxHaomAfieRQzLEVQhn1vtp3I9
	YjR03rFLp6KZE0zs9yMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU6GY-0000000E9H6-1iga;
	Wed, 17 Jul 2024 15:08:26 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU6GV-0000000E9GO-15di
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 15:08:24 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-79f0c08aa45so471337085a.0
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 08:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721228901; x=1721833701; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fi/isgE1Pm11CKabZ9tWJMK8UbnuSiqX86ntuw4zABo=;
        b=FABpfpf/nptCmSj12+YAAaqB3UF6HkSOZF9DtvvLDMF53KXXAPgf/kvMqgxeunLze8
         vGqFWB1dG+m5xTIObsYQ4P4Im1Jx+wlmMCCXkJKthQrA9NVP3CbQ3Rk+5p3+8yo7xE/W
         7ZLRrmaFRrOIU3MIqlk6wA3Dd1tR2d4aUe3ChfOBZNqKwpwz+hgLBgJhlhcQ18vqtbPv
         fNN5je2iwSmHwJaYDbtKihB0jygj0oqIsJjTD9nSyaLEVkLGhnAduCiKiQIBibcO8yQD
         jpnbcjakGe1jSJnfl8wvktGAo4S10zA47mUpIbAdhRc45GiJttZAx+fThoLCOTLVK4S1
         GxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721228901; x=1721833701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fi/isgE1Pm11CKabZ9tWJMK8UbnuSiqX86ntuw4zABo=;
        b=EE2iXYQq0y9wB5mjH0obmObNGhrJNDsSqdNPL1aejLC2LVpMeIG+l92oKoRSYAMV97
         eQj0cRqHH+aQRcaYUw//2oO8oKKNqwZTRjLSdcHriBDD/8t5+oo8LzEg4iyAqU4Sz4FU
         vk6+1kkce/WLtyyzy9zS1PgE6T089haDqzNCmMU3I6vkMgJbokwLTlsciDGq2U8hhz+x
         ezZAB76WCcyPJ6zlpjsd2oI68tkil4VLDPnyw7bG4EJkCRS98iBsC+NgbQIwrcNBEycg
         GvXa8tHgI5+oZ0QLpaxK5mzB9/ASUMTo79HN/m6ueLBw2FfwvXbtZHnDssTUGfFljmaV
         9xYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXejgNRiblpOTPkziwtcEXIYrnXwMrp+CRCaOXeLBCHJqRMPAB40ra+VIv0Zwg4AVS3hEagXBxA+C5rh45rtCw/rRIucb56neCYQPaRXx4C
X-Gm-Message-State: AOJu0YzZy2rVojNz8vj/HDJZtsLIxyj5pcavwlRRwpHyZ6q5iikobsFx
	pU1Nhq8AMQIzajneiucONJe0b74Byp52JxhrxwS+YXmtHNk2TKFOQyKc94xz/VE=
X-Google-Smtp-Source: AGHT+IG7uixuMZnaEeCwSoRYkGiPDewVPpgv/wPaPtJXzxlNiA262oRzJeKASnxaYhL4f7oonG9SEA==
X-Received: by 2002:a05:620a:390b:b0:79f:d80:5930 with SMTP id af79cd13be357-7a1874e0770mr251887185a.52.1721228901252;
        Wed, 17 Jul 2024 08:08:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160c65924sm412147385a.73.2024.07.17.08.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 08:08:20 -0700 (PDT)
Date: Wed, 17 Jul 2024 10:08:19 -0500
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
Subject: Re: [PATCH v3 01/11] riscv: Implement cmpxchg32/64() using Zacas
Message-ID: <20240717-8f0afff97de3095badf4fc4e@orel>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240717061957.140712-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_080823_335513_85F0D528 
X-CRM114-Status: GOOD (  22.23  )
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

On Wed, Jul 17, 2024 at 08:19:47AM GMT, Alexandre Ghiti wrote:
> This adds runtime support for Zacas in cmpxchg operations.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/Kconfig               | 17 +++++++++++++++++
>  arch/riscv/Makefile              |  3 +++
>  arch/riscv/include/asm/cmpxchg.h | 26 +++++++++++++++++++++++---
>  3 files changed, 43 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 05ccba8ca33a..1caaedec88c7 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -596,6 +596,23 @@ config RISCV_ISA_V_PREEMPTIVE
>  	  preemption. Enabling this config will result in higher memory
>  	  consumption due to the allocation of per-task's kernel Vector context.
>  
> +config TOOLCHAIN_HAS_ZACAS
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zacas)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zacas)
> +	depends on AS_HAS_OPTION_ARCH
> +
> +config RISCV_ISA_ZACAS
> +	bool "Zacas extension support for atomic CAS"
> +	depends on TOOLCHAIN_HAS_ZACAS
> +	default y
> +	help
> +	  Enable the use of the Zacas ISA-extension to implement kernel atomic
> +	  cmpxchg operations when it is detected at boot.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZBB
>  	bool
>  	default y
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 06de9d365088..9fd13d7a9cc6 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -85,6 +85,9 @@ endif
>  # Check if the toolchain supports Zihintpause extension
>  riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZIHINTPAUSE) := $(riscv-march-y)_zihintpause
>  
> +# Check if the toolchain supports Zacas
> +riscv-march-$(CONFIG_TOOLCHAIN_HAS_ZACAS) := $(riscv-march-y)_zacas
> +
>  # Remove F,D,V from isa string for all. Keep extensions between "fd" and "v" by
>  # matching non-v and non-multi-letter extensions out with the filter ([^v_]*)
>  KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)fd([^v_]*)v?/\1\2/')
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 808b4c78462e..5d38153e2f13 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -9,6 +9,7 @@
>  #include <linux/bug.h>
>  
>  #include <asm/fence.h>
> +#include <asm/alternative.h>
>  
>  #define __arch_xchg_masked(sc_sfx, prepend, append, r, p, n)		\
>  ({									\
> @@ -134,21 +135,40 @@
>  	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
>  })
>  
> -#define __arch_cmpxchg(lr_sfx, sc_sfx, prepend, append, r, p, co, o, n)	\
> +#define __arch_cmpxchg(lr_sfx, sc_cas_sfx, prepend, append, r, p, co, o, n)	\

I'd either not bother renaming sc_sfx or also rename it in _arch_cmpxchg.

>  ({									\
> +	__label__ no_zacas, end;					\
>  	register unsigned int __rc;					\
>  									\
> +	if (IS_ENABLED(CONFIG_RISCV_ISA_ZACAS)) {			\
> +		asm goto(ALTERNATIVE("j %[no_zacas]", "nop", 0,		\
> +				     RISCV_ISA_EXT_ZACAS, 1)		\
> +			 : : : : no_zacas);				\
> +									\
> +		__asm__ __volatile__ (					\
> +			prepend						\
> +			"	amocas" sc_cas_sfx " %0, %z2, %1\n"	\
> +			append						\
> +			: "+&r" (r), "+A" (*(p))			\
> +			: "rJ" (n)					\
> +			: "memory");					\
> +		goto end;						\
> +	}								\
> +									\
> +no_zacas:								\
>  	__asm__ __volatile__ (						\
>  		prepend							\
>  		"0:	lr" lr_sfx " %0, %2\n"				\
>  		"	bne  %0, %z3, 1f\n"				\
> -		"	sc" sc_sfx " %1, %z4, %2\n"			\
> +		"	sc" sc_cas_sfx " %1, %z4, %2\n"			\
>  		"	bnez %1, 0b\n"					\
>  		append							\
>  		"1:\n"							\
>  		: "=&r" (r), "=&r" (__rc), "+A" (*(p))			\
>  		: "rJ" (co o), "rJ" (n)					\
>  		: "memory");						\
> +									\
> +end:;									\
>  })
>  
>  #define _arch_cmpxchg(ptr, old, new, sc_sfx, prepend, append)		\
> @@ -156,7 +176,7 @@
>  	__typeof__(ptr) __ptr = (ptr);					\
>  	__typeof__(*(__ptr)) __old = (old);				\
>  	__typeof__(*(__ptr)) __new = (new);				\
> -	__typeof__(*(__ptr)) __ret;					\
> +	__typeof__(*(__ptr)) __ret = (old);				\

Is this just to silence some compiler warnings? Can we point out
whatever the reason is in the commit message?

>  									\
>  	switch (sizeof(*__ptr)) {					\
>  	case 1:								\
> -- 
> 2.39.2
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
