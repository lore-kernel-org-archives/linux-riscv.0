Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E28C5C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 22:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oetp3HWgfoK6GAIuPdd5gSu5xNpcjBv/qr5nFC/TdZg=; b=keVuq/Pcn2Phwy
	Dq4axbEmfj9yImXzW56dBPB/sxTHYWu16mDWA68+jGZNspn4M0t51U2addtobwgJw7zR48JLK5Dk/
	yQyQQm7b0kNFYkyhkEFFgUEIedkrQ6Ry0AKdbwDH+pOgQMokxjZqbq4XdIDHoCrAVK23vnB1Hb0p8
	AcaJmnrUU9Rk4C2Z759gADr7L/Zpjd222qOFJVfAbzrxzCx9sEAaDdTvAcx3wAEIITkpD1X5/y9gB
	GQLqx+5CghMQxJIc0NBvZ3+be+UfFZ7VB32OPV8ju6Nt26hJx+l7Y1VfYrpqDPhfTxcrWMuBdzJON
	hn+Oi6CN4HGm8eRse0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09OT-00BaFC-BL; Tue, 29 Nov 2022 22:48:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09OQ-00BaEj-Cq
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 22:48:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E66EC61913;
	Tue, 29 Nov 2022 22:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D24C433D6;
	Tue, 29 Nov 2022 22:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669762077;
	bh=Hfky1NSAxpmj8LF8c7wDQijgPQ+YreXmOCPkn35oz0c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rExtkf6jbTVaYIfQWUUmvCtt53YsuUbAKahBtk6B8BJJR1aTZ8+C3wFW9zFOvnjL6
	 lDBdh3TZZxxAGm8FjhxavGJwQj74ictw1oWLKdlMcKBW9mQ4Dmsh5MhCLN3zcxf+5x
	 icSju3Qi4HvXQGLHu0Hgsp4nemOiU916xOQrjQ++fPghBvV5UMK1h0xpV92VbkgKp/
	 AcYalIjkgDjO+qWSY5nYjt/kVHygD5XF0Cpj85kuN916UmVYq/o74+t9URmtUhKEkj
	 fBPSJq7uMg5rStv+LjmZDQpZ/UmrLxKwJIuuMFgk0ZcxWGHYfDYnA4wXFji/3i8F9c
	 VmLpHDj9wBoNg==
Date: Tue, 29 Nov 2022 22:47:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 02/13] RISC-V: detach funct-values from their offset
Message-ID: <Y4aMGFOuc8kPL/I+@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_144758_530668_5537BCF4 
X-CRM114-Status: GOOD (  23.86  )
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

On Mon, Nov 28, 2022 at 11:26:21AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Only carry the actual values for the funct3, funct4, etc instruction
> fields without directly including the shift to the target position.

"Only carry the actual values..." didn't really make sense to me until I
actually looked at the diff. I'm not sure what "better" wording to
suggest though... "Rather than defining funct3 (...) etc instruction
fields, pre-shifted to their target positions, define the values
themselves."

Is that better? I don't know, but at least I didn't say "I hate this"
without trying to help :)

> Instead use macros to move the values to their target positions
> when needed.
> 
> This at the same time also reduces the use of magic numbers,
> one would need a spec manual to understand.

I'm always down to avoid having to read a spec :)

> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 100 +++++++++++++++++------------
>  1 file changed, 59 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
> index c52b8ae02cfe..e3f87da108f4 100644
> --- a/arch/riscv/include/asm/parse_asm.h
> +++ b/arch/riscv/include/asm/parse_asm.h
> @@ -5,6 +5,15 @@
>  
>  #include <linux/bits.h>
>  
> +#define RV_INSN_FUNCT3_MASK	GENMASK(14, 12)
> +#define RV_INSN_FUNCT3_OPOFF	12
> +#define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
> +#define RV_INSN_OPCODE_OPOFF	0
> +#define RV_INSN_FUNCT12_OPOFF	20
> +
> +#define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
> +#define RV_ENCODE_FUNCT12(f_)	(RVG_FUNCT12_##f_ << RV_INSN_FUNCT12_OPOFF)
> +
>  /* The bit field of immediate value in I-type instruction */
>  #define RV_I_IMM_SIGN_OPOFF	31
>  #define RV_I_IMM_11_0_OPOFF	20
> @@ -84,6 +93,15 @@
>  #define RVC_B_IMM_2_1_MASK	GENMASK(1, 0)
>  #define RVC_B_IMM_5_MASK	GENMASK(0, 0)
>  
> +#define RVC_INSN_FUNCT4_MASK	GENMASK(15, 12)
> +#define RVC_INSN_FUNCT4_OPOFF	12
> +#define RVC_INSN_FUNCT3_MASK	GENMASK(15, 13)
> +#define RVC_INSN_FUNCT3_OPOFF	13
> +#define RVC_INSN_J_RS2_MASK	GENMASK(6, 2)

Since I won't feel comfortable reviewing this without checking the
specs, I did and god is Table 1.1 in the v1.7 compressed spec
horrifically formatted. The numbers aren't even consistently spaced.
My poor OCD! I thought they made these things with adoc or LaTeX...

> +#define RVC_INSN_OPCODE_MASK	GENMASK(1, 0)
> +#define RVC_ENCODE_FUNCT3(f_)	(RVC_FUNCT3_##f_ << RVC_INSN_FUNCT3_OPOFF)
> +#define RVC_ENCODE_FUNCT4(f_)	(RVC_FUNCT4_##f_ << RVC_INSN_FUNCT4_OPOFF)
> +
>  /* The register offset in RVC op=C0 instruction */
>  #define RVC_C0_RS1_OPOFF	7
>  #define RVC_C0_RS2_OPOFF	2
> @@ -113,52 +131,52 @@
>  /* parts of funct3 code for I, M, A extension*/
>  #define RVG_FUNCT3_JALR		0x0
>  #define RVG_FUNCT3_BEQ		0x0
> -#define RVG_FUNCT3_BNE		0x1000
> -#define RVG_FUNCT3_BLT		0x4000
> -#define RVG_FUNCT3_BGE		0x5000
> -#define RVG_FUNCT3_BLTU		0x6000
> -#define RVG_FUNCT3_BGEU		0x7000
> +#define RVG_FUNCT3_BNE		0x1
> +#define RVG_FUNCT3_BLT		0x4
> +#define RVG_FUNCT3_BGE		0x5
> +#define RVG_FUNCT3_BLTU		0x6
> +#define RVG_FUNCT3_BGEU		0x7
>  
>  /* parts of funct3 code for C extension*/
> -#define RVC_FUNCT3_C_BEQZ	0xc000
> -#define RVC_FUNCT3_C_BNEZ	0xe000
> -#define RVC_FUNCT3_C_J		0xa000
> -#define RVC_FUNCT3_C_JAL	0x2000
> -#define RVC_FUNCT4_C_JR		0x8000
> -#define RVC_FUNCT4_C_JALR	0xf000
> +#define RVC_FUNCT3_C_BEQZ	0x6
> +#define RVC_FUNCT3_C_BNEZ	0x7
> +#define RVC_FUNCT3_C_J		0x5
> +#define RVC_FUNCT3_C_JAL	0x1
> +#define RVC_FUNCT4_C_JR		0x8
> +#define RVC_FUNCT4_C_JALR	0x9
>  
> -#define RVG_FUNCT12_SRET	0x10200000
> +#define RVG_FUNCT12_SRET	0x102

>  
> -#define RVG_MATCH_JALR		(RVG_FUNCT3_JALR | RVG_OPCODE_JALR)
> +#define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
>  #define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
> -#define RVG_MATCH_BEQ		(RVG_FUNCT3_BEQ | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BNE		(RVG_FUNCT3_BNE | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BLT		(RVG_FUNCT3_BLT | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BGE		(RVG_FUNCT3_BGE | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BLTU		(RVG_FUNCT3_BLTU | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_BGEU		(RVG_FUNCT3_BGEU | RVG_OPCODE_BRANCH)
> -#define RVG_MATCH_SRET		(RVG_FUNCT12_SRET | RVG_OPCODE_SYSTEM)
> -#define RVC_MATCH_C_BEQZ	(RVC_FUNCT3_C_BEQZ | RVC_OPCODE_C1)
> -#define RVC_MATCH_C_BNEZ	(RVC_FUNCT3_C_BNEZ | RVC_OPCODE_C1)
> -#define RVC_MATCH_C_J		(RVC_FUNCT3_C_J | RVC_OPCODE_C1)
> -#define RVC_MATCH_C_JAL		(RVC_FUNCT3_C_JAL | RVC_OPCODE_C1)
> -#define RVC_MATCH_C_JR		(RVC_FUNCT4_C_JR | RVC_OPCODE_C2)
> -#define RVC_MATCH_C_JALR	(RVC_FUNCT4_C_JALR | RVC_OPCODE_C2)
> -
> -#define RVG_MASK_JALR		0x707f
> -#define RVG_MASK_JAL		0x7f
> -#define RVC_MASK_C_JALR		0xf07f
> -#define RVC_MASK_C_JR		0xf07f
> -#define RVC_MASK_C_JAL		0xe003
> -#define RVC_MASK_C_J		0xe003
> -#define RVG_MASK_BEQ		0x707f
> -#define RVG_MASK_BNE		0x707f
> -#define RVG_MASK_BLT		0x707f
> -#define RVG_MASK_BGE		0x707f
> -#define RVG_MASK_BLTU		0x707f
> -#define RVG_MASK_BGEU		0x707f
> -#define RVC_MASK_C_BEQZ		0xe003
> -#define RVC_MASK_C_BNEZ		0xe003
> +#define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BGE		(RV_ENCODE_FUNCT3(BGE) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BLTU		(RV_ENCODE_FUNCT3(BLTU) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_BGEU		(RV_ENCODE_FUNCT3(BGEU) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_SRET		(RV_ENCODE_FUNCT12(SRET) | RVG_OPCODE_SYSTEM)
> +#define RVC_MATCH_C_BEQZ	(RVC_ENCODE_FUNCT3(C_BEQZ) | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_BNEZ	(RVC_ENCODE_FUNCT3(C_BNEZ) | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_J		(RVC_ENCODE_FUNCT3(C_J) | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_JAL		(RVC_ENCODE_FUNCT3(C_JAL) | RVC_OPCODE_C1)
> +#define RVC_MATCH_C_JR		(RVC_ENCODE_FUNCT4(C_JR) | RVC_OPCODE_C2)
> +#define RVC_MATCH_C_JALR	(RVC_ENCODE_FUNCT4(C_JALR) | RVC_OPCODE_C2)
> +
> +#define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_JR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_JAL		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_J		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVG_MASK_BEQ		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BNE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BLT		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BGE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BLTU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVG_MASK_BGEU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_BEQZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_BNEZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
>  #define RVG_MASK_SRET		0xffffffff
>  
>  #define __INSN_LENGTH_MASK	_UL(0x3)

My eyes got tired near the end of this, but I had a good through and
spot checked against the values in the spec docs and all came up good
for me. I definitely like the cases where you manage to avoid using
defines that'd require an RE effort to figure out what the actual fields
are.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
