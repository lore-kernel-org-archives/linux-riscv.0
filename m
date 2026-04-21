Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9002DF8925F
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 11:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uor67rE+Ztz9fsWHTc5ahMoLeR6Xqo82ebuyo2f6+cs=; b=jAnsAKmtC14tcZ
	WX9WbJFrM36ewn5DEIVZBT9qBWomdN4Ej975SbYFPqylbNA5vL0SMhnVbJOOYLd6wVR/fvJQ5Ez16
	yrA8hfpvjNQ9VClHptfYVau03z4a5Z9eCt32CXRedvTI4nI4bLd/vfmA/G6XY3RJg/ukMNWqAydhV
	wcZWgJpky3MjinKExDtRUUyufT8lTrh5W1zpd83JKttPh/Ps5+aR6Zdc/0v9E1zFlPYQBVikEkwVO
	Y3he8aepYgVY0c3P9qOnywzcqxSE2GNrrK+Mxoc4L2s6neVWDce88eEd8bfvY/pgvTicXJdp/LEGz
	nLwxjdvtSekikY470pnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9By-00000008VmM-1mJI;
	Tue, 21 Apr 2026 11:22:58 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9Bu-00000008Vkt-3nVh
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 11:22:56 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82f8893bff3so1911045b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 04:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776770574; x=1777375374; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pbepvZoiaQHnY8ojgGndHUN0tqRJnJo2KRx8HLgDgUI=;
        b=FV9zjT61IfdH0hw0vy7dGgYFsj9buGR2rsVIhszeGzojmh28XbJR9DD/bmCf0Wbjlb
         XA6Pw2xikjwUQye8Bsom2Uoowg3b4xvs/9yyV9E+48+KjnB4FYwbQq2nGBJWqCnoPWeV
         ce0vblNBH1NIPPWYNXQh6hWYhraSuKEnsDO60wp90ZKL3OV9ccrCaDbfJdsCd+GSFHnA
         MXqA0YVrtLaqMbwNspr6znLavBHCn3Jccr5nCLiAnt1/f/SftVL7nNTnCf3A0hiov/XP
         uBN5GNZSO/yNvsOQ4VHOfkOipHohigY5B10xjLVCyjiH9+O2trhImcd4qC6P/fFBnUK7
         CWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770574; x=1777375374;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbepvZoiaQHnY8ojgGndHUN0tqRJnJo2KRx8HLgDgUI=;
        b=dLXAQpH9KjlFAq8/3CeOuQ9EQFm/gjvMq2ubpdpxT0eRDxl9q0o5iNi1BLGxs8Nuju
         Jr0fa3cVBR27AUpzUClNb0aplEJRS7XNI1fyKalkZhVepj+yc8geT8oZcAersDr45D/L
         A6QvKJPcoz+dFIl8DtR2iTgB9XtpyqlZHUKIh9PZa9S2VP8QhmSRp0SXPishbDHbc58j
         6hTZW+lQtKIgDy8631lNXRROYtGmxCyeLwR2iD7sQttCcfX7963NgQ58U/xNinuKXhFv
         +sbp5grhakqbjYA0NHVuzIowGj9JIXJDNv9sWweF90+T+xDzMCphsm/zgy+Gou0qFtnr
         utHw==
X-Forwarded-Encrypted: i=1; AFNElJ9IFxo1Rc/quGs8+eMVMBaTR9aUJxeBB/9t+mr84YXdDCIKcopbYIMJ6ZZTJ26XLs/5fiav6j2+oZPOMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzhvwy1gVVQ/j8/CpA5+cgZ4MnkQ3Lt7PdvwN/9gmsAemqPq6wN
	rBdaZTvLP5hCpzAaGv7DqsbY+N4jNbWx+pEHGjcyOnDtxPiE1Y8W58XU
X-Gm-Gg: AeBDieuJ4lf0723X7zQ7POJicM6+lKszhpGEf4mksJxyo9kWfGorLfJj3drQNlR4WXW
	KUksdfRpzmN8sPAv1fgWBK1xVYTi5LFRNlDM2MK804+141liJipseNi+mal3DhNYz2d6yemcerx
	y6RWKEjW84zwZc63V2mjzUmDHFH4py4VWym2m2g9JXXnY9dHIlIfs7RI5h4rSMe6Pgku0K7gF6P
	WoxiMML6/nqxptjixd8096OWV8zZuvVyqu2SFPDxvJ/NTDpfO33g0XMGts3zjTfOq92oVDkCZXg
	gg44fdBHXygpJQOqHctcgOsoGUsUDUYi1cKwsln4QcVOKfsPPWZetlEiNtmUAwRJnJkNzJ25tex
	l17ZBdtY6exM+0eQ7poqzUfuU8OlQiWgUQNORt4yM5m4Hle4YCepd+saTG04fx9g/tXjJ/7mic5
	pZhZ4cULH6fOGuMY+tnbh56NxWBQ/t+PIIvuhQiTQSypou4BKvRGGP/Q1up1fhD7QcYsNWnMAkM
	8GuvQ==
X-Received: by 2002:a05:6a00:6988:b0:82f:aae5:c7a9 with SMTP id d2e1a72fcca58-82faae5d438mr7228492b3a.27.1776770573719;
        Tue, 21 Apr 2026 04:22:53 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([129.41.58.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e981a0asm14155014b3a.3.2026.04.21.04.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 04:22:53 -0700 (PDT)
Date: Tue, 21 Apr 2026 16:52:37 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, 
	x86@kernel.org, Lu Baolu <baolu.lu@linux.intel.com>, iommu@lists.linux.dev, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	Herbert Xu <herbert@gondor.apana.org.au>, linux-crypto@vger.kernel.org, 
	Vlastimil Babka <vbabka@kernel.org>, linux-mm@kvack.org, David Woodhouse <dwmw2@infradead.org>, 
	Bernie Thompson <bernie@plugable.com>, linux-fbdev@vger.kernel.org, Theodore Tso <tytso@mit.edu>, 
	linux-ext4@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Thomas Sailer <t.sailer@alumni.ethz.ch>, 
	linux-hams@vger.kernel.org, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
	Richard Henderson <richard.henderson@linaro.org>, linux-alpha@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@lists.linux-m68k.org, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, linux-openrisc@vger.kernel.org, 
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>, linux-s390@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, sparclinux@vger.kernel.org
Subject: Re: [patch 33/38] powerpc: Select ARCH_HAS_RANDOM_ENTROPY
Message-ID: <aedc9UddBSYXzrAj@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260410120044.031381086@kernel.org>
 <20260410120319.789114053@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260410120319.789114053@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_042254_952989_BB44D5D5 
X-CRM114-Status: GOOD (  18.50  )
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

On Fri, Apr 10, 2026 at 02:21:09PM +0200, Thomas Gleixner wrote:
> The only remaining usage of get_cycles() is to provide random_get_entropy().
> 
> Switch powerpc over to the new scheme of selecting ARCH_HAS_RANDOM_ENTROPY
> and providing random_get_entropy() in asm/random.h.
> 
> Remove asm/timex.h as it has no functionality anymore.
> 
> Signed-off-by: Thomas Gleixner <tglx@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/Kconfig              |    1 +
>  arch/powerpc/include/asm/random.h |   13 +++++++++++++
>  arch/powerpc/include/asm/timex.h  |   21 ---------------------
>  3 files changed, 14 insertions(+), 21 deletions(-)
> 
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -150,6 +150,7 @@ config PPC
>  	select ARCH_HAS_PREEMPT_LAZY
>  	select ARCH_HAS_PTDUMP
>  	select ARCH_HAS_PTE_SPECIAL
> +	select ARCH_HAS_RANDOM_ENTROPY
>  	select ARCH_HAS_SCALED_CPUTIME		if VIRT_CPU_ACCOUNTING_NATIVE && PPC_BOOK3S_64
>  	select ARCH_HAS_SET_MEMORY
>  	select ARCH_HAS_STRICT_KERNEL_RWX	if (PPC_BOOK3S || PPC_8xx) && !HIBERNATION
> --- /dev/null
> +++ b/arch/powerpc/include/asm/random.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_POWERPC_RANDOM_H
> +#define _ASM_POWERPC_RANDOM_H
> +
> +#include <asm/cputable.h>
> +#include <asm/vdso/timebase.h>
> +
> +static inline unsigned long random_get_entropy(void)
> +{
> +	return mftb();
> +}
> +
> +#endif	/* _ASM_POWERPC_RANDOM_H */
> --- a/arch/powerpc/include/asm/timex.h
> +++ b/arch/powerpc/include/asm/timex.h
> @@ -1,21 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef _ASM_POWERPC_TIMEX_H
> -#define _ASM_POWERPC_TIMEX_H
> -
> -#ifdef __KERNEL__
> -
> -/*
> - * PowerPC architecture timex specifications
> - */
> -
> -#include <asm/cputable.h>
> -#include <asm/vdso/timebase.h>
> -
> -ostatic inline cycles_t get_cycles(void)
> -{
R> -	return mftb();
> -}
> -#define get_cycles get_cycles
> -
> -#endif	/* __KERNEL__ */
> -#endif	/* _ASM_POWERPC_TIMEX_H */
> 
Build tested for this series with allmodconfig and allyesconfig on ppc64le
machine for ppc64le.
tree: git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git getcycles-v1

Boot tested for this series on powernv9 qemu, powernv10 qemu and pSeries
power11 hardware.

Tested-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
