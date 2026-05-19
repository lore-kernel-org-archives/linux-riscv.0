Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B601CD4851
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PFmefKW4uoIa0CEtYP6sTDUQiSDpXoydjWoguXm99E=; b=yoSdryX+uk2wio
	7HizGX3VErB8Yiwmg2gzMVoEdp5ci2iRm6wxQZ/nkj3hoMdEAYitdOAVBuCr05frd3gKkl4uJ4eUb
	IJAXxvxybKyEB9la/Nof5r6LDzYuuvDzt2quEAV4BxFpfanJgnx3m1IEr9rLSeg/yLoRULYyb6Y7T
	aG5TAU7viLFtiSQMD7iJF2MZmM/oOCOsSWjcdWn/CDYg0BadUsvHCm9QymVhJR6KPw0XBT/2hslzR
	wdIgKZb0eEtERnhttp/G1jNgQyX+xUZ+7DjH5x0Z2DBYVcxXuMyQpshXYNA/QVStLBeQ0xcdXVmUe
	vnDhWI+9fV2ahNc2gZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGSO-00000000rad-1FDX;
	Tue, 19 May 2026 09:09:44 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGSL-00000000rYo-2gaz
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 09:09:43 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so367616f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 02:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779181780; x=1779786580; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+iXZtTOejOCcBOlkcK88mcsIwo9JMpHwqyMFaYtyNQ=;
        b=C/2l1M3HRdQOnzXhuazJhXGPJF1QZKs4CYyZzj9VkZ6olLJj2Nq0/YUggBJBOY9HAU
         hhQSq6DZjDPOB+d1ogvBY5S9jeNi4TPstGx9Ta9et3jrAvv8rSfKoXj+mLrc8P6b5eQA
         lbq9Y/FUrRj3yK4na60nxo6HOV8ylFRTRAL4+Cg1PmJXOjEOUtuQyDPc8EVN8izm5L4k
         yWM/lcbVPmQgDrog+WxHNoMClvU3GFr5T/pWwRggWUaiVPvUnsyawjm7zm5ioCZefWdv
         NY3G+zW1NJQd9nr5GHaVBvLLTck4X1ruRbQSI4To9/LsaTj3clRNQE6cL63mIwanLBsL
         w8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181780; x=1779786580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h+iXZtTOejOCcBOlkcK88mcsIwo9JMpHwqyMFaYtyNQ=;
        b=gKGdWTOTAhp83dowot1L8r8tiq+9gbUFflpCJX3GJZmPbkmFVIp6gt+rGeyAvsElQS
         wUJotfHZa9NZTtwxXkE0muW6RkEWJ788xkhxRo+Rr4VXgsPRFAj4BQ7+vkgx0JuRqv5z
         wYnM3mC6P+p5ta20HedGU7yoyEOEOpBVIonGmTUlomUlQM9h5kIEUGWoKuJa8mtsnIGH
         pPxJfJWzxRMQL82FNZFqZGHqQdiQZTQd5S9JqrkR1t0doIT+31RtrVVHFhyuAkORbiFy
         nBLJ57imz4ay8kUJ4aeNSHv4BEolkswLjANmPiCsk8U/t12yjz21d58irKpZlJTwoyY6
         v5Zw==
X-Gm-Message-State: AOJu0Yxgak7Xjrmy267gslG1mLkysAyk4hgRIBPvRBR3cAeF8OPi5zfU
	ADqJOXZLmfI626L/aLF6PrwueESB4KLtSD1V2Em9KMG9zTIxEzLQFhlx
X-Gm-Gg: Acq92OFcKhJzVq3LzBKrQy+STqGwCeqKU74t7n1k1XAYVEMkW9fhYzuaKWmrO/EfpCs
	ghhnnBWO7yZz1cWJd/zcp5UIcxnLxOL+cCHKo+KZo06m+F2GGxPNQJJ3bHLypUcEW1A5sl1kxh0
	KrIr7V07E0ahrvC+LcdEvrB6aui17vb5Vj9K9ltlvS44Zw2GKiLDdF14vaoW2uiysd6v2QpehsV
	lXTnafNv1itV3s5pnVnGnSXdkjYEmCUopB6vaAHyf1w6hz/nJh9PAVMfjUrdQEOoJUD0ZdBG0eJ
	l3yOoqUgvCx1emKoJrPQ9xjT1W8XwtSdr0yeXRLqdFgefqvNiiEzsGb1kFJj2FHcgnPMCpiERr0
	HIq/zOw1pS5LL1zRhsesW13q5X4fUEVvvKk080Txp1JUm3b5Bz6WK5nw6SVz4iD+t79C7E1W4G0
	KtxbYPuh6pRbnFtFIU3IJ03Rjwg1Zy1sqrmQrvJcA92Ndet9PR0lKKGpeStInizxcm
X-Received: by 2002:a05:6000:2902:b0:43f:ea25:20ff with SMTP id ffacd0b85a97d-45e5c594d5dmr28915798f8f.29.1779181779524;
        Tue, 19 May 2026 02:09:39 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a178adsm46500351f8f.18.2026.05.19.02.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:09:38 -0700 (PDT)
Date: Tue, 19 May 2026 10:09:37 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Milan Tripkovic <milant2002@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kees@kernel.org, andy@kernel.org, linux-hardening@vger.kernel.org,
 Dusan.Stojkovic@rt-rk.com, Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
Subject: Re: [PATCH v4 1/2] riscv: lib: add memcmp() implementation
Message-ID: <20260519100937.1a186752@pumpkin>
In-Reply-To: <20260518131407.1026049-2-milant2002@gmail.com>
References: <20260518131407.1026049-1-milant2002@gmail.com>
	<20260518131407.1026049-2-milant2002@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020941_728361_E8881149 
X-CRM114-Status: GOOD (  24.49  )
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

On Mon, 18 May 2026 15:14:06 +0200
Milan Tripkovic <milant2002@gmail.com> wrote:

> From: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
> 
> Add an assembly implementation of memcmp() for RISC-V. The implementation
> uses the ZBB extension for word-at-a-time comparison and an assembly
> fallback for non-ZBB systems.

I think I mentioned before that the only ZBB bit I can see is the
byte reverse at the end needed to get the correct sign.
For non-ZBB it would be better to fall back to a byte compare
at that point.

Oh - and there should be change info for this patch in this email.

-- David

> 
> Benchmark results (QEMU TCG, rv64, Aligned):
> 
>   Len   | Default | NoZBB  | ZBB    | %NoZBB | %ZBB
>   ------|---------|--------|--------|--------|-------
>   1 B   | 20.3    | 25.0   | 20.9   | +23.2% | +3.0%
>   7 B   | 88.9    | 107.5  | 155.7  | +20.9% | +75.1%
>   8 B   | 89.6    | 110.9  | 176.2  | +23.8% | +96.7%
>   16 B  | 134.4   | 172.4  | 334.8  | +28.3% | +149.1%
>   31 B  | 163.5   | 220.5  | 606.2  | +34.9% | +270.8%
>   64 B  | 203.8   | 235.9  | 968.6  | +15.8% | +375.3%
>   127 B | 224.6   | 268.7  | 1362.8 | +19.6% | +506.8%
>   512 B | 235.7   | 271.1  | 1913.7 | +15.0% | +711.9%
>   1024 B| 256.8   | 290.6  | 2123.6 | +13.2% | +726.9%
>   4096 B| 263.8   | 302.9  | 2290.4 | +14.8% | +768.2%
> 
> Benchmark results (QEMU TCG, rv64, Unaligned - Offset 3):
> 
>   Len   | Default | NoZBB  | ZBB    | %NoZBB | %ZBB
>   ------|---------|--------|--------|--------|-------
>   1 B   | 20.7    | 21.7   | 21.5   | +4.8%  | +3.9%
>   7 B   | 96.2    | 99.1   | 96.9   | +3.0%  | +0.7%
>   8 B   | 97.5    | 118.5  | 110.5  | +21.5% | +13.3%
>   16 B  | 136.7   | 166.6  | 172.8  | +21.9% | +26.4%
>   31 B  | 167.6   | 206.5  | 211.9  | +23.2% | +26.4%
>   64 B  | 204.4   | 229.9  | 240.3  | +12.5% | +17.6%
>   127 B | 229.6   | 261.7  | 269.0  | +14.0% | +17.2%
>   512 B | 245.5   | 260.8  | 269.9  | +6.2%  | +9.9%
>   1024 B| 246.9   | 261.2  | 283.5  | +5.8%  | +14.8%
>   4096 B| 250.7   | 295.8  | 299.7  | +18.0% | +19.5%
> 
> Signed-off-by: Milan Tripkovic <Milan.Tripkovic@rt-rk.com>
> ---
>  arch/riscv/include/asm/string.h |   2 +
>  arch/riscv/lib/Makefile         |   1 +
>  arch/riscv/lib/memcmp.S         | 125 ++++++++++++++++++++++++++++++++
>  arch/riscv/purgatory/Makefile   |   5 +-
>  4 files changed, 132 insertions(+), 1 deletion(-)
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
> index 000000000..a531e481c
> --- /dev/null
> +++ b/arch/riscv/lib/memcmp.S
> @@ -0,0 +1,125 @@
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
> +#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
> +memcmp_zbb:
> +
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
> + *	t0, t1, t2, t3, t4
> + */
> +	add	t3, a0, a2
> +	or	t0, a0, a1
> +	andi	t0, t0, (SZREG - 1)
> +	bnez	t0, 5f
> +
> +	addi	t4, t3, -SZREG
> +	bltu	t4, a0, 7f
> +
> +1:
> +	REG_L	t1, 0(a0)
> +	REG_L	t2, 0(a1)
> +	bne	t1, t2, 2f
> +	addi	a0, a0, SZREG
> +	addi	a1, a1, SZREG
> +	bleu	a0, t4, 1b
> +
> +7:
> +	beq	a0, t3, 4f
> +	REG_L	t1, 0(a0)
> +	REG_L	t2, 0(a1)
> +
> +	sub	t0, t3, a0
> +	li	t4, SZREG
> +	sub	t0, t4, t0
> +	slli	t0, t0, 3
> +
> +#ifndef CONFIG_CPU_BIG_ENDIAN
> +	rev8	t1, t1
> +	rev8	t2, t2
> +#endif
> +	srl	t1, t1, t0
> +	srl	t2, t2, t0
> +
> +	bne	t1, t2, 8f
> +	li	a0, 0
> +	ret
> +5:
> +	beq	a0, t3, 4f
> +6:
> +	lbu	t1, 0(a0)
> +	lbu	t2, 0(a1)
> +	bne	t1, t2, 3f
> +	addi	a0, a0, 1
> +	addi	a1, a1, 1
> +	bne	a0, t3, 6b
> +
> +4:	li	a0, 0
> +	ret
> +2:
> +#ifndef CONFIG_CPU_BIG_ENDIAN
> +	rev8	t1, t1
> +	rev8	t2, t2
> +#endif
> +8:
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
> +#endif
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
