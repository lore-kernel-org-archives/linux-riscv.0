Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97547C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 23:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfPSTKxPaED+nJLQl7XBsiiZCCEa4THVjUaVwNl1ST4=; b=FlSFvyW+c1/KZS
	nR0fdfBLl/FWQXRj52oHew/Iwp+50jEDSVlRxDvPAaTyOgUZX6pbsYItlA/kyIpD+7alZgncGBNtT
	qV/zgcdhI+pby/IEw5KomIgNVWwzhsd9dKtQqoiWJFxbcbiQAhQlUHQ2SUwxfeimFIrlW0IMjnF58
	xjDue3kur2dgQt1I13HFc+Ml8kSs2btvBDLGAMDTbWZq+E77yFgie72J56rte6ecakq2chWeWX8CM
	z3a9sknz8AEbNWkxmbLmSxjUE554VSMuahYqasDAuktOoL1Msur1g7SXynkDHcxwoFGZdO5vtbzDH
	k1rbB9XV9LYNuxE5zkFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09vf-00BcnT-Cv; Tue, 29 Nov 2022 23:22:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09vd-00BcmT-2W
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 23:22:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AD5BBB8199E;
	Tue, 29 Nov 2022 23:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87C91C433D6;
	Tue, 29 Nov 2022 23:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669764134;
	bh=xGgiev8eCIHaXSj7c++pYutaUO10LZM3wINHPbzZLDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bqj3TcPghJLIkWd17KKhYk2V/OZMtVT0Tj34ysoa7aymyiLewPHBi8TxLofh3p3ZL
	 2Bd0bcxJdKjxhgzMW5lA190uSTjMbLDaZ5cJgIV2fspJQhQms0E3mPWFHV0FAF0tvn
	 RZPyR9jWronwu3BO2QsCESEN/s8+rW/h731t0523Ihp1pyvzdk+oK/xH3UaqZLI+r3
	 EORWtfhL4f4IML9wEZn0P1ICvnSg0PtGz9vJQ65US5MPKF2OY7zPTNbvK+mEFoG1IY
	 dDaaHQ0Ma+dq5mInk4tdT0z4cAw4YV5/OaERxm9AsMe37L+wuSa2C/l0WQFiRzXwhd
	 yS6jQ3qvX3djw==
Date: Tue, 29 Nov 2022 23:22:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 06/13] RISC-V: kprobes: use central defined funct3
 constants
Message-ID: <Y4aUIsKbJ//CG9iV@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-7-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-7-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_152217_297221_71BA77E4 
X-CRM114-Status: GOOD (  17.49  )
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

On Mon, Nov 28, 2022 at 11:26:25AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Don't redefine values that are already available in a central header.

Which central header?
Being intentionally dense, but it'd be nice to mention it since it's not
in the diffstat?

> Use the central ones instead.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/kernel/probes/simulate-insn.c | 19 ++++++-------------
>  1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
> index d73e96f6ed7c..330afe9331a8 100644
> --- a/arch/riscv/kernel/probes/simulate-insn.c
> +++ b/arch/riscv/kernel/probes/simulate-insn.c
> @@ -136,13 +136,6 @@ bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *re
>  #define branch_offset(opcode) \
>  	sign_extend32((branch_imm(opcode)), 12)
>  
> -#define BRANCH_BEQ	0x0
> -#define BRANCH_BNE	0x1
> -#define BRANCH_BLT	0x4
> -#define BRANCH_BGE	0x5
> -#define BRANCH_BLTU	0x6
> -#define BRANCH_BGEU	0x7
> -
>  bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs)
>  {
>  	/*
> @@ -169,22 +162,22 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
>  
>  	offset_tmp = branch_offset(opcode);
>  	switch (branch_funct3(opcode)) {
> -	case BRANCH_BEQ:
> +	case RVG_FUNCT3_BEQ:
>  		offset = (rs1_val == rs2_val) ? offset_tmp : 4;
>  		break;
> -	case BRANCH_BNE:
> +	case RVG_FUNCT3_BNE:
>  		offset = (rs1_val != rs2_val) ? offset_tmp : 4;
>  		break;
> -	case BRANCH_BLT:
> +	case RVG_FUNCT3_BLT:
>  		offset = ((long)rs1_val < (long)rs2_val) ? offset_tmp : 4;
>  		break;
> -	case BRANCH_BGE:
> +	case RVG_FUNCT3_BGE:
>  		offset = ((long)rs1_val >= (long)rs2_val) ? offset_tmp : 4;
>  		break;
> -	case BRANCH_BLTU:
> +	case RVG_FUNCT3_BLTU:
>  		offset = (rs1_val < rs2_val) ? offset_tmp : 4;
>  		break;
> -	case BRANCH_BGEU:
> +	case RVG_FUNCT3_BGEU:
>  		offset = (rs1_val >= rs2_val) ? offset_tmp : 4;
>  		break;
>  	default:

Still suffering from the carried-in build issues, but this change also
looks grand in isolation?

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
