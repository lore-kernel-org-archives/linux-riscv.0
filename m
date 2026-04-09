Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E46F36B94
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 23:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAlMXQ+xc7H/rqa756i1La9pceSuXhuNQyi7KyRhkNQ=; b=vEWKD6WaZ4yy36
	GhxkyD3uwkGqZODCUOSnj0DqC5vpTlHCtOZWnNIrs8bpujRwSveYJjo/WrGWaEKLfW/an220n0c4O
	K4s8nh30LKZZUmbA+KaAjuVRaexGBycWnc5EhGW98I8AwM7hMYArCIMjbUJRNU7a6L8PaQ84VQ7Qt
	BoAJjL4fYVwM9XRTo3CXkjDORWy3P1phc1ss2Y3UuDjEMCZI7sq8O0K7pKmPGaO48YJ+lmiavjNnE
	iuO2lip8DrGXhsZJ1VMiamuhm1MSbu+dtA4XirNm3yjHXtRXg/XPsZ8cNKkUY2HH+V6llbsOdRRUm
	4ED8hq1g/YbF8mfa3oCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAyiA-0000000BKC0-014Q;
	Thu, 09 Apr 2026 23:22:58 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAyi7-0000000BKBW-49dx
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 23:22:57 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-2cfd69b564dso1983905eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 16:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775776975; x=1776381775; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nKldo2yrm2w40OEiGhR3WeiFXvIo0cqPcrhG1jlTtso=;
        b=oaZLkj6LJ8Xzhw0d0qB4AQ0STl8Y3Udqbu1QRe9/ffTFFtTwkFMpeXtrbYAlvnnzbm
         7x1ACYUcI//3JOtH3TmzrazWW2cvgoryDZ8uFvZbA19mX/DzfH2p1tS756pnayVUWpB5
         6RWgHldjOY68cj40eofj87JAxVbDteRXLtxDR7uZlc+i6RbBqnBNEJnRRPTSV5VbviAr
         Gs0qBTpm78qeYCFuNr79RmvmKJuW9yVWxn758WG1Aryx7BRXS9M7Ff4om3tp9GGnmyS9
         8L2fHcVmO1YNBq+758nHiA6TZVD8oqFQ45sR0469gjV+medcZFzBOW2MXK/kRaDxkyPD
         uXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776975; x=1776381775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKldo2yrm2w40OEiGhR3WeiFXvIo0cqPcrhG1jlTtso=;
        b=fOLwzif51L+8RAdxl5hq60bEDhsNKWIifdwfJ3YNryHxJhCwcnf51TlZmS6NwXDRA2
         hbv0327GAvtn8kDIt+VqyBiQCUKj74g039aumA6O/HKFImr73pkPrZJL6Man1ZRWOz0T
         Q160Gng53WNN2nOpSb3+lWT+n6Qc1h7V++WS4BYcxDSaGRo80/P8ce5Eg9mYZYaBqzuS
         ZrEJiZyGL0yn3eTzZnSxAfDcRgzpiAvESUgTy5lEdVTvsz+AjCdyB4LhesuS+HPh99KP
         hoCNciP/nA4XWJDjwkS2qd4uoysvQ+r13nijm5s3dnDmLwU3zt2tYwV9Gpmm3hhranGP
         87qg==
X-Forwarded-Encrypted: i=1; AJvYcCVajPkTfLlqonORskY0O1klUwOrYZh0w20z3v+cYYH02qaddDlQ3U55yM2Ko8TUILE0Yd/vUpMt9agc7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzOIhcw4lcyrfGJ2f/O5nOqhSeUBJ1Myn9tVRcGYdaj9CgBNifY
	gJhCb4K0ofTQGbHnEv49w8Yaglqa2+vnWruNVYjrS/xfAqMBvTfOwF5t
X-Gm-Gg: AeBDievpplkl8PN+1SzOAWS+TghBFPrUttAwrpQXG8nE6lJsySEUZi+M865rmpfRpHk
	J3I7hj5YnBionW5jijUM8JAbnr3BxSGVZUGlN46Sia/OhaPJU5sjOn3fwZ7cFtu59h6TiwmQQBc
	oVDAztZB3Me9dl5J/EGrMX8bAjFaEjwb8v8P7US5j7cDLZImxg1e6g0XVOX6RzspJCCSMhhMkuh
	/FuDOgRZnPrRpk6QhrUXdv36JnE8ndQBwwOxUU1/W/21z5hCIphYLRSciX7Epfrxhjz7indCjIm
	yoUwHRBpsTnN1tEfYTzZ9F5d+UfFPZBJarzXIqStpDPWqohnNV0H7AqMAd2Y7ZIIUOZuX9MW4fg
	o/WTFuGtw+7TS32cT/Rd97MlCOIYjyeZ7JBilk6+0OU91pD0HjLvHQvRy6snASReVibHwkPZ0D1
	QY+RDiT5gbWl1LL7wvtxmQIfBmkuKMw6CTvMOylD1OaQ==
X-Received: by 2002:a05:7300:320a:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-2d5888a1ae6mr692564eec.23.1775776974823;
        Thu, 09 Apr 2026 16:22:54 -0700 (PDT)
Received: from inky.localdomain ([2601:647:6700:64d0:f083:8467:43b0:e8f8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55f5c698esm1874531eec.6.2026.04.09.16.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:22:54 -0700 (PDT)
Date: Thu, 9 Apr 2026 16:22:52 -0700
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 1/2] riscv: add platform-specific double word shifts
 for riscv32
Message-ID: <20260409232252.GA495784@inky.localdomain>
References: <adavgV5IF9jMzxr3@ashevche-desk.local>
 <20260409033824.465455-1-dmantipov@yandex.ru>
 <20260409033824.465455-2-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260409033824.465455-2-dmantipov@yandex.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_162256_071799_8F44AE9D 
X-CRM114-Status: GOOD (  29.38  )
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

On Thu, Apr 09, 2026 at 06:38:23AM +0300, Dmitry Antipov wrote:
> Add riscv32-specific '__ashldi3()', '__ashrdi3()', and '__lshrdi3()'.
> Initially it was intended to fix the following link error observed
> when building EFI-enabled kernel with CONFIG_EFI_STUB=y and
> CONFIG_EFI_GENERIC_STUB=y:
> 
> riscv32-linux-gnu-ld: ./drivers/firmware/efi/libstub/lib-cmdline.stub.o: in function `__efistub_.L49':
> __efistub_cmdline.c:(.init.text+0x1f2): undefined reference to `__efistub___ashldi3'
> riscv32-linux-gnu-ld: __efistub_cmdline.c:(.init.text+0x202): undefined reference to `__efistub___lshrdi3'
> 
> Reported at [1] trying to build https://patchew.org/linux/20260212164413.889625-1-dmantipov@yandex.ru,
> tested with 'qemu-system-riscv32 -M virt' only.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603041925.KLKqpK6N-lkp@intel.com [1]
> Suggested-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>

I needed to apply the following to get this to successfully compile for
riscv32 with CONFIG_EFI_ZBOOT. After applying this change, I was able to
successfully EFI boot the vmlinuz.efi in qemu.

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index e386ffd009b7..f83301a19dc5 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -96,7 +96,7 @@ CFLAGS_zboot-decompress-gzip.o        += -I$(srctree)/lib/zlib_inflate
 zboot-obj-$(CONFIG_KERNEL_ZSTD)        := zboot-decompress-zstd.o lib-xxhash.o
 CFLAGS_zboot-decompress-zstd.o += -I$(srctree)/lib/zstd

-zboot-obj-$(CONFIG_RISCV)      += lib-clz_ctz.o lib-ashldi3.o
+zboot-obj-$(CONFIG_RISCV)      += lib-clz_ctz.o lib-ashldi3.o lib-lshrdi3.o
 lib-$(CONFIG_EFI_ZBOOT)                += zboot.o $(zboot-obj-y)

 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o


However, this change causes the libstub to bypass these new functions
you have introduced. lib-ashldi3.o and lib-lshrdi3.o use the following
rule to compile the generic arch libs:

$(obj)/lib-%.o: $(srctree)/lib/%.c FORCE
	$(call if_changed_rule,cc_o_c)

This is specifically for the efi libstub, the regular kernel (like in
your test case in the next patch) will use these newly introduced
functions.

One solution is to use this change instead:

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index e386ffd009b7..775c34d80179 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -96,7 +96,7 @@ CFLAGS_zboot-decompress-gzip.o        += -I$(srctree)/lib/zlib_inflate
 zboot-obj-$(CONFIG_KERNEL_ZSTD)        := zboot-decompress-zstd.o lib-xxhash.o
 CFLAGS_zboot-decompress-zstd.o += -I$(srctree)/lib/zstd

-zboot-obj-$(CONFIG_RISCV)      += lib-clz_ctz.o lib-ashldi3.o
+zboot-obj-$(CONFIG_RISCV)      += lib-clz_ctz.o ../../../../arch/riscv/lib/ashldi3.o ../../../../arch/riscv/lib/lshrdi3.o
 lib-$(CONFIG_EFI_ZBOOT)                += zboot.o $(zboot-obj-y)

 lib-$(CONFIG_UNACCEPTED_MEMORY) += unaccepted_memory.o bitmap.o find.o

This will link against the correct shifting libraries.

- Charlie


> ---
> v2: adjust commit message
> ---
>  arch/riscv/Kconfig             |  3 ---
>  arch/riscv/kernel/image-vars.h |  7 +++++++
>  arch/riscv/lib/Makefile        |  1 +
>  arch/riscv/lib/ashldi3.S       | 36 +++++++++++++++++++++++++++++++++
>  arch/riscv/lib/ashrdi3.S       | 37 ++++++++++++++++++++++++++++++++++
>  arch/riscv/lib/lshrdi3.S       | 36 +++++++++++++++++++++++++++++++++
>  6 files changed, 117 insertions(+), 3 deletions(-)
>  create mode 100644 arch/riscv/lib/ashldi3.S
>  create mode 100644 arch/riscv/lib/ashrdi3.S
>  create mode 100644 arch/riscv/lib/lshrdi3.S
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 90c531e6abf5..515254720da5 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -407,9 +407,6 @@ config ARCH_RV32I
>  	bool "RV32I"
>  	depends on NONPORTABLE
>  	select 32BIT
> -	select GENERIC_LIB_ASHLDI3
> -	select GENERIC_LIB_ASHRDI3
> -	select GENERIC_LIB_LSHRDI3
>  	select GENERIC_LIB_UCMPDI2
>  
>  config ARCH_RV64I
> diff --git a/arch/riscv/kernel/image-vars.h b/arch/riscv/kernel/image-vars.h
> index 3bd9d06a8b8f..d66e06daf13e 100644
> --- a/arch/riscv/kernel/image-vars.h
> +++ b/arch/riscv/kernel/image-vars.h
> @@ -32,6 +32,13 @@ __efistub___init_text_end	= __init_text_end;
>  __efistub_sysfb_primary_display	= sysfb_primary_display;
>  #endif
>  
> +/*
> + * These double-word integer shifts are used
> + * by the library code and so EFI stub as well.
> + */
> +PROVIDE(__efistub___lshrdi3    = __lshrdi3);
> +PROVIDE(__efistub___ashldi3    = __ashldi3);
> +
>  #endif
>  
>  #endif /* __RISCV_KERNEL_IMAGE_VARS_H */
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index bbc031124974..7cee3da80c68 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -13,6 +13,7 @@ ifeq ($(CONFIG_MMU), y)
>  lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
>  endif
>  lib-$(CONFIG_MMU)	+= uaccess.o
> +lib-$(CONFIG_32BIT)	+= ashldi3.o ashrdi3.o lshrdi3.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
>  lib-$(CONFIG_RISCV_ISA_ZICBOZ)	+= clear_page.o
>  obj-$(CONFIG_FUNCTION_ERROR_INJECTION) += error-inject.o
> diff --git a/arch/riscv/lib/ashldi3.S b/arch/riscv/lib/ashldi3.S
> new file mode 100644
> index 000000000000..c3408862e2f6
> --- /dev/null
> +++ b/arch/riscv/lib/ashldi3.S
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/**
> + * Adopted for the Linux kernel from IPXE project, see
> + * https://github.com/ipxe/ipxe/blob/master/src/arch/riscv32/libgcc/llshift.S
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +/**
> + * Shift left
> + *
> + * @v a1:a0             Value to shift
> + * @v a2                Shift amount
> + * @ret a1:a0           Shifted value
> + */
> +
> +SYM_FUNC_START(__ashldi3)
> +
> +        /* Perform shift by 32 bits, if applicable */
> +        li      t0, 32
> +        sub     t1, t0, a2
> +        bgtz    t1, 1f
> +        mv      a1, a0
> +        mv      a0, zero
> +1:      /* Perform shift by modulo-32 bits, if applicable */
> +        andi    a2, a2, 0x1f
> +        beqz    a2, 2f
> +        srl     t2, a0, t1
> +        sll     a0, a0, a2
> +        sll     a1, a1, a2
> +        or      a1, a1, t2
> +2:      ret
> +
> +SYM_FUNC_END(__ashldi3)
> +EXPORT_SYMBOL(__ashldi3)
> diff --git a/arch/riscv/lib/ashrdi3.S b/arch/riscv/lib/ashrdi3.S
> new file mode 100644
> index 000000000000..dd42b3cbb173
> --- /dev/null
> +++ b/arch/riscv/lib/ashrdi3.S
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/**
> + * Adopted for the Linux kernel from IPXE project, see
> + * https://github.com/ipxe/ipxe/blob/master/src/arch/riscv32/libgcc/llshift.S
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +/**
> + * Arithmetic shift right
> + *
> + * @v a1:a0             Value to shift
> + * @v a2                Shift amount
> + * @ret a1:a0           Shifted value
> + */
> +
> +SYM_FUNC_START(__ashrdi3)
> +
> +        /* Perform shift by 32 bits, if applicable */
> +        li      t0, 32
> +        sub     t1, t0, a2
> +        bgtz    t1, 1f
> +        mv      a0, a1
> +        srai    a1, a1, 16
> +        srai    a1, a1, 16
> +1:      /* Perform shift by modulo-32 bits, if applicable */
> +        andi    a2, a2, 0x1f
> +        beqz    a2, 2f
> +        sll     t2, a1, t1
> +        sra     a1, a1, a2
> +        srl     a0, a0, a2
> +        or      a0, a0, t2
> +2:      ret
> +
> +SYM_FUNC_END(__ashrdi3)
> +EXPORT_SYMBOL(__ashrdi3)
> diff --git a/arch/riscv/lib/lshrdi3.S b/arch/riscv/lib/lshrdi3.S
> new file mode 100644
> index 000000000000..1af03985ccb7
> --- /dev/null
> +++ b/arch/riscv/lib/lshrdi3.S
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/**
> + * Adopted for the Linux kernel from IPXE project, see
> + * https://github.com/ipxe/ipxe/blob/master/src/arch/riscv32/libgcc/llshift.S
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +/**
> + * Logical shift right
> + *
> + * @v a1:a0             Value to shift
> + * @v a2                Shift amount
> + * @ret a1:a0           Shifted value
> + */
> +
> +SYM_FUNC_START(__lshrdi3)
> +
> +        /* Perform shift by 32 bits, if applicable */
> +        li      t0, 32
> +        sub     t1, t0, a2
> +        bgtz    t1, 1f
> +        mv      a0, a1
> +        mv      a1, zero
> +1:      /* Perform shift by modulo-32 bits, if applicable */
> +        andi    a2, a2, 0x1f
> +        beqz    a2, 2f
> +        sll     t2, a1, t1
> +        srl     a1, a1, a2
> +        srl     a0, a0, a2
> +        or      a0, a0, t2
> +2:      ret
> +
> +SYM_FUNC_END(__lshrdi3)
> +EXPORT_SYMBOL(__lshrdi3)
> -- 
> 2.53.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
