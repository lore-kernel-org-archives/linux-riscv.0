Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478F5C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 18:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHFghdm7ItZMxESC93X7OCaQ0BCthoKPRVPccVEcMgQ=; b=D3vO2YCIKYS4g9
	Yjj3DC3UZq1npr2Kzl47qAzP9SjoML7x8dkwfn7ZH1z4ifiovyt55LZmLOmuuDy/I8O5QEsvdsY6i
	kIIJ1/xU5y4D6XXVL6XRrgcR1WN3c/IPwDcQQB1nHqAGlLvij3pOAGxknFlEHf5+MhAWsCaF1J6aq
	iShTew1H5oWAX+jEBJbFBUM349wCJ3CNTXwI5Hp+opS6Q6QezACkS50sa5N7DmzKdPNhbeuxKUok6
	mGBc/h+tz+0Q03b8dDE3UM1HiHs/PlMFugmZUqrGH8FsTlvnF8o1wtzvfNTu2szO72d7JaW1h4iEA
	cA9AxRL+ohAx9D5Swz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL6Lo-00BqEJ-2J;
	Wed, 03 Jan 2024 18:52:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL6Ll-00BqDX-2T
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 18:52:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704307940;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+deU6nLc+LcvM7HNh2qjt6eus+hmUjEZj9BMXEhc3O4=;
	b=brjvgsAu2tSDKcQcFUrijiitzSFmRLBjH7MXQkZUaDoar0/Zm7TUzeAQfQ7arXR6sWLElo
	HOuCdNqjCqtLMYCOc9gjhyCPQ7tSzD7AJ6DqFn7+tejH93fR5ty0cN5eXRBnXVD/dTkp3R
	Y8bl7ZAEURMQFE5IDtBozia5685waGA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-urUFuUEQNpiEQASpaZh9XQ-1; Wed, 03 Jan 2024 13:52:19 -0500
X-MC-Unique: urUFuUEQNpiEQASpaZh9XQ-1
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-1d4b03b7aedso12436715ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 10:52:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704307935; x=1704912735;
        h=content-transfer-encoding:content-disposition:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+deU6nLc+LcvM7HNh2qjt6eus+hmUjEZj9BMXEhc3O4=;
        b=AfCdGq0i5bs7LcFu3Z4LvSReFiKURPWJ6kLKS7M/eDYEIJTExyif7Nws68oYH4uWue
         L6UHz4ZE7+AgkfBr4Z70pBxLD+KCigCV/o2tKl93kIbM+V0NBEXTDygKruLdMDLK7Cpu
         hUq7myVlwXLS6PXymzi1dTzVCa33xtZbN5tUH6XjyM/ZuhBE47LtROW3lVBbnLAafnxo
         W1zZnE2iu7hawYUv+mPQJUE9tAtEB93pcaVMK0gtkmE2mFVgWZk4Y+Ws9dTD75TrA/KE
         8OKJJoXKPqdmhxjXLEH5FmIvfhqhSn8a07cvnB54738Kku3OFHSl/IYVQQK5fgL5wlkM
         yN1g==
X-Gm-Message-State: AOJu0YxOJv1KY4HhOZ+bnKGpZcoL7z0MMe/28gpMk+Hou5PuBO9SwYCM
	LQJechrcv3Y2LjSsquxg1YDD2dNh089ySNoEnQKtHWHEtEMzXMCf4IJkWpVEtoR2ZQKavLq8gkN
	3U2M7Wa7M4GBe+diYKllJBLCVi5jxVsZ1ez/B
X-Received: by 2002:a17:902:c40d:b0:1d4:a8f2:40fc with SMTP id k13-20020a170902c40d00b001d4a8f240fcmr3810473plk.45.1704307934830;
        Wed, 03 Jan 2024 10:52:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFld9fqxbeM4JulnYE7bGd4x+azw1/t2DEqJEWqoD03h8J2JGk1gUa0QVMLimK27lhvQ+pEtg==
X-Received: by 2002:a17:902:c40d:b0:1d4:a8f2:40fc with SMTP id k13-20020a170902c40d00b001d4a8f240fcmr3810439plk.45.1704307933163;
        Wed, 03 Jan 2024 10:52:13 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id v24-20020a17090331d800b001d4cac52e73sm3090464ple.131.2024.01.03.10.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 10:52:12 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: guoren@kernel.org
Subject: Re: [PATCH V2 1/3] riscv: Add Zicbop instruction definitions & cpufeature
Date: Wed,  3 Jan 2024 15:52:00 -0300
Message-ID: <ZZWs0C19tz763FnH@LeoBras>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231231082955.16516-2-guoren@kernel.org>
References: <20231231082955.16516-1-guoren@kernel.org> <20231231082955.16516-2-guoren@kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_105221_878906_62548EBA 
X-CRM114-Status: GOOD (  36.13  )
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
Cc: wefu@redhat.com, keescook@chromium.org, ajones@ventanamicro.com, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, Leonardo Bras <leobras@redhat.com>, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
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

Hi Guo Ren,

Here it would be nice to point a documentation for ZICBOP extension:
https://wiki.riscv.org/display/HOME/Recently+Ratified+Extensions

or having a nice link for:
https://drive.google.com/file/d/1jfzhNAk7viz4t2FLDZ5z4roA0LBggkfZ/view

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
> +	  read/write fetch.
> +
> +	  If you don't know what to do here, say Y.
> +

According to doc:
"The Zicbop extension defines a set of cache-block prefetch instructions: 
PREFETCH.R, PREFETCH.W, and PREFETCH.I"

So above text seems ok


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

Is this number just in kernel code, or does it mean something in the RISC-V 
documentation?

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

The shifts seem correct for S-Type, but I would name the IMM defines in a 
way we could understand where they fit in IMM:


INSN_S_SIMM5_SHIFT -> INSN_S_SIMM_0_4_SHIFT
INSN_S_SIMM7_SHIFT -> INSN_S_SIMM_5_11_SHIFT

What do you think?


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

As a curiosity: It's quite odd to have prefetch.{i,r,w} to be an S-Type 
instruction, given this type was supposed to be for store instructions.

On prefetch.{i,r,w}:
31	   24   	 19    14    11	  	6
imm[11:5] | PREFETCH_OP | rs1 | ORI | imm[4:0] | OP_IMM

For S-Type, we have:
31	   24     19    14       11	    6
imm[11:5] | rs1  | rs2 | funct3 | imm[4:0] | opcode

For I-Type, we have:
31	    19    14       11	6
immm[11:0] | rs1 | funct3 | rd | opcode

I understand that there should be reasons for choosing S-type, but it 
would make much more sense (as per instruction type, and as per parameters)
to go with I-Type. 

(I understand this was done in HW, and in kernel code we have better choice 
to encode it as S-Type, but I kind of find the S-Type choice odd)

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

The defines above seem correct, but TBH I am not very used to review
.macro code.

>  #define RV_OPCODE(v)		__ASM_STR(v)
>  #define RV_FUNC3(v)		__ASM_STR(v)
>  #define RV_FUNC7(v)		__ASM_STR(v)
> @@ -133,6 +180,7 @@
>  #define RV___RS2(v)		__RV_REG(v)
>  
>  #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
> +#define RV_OPCODE_OP_IMM	RV_OPCODE(19)

Correct.


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
> +

For OP_IMM & FUNC3(6) we have ORI, right?
For ORI, rd will be at bytes 11:7, which in PREFETCH.{i,r,w} is
offset[4:0].

IIUC, when the cpu does not support ZICBOP, this should be fine as long as 
rd = 0, since changes to r0 are disregarded.

In this case, we need to guarantee offset[4:0] = 0, or else we migth write 
on an unrelated register. This can be noticed in ZICBOP documentation pages 
21, 22, 23, as offset[4:0] is always [0 0 0 0 0]. 
(Google docs in first comment)

What we need here is something like:
+ enum {
+ 	PREFETCH_I,
+ 	PREFETCH_R,
+ 	PREFETCH_W,
+ }	 
+
+ #define CBO_PREFETCH(type, base, offset)                      \
+     INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(type),              \
+            SIMM12(offset & ~0x1f), RS1(base))

+ #define CBO_PREFETCH_I(base, offset)				\
+     CBO_PREFETCH(PREFETCH_I, base, offset)
+
+ #define CBO_PREFETCH_R(base, offset)				\
+     CBO_PREFETCH(PREFETCH_R, base, offset)
+
+ #define CBO_PREFETCH_W(base, offset)				\
+     CBO_PREFETCH(PREFETCH_W, base, offset)
+

Maybe replacing 0x1f by some MASK macro, so it looks nicer.
(not sure how it's acceptable in asm, though).

The above would guarantee that we would never have CBO_PREFETCH_*() to mess 
up any other register due to a unnoticed (base & 0x1f) != 0

Does that make sense?

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
>  	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
>  	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
>  	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> -- 
> 2.40.1
> 

Apart from above suggestions, seems a nice change :)

I suggest splitting this patch into 2, though:
- Introducing S-Type instructions (plz point docs for reference) 
- Introduce ZICBOP extension.

Thanks!
Leo



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
