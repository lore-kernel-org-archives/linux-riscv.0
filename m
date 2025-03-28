Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CAC28B20
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 19:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/VRf9YuijZIwoTMZgvv77hA5hrcKGbqdfNrCKTIWuo=; b=KRtDSxLJ7Tr7Jz
	MQmy8yTyxXZ2Q7QOL93+wkZ2t0gEP10yIiPj8ENNbnLOSKAPVDJPaeyhFQ3senZQFqmOmC5mbYC8/
	eBy8dQhnInlZDsTK2B10VdmU6hDaMt/C3BhR+fXQkBzs1WcrgbSEIg0+BzszPCGxf9XMRnbHm+9ue
	5xUNqrJ2ZPSXjh3WXAJZGNSiP4JtCTa+ZeYRqF0Hh8tkm0jWtvWTObzDQA6cZk9SDubIuQvNmGebn
	DO9lHQzIXGsbLbKUAziBssQt47rugCCqSPJXy0MRLXjMn5umIcATGJw0aC0e571zNyZooMJLpCzg8
	vYaMDJ5PRR6T6Qn9lm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyFjw-0000000EDC4-1u4t;
	Fri, 28 Mar 2025 19:51:40 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyFjt-0000000EDBM-2EGM
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 19:51:39 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-22548a28d0cso73489965ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743191496; x=1743796296; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I3TA8fsr9ACmqqR/fHM36KEILcuRjI0DdM6vpHwmoCw=;
        b=z8zeEWFsURjUq7OljMFI2tmUetUlopgnITHfwxQwrz7GRhk/Yd1RmgqqPIqOL3waYf
         63g01vbMDc7dOusjkza2ow8hOmyo0w9MHNIlhNsO0/4RPlcSikT3zPjnYA7EkagdPtX4
         s4nXT20+Ne7cMPkLyMn1wqptMQ64hf+7g98sFtIlJP8D0LJXQqR0JwA1TmVgVC4ChPbL
         pd2lNpMwLx+4QbN0YAxbOoqK+HvvLEvuqErPT9anBl6rMuezNN7InnCpsGVEuzxo99L3
         HWItAi99kjyjaQLvPZe2w1dFLBoBw5pqPwxJ0DiQ/zDve/OmNcLnrbTbw7IGg3taM0G9
         +RqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743191496; x=1743796296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3TA8fsr9ACmqqR/fHM36KEILcuRjI0DdM6vpHwmoCw=;
        b=Dd8MWkmpLf/x/h4Mvy98x72eMfnwl1pGKDBSyjA50toJqk6c43uJIkLUboOH4PZcNu
         Bk7zzPiSyyr0V8BurPxBHfb1Kzq54DTBHZsXfbDMcYu4cTs4Dmrwe/PBq1EHq+kGPAbH
         Uo5bQf/ojyLe4CyFpUraFD2Mlftsecs3rdv4JAZUfjLJbUhpg+rfr6PGJPX1fKSCI6Sx
         QnUpJ93j0lozhOiINQaqQOhIYvwn/RBPINm9Eqb8eA/S/0htTSmJ7riS5O7xnZ6wEYwz
         o6vK/ipRCmXdf/uGzvTNUNECWAdq5pXdA1v75p4smUTsNz1EsIPZWdF4KLy48+YTvsMr
         nnCw==
X-Forwarded-Encrypted: i=1; AJvYcCXpY9rGZyR2vE8K7vY6eQk5JhkQeBTRWhWJHi6Qhh1mAAbkri0SeAMNGs8UG2IXeMnIUEfbwXGDdM+p9w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzep4oIWeBfTWOiUTHobniH8WpLsMJXt0HLawHURzSQqKmkVTT6
	kZ35Sv/S0i0FueoJRgPUj79tFCoigtSGCES02dpaiO6bmxz1+f802Xe6i7QKJ8M=
X-Gm-Gg: ASbGncslwkNhp/DtkKMiZ5eAi1avH5OcDPODfFEXgGqoZuHH0V4eNdVN2y8+BCpDLyt
	VDiGs5GYndOmk2rvNT6Zik3+jJ87yTiNFBiPppQb1WBkDPLNuNZ7ic7G7GV5xLX62xUVlUtuCs9
	iMBHrTsztzP66+GOqBmwdKMYe7TEo+qST6osW8PsWRA0fH+2vmgH6f16fVCAGNM93dMk/3qAS/A
	CMLGK1/JpZHVxU+pgPCnbv5ry2VEQ6YvFWZptMKK8+oyEAvJt14w4m4bd6gHMCVN68a21OTbILK
	GF1vK6M3T1yLzO6XcBVkv00625z1/Ahpk5o=
X-Google-Smtp-Source: AGHT+IFfy3t27eI8XmwG963lGECJWdRUQyqe2X6mdWZszIrx2SswT/w7I9YnepjWqmF2Xz063ycazQ==
X-Received: by 2002:a17:903:1a10:b0:224:1c41:a4bc with SMTP id d9443c01a7336-2292f96114cmr8684925ad.12.1743191496050;
        Fri, 28 Mar 2025 12:51:36 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec6140sm22743845ad.12.2025.03.28.12.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 12:51:35 -0700 (PDT)
Date: Fri, 28 Mar 2025 12:51:32 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Klara Modin <klarasmodin@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v10 2/2] riscv: Add runtime constant support
Message-ID: <Z-b9xGX7SaPgQq15@ghost>
References: <20250319-runtime_const_riscv-v10-0-745b31a11d65@rivosinc.com>
 <20250319-runtime_const_riscv-v10-2-745b31a11d65@rivosinc.com>
 <cc8f3525-20b7-445b-877b-2add28a160a2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cc8f3525-20b7-445b-877b-2add28a160a2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_125137_843635_B7452BC7 
X-CRM114-Status: GOOD (  41.19  )
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

On Fri, Mar 28, 2025 at 04:42:42PM +0100, Klara Modin wrote:
> Hi,
> 
> On 3/19/25 19:35, Charlie Jenkins wrote:
> > Implement the runtime constant infrastructure for riscv. Use this
> > infrastructure to generate constants to be used by the d_hash()
> > function.
> > 
> > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > constant' support") and commit e3c92e81711d ("runtime constants: add
> > x86 architecture support").
> 
> This patch causes the following build failure for me:
> 
> fs/dcache.c: Assembler messages:
> fs/dcache.c:157: Error: attempt to move .org backwards
> fs/dcache.c:157: Error: attempt to move .org backwards
> fs/dcache.c:157: Error: attempt to move .org backwards
> fs/dcache.c:157: Error: attempt to move .org backwards
> fs/dcache.c:157: Error: attempt to move .org backwards
> make[3]: *** [scripts/Makefile.build:203: fs/dcache.o] Error 1

Thank you for the report, this seems like a binutils issue potentially.
I will look into it. Here is a minimally reproducible example:

886 :
.option push
.option norvc
	nop
	nop
.option pop
887 :
888 :
.option push
.option norvc
.option arch,+zba
	nop
	nop
.option pop
889 :
.org	. - (887b - 886b) + (889b - 888b)
.org	. - (889b - 888b) + (887b - 886b)

Removing the ".option arch,+zba" fixes the issue but that shouldn't
matter...

- Charlie

> 
> The value of CONFIG_RISCV_ISA_ZBKB doesn't seem to have an impact. Reverting
> the patch on top of next-20250328 resolved the issue for me. I attached the
> generated fs/dcache.s.
> 
> Please let me know if there's anything else you need.
> 
> Regards,
> Klara Modin
> 
> > 
> > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > ---
> >   arch/riscv/Kconfig                     |  22 +++
> >   arch/riscv/include/asm/asm.h           |   1 +
> >   arch/riscv/include/asm/runtime-const.h | 265 +++++++++++++++++++++++++++++++++
> >   arch/riscv/kernel/vmlinux.lds.S        |   3 +
> >   4 files changed, 291 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 7612c52e9b1e35607f1dd4603a596416d3357a71..c123f7c0579c1aca839e3c04bdb662d6856ae765 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -783,6 +783,28 @@ config RISCV_ISA_ZBC
> >   	   If you don't know what to do here, say Y.
> > +config TOOLCHAIN_HAS_ZBKB
> > +	bool
> > +	default y
> > +	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbkb)
> > +	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbkb)
> > +	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
> > +	depends on AS_HAS_OPTION_ARCH
> > +
> > +config RISCV_ISA_ZBKB
> > +	bool "Zbkb extension support for bit manipulation instructions"
> > +	depends on TOOLCHAIN_HAS_ZBKB
> > +	depends on RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Adds support to dynamically detect the presence of the ZBKB
> > +	   extension (bit manipulation for cryptography) and enable its usage.
> > +
> > +	   The Zbkb extension provides instructions to accelerate a number
> > +	   of common cryptography operations (pack, zip, etc).
> > +
> > +	   If you don't know what to do here, say Y.
> > +
> >   config RISCV_ISA_ZICBOM
> >   	bool "Zicbom extension support for non-coherent DMA operation"
> >   	depends on MMU
> > diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> > index 776354895b81e7dc332e58265548aaf7365a6037..a8a2af6dfe9d2406625ca8fc94014fe5180e4fec 100644
> > --- a/arch/riscv/include/asm/asm.h
> > +++ b/arch/riscv/include/asm/asm.h
> > @@ -27,6 +27,7 @@
> >   #define REG_ASM		__REG_SEL(.dword, .word)
> >   #define SZREG		__REG_SEL(8, 4)
> >   #define LGREG		__REG_SEL(3, 2)
> > +#define SRLI		__REG_SEL(srliw, srli)
> >   #if __SIZEOF_POINTER__ == 8
> >   #ifdef __ASSEMBLY__
> > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..a23a9bd47903b2765608c75cd83f01ae578dffaa
> > --- /dev/null
> > +++ b/arch/riscv/include/asm/runtime-const.h
> > @@ -0,0 +1,265 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +#ifndef _ASM_RISCV_RUNTIME_CONST_H
> > +#define _ASM_RISCV_RUNTIME_CONST_H
> > +
> > +#include <asm/asm.h>
> > +#include <asm/alternative.h>
> > +#include <asm/cacheflush.h>
> > +#include <asm/insn-def.h>
> > +#include <linux/memory.h>
> > +#include <asm/text-patching.h>
> > +
> > +#include <linux/uaccess.h>
> > +
> > +#ifdef CONFIG_32BIT
> > +#define runtime_const_ptr(sym)					\
> > +({								\
> > +	typeof(sym) __ret;					\
> > +	asm_inline(".option push\n\t"				\
> > +		".option norvc\n\t"				\
> > +		"1:\t"						\
> > +		"lui	%[__ret],0x89abd\n\t"			\
> > +		"addi	%[__ret],%[__ret],-0x211\n\t"		\
> > +		".option pop\n\t"				\
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
> > +#define RISCV_RUNTIME_CONST_64_PREAMBLE				\
> > +	".option push\n\t"					\
> > +	".option norvc\n\t"					\
> > +	"1:\t"							\
> > +	"lui	%[__ret],0x89abd\n\t"				\
> > +	"lui	%[__tmp],0x1234\n\t"				\
> > +	"addiw	%[__ret],%[__ret],-0x211\n\t"			\
> > +	"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
> > +
> > +#define RISCV_RUNTIME_CONST_64_BASE				\
> > +	"slli	%[__tmp],%[__tmp],32\n\t"			\
> > +	"slli	%[__ret],%[__ret],32\n\t"			\
> > +	"srli	%[__ret],%[__ret],32\n\t"			\
> > +	"add	%[__ret],%[__ret],%[__tmp]\n\t"			\
> > +
> > +#define RISCV_RUNTIME_CONST_64_ZBA				\
> > +	".option push\n\t"					\
> > +	".option arch,+zba\n\t"					\
> > +	"slli	%[__tmp],%[__tmp],32\n\t"			\
> > +	"add.uw %[__ret],%[__ret],%[__tmp]\n\t"			\
> > +	"nop\n\t"						\
> > +	"nop\n\t"						\
> > +	".option pop\n\t"					\
> > +
> > +#define RISCV_RUNTIME_CONST_64_ZBKB				\
> > +	".option push\n\t"					\
> > +	".option arch,+zbkb\n\t"				\
> > +	"pack	%[__ret],%[__ret],%[__tmp]\n\t"			\
> > +	"nop\n\t"						\
> > +	"nop\n\t"						\
> > +	"nop\n\t"						\
> > +	".option pop\n\t"					\
> > +
> > +#define RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
> > +	".option pop\n\t"					\
> > +	".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
> > +	".long 1b - .\n\t"					\
> > +	".popsection"						\
> > +
> > +#if defined(CONFIG_RISCV_ISA_ZBA) && defined(CONFIG_RISCV_ISA_ZBKB)
> > +#define runtime_const_ptr(sym)						\
> > +({									\
> > +	typeof(sym) __ret, __tmp;					\
> > +	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
> > +		ALTERNATIVE_2(						\
> > +			RISCV_RUNTIME_CONST_64_BASE,			\
> > +			RISCV_RUNTIME_CONST_64_ZBA,			\
> > +			0, RISCV_ISA_EXT_ZBA, 1,			\
> > +			RISCV_RUNTIME_CONST_64_ZBKB,			\
> > +			0, RISCV_ISA_EXT_ZBKB, 1			\
> > +		)							\
> > +		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
> > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > +	__ret;								\
> > +})
> > +#elif defined(CONFIG_RISCV_ISA_ZBA)
> > +#define runtime_const_ptr(sym)						\
> > +({									\
> > +	typeof(sym) __ret, __tmp;					\
> > +	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
> > +		ALTERNATIVE(						\
> > +			RISCV_RUNTIME_CONST_64_BASE,			\
> > +			RISCV_RUNTIME_CONST_64_ZBA,			\
> > +			0, RISCV_ISA_EXT_ZBA, 1				\
> > +		)							\
> > +		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
> > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > +	__ret;								\
> > +})
> > +#elif defined(CONFIG_RISCV_ISA_ZBKB)
> > +#define runtime_const_ptr(sym)						\
> > +({									\
> > +	typeof(sym) __ret, __tmp;					\
> > +	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
> > +		ALTERNATIVE(						\
> > +			RISCV_RUNTIME_CONST_64_BASE,			\
> > +			RISCV_RUNTIME_CONST_64_ZBKB,			\
> > +			0, RISCV_ISA_EXT_ZBKB, 1			\
> > +		)							\
> > +		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
> > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > +	__ret;								\
> > +})
> > +#else
> > +#define runtime_const_ptr(sym)						\
> > +({									\
> > +	typeof(sym) __ret, __tmp;					\
> > +	asm_inline(RISCV_RUNTIME_CONST_64_PREAMBLE			\
> > +		RISCV_RUNTIME_CONST_64_BASE				\
> > +		RISCV_RUNTIME_CONST_64_POSTAMBLE(sym)			\
> > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > +	__ret;								\
> > +})
> > +#endif
> > +#endif
> > +
> > +#define runtime_const_shift_right_32(val, sym)			\
> > +({								\
> > +	u32 __ret;						\
> > +	asm_inline(".option push\n\t"				\
> > +		".option norvc\n\t"				\
> > +		"1:\t"						\
> > +		SRLI " %[__ret],%[__val],12\n\t"		\
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
> > +	flush_icache_range(va, va + 4 * insns);
> > +}
> > +
> > +/*
> > + * The 32-bit immediate is stored in a lui+addi pairing.
> > + * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
> > + * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
> > + */
> > +static inline void __runtime_fixup_32(__le16 *lui_parcel, __le16 *addi_parcel, unsigned int val)
> > +{
> > +	unsigned int lower_immediate, upper_immediate;
> > +	u32 lui_insn, addi_insn, addi_insn_mask;
> > +	__le32 lui_res, addi_res;
> > +
> > +	/* Mask out upper 12 bit of addi */
> > +	addi_insn_mask = 0x000fffff;
> > +
> > +	lui_insn = (u32)le16_to_cpu(lui_parcel[0]) | (u32)le16_to_cpu(lui_parcel[1]) << 16;
> > +	addi_insn = (u32)le16_to_cpu(addi_parcel[0]) | (u32)le16_to_cpu(addi_parcel[1]) << 16;
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
> > +		lui_insn = RISCV_INSN_NOP4;
> > +		/*
> > +		 * lui is being skipped, so do a load instead of an add. A load
> > +		 * is performed by adding with the x0 register. Setting rs to
> > +		 * zero with the following mask will accomplish this goal.
> > +		 */
> > +		addi_insn_mask &= 0x07fff;
> > +	}
> > +
> > +	if (lower_immediate & 0x00000fff) {
> > +		/* replace upper 12 bits of addi with lower 12 bits of val */
> > +		addi_insn &= addi_insn_mask;
> > +		addi_insn |= (lower_immediate & 0x00000fff) << 20;
> > +	} else {
> > +		/* replace addi with nop if lower_immediate is empty */
> > +		addi_insn = RISCV_INSN_NOP4;
> > +	}
> > +
> > +	addi_res = cpu_to_le32(addi_insn);
> > +	lui_res = cpu_to_le32(lui_insn);
> > +	mutex_lock(&text_mutex);
> > +	patch_insn_write(addi_parcel, &addi_res, sizeof(addi_res));
> > +	patch_insn_write(lui_parcel, &lui_res, sizeof(lui_res));
> > +	mutex_unlock(&text_mutex);
> > +}
> > +
> > +static inline void __runtime_fixup_ptr(void *where, unsigned long val)
> > +{
> > +#ifdef CONFIG_32BIT
> > +		__runtime_fixup_32(where, where + 4, val);
> > +		__runtime_fixup_caches(where, 2);
> > +#else
> > +		__runtime_fixup_32(where, where + 8, val);
> > +		__runtime_fixup_32(where + 4, where + 12, val >> 32);
> > +		__runtime_fixup_caches(where, 4);
> > +#endif
> > +}
> > +
> > +/*
> > + * Replace the least significant 5 bits of the srli/srliw immediate that is
> > + * located at bits 20-24
> > + */
> > +static inline void __runtime_fixup_shift(void *where, unsigned long val)
> > +{
> > +	__le16 *parcel = where;
> > +	__le32 res;
> > +	u32 insn;
> > +
> > +	insn = (u32)le16_to_cpu(parcel[0]) | (u32)le16_to_cpu(parcel[1]) << 16;
> > +
> > +	insn &= 0xfe0fffff;
> > +	insn |= (val & 0b11111) << 20;
> > +
> > +	res = cpu_to_le32(insn);
> > +	mutex_lock(&text_mutex);
> > +	patch_text_nosync(where, &res, sizeof(insn));
> > +	mutex_unlock(&text_mutex);
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
> >   	{
> >   		EXIT_DATA
> >   	}
> > +
> > +	RUNTIME_CONST_VARIABLES
> > +
> >   	PERCPU_SECTION(L1_CACHE_BYTES)
> >   	.rel.dyn : {
> > 

> # bad: [e21edb1638e82460f126a6e49bcdd958d452929c] Add linux-next specific files for 20250328
> git bisect start 'next/master'
> # status: waiting for good commit(s), bad commit known
> # good: [5c2a430e85994f4873ea5ec42091baa1153bc731] Merge tag 'ext4-for_linus-6.15-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4
> git bisect good 5c2a430e85994f4873ea5ec42091baa1153bc731
> # bad: [82dd76474d886e4e272cd3a6ce9e4a5cf193961d] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
> git bisect bad 82dd76474d886e4e272cd3a6ce9e4a5cf193961d
> # good: [04c3b8bb1d6173c070927ad07baae14aa3cda0b5] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
> git bisect good 04c3b8bb1d6173c070927ad07baae14aa3cda0b5
> # bad: [cf63bbbadeaaae64b5a42bf72c5f842ec412f006] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git
> git bisect bad cf63bbbadeaaae64b5a42bf72c5f842ec412f006
> # bad: [5744739d8ce78876d4b62a20fd6bc65f01ba142e] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
> git bisect bad 5744739d8ce78876d4b62a20fd6bc65f01ba142e
> # good: [6d1617d154d6759e6aa269bdb387ea8d7bd4bf52] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
> git bisect good 6d1617d154d6759e6aa269bdb387ea8d7bd4bf52
> # good: [861efb8a48ee8b73ae4e8817509cd4e82fd52bc4] powerpc/kexec: fix physical address calculation in clear_utlb_entry()
> git bisect good 861efb8a48ee8b73ae4e8817509cd4e82fd52bc4
> # bad: [74f4bf9d15ad1d6862b828d486ed10ea0e874a23] Merge patch series "riscv: Add runtime constant support"
> git bisect bad 74f4bf9d15ad1d6862b828d486ed10ea0e874a23
> # good: [82e81b89501a9f19a3a0b0d7d9641d86c1956284] riscv: migrate to the generic rule for built-in DTB
> git bisect good 82e81b89501a9f19a3a0b0d7d9641d86c1956284
> # good: [5b376a68da0a395d54684987efde647d8fa9027c] Merge patch series "riscv: add support for Zaamo and Zalrsc extensions"
> git bisect good 5b376a68da0a395d54684987efde647d8fa9027c
> # good: [2744ec472de31141ad354907ff98843dd6040917] riscv: Fix set up of vector cpu hotplug callback
> git bisect good 2744ec472de31141ad354907ff98843dd6040917
> # good: [d9b65824d8f8b69a9d80a5b4d1a8a52c3244f9c0] Merge patch series "riscv: Unaligned access speed probing fixes and skipping"
> git bisect good d9b65824d8f8b69a9d80a5b4d1a8a52c3244f9c0
> # bad: [a44fb5722199de8338d991db5ad3d509192179bb] riscv: Add runtime constant support
> git bisect bad a44fb5722199de8338d991db5ad3d509192179bb
> # good: [afa8a93932aa63b107d81bd438454760d8c7c8a3] riscv: Move nop definition to insn-def.h
> git bisect good afa8a93932aa63b107d81bd438454760d8c7c8a3
> # first bad commit: [a44fb5722199de8338d991db5ad3d509192179bb] riscv: Add runtime constant support




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
