Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409B1CD4F24
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=riOtFtKql6nV5y4xFmmQuZXCUlNfQhMxzh/oTWhUzCw=; b=2xWYxCXprCJTlF
	4yi2h2DBSlDbf9S2IPUsx46sNfr4wxTbgQY3k5OAJL9IqxN3ym1RKq1pyd0HsSYjexvEoERSVHNTD
	x2rVr6pxa8UukRrhM8vLjK6dkuCGcEtQKcZQd7NIb1JeyCCzRZg/XVR12LprhhE9I8wMnlqgrl5Mk
	bktKSUXhs3blHo9aHXbvVB5KgpDhOkkAlu0zZtRZGoxnCCQEwv0elm6EwAxV9UQhQ6Pgdz6tRPw5v
	fbAGLFxUCqwbvIv5ZW2JYxpAFXJS7OMH6MXQhvzh21nsuQSzrK+NT5xuDOhcI/bX+nj6IDl5hNbba
	BOdOUhD34OXTZQvD81OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6DD-00000001z9M-45W8;
	Wed, 13 May 2026 09:49:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN6DB-00000001z86-0Fnr
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 09:49:06 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488d2079582so68682765e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 02:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778665743; x=1779270543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1ByYmYroktLw1pdZDAPFuPAbUc0Nudy+RxlkHPvcPM=;
        b=FM/4hx+eqBGdbqdElUT7z4M2INGZSt2XxYvEiEuaWEa7KHzHUEgOjfB+6DjnHTOE6h
         QApv3l0j/DYN/zIZla/QRi8z28wx0+Vb3A6CpW4zPW+glbl6O7zOYp0zcVhgk725Jo1A
         2R7alno5RRnnbajpzMA0v8tmFBSZrotDHPFbG9b/1EWD53wP++hjI6zJHmboIyG1dWBO
         KUZx4+G0Nf6eORI+xvtng2WRqK5dSY+XXBtU7PRP6ZEJBXAsnQIgVdfXKNfh7f5YXwOc
         suj1/Myynv6yiuU+xViuxB75xXOCLFjfWITePrnRm2BzTUrCL+gNiNanfeHoVGZZeMi4
         q0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778665743; x=1779270543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y1ByYmYroktLw1pdZDAPFuPAbUc0Nudy+RxlkHPvcPM=;
        b=laRFYmAJQyM+CscYzrkCtwUbiJN99RdS63PbE/Cn9xupEMoy1PmtrJBfg4ZgI4WZCR
         i1Rx2Y/3Xz1Kq8vvHVCYH78XzVCtBNS+389JjuviUJyIQrbcD7bL67KWc+zrld059EET
         CfhKf6IRKrzbu/EO0pYl4J/SohJBxwxtQMqzGI0zSpAcOVR3pFOJMwWJojsOCgxbzf+x
         KoqGBSbdGw1x+BXn8f7mPC1nygij7X/VuUDr7V6RwhYSanwLMj8PHruBBO1Zm6EFpA5f
         voGr122u9Vt+AJv5nQRz3NRc38G3joIsvsM/ehW0qv9MemMYPTsSaSChHUAYPKlddQBX
         eVVg==
X-Forwarded-Encrypted: i=1; AFNElJ91cB3MkgZE6v70ULsubIFJYbgqPTBtaiQiAJnfcCKJ+v/8PYbpv8HPA0Rfpw9c5BbFQu2sEfo7XrDMIg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/m8+1TRTGU0gFIRTeL3la1bJjZ2KU9dqo31fijcXDF/4yPKbv
	RekM5qAxVXtLjnQzsimJ+1+ghdzpIBujpC0Rox8jqff8gIinY0Q3iRXS
X-Gm-Gg: Acq92OHO2FEWdU2JjbG+VUvPyO7Wl0BemJaaYytJ7ysj3a+pd3D4qqHm0XBXS12tHDz
	ZhfRCtMEqoQbzojHVwGcsZEWjhgtlonlwNTe8GYr2KEi6D/83Ca5FVoRFfp8CXTHX8OGMKd8HzF
	ZXg7d2gysvG+EaYL9Uw2zpHUP/p6EzItT83MegDGhr48sFltXEeE8DeNneeo1CZ6Z7uFKwzotVS
	XaKtVbWtmk8tnxiKMa+8dqQGdtPfmkmmTLw3kqplTyvAo1wuHK0BFaDmLHvILUQbr/3M0l2/kOz
	U8gVU/sjJd5pZ7tiuG6vVVUUo6Oip1F43QddgH9jTGToUHNkCWBA59nA2BBAGqjPjfagHQOF1gw
	jRZiMXqcn7BGRFYlWdPyYE1YTmoH6k0uxsyKev5A/svacf7yPg3bBj6VbMLZORpzPTVIW+2rHfg
	LY7OS/eTAiTlrHdFkS3xAYwmzd3l9Kx1frwqmHHmhshqY6iDQE/p2cn5pgntVk
X-Received: by 2002:a05:600c:154a:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48fce9da5e0mr24828215e9.18.1778665742833;
        Wed, 13 May 2026 02:49:02 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fce05e45esm36992975e9.4.2026.05.13.02.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 02:49:02 -0700 (PDT)
Date: Wed, 13 May 2026 10:49:01 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Milan Tripkovic <milant2002@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dusan
 Stojkovic <dusan.stojkovic@rt-rk.com>, Milan Tripkovic
 <milan.tripkovic@rt-rk.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] riscv: lib: add memcmp() implementation
Message-ID: <20260513104901.719ac53a@pumpkin>
In-Reply-To: <20260512141007.1193033-1-milant2002@gmail.com>
References: <20260512141007.1193033-1-milant2002@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_024905_140987_6A9EF32E 
X-CRM114-Status: GOOD (  24.78  )
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

On Tue, 12 May 2026 16:10:06 +0200
Milan Tripkovic <milant2002@gmail.com> wrote:

> From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
> 
> Add an assembly implementation of memcmp() for RISC-V. The implementation
> uses the ZBB extension for word-at-a-time comparison and an assembly
> fallback for non-ZBB systems.
> 
> Benchmark results (QEMU TCG, rv64):
> 
>   Len  | Def   | NoZBB | ZBB   | %NoZBB | %ZBB
>   -----|-------|-------|-------|--------|-------
>   1 B  | 22.4  | 24.6  | 23.2  | +9.8%  | +3.5%
>   7 B  | 96.9  | 108.5 | 107.3 | +12.0% | +10.7%
>   8 B  | 107.0 | 116.3 | 176.7 | +8.7%  | +65.1%
>   16 B | 148.4 | 172.8 | 315.6 | +16.4% | +112.6%
>   31 B | 182.2 | 217.1 | 377.6 | +19.2% | +107.2%
>   64 B | 220.6 | 239.4 | 874.2 | +8.5%  | +296.2%
>   127 B| 213.7 | 254.8 | 1042.9| +19.2% | +388.0%
>   512 B| 255.1 | 269.0 | 1778.6| +5.4%  | +597.2%
>   1024B| 252.3 | 280.9 | 1887.7| +11.3% | +648.1%
>   3173B| 241.3 | 288.7 | 2063.2| +19.6% | +755.0%
>   4096B| 240.9 | 280.5 | 2064.5| +16.4% | +756.9%
> 
> Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
> ---
>  arch/riscv/include/asm/string.h |   2 +
>  arch/riscv/lib/Makefile         |   1 +
>  arch/riscv/lib/memcmp.S         | 103 ++++++++++++++++++++++++++++++++
>  arch/riscv/purgatory/Makefile   |   5 +-
>  4 files changed, 110 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/lib/memcmp.S
> 
> diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
> index 764ffe8f6..5c5299678 100644
> --- a/arch/riscv/include/asm/string.h
> +++ b/arch/riscv/include/asm/string.h
> @@ -18,6 +18,8 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
>  #define __HAVE_ARCH_MEMMOVE
>  extern asmlinkage void *memmove(void *, const void *, size_t);
>  extern asmlinkage void *__memmove(void *, const void *, size_t);
> +#define __HAVE_ARCH_MEMCMP
> +extern asmlinkage int memcmp(const void *, const void *, size_t);
>  
>  #if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
>  #define __HAVE_ARCH_STRCMP
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 6f767b2a3..b529e1be1 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -3,6 +3,7 @@ lib-y			+= delay.o
>  lib-y			+= memcpy.o
>  lib-y			+= memset.o
>  lib-y			+= memmove.o
> +lib-y			+= memcmp.o
>  ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
>  lib-y			+= strcmp.o
>  lib-y			+= strlen.o
> diff --git a/arch/riscv/lib/memcmp.S b/arch/riscv/lib/memcmp.S
> new file mode 100644
> index 000000000..444b082d9
> --- /dev/null
> +++ b/arch/riscv/lib/memcmp.S
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/hwcap.h>
> +
> +/* int memcmp(const void *cs, const void *ct, size_t n) */
> +SYM_FUNC_START(memcmp)
> +
> +	__ALTERNATIVE_CFG("nop", "j memcmp_zbb", 0, RISCV_ISA_EXT_ZBB,
> +		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
> +/*
> + * Parameters
> + *	a0 - Pointer to first memory block (cs), also return value
> + *	a1 - Pointer to second memory block (ct)
> + *	a2 - Number of bytes to compare (n), transformed to end pointer (a0 + n)
> + *
> + * Returns
> + *	a0 - 0 if equal, positive if cs > ct, negative if cs < ct
> + *
> + * Clobbers
> + *	t0, t1
> + */
> +	beqz	a2, 2f
> +	add	a2, a0, a2
> +1:
> +	lbu	t0, 0(a0)
> +	lbu	t1, 0(a1)
> +	bne	t0, t1, 3f
> +	addi	a0, a0, 1
> +	addi	a1, a1, 1
> +	bne	a0, a2, 1b
> +2:
> +	li	a0, 0
> +	ret
> +3:
> +	sub	a0, t0, t1
> +	ret
> +
> +
> +memcmp_zbb:
> +.option push
> +.option arch,+zbb
> +/*
> + * Parameters
> + *	a0 - Pointer to first memory block (cs), also return value
> + *	a1 - Pointer to second memory block (ct)
> + *	a2 - Number of bytes to compare (n), decremented during loop
> + *
> + * Returns
> + *	a0 - 0 if equal, positive if cs > ct, negative if cs < ct
> + *
> + * Clobbers
> + *	t0, t1, t2
> + */
> +	beq	a0, a1, 4f

There is no point optimising for equal pointers.

> +
> +	li	t0, SZREG
> +	bltu	a2, t0, 5f
> +
> +1:
> +	REG_L	t1, 0(a0)
> +	REG_L	t2, 0(a1)

Aren't there some systems where misaligned reads are very expensive?
You might want to fall back to byte compares for misaligned buffers.

> +	bne	t1, t2, 2f
> +
> +	addi	a0, a0, SZREG
> +	addi	a1, a1, SZREG
> +	addi	a2, a2, -SZREG
> +	bgeu	a2, t0, 1b

You've a loop with two comparisons it in.
Move the length one to the top and the check before the loop shouldn't
be needed.

If you calculate the end address of one of the buffers you only
need two increments in the loop, not three.
You might need to access -SZREG(a0) to get the data.

> +
> +5:
> +	beqz	a2, 4f

If a0 and a1 are aligned you can read the next full word,
shift right (LE, left BE) and then compare.

> +6:
> +	lbu	t1, 0(a0)
> +	lbu	t2, 0(a1)
> +	bne	t1, t2, 3f
> +	addi	a0, a0, 1
> +	addi	a1, a1, 1
> +	addi	a2, a2, -1
> +	bnez	a2, 6b
> +
> +4:	li	a0, 0
> +	ret
> +2:
> +#ifndef CONFIG_CPU_BIG_ENDIAN
> +	rev8	t1, t1
> +	rev8	t2, t2
> +#endif

That looks like the only bit that needs zbb?
Is BIG_ENDIAN common enough to actually worry about?
You could just fall back to byte accesses (rereading memory) on BE.

-- David

> +	sltu	a0, t2, t1
> +	sltu	t0, t1, t2
> +	sub	a0, a0, t0
> +	ret
> +
> +3:
> +	sub	a0, t1, t2
> +	ret
> +
> +.option pop
> +
> +SYM_FUNC_END(memcmp)
> +SYM_FUNC_ALIAS(__pi_memcmp, memcmp)
> +EXPORT_SYMBOL(memcmp)
> diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
> index b0358a78f..456929971 100644
> --- a/arch/riscv/purgatory/Makefile
> +++ b/arch/riscv/purgatory/Makefile
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
> +purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o memcmp.o
>  ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
>  purgatory-y += strcmp.o strlen.o strncmp.o strnlen.o strchr.o strrchr.o
>  endif
> @@ -41,6 +41,9 @@ $(obj)/strchr.o: $(srctree)/arch/riscv/lib/strchr.S FORCE
>  $(obj)/strrchr.o: $(srctree)/arch/riscv/lib/strrchr.S FORCE
>  	$(call if_changed_rule,as_o_S)
>  
> +$(obj)/memcmp.o: $(srctree)/arch/riscv/lib/memcmp.S FORCE
> +	$(call if_changed_rule,as_o_S)
> +
>  CFLAGS_sha256.o := -D__DISABLE_EXPORTS -D__NO_FORTIFY
>  CFLAGS_string.o := -D__DISABLE_EXPORTS
>  CFLAGS_ctype.o := -D__DISABLE_EXPORTS


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
