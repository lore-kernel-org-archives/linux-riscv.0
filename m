Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A2DC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 00:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Cc:From:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4yjTVgJXkEkYwFhcaWhI4Fwepwln4X8vhhcMSKf4E0=; b=Xa6G3NAC01KQX/
	ZNEV9o/2lE43yyOnBqBi0B5dEoylA7yPwWBZfTxoNM9TutgiosoH9NTvPezSNhn2Ey06t0NH5WeZ2
	6RlQAsLpcSrDXzcH27vhUGF5zW55w7+iU32HKDn3IVe7VhNbZz0tKVlZL8jMoez5WH1CldIVDFTO4
	78qVrYOA/4Wcu0Jo+nO2T5fk/Yt8NnXCPH+V/ijYvr8DjKgggxdDJboyZnbIiKO+LFJRZ695Itv+Q
	YekpH0CB42TBb8HAll/E31bwRfRLyvLwfQ+kwycizqrZ5F1TqgDnQcJ0RRbib9EVV4p+TJ5223AzZ
	NU/I5eSWxN0fKSN2E1OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUbkd-000000017eQ-0UxB;
	Fri, 19 Jul 2024 00:45:35 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUbka-000000017dc-0Fnl
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 00:45:33 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7f97e794f34so55822139f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 17:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721349930; x=1721954730; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q4gn1KUCdzhlOEmQvR/nJMiqTBzLCbx9aL8Fd1UdpzI=;
        b=l/hNvgmsFCss2hpdsL0vCVqXp1a5ZOkhBsFnZ5GMIgJRz3fGlsNnM2RFWhu9nd81GS
         39//PV9nSTRgWUdpFoqhRnVX093SaFB5Iw1UMrnjOyCTBjEHXbRWUMHC7FaqPHpFE9CV
         iLkmDmKXswEH4eTaN9vmKdI2d3w8hO3B8E67z7AMMwSHb2zo4/lvE5Bv66oWQBEIJ799
         Y7lRXRCtvQVq2FMinCkSnKGyQ3+nDGJpIlZsoDTFsKSZ+Z6VeqyHMmIFuCwAhhc2wc1d
         oGR/JPabWlG89gcKmszEYq+9YWedYw78NK7N2vAmMc96YfwdtwBIHgl4k7oiLGRMsrL1
         zNLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721349930; x=1721954730;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q4gn1KUCdzhlOEmQvR/nJMiqTBzLCbx9aL8Fd1UdpzI=;
        b=qi44csjUCW/wpB9FsojTqGXsFyjBTD2ZUyI8olrwv+m9/GBxa9zdyyIR87+Zv+zJdW
         +qqz0+S+yIcMubQKY+bE7cel4DCe9HSGxsSD97e+4+rAPpffCiaymSeGVSigsbOqTjTc
         /daR6wyGy7RJMfddhA+Gk9/8yMYFGMJ6U6LXwbGWi+ve7Ykkb4VWdw5ftGmDUupqyBTf
         AWQK/fN0iwQjud+kqrWxL2fxvxFcftizjKX6sL3sO6sde4iYcMKp/jmmv3wcKnPB8wYU
         oD8voFgYRUMRp9kZwPSMK1x7Ccfg0bFInAtapYzb3jCz+voRgZF3B9jNjhIMfsbF07sx
         qszQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb3ZBW0Wpm/S4rRonHKSbjb0Z7olT9wNLzBo2zLAB8nG+uPMzobZppD/dfUN4gNbQhthCkveQAoItjgPu26hRp59L22tg/AuI+HUgtd5Kq
X-Gm-Message-State: AOJu0YwFKNM61aTUukoY8sttRvCDEHMBLB/L7o7WEvUUG69fd8k3wnRS
	ZfDEqh6cuk5/yWczMBuYRsNumPyvs7E0jT3g3bJnf/TKAJ9vQf4W6EQY+nAgerY=
X-Google-Smtp-Source: AGHT+IFweNJHVvrorFY+uYyttwMC6ZoZLYaj3XeQfMP5ro0QTdnF+Urlbs7Do8mCw9GvM/skm4WFGw==
X-Received: by 2002:a05:6602:1412:b0:803:c955:eda8 with SMTP id ca18e2360f4ac-8171051114bmr866519339f.6.1721349930521;
        Thu, 18 Jul 2024 17:45:30 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2342bf2cfsm102163173.8.2024.07.18.17.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jul 2024 17:45:30 -0700 (PDT)
Message-ID: <8de44944-62b4-44df-88e1-bcf7417fea6e@sifive.com>
Date: Thu, 18 Jul 2024 19:45:28 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/11] riscv: Implement cmpxchg32/64() using Zacas
To: Alexandre Ghiti <alexghiti@rivosinc.com>
References: <20240717061957.140712-1-alexghiti@rivosinc.com>
 <20240717061957.140712-2-alexghiti@rivosinc.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andrea Parri <parri.andrea@gmail.com>, Nathan Chancellor
 <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, Leonardo Bras <leobras@redhat.com>,
 Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org
In-Reply-To: <20240717061957.140712-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_174532_147844_FDB55ED3 
X-CRM114-Status: GOOD (  21.27  )
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

Hi Alex,

On 2024-07-17 1:19 AM, Alexandre Ghiti wrote:
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

This would probably be a good place to use inline ALTERNATIVE instead of an asm
goto. It saves overall code size, and a jump in the non-Zacas case, at the cost
of 3 nops in the Zacas case. (And all the nops can go after the amocas, where
they will likely be hidden by the amocas latency.)

Regards,
Samuel

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
>  									\
>  	switch (sizeof(*__ptr)) {					\
>  	case 1:								\


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
