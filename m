Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E4DC4321E
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 22:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5oJtpIdrhoISxtJOfCZaPP4/WR/rQ916PvjWRlpxeUQ=; b=YZ8LVfRAtHm3fB
	4LS/Rc1kScXlD3wUcDCPfkXyoGsmCU1Rg5JjwfwP9g9s4q6xssDoabXp+cutBJCyPz5OzW0ddfFnZ
	PJb+vMi1z7LJ/3+ZmNIjR5VL2RYVGY9ofq8vdvwWEMX+xIlIcLOZtPayamFm808pYwi9qoTCsAUro
	JCo0RX7XYfiR+0c9n0IkA6iXio64sjI/y0QIrQQla/Zsco1xK41eFnwMpl+U1MDetAOAT36obiBbW
	2k24TFDLHSwJ4qbiN9/X3y/ae2PsmXyx4pa/doeRYb5oe9TjQuAG0zcH4wo76ZHstNtTqqFHnYZwZ
	w8QnWbU+WKxRSXtV5+Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08xT-00BXP0-HV; Tue, 29 Nov 2022 22:20:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p08xQ-00BXNi-7f
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 22:20:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7E126193C;
	Tue, 29 Nov 2022 22:20:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C62C433C1;
	Tue, 29 Nov 2022 22:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669760402;
	bh=b84cGFeP5KmPpSHQot8kF/ldRt/pq5MY8qOSH+2K6i4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k5YW6QSQY+jd3qlBhNF1KlZ4dVGJzvDSRV9o0QRjHOlgKnfjDBA9DiJn7p4aK9Df4
	 RdsFIypiEWvOA1tmUn5PM8AoD5Obje7Wo08OtIPmpNcKPnKc1mjdZ9OEw5hidWob6I
	 Kym1OrF6Pe1M575UzRci5pBdRZIlpgovDH3GQyJ28aJW/BSGBwcC/02NL9yiv06mOu
	 eohwixZ2zeJcLnnkhY35cRPpUKRaWScyX/Qr9O38wlJPUWQEBVwgSVuxyZ2QTAR7zV
	 K+xV0V568rMKhGSun5v5GOZ/PIRSfkH+DjMTeVQhR1SMSrIjbLY0fWeBT3i/eqnPrS
	 YcfVMuosbZzjA==
Date: Tue, 29 Nov 2022 22:19:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 01/13] RISC-V: add prefix to all constants/macros in
 parse_asm.h
Message-ID: <Y4aFjRTZKGq8EnfD@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_142004_384049_B845E0E4 
X-CRM114-Status: GOOD (  27.13  )
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

On Mon, Nov 28, 2022 at 11:26:20AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Some of the constants and macros already have suitable
> RV_, RVG_ or RVC_ prefixes.
> 
> Extend this to the rest of the file as well, as we want
> to use these things in a broader scope soon.

What's up with the "weird" 57 character lines here?
Either way, I hate these sort of diffs and my brain just switches off
while trying to read them. Perhaps there's a way to make git spit these
out that shows
-
+
-
+
rather than
-
-
+
+
and I could be more confident, but it seems okay to me...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 194 ++++++++++++++---------------
>  arch/riscv/kernel/kgdb.c           |  12 +-
>  2 files changed, 103 insertions(+), 103 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
> index f36368de839f..c52b8ae02cfe 100644
> --- a/arch/riscv/include/asm/parse_asm.h
> +++ b/arch/riscv/include/asm/parse_asm.h
> @@ -6,37 +6,37 @@
>  #include <linux/bits.h>
>  
>  /* The bit field of immediate value in I-type instruction */
> -#define I_IMM_SIGN_OPOFF	31
> -#define I_IMM_11_0_OPOFF	20
> -#define I_IMM_SIGN_OFF		12
> -#define I_IMM_11_0_OFF		0
> -#define I_IMM_11_0_MASK		GENMASK(11, 0)
> +#define RV_I_IMM_SIGN_OPOFF	31
> +#define RV_I_IMM_11_0_OPOFF	20
> +#define RV_I_IMM_SIGN_OFF	12
> +#define RV_I_IMM_11_0_OFF	0
> +#define RV_I_IMM_11_0_MASK	GENMASK(11, 0)
>  
>  /* The bit field of immediate value in J-type instruction */
> -#define J_IMM_SIGN_OPOFF	31
> -#define J_IMM_10_1_OPOFF	21
> -#define J_IMM_11_OPOFF		20
> -#define J_IMM_19_12_OPOFF	12
> -#define J_IMM_SIGN_OFF		20
> -#define J_IMM_10_1_OFF		1
> -#define J_IMM_11_OFF		11
> -#define J_IMM_19_12_OFF		12
> -#define J_IMM_10_1_MASK		GENMASK(9, 0)
> -#define J_IMM_11_MASK		GENMASK(0, 0)
> -#define J_IMM_19_12_MASK	GENMASK(7, 0)
> +#define RV_J_IMM_SIGN_OPOFF	31
> +#define RV_J_IMM_10_1_OPOFF	21
> +#define RV_J_IMM_11_OPOFF	20
> +#define RV_J_IMM_19_12_OPOFF	12
> +#define RV_J_IMM_SIGN_OFF	20
> +#define RV_J_IMM_10_1_OFF	1
> +#define RV_J_IMM_11_OFF		11
> +#define RV_J_IMM_19_12_OFF	12
> +#define RV_J_IMM_10_1_MASK	GENMASK(9, 0)
> +#define RV_J_IMM_11_MASK	GENMASK(0, 0)
> +#define RV_J_IMM_19_12_MASK	GENMASK(7, 0)
>  
>  /* The bit field of immediate value in B-type instruction */
> -#define B_IMM_SIGN_OPOFF	31
> -#define B_IMM_10_5_OPOFF	25
> -#define B_IMM_4_1_OPOFF		8
> -#define B_IMM_11_OPOFF		7
> -#define B_IMM_SIGN_OFF		12
> -#define B_IMM_10_5_OFF		5
> -#define B_IMM_4_1_OFF		1
> -#define B_IMM_11_OFF		11
> -#define B_IMM_10_5_MASK		GENMASK(5, 0)
> -#define B_IMM_4_1_MASK		GENMASK(3, 0)
> -#define B_IMM_11_MASK		GENMASK(0, 0)
> +#define RV_B_IMM_SIGN_OPOFF	31
> +#define RV_B_IMM_10_5_OPOFF	25
> +#define RV_B_IMM_4_1_OPOFF	8
> +#define RV_B_IMM_11_OPOFF	7
> +#define RV_B_IMM_SIGN_OFF	12
> +#define RV_B_IMM_10_5_OFF	5
> +#define RV_B_IMM_4_1_OFF	1
> +#define RV_B_IMM_11_OFF		11
> +#define RV_B_IMM_10_5_MASK	GENMASK(5, 0)
> +#define RV_B_IMM_4_1_MASK	GENMASK(3, 0)
> +#define RV_B_IMM_11_MASK	GENMASK(0, 0)
>  
>  /* The register offset in RVG instruction */
>  #define RVG_RS1_OPOFF		15
> @@ -100,71 +100,71 @@
>  #define RVC_C2_RD_OPOFF		7
>  
>  /* parts of opcode for RVG*/
> -#define OPCODE_BRANCH		0x63
> -#define OPCODE_JALR		0x67
> -#define OPCODE_JAL		0x6f
> -#define OPCODE_SYSTEM		0x73
> +#define RVG_OPCODE_BRANCH	0x63
> +#define RVG_OPCODE_JALR		0x67
> +#define RVG_OPCODE_JAL		0x6f
> +#define RVG_OPCODE_SYSTEM	0x73
>  
>  /* parts of opcode for RVC*/
> -#define OPCODE_C_0		0x0
> -#define OPCODE_C_1		0x1
> -#define OPCODE_C_2		0x2
> +#define RVC_OPCODE_C0		0x0
> +#define RVC_OPCODE_C1		0x1
> +#define RVC_OPCODE_C2		0x2
>  
>  /* parts of funct3 code for I, M, A extension*/
> -#define FUNCT3_JALR		0x0
> -#define FUNCT3_BEQ		0x0
> -#define FUNCT3_BNE		0x1000
> -#define FUNCT3_BLT		0x4000
> -#define FUNCT3_BGE		0x5000
> -#define FUNCT3_BLTU		0x6000
> -#define FUNCT3_BGEU		0x7000
> +#define RVG_FUNCT3_JALR		0x0
> +#define RVG_FUNCT3_BEQ		0x0
> +#define RVG_FUNCT3_BNE		0x1000
> +#define RVG_FUNCT3_BLT		0x4000
> +#define RVG_FUNCT3_BGE		0x5000
> +#define RVG_FUNCT3_BLTU		0x6000
> +#define RVG_FUNCT3_BGEU		0x7000
>  
>  /* parts of funct3 code for C extension*/
> -#define FUNCT3_C_BEQZ		0xc000
> -#define FUNCT3_C_BNEZ		0xe000
> -#define FUNCT3_C_J		0xa000
> -#define FUNCT3_C_JAL		0x2000
> -#define FUNCT4_C_JR		0x8000
> -#define FUNCT4_C_JALR		0xf000
> -
> -#define FUNCT12_SRET		0x10200000
> -
> -#define MATCH_JALR		(FUNCT3_JALR | OPCODE_JALR)
> -#define MATCH_JAL		(OPCODE_JAL)
> -#define MATCH_BEQ		(FUNCT3_BEQ | OPCODE_BRANCH)
> -#define MATCH_BNE		(FUNCT3_BNE | OPCODE_BRANCH)
> -#define MATCH_BLT		(FUNCT3_BLT | OPCODE_BRANCH)
> -#define MATCH_BGE		(FUNCT3_BGE | OPCODE_BRANCH)
> -#define MATCH_BLTU		(FUNCT3_BLTU | OPCODE_BRANCH)
> -#define MATCH_BGEU		(FUNCT3_BGEU | OPCODE_BRANCH)
> -#define MATCH_SRET		(FUNCT12_SRET | OPCODE_SYSTEM)
> -#define MATCH_C_BEQZ		(FUNCT3_C_BEQZ | OPCODE_C_1)
> -#define MATCH_C_BNEZ		(FUNCT3_C_BNEZ | OPCODE_C_1)
> -#define MATCH_C_J		(FUNCT3_C_J | OPCODE_C_1)
> -#define MATCH_C_JAL		(FUNCT3_C_JAL | OPCODE_C_1)
> -#define MATCH_C_JR		(FUNCT4_C_JR | OPCODE_C_2)
> -#define MATCH_C_JALR		(FUNCT4_C_JALR | OPCODE_C_2)
> -
> -#define MASK_JALR		0x707f
> -#define MASK_JAL		0x7f
> -#define MASK_C_JALR		0xf07f
> -#define MASK_C_JR		0xf07f
> -#define MASK_C_JAL		0xe003
> -#define MASK_C_J		0xe003
> -#define MASK_BEQ		0x707f
> -#define MASK_BNE		0x707f
> -#define MASK_BLT		0x707f
> -#define MASK_BGE		0x707f
> -#define MASK_BLTU		0x707f
> -#define MASK_BGEU		0x707f
> -#define MASK_C_BEQZ		0xe003
> -#define MASK_C_BNEZ		0xe003
> -#define MASK_SRET		0xffffffff
> +#define RVC_FUNCT3_C_BEQZ	0xc000
> +#define RVC_FUNCT3_C_BNEZ	0xe000
> +#define RVC_FUNCT3_C_J		0xa000
> +#define RVC_FUNCT3_C_JAL	0x2000
> +#define RVC_FUNCT4_C_JR		0x8000
> +#define RVC_FUNCT4_C_JALR	0xf000
> +
> +#define RVG_FUNCT12_SRET	0x10200000
> +
> +#define RVG_MATCH_JALR		(RVG_FUNCT3_JALR | RVG_OPCODE_JALR)
> +#define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
> +#define RVG_MATCH_BEQ		(RVG_FUNCT3_BEQ | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BNE		(RVG_FUNCT3_BNE | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BLT		(RVG_FUNCT3_BLT | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BGE		(RVG_FUNCT3_BGE | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BLTU		(RVG_FUNCT3_BLTU | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BGEU		(RVG_FUNCT3_BGEU | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_SRET		(RVG_FUNCT12_SRET | RVG_OPCODE_SYSTEM)
> +#define RVC_MATCH_C_BEQZ	(RVC_FUNCT3_C_BEQZ | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_BNEZ	(RVC_FUNCT3_C_BNEZ | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_J		(RVC_FUNCT3_C_J | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_JAL		(RVC_FUNCT3_C_JAL | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_JR		(RVC_FUNCT4_C_JR | RVC_OPCODE_C2)
> +#define RVC_MATCH_C_JALR	(RVC_FUNCT4_C_JALR | RVC_OPCODE_C2)
> +
> +#define RVG_MASK_JALR		0x707f
> +#define RVG_MASK_JAL		0x7f
> +#define RVC_MASK_C_JALR		0xf07f
> +#define RVC_MASK_C_JR		0xf07f
> +#define RVC_MASK_C_JAL		0xe003
> +#define RVC_MASK_C_J		0xe003
> +#define RVG_MASK_BEQ		0x707f
> +#define RVG_MASK_BNE		0x707f
> +#define RVG_MASK_BLT		0x707f
> +#define RVG_MASK_BGE		0x707f
> +#define RVG_MASK_BLTU		0x707f
> +#define RVG_MASK_BGEU		0x707f
> +#define RVC_MASK_C_BEQZ		0xe003
> +#define RVC_MASK_C_BNEZ		0xe003
> +#define RVG_MASK_SRET		0xffffffff
>  
>  #define __INSN_LENGTH_MASK	_UL(0x3)
>  #define __INSN_LENGTH_GE_32	_UL(0x3)
>  #define __INSN_OPCODE_MASK	_UL(0x7F)
> -#define __INSN_BRANCH_OPCODE	_UL(OPCODE_BRANCH)
> +#define __INSN_BRANCH_OPCODE	_UL(RVG_OPCODE_BRANCH)
>  
>  /* Define a series of is_XXX_insn functions to check if the value INSN
>   * is an instance of instruction XXX.
> @@ -180,26 +180,26 @@ static inline bool is_ ## INSN_NAME ## _insn(long insn) \
>  #define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
>  #define RVC_X(X, s, mask) RV_X(X, s, mask)
>  
> -#define EXTRACT_JTYPE_IMM(x) \
> +#define RV_EXTRACT_JTYPE_IMM(x) \
>  	({typeof(x) x_ = (x); \
> -	(RV_X(x_, J_IMM_10_1_OPOFF, J_IMM_10_1_MASK) << J_IMM_10_1_OFF) | \
> -	(RV_X(x_, J_IMM_11_OPOFF, J_IMM_11_MASK) << J_IMM_11_OFF) | \
> -	(RV_X(x_, J_IMM_19_12_OPOFF, J_IMM_19_12_MASK) << J_IMM_19_12_OFF) | \
> -	(RV_IMM_SIGN(x_) << J_IMM_SIGN_OFF); })
> +	(RV_X(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
> +	(RV_X(x_, RV_J_IMM_11_OPOFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OFF) | \
> +	(RV_X(x_, RV_J_IMM_19_12_OPOFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OFF) | \
> +	(RV_IMM_SIGN(x_) << RV_J_IMM_SIGN_OFF); })
>  
> -#define EXTRACT_ITYPE_IMM(x) \
> +#define RV_EXTRACT_ITYPE_IMM(x) \
>  	({typeof(x) x_ = (x); \
> -	(RV_X(x_, I_IMM_11_0_OPOFF, I_IMM_11_0_MASK)) | \
> -	(RV_IMM_SIGN(x_) << I_IMM_SIGN_OFF); })
> +	(RV_X(x_, RV_I_IMM_11_0_OPOFF, RV_I_IMM_11_0_MASK)) | \
> +	(RV_IMM_SIGN(x_) << RV_I_IMM_SIGN_OFF); })
>  
> -#define EXTRACT_BTYPE_IMM(x) \
> +#define RV_EXTRACT_BTYPE_IMM(x) \
>  	({typeof(x) x_ = (x); \
> -	(RV_X(x_, B_IMM_4_1_OPOFF, B_IMM_4_1_MASK) << B_IMM_4_1_OFF) | \
> -	(RV_X(x_, B_IMM_10_5_OPOFF, B_IMM_10_5_MASK) << B_IMM_10_5_OFF) | \
> -	(RV_X(x_, B_IMM_11_OPOFF, B_IMM_11_MASK) << B_IMM_11_OFF) | \
> -	(RV_IMM_SIGN(x_) << B_IMM_SIGN_OFF); })
> +	(RV_X(x_, RV_B_IMM_4_1_OPOFF, RV_B_IMM_4_1_MASK) << RV_B_IMM_4_1_OFF) | \
> +	(RV_X(x_, RV_B_IMM_10_5_OPOFF, RV_B_IMM_10_5_MASK) << RV_B_IMM_10_5_OFF) | \
> +	(RV_X(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
> +	(RV_IMM_SIGN(x_) << RV_B_IMM_SIGN_OFF); })
>  
> -#define EXTRACT_RVC_J_IMM(x) \
> +#define RVC_EXTRACT_JTYPE_IMM(x) \
>  	({typeof(x) x_ = (x); \
>  	(RVC_X(x_, RVC_J_IMM_3_1_OPOFF, RVC_J_IMM_3_1_MASK) << RVC_J_IMM_3_1_OFF) | \
>  	(RVC_X(x_, RVC_J_IMM_4_OPOFF, RVC_J_IMM_4_MASK) << RVC_J_IMM_4_OFF) | \
> @@ -210,7 +210,7 @@ static inline bool is_ ## INSN_NAME ## _insn(long insn) \
>  	(RVC_X(x_, RVC_J_IMM_10_OPOFF, RVC_J_IMM_10_MASK) << RVC_J_IMM_10_OFF) | \
>  	(RVC_IMM_SIGN(x_) << RVC_J_IMM_SIGN_OFF); })
>  
> -#define EXTRACT_RVC_B_IMM(x) \
> +#define RVC_EXTRACT_BTYPE_IMM(x) \
>  	({typeof(x) x_ = (x); \
>  	(RVC_X(x_, RVC_B_IMM_2_1_OPOFF, RVC_B_IMM_2_1_MASK) << RVC_B_IMM_2_1_OFF) | \
>  	(RVC_X(x_, RVC_B_IMM_4_3_OPOFF, RVC_B_IMM_4_3_MASK) << RVC_B_IMM_4_3_OFF) | \
> diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
> index 963ed7edcff2..030a129900db 100644
> --- a/arch/riscv/kernel/kgdb.c
> +++ b/arch/riscv/kernel/kgdb.c
> @@ -69,19 +69,19 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
>  			rs1_num = decode_register_index(op_code, RVC_C2_RS1_OPOFF);
>  			*next_addr = regs_ptr[rs1_num];
>  		} else if (is_c_j_insn(op_code) || is_c_jal_insn(op_code)) {
> -			*next_addr = EXTRACT_RVC_J_IMM(op_code) + pc;
> +			*next_addr = RVC_EXTRACT_JTYPE_IMM(op_code) + pc;
>  		} else if (is_c_beqz_insn(op_code)) {
>  			rs1_num = decode_register_index_short(op_code,
>  							      RVC_C1_RS1_OPOFF);
>  			if (!rs1_num || regs_ptr[rs1_num] == 0)
> -				*next_addr = EXTRACT_RVC_B_IMM(op_code) + pc;
> +				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
>  			else
>  				*next_addr = pc + 2;
>  		} else if (is_c_bnez_insn(op_code)) {
>  			rs1_num =
>  			    decode_register_index_short(op_code, RVC_C1_RS1_OPOFF);
>  			if (rs1_num && regs_ptr[rs1_num] != 0)
> -				*next_addr = EXTRACT_RVC_B_IMM(op_code) + pc;
> +				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
>  			else
>  				*next_addr = pc + 2;
>  		} else {
> @@ -90,7 +90,7 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
>  	} else {
>  		if ((op_code & __INSN_OPCODE_MASK) == __INSN_BRANCH_OPCODE) {
>  			bool result = false;
> -			long imm = EXTRACT_BTYPE_IMM(op_code);
> +			long imm = RV_EXTRACT_BTYPE_IMM(op_code);
>  			unsigned long rs1_val = 0, rs2_val = 0;
>  
>  			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
> @@ -121,12 +121,12 @@ static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
>  			else
>  				*next_addr = pc + 4;
>  		} else if (is_jal_insn(op_code)) {
> -			*next_addr = EXTRACT_JTYPE_IMM(op_code) + pc;
> +			*next_addr = RV_EXTRACT_JTYPE_IMM(op_code) + pc;
>  		} else if (is_jalr_insn(op_code)) {
>  			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
>  			if (rs1_num)
>  				*next_addr = ((unsigned long *)regs)[rs1_num];
> -			*next_addr += EXTRACT_ITYPE_IMM(op_code);
> +			*next_addr += RV_EXTRACT_ITYPE_IMM(op_code);
>  		} else if (is_sret_insn(op_code)) {
>  			*next_addr = pc;
>  		} else {
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
