Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64A2EE643D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDTFeZbFKacptpOswGT8NMLswdhjWO1o//k/1kN+FOI=; b=zcC8LibNVLWMIB
	av6x5EJXj5gnu6XJApa2TrWAGs6JxQ8JB/whzuXH0bcSvwDZtRpN7+KobSTohl08dWvyjVlNu9Cvw
	NSvA62wTUg8emRZynX6O7b1k2nWLoR0Nh0NdBL6S00iIeyblBMCcxxmOB2xsm1KqMZLmLgmcfVIlO
	vVS1zCM55l+zGKpgtKcHzDUjscouh0tIqorz0cenIwMsQITudroJ48vWc2b2+qXYfcoAdubi2+gTh
	AbjY/rBr8pkYj0Vw7MG8B2eLvmY5R2AZ5msBxjBSDzP87atmeh/H38TIuC9jc3EgzwbcZmiVJH9//
	0dLoyxQT8b83IP+j7yTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh469-00A8yn-2x;
	Fri, 15 Sep 2023 08:22:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh467-00A8xC-05
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 08:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694766160;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EX4Tss94LQ/rIrtA1dGhkDHsEmNjKI6XV7p1bhSUC6E=;
	b=N8fgPMQ1CS/m+86XE4/F9+1cTCTwG45vRwiHhtqXszML/0eMKZI+8l6WXnPT2QWqAVmFiR
	/Dk63knRaIp5bPYFeoxrpWgP+1VhjVZy+Dd+rmiSGgwP0cVb/V4NochnuCXh9ZlzvSIElC
	1EK49Z9snA4KpDqlPrAxXYyuc1KwL1U=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-qX-5_HKeMQKQEwaxC9mVeQ-1; Fri, 15 Sep 2023 04:22:38 -0400
X-MC-Unique: qX-5_HKeMQKQEwaxC9mVeQ-1
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-573a7a3c405so2410017eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 01:22:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694766158; x=1695370958;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EX4Tss94LQ/rIrtA1dGhkDHsEmNjKI6XV7p1bhSUC6E=;
        b=akgiJMgrKgmXzdsflpT6wOQtNSYsvayjhznAFQfcgBdcXIQOPZccy76xwROEwRbgpZ
         /2py+swUI4UgA/mqkGRlR9LT7WPz3egVMwe0dT9ORp0B1yRCawkC7k74ZljbKe3EoUa2
         NRaHHZFxhtoU95mudQtaZqexNEtxPyLgYX5iqRXO523Avzx6k1IqMCdvLTYYbjqZ5ddT
         l8Aecx9q6PddnTYCFRjZLARcBxP7S3NoaRCntrniEZNw3Eus9hZ3vwAKHzL/d41Gx2rs
         vMtOLrR7dydvg2tPm+cmnB3MUKWX4M2JU+UzN6Yum++QdZTljNqPf5NCFxv+xk8fVu6c
         BBRQ==
X-Gm-Message-State: AOJu0YwIa3+Q6lwNI/Juvmgt+Mu0k14636O8/t7MQ9cM4FIryD4M/BdS
	B27YNWmWCDrKUk68w7WNg6pFH0ecjtTzIOj1G5kQbYAgoGtg/LPBis9vbMbW1klYA+ikavtBLei
	os4Qsa1XMbJ37Y2qGDSlTPtysAO79
X-Received: by 2002:a4a:2a05:0:b0:573:bf68:8dbc with SMTP id k5-20020a4a2a05000000b00573bf688dbcmr913050oof.7.1694766157926;
        Fri, 15 Sep 2023 01:22:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZRVa3tHzbVBpWYN0809AqN2jbKzoyT3PWcZldC1frQ5YeRmbIbyU7x5txQtTFP0VI4BE0lg==
X-Received: by 2002:a4a:2a05:0:b0:573:bf68:8dbc with SMTP id k5-20020a4a2a05000000b00573bf688dbcmr913029oof.7.1694766157618;
        Fri, 15 Sep 2023 01:22:37 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id d129-20020a4a5287000000b0057346742d82sm1529920oob.6.2023.09.15.01.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:22:37 -0700 (PDT)
Date: Fri, 15 Sep 2023 05:22:26 -0300
From: Leonardo Bras <leobras@redhat.com>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org,
	peterz@infradead.org, mingo@redhat.com, will@kernel.org,
	palmer@rivosinc.com, longman@redhat.com, boqun.feng@gmail.com,
	tglx@linutronix.de, paulmck@kernel.org, rostedt@goodmis.org,
	rdunlap@infradead.org, catalin.marinas@arm.com,
	conor.dooley@microchip.com, xiaoguang.xing@sophgo.com,
	bjorn@rivosinc.com, alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, jszhang@kernel.org, wefu@redhat.com,
	wuwei2016@iscas.ac.cn, linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 03/17] riscv: Use Zicbop in arch_xchg when available
Message-ID: <ZQQUQjOaAIc95GXP@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
 <20230914-1ce4f391a14e56b456d88188@orel>
MIME-Version: 1.0
In-Reply-To: <20230914-1ce4f391a14e56b456d88188@orel>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_012243_140095_42ED7C67 
X-CRM114-Status: GOOD (  38.21  )
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

On Thu, Sep 14, 2023 at 03:47:59PM +0200, Andrew Jones wrote:
> On Sun, Sep 10, 2023 at 04:28:57AM -0400, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> > 
> > Cache-block prefetch instructions are HINTs to the hardware to
> > indicate that software intends to perform a particular type of
> > memory access in the near future. Enable ARCH_HAS_PREFETCHW and
> > improve the arch_xchg for qspinlock xchg_tail.
> > 
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > ---
> >  arch/riscv/Kconfig                 | 15 +++++++++++++++
> >  arch/riscv/include/asm/cmpxchg.h   |  4 +++-
> >  arch/riscv/include/asm/hwcap.h     |  1 +
> >  arch/riscv/include/asm/insn-def.h  |  5 +++++
> >  arch/riscv/include/asm/processor.h | 13 +++++++++++++
> >  arch/riscv/kernel/cpufeature.c     |  1 +
> >  6 files changed, 38 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e9ae6fa232c3..2c346fe169c1 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -617,6 +617,21 @@ config RISCV_ISA_ZICBOZ
> >  
> >  	   If you don't know what to do here, say Y.
> >  
> > +config RISCV_ISA_ZICBOP
> > +	bool "Zicbop extension support for cache block prefetch"
> > +	depends on MMU
> > +	depends on RISCV_ALTERNATIVE
> > +	default y
> > +	help
> > +	   Adds support to dynamically detect the presence of the ZICBOP
> > +	   extension (Cache Block Prefetch Operations) and enable its
> > +	   usage.
> > +
> > +	   The Zicbop extension can be used to prefetch cache block for
> > +	   read/write/instruction fetch.
> > +
> > +	   If you don't know what to do here, say Y.
> > +
> >  config TOOLCHAIN_HAS_ZIHINTPAUSE
> >  	bool
> >  	default y
> > diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> > index 702725727671..56eff7a9d2d2 100644
> > --- a/arch/riscv/include/asm/cmpxchg.h
> > +++ b/arch/riscv/include/asm/cmpxchg.h
> > @@ -11,6 +11,7 @@
> >  
> >  #include <asm/barrier.h>
> >  #include <asm/fence.h>
> > +#include <asm/processor.h>
> >  
> >  #define __arch_xchg_masked(prepend, append, r, p, n)			\
> >  ({									\
> > @@ -25,6 +26,7 @@
> >  									\
> >  	__asm__ __volatile__ (						\
> >  	       prepend							\
> > +	       PREFETCHW_ASM(%5)					\
> >  	       "0:	lr.w %0, %2\n"					\
> >  	       "	and  %1, %0, %z4\n"				\
> >  	       "	or   %1, %1, %z3\n"				\
> > @@ -32,7 +34,7 @@
> >  	       "	bnez %1, 0b\n"					\
> >  	       append							\
> >  	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
> > -	       : "rJ" (__newx), "rJ" (~__mask)				\
> > +	       : "rJ" (__newx), "rJ" (~__mask), "rJ" (__ptr32b)		\
> >  	       : "memory");						\
> >  									\
> >  	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
> > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > index b7b58258f6c7..78b7b8b53778 100644
> > --- a/arch/riscv/include/asm/hwcap.h
> > +++ b/arch/riscv/include/asm/hwcap.h
> > @@ -58,6 +58,7 @@
> >  #define RISCV_ISA_EXT_ZICSR		40
> >  #define RISCV_ISA_EXT_ZIFENCEI		41
> >  #define RISCV_ISA_EXT_ZIHPM		42
> > +#define RISCV_ISA_EXT_ZICBOP		43
> >  
> >  #define RISCV_ISA_EXT_MAX		64
> >  
> > diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> > index 6960beb75f32..dc590d331894 100644
> > --- a/arch/riscv/include/asm/insn-def.h
> > +++ b/arch/riscv/include/asm/insn-def.h
> > @@ -134,6 +134,7 @@
> >  
> >  #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
> >  #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
> > +#define RV_OPCODE_PREFETCH	RV_OPCODE(19)
> 
> This should be named RV_OPCODE_OP_IMM and be placed in
> numerical order with the others, i.e. above SYSTEM.
> 
> >  
> >  #define HFENCE_VVMA(vaddr, asid)				\
> >  	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17),		\
> > @@ -196,4 +197,8 @@
> >  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> >  	       RS1(base), SIMM12(4))
> >  
> > +#define CBO_prefetchw(base)					\
> 
> Please name this 'PREFETCH_w' and it should take an immediate parameter,
> even if we intend to pass 0 for it.

It makes sense.

The mnemonic in the previously mentioned documentation is:

prefetch.w offset(base)

So yeah, makes sense to have both offset and base as parameters for 
CBO_prefetchw (or PREFETCH_w, I have no strong preference).

> 
> > +	INSN_R(OPCODE_PREFETCH, FUNC3(6), FUNC7(0),		\
> > +	       RD(x0), RS1(base), RS2(x0))
> 
> prefetch.w is not an R-type instruction, it's an S-type. While the bit
> shifts are the same, the names are different. We need to add S-type
> names while defining this instruction. 

That is correct, it is supposed to look like a store instruction (S-type), 
even though documentation don't explicitly state that.

Even though it works fine with the R-type definition, code documentation 
would be wrong, and future changes could break it.

> Then, this define would be
> 
>  #define PREFETCH_w(base, imm) \
>      INSN_S(OPCODE_OP_IMM, FUNC3(6), IMM_11_5(imm), __IMM_4_0(0), \
>             RS1(base), __RS2(3))

s/OPCODE_OP_IMM/OPCODE_PREFETCH
0x4 vs 0x13

RS2 == 0x3 is correct (PREFETCH.W instead of PREFETCH.I)


So IIUC, it should be:

INSN_S(OPCODE_PREFETCH, FUNC3(6), IMM_11_5(imm), __IMM_4_0(0), \
       RS1(base), __RS2(3)

Thanks,
Leo


> 
> When the assembler as insn_r I hope it will validate that
> (imm & 0xfe0) == imm
> 
> > +
> >  #endif /* __ASM_INSN_DEF_H */
> > diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> > index de9da852f78d..7ad3a24212e8 100644
> > --- a/arch/riscv/include/asm/processor.h
> > +++ b/arch/riscv/include/asm/processor.h
> > @@ -12,6 +12,8 @@
> >  #include <vdso/processor.h>
> >  
> >  #include <asm/ptrace.h>
> > +#include <asm/insn-def.h>
> > +#include <asm/hwcap.h>
> >  
> >  #ifdef CONFIG_64BIT
> >  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> > @@ -103,6 +105,17 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
> >  #define KSTK_EIP(tsk)		(ulong)(task_pt_regs(tsk)->epc)
> >  #define KSTK_ESP(tsk)		(ulong)(task_pt_regs(tsk)->sp)
> >  
> > +#define ARCH_HAS_PREFETCHW
> > +#define PREFETCHW_ASM(base)	ALTERNATIVE(__nops(1), \
> > +					    CBO_prefetchw(base), \
> > +					    0, \
> > +					    RISCV_ISA_EXT_ZICBOP, \
> > +					    CONFIG_RISCV_ISA_ZICBOP)
> > +static inline void prefetchw(const void *ptr)
> > +{
> > +	asm volatile(PREFETCHW_ASM(%0)
> > +		: : "r" (ptr) : "memory");
> > +}
> >  
> >  /* Do necessary setup to start up a newly executed thread. */
> >  extern void start_thread(struct pt_regs *regs,
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index ef7b4fd9e876..e0b897db0b97 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -159,6 +159,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> >  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
> >  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> > +	__RISCV_ISA_EXT_DATA(zicbop, RISCV_ISA_EXT_ZICBOP),
> 
> zicbop should be above zicboz (extensions alphabetical within their
> category).
> 
> >  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> >  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> >  	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> > -- 
> > 2.36.1
> >
> 
> Thanks,
> drew
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
