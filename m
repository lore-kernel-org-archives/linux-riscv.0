Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEAFC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Nov 2022 20:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ar1ab9NKq6FgqdUPQIq0Vd62Y1ARTjLKCvS2IvO+T6c=; b=ANpcBrHmAoolQr
	x9kRvxM2WdYLRPImkMuu1i2uNeQlLUboSM0eU9/V/zLrOJMxIepd+XXCMXqhNascWjp3B40gIwxi6
	3r9X/grdL5TX1tDML7x0MiwK7FcNqdp3n1vRra5cjsgwJOdHK6qy6p66lHk5R3E6tfC0jlcx1GvCe
	TueDZpEXdhhs+6O36LVjP1GytNatgUbSck9mMBRB4lYPHZ3LUrZU/AYvFyBkC1IilIXy322BbUI2t
	gG6KYfIYR4skE0jRYOAjCb6QYXgDe76F4rxBbuI2nJcpagAbt/CZfF4H3MX611cEKi4WXXsAbfcxf
	7zYZmJcjVC42RyXgVf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouJeB-00Den2-B3; Sun, 13 Nov 2022 20:32:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouJe7-00Dej6-On
	for linux-riscv@lists.infradead.org; Sun, 13 Nov 2022 20:32:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 32CA2B80B8A;
	Sun, 13 Nov 2022 20:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199A8C433D6;
	Sun, 13 Nov 2022 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668371519;
	bh=m5syqmtU6c2t9l8K3QqFdJJkNbHyb5AkrRi/42LCBhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PEGMZ6Mac7IkZ9ipPQQN1dLRjFy0yV1rKnIWGyn2KbJhraWRcxhC4izUrLNlp6PLD
	 2/p1DhNBnrtkjzAP4UOyxICuFVPKj7CHH+W6B13URNX2+4tSV48VwCNZqqy8hFXNzT
	 W4Qd69U/gYfK0Zb4+pTNsWTHEV+y9EmJmdLl7en7sDiMF9Z06wCCVkI3NQ13jtLuVp
	 PA+CAa3z6hQNV194z5swkOZglSkocWRYlMIhT+DM5i06CyI6tFd5/k/iDYcf6L+3QY
	 Sux0QKLh5FfVUzLuYpNWUi7bQ7sc8Z6RNniWJ5FzgtYTCwKC0DtaaJoeNkL8e+JFKc
	 71kNihWOE9r/Q==
Date: Sun, 13 Nov 2022 20:31:55 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 5/7] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Message-ID: <Y3FUO18N/JC9erY8@spud>
References: <20221110164924.529386-1-heiko@sntech.de>
 <20221110164924.529386-6-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221110164924.529386-6-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221113_123204_138226_2321825B 
X-CRM114-Status: GOOD (  26.17  )
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

On Thu, Nov 10, 2022 at 05:49:22PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Alternatives live in a different section, so addresses used by call
> functions will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

What a lovely function you've got here, seems to make sense though..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/kernel/cpufeature.c | 79 +++++++++++++++++++++++++++++++++-
>  1 file changed, 77 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 694267d1fe81..026512ca9c4c 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -298,6 +298,74 @@ static u32 __init_or_module cpufeature_probe(unsigned int stage)
>  	return cpu_req_feature;
>  }
>  
> +#include <asm/parse_asm.h>
> +
> +DECLARE_INSN(jalr, MATCH_JALR, MASK_JALR)
> +DECLARE_INSN(auipc, MATCH_AUIPC, MASK_AUIPC)
> +
> +static inline bool is_auipc_jalr_pair(long insn1, long insn2)
> +{
> +	return is_auipc_insn(insn1) && is_jalr_insn(insn2);
> +}
> +
> +#define JALR_SIGN_MASK		BIT(I_IMM_SIGN_OPOFF - I_IMM_11_0_OPOFF)
> +#define JALR_OFFSET_MASK	I_IMM_11_0_MASK
> +#define AUIPC_OFFSET_MASK	U_IMM_31_12_MASK
> +#define AUIPC_PAD		(0x00001000)
> +#define JALR_SHIFT		I_IMM_11_0_OPOFF
> +
> +#define to_jalr_imm(offset)						\
> +	((offset & I_IMM_11_0_MASK) << I_IMM_11_0_OPOFF)
> +
> +#define to_auipc_imm(offset)						\
> +	((offset & JALR_SIGN_MASK) ?					\
> +	((offset & AUIPC_OFFSET_MASK) + AUIPC_PAD) :	\
> +	(offset & AUIPC_OFFSET_MASK))
> +
> +static void riscv_alternative_fix_auipc_jalr(unsigned int *alt_ptr,
> +					     unsigned int len, int patch_offset)
> +{
> +	int num_instr = len / sizeof(u32);
> +	unsigned int call[2];
> +	int i;
> +	int imm1;
> +	u32 rd1;
> +
> +	for (i = 0; i < num_instr; i++) {
> +		/* is there a further instruction? */
> +		if (i + 1 >= num_instr)
> +			continue;
> +
> +		if (!is_auipc_jalr_pair(*(alt_ptr + i), *(alt_ptr + i + 1)))
> +			continue;
> +
> +		/* call will use ra register */
> +		rd1 = EXTRACT_RD_REG(*(alt_ptr + i));
> +		if (rd1 != 1)
> +			continue;
> +
> +		/* get and adjust new target address */
> +		imm1 = EXTRACT_UTYPE_IMM(*(alt_ptr + i));
> +		imm1 += EXTRACT_ITYPE_IMM(*(alt_ptr + i + 1));
> +		imm1 -= patch_offset;
> +
> +		/* pick the original auipc + jalr */
> +		call[0] = *(alt_ptr + i);
> +		call[1] = *(alt_ptr + i + 1);
> +
> +		/* drop the old IMMs */
> +		call[0] &= ~(U_IMM_31_12_MASK);
> +		call[1] &= ~(I_IMM_11_0_MASK << I_IMM_11_0_OPOFF);
> +
> +		/* add the adapted IMMs */
> +		call[0] |= to_auipc_imm(imm1);
> +		call[1] |= to_jalr_imm(imm1);
> +
> +		/* patch the call place again */
> +		patch_text_nosync(alt_ptr + i * sizeof(u32), call, 8);
> +	}
> +}
> +
>  void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  						  struct alt_entry *end,
>  						  unsigned int stage)
> @@ -316,8 +384,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  		}
>  
>  		tmp = (1U << alt->errata_id);
> -		if (cpu_req_feature & tmp)
> -			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +		if (cpu_req_feature & tmp) {
> +			/* do the basic patching */
> +			patch_text_nosync(alt->old_ptr, alt->alt_ptr,
> +					  alt->alt_len);
> +
> +			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
> +							 alt->alt_len,
> +							 alt->old_ptr - alt->alt_ptr);
> +		}
>  	}
>  }
>  #endif
> -- 
> 2.35.1
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
