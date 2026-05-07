Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A8ACD3427
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 10:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9D5kQ0P4B07E1siNeE69eur5Zc5WADoA7Nt2oCeXdfw=; b=s2keLon4oWzSHO
	dd/hzXuoUZxEEffAoF1y9mMoGjImONftJpjcHbiIvOC4r2DmOqHl2pcKHXnqzvmQGKSxxNHPPlmH7
	+bSk2Vd1jwJHK2ZC3eV1/mOsKgx4mIwAiDXRZNrtVuk8y6mBo3WxsyM6QlAiLUArmnhRv5KlQmFht
	x/dIGdkwPrc35SW/6rCYfXHf8DYFHNvbWjuVA9cwOoOSOxv+cyxpCTEcIN+B5XWe7irmYQrDVfPc0
	lHAdgP3j/6ppybcHLC3pH+gZxOQiKu79nr620dA1OIjLTvvbdNsM9YJXUD154aHbU8vhzV1p2ka4U
	KClXUYIUEYMthzXFcOnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvsP-00000003TNP-3uMz;
	Thu, 07 May 2026 10:22:41 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvsN-00000003TMI-0OE5
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 10:22:40 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-44985f4ab0fso384691f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 May 2026 03:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778149357; x=1778754157; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VG5+crceacfEG7lUxSRm1vLSDuNECrSBsB0KagNLyvo=;
        b=jbfafNoAqjJCHEtlS28llgAfCz8Rq3dR2QYjfb87agd9bf75Uc4yRoznp62BFAoKjh
         rbtq/0Em01KxFiDdheIscxiS0eLuRvVM9yU6ufk6Nr67Gw7E+jOYnRnCDpgIH9T7kYVg
         Ok+OTRHCv1w7LBy4OSVjh5Veuc0Iss0olTcPjFzNkf9Ukwjk9Sfo1hI4IQmEGQrKOOFu
         rB7v50vwVLms/JMRE5CFbBORMXm3Sh68FvercrIfGHsVjse4Fj3ZlpAxUZPKt5/kfS2o
         uuOkPWfqEI5Tj1eP/vTRIcGB2UVF4jIxifx05fy6nJ/Q37W34ccKOof1byautydnaghE
         YJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778149357; x=1778754157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VG5+crceacfEG7lUxSRm1vLSDuNECrSBsB0KagNLyvo=;
        b=sQdQZYGX8ZbMV1Az+KgfRXK6QSFsHr/OsSf32uEMwAC8msNrALj1X2PWOJTgRXFsYd
         LBxarIhtei8EUjy7i7gJZ2TCaEqdt+or6I1JcxB5QoHoLrm1dtEKhmmxlcAmOQX9Q2jU
         0VHiyPBKUFKB08aZQ4xTYmx9VaWX9tfhfK/UTgJKb1SfAMlovZ/LXysmlog5Ynmm3woW
         KfQiDcJqTBtOlQx/yhDP2zktnuORYQ3y3Lqo0lydPK2JQrm0Acn+BvcGQOzEWlSgo/bU
         aNJGoCd8w/SrYdEVIOFkTc7RZ4hAvkOvVWp9z18PEMsKZSBYnmlktsoeHWJQ7dPyCcDS
         JdEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/G8ZzYHheUhAkiBB69Awoj+u7hyJD2Otd+7tNXuMWtsCn8VK1iBY/9dTusndFf2pCZv4FHerIJ7YrVBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf4R9pgdYBC+ZbSVpHPi2ou7MA/ea53ptQKUqIVOYd1O4aro2u
	oPYweIBZtkuNjdDLnpLe5NfcCUs4PJOwYU9Pnjge3OfMeTLBLw4mTBRR
X-Gm-Gg: AeBDieu2Pfm+tDE/4/Ljoai6nKHMjq/FUgUThtupiG1Wiaa4iC3zmXJzDvABk4cG3cV
	DLEtn0WbOr+IpeHRJEEzr9jZLmrGrunyszuYhmmxZBjnLjf+M+DnwXx2EEL5C9Pz6KnB4W4Upri
	MpwvfEQr7i//vAr7keQLpaK30KY3z13v0sYH4P+CMvJ7Bbonmj353KTu/Jl24rJlOyqxRieovn6
	3sLTS2yJDM62t3l0Ai9XwCfKUjwV0fY50AcVS1mhIdIOjIDkcDteIcbts3s+oSl9VU7fnp8+Xg7
	D8Ae7GkZMLP5bqUei8uyNFdk0Cp5oIB0Nj1E/z44deuoP6qwh/PwJMwaghi9K758v+peXN6aHSE
	ZdyzIZwWVD5hlTSntuUG6naFaflwgBGx+xQsD+kcAy8DokIUW+MinsZMjoSafQqk22+BQ5mPsXE
	1UEbcBOxSMo6mCCz5BJVgvju0kUVHuWFiFhynXD7EgJHusFlEgtn3bXHhaJavwkdQYqwfehog=
X-Received: by 2002:a05:6000:4203:b0:441:36b7:7262 with SMTP id ffacd0b85a97d-4515b61ae87mr11877520f8f.13.1778149356886;
        Thu, 07 May 2026 03:22:36 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055f2203csm19358959f8f.37.2026.05.07.03.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 03:22:36 -0700 (PDT)
Date: Thu, 7 May 2026 11:22:35 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Zongmin Zhou <min_halo@163.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] riscv: lib: optimize strchr() with Zbb extension
Message-ID: <20260507112235.41e539fa@pumpkin>
In-Reply-To: <20260507020620.134225-1-min_halo@163.com>
References: <20260507020620.134225-1-min_halo@163.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_032239_170929_458784A1 
X-CRM114-Status: GOOD (  23.43  )
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

On Thu,  7 May 2026 10:06:20 +0800
Zongmin Zhou <min_halo@163.com> wrote:

> From: Zongmin Zhou <zhouzongmin@kylinos.cn>
> 
> Add a Zbb-powered optimization to the existing strchr() implementation
> using the 'orc.b' instruction, following the same pattern established
> by strnlen().
> 
> The Zbb variant processes data in word-sized chunks using orc.b to
> detect both NUL terminators and target characters in parallel. On
> systems without Zbb support, the original byte-by-byte implementation
> is used as a fallback via the alternatives mechanism.
> 
> Benchmark results (QEMU TCG, rv64):
>   Length | zbb=off (MB/s) | zbb=on (MB/s) | Improvement
>   -------|----------------|---------------|------------
>   1 B    | 27             | 25            | -7.4%
>   7 B    | 147            | 128           | -12.9%
>   16 B   | 216            | 372           | +72.2%
>   64 B   | 378            | 958           | +153.4%
>   512 B  | 480            | 1990          | +314.6%
>   4096 B | 501            | 2269          | +352.9%
> 
> The regression on very short strings (1-7 bytes) is due to the fixed
> overhead of the word-level path: broadcasting the target character to
> all byte lanes via multiplication and checking pointer alignment before
> entering the main loop. For strings shorter than one machine word, this
> setup cost outweighs the benefit of parallel comparison. As string
> length increases beyond 16 bytes, the word-at-a-time processing shows
> significant gains.
> 
> Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
> ---
>  arch/riscv/lib/strchr.S | 115 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
> 
> diff --git a/arch/riscv/lib/strchr.S b/arch/riscv/lib/strchr.S
> index 48c3a9da53e3..600b19452bc2 100644
> --- a/arch/riscv/lib/strchr.S
> +++ b/arch/riscv/lib/strchr.S
> @@ -6,9 +6,15 @@
>  
>  #include <linux/linkage.h>
>  #include <asm/asm.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/hwcap.h>
>  
>  /* char *strchr(const char *s, int c) */
>  SYM_FUNC_START(strchr)
> +
> +	__ALTERNATIVE_CFG("nop", "j strchr_zbb", 0, RISCV_ISA_EXT_ZBB,
> +		IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
> +
>  	/*
>  	 * Parameters
>  	 *   a0 - The string to be searched
> @@ -29,6 +35,115 @@ SYM_FUNC_START(strchr)
>  	li	a0, 0
>  2:
>  	ret
> +
> +/*
> + * Variant of strchr using the ZBB extension if available
> + *
> + * This implementation uses orc.b to detect both NUL terminators and target
> + * characters in parallel, processing word-sized chunks for efficiency.
> + */
> +#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
> +strchr_zbb:
> +
> +#ifdef CONFIG_CPU_BIG_ENDIAN
> +# define CZ	clz
> +#else
> +# define CZ	ctz
> +#endif
> +
> +.option push
> +.option arch,+zbb
> +
> +	/*
> +	 * Returns
> +	 *   a0 - Address of first occurrence of 'c' or NULL
> +	 *
> +	 * Parameters
> +	 *   a0 - String to search
> +	 *   a1 - Character to find
> +	 *
> +	 * Clobbers
> +	 *   t0, t1, t2, t3, t4
> +	 */
> +
> +	/*
> +	 * Prepare target character mask.
> +	 * Broadcast target character to all bytes using multiply.
> +	 */
> +	andi	a1, a1, 0xff
> +	li	t1, 0x01010101
> +#if __riscv_xlen == 64
> +	slli	t2, t1, 32
> +	or	t1, t1, t2
> +#endif
> +	mul	t2, a1, t1
> +
> +	/* All-ones mask for orc.b comparisons. */
> +	li	t4, -1
> +
> +	/* Check alignment. */
> +	andi	t0, a0, SZREG-1
> +	beqz	t0, 2f

It is almost certainly faster to jump 'out of line' for misaligned
strings and fallthrough for aligned ones.

> +
> +	/* Handle misaligned portion byte-by-byte. */
> +1:
> +	lbu	t1, 0(a0)
> +	beq	t1, a1, 9f
> +	beqz	t1, 8f
> +	addi	a0, a0, 1
> +	andi	t0, a0, SZREG-1
> +	bnez	t0, 1b
> +
> +	/* Main loop: process word-sized chunks. */

Tweak to remove a branch from the loop:
	addi	a0, a0, -SZREG

> +2:
> +	REG_L	t0, 0(a0)

Do read first for better instruction scheduling.
	REG_L	t0, SZREG(a0)
	addi	a0, a0, SZREG

> +
> +	/* Check for NUL terminator. */
> +	orc.b	t1, t0
> +	bne	t1, t4, 3f
> +
> +	/* Check for target character. */
> +	xor	t1, t0, t2
> +	orc.b	t1, t1
> +	bne	t1, t4, 4f

	be	t1, t4, 2b
and move the code at '4:' here.

-- David

> +
> +	addi	a0, a0, SZREG
> +	j	2b
> +
> +3:
> +	/* NUL found in current chunk. Check if target appears before NUL. */
> +	not	t1, t1
> +
> +	xor	t3, t0, t2
> +	orc.b	t3, t3
> +	not	t3, t3
> +
> +	CZ	t3, t3
> +	CZ	t1, t1
> +
> +	/* If NUL appears before target, character not found. */
> +	bltu	t1, t3, 8f
> +
> +	srli	t3, t3, 3
> +	add	a0, a0, t3
> +	ret
> +
> +4:
> +	/* Target found in chunk without NUL. */
> +	not	t1, t1
> +	CZ	t1, t1
> +	srli	t1, t1, 3
> +	add	a0, a0, t1
> +	ret
> +
> +8:
> +	/* Character not found, return NULL. */
> +	li	a0, 0
> +9:
> +	ret
> +
> +.option pop
> +#endif
>  SYM_FUNC_END(strchr)
>  
>  SYM_FUNC_ALIAS_WEAK(__pi_strchr, strchr)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
