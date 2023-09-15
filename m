Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5771AEED61E
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 18:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w9kjuGD9Tj/zY11Nzy1HWif96khHb3oSNreHvVNkEc0=; b=ZTUAHOzU8uWtOa
	XQyUK9TdtmHHIoFTX8eajgBxeoxTzbVuxHqQW3ZfcAqQSnLQ0cIlb80ydUKxHDYBICQfUmRZFrQ6b
	KD10wCu+8W6bhg3zX50CQfC/7iCWUsUatV72tvyoT8yPmZGPMMnc9zAUUXI7Ke5OEly7zJan0BBKi
	392QOZodySjzjZFiY54XjjHB2VHvaqIvnQyVtt7rntsjOyI+vW7ZIYl3aRB64Cxv6HnvnDVNTDZ/y
	UJalN+e5Eu2t34Zh5FaovEHA/iyZcORH4ivOmBO7sKOsrvTpHroVFzQ8Fns5uDkHmjSSYZKT8soqf
	hQLFwOQ9miRGyF0rwv3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhDZH-00BBlK-1C;
	Fri, 15 Sep 2023 18:29:27 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhDZC-00BBkw-3B
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 18:29:25 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-69042d398b1so1087289b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 11:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1694802559; x=1695407359; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/nmIdsonQN3As2T1chhFUGzsAAH6aCPTvliuI7z4jzM=;
        b=xJ50CFjPEaz7QE2M/RIHth7QupPH9mZ/O2bUFvpUDnumadqyzfmRZNBlkYGpw7QNfY
         gzcfxmlqhpwoyESC+kBPG/mA4yelaoDJGKLgDF1tcGWijpEnBRqAbORzWi0vk/+1Q375
         uRNruwbbtcQ8+/VCJQeHQt4mgnx8TiVKTUlO0bofFMGFIe767PZIebgDGXYZ//LC/Vdl
         nVLY4IvZdcjqD+Ny8MnQjO+dkaHSUt0MuK2eANJ6xU5qMnmRKhOEcyYZc2J580m+kQe/
         C76uTqO5dv4fSFdvHsmFJniJXO0MA3mKn8zrLYaFJQk+Bd4AB6g+JrI5dBqx6Pbk9LH8
         TNyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694802560; x=1695407360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/nmIdsonQN3As2T1chhFUGzsAAH6aCPTvliuI7z4jzM=;
        b=UJ0auPgVwKHOTguxacc+qpeeJsSbO/QWfAFvt9T51graaQ45TytMeVvUwBnIGOX7sr
         3X6VBCRhQeg7jszbDcIp2yNTW1zwrh7b3htrLVl28fMecByEMSRGACJu4EPDCILP3qcQ
         HnApJloy/noHzjuhANornzeAJ+0Huc+/1qr+Erq7BuZA8r0GepMwLovQ/MuamNlgoNR6
         /NKaxrtmWT6KBbYV0TLTAGozaMtSOTOn8MGy8hwHL+oBxu48fx2vXHoLdtzuGcQss/KI
         z8Pe4Qs+rVve5Kv0FZzkJBvScOJj50gtnQ02EBRrQkIMx7Jod400yZyrsMLMj6f3H09p
         DozQ==
X-Gm-Message-State: AOJu0Ywc8FzUHNEj9AIAR3fqK8Lpe9sblSOb3gdXVpg1V7H5mW5oopjM
	1hKqXcSM20LNGPxg3Im35DY8vFyFYRiXPrVQzIA=
X-Google-Smtp-Source: AGHT+IGhtlUWFNzUzQjWie/iIVxGfAgAr89kBqzDBd+JOcOwZoW49FJqc6vRcQS11GEXu2cPvAcM4A==
X-Received: by 2002:a05:6a00:2d90:b0:68f:c7c5:a73a with SMTP id fb16-20020a056a002d9000b0068fc7c5a73amr2811298pfb.16.1694802559608;
        Fri, 15 Sep 2023 11:29:19 -0700 (PDT)
Received: from ghost ([50.168.177.76])
        by smtp.gmail.com with ESMTPSA id ey4-20020a056a0038c400b0064d74808738sm3270085pfb.214.2023.09.15.11.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 11:29:19 -0700 (PDT)
Date: Fri, 15 Sep 2023 14:29:14 -0400
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Samuel Neves <sneves@dei.uc.pt>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 6/6] riscv: Add BLAKE2s V implementation
Message-ID: <ZQSieofQfDY5mTlI@ghost>
References: <20230912115728.172982-1-bjorn@kernel.org>
 <20230912115728.172982-7-bjorn@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912115728.172982-7-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_112923_270360_1E929D31 
X-CRM114-Status: GOOD (  31.32  )
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

On Tue, Sep 12, 2023 at 01:57:28PM +0200, Bj=F6rn T=F6pel wrote:
> From: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> =

> BLAKE2s is used in various places, most notably in Wireguard, and as
> of v5.17 in drivers/char/random.
> =

> Add a BLAKE2s implementation using the V-extension. This is a
> translation of the x86-64 AVX512 variant
> (arch/x86/crypto/blake2s-core.S) to the RISC-V V-extension.
> =

> The AVX512 variant requires registers >=3D 256b (ymm*), and hence this
> implementation requires a VLEN of >=3D256.
> =

> The implementation passes the kernel BLAKE2s selftest, and has been
> tested on spike and qemu.
> =

> Instruction-wise, the V-variant uses 60% less instructions than the
> generic, C-based, implementation.
> =

> Signed-off-by: Bj=F6rn T=F6pel <bjorn@rivosinc.com>
> ---
>  arch/riscv/Kbuild                |   2 +-
>  arch/riscv/crypto/Kconfig        |  16 +++
>  arch/riscv/crypto/Makefile       |   6 ++
>  arch/riscv/crypto/blake2s-glue.c |  39 ++++++++
>  arch/riscv/crypto/blake2s-v.S    | 164 +++++++++++++++++++++++++++++++
>  crypto/Kconfig                   |   3 +
>  drivers/net/Kconfig              |   1 +
>  7 files changed, 230 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/crypto/Kconfig
>  create mode 100644 arch/riscv/crypto/Makefile
>  create mode 100644 arch/riscv/crypto/blake2s-glue.c
>  create mode 100644 arch/riscv/crypto/blake2s-v.S
> =

> diff --git a/arch/riscv/Kbuild b/arch/riscv/Kbuild
> index d25ad1c19f88..1a5d89a18920 100644
> --- a/arch/riscv/Kbuild
> +++ b/arch/riscv/Kbuild
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  =

> -obj-y +=3D kernel/ mm/ net/
> +obj-y +=3D kernel/ mm/ net/ crypto/
>  obj-$(CONFIG_BUILTIN_DTB) +=3D boot/dts/
>  obj-y +=3D errata/
>  obj-$(CONFIG_KVM) +=3D kvm/
> diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
> new file mode 100644
> index 000000000000..e072400eb456
> --- /dev/null
> +++ b/arch/riscv/crypto/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +menu "Accelerated Cryptographic Algorithms for CPU (RISC-V)"
> +
> +config CRYPTO_BLAKE2S_RISCV
> +	bool "Hash functions: BLAKE2s (V)"
> +	depends on 64BIT && MMU && RISCV_ISA_V
> +	select CRYPTO_LIB_BLAKE2S_GENERIC
> +	select CRYPTO_ARCH_HAVE_LIB_BLAKE2S
> +	help
> +	  BLAKE2s cryptographic hash function (RFC 7693)
> +
> +	  Architecture: riscv64 using:
> +	  - V extension (VLEN >=3D 256)
> +
> +endmenu
> diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
> new file mode 100644
> index 000000000000..1768025c13ae
> --- /dev/null
> +++ b/arch/riscv/crypto/Makefile
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# RISC-V crypto algorithms
> +
> +obj-$(CONFIG_CRYPTO_BLAKE2S_RISCV) +=3D libblake2s-riscv.o
> +libblake2s-riscv-y :=3D blake2s-v.o blake2s-glue.o
> diff --git a/arch/riscv/crypto/blake2s-glue.c b/arch/riscv/crypto/blake2s=
-glue.c
> new file mode 100644
> index 000000000000..d3de0e8e5872
> --- /dev/null
> +++ b/arch/riscv/crypto/blake2s-glue.c
> @@ -0,0 +1,39 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 Rivos, Inc. All Rights Reserved.
> + * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rig=
hts Reserved.
> + */
> +
> +#include <crypto/internal/blake2s.h>
> +
> +#include <linux/types.h>
> +#include <linux/minmax.h>
> +#include <linux/sizes.h>
> +
> +#include <linux/sched.h>
> +#include <linux/sched/task_stack.h>
> +#include <asm/simd.h>
> +#include <asm/vector.h>
> +
> +asmlinkage void blake2s_compress_vector(struct blake2s_state *state, con=
st u8 *block,
> +					const size_t nblocks, const u32 inc);
> +
> +void blake2s_compress(struct blake2s_state *state, const u8 *block, size=
_t nblocks, const u32 inc)
> +{
> +	if (!(has_vector() && riscv_v_vsize >=3D 256 * 32 / 8) || !may_use_simd=
()) {
> +		blake2s_compress_generic(state, block, nblocks, inc);
> +		return;
> +	}
> +
> +	do {
> +		const size_t blocks =3D min_t(size_t, nblocks, SZ_4K / BLAKE2S_BLOCK_S=
IZE);
> +
> +		kernel_vector_begin();
> +		blake2s_compress_vector(state, block, blocks, inc);
> +		kernel_vector_end();
> +
> +		nblocks -=3D blocks;
> +		block +=3D blocks * BLAKE2S_BLOCK_SIZE;
> +	} while (nblocks);
> +}
> +EXPORT_SYMBOL(blake2s_compress);
> diff --git a/arch/riscv/crypto/blake2s-v.S b/arch/riscv/crypto/blake2s-v.S
> new file mode 100644
> index 000000000000..9653b7a19127
> --- /dev/null
> +++ b/arch/riscv/crypto/blake2s-v.S
> @@ -0,0 +1,164 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * BLAKE2s RISC-V V implementation
> + *
> + * Copyright (C) 2022 Rivos, Inc. All Rights Reserved.
> + * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rig=
hts Reserved.
> + * Copyright (C) 2017-2019 Samuel Neves <sneves@dei.uc.pt>. All Rights R=
eserved.
> + */
> +
> +#include <linux/linkage.h>
> +#include <asm/asm.h>
> +
> +.section .rodata, "a", @progbits
> +
> +.align 8
> +IV:
> +.octa 0xA54FF53A3C6EF372BB67AE856A09E667
> +.octa 0x5BE0CD191F83D9AB9B05688C510E527F
> +
> +.align 8
> +SIGMA2:
> +.long  0,  2,  4,  6,  1,  3,  5,  7, 14,  8, 10, 12, 15,  9, 11, 13
> +.long  8,  2, 13, 15, 10,  9, 12,  3,  6,  4,  0, 14,  5, 11,  1,  7
> +.long 11, 13,  8,  6,  5, 10, 14,  3,  2,  4, 12, 15,  1,  0,  7,  9
> +.long 11, 10,  7,  0,  8, 15,  1, 13,  3,  6,  2, 12,  4, 14,  9,  5
> +.long  4, 10,  9, 14, 15,  0, 11,  8,  1,  7,  3, 13,  2,  5,  6, 12
> +.long  2, 11,  4, 15, 14,  3, 10,  8, 13,  6,  5,  7,  0, 12,  1,  9
> +.long  4,  8, 15,  9, 14, 11, 13,  5,  3,  2,  1, 12,  6, 10,  7,  0
> +.long  6, 13,  0, 14, 12,  2,  1, 11, 15,  4,  5,  8,  7,  9,  3, 10
> +.long 15,  5,  4, 13, 10,  7,  3, 11, 12,  2,  0,  6,  9,  8,  1, 14
> +.long  8,  7, 14, 11, 13, 15,  0, 12, 10,  4,  5,  6,  3,  2,  1,  9
> +
> +.align 8
> +GATHER_DIAG1:
> +.long  3, 0, 1, 2
> +.align 8
> +GATHER_DIAG2:
> +.long  2, 3, 0, 1
> +.align 8
> +GATHER_DIAG3:
> +.long  1, 2, 3, 0
> +
> +.section .text
> +
> +.macro VROR REG BITS TMPREG
> +	vmv.v.v		\TMPREG, \REG
> +	vsrl.vi		\REG, \REG, \BITS
> +	vsll.vi		\TMPREG, \TMPREG, 32-\BITS
> +	vor.vv		\REG, \REG, \TMPREG
> +.endm

This seems like it would be a good candidate to use the Zvkb extension
that has vector rotate [1]. It would be a pain to use because you need
two versions of the roundloop, but you could get away with 1 extra
branch/nop and save 3 instructions per VROR which looks like it happens
8*10 times, so 239 fewer instructions.

[1] https://github.com/riscv/riscv-crypto/releases

- Charlie

> +
> +/*
> + * void blake2s_compress_vector(struct blake2s_state *state,
> + *        const u8 *block, size_t nblocks, const u32 inc)
> + *
> + * blake2s_compress_vector is a translation of the AVX512 variant
> + * (arch/x86/blake2s-core.S) to RISC-V V. The implementation requires
> + * VLEN>=3D256b.
> + *
> + */
> +SYM_FUNC_START(blake2s_compress_vector)
> +	vsetivli	t0, 1, e32, m1, ta, ma
> +	vmv.v.x		v5, a3
> +	vsetivli	t0, 4, e32, m1, ta, ma
> +	vle32.v		v0, (a0)
> +	addi		t0, a0, 0x10
> +	vle32.v		v1, (t0)
> +	addi		t0, t0, 0x10
> +	vle32.v		v4, (t0)
> +	la		t0, IV
> +	vle32.v		v14, (t0)
> +	la		t0, IV+16
> +	vle32.v		v15, (t0)
> +	la		t0, GATHER_DIAG1
> +	vle32.v		v16, (t0)
> +	la		t0, GATHER_DIAG2
> +	vle32.v		v18, (t0)
> +	la		t0, GATHER_DIAG3
> +	vle32.v		v19, (t0)
> +.Lblake2s_compress_vector_mainloop:
> +	vmv.v.v		v10, v0
> +	vmv.v.v		v11, v1
> +	vadd.vv		v4, v5, v4
> +	vmv.v.v		v2, v14
> +	vxor.vv		v3, v15, v4
> +	vsetivli	t0, 8, e32, m1, ta, ma
> +	vle32.v		v6, (a1)
> +	addi		a1, a1, 0x20
> +	vle32.v		v7, (a1)
> +	addi		a1, a1, 0x20
> +	la		t1, SIGMA2
> +	li		t2, 0xa
> +.Lblake2s_compress_vector_roundloop:
> +	vsetivli	t0, 8, e32, m1, ta, ma
> +	vle32.v		v12, (t1)
> +	addi		t1, t1, 0x20
> +	vle32.v		v13, (t1)
> +	addi		t1, t1, 0x20
> +	vsetivli	t0, 16, e32, m2, ta, ma
> +	vrgather.vv	v8, v6, v12
> +	vmv.v.v		v6, v8
> +	vsetivli	t0, 4, e32, m1, ta, ma
> +	vadd.vv		v0, v8, v0
> +	vadd.vv		v0, v1, v0
> +	vxor.vv		v3, v0, v3
> +	VROR		v3 16 v17
> +	vadd.vv		v2, v3, v2
> +	vxor.vv		v1, v2, v1
> +	VROR		v1 12 v17
> +	vsetivli	t0, 8, e32, m1, ta, ma
> +	vslidedown.vi	v8, v8, 4
> +	vsetivli	t0, 4, e32, m1, ta, ma
> +	vadd.vv		v0, v8, v0
> +	vadd.vv		v0, v1, v0
> +	vxor.vv		v3, v0, v3
> +	VROR		v3 8 v17
> +	vadd.vv		v2, v3, v2
> +	vxor.vv		v1, v2, v1
> +	VROR		v1, 7, v17
> +	vmv.v.v		v17, v0
> +	vrgather.vv	v0, v17, v16
> +	vmv.v.v		v17, v3
> +	vrgather.vv	v3, v17, v18
> +	vmv.v.v		v17, v2
> +	vrgather.vv	v2, v17, v19
> +	vadd.vv		v0, v9, v0
> +	vadd.vv		v0, v1, v0
> +	vxor.vv		v3, v0, v3
> +	VROR		v3 16 v17
> +	vadd.vv		v2, v3, v2
> +	vxor.vv		v1, v2, v1
> +	VROR		v1 12 v17
> +	vsetivli	t0, 8, e32, m1, ta, ma
> +	vslidedown.vi	v9, v9, 4
> +	vsetivli	t0, 4, e32, m1, ta, ma
> +	vadd.vv		v0, v9, v0
> +	vadd.vv		v0, v1, v0
> +	vxor.vv		v3, v0, v3
> +	VROR		v3, 8, v17
> +	vadd.vv		v2, v3, v2
> +	vxor.vv		v1, v2, v1
> +	VROR		v1 7 v17
> +	vmv.v.v		v17, v0
> +	vrgather.vv	v0, v17, v19
> +	vmv.v.v		v17, v3
> +	vrgather.vv	v3, v17, v18
> +	vmv.v.v		v17, v2
> +	vrgather.vv	v2, v17, v16
> +	addi		t2, t2, -1
> +	bne		t2, x0, .Lblake2s_compress_vector_roundloop
> +	vxor.vv		v0, v10, v0
> +	vxor.vv		v1, v11, v1
> +	vxor.vv		v0, v2, v0
> +	vxor.vv		v1, v3, v1
> +	addi		a2, a2, -1
> +	bne		a2, x0, .Lblake2s_compress_vector_mainloop
> +	vse32.v		v0, (a0)
> +	addi		a0, a0, 0x10
> +	vse32.v		v1, (a0)
> +	addi		a0, a0, 0x10
> +	vse32.v		v4, (a0)
> +	ret
> +SYM_FUNC_END(blake2s_compress_vector)
> +
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 650b1b3620d8..c7b23d2c58e4 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1436,6 +1436,9 @@ endif
>  if PPC
>  source "arch/powerpc/crypto/Kconfig"
>  endif
> +if RISCV
> +source "arch/riscv/crypto/Kconfig"
> +endif
>  if S390
>  source "arch/s390/crypto/Kconfig"
>  endif
> diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
> index 44eeb5d61ba9..f7fb168a3944 100644
> --- a/drivers/net/Kconfig
> +++ b/drivers/net/Kconfig
> @@ -94,6 +94,7 @@ config WIREGUARD
>  	select CRYPTO_CHACHA_MIPS if CPU_MIPS32_R2
>  	select CRYPTO_POLY1305_MIPS if MIPS
>  	select CRYPTO_CHACHA_S390 if S390
> +	select CRYPTO_BLAKE2S_RISCV if RISCV && 64BIT
>  	help
>  	  WireGuard is a secure, fast, and easy to use replacement for IPSec
>  	  that uses modern cryptography and clever networking tricks. It's
> -- =

> 2.39.2
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
