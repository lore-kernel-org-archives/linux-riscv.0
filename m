Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5CDECAAA1
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Oct 2022 21:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGoiL+f539VvHEMTBsaigTptRQOI7j0qO7xuF46CdS4=; b=yNCyUrAOqhI6ch
	rmgFh4WtUK272znWGd1jGOs9o0Cp5ttSJL1DLEwqSgWjfYMb1m/1EmCXMrz+lI3QaTkoHu2uJIdJP
	OQPbEnBhvM7N3k5kFgnpV+2bosLqIubkqP/jNPN2aQzpseiR22GiWCL1JOfmVDHKiko4BbAvxMZcf
	g+urfuv0hxw51QzJzRHLQbTyubj/9pOScH0cONyJVPWIBIy1GS/vYRL+Fv5oZYnLwMGS7ysbC8wRB
	PHlCW/zxMmXGMluMM8dmCY6+76chGm8VaikY79jocTMBvzdipea6E496wldaJQHtHt87MnLCUAz9q
	yFL1ZiyRmSZmMens9jYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFXx-003Bw1-34; Sun, 30 Oct 2022 21:08:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opFXt-003BuS-BG; Sun, 30 Oct 2022 21:08:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D83E060F3C;
	Sun, 30 Oct 2022 21:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C27EC433C1;
	Sun, 30 Oct 2022 21:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667164120;
	bh=CDgNsJRngCg+xyH13yZXnrdIm0OAzHXy7/Mv9dmKRJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=krjmwkBdiPIgLj2x0qMds/YDGE2Yg79eU/3IgLbN2HMCCHAL5+t6i9BslVRzihMev
	 9TLWsBxJVUKHA1ChQoJnWYDvzBDztc1JfhSe/bE8XWKHYyo5wjoJT1QpA05mlx5dP9
	 HcZGPiWGpOshsatnlUqr2z9xO2wISf9SNgNa2wKOkgsF81rOJxLnnAV5JFfHZjCt3I
	 hkkDj/xu/Tq1P6ND81VG3zptEa4AlIrPTsLBmq+OGN727Fc1GAKxi4w3qjHDaO33Hy
	 CFSs4HivPx+TwVls1vmMs4s7yg3rDk50IJ5OBGJBE3ZwDjq3gnTdqFOMB2LgcoIQi9
	 bLtmvMD2EA1dA==
Date: Sun, 30 Oct 2022 21:08:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 3/9] RISC-V: insn-def: Define cbo.zero
Message-ID: <Y17n0xRqGPihGkRJ@spud>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
 <20221027130247.31634-4-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221027130247.31634-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_140841_490374_625E7807 
X-CRM114-Status: GOOD (  20.85  )
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

On Thu, Oct 27, 2022 at 03:02:41PM +0200, Andrew Jones wrote:
> CBO instructions use the I-type of instruction format where
> the immediate is used to identify the CBO instruction type.
> Add I-type instruction encoding support to insn-def and also
> add cbo.zero.

Cool, I like this a lot more than putting cc-option & linker version
number checks into Kbuild stuff. I guess if this gets applied, I'll
send one ripping my checks in Kconfig out and replace it with one of
these?

I mostly just cross-checked the numbers etc here and things look grand.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

One minor comment below.

> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/insn-def.h | 50 +++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index 16044affa57c..f13054716556 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -12,6 +12,12 @@
>  #define INSN_R_RD_SHIFT			 7
>  #define INSN_R_OPCODE_SHIFT		 0
>  
> +#define INSN_I_SIMM12_SHIFT		20
> +#define INSN_I_RS1_SHIFT		15
> +#define INSN_I_FUNC3_SHIFT		12
> +#define INSN_I_RD_SHIFT			 7
> +#define INSN_I_OPCODE_SHIFT		 0
> +
>  #ifdef __ASSEMBLY__
>  
>  #ifdef CONFIG_AS_HAS_INSN
> @@ -20,6 +26,10 @@
>  	.insn	r \opcode, \func3, \func7, \rd, \rs1, \rs2
>  	.endm
>  
> +	.macro insn_i, opcode, func3, rd, rs1, simm12
> +	.insn	i \opcode, \func3, \rd, \rs1, \simm12
> +	.endm
> +
>  #else
>  
>  #include <asm/gpr-num.h>
> @@ -33,9 +43,18 @@
>  		 (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
>  	.endm
>  
> +	.macro insn_i, opcode, func3, rd, rs1, simm12
> +	.4byte	((\opcode << INSN_I_OPCODE_SHIFT) |		\
> +		 (\func3 << INSN_I_FUNC3_SHIFT) |		\
> +		 (.L__gpr_num_\rd << INSN_I_RD_SHIFT) |		\
> +		 (.L__gpr_num_\rs1 << INSN_I_RS1_SHIFT) |	\
> +		 (\simm12 << INSN_I_SIMM12_SHIFT))
> +	.endm
> +
>  #endif
>  
>  #define __INSN_R(...)	insn_r __VA_ARGS__
> +#define __INSN_I(...)	insn_i __VA_ARGS__
>  
>  #else /* ! __ASSEMBLY__ */
>  
> @@ -44,6 +63,9 @@
>  #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)	\
>  	".insn	r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n"
>  
> +#define __INSN_I(opcode, func3, rd, rs1, simm12)	\
> +	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
> +
>  #else
>  
>  #include <linux/stringify.h>
> @@ -60,14 +82,32 @@
>  "		 (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) "))\n" \
>  "	.endm\n"
>  
> +#define DEFINE_INSN_I							\
> +	__DEFINE_ASM_GPR_NUMS						\
> +"	.macro insn_i, opcode, func3, rd, rs1, simm12\n"		\
> +"	.4byte	((\\opcode << " __stringify(INSN_I_OPCODE_SHIFT) ") |"	\
> +"		 (\\func3 << " __stringify(INSN_I_FUNC3_SHIFT) ") |"	\
> +"		 (.L__gpr_num_\\rd << " __stringify(INSN_I_RD_SHIFT) ") |"   \
> +"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_I_RS1_SHIFT) ") |" \

It'd be nice if these macros had aligned \s. I know the file is pretty
inconsistent in that regard and I'm not asking you to change those but I
think it'd be nice to do so for stuff that's just being added now.

Thanks,
Conor.

> +"		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
> +"	.endm\n"
> +
>  #define UNDEFINE_INSN_R							\
>  "	.purgem insn_r\n"
>  
> +#define UNDEFINE_INSN_I							\
> +"	.purgem insn_i\n"
> +
>  #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
>  	DEFINE_INSN_R							\
>  	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
>  	UNDEFINE_INSN_R
>  
> +#define __INSN_I(opcode, func3, rd, rs1, simm12)			\
> +	DEFINE_INSN_I							\
> +	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
> +	UNDEFINE_INSN_I
> +
>  #endif
>  
>  #endif /* ! __ASSEMBLY__ */
> @@ -76,9 +116,14 @@
>  	__INSN_R(RV_##opcode, RV_##func3, RV_##func7,		\
>  		 RV_##rd, RV_##rs1, RV_##rs2)
>  
> +#define INSN_I(opcode, func3, rd, rs1, simm12)			\
> +	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
> +		 RV_##rs1, RV_##simm12)
> +
>  #define RV_OPCODE(v)		__ASM_STR(v)
>  #define RV_FUNC3(v)		__ASM_STR(v)
>  #define RV_FUNC7(v)		__ASM_STR(v)
> +#define RV_SIMM12(v)		__ASM_STR(v)
>  #define RV_RD(v)		__ASM_STR(v)
>  #define RV_RS1(v)		__ASM_STR(v)
>  #define RV_RS2(v)		__ASM_STR(v)
> @@ -87,6 +132,7 @@
>  #define RV___RS1(v)		__RV_REG(v)
>  #define RV___RS2(v)		__RV_REG(v)
>  
> +#define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
>  #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
>  
>  #define HFENCE_VVMA(vaddr, asid)				\
> @@ -134,4 +180,8 @@
>  	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(51),		\
>  	       __RD(0), RS1(gaddr), RS2(vmid))
>  
> +#define CBO_ZERO(base)						\
> +	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
> +	       RS1(base), SIMM12(4))
> +
>  #endif /* __ASM_INSN_DEF_H */
> -- 
> 2.37.3
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
