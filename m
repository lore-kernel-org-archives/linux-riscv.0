Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7515CC25B47
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 06:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GjFP4nRsvMi0hcO68ssQdYfloq8AGnsSbJJ7ie6WegU=; b=1DuO31O88Xt9XE
	m97Si7XTe/Op62lg0fw3VCHm1tbBqBEjoKfurqhfnYm91/HQoJNUAzzIf8WzqBTu0Aaz4TWDdbh8K
	CIOjyJTZoXZs0c5dMHmLV+Ns5mz04YiCyk/JMjgbzWvYynuvpXe38J/vYvcUDM/VGam6hjBEaxisv
	jUfqTT5XKEuxfSGU0rxApungiKrAp8nvrBQd3jKZ1BFz3fF+dwSq0jfyEfPMpXIOd+6Js2XMqp9o8
	q9k9pLcXImNgixmY1O3EJ4EsHiPLVXzbXs19d+z4lPkXCgdKdNOGWFSUlvip/DV4lbKKJLtNHw/CA
	CjRXP5u1Qja0aOK6IUsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwGH2-00Fg1W-1y;
	Fri, 27 Oct 2023 06:24:48 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwGGy-00Fg0c-07
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 06:24:46 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-28010522882so122578a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Oct 2023 23:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1698387882; x=1698992682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m/1+2Org+HUdzphpjgQxHya0pQZCLqwEr7eM4fM+ags=;
        b=cKrVatvY6JtyIOXrPEX+NsdDr4cAS2cDSwaTYij8wDnmSNNKrTFf8QeX/DGB/O2Spk
         7DdEXE1cip+4R5DkbY7R4CnsqQvXkzhEAlkG1jXy/eA5TVDkmcT/ORcw+dJQ+PdMxomi
         ufwEruvF1O7/QvcVE+OE8xhEXoDL1Dta2pOqASol46FaQmq1F5AlVKiAYeKe8aSfv9Dp
         gjzPoYD7aniaGQk4WtyJHFVEXLh4wz3Kuxu1NaS9AgoDe4Gyk83t9VPyJDgqVfcSUwDF
         DWNjEUSbh6edUO0B9MozVAEOUgfAbGKl/tQM0hhwRZk02fh/MExgdffJ3NvLtg0BXccN
         IrnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698387882; x=1698992682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m/1+2Org+HUdzphpjgQxHya0pQZCLqwEr7eM4fM+ags=;
        b=YVuDWsHB7aK/rrlGIdY72mzFbD1DtbfB0FtzptNWKnCJMfWNzIL/h8okQRAYpzLa2/
         8UlS+SNwgBUdyOhxuBJlmscvYbhTAnJVFCeCsAhf9kOm/3Ua5z8MFmacBJ2LRHMcWqEL
         bwdIoGlhRY5mbtqurQLtLzi+Vfgrk/AVdxpaNTj2lbLklnzgbAUGVzsPWQJwccKDaMdt
         lsYboBL5AynTg12uTUTPjLcjE2pP/jl/wGx2t8hOe6fL+HDQjGi1e+dcNcI9pYzPpUXc
         ozXNAFp2IPjvrOl3KqFM6zTfPRL0cGTKZfnTVveWJ5zDXeCEK35qwh0MKhh1uDspO1f9
         VgtQ==
X-Gm-Message-State: AOJu0YyDhAghBvb+ANR4DXlSzd3SoHBe8lzgKe31ZNAS+bk3gDjGmYGz
	P+VqpOE2ABmXvLdnUFMPRSP2Gg==
X-Google-Smtp-Source: AGHT+IEXpMoigp46bv/9xLednIkJmxXn1P+zuqlkPr25L8zeynBTmjXMBJzy7BK0AeO0D4RAUb1CyQ==
X-Received: by 2002:a17:90a:7525:b0:27d:247b:2c3c with SMTP id q34-20020a17090a752500b0027d247b2c3cmr1831073pjk.23.1698387881994;
        Thu, 26 Oct 2023 23:24:41 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:6a7f:e823:958a:bc95])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a195e00b0027cfd582b51sm2909553pjh.3.2023.10.26.23.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:24:41 -0700 (PDT)
Date: Thu, 26 Oct 2023 23:24:39 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	ardb@kernel.org, anup@brainfault.org, haicheng.li@intel.com,
	ajones@ventanamicro.com, yujie.liu@intel.com,
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] riscv: Optimize bitops with Zbb extension
Message-ID: <ZTtXp/jhzvjGqBTT@ghost>
References: <20230926094655.3102758-1-xiao.w.wang@intel.com>
 <20230926094655.3102758-3-xiao.w.wang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230926094655.3102758-3-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_232444_419144_058A7772 
X-CRM114-Status: GOOD (  34.06  )
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

On Tue, Sep 26, 2023 at 05:46:55PM +0800, Xiao Wang wrote:
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
>  arch/riscv/include/asm/bitops.h       | 266 +++++++++++++++++++++++++-
>  drivers/firmware/efi/libstub/Makefile |   2 +-
>  2 files changed, 264 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
> index 3540b690944b..c97e774cb647 100644
> --- a/arch/riscv/include/asm/bitops.h
> +++ b/arch/riscv/include/asm/bitops.h
> @@ -15,13 +15,273 @@
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
> +	asm volatile (
> +		".option push\n"
> +		".option arch,+zbb\n"
> +		"ctz %0, %1\n"
> +		".option pop\n"
> +		: "=r" (word) : "r" (word) :);
> +
> +	return word;

That's so clean!

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
> +	asm_volatile_goto(
> +		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
> +		: : : : legacy);
> +
> +	asm volatile (
> +		".option push\n"
> +		".option arch,+zbb\n"
> +		"bnez %1, 1f\n"
> +		"li %0, 0\n"
> +		"j 2f\n"
> +		"1:\n"
> +		CTZW "%0, %1\n"
> +		"addi %0, %0, 1\n"
> +		"2:\n"
> +		".option pop\n"
> +		: "=r" (r) : "r" (x) :);
> +
> +	return r;
> +

I generally like to move as much code out of asm as possible. You are
also able to remove one of the branches if you rearrange as follows:

if (!x)
	return 0;

asm volatile (
	".option push\n"
        ".option arch,+zbb\n"
        CTZW "%0, %1\n"
        ".option pop\n"
        : "=r" (r) : "r" (x) :);

return r + 1;

You could then also extract out the "if (!x)" at the beginning of the
legacy section at put it at the top of the function.

> +legacy:
> +	r = 1;
> +	if (!x)
> +		return 0;
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
> +	asm_volatile_goto(
> +		ALTERNATIVE("j %l[legacy]", "nop", 0, RISCV_ISA_EXT_ZBB, 1)
> +		: : : : legacy);
> +
> +	asm volatile (
> +		".option push\n"
> +		".option arch,+zbb\n"
> +		"bnez %1, 1f\n"
> +		"li %0, 0\n"
> +		"j 2f\n"
> +		"1:\n"
> +		CLZW "%0, %1\n"
> +		"neg %0, %0\n"
> +		"addi %0, %0, 32\n"
> +		"2:\n"
> +		".option pop\n"
> +		: "=r" (r) : "r" (x) :);
> +
> +	return r;
> +

Same comment as above but with appropriate changes.

> +legacy:
> +	r = 32;
> +	if (!x)
> +		return 0;
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
> +#endif

As a nit, it's nice when large #ifdef blocks have a comment like

/* !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE) */

Overall great changes, just that small optimization to get rid of the
jump.

- Charlie

> +
> +#include <asm-generic/bitops/ffz.h>
>  #include <asm-generic/bitops/fls64.h>
>  #include <asm-generic/bitops/sched.h>
> -#include <asm-generic/bitops/ffs.h>
>  
>  #include <asm-generic/bitops/hweight.h>
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
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
