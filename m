Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C25EF8E48F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Apr 2026 23:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YHOLvzqfxhHNq73SkPOMjKwjc9tTdTmQHqrw2hvYghQ=; b=cDZHFfhAeMq9p/
	ex8xkxVUv3VxLjTqXtldDsKlxGJCinOyCpLshU4Axb3itCiJL8KKJUFXMqnixjGepo23GwNRkiQru
	CoJRXIIod0xKskxITjC1KuiBEqSi3+61AJZ+9NTt9/9TFmIOVaFFbwXH7vLyfhqCGvyXKfQVy8O1z
	QcsloD5eO9pwr3mPET7Mad8nu8zYMDy0P180nbB2gAk388lhJwUNT7O+BuK4M3jeV0EJitK5jJl+c
	7xxTfSHbt1AqowNcDAOhJLqnOXVcbZcjHMba0y5B8+zGCy2KFo7zhKP+2Auf3x2BMna0RNrl52KYF
	7iNpTkZJ7HJhJRdjpLhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVv8-00000003AWr-0lIk;
	Thu, 16 Apr 2026 23:14:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDVv6-00000003AWd-0Anj
	for linux-riscv@lists.infradead.org;
	Thu, 16 Apr 2026 23:14:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B72A460128;
	Thu, 16 Apr 2026 23:14:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EA7C2BCAF;
	Thu, 16 Apr 2026 23:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776381286;
	bh=RhsfpYz074F1zePwsOPGjbA5V2kooOyckVK4f6GXIk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NTMIg5lc3fADC3RVjtb/nXqcZ9BcKgCzLhBR3tkx8LcPqe8Ad2YkIiSZAhMyphak0
	 eNk+m+KBWBde1BDwzsFNm2J8pe/CPA8qdHqCelvAHvwPlnIWSErK8xnx9A8UBoFKCi
	 qJ9trDIUsDxdC7HhK1Vn05v3RmIe7x8aWKetbM1mXT6xFuXIifk8qsFUS5cSnHe/jz
	 XNtMpOXtTIKmmKqqCKnksphbrE/uqkch1UYmQ7eDaQyO0yp8QmEzTWhw9uUowTpTL+
	 Y2lAz6mv8IhFAEioFlRSnBgwi6Tz16gpjzRCYetdHjoPfbod13MyX2BUg20EdDlMNY
	 dva47sy68HDDQ==
Date: Thu, 16 Apr 2026 16:14:41 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>, yury.norov@gmail.com
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux@rasmusvillemoes.dk, arnd@arndb.de,
	cp0613@linux.alibaba.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arch/riscv: Add bitrev.h file to support rev8 and
 brev8
Message-ID: <20260416231441.GA12905@ax162>
References: <20260415093827.2776328-1-ruanjinjie@huawei.com>
 <20260415093827.2776328-3-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260415093827.2776328-3-ruanjinjie@huawei.com>
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

On Wed, Apr 15, 2026 at 05:38:27PM +0800, Jinjie Ruan wrote:
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
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/bitrev.h | 41 +++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
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
> index 000000000000..9f205ac84796
> --- /dev/null
> +++ b/arch/riscv/include/asm/bitrev.h
> @@ -0,0 +1,41 @@
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
> +	unsigned long result = x;
> +
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBKB))
> +		return generic___bitrev32(x);

This breaks the build when CONFIG_HAVE_ARCH_BITREVERSE is set because
generic___bitrev32() ultimately calls generic___bitrev8(), which uses
byte_rev_table but that is only included in lib/bitrev.c when
CONFIG_HAVE_ARCH_BITREVERSE is not set. How was this tested? This seems
a pretty basic build problem that has showed up in a variety of
configurations (at least all the configurations that our CI tests).

  $ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- mrproper defconfig all
  ERROR: modpost: "byte_rev_table" [lib/zlib_deflate/zlib_deflate.ko] undefined!
  ERROR: modpost: "byte_rev_table" [drivers/net/ethernet/spacemit/k1_emac.ko] undefined!
  ERROR: modpost: "byte_rev_table" [drivers/net/ethernet/stmicro/stmmac/stmmac.ko] undefined!

  https://github.com/ClangBuiltLinux/continuous-integration2/actions/runs/24529356842
  https://lore.kernel.org/177635154368.6552.7060101263009785041@8692ffc4d55e/

Yury, are you intending to send this series to Linus in the 7.1 merge
window? If not, it shouldn't be in -next at this point.

> +	asm volatile(
> +		".option push\n"
> +		".option arch,+zbkb\n"
> +		"rev8 %0, %0\n"
> +		"brev8 %0, %0\n"
> +		".option pop"
> +		: "+r" (result)
> +	);
> +
> +	if (__riscv_xlen == 64)
> +		return (u32)(result >> 32);
> +
> +	return (u32)result;
> +}
> +
> +static __always_inline __attribute_const__ u16 __arch_bitrev16(u16 x)
> +{
> +	return __arch_bitrev32((u32)x) >> 16;
> +}
> +
> +static __always_inline __attribute_const__ u8 __arch_bitrev8(u8 x)
> +{
> +	return __arch_bitrev32((u32)x) >> 24;
> +}
> +#endif
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
