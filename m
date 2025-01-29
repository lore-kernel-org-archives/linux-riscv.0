Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20B4C0218D
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jan 2025 09:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=28Fg2GIwBAJfmpbctOocTDhwCIKc7NNRRwbtlhsc9wA=; b=nrqDnoRmQWldhxnltdEaEa+QYC
	woXgNLC1esgk7LkOwIdY9QOdx9bt3HyCrqR9f3EjyNVP9Ke3zY6xmnTzHoJSYMfZLUYvBwyUYgXPw
	/R2LdIpKfqdBGpGh4ClIqdjyuHK66QnKJ/bGdqOR6tZFHTrS0E9JkFI9n/5hMl1pYVaz0Hy9bMroB
	GbJOOfKtWJktv2gIGgc3aQ711aqZkA2UI66r7LjssYe4LY2a5FvvONH9KU3/7GPNT+nAXmhluBvui
	e8oEmzad9aRLQCSk6QeHbDzZ21jXnp0IgOjtWibhRJCq8UBNr+uVZ/ItY8SM8d++tHEA1OkfczWMi
	JVsweZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td4PS-00000006ehz-2jJc;
	Wed, 29 Jan 2025 09:30:58 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td4PP-00000006ehb-3crG
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jan 2025 09:30:57 +0000
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CBA523F320
	for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2025 09:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738143051;
	bh=nNQQYZXpeVmO/pG1E4ByLHOtOexxCyz6+XYGZFAlO+g=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=iskCRjsk6fLxQmxRVlePEsga+aKu1qjLD8dQzQ8qxmYEb910g/aZ7xCPYW0dofvJL
	 IQewv5XNKsTKaTc+lp/BMo6H+gDCahAA5oUIQQlQJvjYT2Hm0KM85xLBy+leb9oc5S
	 vGRD6UKWGN+Sxf6k0iujEnZ4H19R6eSs1tBBsjlt+UeVGN5ZrBYpsKWOuOF8BhRD4Y
	 I4OpJzPiTXzhFx79/bgbMBzDFsd3maqGJaVIH75cL+12KpUGBxKdTjxATbpYa7sQyG
	 KPHT8Jm9q0TEw6UhJ1IMKC9aCLbW0iZxX6dyrFZvXi7EYDdd7o+R7JY1Ih5CjYq9ll
	 OathA+dbog82w==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2a3c59f8c1cso4431370fac.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2025 01:30:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738143050; x=1738747850;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNQQYZXpeVmO/pG1E4ByLHOtOexxCyz6+XYGZFAlO+g=;
        b=N3NiyiedU5xRD49qIjPgIojzXMK8rTxIPREHliAkyKJ041dp088CmJ8WPyxPM+oDow
         u+MlpQmeHzOuwIH4RAQjTxl+l3gy2l2jKQyOlonFRNgEdbpWwviIk+qQ/xqvtWf7Hroj
         746d542dmodI0r/CwQubUPbijI5JLcrjDojhU7Ykc9MvmzEQdN9SbM9Rc4iOe57Ij4y3
         /Jsov9I22XA+ksQpaVPMUBTVYtStYYm7OoaPwdZhCwH7b8DHxejY9kQyzotnifoBoK4j
         GmhV9XGsd2l3FaidULbmC1Bcy6y2YVvS/+2r1T/lrbN9hGR3tqmdctGuyhGPQV45NQLU
         +/YQ==
X-Gm-Message-State: AOJu0YyZw7unjIUB42mzJ7Mwx/b08Qxm3jngHnEFAe92HKXjXBp3C7Ia
	DepVvlgd+mAq23B8XdHvEvu/AjoLs/ZdZ6N3Sz7PcP4rMgjpiqREo+z/C87aMnslKDOu5qiY/NS
	gHxk39oH167ewriBj01+jPSRyKiDt+xhyiq4DaAmkL4k/ZjwLqJPwvcr9Lvo1xckW2U98lKLqk8
	N6k0UJyXyVHxIqkqnsMaBG/DHfcFmAvt9DjwK8u8oXDma1D+/z1SrahMjNUGa/19ZGPqA=
X-Gm-Gg: ASbGncuoxB60ObvGUZJC4/2gu167y66r97QZYIH6iTCFkfyFAmGa1eJCJFpjYP5BB9d
	piMgVjhmpyqFxzmvl9c58IjQaQ3x3WhTPuhBtHdgloG05PAXuCfrjb/2D1Lwb0kTv5HWPjumn2S
	aXBfKmqayMvLHS4Sg=
X-Received: by 2002:a05:6870:71d6:b0:297:699:2ca8 with SMTP id 586e51a60fabf-2b32ef58936mr1236615fac.1.1738143050039;
        Wed, 29 Jan 2025 01:30:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwERfpwHBZ6E280cJGymK9DZRxQJQqUjvwzYXrwoZXJq3IK2RZ1mpoOTEdEDM84w5xd1Zf7gJ7lzNEFw8nYNg=
X-Received: by 2002:a05:6870:71d6:b0:297:699:2ca8 with SMTP id
 586e51a60fabf-2b32ef58936mr1236600fac.1.1738143049698; Wed, 29 Jan 2025
 01:30:49 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jan 2025 04:30:49 -0500
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 29 Jan 2025 04:30:49 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
References: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
Mime-Version: 1.0
Date: Wed, 29 Jan 2025 04:30:49 -0500
X-Gm-Features: AWEUYZnA8M4uBukayUvdb7DFofb6xxOX7lRb9g0YKNYSEhEAuwAOV56QSMZ8NPE
Message-ID: <CAJM55Z-J9EUotSW_Q0ERF=Vd0nEEhTv4SRHm96uNNxG1r6EsMQ@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Add runtime constant support
To: Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, Pasha Bouzarjomehri <pasha@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_013056_231227_D75D97E5 
X-CRM114-Status: GOOD (  30.75  )
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

Charlie Jenkins wrote:
> Implement the runtime constant infrastructure for riscv. Use this
> infrastructure to generate constants to be used by the d_hash()
> function.
>
> This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> constant' support") and commit e3c92e81711d ("runtime constants: add
> x86 architecture support").
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
> Ard brought this to my attention in this patch [1].
>
> [1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/
> ---
> Changes in v3:
> - Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
>   by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
> - Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com
>
> Changes in v2:
> - Treat instructions as __le32 and do proper conversions (Ben)
> - Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
> ---
>  arch/riscv/include/asm/runtime-const.h | 194 +++++++++++++++++++++++++++++++++
>  arch/riscv/kernel/vmlinux.lds.S        |   3 +
>  2 files changed, 197 insertions(+)
>
> diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..0ecbe6967013900781b0b1048d4622f676b64076
> --- /dev/null
> +++ b/arch/riscv/include/asm/runtime-const.h
> @@ -0,0 +1,194 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _ASM_RISCV_RUNTIME_CONST_H
> +#define _ASM_RISCV_RUNTIME_CONST_H
> +
> +#include <asm/alternative.h>
> +#include <asm/cacheflush.h>
> +#include <asm/text-patching.h>
> +#include <linux/uaccess.h>
> +
> +#ifdef CONFIG_32BIT
> +#define runtime_const_ptr(sym)					\
> +({								\
> +	typeof(sym) __ret, __tmp;				\
> +	asm_inline("1:\t"					\
> +		".option push"					\
> +		".option norvc"					\
> +		"lui	%[__ret],0x89abd\n\t"			\
> +		"addi	%[__ret],-0x211\n\t"			\
> +		".option pop"					\
> +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
> +		".long 1b - .\n\t"				\
> +		".popsection"					\
> +		: [__ret] "=r" (__ret));			\
> +	__ret;							\
> +})
> +#else
> +/*
> + * Loading 64-bit constants into a register from immediates is a non-trivial
> + * task on riscv64. To get it somewhat performant, load 32 bits into two
> + * different registers and then combine the results.
> + *
> + * If the processor supports the Zbkb extension, we can combine the final
> + * "slli,slli,srli,add" into the single "pack" instruction. If the processor
> + * doesn't support Zbkb but does support the Zbb extension, we can
> + * combine the final "slli,srli,add" into one instruction "add.uw".
> + */
> +#define runtime_const_ptr(sym)						\
> +({									\
> +	typeof(sym) __ret, __tmp;					\
> +	asm_inline("1:\t"						\
> +		".option push\n\t"					\
> +		".option norvc\n\t"					\
> +		"lui	%[__ret],0x89abd\n\t"				\
> +		"lui	%[__tmp],0x1234\n\t"				\
> +		"addiw	%[__ret],%[__ret],-0x211\n\t"			\
> +		"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
> +		ALTERNATIVE_2(						\
> +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> +			"slli	%[__ret],%[__ret],32\n\t"		\
> +			"srli	%[__ret],%[__ret],32\n\t"		\
> +			"add	%[__ret],%[__ret],%[__tmp]\n\t",	\
> +			".option push\n\t"				\
> +			".option arch,+zba\n\t"				\
> +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> +			"add.uw %[__ret],%[__ret],%[__tmp]\n\t"		\
> +			"nop\n\t"					\
> +			"nop\n\t"					\
> +			".option pop\n\t",				\
> +			0, RISCV_ISA_EXT_ZBA, 1,			\
> +			".option push\n\t"				\
> +			".option arch,+zbkb\n\t"			\
> +			"pack	%[__ret],%[__ret],%[__tmp]\n\t"		\
> +			"nop\n\t"					\
> +			"nop\n\t"					\
> +			"nop\n\t"					\
> +			".option pop\n\t",				\
> +			0, RISCV_ISA_EXT_ZBKB, 1			\
> +		)							\
> +		".option pop\n\t"					\
> +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
> +		".long 1b - .\n\t"					\
> +		".popsection"						\
> +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> +	__ret;								\
> +})
> +#endif
> +
> +#ifdef CONFIG_32BIT
> +#define SRLI "srli "
> +#else
> +#define SRLI "srliw "
> +#endif
> +
> +#define runtime_const_shift_right_32(val, sym)			\
> +({								\
> +	u32 __ret;						\
> +	asm_inline("1:\t"					\
> +		".option push\n\t"				\
> +		".option norvc\n\t"				\
> +		SRLI "%[__ret],%[__val],12\n\t"			\
> +		".option pop\n\t"				\
> +		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
> +		".long 1b - .\n\t"				\
> +		".popsection"					\
> +		: [__ret] "=r" (__ret)				\
> +		: [__val] "r" (val));				\
> +	__ret;							\
> +})
> +
> +#define runtime_const_init(type, sym) do {			\
> +	extern s32 __start_runtime_##type##_##sym[];		\
> +	extern s32 __stop_runtime_##type##_##sym[];		\
> +								\
> +	runtime_const_fixup(__runtime_fixup_##type,		\
> +			    (unsigned long)(sym),		\
> +			    __start_runtime_##type##_##sym,	\
> +			    __stop_runtime_##type##_##sym);	\
> +} while (0)
> +
> +static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> +{
> +	/* On riscv there are currently only cache-wide flushes so va is ignored. */
> +	__always_unused uintptr_t va = (uintptr_t)where;
> +
> +	flush_icache_range(va, va + 4*insns);
> +}
> +
> +/*
> + * The 32-bit immediate is stored in a lui+addi pairing.
> + * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
> + * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
> + */
> +static inline void __runtime_fixup_32(u32 *lui, u32 *addi, unsigned int val)
> +{
> +	unsigned int lower_immediate, upper_immediate;
> +	u32 lui_insn = le32_to_cpu(*lui);
> +	u32 addi_insn = le32_to_cpu(*addi);

Because of the compressed extensions RISC-V instructions are only aligned on
16bit boundaries, so is there another reason you know that these two
instructions are 32bit aligned? Otherwise you're adding unaligned accesses
here.

/Emil

> +	__le32 addi_res, lui_res;
> +
> +	lower_immediate = sign_extend32(val, 11);
> +	upper_immediate = (val - lower_immediate);
> +
> +	if (upper_immediate & 0xfffff000) {
> +		/* replace upper 20 bits of lui with upper immediate */
> +		lui_insn &= 0x00000fff;
> +		lui_insn |= upper_immediate & 0xfffff000;
> +	} else {
> +		/* replace lui with nop if immediate is small enough to fit in addi */
> +		lui_insn = 0x00000013;
> +	}
> +
> +	if (lower_immediate & 0x00000fff) {
> +		/* replace upper 12 bits of addi with lower 12 bits of val */
> +		addi_insn &= 0x000fffff;
> +		addi_insn |= (lower_immediate & 0x00000fff) << 20;
> +	} else {
> +		/* replace addi with nop if lower_immediate is empty */
> +		addi_insn = 0x00000013;
> +	}
> +
> +	addi_res = cpu_to_le32(addi_insn);
> +	lui_res = cpu_to_le32(lui_insn);
> +	patch_insn_write(addi, &addi_res, sizeof(addi_res));
> +	patch_insn_write(lui, &lui_res, sizeof(lui_res));
> +}
> +
> +static inline void __runtime_fixup_ptr(void *where, unsigned long val)
> +{
> +	if (IS_ENABLED(CONFIG_32BIT)) {
> +		__runtime_fixup_32(where, where + 4, val);
> +		__runtime_fixup_caches(where, 2);
> +	} else {
> +		__runtime_fixup_32(where, where + 8, val);
> +		__runtime_fixup_32(where + 4, where + 12, val >> 32);
> +		__runtime_fixup_caches(where, 4);
> +	}
> +}
> +
> +/*
> + * Replace the least significant 5 bits of the srli/srliw immediate that is
> + * located at bits 20-24
> + */
> +static inline void __runtime_fixup_shift(void *where, unsigned long val)
> +{
> +	u32 insn = le32_to_cpu(*(__le32 *)where);
> +	__le32 res;
> +
> +	insn &= 0xfe0fffff;
> +	insn |= (val & 0b11111) << 20;
> +
> +	res = cpu_to_le32(insn);
> +	patch_text_nosync(where, &res, sizeof(insn));
> +}
> +
> +static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
> +				       unsigned long val, s32 *start, s32 *end)
> +{
> +	while (start < end) {
> +		fn(*start + (void *)start, val);
> +		start++;
> +	}
> +}
> +
> +#endif /* _ASM_RISCV_RUNTIME_CONST_H */
> diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> index 002ca58dd998cb78b662837b5ebac988fb6c77bb..61bd5ba6680a786bf1db7dc37bf1acda0639b5c7 100644
> --- a/arch/riscv/kernel/vmlinux.lds.S
> +++ b/arch/riscv/kernel/vmlinux.lds.S
> @@ -97,6 +97,9 @@ SECTIONS
>  	{
>  		EXIT_DATA
>  	}
> +
> +	RUNTIME_CONST_VARIABLES
> +
>  	PERCPU_SECTION(L1_CACHE_BYTES)
>
>  	.rel.dyn : {
>
> ---
> base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> change-id: 20250123-runtime_const_riscv-6cd854ee2817
> --
> - Charlie
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
