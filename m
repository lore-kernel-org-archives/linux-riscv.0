Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65284CA550A
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 08:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQ3V4Q04Go29sIDGYCA7fYVuMtG2sJ5nm2mDK7QGA68=; b=TGRi9CMl/PGgix
	Ih7QwXjM3lDA3+4GewKwAP5bN0/kdf4n1AuP6U3A00KqCWJBzn251DcFMCYmd3Bbpg06RWoXnmMgb
	bXC+VSDRCCR1Ij6eOrbLb6P11VBQsj5Bq/vkMRU3pm2PpXy647/4UqsDPxg9jPi81ucJACcWub47P
	NIYoPhA4rMrIb1T6sfYb6+6ndaPqL3MxmnJU9oQY4/rThYg7d1X3nCLuo/9Kg6B1zb91NikVQNK2z
	GH10ziIFy849rIoWh7jQxD4VAzVg4K2IRQfnI45UKhcWAJgR1e28+DeAmaS4t6Lte2YvH+40TxOJL
	xsyrKjx0N5lOLsDoos8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLZV-005Bhi-17;
	Wed, 13 Sep 2023 08:50:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLZQ-005Beg-0P
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 08:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694594998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CEEbRM+L5SAUMWcCbxhNrqKQfIPsl4YV6xdR61UZGBA=;
	b=JfrhzYw69RA4utN4l8KiP2dZFeW3JT53tPaSYbIPw1AIhIHcYi8g+ixBQ3i0llHEDRAaFu
	h7pJOvfLHo+hGqkiS+kA7pzsryLSW1f9Pfa56Q76/6cKhrhgv4aY3jefPwd95iD/wrnAE4
	QBIwpDZ6mtai/Q2bN/kFrYj0pzxkhcE=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-4Z2HfBnKP1q77zBjIHVbzw-1; Wed, 13 Sep 2023 04:49:56 -0400
X-MC-Unique: 4Z2HfBnKP1q77zBjIHVbzw-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6c0d445555eso4493455a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 01:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694594996; x=1695199796;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEEbRM+L5SAUMWcCbxhNrqKQfIPsl4YV6xdR61UZGBA=;
        b=CizaUon64Y4zdxAWLHVwHOzKfk2mf6goJbzb3jaaUnKsknzzl0+QeTAPMVnoX3aKOj
         iJxjYO0Ah+jXavIBYZlflKAeqfKNpqChytfZx5nuVswamMwDIzYwruZ6pgm/0VT6rjxE
         k0IhYAdSd+gSjFGmAyBrE49lETHrDJ0SkhFtT6LlOETBrt3caJe8YZCl3oEosLJuPtgO
         ZMG2juVin9aVOv0BG4jKg0YNxnM+bPZQO4ppLwFT/R47FMqFgDgZ6TurXvRz1OBmNjSJ
         UPvCwa6vNJPBkB/Jjbne3G0hRRKzVG3f5M3fcov45LxBDhfQWAbZmMwH4SyRcirKbllj
         cBog==
X-Gm-Message-State: AOJu0YyEi1QEDMYKVSIQ7q/VNoU28ya5wO/sHq4aXrq/Em58LfXhdP44
	v/Bv0wX51QUaLgtp63ebGLswwLCWtd+MUDeHTUPuDRTJeQy6vNQvNH4T8iDWK8fnOemgWG8OiIZ
	WZtU5BvA7eLawKAYsBCXYsBiOr/PB
X-Received: by 2002:a05:6830:42:b0:6bd:1059:8212 with SMTP id d2-20020a056830004200b006bd10598212mr2442878otp.26.1694594996255;
        Wed, 13 Sep 2023 01:49:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbL4AK6cS8gntncrHkfFRvxragh1Vk4rkFly+C/wOw+cgMI41aIbdMzJtL31SZ/Ari+MYAwA==
X-Received: by 2002:a05:6830:42:b0:6bd:1059:8212 with SMTP id d2-20020a056830004200b006bd10598212mr2442845otp.26.1694594996010;
        Wed, 13 Sep 2023 01:49:56 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:4ff9:7c29:fe41:6aa7:43df])
        by smtp.gmail.com with ESMTPSA id f18-20020a4ada52000000b00578a0824ff6sm1312546oou.20.2023.09.13.01.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 01:49:55 -0700 (PDT)
Date: Wed, 13 Sep 2023 05:49:45 -0300
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Cc: paul.walmsley@sifive.com, anup@brainfault.org, peterz@infradead.org,
	mingo@redhat.com, will@kernel.org, palmer@rivosinc.com,
	longman@redhat.com, boqun.feng@gmail.com, tglx@linutronix.de,
	paulmck@kernel.org, rostedt@goodmis.org, rdunlap@infradead.org,
	catalin.marinas@arm.com, conor.dooley@microchip.com,
	xiaoguang.xing@sophgo.com, bjorn@rivosinc.com,
	alexghiti@rivosinc.com, keescook@chromium.org,
	greentime.hu@sifive.com, ajones@ventanamicro.com,
	jszhang@kernel.org, wefu@redhat.com, wuwei2016@iscas.ac.cn,
	linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, kvm@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH V11 03/17] riscv: Use Zicbop in arch_xchg when available
Message-ID: <ZQF3qS1KRYAt3coC@redhat.com>
References: <20230910082911.3378782-1-guoren@kernel.org>
 <20230910082911.3378782-4-guoren@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230910082911.3378782-4-guoren@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_015000_253529_6DE2F497 
X-CRM114-Status: GOOD (  28.75  )
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

On Sun, Sep 10, 2023 at 04:28:57AM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Cache-block prefetch instructions are HINTs to the hardware to
> indicate that software intends to perform a particular type of
> memory access in the near future. Enable ARCH_HAS_PREFETCHW and
> improve the arch_xchg for qspinlock xchg_tail.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig                 | 15 +++++++++++++++
>  arch/riscv/include/asm/cmpxchg.h   |  4 +++-
>  arch/riscv/include/asm/hwcap.h     |  1 +
>  arch/riscv/include/asm/insn-def.h  |  5 +++++
>  arch/riscv/include/asm/processor.h | 13 +++++++++++++
>  arch/riscv/kernel/cpufeature.c     |  1 +
>  6 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e9ae6fa232c3..2c346fe169c1 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -617,6 +617,21 @@ config RISCV_ISA_ZICBOZ
>  
>  	   If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_ZICBOP
> +	bool "Zicbop extension support for cache block prefetch"
> +	depends on MMU
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	   Adds support to dynamically detect the presence of the ZICBOP
> +	   extension (Cache Block Prefetch Operations) and enable its
> +	   usage.
> +
> +	   The Zicbop extension can be used to prefetch cache block for
> +	   read/write/instruction fetch.
> +
> +	   If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZIHINTPAUSE
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 702725727671..56eff7a9d2d2 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -11,6 +11,7 @@
>  
>  #include <asm/barrier.h>
>  #include <asm/fence.h>
> +#include <asm/processor.h>
>  
>  #define __arch_xchg_masked(prepend, append, r, p, n)			\
>  ({									\
> @@ -25,6 +26,7 @@
>  									\
>  	__asm__ __volatile__ (						\
>  	       prepend							\
> +	       PREFETCHW_ASM(%5)					\
>  	       "0:	lr.w %0, %2\n"					\
>  	       "	and  %1, %0, %z4\n"				\
>  	       "	or   %1, %1, %z3\n"				\
> @@ -32,7 +34,7 @@
>  	       "	bnez %1, 0b\n"					\
>  	       append							\
>  	       : "=&r" (__retx), "=&r" (__rc), "+A" (*(__ptr32b))	\
> -	       : "rJ" (__newx), "rJ" (~__mask)				\
> +	       : "rJ" (__newx), "rJ" (~__mask), "rJ" (__ptr32b)		\
>  	       : "memory");						\
>  									\
>  	r = (__typeof__(*(p)))((__retx & __mask) >> __s);		\
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b7b58258f6c7..78b7b8b53778 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -58,6 +58,7 @@
>  #define RISCV_ISA_EXT_ZICSR		40
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
> +#define RISCV_ISA_EXT_ZICBOP		43
>  
>  #define RISCV_ISA_EXT_MAX		64
>  
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index 6960beb75f32..dc590d331894 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -134,6 +134,7 @@
>  
>  #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
>  #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
> +#define RV_OPCODE_PREFETCH	RV_OPCODE(19)
>  
>  #define HFENCE_VVMA(vaddr, asid)				\
>  	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(17),		\
> @@ -196,4 +197,8 @@
>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>  	       RS1(base), SIMM12(4))
>  
> +#define CBO_prefetchw(base)					\
> +	INSN_R(OPCODE_PREFETCH, FUNC3(6), FUNC7(0),		\
> +	       RD(x0), RS1(base), RS2(x0))
> +

I understand that here you create the instruction via bitfield, following 
the ISA, and this enables using instructions not available on the 
toolchain.

It took me some time to find the document with this instruction, so please 
add this to the commit msg:

https://github.com/riscv/riscv-CMOs/blob/master/specifications/cmobase-v1.0.pdf
Page 23.

IIUC, the instruction is "prefetch.w".

Maybe I am missing something, but in the document the rs2 field 
(PREFETCH.W) contains a 0x3, while the above looks to have a 0 instead.

rs2 field = 0x0 would be a prefetch.i (instruction prefetch) instead.

Is the above correct, or am I missing something?


Thanks!
Leo

>  #endif /* __ASM_INSN_DEF_H */
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index de9da852f78d..7ad3a24212e8 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -12,6 +12,8 @@
>  #include <vdso/processor.h>
>  
>  #include <asm/ptrace.h>
> +#include <asm/insn-def.h>
> +#include <asm/hwcap.h>
>  
>  #ifdef CONFIG_64BIT
>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> @@ -103,6 +105,17 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
>  #define KSTK_EIP(tsk)		(ulong)(task_pt_regs(tsk)->epc)
>  #define KSTK_ESP(tsk)		(ulong)(task_pt_regs(tsk)->sp)
>  
> +#define ARCH_HAS_PREFETCHW
> +#define PREFETCHW_ASM(base)	ALTERNATIVE(__nops(1), \
> +					    CBO_prefetchw(base), \
> +					    0, \
> +					    RISCV_ISA_EXT_ZICBOP, \
> +					    CONFIG_RISCV_ISA_ZICBOP)
> +static inline void prefetchw(const void *ptr)
> +{
> +	asm volatile(PREFETCHW_ASM(%0)
> +		: : "r" (ptr) : "memory");
> +}
>  
>  /* Do necessary setup to start up a newly executed thread. */
>  extern void start_thread(struct pt_regs *regs,
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index ef7b4fd9e876..e0b897db0b97 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -159,6 +159,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> +	__RISCV_ISA_EXT_DATA(zicbop, RISCV_ISA_EXT_ZICBOP),
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
>  	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> -- 
> 2.36.1
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
