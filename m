Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0021C3DA64
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jul 2024 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61k9VepalScBYjEH5q84EMPBMlu8lItiTv160EG+OGA=; b=TdeXIZIfUK9O2s
	3U9FMwpCEUBvj+LZfbQPFjKEcMMXzJzjMOfDS+sKdAT9VRPW8qKJT5J3yMUIrtooEOqIGMfBBFYpu
	8Et4OfB6KeeIkP4Ah0iKmYcVDkTMrWXZfQP4OQYtCniETXH8jzC1cXeiKF0Ih4M8tTs8Wja5kkzRb
	lWdKAp3U19y0YjE8qCE3SVn16zHP3MeCL8NqMxZDsCorTNi8QXhamA7IJklMfXm8Y7GLYWaZ9pzxU
	GhRbRvWSQ7DUHQFlfJuz4YkTsb8PZ9F8W1qJxYrV61BMKE78T7JsYJtxF1by8i9lpJnKwx2iFZsQu
	FoD5BSEeFtgKsJRP+KFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5Lr-00000000Qx1-1for;
	Wed, 31 Jul 2024 09:10:31 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZ5Ln-00000000QwM-3G3u
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jul 2024 09:10:29 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a7a94478a4eso137980666b.1
        for <linux-riscv@lists.infradead.org>; Wed, 31 Jul 2024 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1722417026; x=1723021826; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ijOTzuRIOMmG+h5LVKuKJQXoOZVvJtAJjmCzcOSUiH4=;
        b=jlxSNGOEMHYaHr+AbTEyfa2fOZ26/wY6amrwShG/Crb54epfo3XwSu9zPwsROgKnWT
         ER8Zv0JQ5t7k7P47v3m01LB2TYkG84qz2/q0faaKImwhhtcogZvkI1xKi0FCmMv7p+Wz
         idrSNMXur5VFR4Wczf4122rCLhGp77RAJCdiaGncAy13xyf7WtFbEoCUrM96PlmWp0VJ
         Gp37htbMa2txlvRdaXA5guG3R6TWKaydzyXW+AnpvBg/0GaVXTVBFIb8Re09Ar/TaaIm
         pVVJaV2b6LDP58M5k/YrF/tpany7+NF99aZYW24iMIlLn2CL7wk/eMkq/2enH4e+W0JS
         M+sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722417026; x=1723021826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ijOTzuRIOMmG+h5LVKuKJQXoOZVvJtAJjmCzcOSUiH4=;
        b=LwGRlqeKjfbgA9nK//SfxDvEapABqYObI6ULtS8oRj2Ppj8aSjf16Ji70MrzEVymh3
         KsCuqg26/TjXVdzjnMXKI2gSP2sdm4OkQkn/5+f4Pgw+vYAxVQcSQshNpFyb+yLzrpPB
         r7s84PVcQdc64HkOssE52N0rJfToE+t+K8uZcI8sBeoXcFH85hNXsJrI0AAhgaB6mlBR
         GvWG8D15tGqOWjxN9ohfl2GLObYUCKYVf+dyvroifvEVrem8k2l8EQ6FZrtnw4Sat9/2
         CA+tFoJRaCiLMlP6SvnwN/8PDfAZSdPyMPNO4U6rTTOyM9gt40IG+wl0zaQ6kYRsRfEi
         u2YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsqbbKOys+8nz9+1KIds6FMO/l9FKZMsnsZSdByAF3Ucp2WMmwk91c2JmOl6OjWGuq8gZdE3goQJsApcUdGUpU5fZ99X/guSTrEqqcaCid
X-Gm-Message-State: AOJu0Yyfi/FyKHfBY0nsldFEQE01JGaH3z67H/AM3++XlYlqQQtBnkho
	ODyosAo+EJ5DybJVCKDGojjjn9IgdoCHlTLrxtlqN+MiAS30GBhxuwJ1HE+3kFM=
X-Google-Smtp-Source: AGHT+IGikWLXIJIaE4CmCXfEuZWd5ZNEpN6IVupp6lojcIdRgu5YY+FYQIt0irFhkeky7KnOMAYmQg==
X-Received: by 2002:a17:907:c70c:b0:a7a:ab1a:2d79 with SMTP id a640c23a62f3a-a7d85a58481mr335830166b.29.1722417025618;
        Wed, 31 Jul 2024 02:10:25 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb02b3sm741388466b.189.2024.07.31.02.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 02:10:25 -0700 (PDT)
Date: Wed, 31 Jul 2024 11:10:24 +0200
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Subject: Re: [PATCH v4 01/13] riscv: Move cpufeature.h macros into their own
 header
Message-ID: <20240731-bdb567812a741c94a2c5d38a@orel>
References: <20240731072405.197046-1-alexghiti@rivosinc.com>
 <20240731072405.197046-2-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240731072405.197046-2-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_021027_882129_F5E94CEE 
X-CRM114-Status: GOOD (  23.99  )
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

On Wed, Jul 31, 2024 at 09:23:53AM GMT, Alexandre Ghiti wrote:
> asm/cmpxchg.h will soon need riscv_has_extension_unlikely() macros and
> then needs to include asm/cpufeature.h which introduces a lot of header
> circular dependencies.

The includes of asm/cpufeature.h don't look well maintained. I don't think
it needs asm/errno.h and it should have linux/threads.h,
linux/percpu-defs.h, and linux/kconfig.h.

> 
> So move the riscv_has_extension_XXX() macros into their own header which
> prevents such circular dependencies by including a restricted number of
> headers.
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/cpufeature-macros.h | 66 ++++++++++++++++++++++
>  arch/riscv/include/asm/cpufeature.h        | 56 +-----------------
>  2 files changed, 67 insertions(+), 55 deletions(-)
>  create mode 100644 arch/riscv/include/asm/cpufeature-macros.h
> 
> diff --git a/arch/riscv/include/asm/cpufeature-macros.h b/arch/riscv/include/asm/cpufeature-macros.h
> new file mode 100644
> index 000000000000..c5f0bf75e026
> --- /dev/null
> +++ b/arch/riscv/include/asm/cpufeature-macros.h
> @@ -0,0 +1,66 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2022-2024 Rivos, Inc
> + */
> +
> +#ifndef _ASM_CPUFEATURE_MACROS_H
> +#define _ASM_CPUFEATURE_MACROS_H
> +
> +#include <asm/hwcap.h>
> +#include <asm/alternative-macros.h>
> +
> +#define STANDARD_EXT		0
> +
> +bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned int bit);
> +#define riscv_isa_extension_available(isa_bitmap, ext)	\
> +	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
> +
> +static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
> +							 const unsigned long ext)
> +{
> +	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
> +	:
> +	: [vendor] "i" (vendor), [ext] "i" (ext)
> +	:
> +	: l_no);
> +
> +	return true;
> +l_no:
> +	return false;
> +}
> +
> +static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
> +							   const unsigned long ext)
> +{
> +	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
> +	:
> +	: [vendor] "i" (vendor), [ext] "i" (ext)
> +	:
> +	: l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
> +static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext)
> +{
> +	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
> +
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> +		return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
> +
> +	return __riscv_isa_extension_available(NULL, ext);
> +}
> +
> +static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
> +{
> +	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
> +
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> +		return __riscv_has_extension_likely(STANDARD_EXT, ext);
> +
> +	return __riscv_isa_extension_available(NULL, ext);
> +}
> +
> +#endif

nit: Add the /* _ASM_CPUFEATURE_MACROS_H */ here.

> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 45f9c1171a48..c991672bb401 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -11,6 +11,7 @@
>  #include <asm/hwcap.h>
>  #include <asm/alternative-macros.h>

I think asm/alternative-macros.h can be dropped now.

>  #include <asm/errno.h>
> +#include <asm/cpufeature-macros.h>
>  
>  /*
>   * These are probed via a device_initcall(), via either the SBI or directly
> @@ -103,61 +104,6 @@ extern const size_t riscv_isa_ext_count;
>  extern bool riscv_isa_fallback;
>  
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
> -
> -#define STANDARD_EXT		0
> -
> -bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned int bit);
> -#define riscv_isa_extension_available(isa_bitmap, ext)	\
> -	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
> -
> -static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
> -							 const unsigned long ext)
> -{
> -	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
> -	:
> -	: [vendor] "i" (vendor), [ext] "i" (ext)
> -	:
> -	: l_no);
> -
> -	return true;
> -l_no:
> -	return false;
> -}
> -
> -static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
> -							   const unsigned long ext)
> -{
> -	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
> -	:
> -	: [vendor] "i" (vendor), [ext] "i" (ext)
> -	:
> -	: l_yes);
> -
> -	return false;
> -l_yes:
> -	return true;
> -}
> -
> -static __always_inline bool riscv_has_extension_unlikely(const unsigned long ext)
> -{
> -	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
> -
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> -		return __riscv_has_extension_unlikely(STANDARD_EXT, ext);
> -
> -	return __riscv_isa_extension_available(NULL, ext);
> -}
> -
> -static __always_inline bool riscv_has_extension_likely(const unsigned long ext)
> -{
> -	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
> -
> -	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
> -		return __riscv_has_extension_likely(STANDARD_EXT, ext);
> -
> -	return __riscv_isa_extension_available(NULL, ext);
> -}
> -
>  static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
>  {
>  	compiletime_assert(ext < RISCV_ISA_EXT_MAX, "ext must be < RISCV_ISA_EXT_MAX");
> -- 
> 2.39.2
> 
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
