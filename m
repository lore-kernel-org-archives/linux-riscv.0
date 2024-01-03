Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0EEC3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 19:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Toe08+sFisPrLrz4Ch8kh0o0O2g1rLbJYyJlWYI2tI=; b=xhHgTxXCMSpFA2
	wJROSDKK2dcYlp6eq9OsI5H+LYFhzmtXBQTLBEwC0qhOidXVYnSLeMBa+1T0sGHL+uJAL2KcsGkE3
	nWyr5z62mVTqUrxBquilHKkeEklTllw44/s0KCEV9V9rTbYkT1Z05SWp/B4TGv7QRpSbyyhFTH27b
	VftMEL1Cc0sOO0znJYv9K33KshiozIs+I5g2KNUqo2NCIczaiM9efG7LM+JO/7RTB0vQ70mlJuTA8
	hb5xpR2JXCLC3yu5ELGXnrLkdAGKr6LjZ8gnMq/fNI3BEIaIIJ/G9g7TmCfwRjeFWN6G/EZFAOTvR
	WW4QP0IwarqtWRhePg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL6w0-00Bu5C-0t;
	Wed, 03 Jan 2024 19:29:48 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL6vv-00Bu4V-2W
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 19:29:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40d87ecf579so30207705e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 11:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704310181; x=1704914981; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=giZ22Qf0/f6l8Z72ZGWkin42yS5GZcWVDFt+pSIcwjI=;
        b=RqxauBiwQUcCqn4yIUlGQkb5BgUb6gmP96AN6meqSH95puIHoTpoEJnIHbpxErjh+y
         DnbBjRC8fphiOMhvboDDuXMf0fNJrIfe6nPnM/w75CmaQqjJVhAnIw2rrELmDYEDctnf
         ZPaAVm5GqqM3UAtW0dq5r4rYnXF0aR9Xu3n0csFsYacKaPwmrW2xAja/0HR0j6W4ZNi6
         SsY6Iy5mHHE1JDkhas+/4KE/6TWDrSozeAgeqvxuSKg1R7FhE/EHeCG0Me79yyvkrlIK
         MfBVIoqFTdRDlelucfnLDu2PAsIHccoKugO9AYDdubGt6jidxxU/QUICyZ32xkLDxyGO
         XxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704310181; x=1704914981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giZ22Qf0/f6l8Z72ZGWkin42yS5GZcWVDFt+pSIcwjI=;
        b=mBzp7CYH0EJd+lcYc9BiEBrqmSsG5bUdC4bBISErmcJs/3hU78rd9zFeeEdxGOGmoP
         IdBZHi2Pb3FeT2ejz1Ok93Mx6/76HVBibAoqkFSZeHFKxHBV+Gznh0iIFFZMDYQT5vHZ
         xI8OJjUfnLr05HySUdarR9f0mVLdt+xwFn9vempX1Le7FiXn6F+LMCiVeGlFP2FJ5GJX
         rXLmbdMHdFJI2ic6tdbiX1WCgRG1dnx3W+G0K1cnIBrzEMKfBRq1GO1nDHKLu1K64sc6
         sf2H+G3s4vmGKDxlN2azFKcjT0l3CVePBLvqc5zm98Te2dWoDLCo8edup9g+TfQY2WDt
         hW9Q==
X-Gm-Message-State: AOJu0YywI8VbCqqnUwqQBYasX3nUT7UWzq7D90PTb6oOCwNqfD5XwBg7
	1mUUCaiTX3hokhKD9SZHX8O4h9zXum0fXA==
X-Google-Smtp-Source: AGHT+IFjlvYd8muliACgtI+gvIpYId1++x2x9KCGdpTmPU1nvr1enadVOZRxgsfkEBTfe2xHzouFYQ==
X-Received: by 2002:a05:600c:1c92:b0:40d:5b1c:26fb with SMTP id k18-20020a05600c1c9200b0040d5b1c26fbmr4597765wms.32.1704310180743;
        Wed, 03 Jan 2024 11:29:40 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id g17-20020a05600c4ed100b0040d887fda00sm3233167wmq.26.2024.01.03.11.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 11:29:40 -0800 (PST)
Date: Wed, 3 Jan 2024 20:29:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Leonardo Bras <leobras@redhat.com>
Subject: Re: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions &
 cpufeature
Message-ID: <20240103-0c96ceea88523b7b946e4ba8@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-2-guoren@kernel.org>
 <ZZWs0C19tz763FnH@LeoBras>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZZWs0C19tz763FnH@LeoBras>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_112943_849346_C82DF200 
X-CRM114-Status: GOOD (  50.03  )
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
Cc: Guo Ren <guoren@linux.alibaba.com>, keescook@chromium.org, atishp@atishpatra.org, peterz@infradead.org, unicorn_wang@outlook.com, paul.walmsley@sifive.com, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, wuwei2016@iscas.ac.cn, palmer@dabbelt.com, jszhang@kernel.org, panqinglin2020@iscas.ac.cn, guoren@kernel.org, linux-riscv@lists.infradead.org, wefu@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jan 03, 2024 at 03:52:00PM -0300, Leonardo Bras wrote:
> On Sun, Dec 31, 2023 at 03:29:51AM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > Cache-block prefetch instructions are HINTs to the hardware to
> > indicate that software intends to perform a particular type of
> > memory access in the near future. This patch adds prefetch.i,
> > prefetch.r and prefetch.w instruction definitions by
> > RISCV_ISA_EXT_ZICBOP cpufeature.
> 
> Hi Guo Ren,
> 
> Here it would be nice to point a documentation for ZICBOP extension:
> https://wiki.riscv.org/display/HOME/Recently+Ratified+Extensions
> 
> or having a nice link for:
> https://drive.google.com/file/d/1jfzhNAk7viz4t2FLDZ5z4roA0LBggkfZ/view
> 
> > 
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/Kconfig                | 15 ++++++++
> >  arch/riscv/include/asm/hwcap.h    |  1 +
> >  arch/riscv/include/asm/insn-def.h | 60 +++++++++++++++++++++++++++++++
> >  arch/riscv/kernel/cpufeature.c    |  1 +
> >  4 files changed, 77 insertions(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index 24c1799e2ec4..fcbd417d65ea 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -579,6 +579,21 @@ config RISCV_ISA_ZICBOZ
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > +config RISCV_ISA_ZICBOP
> > +	bool "Zicbop extension support for cache block prefetch"
> > +	depends on MMU
> > +	depends on RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	  Adds support to dynamically detect the presence of the ZICBOP
> > +	  extension (Cache Block Prefetch Operations) and enable its
> > +	  usage.
> > +
> > +	  The Zicbop extension can be used to prefetch cache block for
> > +	  read/write fetch.
> > +
> > +	  If you don't know what to do here, say Y.
> > +
> 
> According to doc:
> "The Zicbop extension defines a set of cache-block prefetch instructions: 
> PREFETCH.R, PREFETCH.W, and PREFETCH.I"
> 
> So above text seems ok
> 
> 
> >  config TOOLCHAIN_HAS_ZIHINTPAUSE
> >  	bool
> >  	default y
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index 06d30526ef3b..77d3b6ee25ab 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -57,6 +57,7 @@
> >  #define RISCV_ISA_EXT_ZIHPM		42
> >  #define RISCV_ISA_EXT_SMSTATEEN		43
> >  #define RISCV_ISA_EXT_ZICOND		44
> > +#define RISCV_ISA_EXT_ZICBOP		45
> 
> Is this number just in kernel code, or does it mean something in the RISC-V 
> documentation?

kernel

> 
> >  
> >  #define RISCV_ISA_EXT_MAX		64
> >  
> > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > index e27179b26086..bbda350a63bf 100644
> > --- a/arch/riscv/include/asm/insn-def.h
> > +++ b/arch/riscv/include/asm/insn-def.h
> > @@ -18,6 +18,13 @@
> >  #define INSN_I_RD_SHIFT			 7
> >  #define INSN_I_OPCODE_SHIFT		 0
> >  
> > +#define INSN_S_SIMM7_SHIFT		25
> > +#define INSN_S_RS2_SHIFT		20
> > +#define INSN_S_RS1_SHIFT		15
> > +#define INSN_S_FUNC3_SHIFT		12
> > +#define INSN_S_SIMM5_SHIFT		 7
> > +#define INSN_S_OPCODE_SHIFT		 0
> > +
> 
> The shifts seem correct for S-Type, but I would name the IMM defines in a 
> way we could understand where they fit in IMM:
> 
> 
> INSN_S_SIMM5_SHIFT -> INSN_S_SIMM_0_4_SHIFT
> INSN_S_SIMM7_SHIFT -> INSN_S_SIMM_5_11_SHIFT
> 
> What do you think?

I'm in favor of this suggestion, but then wonder if we don't need another
patch before this which renames INSN_I_SIMM12_SHIFT to
INSN_I_SIMM_0_11_SHIFT in order to keep things consistent.

> 
> 
> >  #ifdef __ASSEMBLY__
> >  
> >  #ifdef CONFIG_AS_HAS_INSN
> > @@ -30,6 +37,10 @@
> >  	.insn	i \opcode, \func3, \rd, \rs1, \simm12
> >  	.endm
> >  
> > +	.macro insn_s, opcode, func3, rs2, simm12, rs1
> > +	.insn	s \opcode, \func3, \rs2, \simm12(\rs1)
> > +	.endm
> > +
> >  #else
> >  
> >  #include <asm/gpr-num.h>
> > @@ -51,10 +62,20 @@
> >  		 (\simm12 << INSN_I_SIMM12_SHIFT))
> >  	.endm
> >  
> > +	.macro insn_s, opcode, func3, rs2, simm12, rs1
> > +	.4byte	((\opcode << INSN_S_OPCODE_SHIFT) |		\
> > +		 (\func3 << INSN_S_FUNC3_SHIFT) |		\
> > +		 (.L__gpr_num_\rs2 << INSN_S_RS2_SHIFT) |	\
> > +		 (.L__gpr_num_\rs1 << INSN_S_RS1_SHIFT) |	\
> > +		 ((\simm12 & 0x1f) << INSN_S_SIMM5_SHIFT) |	\
> > +		 (((\simm12 >> 5) & 0x7f) << INSN_S_SIMM7_SHIFT))
> > +	.endm
> > +
> >  #endif
> >  
> >  #define __INSN_R(...)	insn_r __VA_ARGS__
> >  #define __INSN_I(...)	insn_i __VA_ARGS__
> > +#define __INSN_S(...)	insn_s __VA_ARGS__
> 
> As a curiosity: It's quite odd to have prefetch.{i,r,w} to be an S-Type 
> instruction, given this type was supposed to be for store instructions.
> 
> On prefetch.{i,r,w}:
> 31	   24   	 19    14    11	  	6
> imm[11:5] | PREFETCH_OP | rs1 | ORI | imm[4:0] | OP_IMM
> 
> For S-Type, we have:
> 31	   24     19    14       11	    6
> imm[11:5] | rs1  | rs2 | funct3 | imm[4:0] | opcode
> 
> For I-Type, we have:
> 31	    19    14       11	6
> immm[11:0] | rs1 | funct3 | rd | opcode
> 
> I understand that there should be reasons for choosing S-type, but it 
> would make much more sense (as per instruction type, and as per parameters)
> to go with I-Type. 
> 
> (I understand this was done in HW, and in kernel code we have better choice 
> to encode it as S-Type, but I kind of find the S-Type choice odd)

My speculation is that since cache block sizes will never be less than 32
bytes, it made more sense to use the S-type encoding space with imm[4:0]
hard coded to zero, allowing the I-Type encoding space to be reserved for
instructions which need arbitrary 12-bit immediates.

> 
> >  
> >  #else /* ! __ASSEMBLY__ */
> >  
> > @@ -66,6 +87,9 @@
> >  #define __INSN_I(opcode, func3, rd, rs1, simm12)	\
> >  	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
> >  
> > +#define __INSN_S(opcode, func3, rs2, simm12, rs1)	\
> > +	".insn	s " opcode ", " func3 ", " rs2 ", " simm12 "(" rs1 ")\n"
> > +
> >  #else
> >  
> >  #include <linux/stringify.h>
> > @@ -92,12 +116,26 @@
> >  "		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
> >  "	.endm\n"
> >  
> > +#define DEFINE_INSN_S							\
> > +	__DEFINE_ASM_GPR_NUMS						\
> > +"	.macro insn_s, opcode, func3, rs2, simm12, rs1\n"		\
> > +"	.4byte	((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"	\
> > +"		 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"	\
> > +"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
> > +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
> > +"		 ((\\simm12 & 0x1f) << " __stringify(INSN_S_SIMM5_SHIFT) ") |" \
> > +"		 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
> > +"	.endm\n"
> > +
> >  #define UNDEFINE_INSN_R							\
> >  "	.purgem insn_r\n"
> >  
> >  #define UNDEFINE_INSN_I							\
> >  "	.purgem insn_i\n"
> >  
> > +#define UNDEFINE_INSN_S							\
> > +"	.purgem insn_s\n"
> > +
> >  #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
> >  	DEFINE_INSN_R							\
> >  	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
> > @@ -108,6 +146,11 @@
> >  	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
> >  	UNDEFINE_INSN_I
> >  
> > +#define __INSN_S(opcode, func3, rs2, simm12, rs1)			\
> > +	DEFINE_INSN_S							\
> > +	"insn_s " opcode ", " func3 ", " rs2 ", " simm12 ", " rs1 "\n"	\
> > +	UNDEFINE_INSN_S
> > +
> >  #endif
> >  
> >  #endif /* ! __ASSEMBLY__ */
> > @@ -120,6 +163,10 @@
> >  	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
> >  		 RV_##rs1, RV_##simm12)
> >  
> > +#define INSN_S(opcode, func3, rs2, simm12, rs1)			\
> > +	__INSN_S(RV_##opcode, RV_##func3, RV_##rs2,		\
> > +		 RV_##simm12, RV_##rs1)
> > +
> 
> The defines above seem correct, but TBH I am not very used to review
> .macro code.
> 
> >  #define RV_OPCODE(v)		__ASM_STR(v)
> >  #define RV_FUNC3(v)		__ASM_STR(v)
> >  #define RV_FUNC7(v)		__ASM_STR(v)
> > @@ -133,6 +180,7 @@
> >  #define RV___RS2(v)		__RV_REG(v)
> >  
> >  #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
> > +#define RV_OPCODE_OP_IMM	RV_OPCODE(19)
> 
> Correct.
> 
> 
> >  #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
> >  
> >  #define HFENCE_VVMA(vaddr, asid)				\
> > @@ -196,4 +244,16 @@
> >  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> >  	       RS1(base), SIMM12(4))
> >  
> > +#define CBO_PREFETCH_I(base, offset)				\
> > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
> > +	       SIMM12(offset), RS1(base))
> > +
> > +#define CBO_PREFETCH_R(base, offset)				\
> > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
> > +	       SIMM12(offset), RS1(base))
> > +
> > +#define CBO_PREFETCH_W(base, offset)				\
> > +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
> > +	       SIMM12(offset), RS1(base))
> > +
> 
> For OP_IMM & FUNC3(6) we have ORI, right?
> For ORI, rd will be at bytes 11:7, which in PREFETCH.{i,r,w} is
> offset[4:0].
> 
> IIUC, when the cpu does not support ZICBOP, this should be fine as long as 
> rd = 0, since changes to r0 are disregarded.
> 
> In this case, we need to guarantee offset[4:0] = 0, or else we migth write 
> on an unrelated register. This can be noticed in ZICBOP documentation pages 
> 21, 22, 23, as offset[4:0] is always [0 0 0 0 0]. 
> (Google docs in first comment)
> 
> What we need here is something like:
> + enum {
> + 	PREFETCH_I,
> + 	PREFETCH_R,
> + 	PREFETCH_W,
> + }	 

Can't use enum. This header may be included in assembly.

> +
> + #define CBO_PREFETCH(type, base, offset)                      \
> +     INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(type),              \
> +            SIMM12(offset & ~0x1f), RS1(base))

Yes. I suggested we mask offset as well, but ideally we'd detect a caller
using an offset with nonzero lower 5 bits at compile time.

Thanks,
drew

> 
> + #define CBO_PREFETCH_I(base, offset)				\
> +     CBO_PREFETCH(PREFETCH_I, base, offset)
> +
> + #define CBO_PREFETCH_R(base, offset)				\
> +     CBO_PREFETCH(PREFETCH_R, base, offset)
> +
> + #define CBO_PREFETCH_W(base, offset)				\
> +     CBO_PREFETCH(PREFETCH_W, base, offset)
> +
> 
> Maybe replacing 0x1f by some MASK macro, so it looks nicer.
> (not sure how it's acceptable in asm, though).
> 
> The above would guarantee that we would never have CBO_PREFETCH_*() to mess 
> up any other register due to a unnoticed (base & 0x1f) != 0
> 
> Does that make sense?
> 
> >  #endif /* __ASM_INSN_DEF_H */
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index b3785ffc1570..bdb02b066041 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -168,6 +168,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> > +	__RISCV_ISA_EXT_DATA(zicbop, RISCV_ISA_EXT_ZICBOP),
> >  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> >  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
> >  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> > -- 
> > 2.40.1
> > 
> 
> Apart from above suggestions, seems a nice change :)
> 
> I suggest splitting this patch into 2, though:
> - Introducing S-Type instructions (plz point docs for reference) 
> - Introduce ZICBOP extension.
> 
> Thanks!
> Leo
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
