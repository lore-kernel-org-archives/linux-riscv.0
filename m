Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF30CC0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 21:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hCEIffU+SzMYIjlaoLBagbwt7nYjUh+VXY1fSYKlRRI=; b=Gk9RVy1xyLTvLh
	LrTmryCZoO1+VB8nyCkWEtqJH0+u+nq7UAWY/8b2Nwk93K9a2wjqzYtF3AR8RHfu8UsO1D6n8ygRl
	uu2LxhUoiUmJdMhnrykNQ0YD7WuJrueUKkJHntSt8hImMTnbIe4y6Gauh6MgwwtqfElBv+10px4k8
	nWdXR56K9sAyw1D+x1mz+gRyROdTk2C/UFqoClJbaoJeieBE7nnl4e2ay4Vfj6iik8cZI6/x6+4xD
	WhvhX+mSHBgc4/B5SSB064FZAf6gio/NXWFRRkgA5ZgYDFXUULj9lGyGEUqRGgersWJBu/086F2ZH
	DKLCizi5IKmjHFijxLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyTm-0000000BRf0-0rD1;
	Fri, 31 Jan 2025 21:23:10 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdyTj-0000000BRed-32Mm
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 21:23:09 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-216426b0865so44454645ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 13:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738358587; x=1738963387; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RmxkcSFmr3z7bCHHmaNbUyAfDn1/vDB3FZnNFx07Z1k=;
        b=zbOu7i+h3Xl5nx4Mh5V1Vl6sbdw7NGUFLNf78eiXJLp0MiD9Qn0ncLN2ydXLTyliNZ
         LdZhXLAGJp/QRshw2nGkvam112CU/0bxLaP+R5Ueae4un1r1/+kSxwnpPcArln9GmjZw
         rQMe83ydvW6WyPsHW1U8x6/b4UR/K2RGXtQ4naWaH+MFMl488oQHD4SX8RKHDPJzvgit
         aT5guEe+OLzayFDOZ/6bntmS4ejnBmMeVbJEmr8RIz3TKXdO8DPf0p/sKQo5Muncj4fX
         /gm7d7GpFZ3seQmG/OMvavtfwPujBIdZ3tsTJX62FPv6BU/3Wc6ds/NjRuTXvJmVH/r0
         wWWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738358587; x=1738963387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmxkcSFmr3z7bCHHmaNbUyAfDn1/vDB3FZnNFx07Z1k=;
        b=MLJIEIQM9AR6MSBhDc8NZvRoJEoQ3aeMIPhee3bbyKS55SYMcwpu0a8OvBiFMouapV
         aXHVyY3HA6rgmvq+emDuEG39zZc8zyOPi+cUJdwBqqGhlqHOAWYKRgky2jKFlMM4K+Xp
         PixC2fv+jqgfN3LGSucLB00lJVGn6YoDotWnPO44+B1ViCSUBIuj1CdAm3F/ATjcZ47k
         qQ2GSg3ISkIiuwGSCGAEcV8sb97gqeyj20gNTNrRd314bztbS6UztVVdDYvqxGOCQvmT
         nZIVqmAFlb+RfTLKGwWXkeFSlXveo4WtmpH6lnepLIdb0QtJT8ASMsziatXETaBr1rtZ
         X1AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrgyfQNoHl51dYOj0Y6Z3cl7T7bs9aS0pOFfqjxjzYDOZx8gaxfdAJ7ZF2CYQX0JWQQPt5NRIXt0FGIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXWfgwqDkmOgFpvawJYnSpvMUz4sGmfu4IFVFbIFRly7Bjb3bq
	omPO0ahFVS7H+Oo3WsJj7xcrpGSGdLhXnh2974K0KgfoqIur7lE2bs7Vhl/UNlU=
X-Gm-Gg: ASbGncvJgYw3Q7doK55M5a6UZgeZjSN3b8f+e3SfWhBp1WwlXLdNDkNXwj23X1wouya
	2hePLD20kmQcK2MLqV/2b3oCZ1/lWDzTzlgNplWfB/QTsIBe7KRD62dCeruruoRflENEk7QNpVH
	QFDt1nMM8slTnWMuiHV47aTHipHoa4+voeMXTIXSu/Aq4MRra1+jbSYBkjLJtW/xk9dN8d2haar
	MKT0A2y8VUP2wIs5Nr4bE6QYnjKxKiOSCvJlpWYxCHIXvnlc8t+CjGyi1BmCcRe7GVbWDFsIFGO
	/h5DHWYA2Q==
X-Google-Smtp-Source: AGHT+IHoAJHJmwdnqQn+ngdCzehp27BBh7mbd1t47saQAFMmleUTSGAfcl7vki69eEPKVt+KvIquPg==
X-Received: by 2002:a17:902:dac6:b0:215:ae3d:1dd7 with SMTP id d9443c01a7336-21dd7d80afcmr200579215ad.19.1738358585296;
        Fri, 31 Jan 2025 13:23:05 -0800 (PST)
Received: from ghost ([2001:428:6405:1e0:b67e:25c1:3d0b:392b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bd09cb1sm6488071a91.21.2025.01.31.13.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 13:23:04 -0800 (PST)
Date: Fri, 31 Jan 2025 13:23:02 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Pasha Bouzarjomehri <pasha@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] riscv: Add runtime constant support
Message-ID: <Z50_NsMX731u5JBh@ghost>
References: <20250128-runtime_const_riscv-v3-1-11922989e2d3@rivosinc.com>
 <CAJM55Z-J9EUotSW_Q0ERF=Vd0nEEhTv4SRHm96uNNxG1r6EsMQ@mail.gmail.com>
 <Z5wHgRG6eZKFevUQ@ghost>
 <CAJM55Z-9-WHY+31=6j-wAiaZdaPv_aH_=P6LEi16twgYH0FL6g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z-9-WHY+31=6j-wAiaZdaPv_aH_=P6LEi16twgYH0FL6g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_132308_045240_7F566994 
X-CRM114-Status: GOOD (  33.75  )
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

On Fri, Jan 31, 2025 at 06:46:23AM -0800, Emil Renner Berthing wrote:
> Charlie Jenkins wrote:
> > On Wed, Jan 29, 2025 at 04:30:49AM -0500, Emil Renner Berthing wrote:
> > > Charlie Jenkins wrote:
> > > > Implement the runtime constant infrastructure for riscv. Use this
> > > > infrastructure to generate constants to be used by the d_hash()
> > > > function.
> > > >
> > > > This is the riscv variant of commit 94a2bc0f611c ("arm64: add 'runtime
> > > > constant' support") and commit e3c92e81711d ("runtime constants: add
> > > > x86 architecture support").
> > > >
> > > > Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> > > > ---
> > > > Ard brought this to my attention in this patch [1].
> > > >
> > > > [1] https://lore.kernel.org/lkml/CAMj1kXE4DJnwFejNWQu784GvyJO=aGNrzuLjSxiowX_e7nW8QA@mail.gmail.com/
> > > > ---
> > > > Changes in v3:
> > > > - Leverage "pack" instruction for runtime_const_ptr() to reduce hot path
> > > >   by 3 instructions if Zbkb is supported. Suggested by Pasha Bouzarjomehri (pasha@rivosinc.com)
> > > > - Link to v2: https://lore.kernel.org/r/20250127-runtime_const_riscv-v2-1-95ae7cf97a39@rivosinc.com
> > > >
> > > > Changes in v2:
> > > > - Treat instructions as __le32 and do proper conversions (Ben)
> > > > - Link to v1: https://lore.kernel.org/r/20250127-runtime_const_riscv-v1-1-795b023ea20b@rivosinc.com
> > > > ---
> > > >  arch/riscv/include/asm/runtime-const.h | 194 +++++++++++++++++++++++++++++++++
> > > >  arch/riscv/kernel/vmlinux.lds.S        |   3 +
> > > >  2 files changed, 197 insertions(+)
> > > >
> > > > diff --git a/arch/riscv/include/asm/runtime-const.h b/arch/riscv/include/asm/runtime-const.h
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..0ecbe6967013900781b0b1048d4622f676b64076
> > > > --- /dev/null
> > > > +++ b/arch/riscv/include/asm/runtime-const.h
> > > > @@ -0,0 +1,194 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +#ifndef _ASM_RISCV_RUNTIME_CONST_H
> > > > +#define _ASM_RISCV_RUNTIME_CONST_H
> > > > +
> > > > +#include <asm/alternative.h>
> > > > +#include <asm/cacheflush.h>
> > > > +#include <asm/text-patching.h>
> > > > +#include <linux/uaccess.h>
> > > > +
> > > > +#ifdef CONFIG_32BIT
> > > > +#define runtime_const_ptr(sym)					\
> > > > +({								\
> > > > +	typeof(sym) __ret, __tmp;				\
> > > > +	asm_inline("1:\t"					\
> > > > +		".option push"					\
> > > > +		".option norvc"					\
> > > > +		"lui	%[__ret],0x89abd\n\t"			\
> > > > +		"addi	%[__ret],-0x211\n\t"			\
> > > > +		".option pop"					\
> > > > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"	\
> > > > +		".long 1b - .\n\t"				\
> > > > +		".popsection"					\
> > > > +		: [__ret] "=r" (__ret));			\
> > > > +	__ret;							\
> > > > +})
> > > > +#else
> > > > +/*
> > > > + * Loading 64-bit constants into a register from immediates is a non-trivial
> > > > + * task on riscv64. To get it somewhat performant, load 32 bits into two
> > > > + * different registers and then combine the results.
> > > > + *
> > > > + * If the processor supports the Zbkb extension, we can combine the final
> > > > + * "slli,slli,srli,add" into the single "pack" instruction. If the processor
> > > > + * doesn't support Zbkb but does support the Zbb extension, we can
> > > > + * combine the final "slli,srli,add" into one instruction "add.uw".
> > > > + */
> > > > +#define runtime_const_ptr(sym)						\
> > > > +({									\
> > > > +	typeof(sym) __ret, __tmp;					\
> > > > +	asm_inline("1:\t"						\
> > > > +		".option push\n\t"					\
> > > > +		".option norvc\n\t"					\
> > > > +		"lui	%[__ret],0x89abd\n\t"				\
> > > > +		"lui	%[__tmp],0x1234\n\t"				\
> > > > +		"addiw	%[__ret],%[__ret],-0x211\n\t"			\
> > > > +		"addiw	%[__tmp],%[__tmp],0x567\n\t"			\
> > > > +		ALTERNATIVE_2(						\
> > > > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > > > +			"slli	%[__ret],%[__ret],32\n\t"		\
> > > > +			"srli	%[__ret],%[__ret],32\n\t"		\
> > > > +			"add	%[__ret],%[__ret],%[__tmp]\n\t",	\
> > > > +			".option push\n\t"				\
> > > > +			".option arch,+zba\n\t"				\
> > > > +			"slli	%[__tmp],%[__tmp],32\n\t"		\
> > > > +			"add.uw %[__ret],%[__ret],%[__tmp]\n\t"		\
> > > > +			"nop\n\t"					\
> > > > +			"nop\n\t"					\
> > > > +			".option pop\n\t",				\
> > > > +			0, RISCV_ISA_EXT_ZBA, 1,			\
> > > > +			".option push\n\t"				\
> > > > +			".option arch,+zbkb\n\t"			\
> > > > +			"pack	%[__ret],%[__ret],%[__tmp]\n\t"		\
> > > > +			"nop\n\t"					\
> > > > +			"nop\n\t"					\
> > > > +			"nop\n\t"					\
> > > > +			".option pop\n\t",				\
> > > > +			0, RISCV_ISA_EXT_ZBKB, 1			\
> > > > +		)							\
> > > > +		".option pop\n\t"					\
> > > > +		".pushsection runtime_ptr_" #sym ",\"a\"\n\t"		\
> > > > +		".long 1b - .\n\t"					\
> > > > +		".popsection"						\
> > > > +		: [__ret] "=r" (__ret), [__tmp] "=r" (__tmp));		\
> > > > +	__ret;								\
> > > > +})
> > > > +#endif
> > > > +
> > > > +#ifdef CONFIG_32BIT
> > > > +#define SRLI "srli "
> > > > +#else
> > > > +#define SRLI "srliw "
> > > > +#endif
> > > > +
> > > > +#define runtime_const_shift_right_32(val, sym)			\
> > > > +({								\
> > > > +	u32 __ret;						\
> > > > +	asm_inline("1:\t"					\
> > > > +		".option push\n\t"				\
> > > > +		".option norvc\n\t"				\
> > > > +		SRLI "%[__ret],%[__val],12\n\t"			\
> > > > +		".option pop\n\t"				\
> > > > +		".pushsection runtime_shift_" #sym ",\"a\"\n\t"	\
> > > > +		".long 1b - .\n\t"				\
> > > > +		".popsection"					\
> > > > +		: [__ret] "=r" (__ret)				\
> > > > +		: [__val] "r" (val));				\
> > > > +	__ret;							\
> > > > +})
> > > > +
> > > > +#define runtime_const_init(type, sym) do {			\
> > > > +	extern s32 __start_runtime_##type##_##sym[];		\
> > > > +	extern s32 __stop_runtime_##type##_##sym[];		\
> > > > +								\
> > > > +	runtime_const_fixup(__runtime_fixup_##type,		\
> > > > +			    (unsigned long)(sym),		\
> > > > +			    __start_runtime_##type##_##sym,	\
> > > > +			    __stop_runtime_##type##_##sym);	\
> > > > +} while (0)
> > > > +
> > > > +static inline void __runtime_fixup_caches(void *where, unsigned int insns)
> > > > +{
> > > > +	/* On riscv there are currently only cache-wide flushes so va is ignored. */
> > > > +	__always_unused uintptr_t va = (uintptr_t)where;
> > > > +
> > > > +	flush_icache_range(va, va + 4*insns);
> > > > +}
> > > > +
> > > > +/*
> > > > + * The 32-bit immediate is stored in a lui+addi pairing.
> > > > + * lui holds the upper 20 bits of the immediate in the first 20 bits of the instruction.
> > > > + * addi holds the lower 12 bits of the immediate in the first 12 bits of the instruction.
> > > > + */
> > > > +static inline void __runtime_fixup_32(u32 *lui, u32 *addi, unsigned int val)
> > > > +{
> > > > +	unsigned int lower_immediate, upper_immediate;
> > > > +	u32 lui_insn = le32_to_cpu(*lui);
> > > > +	u32 addi_insn = le32_to_cpu(*addi);
> > >
> > > Because of the compressed extensions RISC-V instructions are only aligned on
> > > 16bit boundaries, so is there another reason you know that these two
> > > instructions are 32bit aligned? Otherwise you're adding unaligned accesses
> > > here.
> >
> > Great point, thank you. I will add a ".align 4" to the beginning of
> > these instructions to force the alignment.
> 
> Unless there is a specific reason to do the alignment in this case, I'd much
> rather we just do two 16bit reads like riscv/kernel/module.c already does.

I have no strong preference here. That does seem like a better solution
though.

- Charlie

> 
> /Emil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
