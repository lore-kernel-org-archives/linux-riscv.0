Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F90FC0218A
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2025 23:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/be757B39RLHsPsZvW8mnU38WWIJpKusyfyGqRRBsA=; b=LAY9xCjvS1Y3rW
	Fxq/WGgtgKXlxQd5FzWCCI9rnJc7+2VvqY3Bhg9hoKx0vYUY6X4kCf/iQeneqTHARBVhQCXP3r75i
	wLo0qj6ENF591Z8IQ+jd0Nx8eL9VbMaPwb16LMAGar+MbChc0sh3GrK2Atw3AV9V4aptkF0A9HvIk
	jdHDXAXoaQ0iQ8eBQtmdcZIxI91L/EIEY1DHPnGhrSP7uF+VkpqmqMSfgrsXOY7Ta1qNbhnYeYKz0
	dGkAMJo0zdQ0HQ5bLE1zMtvVPpLOud5HyvTPuxTj8Cvmh0ucXojKTZEsgIJThHfiae5eU/6saGYbU
	GtnMm38IfKNYZMFHAjxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tddig-00000009lQb-389V;
	Thu, 30 Jan 2025 23:13:10 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tddie-00000009lQF-2TEB
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jan 2025 23:13:10 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-2167141dfa1so24211275ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jan 2025 15:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738278788; x=1738883588; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K6dfakJZdLAgCLB5QxI47D4nLXvZUFbWeh8LMAiWIx8=;
        b=ffqZTTUyKk81FZUzZh4tZ9lrbecFR25ABhR8EAnLDMb9XsZEnUavK1a1QFQ15F++7f
         x4fXORf7EBftCywr9iLnS8n//IsMpNY5fe3a2TA8Xfem1dmE4Gg4EQa3bMTxoc8y7sgj
         v4j/9IoZes0ArkVUK2AN9o1DhJ64bqznYZEhlID1XsnSoWnh3dhb7Kf+60F4tX5frhjS
         uXNYMxcWApP3Uw7dGrf0XQQzq6esI0TbvA7NlzTQyucxj6z9HiXP6hpJY2RcajXA3H0h
         pHHj+UkQxqJhRSwzdlFSNlM7LGTK0g5IqnUjX+qQ9yJ9eub+Hf7CJljn3PkPIJshOoyj
         5k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738278788; x=1738883588;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6dfakJZdLAgCLB5QxI47D4nLXvZUFbWeh8LMAiWIx8=;
        b=d67KoubQlV/+t1CXIYxsCQLLl84D5eYz0EqX73MtONypbeoV5kXS/v8hxEeyXw1gg2
         6lapUOIqYwz95BVHu2eXKsS/md+Sik5PovZrGG5gCt8ARF/0q5y/cTMRnh9JhLprRvgn
         X5ji9mlV0xvB8jfn+ESDuCFkt/7VUpBRAs5Na1wf7dM5pxaxnV3u64Nx2v4ms7lemVz7
         PfNQX67BY7lmWQz5IsjFkCuj9bHHYIvvF0w4DTLRQgmaL8MkQ/Dxzns3Y9n3riALQyX/
         Q2rVvlKeUPMmU/VAgAbD1znMqZDy60kSf3UgBs0vXR0ODr3q5xFGtpcLLHPcA7NcStYj
         EEXA==
X-Forwarded-Encrypted: i=1; AJvYcCVPzERwueDp6Aez8YmvAfxBX70k8HcGyt14sjv62kIsdxqGD+GRdplF0e6tFQgxLyyPn/ekQCK12Y6zIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYar0wmxFvSAqKovAIYiY7qN9Pc5aJFORRkgaQXtft0oRjBI/6
	a1/qHnRYmxui6VNxlan6Pw/2EEm36xC7VCSPgUjFM/l7/YTm9k6Ce2toR07Orxs=
X-Gm-Gg: ASbGncv/v3i5g8OAL/ltb2Ph3L9oWQI3a675EEViza8hqVIpWMWSoh6voPzpcbCOg3i
	T1qwTGycPpM3qEYtvUQdfECk1GNm3yihuW/bSBy8XYqZDjL5jmFW69T8fLNgv3ZVEKXIBBYCFVN
	DIa4Cgs6SYesbL8iF+6HaXdyx0iCTEwZXAcIWBg+0tr/rJQsqchR3glVv6GusEMPkYu69Lj0ki+
	GADF/CnxJNcbJWFdg15ILk1bqV/sElesaM2JcC9XBqX+boM0UyzU7tvz5B12kR0u1rNC2qEtKXy
	ty+Itf9HgQ==
X-Google-Smtp-Source: AGHT+IFR+xkUyuD9Idpx53cQ1xaBXJ7eENhvPjOTRC1EpcZkFaHTLVnV1MPZnMD4/mIj5d+OuSxDWw==
X-Received: by 2002:a05:6a20:7fa8:b0:1d8:c74d:1ca0 with SMTP id adf61e73a8af0-1ed96f566b8mr1641037637.11.1738278787833;
        Thu, 30 Jan 2025 15:13:07 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:b5f7:fece:b619:6703])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acebe384317sm1893526a12.19.2025.01.30.15.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 15:13:07 -0800 (PST)
Date: Thu, 30 Jan 2025 15:13:05 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: Add runtime constant support
Message-ID: <Z5wHgRG6eZKFevUQ@ghost>
References: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
 <CAJM55Z-J9EUotSW_Q0ERF=Vd0nEEhTv4SRHm96uNNxG1r6EsMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z-J9EUotSW_Q0ERF=Vd0nEEhTv4SRHm96uNNxG1r6EsMQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_151308_637456_2E10E04F 
X-CRM114-Status: GOOD (  35.96  )
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

On Wed, Jan 29, 2025 at 04:30:49AM -0500, Emil Renner Berthing wrote:
> Charlie Jenkins wrote:
> > Implement the runtime constant infrastructure for riscv. Use this
> > infrastructure to generate constants to be used by the d_hash()
> > function.
> >
> > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > constant' support") and commit e3c92e81711d ("runtime constants: add
> > x86 architecture support").
> >
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > ---
> > Ard brought this to my attention in this patch [1].
> >
> > [1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/
> > ---
> > Changes in v3:
> > - Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
> >   by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
> > - Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com
> >
> > Changes in v2:
> > - Treat instructions as __le32 and do proper conversions (Ben)
> > - Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
> > ---
> >  arch/riscv/include/asm/runtime-const.h | 194 +++++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/vmlinux.lds.S        |   3 +
> >  2 files changed, 197 insertions(+)
> >
> > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..0ecbe6967013900781b0b1048d4622f676b64076
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/runtime-const.h
> > @@ -0,0 +1,194 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_RISCV_RUNTIME_CONST_H
> > +#define _ASM_RISCV_RUNTIME_CONST_H
> > +
> > +#include <asm/alternative.h>
> > +#include <asm/cacheflush.h>
> > +#include <asm/text-patching.h>
> > +#include <linux/uaccess.h>
> > +
> > +#ifdef CONFIG_32BIT
> > +#define runtime_const_ptr(sym)					\
> > +({								\
> > +	typeof(sym) __ret, __tmp;				\
> > +	asm_inline("1:\t"					\
> > +		".option push"					\
> > +		".option norvc"					\
> > +		"lui	%[__ret],0x89abd\n\t"			\
> > +		"addi	%[__ret],-0x211\n\t"			\
> > +		".option pop"					\
> > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
> > +		".long 1b - .\n\t"				\
> > +		".popsection"					\
> > +		: [__ret] "=r" (__ret));			\
> > +	__ret;							\
> > +})
> > +#else
> > +/*
> > + * Loading 64-bit constants into a register from immediates is a non-trivial
> > + * task on riscv64. To get it somewhat performant, load 32 bits into two
> > + * different registers and then combine the results.
> > + *
> > + * If the processor supports the Zbkb extension, we can combine the final
> > + * "slli,slli,srli,add" into the single "pack" instruction. If the processor
> > + * doesn't support Zbkb but does support the Zbb extension, we can
> > + * combine the final "slli,srli,add" into one instruction "add.uw".
> > + */
> > +#define runtime_const_ptr(sym)						\
> > +({									\
> > +	typeof(sym) __ret, __tmp;					\
> > +	asm_inline("1:\t"						\
> > +		".option push\n\t"					\
> > +		".option norvc\n\t"					\
> > +		"lui	%[__ret],0x89abd\n\t"				\
> > +		"lui	%[__tmp],0x1234\n\t"				\
> > +		"addiw	%[__ret],%[__ret],-0x211\n\t"			\
> > +		"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
> > +		ALTERNATIVE_2(						\
> > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > +			"slli	%[__ret],%[__ret],32\n\t"		\
> > +			"srli	%[__ret],%[__ret],32\n\t"		\
> > +			"add	%[__ret],%[__ret],%[__tmp]\n\t",	\
> > +			".option push\n\t"				\
> > +			".option arch,+zba\n\t"				\
> > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > +			"add.uw %[__ret],%[__ret],%[__tmp]\n\t"		\
> > +			"nop\n\t"					\
> > +			"nop\n\t"					\
> > +			".option pop\n\t",				\
> > +			0, RISCV_ISA_EXT_ZBA, 1,			\
> > +			".option push\n\t"				\
> > +			".option arch,+zbkb\n\t"			\
> > +			"pack	%[__ret],%[__ret],%[__tmp]\n\t"		\
> > +			"nop\n\t"					\
> > +			"nop\n\t"					\
> > +			"nop\n\t"					\
> > +			".option pop\n\t",				\
> > +			0, RISCV_ISA_EXT_ZBKB, 1			\
> > +		)							\
> > +		".option pop\n\t"					\
> > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
> > +		".long 1b - .\n\t"					\
> > +		".popsection"						\
> > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > +	__ret;								\
> > +})
> > +#endif
> > +
> > +#ifdef CONFIG_32BIT
> > +#define SRLI "srli "
> > +#else
> > +#define SRLI "srliw "
> > +#endif
> > +
> > +#define runtime_const_shift_right_32(val, sym)			\
> > +({								\
> > +	u32 __ret;						\
> > +	asm_inline("1:\t"					\
> > +		".option push\n\t"				\
> > +		".option norvc\n\t"				\
> > +		SRLI "%[__ret],%[__val],12\n\t"			\
> > +		".option pop\n\t"				\
> > +		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
> > +		".long 1b - .\n\t"				\
> > +		".popsection"					\
> > +		: [__ret] "=r" (__ret)				\
> > +		: [__val] "r" (val));				\
> > +	__ret;							\
> > +})
> > +
> > +#define runtime_const_init(type, sym) do {			\
> > +	extern s32 __start_runtime_##type##_##sym[];		\
> > +	extern s32 __stop_runtime_##type##_##sym[];		\
> > +								\
> > +	runtime_const_fixup(__runtime_fixup_##type,		\
> > +			    (unsigned long)(sym),		\
> > +			    __start_runtime_##type##_##sym,	\
> > +			    __stop_runtime_##type##_##sym);	\
> > +} while (0)
> > +
> > +static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> > +{
> > +	/* On riscv there are currently only cache-wide flushes so va is ignored. */
> > +	__always_unused uintptr_t va = (uintptr_t)where;
> > +
> > +	flush_icache_range(va, va + 4*insns);
> > +}
> > +
> > +/*
> > + * The 32-bit immediate is stored in a lui+addi pairing.
> > + * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
> > + * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
> > + */
> > +static inline void __runtime_fixup_32(u32 *lui, u32 *addi, unsigned int val)
> > +{
> > +	unsigned int lower_immediate, upper_immediate;
> > +	u32 lui_insn = le32_to_cpu(*lui);
> > +	u32 addi_insn = le32_to_cpu(*addi);
> 
> Because of the compressed extensions RISC-V instructions are only aligned on
> 16bit boundaries, so is there another reason you know that these two
> instructions are 32bit aligned? Otherwise you're adding unaligned accesses
> here.

Great point, thank you. I will add a ".align 4" to the beginning of
these instructions to force the alignment.

- Charlie

> 
> /Emil
> 
> > +	__le32 addi_res, lui_res;
> > +
> > +	lower_immediate = sign_extend32(val, 11);
> > +	upper_immediate = (val - lower_immediate);
> > +
> > +	if (upper_immediate & 0xfffff000) {
> > +		/* replace upper 20 bits of lui with upper immediate */
> > +		lui_insn &= 0x00000fff;
> > +		lui_insn |= upper_immediate & 0xfffff000;
> > +	} else {
> > +		/* replace lui with nop if immediate is small enough to fit in addi */
> > +		lui_insn = 0x00000013;
> > +	}
> > +
> > +	if (lower_immediate & 0x00000fff) {
> > +		/* replace upper 12 bits of addi with lower 12 bits of val */
> > +		addi_insn &= 0x000fffff;
> > +		addi_insn |= (lower_immediate & 0x00000fff) << 20;
> > +	} else {
> > +		/* replace addi with nop if lower_immediate is empty */
> > +		addi_insn = 0x00000013;
> > +	}
> > +
> > +	addi_res = cpu_to_le32(addi_insn);
> > +	lui_res = cpu_to_le32(lui_insn);
> > +	patch_insn_write(addi, &addi_res, sizeof(addi_res));
> > +	patch_insn_write(lui, &lui_res, sizeof(lui_res));
> > +}
> > +
> > +static inline void __runtime_fixup_ptr(void *where, unsigned long val)
> > +{
> > +	if (IS_ENABLED(CONFIG_32BIT)) {
> > +		__runtime_fixup_32(where, where + 4, val);
> > +		__runtime_fixup_caches(where, 2);
> > +	} else {
> > +		__runtime_fixup_32(where, where + 8, val);
> > +		__runtime_fixup_32(where + 4, where + 12, val >> 32);
> > +		__runtime_fixup_caches(where, 4);
> > +	}
> > +}
> > +
> > +/*
> > + * Replace the least significant 5 bits of the srli/srliw immediate that is
> > + * located at bits 20-24
> > + */
> > +static inline void __runtime_fixup_shift(void *where, unsigned long val)
> > +{
> > +	u32 insn = le32_to_cpu(*(__le32 *)where);
> > +	__le32 res;
> > +
> > +	insn &= 0xfe0fffff;
> > +	insn |= (val & 0b11111) << 20;
> > +
> > +	res = cpu_to_le32(insn);
> > +	patch_text_nosync(where, &res, sizeof(insn));
> > +}
> > +
> > +static inline void runtime_const_fixup(void (*fn)(void *, unsigned long),
> > +				       unsigned long val, s32 *start, s32 *end)
> > +{
> > +	while (start < end) {
> > +		fn(*start + (void *)start, val);
> > +		start++;
> > +	}
> > +}
> > +
> > +#endif /* _ASM_RISCV_RUNTIME_CONST_H */
> > diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
> > index 002ca58dd998cb78b662837b5ebac988fb6c77bb..61bd5ba6680a786bf1db7dc37bf1acda0639b5c7 100644
> > --- a/arch/riscv/kernel/vmlinux.lds.S
> > +++ b/arch/riscv/kernel/vmlinux.lds.S
> > @@ -97,6 +97,9 @@ SECTIONS
> >  	{
> >  		EXIT_DATA
> >  	}
> > +
> > +	RUNTIME_CONST_VARIABLES
> > +
> >  	PERCPU_SECTION(L1_CACHE_BYTES)
> >
> >  	.rel.dyn : {
> >
> > ---
> > base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
> > change-id: 20250123-runtime_const_riscv-6cd854ee2817
> > --
> > - Charlie
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
