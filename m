Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD40C6FA86
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAQpF6PYkmI08tcsUfzYtxvRMZhRyHZLwWmv8r+kumM=; b=fs2owUUHEo+nNA
	BuELG6Uh0dskcunsAAOTgPSSP8zXCIUtM3DxaaRhdD46ZOM1ocYLLImKb5vI9n2dpIyxfn/VKcWH7
	mlnPaNmDVSutFINx4cldlpgL0If6CZvWvC1sQFg2KNXMQlDjaI75NSVpY/kBcfXs7yRaczp6kZqNa
	StjMNzqCpZeiUZtgk2LqFPz0XJzYURHmDuNWPYwKGS39HUCDfOetQzExCwpcQ34TQlT8gb/LMfRlN
	jwIpC1VARfQQWU2nRPC7S1HFxd5fvs8sCzvvMutiuu0bGdLiI6jLEFD6FeHgQQ/hCXSnTS7HC9XlE
	FtFZxBAG1z6EYd1K/Cuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJq7-005R9D-3Q; Thu, 08 Sep 2022 15:53:15 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWJmo-005P67-KW; Thu, 08 Sep 2022 15:49:54 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oWJmj-0006hF-KI; Thu, 08 Sep 2022 17:49:45 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, anup@brainfault.org, mchitale@ventanamicro.com
Subject: Re: [PATCH v2 2/4] riscv: Introduce support for defining instructions
Date: Thu, 08 Sep 2022 17:49:44 +0200
Message-ID: <3006889.o7ts2hSHzF@diego>
In-Reply-To: <20220831172500.752195-3-ajones@ventanamicro.com>
References: <20220831172500.752195-1-ajones@ventanamicro.com> <20220831172500.752195-3-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_084950_735903_A3A40F74 
X-CRM114-Status: GOOD (  24.54  )
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

Am Mittwoch, 31. August 2022, 19:24:58 CEST schrieb Andrew Jones:
> When compiling with toolchains that haven't yet been taught about
> new instructions we need to encode them ourselves. Create a new file
> where support for instruction definitions will evolve. We initiate
> the file with a macro called INSN_R(), which implements the R-type
> instruction encoding. INSN_R() will use the assembler's .insn
> directive when available, which should give the assembler a chance
> to do some validation. When .insn is not available we fall back to
> manual encoding.
> 
> Not only should using instruction encoding macros improve readability
> and maintainability of code over the alternative of inserting
> instructions directly (e.g. '.word 0xc0de'), but we should also gain
> potential for more optimized code after compilation because the
> compiler will have control over the input and output registers used.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  arch/riscv/Kconfig                |  3 ++
>  arch/riscv/include/asm/insn-def.h | 86 +++++++++++++++++++++++++++++++
>  2 files changed, 89 insertions(+)
>  create mode 100644 arch/riscv/include/asm/insn-def.h
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index ed66c31e4655..f8f3b316b838 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -227,6 +227,9 @@ config RISCV_DMA_NONCOHERENT
>  	select ARCH_HAS_SETUP_DMA_OPS
>  	select DMA_DIRECT_REMAP
>  
> +config AS_HAS_INSN
> +	def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma) t0$(comma) t0$(comma) zero)
> +
>  source "arch/riscv/Kconfig.socs"
>  source "arch/riscv/Kconfig.erratas"
>  
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> new file mode 100644
> index 000000000000..2dcd1d4781bf
> --- /dev/null
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -0,0 +1,86 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +#ifndef __ASM_INSN_DEF_H
> +#define __ASM_INSN_DEF_H
> +
> +#include <asm/asm.h>
> +
> +#define INSN_R_FUNC7_SHIFT		25
> +#define INSN_R_RS2_SHIFT		20
> +#define INSN_R_RS1_SHIFT		15
> +#define INSN_R_FUNC3_SHIFT		12
> +#define INSN_R_RD_SHIFT			 7
> +#define INSN_R_OPCODE_SHIFT		 0
> +
> +#ifdef __ASSEMBLY__
> +
> +#ifdef CONFIG_AS_HAS_INSN
> +
> +	.macro insn_r, opcode, func3, func7, rd, rs1, rs2
> +	.insn	r \opcode, \func3, \func7, \rd, \rs1, \rs2
> +	.endm
> +
> +#else
> +
> +#include <asm/gpr-num.h>
> +
> +	.macro insn_r, opcode, func3, func7, rd, rs1, rs2
> +	.4byte	((\opcode << INSN_R_OPCODE_SHIFT) |		\
> +		 (\func3 << INSN_R_FUNC3_SHIFT) |		\
> +		 (\func7 << INSN_R_FUNC7_SHIFT) |		\
> +		 (.L__gpr_num_\rd << INSN_R_RD_SHIFT) |		\
> +		 (.L__gpr_num_\rs1 << INSN_R_RS1_SHIFT) |	\
> +		 (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
> +	.endm
> +
> +#endif
> +
> +#define INSN_R(...)	insn_r __VA_ARGS__
> +
> +#else /* ! __ASSEMBLY__ */
> +
> +#ifdef CONFIG_AS_HAS_INSN
> +
> +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)	\
> +	".insn	r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n"
> +
> +#else
> +
> +#include <linux/stringify.h>
> +#include <asm/gpr-num.h>
> +
> +#define DEFINE_INSN_R							\
> +	__DEFINE_ASM_GPR_NUMS						\
> +"	.macro insn_r, opcode, func3, func7, rd, rs1, rs2\n"		\
> +"	.4byte	((\\opcode << " __stringify(INSN_R_OPCODE_SHIFT) ") |"	\
> +"		 (\\func3 << " __stringify(INSN_R_FUNC3_SHIFT) ") |"	\
> +"		 (\\func7 << " __stringify(INSN_R_FUNC7_SHIFT) ") |"	\
> +"		 (.L__gpr_num_\\rd << " __stringify(INSN_R_RD_SHIFT) ") |"    \
> +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_R_RS1_SHIFT) ") |"  \
> +"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) "))\n" \
> +"	.endm\n"
> +
> +#define UNDEFINE_INSN_R							\
> +"	.purgem insn_r\n"
> +
> +#define INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
> +	DEFINE_INSN_R							\
> +	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
> +	UNDEFINE_INSN_R
> +
> +#endif
> +
> +#endif /* ! __ASSEMBLY__ */
> +
> +#define OPCODE(v)	__ASM_STR(v)
> +#define FUNC3(v)	__ASM_STR(v)
> +#define FUNC7(v)	__ASM_STR(v)
> +#define RD(v)		__ASM_STR(v)
> +#define RS1(v)		__ASM_STR(v)
> +#define RS2(v)		__ASM_STR(v)

you might want some sort of prefix here
	RISCV_RS1(v) ?

While trying to adapt this for the cmo stuff I ran into the issue
of bpf complaining that "IMM" is already defined there.

And names above are generic enough that these also
might conflict with other stuff.




> +#define __REG(v)	__ASM_STR(x ## v)
> +#define __RD(v)		__REG(v)
> +#define __RS1(v)	__REG(v)
> +#define __RS2(v)	__REG(v)
> +
> +#endif /* __ASM_INSN_DEF_H */
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
