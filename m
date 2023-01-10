Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B4BC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 12:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xcd3fp1RY9EIOba6009bUZpu4uyJmr09nrT09TF0Gow=; b=3ouCCUS7ZLF1AW
	jMkofq0ULvzf3iBaImzYqxLhcGZG613WXq05h62xXjTHKcVz7LLWsY9mIuNWD3/UqYmpV4XLJ7Uq5
	pvy60dLgkm7AlbM4rVA9jXWURi8SIL6uoc74rOqGAthE5m4kDOMIsoT6b9Vc1j19rSKrw6pbb5N9o
	fAmOfOCJ6rpnrwG2JRwOpvH0M60/6S87s4pQsWX3vMbBT29g4TEBhZOKu5mnykP+5b9XRIGtW9Z3d
	OJ7ixvzyvhOkzzk4GmIIR9hQ72r9pz+D18SrR3InAZpbsPQDiUDz9jl1SM4BI2Z3bKbv0WqCvzxao
	mOp+/jZBCWCk/8LKS/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFDVR-006nXO-Ay; Tue, 10 Jan 2023 12:13:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFDVN-006nWd-Kn
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 12:13:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id bk16so11481530wrb.11
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 04:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pWBSqB8e/A3aFpMgJb/X2YwauZFDEtkjZE+OvYVpaC4=;
        b=jmCuMKBgczDHOywbLASZgkpr9CXlZJa+KppMw2h7y0LGvnNUW/8c6gwKr+3jqm+bM6
         N9ne3sSgZTi5atMs9+Prb7grvXtu6r+G+l/jQKecw9yQiEY6NR+ITZ9m0FoCi9XJQqQG
         I3x6rE0IfB4WaHa25aSxdx8YusRYnH/6hh3Sjzww4j9LAXnQr5MgQl6Dvc7/bBvL5y6v
         LbbafUWDLd1kyTu0y2n6tByy25UFJ2XA+fTCe9DzjVWkt5Ktnw5zZ01pwKa0CunvpKSd
         cOuEKx9EYfOIOKa6BKh/JlJP+r1qGFRvdGH5M0AwkoxUYm/SB6hpCsWebVJ4/vLxJvaP
         GNIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWBSqB8e/A3aFpMgJb/X2YwauZFDEtkjZE+OvYVpaC4=;
        b=56UXbSthGL4R/FvrnoW77ldF5n79IEwo6PVqmgjdEAauKGSgC9b8xTy4m4O/+Ye5U3
         ywx9Sj77GSe4UG3IuoTafeJXk9/tCZ1NYUlqPHQ1Tg0cu7vba/D6j880yM4RQrT1IhFp
         UpWDISWKIPF8CsuE6j8iylmCvPUK0jA1sbfgGaQlN09+6c1RXbqhrkz80F/FqjrYJHB4
         o+niOWf2ddIx6WNXPKhQDpJQvXRsswEtmlNKqBP7zXfKRxTzcvwCkTVXC/KTeetQG9Jg
         Nbej8YaWYteTGUV71NOkmV9FRXpf4jIaNA2ynds7OJ1i7RX6PN33APr5ZMdVAS2+TFpd
         e7hA==
X-Gm-Message-State: AFqh2kqxRHVpRxDvSG1hW0V9Cb42jZY6bwu7CWB9OdyoI5P61uDNUWuZ
	1NevPSpAYN7BJsWivuJUNgAlsg==
X-Google-Smtp-Source: AMrXdXtLnHlJoN2F0x/JptULBX20FyB3PeOJJKPSa/q6agVHCAnkxJ2kpa1xwpTaIbRhqY2z8+s7lg==
X-Received: by 2002:a05:6000:a15:b0:299:9272:af83 with SMTP id co21-20020a0560000a1500b002999272af83mr21293089wrb.53.1673352801788;
        Tue, 10 Jan 2023 04:13:21 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e7-20020a5d5007000000b0023662d97130sm10929011wrt.20.2023.01.10.04.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 04:13:21 -0800 (PST)
Date: Tue, 10 Jan 2023 13:13:20 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 4/5] RISC-V: add infrastructure to allow different
 str* implementations
Message-ID: <20230110121320.zr4tk4nl2w57klqg@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-5-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109181755.2383085-5-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_041325_727513_7E8E1FED 
X-CRM114-Status: GOOD (  26.77  )
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

On Mon, Jan 09, 2023 at 07:17:54PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Depending on supported extensions on specific RISC-V cores,
> optimized str* functions might make sense.
> 
> This adds basic infrastructure to allow patching the function calls
> via alternatives later on.
> 
> The Linux kernel provides standard implementations for string functions
> but when architectures want to extend them, they need to provide their
> own.
> 
> The added generic string functions are done in assembler (taken from
> disassembling the main-kernel functions for now) to allow us to control
> the used registers and extend them with optimized variants.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/string.h | 10 +++++++++
>  arch/riscv/kernel/riscv_ksyms.c |  3 +++
>  arch/riscv/lib/Makefile         |  3 +++
>  arch/riscv/lib/strcmp.S         | 37 ++++++++++++++++++++++++++++++
>  arch/riscv/lib/strlen.S         | 28 +++++++++++++++++++++++
>  arch/riscv/lib/strncmp.S        | 40 +++++++++++++++++++++++++++++++++
>  arch/riscv/purgatory/Makefile   | 13 +++++++++++
>  7 files changed, 134 insertions(+)
>  create mode 100644 arch/riscv/lib/strcmp.S
>  create mode 100644 arch/riscv/lib/strlen.S
>  create mode 100644 arch/riscv/lib/strncmp.S
> 
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> index 909049366555..a96b1fea24fe 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -18,6 +18,16 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
>  #define __HAVE_ARCH_MEMMOVE
>  extern asmlinkage void *memmove(void *, const void *, size_t);
>  extern asmlinkage void *__memmove(void *, const void *, size_t);
> +
> +#define __HAVE_ARCH_STRCMP
> +extern asmlinkage int strcmp(const char *cs, const char *ct);
> +
> +#define __HAVE_ARCH_STRLEN
> +extern asmlinkage __kernel_size_t strlen(const char *);
> +
> +#define __HAVE_ARCH_STRNCMP
> +extern asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
> +
>  /* For those files which don't want to check by kasan. */
>  #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
>  #define memcpy(dst, src, len) __memcpy(dst, src, len)
> diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
> index 5ab1c7e1a6ed..a72879b4249a 100644
> --- a/arch/riscv/kernel/riscv_ksyms.c
> +++ b/arch/riscv/kernel/riscv_ksyms.c
> @@ -12,6 +12,9 @@
>  EXPORT_SYMBOL(memset);
>  EXPORT_SYMBOL(memcpy);
>  EXPORT_SYMBOL(memmove);
> +EXPORT_SYMBOL(strcmp);
> +EXPORT_SYMBOL(strlen);
> +EXPORT_SYMBOL(strncmp);
>  EXPORT_SYMBOL(__memset);
>  EXPORT_SYMBOL(__memcpy);
>  EXPORT_SYMBOL(__memmove);
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 25d5c9664e57..6c74b0bedd60 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -3,6 +3,9 @@ lib-y			+= delay.o
>  lib-y			+= memcpy.o
>  lib-y			+= memset.o
>  lib-y			+= memmove.o
> +lib-y			+= strcmp.o
> +lib-y			+= strlen.o
> +lib-y			+= strncmp.o
>  lib-$(CONFIG_MMU)	+= uaccess.o
>  lib-$(CONFIG_64BIT)	+= tishift.o
>  
> diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
> new file mode 100644
> index 000000000000..94440fb8390c
> --- /dev/null
> +++ b/arch/riscv/lib/strcmp.S
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm-generic/export.h>
> +
> +/* int strcmp(const char *cs, const char *ct) */
> +SYM_FUNC_START(strcmp)
> +	/*
> +	 * Returns
> +	 *   a0 - comparison result, value like strcmp
> +	 *
> +	 * Parameters
> +	 *   a0 - string1
> +	 *   a1 - string2
> +	 *
> +	 * Clobbers
> +	 *   t0, t1, t2
> +	 */
> +	mv	t2, a1

The above instruction and the 'mv a1, t2' below appear to be attempting
to preserve a1, but that shouldn't be necessary.

> +1:
> +	lbu	t1, 0(a0)
> +	lbu	t0, 0(a1)

I'd rather have t0 be 0(a0) and t1 be 0(a1)

> +	addi	a0, a0, 1
> +	addi	a1, a1, 1
> +	beq	t1, t0, 3f
> +	li	a0, 1
> +	bgeu	t1, t0, 2f
> +	li	a0, -1
> +2:
> +	mv	a1, t2
> +	ret
> +3:
> +	bnez	t1, 1b
> +	li	a0, 0
> +	j	2b

For fun I removed one conditional and one unconditional branch (untested)

1:
     lbu     t0, 0(a0)
     lbu     t1, 0(a1)
     addi    a0, a0, 1
     addi    a1, a1, 1
     bne     t0, t1, 2f
     bnez    t0, 1b
     li      a0, 0
     ret
2:
     slt     a1, t1, t0
     slli    a1, a1, 1
     li      a0, -1
     add     a0, a0, a1
     ret


> +SYM_FUNC_END(strcmp)
> diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
> new file mode 100644
> index 000000000000..09a7aaff26c8
> --- /dev/null
> +++ b/arch/riscv/lib/strlen.S
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm-generic/export.h>
> +
> +/* int strlen(const char *s) */
> +SYM_FUNC_START(strlen)
> +	/*
> +	 * Returns
> +	 *   a0 - string length
> +	 *
> +	 * Parameters
> +	 *   a0 - String to measure
> +	 *
> +	 * Clobbers:
> +	 *   t0, t1
> +	 */
> +	mv	t1, a0
> +1:
> +	lbu	t0, 0(t1)
> +	bnez	t0, 2f
> +	sub	a0, t1, a0
> +	ret
> +2:
> +	addi	t1, t1, 1
> +	j	1b

Slightly reorganizing looks better (to me)

   mv    t1, a0
1:
   lbu   t0, 0(t1)
   beqz  t0, 2f
   addi  t1, t1, 1
   j     1b
2:
   sub a0, t1, a0
   ret

> +SYM_FUNC_END(strlen)
> diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
> new file mode 100644
> index 000000000000..493ab6febcb2
> --- /dev/null
> +++ b/arch/riscv/lib/strncmp.S
> @@ -0,0 +1,40 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm-generic/export.h>
> +
> +/* int strncmp(const char *cs, const char *ct, size_t count) */
> +SYM_FUNC_START(strncmp)
> +	/*
> +	 * Returns
> +	 *   a0 - comparison result, value like strncmp
> +	 *
> +	 * Parameters
> +	 *   a0 - string1
> +	 *   a1 - string2
> +	 *   a2 - number of characters to compare
> +	 *
> +	 * Clobbers
> +	 *   t0, t1, t2
> +	 */
> +	li	t0, 0
> +1:
> +	beq	a2, t0, 4f
> +	add	t1, a0, t0
> +	add	t2, a1, t0
> +	lbu	t1, 0(t1)
> +	lbu	t2, 0(t2)
> +	beq	t1, t2, 3f
> +	li	a0, 1
> +	bgeu	t1, t2, 2f
> +	li	a0, -1
> +2:
> +	ret
> +3:
> +	addi	t0, t0, 1
> +	bnez	t1, 1b
> +4:
> +	li	a0, 0
> +	j	2b

(untested)

     li      t2, 0
1:
     beq     a2, t2, 2f
     lbu     t0, 0(a0)
     lbu     t1, 0(a1)
     addi    a0, a0, 1
     addi    a1, a1, 1
     bne     t0, t1, 3f
     addi    t2, t2, 1
     bnez    t0, 1b
2:
     li      a0, 0
     ret
3:
     slt     a1, t1, t0
     slli    a1, a1, 1
     li      a0, -1
     add     a0, a0, a1
     ret

> +SYM_FUNC_END(strncmp)
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index dd58e1d99397..d16bf715a586 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -2,6 +2,7 @@
>  OBJECT_FILES_NON_STANDARD := y
>  
>  purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
> +purgatory-y += strcmp.o strlen.o strncmp.o
>  
>  targets += $(purgatory-y)
>  PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
> @@ -18,6 +19,15 @@ $(obj)/memcpy.o: $(srctree)/arch/riscv/lib/memcpy.S FORCE
>  $(obj)/memset.o: $(srctree)/arch/riscv/lib/memset.S FORCE
>  	$(call if_changed_rule,as_o_S)
>  
> +$(obj)/strcmp.o: $(srctree)/arch/riscv/lib/strcmp.S FORCE
> +	$(call if_changed_rule,as_o_S)
> +
> +$(obj)/strlen.o: $(srctree)/arch/riscv/lib/strlen.S FORCE
> +	$(call if_changed_rule,as_o_S)
> +
> +$(obj)/strncmp.o: $(srctree)/arch/riscv/lib/strncmp.S FORCE
> +	$(call if_changed_rule,as_o_S)
> +
>  $(obj)/sha256.o: $(srctree)/lib/crypto/sha256.c FORCE
>  	$(call if_changed_rule,cc_o_c)
>  
> @@ -77,6 +87,9 @@ CFLAGS_ctype.o			+= $(PURGATORY_CFLAGS)
>  AFLAGS_REMOVE_entry.o		+= -Wa,-gdwarf-2
>  AFLAGS_REMOVE_memcpy.o		+= -Wa,-gdwarf-2
>  AFLAGS_REMOVE_memset.o		+= -Wa,-gdwarf-2
> +AFLAGS_REMOVE_strcmp.o		+= -Wa,-gdwarf-2
> +AFLAGS_REMOVE_strlen.o		+= -Wa,-gdwarf-2
> +AFLAGS_REMOVE_strncmp.o		+= -Wa,-gdwarf-2
>  
>  $(obj)/purgatory.ro: $(PURGATORY_OBJS) FORCE
>  		$(call if_changed,ld)
> -- 
> 2.35.1
>

With at least the removal of the unnecessary preserving of a1 in strcmp,
then it looks correct to me, so

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

But I think there's room for making it more readable, and maybe even
optimized, as I've tried to do.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
