Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3F1C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jun 2022 16:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0xjlopVENVJKX6L9Dno+efjaXMRVpY1hhDJjx9AtLqs=; b=gDNHdYWN8MDIPn
	IMyllJBqhcVw4e0aCHhg6aFjenGXxbLBrr/EmCvklZjxktCjs+WhcJ/2IJJTwiGbpInrmmiuNM84e
	r1rK/FjEVNZ+a5u1eeAGR6tJfhj9/3724BY3SfHhDGht3bE5FcopWIL2kC1lkhQey6EXMmQvUS/Rz
	GEG8peEBC+FLNOg30llr5F5oHMFQQ9yrEn9B8GWQ3R+uiB8OL8h3XKd3wPucGXuJlz6F2H9ejriWM
	ON4yTKBqYcib+zH8VfZItlvOo0H3FOFIt8bGSUQEiQ88C2dBBuZUChU92Rn7pucFg/DDo+T5j/h8E
	bV68JrC79zRb/Q0qiKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Pks-00Fuo7-7i; Thu, 23 Jun 2022 16:32:30 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4PkS-00FuUX-Fz
	for linux-riscv@lists.infradead.org; Thu, 23 Jun 2022 16:32:06 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o4PkE-0002xb-Gk; Thu, 23 Jun 2022 18:31:50 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Tomsich <philipp.tomsich@vrull.eu>, Aaron Durbin <adurbin@rivosinc.com>, Randy Dunlap <rdunlap@infradead.org>, Atish Patra <atishp@atishpatra.org>, Christoph Muellner <christoph.muellner@vrull.eu>
Cc: Christoph =?ISO-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
Subject: Re: [RFC PATCH v2] riscv: Add Zawrs support for spinlocks
Date: Thu, 23 Jun 2022 18:31:49 +0200
Message-ID: <1903087.PYKUYFuaPT@diego>
In-Reply-To: <20220623152948.1607295-1-christoph.muellner@vrull.eu>
References: <20220623152948.1607295-1-christoph.muellner@vrull.eu>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_093204_595681_6396FCBD 
X-CRM114-Status: GOOD (  30.82  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Christoph,

Am Donnerstag, 23. Juni 2022, 17:29:48 CEST schrieb Christoph Muellner:
> From: Christoph M=FCllner <christoph.muellner@vrull.eu>
> =

> The current RISC-V code uses the generic ticket lock implementation,
> that calls the macros smp_cond_load_relaxed() and smp_cond_load_acquire().
> Currently, RISC-V uses the generic implementation of these macros.
> This patch introduces a RISC-V specific implementation, of these
> macros, that peels off the first loop iteration and modifies the waiting
> loop such, that it is possible to use the WRS.STO instruction of the Zawrs
> ISA extension to stall the CPU.
> =

> The resulting implementation of smp_cond_load_*() will only work for
> 32-bit or 64-bit types for RV64 and 32-bit types for RV32.
> This is caused by the restrictions of the LR instruction (RISC-V only
> has LR.W and LR.D). Compiler assertions guard this new restriction.
> =

> This patch uses the existing RISC-V ISA extension framework
> to detect the presents of Zawrs at run-time.
> If available a NOP instruction will be replaced by WRS.NTO or WRS.STO.
> =

> The whole mechanism is gated by Kconfig setting, which defaults to Y.
> =

> The Zawrs specification can be found here:
> https://github.com/riscv/riscv-zawrs/blob/main/zawrs.adoc
> =

> Note, that the Zawrs extension is not frozen or ratified yet.
> Therefore this patch is an RFC and not intended to get merged.
> =

> Changes since v1:
> * Adding "depends on !XIP_KERNEL" to RISCV_ISA_ZAWRS
> * Fixing type checking code in __smp_load_reserved*
> * Adjustments according to the specification change
> =

> Signed-off-by: Christoph M=FCllner <christoph.muellner@vrull.eu>

With the matching Qemu-Patch on
- rv64 + Debian rootfs
- rv32 + 32bit-Buildroot rootfs

Tested-by: Heiko Stuebner <heiko@sntech.de>

apart from the one nit below
Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  arch/riscv/Kconfig                   | 11 ++++
>  arch/riscv/include/asm/barrier.h     | 92 ++++++++++++++++++++++++++++
>  arch/riscv/include/asm/errata_list.h | 19 +++++-
>  arch/riscv/include/asm/hwcap.h       |  3 +-
>  arch/riscv/kernel/cpu.c              |  1 +
>  arch/riscv/kernel/cpufeature.c       | 13 ++++
>  6 files changed, 136 insertions(+), 3 deletions(-)
> =

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 32ffef9f6e5b..9d40569237c9 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -358,6 +358,17 @@ config RISCV_ISA_C
>  =

>  	   If you don't know what to do here, say Y.
>  =

> +config RISCV_ISA_ZAWRS
> +	bool "Zawrs extension support"
> +	depends on !XIP_KERNEL
> +	select RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the Zawrs extensi=
on
> +	   (wait for reservation set) and enable its usage.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config RISCV_ISA_SVPBMT
>  	bool "SVPBMT extension support"
>  	depends on 64BIT && MMU
> diff --git a/arch/riscv/include/asm/barrier.h b/arch/riscv/include/asm/ba=
rrier.h
> index d0e24aaa2aa0..1f9628aaa7cb 100644
> --- a/arch/riscv/include/asm/barrier.h
> +++ b/arch/riscv/include/asm/barrier.h
> @@ -12,6 +12,8 @@
>  =

>  #ifndef __ASSEMBLY__
>  =

> +#include <asm/errata_list.h>
> +
>  #define nop()		__asm__ __volatile__ ("nop")
>  =

>  #define RISCV_FENCE(p, s) \
> @@ -42,6 +44,64 @@ do {									\
>  	___p1;								\
>  })
>  =

> +#if __riscv_xlen =3D=3D 64
> +

nit: I guess we could do without the extra blanks?
asm.h does so, and also the #else block below also doesn't
use them ;-) . But I guess that is more a style debate

> +#define __riscv_lrsc_word(t)						\
> +	(sizeof(t) =3D=3D sizeof(int) ||					\
> +	 sizeof(t) =3D=3D sizeof(long))
> +
> +#elif __riscv_xlen =3D=3D 32
> +
> +#define __riscv_lrsc_word(t)						\
> +	(sizeof(t) =3D=3D sizeof(int))
> +
> +#else
> +#error "Unexpected __riscv_xlen"
> +#endif /* __riscv_xlen */

[...]

Thanks
Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
