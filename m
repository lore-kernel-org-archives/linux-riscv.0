Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5042C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 10:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7O/GdBII510Re7cCZOVe0+xLt+skEi5qsbzxYsiyzN4=; b=L3R+c6RbEHYk75
	fQUj00RS4oLVC4pqegaCc2JW43dCJEx5ncg38xyhmcvT+3SiagxjFuojeP/LE6yDoVs8FOVftsEfl
	8e/EvQZavau8QqpnkT6N+e/UaDy9iL/v0KyP46ed4PCLxx4Zr7Nlw/uJQKSEeoEWrOqQb5a8+mxEw
	yg+5IFAHVqbh9oHA/z88fxGxxPRQ2SSHoaMfj8Qazclzya9P9J3x6ldv3Jmj+la0euke9ci2TagQg
	5yJ4X8jxdBN3xGOaU3miQd2i4uGOSZhouWqT8polV6APV8eN31PV4tcx4r3QkaRH4rtP/zf0u4kaI
	oDo9nYaq1SHIFeypGEgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKc4v-007bPo-34;
	Tue, 02 Jan 2024 10:32:57 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKc4q-007bML-0m
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 10:32:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a2830574764so74998066b.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 02:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704191566; x=1704796366; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G+7moNHT/OR4dO2qTIN/UmqI4y92lVkHCwR4Iet1xro=;
        b=axBmREOhz38WWNu4bCmHhI+u4cNrl8wbd3Jq9ehBC8LVIWjW7D3OR5FfDGtv1aPCqW
         oTH/BkFyB6CUj6D2QDFy5lJrDb09wdtjHtjrQXKGiLtXN5FYs9KbPDsUbD4qNis7TciB
         GSmohPXm7TFhTTn0jbfAFLuCWQeAWmyl6y8eygNlsphSsMK5QR9zFvU8PqmdyE+b1T8P
         mdyqvXbsMUDGlxxL59L+oI5IVRr7uv4q3cInVpg7KDZidX42u3kv41J1zLFbxLN6QuSn
         sjLuianRoUsPgrH1J1bjLcX781USxGauw5fkAMv4tALIWN7n05Mi5ig+NVdaQzJQBA/G
         W8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704191566; x=1704796366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+7moNHT/OR4dO2qTIN/UmqI4y92lVkHCwR4Iet1xro=;
        b=RUTMYcYcWM+WGX8ThsT1lS8LrhIq8LxSELWqsOxRjr2h8ewNZt/MhFeYtFVRdiM9m+
         r8bavxZlVbPr2zIKs1Je4aDGvLg7mPvCPmgKsU1gHfRuj+3rdZdBLRxTJFTgX8/ccoFE
         mbPG6D7gI58PLMwi39vfJ4SjauzuFMcamD72xzchdM3jCl0idb3dpqFTnAzASYcmXS+e
         D0GBPK3pFz0Z70cfJ+o0vWh7B9QaW7vmpiauh/W4Vvo5Z5nmUzMlDD96ia1ZrILVd3OM
         tbKzqz9LD1QR8kImMMfNjWms7fPqv1mRG4oUARPZ2mLE0JU25N/O1Z55YXKiyzfKXPcK
         FqKQ==
X-Gm-Message-State: AOJu0Yw7Ckmq62h4D3QLLMxx3MdswHmmUVYVTfen72tfsYBRB3fJnPmn
	nNptH4huTLnR9cZvFjpx4au1Us12RW+2Wg==
X-Google-Smtp-Source: AGHT+IEtbbo3Y4eGqAi+tt7jMzv/FB7oFX6ON5NL7+kP5V4R1nwFSNRLvIkCvtNjXWYeta53DswsnA==
X-Received: by 2002:a17:906:6891:b0:a28:2084:edec with SMTP id n17-20020a170906689100b00a282084edecmr840102ejr.126.1704191566243;
        Tue, 02 Jan 2024 02:32:46 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ka24-20020a170907921800b00a26abf393d0sm11066460ejb.138.2024.01.02.02.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 02:32:45 -0800 (PST)
Date: Tue, 2 Jan 2024 11:32:44 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Subject: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions &
 cpufeature
Message-ID: <20240102-4f12393de3c6313650a24c17@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-2-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231231082955.16516-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_023252_283704_97776293 
X-CRM114-Status: GOOD (  24.94  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 31, 2023 at 03:29:51AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Cache-block prefetch instructions are HINTs to the hardware to
> indicate that software intends to perform a particular type of
> memory access in the near future. This patch adds prefetch.i,
> prefetch.r and prefetch.w instruction definitions by
> RISCV_ISA_EXT_ZICBOP cpufeature.

It also adds S-type instruction encoding support which isn't mentioned.
Actually, it'd probably be best to put the new instruction encoding in
its own separate patch.

> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/Kconfig                | 15 ++++++++
>  arch/riscv/include/asm/hwcap.h    |  1 +
>  arch/riscv/include/asm/insn-def.h | 60 +++++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c    |  1 +
>  4 files changed, 77 insertions(+)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 24c1799e2ec4..fcbd417d65ea 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -579,6 +579,21 @@ config RISCV_ISA_ZICBOZ
>  
>  	   If you don't know what to do here, say Y.
>  
> +config RISCV_ISA_ZICBOP
> +	bool "Zicbop extension support for cache block prefetch"
> +	depends on MMU
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	  Adds support to dynamically detect the presence of the ZICBOP
> +	  extension (Cache Block Prefetch Operations) and enable its
> +	  usage.
> +
> +	  The Zicbop extension can be used to prefetch cache block for

blocks

> +	  read/write fetch.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_HAS_ZIHINTPAUSE
>  	bool
>  	default y
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 06d30526ef3b..77d3b6ee25ab 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -57,6 +57,7 @@
>  #define RISCV_ISA_EXT_ZIHPM		42
>  #define RISCV_ISA_EXT_SMSTATEEN		43
>  #define RISCV_ISA_EXT_ZICOND		44
> +#define RISCV_ISA_EXT_ZICBOP		45
>  
>  #define RISCV_ISA_EXT_MAX		64
>  
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index e27179b26086..bbda350a63bf 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -18,6 +18,13 @@
>  #define INSN_I_RD_SHIFT			 7
>  #define INSN_I_OPCODE_SHIFT		 0
>  
> +#define INSN_S_SIMM7_SHIFT		25
> +#define INSN_S_RS2_SHIFT		20
> +#define INSN_S_RS1_SHIFT		15
> +#define INSN_S_FUNC3_SHIFT		12
> +#define INSN_S_SIMM5_SHIFT		 7
> +#define INSN_S_OPCODE_SHIFT		 0
> +
>  #ifdef __ASSEMBLY__
>  
>  #ifdef CONFIG_AS_HAS_INSN
> @@ -30,6 +37,10 @@
>  	.insn	i \opcode, \func3, \rd, \rs1, \simm12
>  	.endm
>  
> +	.macro insn_s, opcode, func3, rs2, simm12, rs1
> +	.insn	s \opcode, \func3, \rs2, \simm12(\rs1)
> +	.endm
> +
>  #else
>  
>  #include <asm/gpr-num.h>
> @@ -51,10 +62,20 @@
>  		 (\simm12 << INSN_I_SIMM12_SHIFT))
>  	.endm
>  
> +	.macro insn_s, opcode, func3, rs2, simm12, rs1
> +	.4byte	((\opcode << INSN_S_OPCODE_SHIFT) |		\
> +		 (\func3 << INSN_S_FUNC3_SHIFT) |		\
> +		 (.L__gpr_num_\rs2 << INSN_S_RS2_SHIFT) |	\
> +		 (.L__gpr_num_\rs1 << INSN_S_RS1_SHIFT) |	\
> +		 ((\simm12 & 0x1f) << INSN_S_SIMM5_SHIFT) |	\
> +		 (((\simm12 >> 5) & 0x7f) << INSN_S_SIMM7_SHIFT))
> +	.endm
> +
>  #endif
>  
>  #define __INSN_R(...)	insn_r __VA_ARGS__
>  #define __INSN_I(...)	insn_i __VA_ARGS__
> +#define __INSN_S(...)	insn_s __VA_ARGS__
>  
>  #else /* ! __ASSEMBLY__ */
>  
> @@ -66,6 +87,9 @@
>  #define __INSN_I(opcode, func3, rd, rs1, simm12)	\
>  	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
>  
> +#define __INSN_S(opcode, func3, rs2, simm12, rs1)	\
> +	".insn	s " opcode ", " func3 ", " rs2 ", " simm12 "(" rs1 ")\n"
> +
>  #else
>  
>  #include <linux/stringify.h>
> @@ -92,12 +116,26 @@
>  "		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
>  "	.endm\n"
>  
> +#define DEFINE_INSN_S							\
> +	__DEFINE_ASM_GPR_NUMS						\
> +"	.macro insn_s, opcode, func3, rs2, simm12, rs1\n"		\
> +"	.4byte	((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"	\
> +"		 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"	\
> +"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
> +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
> +"		 ((\\simm12 & 0x1f) << " __stringify(INSN_S_SIMM5_SHIFT) ") |" \
> +"		 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
> +"	.endm\n"
> +
>  #define UNDEFINE_INSN_R							\
>  "	.purgem insn_r\n"
>  
>  #define UNDEFINE_INSN_I							\
>  "	.purgem insn_i\n"
>  
> +#define UNDEFINE_INSN_S							\
> +"	.purgem insn_s\n"
> +
>  #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
>  	DEFINE_INSN_R							\
>  	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
> @@ -108,6 +146,11 @@
>  	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
>  	UNDEFINE_INSN_I
>  
> +#define __INSN_S(opcode, func3, rs2, simm12, rs1)			\
> +	DEFINE_INSN_S							\
> +	"insn_s " opcode ", " func3 ", " rs2 ", " simm12 ", " rs1 "\n"	\
> +	UNDEFINE_INSN_S
> +
>  #endif
>  
>  #endif /* ! __ASSEMBLY__ */
> @@ -120,6 +163,10 @@
>  	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
>  		 RV_##rs1, RV_##simm12)
>  
> +#define INSN_S(opcode, func3, rs2, simm12, rs1)			\
> +	__INSN_S(RV_##opcode, RV_##func3, RV_##rs2,		\
> +		 RV_##simm12, RV_##rs1)
> +
>  #define RV_OPCODE(v)		__ASM_STR(v)
>  #define RV_FUNC3(v)		__ASM_STR(v)
>  #define RV_FUNC7(v)		__ASM_STR(v)
> @@ -133,6 +180,7 @@
>  #define RV___RS2(v)		__RV_REG(v)
>  
>  #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
> +#define RV_OPCODE_OP_IMM	RV_OPCODE(19)
>  #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
>  
>  #define HFENCE_VVMA(vaddr, asid)				\
> @@ -196,4 +244,16 @@
>  	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
>  	       RS1(base), SIMM12(4))
>  
> +#define CBO_PREFETCH_I(base, offset)				\
> +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
> +	       SIMM12(offset), RS1(base))
> +
> +#define CBO_PREFETCH_R(base, offset)				\
> +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
> +	       SIMM12(offset), RS1(base))
> +
> +#define CBO_PREFETCH_W(base, offset)				\
> +	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
> +	       SIMM12(offset), RS1(base))

Shouldn't we ensure the lower 5-bits of offset are zero by masking it?

> +
>  #endif /* __ASM_INSN_DEF_H */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index b3785ffc1570..bdb02b066041 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -168,6 +168,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> +	__RISCV_ISA_EXT_DATA(zicbop, RISCV_ISA_EXT_ZICBOP),

zicbop should be above zicboz (alphabetical)

>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> -- 
> 2.40.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
