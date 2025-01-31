Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A321C0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 14:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kpMzgusmSXYsuyIE740gDqGT3v864MMSxweeTZsLLTY=; b=BeOO5MkMgpSr+nhFtmXS3iMjQI
	YrQh11QYZgUT6vx+MrJnIdzboUywf1LySNusgyUx3qpoh+ldI2eWwq5kkICN8qxxU1f8Yrak46F9R
	SVTVFL1XfFBGYBxPepOmL0MYyfhcaM5W3JZnUZfpOyesiE1QQYd27M7EKsFbMT4oSyOi8XM1YbI19
	XDg9CUJCODp/7V3FB6MdMk9CJKJQ2KQIBEte4JomzTesk98egju9nzquHN7oCe3w04hUo/M3xc5MK
	N55T2bqE0xc57xunJxiOuW3MKfhmvL6CiBm7f4VprYE6GllwM77Agt1kGToXeKloG2UjEAt0bmtva
	mcr1nqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsHx-0000000An4o-2b6U;
	Fri, 31 Jan 2025 14:46:33 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdsHv-0000000An49-07Bg
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 14:46:32 +0000
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 85E7E3F689
	for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738334785;
	bh=dywRc+w6ungfZW0YZ3G7arI+8S//8XTXJSb7hsNnVZc=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=F9+hhaZXymSVXz51n9MZJ8mCsHS4Dj0QCHmPm6YS0VYdBq0X1u0CPcAgXmGXxSmAf
	 PaIn9zVu591hB0gjD88jZSu+8YFxtYiYkK54j7jhIF9pLX8+gvGkPGEPfBhF00sGw0
	 nYhRKUzlXDiFkFpzP9q2BBeWk/FQmsxiPF4x7B4CU+Ru8c30DPyd6hr0NaODUUSHS3
	 a0hjU/raMdLzJeuImWN+WiFdhNZpLgf0ZgEcJVtGjK7upEKE6RmlgOMyQdGu2PwWRW
	 7wKpX7OKeVKIGhaW6ej5ThvfiwzeCiCMAhNfqzdmceKte3S58nY4sWNouaS+t15M9Q
	 8NxgwlQRFMyDw==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2ade3b671d6so462223fac.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 06:46:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738334784; x=1738939584;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dywRc+w6ungfZW0YZ3G7arI+8S//8XTXJSb7hsNnVZc=;
        b=XvLs9vjgv6q142Xn5h/kZwM8KU5ySrPXP9SxyC+ksrVAxWX+0etpxNCMcKcpauFHS3
         Bdjgff5etrBtQ9t7wPVk1CxeFLN6l+UN9SmCE2VcMMTTXSuQ9mipDPu+xz7b9/VV4he4
         RWzloefQ+yxbU8ya7dY3i9rUwmkPHHFRbdfoMM6R3MVGusLDGDa9XhUj3skqdxtxQAwa
         YYWR+I6IR5MAB38qk+aaVEGowqKQgz4f70e0jNgrO8wMRK6626bqFbHv2rYBakQNoAYw
         /ElpXnHrep6NZqh+4QxlCO9m8oixzLK5LpMkpJHTUSmN5HOyFZjLE6GSDT68DNabeSLC
         nGNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdcmEig+NPxHSBkx5za9ZmsbuR+/5RT0f1/XmliuiSBw8hZIAdVCGxzLH/5tAk4cr5ez6IdPyydE+QSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3kLW7zlAUyAwe5ZsTPk857wma1pZ6OmOA8bhe4u5hat9ISeU7
	iLJcCCtIJ5ZaHt4WTbJlJ5lvhU2wOf958QwkQJbfdrcXcmvtNw/KihVlYkB5DlSZElY6UYM15O2
	KKYBslHrHN+Mkneh3YCWAQZubpADwsQTAHFZZRUeG+pg79lJ1agplTJQWaw8fEOPjv7xkR7Q0hu
	OpB3yDvPRbwF1yaFlGMVN4xvOWGisYmwxXdLAg2C/F18r1ERYwdEYeItXG
X-Gm-Gg: ASbGncu1luXx37p44ZYaDV6dJyfjW3gf/pzEFY86nldYebiabX9e5cf6Sdt5fqnLezy
	/KTRcja3D37uQLGHY80JRQwyqsLaNfQL6i6krGq84P8dzT/thPQoReq2orFpf
X-Received: by 2002:a05:6870:1594:b0:29d:c624:7cad with SMTP id 586e51a60fabf-2b32ef5de6fmr6786556fac.3.1738334783983;
        Fri, 31 Jan 2025 06:46:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEk0Mm8kCCRu1JZ2u85IGHR2JJAo4akW8JtTSMAgqE2qPAqAaSfJ/Jh8m9xwiOfe7gW/AMktmc6ShR8XOgPlg=
X-Received: by 2002:a05:6870:1594:b0:29d:c624:7cad with SMTP id
 586e51a60fabf-2b32ef5de6fmr6786537fac.3.1738334783696; Fri, 31 Jan 2025
 06:46:23 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jan 2025 06:46:23 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 31 Jan 2025 06:46:23 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <Z5wHgRG6eZKFevUQ@ghost>
References: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
 <CAJM55Z-J9EUotSW_Q0ERF=Vd0nEEhTv4SRHm96uNNxG1r6EsMQ@mail.gmail.com> <Z5wHgRG6eZKFevUQ@ghost>
Mime-Version: 1.0
Date: Fri, 31 Jan 2025 06:46:23 -0800
X-Gm-Features: AWEUYZksa4XSPdbmNSDJbnQ0sYft5p5YH7tqYEotYpDJYI8gigcAowye6m9V_5E
Message-ID: <CAJM55Z-9-WHY+31=6j-wAiaZdaPv_aH_=P6LEi16twgYH0FL6g@mail.gmail.com>
Subject: Re: [PATCH v3] riscv: Add runtime constant support
To: Charlie Jenkins <charlie@rivosinc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Ben Dooks <ben.dooks@codethink.co.uk>, 
	Pasha Bouzarjomehri <pasha@rivosinc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_064631_198031_F368070B 
X-CRM114-Status: GOOD (  29.43  )
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
> On Wed, Jan 29, 2025 at 04:30:49AM -0500, Emil Renner Berthing wrote:
> > Charlie Jenkins wrote:
> > > Implement the runtime constant infrastructure for riscv. Use this
> > > infrastructure to generate constants to be used by the d_hash()
> > > function.
> > >
> > > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > > constant' support") and commit e3c92e81711d ("runtime constants: add
> > > x86 architecture support").
> > >
> > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > ---
> > > Ard brought this to my attention in this patch [1].
> > >
> > > [1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/
> > > ---
> > > Changes in v3:
> > > - Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
> > >   by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
> > > - Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com
> > >
> > > Changes in v2:
> > > - Treat instructions as __le32 and do proper conversions (Ben)
> > > - Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
> > > ---
> > >  arch/riscv/include/asm/runtime-const.h | 194 +++++++++++++++++++++++++++++++++
> > >  arch/riscv/kernel/vmlinux.lds.S        |   3 +
> > >  2 files changed, 197 insertions(+)
> > >
> > > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..0ecbe6967013900781b0b1048d4622f676b64076
> > > --- /dev/null
> > > +++ b/arch/riscv/include/asm/runtime-const.h
> > > @@ -0,0 +1,194 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +#ifndef _ASM_RISCV_RUNTIME_CONST_H
> > > +#define _ASM_RISCV_RUNTIME_CONST_H
> > > +
> > > +#include <asm/alternative.h>
> > > +#include <asm/cacheflush.h>
> > > +#include <asm/text-patching.h>
> > > +#include <linux/uaccess.h>
> > > +
> > > +#ifdef CONFIG_32BIT
> > > +#define runtime_const_ptr(sym)					\
> > > +({								\
> > > +	typeof(sym) __ret, __tmp;				\
> > > +	asm_inline("1:\t"					\
> > > +		".option push"					\
> > > +		".option norvc"					\
> > > +		"lui	%[__ret],0x89abd\n\t"			\
> > > +		"addi	%[__ret],-0x211\n\t"			\
> > > +		".option pop"					\
> > > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
> > > +		".long 1b - .\n\t"				\
> > > +		".popsection"					\
> > > +		: [__ret] "=r" (__ret));			\
> > > +	__ret;							\
> > > +})
> > > +#else
> > > +/*
> > > + * Loading 64-bit constants into a register from immediates is a non-trivial
> > > + * task on riscv64. To get it somewhat performant, load 32 bits into two
> > > + * different registers and then combine the results.
> > > + *
> > > + * If the processor supports the Zbkb extension, we can combine the final
> > > + * "slli,slli,srli,add" into the single "pack" instruction. If the processor
> > > + * doesn't support Zbkb but does support the Zbb extension, we can
> > > + * combine the final "slli,srli,add" into one instruction "add.uw".
> > > + */
> > > +#define runtime_const_ptr(sym)						\
> > > +({									\
> > > +	typeof(sym) __ret, __tmp;					\
> > > +	asm_inline("1:\t"						\
> > > +		".option push\n\t"					\
> > > +		".option norvc\n\t"					\
> > > +		"lui	%[__ret],0x89abd\n\t"				\
> > > +		"lui	%[__tmp],0x1234\n\t"				\
> > > +		"addiw	%[__ret],%[__ret],-0x211\n\t"			\
> > > +		"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
> > > +		ALTERNATIVE_2(						\
> > > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > > +			"slli	%[__ret],%[__ret],32\n\t"		\
> > > +			"srli	%[__ret],%[__ret],32\n\t"		\
> > > +			"add	%[__ret],%[__ret],%[__tmp]\n\t",	\
> > > +			".option push\n\t"				\
> > > +			".option arch,+zba\n\t"				\
> > > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > > +			"add.uw %[__ret],%[__ret],%[__tmp]\n\t"		\
> > > +			"nop\n\t"					\
> > > +			"nop\n\t"					\
> > > +			".option pop\n\t",				\
> > > +			0, RISCV_ISA_EXT_ZBA, 1,			\
> > > +			".option push\n\t"				\
> > > +			".option arch,+zbkb\n\t"			\
> > > +			"pack	%[__ret],%[__ret],%[__tmp]\n\t"		\
> > > +			"nop\n\t"					\
> > > +			"nop\n\t"					\
> > > +			"nop\n\t"					\
> > > +			".option pop\n\t",				\
> > > +			0, RISCV_ISA_EXT_ZBKB, 1			\
> > > +		)							\
> > > +		".option pop\n\t"					\
> > > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
> > > +		".long 1b - .\n\t"					\
> > > +		".popsection"						\
> > > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > > +	__ret;								\
> > > +})
> > > +#endif
> > > +
> > > +#ifdef CONFIG_32BIT
> > > +#define SRLI "srli "
> > > +#else
> > > +#define SRLI "srliw "
> > > +#endif
> > > +
> > > +#define runtime_const_shift_right_32(val, sym)			\
> > > +({								\
> > > +	u32 __ret;						\
> > > +	asm_inline("1:\t"					\
> > > +		".option push\n\t"				\
> > > +		".option norvc\n\t"				\
> > > +		SRLI "%[__ret],%[__val],12\n\t"			\
> > > +		".option pop\n\t"				\
> > > +		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
> > > +		".long 1b - .\n\t"				\
> > > +		".popsection"					\
> > > +		: [__ret] "=r" (__ret)				\
> > > +		: [__val] "r" (val));				\
> > > +	__ret;							\
> > > +})
> > > +
> > > +#define runtime_const_init(type, sym) do {			\
> > > +	extern s32 __start_runtime_##type##_##sym[];		\
> > > +	extern s32 __stop_runtime_##type##_##sym[];		\
> > > +								\
> > > +	runtime_const_fixup(__runtime_fixup_##type,		\
> > > +			    (unsigned long)(sym),		\
> > > +			    __start_runtime_##type##_##sym,	\
> > > +			    __stop_runtime_##type##_##sym);	\
> > > +} while (0)
> > > +
> > > +static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> > > +{
> > > +	/* On riscv there are currently only cache-wide flushes so va is ignored. */
> > > +	__always_unused uintptr_t va = (uintptr_t)where;
> > > +
> > > +	flush_icache_range(va, va + 4*insns);
> > > +}
> > > +
> > > +/*
> > > + * The 32-bit immediate is stored in a lui+addi pairing.
> > > + * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
> > > + * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
> > > + */
> > > +static inline void __runtime_fixup_32(u32 *lui, u32 *addi, unsigned int val)
> > > +{
> > > +	unsigned int lower_immediate, upper_immediate;
> > > +	u32 lui_insn = le32_to_cpu(*lui);
> > > +	u32 addi_insn = le32_to_cpu(*addi);
> >
> > Because of the compressed extensions RISC-V instructions are only aligned on
> > 16bit boundaries, so is there another reason you know that these two
> > instructions are 32bit aligned? Otherwise you're adding unaligned accesses
> > here.
>
> Great point, thank you. I will add a ".align 4" to the beginning of
> these instructions to force the alignment.

Unless there is a specific reason to do the alignment in this case, I'd much
rather we just do two 16bit reads like riscv/kernel/module.c already does.

/Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
