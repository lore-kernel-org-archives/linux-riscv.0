Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876FDF4369C
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2026 13:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MzLVWuBZ6/XhYh1zlCLcv1zdHn7Ya7AUgpTDvGLXCU=; b=1OM8YuuUWI3m1q
	N8tEO8D5VmeurhOaSulFySR50NaSPO3ieui37xTzsHXWFLX2REOj3kQ5nXA5zm0Vm/TTjDnuDHhxe
	SrRJnUCtGlUAoc/3AX7KHuvHA/9/vI6Zo0FTjz2HfdD3xxZSP/0zMCUPnn6KjaxkaVb/BfncDe6le
	1lmyeKU2R1ZPLZ8WZKlVcU1VJdAk1nFeOew9x1gfyUbNt4oaLzL83RC1S1BIu+psYUkuY+/plXkhP
	GDad/3l11upRW20HVNmaIUuQfMHz7i79dVR+6IecXUxuaZb79iEiBHfJ6bQG8RhgN+UxfcIzpseJL
	heqSA1iRbXbWLk9YRmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDj4q-000000044sm-2G9F;
	Fri, 17 Apr 2026 13:17:44 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDj4n-000000044s8-0W18
	for linux-riscv@lists.infradead.org;
	Fri, 17 Apr 2026 13:17:42 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-b9358bc9c50so107297766b.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Apr 2026 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776431858; x=1777036658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UABl9nq8984zfp4fbqeJUZW99tYPErqX1nIpSgG/cso=;
        b=OEvd8PGEW+okrAcAhuDShRB3HmYLCO8DXWVUjuY5P0LhKQwZefGgpH24EgS5D851ir
         r2zOLUBcF0KWpaihQyL2/YFzmEa3DlFpe9VCaZQ0Uus5oPNAj9BC/VJFYCD9ECHcKVVr
         WMbjTANS9MFKnWwOYSUo+3CHsQbcrPUJw1ynVnia2187+kFh64mftIIZ9JQCH9Wj9Q/k
         aLh7+ZGTSq6+u7I4uPqRuBgyhhxw3NbOgDWbm25EmzfZ23MLkLpPeGC6ustJRoo35cAw
         iiAk6WuFbzXVeIdmWeEfXg4+K9QLP6r3bmX4fA9W26vhE1CwQQzYMwuIGlmxXp2UnndR
         We4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431858; x=1777036658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UABl9nq8984zfp4fbqeJUZW99tYPErqX1nIpSgG/cso=;
        b=E0o6ljW0vgK53O+DUDkGidLlqvEfEcacrBO95Pz5OIZi5zeeiegGs02sFBfvHNrI4H
         MjcV8vvgLRw7oWedrTaiSzMLMr0QvVTy2kk2mdRzIiT/kx/1B9VB92ZXT72YEw+iF+u9
         cFUrJ3GUc+sHldDYcXNMw2kPGBs9lYLj2arxxqGQUc8JD313nxbn9d/dfElwJNs8Bn6O
         C4Qy9Rod0qYRRxg9Uks6W422Je30AcdzGO05rYUcpoQdWb6fkIj+hdhesQ4h/yxH7uUr
         N0MTb7pqGoOmsHat0qTn1FlUfD0OF6Grhn0AEXiIENjdH+zgsoebQz04Z+3Y2/vEifXF
         du8Q==
X-Forwarded-Encrypted: i=1; AFNElJ+N9kUselTJmzAvWeap0c5+gCWyV/3WsAwzvo39/aYkNaIXlbalMcxhx5lg8TYKuxQMM7glS4vuhYKQJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxck7EkQ4c0/pcKzGWCBsMWHNH2dwUhQCUDZBxSmatNX8/fEpxo
	OsPbOqrdWcnmFL1MXFIzAc27euceCtA/U7cq2fkz2M0EDBcv7DSKyRc7
X-Gm-Gg: AeBDiesN5ud1scCNMAXJXtgAQYUxsCIYkFe1psu3bTADnCVCbQt1orqtDqlj1nNI7ca
	f2YMeNfx08jTnHK8hxBu/H3ggyCFneTolm/2qjSQLkI5Rx5RGsYp8cD5SAz0ebBiGX7VOv6rP5z
	s0S8tnSKL1P/vFUJcokGM0bP/WSjOD7W1RYu2WbMoxUh5KSYyjwDiPnA9u7NdKaK4pzo0oIIZdp
	mn3S0EHo9TsFYzLGY1Mmb54DH9gzEvZbaVLRQaPSpZi15watR0KZXYKRTqZmYhTDZSqTI2P6IuR
	/cuvp2np8KewhgnUqqLuuYX2e0MEMfIClkMKBB6uNZ3HWjD5RUMuUWXanG7e0XocsxbYzolt/m3
	HP2PY0Y5HR/JxhVA2z5JC/x4pfHw9w6l9JBnjJC3GGOi8kncK5jAGaA4FdhzAefcPPuj9Bb+97n
	GarScLafKvpNJwlaEykP4q/o12okatCHYWeohwEvf6h++1LAfiaLts0pkTiLM2rtgjOPcjlxYAc
	bE=
X-Received: by 2002:a17:906:59a8:b0:b9d:c34f:2a2b with SMTP id a640c23a62f3a-ba41b3dffb6mr110834266b.40.1776431858275;
        Fri, 17 Apr 2026 06:17:38 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d6casm4104912f8f.32.2026.04.17.06.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:17:37 -0700 (PDT)
Date: Fri, 17 Apr 2026 14:17:36 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <alex@ghiti.fr>, <yury.norov@gmail.com>, <linux@rasmusvillemoes.dk>,
 <arnd@arndb.de>, <akpm@linux-foundation.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arch@vger.kernel.org>, <nathan@kernel.org>
Subject: Re: [PATCH v3 2/2] arch/riscv: Add bitrev.h file to support rev8
 and brev8
Message-ID: <20260417141736.33a993e7@pumpkin>
In-Reply-To: <20260417093102.3812978-3-ruanjinjie@huawei.com>
References: <20260417093102.3812978-1-ruanjinjie@huawei.com>
	<20260417093102.3812978-3-ruanjinjie@huawei.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_061741_188524_53C0E3AD 
X-CRM114-Status: GOOD (  23.15  )
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

On Fri, 17 Apr 2026 17:31:02 +0800
Jinjie Ruan <ruanjinjie@huawei.com> wrote:

> The RISC-V Bit-manipulation Extension for Cryptography (Zbkb) provides
> the 'brev8' instruction, which reverses the bits within each byte.
> Combined with the 'rev8' instruction (from Zbb or Zbkb), which reverses
> the byte order of a register, we can efficiently implement 16-bit,
> 32-bit, and (on RV64) 64-bit bit reversal.
> 
> This is significantly faster than the default software table-lookup
> implementation in lib/bitrev.c, as it replaces memory accesses and
> multiple arithmetic operations with just two or three hardware
> instructions.
> 
> Select HAVE_ARCH_BITREVERSE and provide <asm/bitrev.h> to utilize
> these instructions when the Zbkb extension is available at runtime
> via the alternatives mechanism.
> 
> Link: https://docs.riscv.org/reference/isa/unpriv/b-st-ext.html
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/bitrev.h | 55 +++++++++++++++++++++++++++++++++
>  2 files changed, 56 insertions(+)
>  create mode 100644 arch/riscv/include/asm/bitrev.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 90c531e6abf5..05f2b2166a83 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -128,6 +128,7 @@ config RISCV
>  	select HAS_IOPORT if MMU
>  	select HAVE_ALIGNED_STRUCT_PAGE
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_BITREVERSE if RISCV_ISA_ZBKB
>  	select HAVE_ARCH_HUGE_VMALLOC if HAVE_ARCH_HUGE_VMAP
>  	select HAVE_ARCH_HUGE_VMAP if MMU && 64BIT
>  	select HAVE_ARCH_JUMP_LABEL if !XIP_KERNEL
> diff --git a/arch/riscv/include/asm/bitrev.h b/arch/riscv/include/asm/bitrev.h
> new file mode 100644
> index 000000000000..eef263cc6655
> --- /dev/null
> +++ b/arch/riscv/include/asm/bitrev.h
> @@ -0,0 +1,55 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ASM_BITREV_H
> +#define __ASM_BITREV_H
> +
> +#include <linux/types.h>
> +#include <asm/cpufeature-macros.h>
> +#include <asm/hwcap.h>
> +#include <asm-generic/bitops/__bitrev.h>
> +
> +static __always_inline __attribute_const__ u32 __arch_bitrev32(u32 x)
> +{
> +	unsigned long result = (unsigned long)x;

Just:
	unsigned long result;

> +
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
> +		return generic___bitrev32(x);
> +
> +	asm volatile(
> +		".option push\n"
> +		".option arch,+zbkb\n"
> +		"rev8 %0, %0\n"

Replace the source with %1

> +		"brev8 %0, %0\n"
> +		".option pop"
> +		: "+r" (result)

then:
		: "=r" (result) : "r" ((long)x)
it is likely to save a register-register move

> +	);
> +
> +#if __riscv_xlen == 64
> +	return (u32)(result >> 32);
> +#else
> +	return (u32)result;
> +#endif

There is no need to either cast, and the kernel style doesn't need them.
(Filling code with casts that match the implicit conversions just makes
it harder to find/check the ones that are absolutely necessary and actually
change the behaviour.)
You could just do:
	return result >> (__riscv_xlen - 32);

> +}
> +
> +static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
> +{
> +	return __arch_bitrev32((u32)x) >> 16;

Kill the cast.

> +}
> +
> +static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
> +{
> +	unsigned long result = (unsigned long)x;
> +
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
> +		return generic___bitrev8(x);
> +
> +	asm volatile(
> +		".option push\n"
> +		".option arch,+zbkb\n"
> +		"brev8 %0, %0\n"
> +		".option pop"
> +		: "+r" (result)

Use "=r" (result) : "r" ((long)x) again

> +	);
> +
> +	return (u8)result;

Kill another cast.

> +}
> +#endif


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
