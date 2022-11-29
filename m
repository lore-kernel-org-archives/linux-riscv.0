Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F00FC433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 22:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yCzosh7YghqoYIJhjYF4Ry8JW9Dk1buaB3IaFAzIjco=; b=jRsD35dFguRZxR
	dsFaYt9ESVK2Z3mwV0vvNULDS6+UCsXgZ6ybeBKpnUwQ1jWRjXLA25RzU5tAtcB6N3jzOyK6RoGPw
	dNPPyxzZlPTi619mGt0D6hazhpPJmCvzEMpLeP/e0dUMkUO5Qm5xKMhLwnFx5YhfFImTJQaJWiT8/
	Ns/6uc84LSk/60Jd/WJivx9tE2ucExOv61bq3UIRm/Vj6zMRdH5umsSMN1mjvZevjtTRcMIVZjD88
	/Wu10mMzO7hpSV4BP3Sw/lMejkEj+1X66eSAcWin9jbIhRx+LbYrzjcl2zuTaGfLLpxNR+NOUZ3cu
	4wFI23Nfjl8PEG2JCepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09Wf-00Bb0q-9A; Tue, 29 Nov 2022 22:56:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p09Wc-00Bb0V-I2
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 22:56:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DD443B8199B;
	Tue, 29 Nov 2022 22:56:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F11C433D6;
	Tue, 29 Nov 2022 22:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669762583;
	bh=njs+XVSKCURgFJuN5qfLhL6YhJPNCBuDRNeth+p9YYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SiAo9FKu8wqR6el8W1xd6J3NvRAKxmvqVXuOLAQykkDOzUMB7HXFeAbA/gS5YXYnB
	 wtMr8uiztvHAq6C0fBssI1xEGTlTGbyMtSrecDwtFv/MYamLDFx2PjP7wnSbsQAEDY
	 5iBU1LoLV8fGjgdQWq0IAfLDY8Nqf7JO2jJRUXW5t0a/ioxQnpzol6P9Fp/Jo9lqOq
	 6JVXU3xNceYAiinDYOKRTgZOvT5rFs8Pfh+ohzf53kPY/TslhJieTHXdUK4wkXvGz2
	 ZdElj49jYYLXYWDCu6XID73HLltBP9vRqj0TMmp1zC/Th9DLosvy7LY0iMzmcaftsM
	 A7HmO+aDfXXxA==
Date: Tue, 29 Nov 2022 22:56:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 03/13] RISC-V: add ebreak instructions to definitions
Message-ID: <Y4aOEyyaWJbqCZ9y@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-4-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_145626_910316_45D96FD2 
X-CRM114-Status: GOOD (  15.71  )
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

On Mon, Nov 28, 2022 at 11:26:22AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> kprobes need to match ebreaks instructions, so add the necessary

nit: ebreaks or ebreak instructions - but should it be stylised with
capitals to match the spec?

Otherwise this looks grand?
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> data to enable us to centralize that functionality.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/parse_asm.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/parse_asm.h b/arch/riscv/include/asm/parse_asm.h
> index e3f87da108f4..e8303250f598 100644
> --- a/arch/riscv/include/asm/parse_asm.h
> +++ b/arch/riscv/include/asm/parse_asm.h
> @@ -144,7 +144,9 @@
>  #define RVC_FUNCT3_C_JAL	0x1
>  #define RVC_FUNCT4_C_JR		0x8
>  #define RVC_FUNCT4_C_JALR	0x9
> +#define RVC_FUNCT4_C_EBREAK	0x9
>  
> +#define RVG_FUNCT12_EBREAK	0x1
>  #define RVG_FUNCT12_SRET	0x102
>  
>  #define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
> @@ -155,6 +157,7 @@
>  #define RVG_MATCH_BGE		(RV_ENCODE_FUNCT3(BGE) | RVG_OPCODE_BRANCH)
>  #define RVG_MATCH_BLTU		(RV_ENCODE_FUNCT3(BLTU) | RVG_OPCODE_BRANCH)
>  #define RVG_MATCH_BGEU		(RV_ENCODE_FUNCT3(BGEU) | RVG_OPCODE_BRANCH)
> +#define RVG_MATCH_EBREAK	(RV_ENCODE_FUNCT12(EBREAK) | RVG_OPCODE_SYSTEM)
>  #define RVG_MATCH_SRET		(RV_ENCODE_FUNCT12(SRET) | RVG_OPCODE_SYSTEM)
>  #define RVC_MATCH_C_BEQZ	(RVC_ENCODE_FUNCT3(C_BEQZ) | RVC_OPCODE_C1)
>  #define RVC_MATCH_C_BNEZ	(RVC_ENCODE_FUNCT3(C_BNEZ) | RVC_OPCODE_C1)
> @@ -162,6 +165,7 @@
>  #define RVC_MATCH_C_JAL		(RVC_ENCODE_FUNCT3(C_JAL) | RVC_OPCODE_C1)
>  #define RVC_MATCH_C_JR		(RVC_ENCODE_FUNCT4(C_JR) | RVC_OPCODE_C2)
>  #define RVC_MATCH_C_JALR	(RVC_ENCODE_FUNCT4(C_JALR) | RVC_OPCODE_C2)
> +#define RVC_MATCH_C_EBREAK	(RVC_ENCODE_FUNCT4(C_EBREAK) | RVC_OPCODE_C2)
>  
>  #define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
>  #define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
> @@ -177,6 +181,8 @@
>  #define RVG_MASK_BGEU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
>  #define RVC_MASK_C_BEQZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
>  #define RVC_MASK_C_BNEZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
> +#define RVC_MASK_C_EBREAK	0xffff
> +#define RVG_MASK_EBREAK		0xffffffff
>  #define RVG_MASK_SRET		0xffffffff
>  
>  #define __INSN_LENGTH_MASK	_UL(0x3)
> -- 
> 2.35.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
