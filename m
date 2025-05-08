Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3462AC3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 17:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/eM76+gmJSOY9IMPmOwOdZ4S5m3ZMOvH3Hkc8p9pllU=; b=ccqkcwmH1Du2Vb
	HxG57Z3Z/YDgdll5swDaJu44XjLwPn7c2axFosG8yibMlHyE6yhnz6Jnxa4FUnqDlSj4coUN0W9z+
	AtqkOkswfFteaMPYY1PWahZ6MxgDhnkTy7YcHCt1HvGCcqyGbNwtcf25OBiEgRem4Djln+N9XRoLI
	/wVNmgLA5fsR0D/bKf9QV5PadTp/PxJW0LPoHpyPGARUnTvnMrhkcxWuvRy7p7QvPvm1zd71JQPzQ
	e0NvAQUM8ZFh2bEG0zbNNP3YL3bDF7AN0QDxoZ8Cb7um7wwmZ4/4ziyCmOOJvir9DvhmjTr3wxwjr
	sfs7a1ikBHBfEVF6b80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5JX-00000001S7c-2Lgz;
	Thu, 08 May 2025 17:45:43 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD5JV-00000001S6u-28Kz
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 17:45:42 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3081fe5987eso1324109a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 10:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1746726340; x=1747331140; darn=lists.infradead.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dEAIpsuCysn8s52UezknC02k+EhomijIPzdPSULwJfQ=;
        b=SUP0U8t47EGYN/T9mBrsLdYWcKbEojZW0bXJhNE0AjwD1rSgfpM43MhpKa/4IR47Nc
         YgGW2NQl4wKEE+0NYaGiStMkYcswfzTKakwuaBsUuKJmXiIu20k8s69qtOTluNTB4t68
         ykcaIUaI+HdQOyEd+5r59QfQEuHpwRzopKvoPgbvh+refk1pVc3E4C/tIvoMh2fLXU3T
         BW4mc4Fi3530RXqBRijUnfbRitFbfw65+MtuJUSOCz/KodJieGmEPdvsaQLHi5uDzohz
         lT0wf9LSWNHHAQtZVZK2wtA2ag85FawaWS5To8Qiuxmho8tO7j8eUb+r7i7gEfnZGjl3
         0TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726340; x=1747331140;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dEAIpsuCysn8s52UezknC02k+EhomijIPzdPSULwJfQ=;
        b=FNnRDFNyW9euErXJGK624lAonnk/D36X3+ZiAdbBejj7+nyhDYzE8fYTzLFyw90Vjx
         TdqHtUwQBNFVPKlpOB0HgqV/US1i9hL6p6TlXQy0FCupWJvp+x+Do48vUcaSZ/sG+lxs
         ubt6rvHNgy4kGxNKcUx/yiNnMoieHwQ/ga72yYgRvAinnH2l6cjLuA3aQ3KQd7JuIwXL
         D16zOrNnjLaywXr80UI5Nbo9C1nwJ+pKQs6hCr3LwFUyAmkgh+ruTErNjVv2r2NVJHRs
         OUK0MNL3bhmjoo/7b3D+XQ0H+4WaJIesPj0eW98UaluwTO1YzrUeilzzIgtgtfxhFG9f
         7yvg==
X-Forwarded-Encrypted: i=1; AJvYcCUuOvu3Y7o9wyEwb4XnUQzVjJGkWxGFgG3ztfKQmk4VYA4M9yak0GXitSzCmThy7ViKPF/MdyQVKxNIpQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yytk3B29G+0BtDC/CNZHS1kNi2XQNE/jBZqWejC0qIPLE7j86oV
	h0SnZ7PgNjln2SK8Uw/WNsS1B5ClWm+zKcvws4FavQrErvfLyKcoc3OKZIvGFn0=
X-Gm-Gg: ASbGncuULwTT+8thwNQfQL1fQWzhoaCV/X49D+TuJ8Sj6JoHcZm2gKk9pPhnIQ7dvPm
	6j0QoBNR2aySGrYbkGg8prQhAsr2P8rOEprKpYL/ZpBQrGHKEBNZK28VOSlsB5ADdc1mEwwXJ9X
	HIv5Bglrjyc/0HrDdCmL9mXQsNLcP4XJAoIs6vY/6zhO7hui2zHVBsBPDDc5QxSAoLEvV79eUu9
	sO8a2r6PdKgHocnACLUARQ5b/Cw3WsdAyMImFZO6bnaGbyNWKAiByBok+aGkn1FYQAn8r5Dyo7X
	PNJIrfaG4Rb0WXHRDARi+PEP+O9bCvO3cw==
X-Google-Smtp-Source: AGHT+IHeD97pMTFuyKCP/YT5KvCO+fk1gqZ4VsKAgAj3Z3vrsQq843QhamFknnUEu4uFYy+vJhv0hg==
X-Received: by 2002:a17:90b:3f04:b0:308:539d:7577 with SMTP id 98e67ed59e1d1-30c3b915960mr891237a91.0.1746726340334;
        Thu, 08 May 2025 10:45:40 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30c39e6101dsm259626a91.36.2025.05.08.10.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 10:45:39 -0700 (PDT)
Date: Thu, 08 May 2025 10:45:39 -0700 (PDT)
X-Google-Original-Date: Thu, 08 May 2025 10:45:38 PDT (-0700)
Subject: Re: [PATCH v4 07/13] crypto: riscv/sha256 - implement library instead of shash
In-Reply-To: <20250428170040.423825-8-ebiggers@kernel.org>
CC: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
  linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
  linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, Jason@zx2c4.com,
  Linus Torvalds <torvalds@linux-foundation.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ebiggers@kernel.org
Message-ID: <mhng-0b1a0c43-eff8-4ea0-9aaa-46727504555c@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_104541_548711_0015F492 
X-CRM114-Status: GOOD (  31.53  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 28 Apr 2025 10:00:32 PDT (-0700), ebiggers@kernel.org wrote:
> From: Eric Biggers <ebiggers@google.com>
>
> Instead of providing crypto_shash algorithms for the arch-optimized
> SHA-256 code, instead implement the SHA-256 library.  This is much
> simpler, it makes the SHA-256 library functions be arch-optimized, and
> it fixes the longstanding issue where the arch-optimized SHA-256 was
> disabled by default.  SHA-256 still remains available through
> crypto_shash, but individual architectures no longer need to handle it.
>
> To match sha256_blocks_arch(), change the type of the nblocks parameter
> of the assembly function from int to size_t.  The assembly function
> actually already treated it as size_t.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  arch/riscv/crypto/Kconfig                     |  11 --
>  arch/riscv/crypto/Makefile                    |   3 -
>  arch/riscv/crypto/sha256-riscv64-glue.c       | 125 ------------------
>  arch/riscv/lib/crypto/Kconfig                 |   7 +
>  arch/riscv/lib/crypto/Makefile                |   3 +
>  .../sha256-riscv64-zvknha_or_zvknhb-zvkb.S    |   4 +-
>  arch/riscv/lib/crypto/sha256.c                |  62 +++++++++
>  7 files changed, 74 insertions(+), 141 deletions(-)
>  delete mode 100644 arch/riscv/crypto/sha256-riscv64-glue.c
>  rename arch/riscv/{ => lib}/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S (98%)
>  create mode 100644 arch/riscv/lib/crypto/sha256.c
>
> diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
> index 4863be2a4ec2f..cd9b776602f89 100644
> --- a/arch/riscv/crypto/Kconfig
> +++ b/arch/riscv/crypto/Kconfig
> @@ -26,21 +26,10 @@ config CRYPTO_GHASH_RISCV64
>  	  GCM GHASH function (NIST SP 800-38D)
>
>  	  Architecture: riscv64 using:
>  	  - Zvkg vector crypto extension
>
> -config CRYPTO_SHA256_RISCV64
> -	tristate "Hash functions: SHA-224 and SHA-256"
> -	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> -	select CRYPTO_SHA256
> -	help
> -	  SHA-224 and SHA-256 secure hash algorithm (FIPS 180)
> -
> -	  Architecture: riscv64 using:
> -	  - Zvknha or Zvknhb vector crypto extensions
> -	  - Zvkb vector crypto extension
> -
>  config CRYPTO_SHA512_RISCV64
>  	tristate "Hash functions: SHA-384 and SHA-512"
>  	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	select CRYPTO_SHA512
>  	help
> diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
> index 4ae9bf762e907..e10e8257734e3 100644
> --- a/arch/riscv/crypto/Makefile
> +++ b/arch/riscv/crypto/Makefile
> @@ -5,13 +5,10 @@ aes-riscv64-y := aes-riscv64-glue.o aes-riscv64-zvkned.o \
>  		 aes-riscv64-zvkned-zvbb-zvkg.o aes-riscv64-zvkned-zvkb.o
>
>  obj-$(CONFIG_CRYPTO_GHASH_RISCV64) += ghash-riscv64.o
>  ghash-riscv64-y := ghash-riscv64-glue.o ghash-riscv64-zvkg.o
>
> -obj-$(CONFIG_CRYPTO_SHA256_RISCV64) += sha256-riscv64.o
> -sha256-riscv64-y := sha256-riscv64-glue.o sha256-riscv64-zvknha_or_zvknhb-zvkb.o
> -
>  obj-$(CONFIG_CRYPTO_SHA512_RISCV64) += sha512-riscv64.o
>  sha512-riscv64-y := sha512-riscv64-glue.o sha512-riscv64-zvknhb-zvkb.o
>
>  obj-$(CONFIG_CRYPTO_SM3_RISCV64) += sm3-riscv64.o
>  sm3-riscv64-y := sm3-riscv64-glue.o sm3-riscv64-zvksh-zvkb.o
> diff --git a/arch/riscv/crypto/sha256-riscv64-glue.c b/arch/riscv/crypto/sha256-riscv64-glue.c
> deleted file mode 100644
> index c998300ab8435..0000000000000
> --- a/arch/riscv/crypto/sha256-riscv64-glue.c
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - * SHA-256 and SHA-224 using the RISC-V vector crypto extensions
> - *
> - * Copyright (C) 2022 VRULL GmbH
> - * Author: Heiko Stuebner <heiko.stuebner@vrull.eu>
> - *
> - * Copyright (C) 2023 SiFive, Inc.
> - * Author: Jerry Shih <jerry.shih@sifive.com>
> - */
> -
> -#include <asm/simd.h>
> -#include <asm/vector.h>
> -#include <crypto/internal/hash.h>
> -#include <crypto/internal/simd.h>
> -#include <crypto/sha256_base.h>
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -
> -/*
> - * Note: the asm function only uses the 'state' field of struct sha256_state.
> - * It is assumed to be the first field.
> - */
> -asmlinkage void sha256_transform_zvknha_or_zvknhb_zvkb(
> -	struct crypto_sha256_state *state, const u8 *data, int num_blocks);
> -
> -static void sha256_block(struct crypto_sha256_state *state, const u8 *data,
> -			 int num_blocks)
> -{
> -	/*
> -	 * Ensure struct crypto_sha256_state begins directly with the SHA-256
> -	 * 256-bit internal state, as this is what the asm function expects.
> -	 */
> -	BUILD_BUG_ON(offsetof(struct crypto_sha256_state, state) != 0);
> -
> -	if (crypto_simd_usable()) {
> -		kernel_vector_begin();
> -		sha256_transform_zvknha_or_zvknhb_zvkb(state, data, num_blocks);
> -		kernel_vector_end();
> -	} else
> -		sha256_transform_blocks(state, data, num_blocks);
> -}
> -
> -static int riscv64_sha256_update(struct shash_desc *desc, const u8 *data,
> -				 unsigned int len)
> -{
> -	return sha256_base_do_update_blocks(desc, data, len, sha256_block);
> -}
> -
> -static int riscv64_sha256_finup(struct shash_desc *desc, const u8 *data,
> -				unsigned int len, u8 *out)
> -{
> -	sha256_base_do_finup(desc, data, len, sha256_block);
> -	return sha256_base_finish(desc, out);
> -}
> -
> -static int riscv64_sha256_digest(struct shash_desc *desc, const u8 *data,
> -				 unsigned int len, u8 *out)
> -{
> -	return sha256_base_init(desc) ?:
> -	       riscv64_sha256_finup(desc, data, len, out);
> -}
> -
> -static struct shash_alg riscv64_sha256_algs[] = {
> -	{
> -		.init = sha256_base_init,
> -		.update = riscv64_sha256_update,
> -		.finup = riscv64_sha256_finup,
> -		.digest = riscv64_sha256_digest,
> -		.descsize = sizeof(struct crypto_sha256_state),
> -		.digestsize = SHA256_DIGEST_SIZE,
> -		.base = {
> -			.cra_blocksize = SHA256_BLOCK_SIZE,
> -			.cra_flags = CRYPTO_AHASH_ALG_BLOCK_ONLY |
> -				     CRYPTO_AHASH_ALG_FINUP_MAX,
> -			.cra_priority = 300,
> -			.cra_name = "sha256",
> -			.cra_driver_name = "sha256-riscv64-zvknha_or_zvknhb-zvkb",
> -			.cra_module = THIS_MODULE,
> -		},
> -	}, {
> -		.init = sha224_base_init,
> -		.update = riscv64_sha256_update,
> -		.finup = riscv64_sha256_finup,
> -		.descsize = sizeof(struct crypto_sha256_state),
> -		.digestsize = SHA224_DIGEST_SIZE,
> -		.base = {
> -			.cra_blocksize = SHA224_BLOCK_SIZE,
> -			.cra_flags = CRYPTO_AHASH_ALG_BLOCK_ONLY |
> -				     CRYPTO_AHASH_ALG_FINUP_MAX,
> -			.cra_priority = 300,
> -			.cra_name = "sha224",
> -			.cra_driver_name = "sha224-riscv64-zvknha_or_zvknhb-zvkb",
> -			.cra_module = THIS_MODULE,
> -		},
> -	},
> -};
> -
> -static int __init riscv64_sha256_mod_init(void)
> -{
> -	/* Both zvknha and zvknhb provide the SHA-256 instructions. */
> -	if ((riscv_isa_extension_available(NULL, ZVKNHA) ||
> -	     riscv_isa_extension_available(NULL, ZVKNHB)) &&
> -	    riscv_isa_extension_available(NULL, ZVKB) &&
> -	    riscv_vector_vlen() >= 128)
> -		return crypto_register_shashes(riscv64_sha256_algs,
> -					       ARRAY_SIZE(riscv64_sha256_algs));
> -
> -	return -ENODEV;
> -}
> -
> -static void __exit riscv64_sha256_mod_exit(void)
> -{
> -	crypto_unregister_shashes(riscv64_sha256_algs,
> -				  ARRAY_SIZE(riscv64_sha256_algs));
> -}
> -
> -module_init(riscv64_sha256_mod_init);
> -module_exit(riscv64_sha256_mod_exit);
> -
> -MODULE_DESCRIPTION("SHA-256 (RISC-V accelerated)");
> -MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@vrull.eu>");
> -MODULE_LICENSE("GPL");
> -MODULE_ALIAS_CRYPTO("sha256");
> -MODULE_ALIAS_CRYPTO("sha224");
> diff --git a/arch/riscv/lib/crypto/Kconfig b/arch/riscv/lib/crypto/Kconfig
> index bc7a43f33eb3a..c100571feb7e8 100644
> --- a/arch/riscv/lib/crypto/Kconfig
> +++ b/arch/riscv/lib/crypto/Kconfig
> @@ -4,5 +4,12 @@ config CRYPTO_CHACHA_RISCV64
>  	tristate
>  	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
>  	default CRYPTO_LIB_CHACHA
>  	select CRYPTO_ARCH_HAVE_LIB_CHACHA
>  	select CRYPTO_LIB_CHACHA_GENERIC
> +
> +config CRYPTO_SHA256_RISCV64
> +	tristate
> +	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
> +	default CRYPTO_LIB_SHA256
> +	select CRYPTO_ARCH_HAVE_LIB_SHA256
> +	select CRYPTO_LIB_SHA256_GENERIC
> diff --git a/arch/riscv/lib/crypto/Makefile b/arch/riscv/lib/crypto/Makefile
> index e27b78f317fc8..b7cb877a2c07e 100644
> --- a/arch/riscv/lib/crypto/Makefile
> +++ b/arch/riscv/lib/crypto/Makefile
> @@ -1,4 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
>  obj-$(CONFIG_CRYPTO_CHACHA_RISCV64) += chacha-riscv64.o
>  chacha-riscv64-y := chacha-riscv64-glue.o chacha-riscv64-zvkb.o
> +
> +obj-$(CONFIG_CRYPTO_SHA256_RISCV64) += sha256-riscv64.o
> +sha256-riscv64-y := sha256.o sha256-riscv64-zvknha_or_zvknhb-zvkb.o
> diff --git a/arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S b/arch/riscv/lib/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
> similarity index 98%
> rename from arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
> rename to arch/riscv/lib/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
> index f1f5779e47323..fad501ad06171 100644
> --- a/arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
> +++ b/arch/riscv/lib/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
> @@ -104,12 +104,12 @@
>  	sha256_4rounds	\last, \k1, W1, W2, W3, W0
>  	sha256_4rounds	\last, \k2, W2, W3, W0, W1
>  	sha256_4rounds	\last, \k3, W3, W0, W1, W2
>  .endm
>
> -// void sha256_transform_zvknha_or_zvknhb_zvkb(u32 state[8], const u8 *data,
> -//					       int num_blocks);
> +// void sha256_transform_zvknha_or_zvknhb_zvkb(u32 state[SHA256_STATE_WORDS],
> +//					       const u8 *data, size_t nblocks);
>  SYM_FUNC_START(sha256_transform_zvknha_or_zvknhb_zvkb)
>
>  	// Load the round constants into K0-K15.
>  	vsetivli	zero, 4, e32, m1, ta, ma
>  	la		t0, K256
> diff --git a/arch/riscv/lib/crypto/sha256.c b/arch/riscv/lib/crypto/sha256.c
> new file mode 100644
> index 0000000000000..18b84030f0b39
> --- /dev/null
> +++ b/arch/riscv/lib/crypto/sha256.c
> @@ -0,0 +1,62 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * SHA-256 (RISC-V accelerated)
> + *
> + * Copyright (C) 2022 VRULL GmbH
> + * Author: Heiko Stuebner <heiko.stuebner@vrull.eu>
> + *
> + * Copyright (C) 2023 SiFive, Inc.
> + * Author: Jerry Shih <jerry.shih@sifive.com>
> + */
> +
> +#include <asm/simd.h>
> +#include <asm/vector.h>
> +#include <crypto/internal/sha2.h>
> +#include <crypto/internal/simd.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +
> +asmlinkage void sha256_transform_zvknha_or_zvknhb_zvkb(
> +	u32 state[SHA256_STATE_WORDS], const u8 *data, size_t nblocks);
> +
> +static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_extensions);
> +
> +void sha256_blocks_arch(u32 state[SHA256_STATE_WORDS],
> +			const u8 *data, size_t nblocks)
> +{
> +	if (static_branch_likely(&have_extensions) && crypto_simd_usable()) {
> +		kernel_vector_begin();
> +		sha256_transform_zvknha_or_zvknhb_zvkb(state, data, nblocks);
> +		kernel_vector_end();
> +	} else {
> +		sha256_blocks_generic(state, data, nblocks);
> +	}
> +}
> +EXPORT_SYMBOL(sha256_blocks_arch);
> +
> +bool sha256_is_arch_optimized(void)
> +{
> +	return static_key_enabled(&have_extensions);
> +}
> +EXPORT_SYMBOL(sha256_is_arch_optimized);
> +
> +static int __init riscv64_sha256_mod_init(void)
> +{
> +	/* Both zvknha and zvknhb provide the SHA-256 instructions. */
> +	if ((riscv_isa_extension_available(NULL, ZVKNHA) ||
> +	     riscv_isa_extension_available(NULL, ZVKNHB)) &&
> +	    riscv_isa_extension_available(NULL, ZVKB) &&
> +	    riscv_vector_vlen() >= 128)
> +		static_branch_enable(&have_extensions);
> +	return 0;
> +}
> +arch_initcall(riscv64_sha256_mod_init);
> +
> +static void __exit riscv64_sha256_mod_exit(void)
> +{
> +}
> +module_exit(riscv64_sha256_mod_exit);
> +
> +MODULE_DESCRIPTION("SHA-256 (RISC-V accelerated)");
> +MODULE_AUTHOR("Heiko Stuebner <heiko.stuebner@vrull.eu>");
> +MODULE_LICENSE("GPL");

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I assume you want to keep these all together somewhere, so I'm going to 
drop it from the RISC-V patchwork.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
