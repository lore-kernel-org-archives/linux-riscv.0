Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B862C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 23:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ow7qbgcKNI3sTkZ2qd5ZBODy1LBwPBCnT/i+7I16nTQ=; b=0THHD4otMO1e5E
	Lyw8sWCwmXQr0CyrYs5y94SsGDyyC+AHXcjRWjYuYDk9rBjvuMrFEYLaLWkTOk+qx7nZngv6nHBwr
	5QJXMpHpXsvB2qad4XAHmFYeSn5LF3+dSQ1R7xP3elGAIaczNN7tqXXNmQI3rd8R2Hvz7nF6JS5mO
	ZvdeoVkrj/FxwY9FqGxPU040jTb1e27QcpSWcI/mI0NXk/YYs2bVCfE5vJtonpz3Tpj2H+lxFQszx
	E5vW2umjiUt5BzLUVOJAZLckZQuM6WEOX1ksZRH4ASp/ednLvXdHUiaXb8NUneqnM8vkPoim74pGu
	nvgnmmjom6oKrrs+r5Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0A9E-00Beje-BC; Tue, 29 Nov 2022 23:36:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0A9B-00BejJ-L8
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 23:36:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 068056193C;
	Tue, 29 Nov 2022 23:36:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80624C433C1;
	Tue, 29 Nov 2022 23:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669764976;
	bh=bVIoaqCWV6P162xm3I0vOILLmYooAOmklzO263Ptdlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zz/dMcqXFY1cIC5x4caLZB0WZ/VGshFGxZ4vSGnTFtzncWHeZTaGBv9lCdVKUaMUc
	 scUODNZkTKHWGdWESR+3ytk75Pb3F8Q3gq/GlQvwLQikmRCRSuF3HO4oLWc450Sc/l
	 s6Lco3TPnmlXnpmH8wz75cHWBqjs1D4ISSKWORLtiUj6qwYyNxMVzdsX9SINuqwUNG
	 /KaEUmTCobAjjM8WTb+yYcJe/fmcxRLyW9GmxmCOfp4eEvQQ8gdevxGCeiC9WotXTO
	 vRIDTXMUPCB/YaIEYz8nFEnj9vtDWpyFD4djT7nkqz+I5QwEkpiY1bEXrFeaEQGDi8
	 y/qV6STkTx15g==
Date: Tue, 29 Nov 2022 23:36:12 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 07/13] RISC-V: add auipc elements to parse_asm header
Message-ID: <Y4aXbBGT346eo/qG@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-8-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-8-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_153617_791811_9E362ACD 
X-CRM114-Status: GOOD (  16.85  )
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

On Mon, Nov 28, 2022 at 11:26:26AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> RISC-V: add auipc elements to parse_asm header 

This header is no longer called parse_asm ;)

> We will want to use the opcode parsing outside kdb as well and need

Will we? Commit bikeshedding time, but mentioning the motivation would
be appreciated.

> at least the auipc element there.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index bfd306f85ec7..f10cb0fdfa96 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -118,6 +118,7 @@
>  #define RVC_C2_RD_OPOFF		7
>  
>  /* parts of opcode for RVG*/
> +#define RVG_OPCODE_AUIPC	0x17
>  #define RVG_OPCODE_BRANCH	0x63
>  #define RVG_OPCODE_JALR		0x67
>  #define RVG_OPCODE_JAL		0x6f
> @@ -149,6 +150,7 @@
>  #define RVG_FUNCT12_EBREAK	0x1
>  #define RVG_FUNCT12_SRET	0x102
>  
> +#define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
>  #define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
>  #define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
>  #define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
> @@ -167,6 +169,7 @@
>  #define RVC_MATCH_C_JALR	(RVC_ENCODE_FUNCT4(C_JALR) | RVC_OPCODE_C2)
>  #define RVC_MATCH_C_EBREAK	(RVC_ENCODE_FUNCT4(C_EBREAK) | RVC_OPCODE_C2)
>  
> +#define RVG_MASK_AUIPC		RV_INSN_OPCODE_MASK
>  #define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
>  #define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
>  #define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
> @@ -203,6 +206,7 @@ __RISCV_INSN_FUNCS(c_jal, RVC_MASK_C_JAL, RVC_MATCH_C_JAL)
>  #else
>  #define riscv_insn_is_c_jal(opcode) 0
>  #endif
> +__RISCV_INSN_FUNCS(auipc, RVG_MASK_AUIPC, RVG_MATCH_AUIPC)
>  __RISCV_INSN_FUNCS(jalr, RVG_MASK_JALR, RVG_MATCH_JALR)
>  __RISCV_INSN_FUNCS(jal, RVG_MASK_JAL, RVG_MATCH_JAL)
>  __RISCV_INSN_FUNCS(c_jr, RVC_MASK_C_JR, RVC_MATCH_C_JR)

This fixes the build error that's been lingering for a few patches, so
please re-order things so as not to break bisection :)

With the nits above fixed & assuming that this survives as its own
commit:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
