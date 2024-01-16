Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF8DC47077
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jan 2024 15:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNcKfKjmy/LkgOSEUnhZt3bC1PzVcpVcF8seaLyb23Y=; b=de47jc0FggJixf
	76ForqYdaXS73WKhva4JlymUN+WhPJbQ3j64zZMbX/GLs96AYDWf2eJ4V28+vAPewb7lDC0ICQ0qU
	pHd2c1j+nPjjwvM+h5QrLlfj4aqjG1JQo2mQ1RoYsDQUKzxAuCK4MIDqvrbWZcrlW2RKoY7tqo3PV
	36QmgAxPsuqnn6Zu+0XNKmmmguz+VXruuzfiLq8a+I1XeyNzSOZ/ZJag8jGIWVftX5EY4xxrBwlrm
	Cj0hXJ3dgzmoMdt+vYCb9e9qPwqv/9Ayl1DNvAxyatfahCsCgpyBzrcjtghm/kPBZ1O7leLp2zNoA
	HShJCdBi78hGrD0dcJnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPkzC-00CLnh-1i;
	Tue, 16 Jan 2024 15:04:18 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPkz8-00CLn7-1h
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jan 2024 15:04:16 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2cd880ceaf2so59076541fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jan 2024 07:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705417450; x=1706022250; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KZObLbH50jWGDNCNNEMPuR9WvYua1JEOsUGWqN7w/1c=;
        b=OYkU3cLXCHmzqeqRji8TtXUfK4odS2HtcEqwI46wnI0In0aA/Atk3SCyPhYbX4qI3R
         bL9onV8pUaHpIj+fe3KVylskH/haJvlVIFXwtqy8cj/YG4oNAdYokxYtGpeAqsuJCbmi
         iDE7fqTIvUKZx3lMwdHHKzuD3EiroH5DI/zrBEXFsN/SpCW7pxIBXl0CJpkrEbUlOB73
         vGtT5aGUTWCNWzk+veB6NHSyzh/wNxa8X/Z2phnmSBNHjDzGVBBoXrrUXIxe0JftBcB4
         tXA8YMha6+tHA0ItifF2LrlXbfyv1I0zJ5/Wrxgbn0mbRd66DQKIeOE+Bg/diViSLkzQ
         6Dnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705417450; x=1706022250;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZObLbH50jWGDNCNNEMPuR9WvYua1JEOsUGWqN7w/1c=;
        b=OxNnt21OIK4TO2/pw4TwBub5aCuBDTthkAdnKTRPpTnZRM/Uwn4LGsQbhPNMMleM5n
         a6DGnFIqpaAwMqLW/PEqfjv0To4+iHX6KXzLerTZgtcYeV/9aJPyTjQPDVP20+3wusto
         8D0ZmGj5tG/dIM2J4JaCBJWWxSKR4Wisa8UTOp3n4NkJPidUw2r+4Z1vWLY6tCnXRuB2
         cSkOmLgaM4zmsMUFl8CUl46Y0ZtObkNALPNERaqrB/qFC/zvvMA90OIwM6+sGXD5qH83
         WfK3jeN64ybDVaZVHwxNU5N99II9MWXc0VhabLdjU608k4T+nStclgr+I0cqdveXU29c
         9Xdw==
X-Gm-Message-State: AOJu0Yxh1uLkAXx7l7ns5noTURBjYIjhH4QbW25ffGCYWd+cU6vJNSxO
	5O0JzNGvcXJvhreudbIkNi9VdU/qgOA4Sg==
X-Google-Smtp-Source: AGHT+IFze1yvXUIStG9IAEYe4ZfyGuJQ3Hn+kkqjQ4DOfInluQBD4+vrj7DhqXAwXsSlpR4SCc6kyw==
X-Received: by 2002:a2e:b454:0:b0:2cd:52a5:88ec with SMTP id o20-20020a2eb454000000b002cd52a588ecmr3463178ljm.9.1705417450385;
        Tue, 16 Jan 2024 07:04:10 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ew3-20020a056402538300b00558a1937dddsm6688768edb.63.2024.01.16.07.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jan 2024 07:04:09 -0800 (PST)
Date: Tue, 16 Jan 2024 16:04:09 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Xiao Wang <xiao.w.wang@intel.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	conor.dooley@microchip.com, heiko@sntech.de, haicheng.li@intel.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Optimize crc32 with Zbc extension
Message-ID: <20240116-9f09b002afc2337ab5e41e3f@orel>
References: <20240105080830.3738117-1-xiao.w.wang@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240105080830.3738117-1-xiao.w.wang@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240116_070414_575664_54B56C3D 
X-CRM114-Status: GOOD (  44.05  )
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

On Fri, Jan 05, 2024 at 04:08:30PM +0800, Xiao Wang wrote:
> As suggested by the B-ext spec, the Zbc (carry-less multiplication)
> instructions can be used to accelerate CRC calculations. Currently, the
> crc32 is the most widely used crc function inside kernel, so this patch
> focuses on the optimization of just the crc32 APIs.
> 
> Compared with the current table-lookup based optimization, Zbc based
> optimization can also achieve large stride during CRC calculation loop,
> meantime, it avoids the memory access latency of the table-lookup based
> implementation and it reduces memory footprint.
> 
> If Zbc feature is not supported in a runtime environment, then the
> table-lookup based implementation would serve as fallback via alternative
> mechanism. To avoid the performance concern of unalignment access, we also
> use the fallback implementation to handle the head and tail bytes if any,
> the main body is accelerated by Zbc extension.
> 
> This patch is tested on QEMU VM with the kernel CRC32 selftest.

Ideally we'd also have the results of some benchmarks, or at least a
dynamic instruction count or something, but I don't suspect that the
table-lookup would "win" over Zbc. The bigger question is whether we
want three implementations, because I assume we want Zvbc, particularly
since [1] says

"""
Zvbc is listed as a development option for use in other algorithms,
and will become mandatory. Scalar Zbc is now listed as an expansion
option, i.e., it will probably not become mandatory.
"""

[1] https://github.com/riscv/riscv-profiles/blob/main/rva23-profile.adoc


A few nits below.

> 
> Signed-off-by: Xiao Wang <xiao.w.wang@intel.com>
> ---
>  arch/riscv/Kconfig      |  23 +++++
>  arch/riscv/lib/Makefile |   1 +
>  arch/riscv/lib/crc32.c  | 216 ++++++++++++++++++++++++++++++++++++++++
>  include/linux/crc32.h   |   3 +
>  4 files changed, 243 insertions(+)
>  create mode 100644 arch/riscv/lib/crc32.c
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 95a2a06acc6a..d8b4fb697df2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -549,6 +549,29 @@ config RISCV_ISA_ZBB
>  
>  	   If you don't know what to do here, say Y.
>  
> +config TOOLCHAIN_HAS_ZBC
> +	bool
> +	default y
> +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbc)
> +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbc)
> +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> +	depends on AS_HAS_OPTION_ARCH
> +
> +config RISCV_ISA_ZBC
> +	bool "Zbc extension support for carry-less multiplication instructions"
> +	depends on TOOLCHAIN_HAS_ZBC
> +	depends on MMU
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the Zbc
> +	   extension (carry-less multiplication) and enable its usage.
> +
> +	   The Zbc extension could accelerate CRC (cyclic redundancy check)
> +	   calculations.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config RISCV_ISA_ZICBOM
>  	bool "Zicbom extension support for non-coherent DMA operation"
>  	depends on MMU
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 26cb2502ecf8..183bf2097d57 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -9,5 +9,6 @@ lib-y			+= strncmp.o
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
>  lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
> +lib-$(CONFIG_RISCV_ISA_ZBC)	+= crc32.o
>  
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> diff --git a/arch/riscv/lib/crc32.c b/arch/riscv/lib/crc32.c
> new file mode 100644
> index 000000000000..1a24994df826
> --- /dev/null
> +++ b/arch/riscv/lib/crc32.c
> @@ -0,0 +1,216 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Accelerated CRC32 implementation with Zbc extension.
> + *
> + * Copyright (C) 2024 Intel Corporation
> + *
> + * Authors:
> + *     Xiao Wang <xiao.w.wang@intel.com>
> + */
> +
> +#include <asm/hwcap.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/byteorder.h>
> +
> +#include <linux/types.h>
> +#include <linux/crc32poly.h>
> +#include <linux/crc32.h>
> +#include <linux/byteorder/generic.h>
> +
> +#define MIN(a, b) ((a) < (b) ? (a) : (b))

min() from linux/minmax.h?

> +
> +#if (BITS_PER_LONG == 64)

I think riscv prefers

 #if __riscv_xlen == 64

In any case, the () are unnecessary.

> +/* Slide by XLEN bits per iteration */
> +# define STEP_ORDER 3
> +
> +/* Each below polynomial quotient has an implicit bit for 2^XLEN */
> +
> +/* Polynomial quotient of (2^(XLEN+32))/CRC32_POLY, in LE format */
> +# define CRC32_POLY_QT_LE	0x5a72d812fb808b20
> +
> +/* Polynomial quotient of (2^(XLEN+32))/CRC32C_POLY, in LE format */
> +# define CRC32C_POLY_QT_LE	0xa434f61c6f5389f8
> +
> +/* Polynomial quotient of (2^(XLEN+32))/CRC32_POLY, in BE format, it should be
> + * the same as the bit-reversed version of CRC32_POLY_QT_LE
> + */
> +# define CRC32_POLY_QT_BE	0x04d101df481b4e5a
> +#elif (BITS_PER_LONG == 32)
> +# define STEP_ORDER 2
> +/* Each quotient should match the upper half of its analog in RV64 */
> +# define CRC32_POLY_QT_LE	0xfb808b20
> +# define CRC32C_POLY_QT_LE	0x6f5389f8
> +# define CRC32_POLY_QT_BE	0x04d101df
> +#else
> +# error "Unexpected BITS_PER_LONG"
> +#endif
> +
> +#define STEP (1 << STEP_ORDER)
> +#define OFFSET_MASK (STEP - 1)

Should tab out the values of these defines so they line up.

> +
> +/*
> + * Refer to https://www.corsix.org/content/barrett-reduction-polynomials for
> + * better understanding of how this math works.

Thanks for this pointer. I read it, but I didn't digest it enough to
understand it, which means my review isn't confirming the math is
correct.

> + *
> + * let "+" denotes polynomial add (XOR)
> + * let "-" denotes polynomial sub (XOR)
> + * let "*" denotes polynomial multiplication
> + * let "/" denotes polynomial floor division
> + * let "S" denotes source data, XLEN bit wide
> + * let "P" denotes CRC32 polynomial
> + * let "T" denotes 2^(XLEN+32)
> + * let "QT" denotes quotient of T/P, with the bit for 2^XLEN being implicit
> + *
> + * crc32(S, P)
> + * => S * (2^32) - S * (2^32) / P * P
> + * => lowest 32 bits of: S * (2^32) / P * P
> + * => lowest 32 bits of: S * (2^32) * (T / P) / T * P
> + * => lowest 32 bits of: S * (2^32) * quotient / T * P
> + * => lowest 32 bits of: S * quotient / 2^XLEN * P
> + * => lowest 32 bits of: (clmul_high_part(S, QT) + S) * P
> + * => clmul_low_part(clmul_high_part(S, QT) + S, P)
> + *
> + * In terms of below implementations, the BE case is more intuitive, since the
> + * higher order bit sits at more significant position.
> + */
> +
> +typedef u32 (*fallback)(u32 crc, unsigned char const *p, size_t len);
> +
> +static inline u32 __pure crc32_le_generic(u32 crc, unsigned char const *p,
> +#if (BITS_PER_LONG == 64)
> +					  size_t len, u32 poly, u64 poly_qt,
> +#else
> +					  size_t len, u32 poly, u32 poly_qt,
> +#endif

How about creating a new type for poly_qt, defined as u64 for xlen=64
and u32 for xlen=32 to avoid the #ifdef?

> +					  fallback crc_fb)
> +{
> +	size_t offset, head_len, tail_len;
> +	const unsigned long *p_ul;
> +	unsigned long s;
> +
> +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> +				      RISCV_ISA_EXT_ZBC, 1)
> +			  : : : : legacy);
> +
> +	/* Handle the unalignment head. */
> +	offset = (unsigned long)p & OFFSET_MASK;
> +	if (offset) {
> +		head_len = MIN(STEP - offset, len);
> +		crc = crc_fb(crc, p, head_len);
> +		len -= head_len;
> +		p += head_len;
> +	}
> +
> +	tail_len = len & OFFSET_MASK;
> +	len = len >> STEP_ORDER;
> +	p_ul = (unsigned long *)p;
> +
> +	for (int i = 0; i < len; i++) {
> +#if (BITS_PER_LONG == 64)
> +		s = (unsigned long)crc ^ __cpu_to_le64(*p_ul++);
> +		/* We don't have a "clmulrh" insn, so use clmul + slli instead.
> +		 */

need opening /* comment wing

> +		asm volatile (".option push\n"
> +			      ".option arch,+zbc\n"
> +			      "clmul	%0, %1, %2\n"
> +			      "slli	%0, %0, 1\n"
> +			      "xor	%0, %0, %1\n"
> +			      "clmulr	%0, %0, %3\n"
> +			      "srli	%0, %0, 32\n"
> +			      ".option pop\n"
> +			      : "=&r" (crc)
> +			      : "r" (s),
> +				"r" (poly_qt),
> +				"r" ((u64)poly << 32)
> +			      :);
> +#else
> +		s = crc ^ __cpu_to_le32(*p_ul++);
> +		/* We don't have a "clmulrh" insn, so use clmul + slli instead.

also here

> +		 */
> +		asm volatile (".option push\n"
> +			      ".option arch,+zbc\n"
> +			      "clmul	%0, %1, %2\n"
> +			      "slli	%0, %0, 1\n"
> +			      "xor	%0, %0, %1\n"
> +			      "clmulr	%0, %0, %3\n"
> +			      ".option pop\n"
> +			      : "=&r" (crc)
> +			      : "r" (s),
> +				"r" (poly_qt),
> +				"r" (poly)
> +			      :);
> +#endif

Instead of the #ifdef here, we could provide function wrappers for the asm
which would be defined above in the first #ifdef ladder.

> +	}
> +
> +	/* Handle the tail bytes. */
> +	if (tail_len)
> +		crc = crc_fb(crc, (unsigned char const *)p_ul, tail_len);
> +	return crc;
> +
> +legacy:
> +	return crc_fb(crc, p, len);
> +}
> +
> +u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len)
> +{
> +	return crc32_le_generic(crc, p, len, CRC32_POLY_LE, CRC32_POLY_QT_LE,
> +				crc32_le_base);
> +}
> +
> +u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len)
> +{
> +	return crc32_le_generic(crc, p, len, CRC32C_POLY_LE,
> +				CRC32C_POLY_QT_LE, __crc32c_le_base);
> +}
> +
> +u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len)
> +{
> +	size_t offset, head_len, tail_len;
> +	const unsigned long *p_ul;
> +	unsigned long s;
> +
> +	asm_volatile_goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
> +				      RISCV_ISA_EXT_ZBC, 1)
> +			  : : : : legacy);
> +
> +	/* Handle the unalignment head. */
> +	offset = (unsigned long)p & OFFSET_MASK;
> +	if (offset) {
> +		head_len = MIN(STEP - offset, len);
> +		crc = crc32_be_base(crc, p, head_len);
> +		len -= head_len;
> +		p += head_len;
> +	}
> +
> +	tail_len = len & OFFSET_MASK;
> +	len = len >> STEP_ORDER;
> +	p_ul = (unsigned long *)p;
> +
> +	for (int i = 0; i < len; i++) {
> +#if (BITS_PER_LONG == 64)
> +		s = (unsigned long)crc << 32;
> +		s ^= __cpu_to_be64(*p_ul++);
> +#else
> +		s = crc ^ __cpu_to_be32(*p_ul++);
> +#endif

Could write the above without #ifdef with

 if (IS_ENABLED(CONFIG_64BIT)) {
    ...
 } else {
    ...
 }

> +		asm volatile (".option push\n"
> +			      ".option arch,+zbc\n"
> +			      "clmulh	%0, %1, %2\n"
> +			      "xor	%0, %0, %1\n"
> +			      "clmul	%0, %0, %3\n"
> +			      ".option pop\n"
> +			      : "=&r" (crc)
> +			      : "r" (s),
> +				"r" (CRC32_POLY_QT_BE),
> +				"r" (CRC32_POLY_BE)
> +			      :);
> +	}
> +
> +	/* Handle the tail bytes. */
> +	if (tail_len)
> +		crc = crc32_be_base(crc, (unsigned char const *)p_ul, tail_len);
> +	return crc;
> +
> +legacy:
> +	return crc32_be_base(crc, p, len);
> +}
> diff --git a/include/linux/crc32.h b/include/linux/crc32.h
> index 9e8a032c1788..87f788c0d607 100644
> --- a/include/linux/crc32.h
> +++ b/include/linux/crc32.h
> @@ -9,7 +9,9 @@
>  #include <linux/bitrev.h>
>  
>  u32 __pure crc32_le(u32 crc, unsigned char const *p, size_t len);
> +u32 __pure crc32_le_base(u32 crc, unsigned char const *p, size_t len);
>  u32 __pure crc32_be(u32 crc, unsigned char const *p, size_t len);
> +u32 __pure crc32_be_base(u32 crc, unsigned char const *p, size_t len);
>  
>  /**
>   * crc32_le_combine - Combine two crc32 check values into one. For two
> @@ -37,6 +39,7 @@ static inline u32 crc32_le_combine(u32 crc1, u32 crc2, size_t len2)
>  }
>  
>  u32 __pure __crc32c_le(u32 crc, unsigned char const *p, size_t len);
> +u32 __pure __crc32c_le_base(u32 crc, unsigned char const *p, size_t len);
>  
>  /**
>   * __crc32c_le_combine - Combine two crc32c check values into one. For two
> -- 
> 2.25.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
