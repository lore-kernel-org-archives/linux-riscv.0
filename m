Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A7BC4167D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Oct 2023 20:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+rFnUWZgSFsGADj5vJnip3SSs2GVRmhAPbR2x1TEtT8=; b=ah8V0wSXk1FCMw
	orraVoQ2n3oFzI1efGu7HGxmkQfDiWryL70ZrqGGpY9AQtC8J2tV/L934+zqegsnxbxPYAz/taS4n
	fHise/wyV2ZHxjr6FwcAfzPnNqenvzyZTvtKpq7lHqwaO2nqFyLJpNcNjnbcTvPpvsGNGf1teXDY3
	mWbWd9SK6JF3lKLROReqLArokpGghu7bupdEwL1bXOjuLwmGp4N0dV8dP2cTDRyMHz5Di4XdKvc3N
	XqsSvHcYMbPTQWzwgL4pPgp+h1/OvNrC8pSAlBziIWCGUUw4Gmsn/nGd7Qi3igrmFPniggNqfCBID
	BnggE0nf9oqCsjDA/OfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxZ0S-004138-02;
	Mon, 30 Oct 2023 20:37:04 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxZ0N-00412W-2t
	for linux-riscv@lists.infradead.org;
	Mon, 30 Oct 2023 20:37:02 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6ce322b62aeso3164127a34.3
        for <linux-riscv@lists.infradead.org>; Mon, 30 Oct 2023 13:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698698217; x=1699303017; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ4KN6tlJGYCZUxxEQdR0Q/ytFnB1YDnlZNq2tA9210=;
        b=ERxUQvlv1GnMnSrPObClqCdQ4L4yTek1pPH/uktdSmgwMmDwZ/4Eb1FnVcWGpAdAij
         rQQmOJeTnUjlA4RSj3ysvOQpisTlvtPjaMQ+YhZc0+o4HCKOdT/LOD32lE8qN0HxpZMX
         26qWfqGOq0HSfCQXwx40ZHet5Bc8n4IDwL2tN870COHFS4Wiu3o1h2+vOqb6s/NpKBuo
         JH/4W6oG6CmZEhm2spJeAcJi4t2fMY971Bijeb1NOSzkFVOypU263QzaXHoZOKwK7/7y
         /Rzqj7f1D7QpUBuoq44XVNsGoeKjo/la37OOSwX18JyFfe4U2vQtB5Q55RMmIrsJVQiP
         lFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698698217; x=1699303017;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZ4KN6tlJGYCZUxxEQdR0Q/ytFnB1YDnlZNq2tA9210=;
        b=lMfnES1Jk3iTTcnM5ao3cZsxd0ooHGnqK1KSdcLRepMw8RpL/4PnHlterp6geDzZlD
         l598rwrGyffWvtYzp9Pwrp4BHcQFAxbvRG5ledEk2szyzitATO42tc8rOl0vmDveQN4l
         hVizcF807TeSHnnyS0FUUs4FdSNlxhaxrgVtepWnBXala7Srz0p7lH6jpj+Vp10R0Fa4
         fwsziAPD8vMrjS3Z+brVXVUZQP5wQFIDqZNhjoFW3t0h+tivF/VJK0KVE7UYTWooO62c
         JpNbdSLclsmjS8KfMjo9A01o7ZLNtoIxwprvwKUwsNNuLla1Eh+Jwg8lcttVsVD/jIkt
         1N0g==
X-Gm-Message-State: AOJu0Yy5rQMN3tSjFkKNsoNkvTwQfXHnF1iz3NvlSez/8a7BDD5QqTPo
	VggIDnhforVk0bXUVwL0Mvkoew==
X-Google-Smtp-Source: AGHT+IFqnqfn68S3h5uFim4LlODhzKa0MsgyJbxQBjKwuw5bU9hkt9AtsHPktQxnu8I17GaM5CYx2g==
X-Received: by 2002:a05:6830:2644:b0:6b9:ba85:a5fa with SMTP id f4-20020a056830264400b006b9ba85a5famr13518836otu.5.1698698217472;
        Mon, 30 Oct 2023 13:36:57 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:f2bd:1ee:3a71:49a])
        by smtp.gmail.com with ESMTPSA id w3-20020a056830060300b006cd0a847138sm1539684oti.2.2023.10.30.13.36.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 13:36:57 -0700 (PDT)
Date: Mon, 30 Oct 2023 13:36:54 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ardb@kernel.org, anup@brainfault.org, haicheng.li@intel.com,
	ajones@ventanamicro.com, yujie.liu@intel.com,
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] riscv: Optimize bitops with Zbb extension
Message-ID: <ZUAT5gKXM+pU6r3w@ghost>
References: <20231030063904.2116277-1-xiao.w.wang@intel.com>
 <20231030063904.2116277-3-xiao.w.wang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231030063904.2116277-3-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231030_133700_160391_F40A8FB6 
X-CRM114-Status: GOOD (  32.49  )
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

On Mon, Oct 30, 2023 at 02:39:04PM +0800, Xiao Wang wrote:
> This patch leverages the alternative mechanism to dynamically optimize
> bitops (including __ffs, __fls, ffs, fls) with Zbb instructions. When
> Zbb ext is not supported by the runtime CPU, legacy implementation is
> used. If Zbb is supported, then the optimized variants will be selected
> via alternative patching.
> 
> The legacy bitops support is taken from the generic C implementation as
> fallback.
> 
> If the parameter is a build-time constant, we leverage compiler builtin to
> calculate the result directly, this approach is inspired by x86 bitops
> implementation.
> 
> EFI stub runs before the kernel, so alternative mechanism should not be
> used there, this patch introduces a macro NO_ALTERNATIVE for this purpose.
> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/include/asm/bitops.h       | 255 +++++++++++++++++++++++++-
>  drivers/bitopstest/Kconfig            |   1 +
>  drivers/firmware/efi/libstub/Makefile |   2 +-
>  3 files changed, 254 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index 3540b690944b..ef35c9ebc2ed 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -15,13 +15,262 @@
>  #include <asm/barrier.h>
>  #include <asm/bitsperlong.h>
>  
> +#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
>  #include <asm-generic/bitops/__ffs.h>
> -#include <asm-generic/bitops/ffz.h>
> -#include <asm-generic/bitops/fls.h>
>  #include <asm-generic/bitops/__fls.h>
> +#include <asm-generic/bitops/ffs.h>
> +#include <asm-generic/bitops/fls.h>
> +
> +#else
> +#include <asm/alternative-macros.h>
> +#include <asm/hwcap.h>
> +
> +#if (BITS_PER_LONG == 64)
> +#define CTZW	"ctzw "
> +#define CLZW	"clzw "
> +#elif (BITS_PER_LONG == 32)
> +#define CTZW	"ctz "
> +#define CLZW	"clz "
> +#else
> +#error "Unexpected BITS_PER_LONG"
> +#endif
> +
> +static __always_inline unsigned long variable__ffs(unsigned long word)
> +{
> +	int num;
> +
> +	asm_volatile_goto(
> +		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
> +		: : : : legacy);
> +

On this and following asm blocks, checkpatch outputs:  "Lines should not
end with a '('".

> +	asm volatile (
> +		".option push\n"
> +		".option arch,+zbb\n"
> +		"ctz %0, %1\n"
> +		".option pop\n"
> +		: "=r" (word) : "r" (word) :);
> +
> +	return word;
> +
> +legacy:
> +	num = 0;
> +#if BITS_PER_LONG == 64
> +	if ((word & 0xffffffff) == 0) {
> +		num += 32;
> +		word >>= 32;
> +	}
> +#endif
> +	if ((word & 0xffff) == 0) {
> +		num += 16;
> +		word >>= 16;
> +	}
> +	if ((word & 0xff) == 0) {
> +		num += 8;
> +		word >>= 8;
> +	}
> +	if ((word & 0xf) == 0) {
> +		num += 4;
> +		word >>= 4;
> +	}
> +	if ((word & 0x3) == 0) {
> +		num += 2;
> +		word >>= 2;
> +	}
> +	if ((word & 0x1) == 0)
> +		num += 1;
> +	return num;
> +}
> +
> +/**
> + * __ffs - find first set bit in a long word
> + * @word: The word to search
> + *
> + * Undefined if no set bit exists, so code should check against 0 first.
> + */
> +#define __ffs(word)				\
> +	(__builtin_constant_p(word) ?		\
> +	 (unsigned long)__builtin_ctzl(word) :	\
> +	 variable__ffs(word))
> +
> +static __always_inline unsigned long variable__fls(unsigned long word)
> +{
> +	int num;
> +
> +	asm_volatile_goto(
> +		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
> +		: : : : legacy);
> +
> +	asm volatile (
> +		".option push\n"
> +		".option arch,+zbb\n"
> +		"clz %0, %1\n"
> +		".option pop\n"
> +		: "=r" (word) : "r" (word) :);
> +
> +	return BITS_PER_LONG - 1 - word;
> +
> +legacy:
> +	num = BITS_PER_LONG - 1;
> +#if BITS_PER_LONG == 64
> +	if (!(word & (~0ul << 32))) {
> +		num -= 32;
> +		word <<= 32;
> +	}
> +#endif
> +	if (!(word & (~0ul << (BITS_PER_LONG-16)))) {
> +		num -= 16;
> +		word <<= 16;
> +	}
> +	if (!(word & (~0ul << (BITS_PER_LONG-8)))) {
> +		num -= 8;
> +		word <<= 8;
> +	}
> +	if (!(word & (~0ul << (BITS_PER_LONG-4)))) {
> +		num -= 4;
> +		word <<= 4;
> +	}
> +	if (!(word & (~0ul << (BITS_PER_LONG-2)))) {
> +		num -= 2;
> +		word <<= 2;
> +	}
> +	if (!(word & (~0ul << (BITS_PER_LONG-1))))
> +		num -= 1;
> +	return num;
> +}
> +
> +/**
> + * __fls - find last set bit in a long word
> + * @word: the word to search
> + *
> + * Undefined if no set bit exists, so code should check against 0 first.
> + */
> +#define __fls(word)							\
> +	(__builtin_constant_p(word) ?					\
> +	 (unsigned long)(BITS_PER_LONG - 1 - __builtin_clzl(word)) :	\
> +	 variable__fls(word))
> +
> +static __always_inline int variable_ffs(int x)
> +{
> +	int r;
> +
> +	if (!x)
> +		return 0;
> +
> +	asm_volatile_goto(
> +		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
> +		: : : : legacy);
> +
> +	asm volatile (
> +		".option push\n"
> +		".option arch,+zbb\n"
> +		CTZW "%0, %1\n"
> +		".option pop\n"
> +		: "=r" (r) : "r" (x) :);
> +
> +	return r + 1;
> +
> +legacy:
> +	r = 1;
> +	if (!(x & 0xffff)) {
> +		x >>= 16;
> +		r += 16;
> +	}
> +	if (!(x & 0xff)) {
> +		x >>= 8;
> +		r += 8;
> +	}
> +	if (!(x & 0xf)) {
> +		x >>= 4;
> +		r += 4;
> +	}
> +	if (!(x & 3)) {
> +		x >>= 2;
> +		r += 2;
> +	}
> +	if (!(x & 1)) {
> +		x >>= 1;
> +		r += 1;
> +	}
> +	return r;
> +}
> +
> +/**
> + * ffs - find first set bit in a word
> + * @x: the word to search
> + *
> + * This is defined the same way as the libc and compiler builtin ffs routines.
> + *
> + * ffs(value) returns 0 if value is 0 or the position of the first set bit if
> + * value is nonzero. The first (least significant) bit is at position 1.
> + */
> +#define ffs(x) (__builtin_constant_p(x) ? __builtin_ffs(x) : variable_ffs(x))
> +
> +static __always_inline int variable_fls(unsigned int x)
> +{
> +	int r;
> +
> +	if (!x)
> +		return 0;
> +
> +	asm_volatile_goto(
> +		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
> +		: : : : legacy);
> +
> +	asm volatile (
> +		".option push\n"
> +		".option arch,+zbb\n"
> +		CLZW "%0, %1\n"
> +		".option pop\n"
> +		: "=r" (r) : "r" (x) :);
> +
> +	return 32 - r;
> +
> +legacy:
> +	r = 32;
> +	if (!(x & 0xffff0000u)) {
> +		x <<= 16;
> +		r -= 16;
> +	}
> +	if (!(x & 0xff000000u)) {
> +		x <<= 8;
> +		r -= 8;
> +	}
> +	if (!(x & 0xf0000000u)) {
> +		x <<= 4;
> +		r -= 4;
> +	}
> +	if (!(x & 0xc0000000u)) {
> +		x <<= 2;
> +		r -= 2;
> +	}
> +	if (!(x & 0x80000000u)) {
> +		x <<= 1;
> +		r -= 1;
> +	}
> +	return r;
> +}
> +
> +/**
> + * fls - find last set bit in a word
> + * @x: the word to search
> + *
> + * This is defined in a similar way as ffs, but returns the position of the most
> + * significant set bit.
> + *
> + * fls(value) returns 0 if value is 0 or the position of the last set bit if
> + * value is nonzero. The last (most significant) bit is at position 32.
> + */
> +#define fls(x)								\
> +	(__builtin_constant_p(x) ?					\
> +	 (int)(((x) != 0) ?						\
> +	  (sizeof(unsigned int) * 8 - __builtin_clz(x)) : 0) :		\
> +	 variable_fls(x))
> +

Checkpath complains: "Macro argument reuse 'x' - possible side-effects"

> +#endif /* !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE) */
> +
> +#include <asm-generic/bitops/ffz.h>
>  #include <asm-generic/bitops/fls64.h>
>  #include <asm-generic/bitops/sched.h>
> -#include <asm-generic/bitops/ffs.h>
>  
>  #include <asm-generic/bitops/hweight.h>
>  
> diff --git a/drivers/bitopstest/Kconfig b/drivers/bitopstest/Kconfig
> index d0e2af4b801e..6ef6dcd41d49 100644
> --- a/drivers/bitopstest/Kconfig
> +++ b/drivers/bitopstest/Kconfig
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  menuconfig BITOPSTEST
>  	tristate "self test for bitops optimization"
> +	default y
>  	help
>  	  Enable this to test the bitops APIs.

Is this a test you wanted to add? The source code isn't included.

- Charlie

>  
> diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
> index a1157c2a7170..d68cacd4e3af 100644
> --- a/drivers/firmware/efi/libstub/Makefile
> +++ b/drivers/firmware/efi/libstub/Makefile
> @@ -28,7 +28,7 @@ cflags-$(CONFIG_ARM)		+= -DEFI_HAVE_STRLEN -DEFI_HAVE_STRNLEN \
>  				   -DEFI_HAVE_MEMCHR -DEFI_HAVE_STRRCHR \
>  				   -DEFI_HAVE_STRCMP -fno-builtin -fpic \
>  				   $(call cc-option,-mno-single-pic-base)
> -cflags-$(CONFIG_RISCV)		+= -fpic
> +cflags-$(CONFIG_RISCV)		+= -fpic -DNO_ALTERNATIVE
>  cflags-$(CONFIG_LOONGARCH)	+= -fpie
>  
>  cflags-$(CONFIG_EFI_PARAMS_FROM_FDT)	+= -I$(srctree)/scripts/dtc/libfdt
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
