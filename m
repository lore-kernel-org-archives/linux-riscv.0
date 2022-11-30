Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70C8C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XMtBCYj2VK2g2C8+h8occbaBCYs+kWsORij5LeHHLIc=; b=5Dz+xsTdwVhf5J
	55misjviftyI/a8M3qdoqpyOZvC2kNWG1t4LAb0LZZIricfT1fB9GNVtkWgFioSfjdN5CGrsRN5uR
	jf2576EUg93MfveZZuqyzLmpBS/7dz95UcHj61rJjYcqN4WJ3c2cWqKoWFmwyWS1cZP6I5luaT4Up
	YvL/3tdGOEl4a+slleB8e138TVnEusw4lB1GA7DucpPs2Onyz2NNI5aRPI+ZFjVAE/rX0GdKUkA7n
	1uuG5SE6dxX3wMcznD84CKvyz2IvuY9NTgQOYFjyqrk4SGrfkNr0olQ+GRygsyrf7U/jLA6fkpHnV
	I6qNy4bI8Cx8SQ7Culhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Q5r-000XDj-OU; Wed, 30 Nov 2022 16:37:55 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Q5l-000X6c-UO
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 16:37:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 49C09B81A79;
	Wed, 30 Nov 2022 16:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 315B3C433C1;
	Wed, 30 Nov 2022 16:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669826267;
	bh=p8hyjhuAMiV23FiSepo+yooKwz1yfFOEyHLR/J9doIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9Dm1yc3OvGpYDu4tQDaHnnu5KQXJj6tjBxaYusBmAIzxP82deYxvIlwUz7tPlhPW
	 Z6RgSYToeRKrXAHQvb08dC1Qm03AgPPUCqpjywi1aQ/eFs9RdH8u6a0jJpgH+yQmUL
	 X/SnLW0hr3b5WYvJ8J6CDV08hzs9Xxzr2t4RNMF7pnJzgFTJjV3+Xy5F09tLzQ/8Wt
	 BuIQt+EuqmsPYYZfR2SNXEM0P9BQOC0R0Crp3ovFOOge4178P8tlspVisGpfc5KrbS
	 ADUxVBbav4OHYwIHJ7kAxGUbDH3yMPfJp7Zqbh6kE5PR+HyoFgfYc1MmtIgMP8S28T
	 jP70MF87XkFxg==
Date: Wed, 30 Nov 2022 16:37:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	philipp.tomsich@vrull.eu, ajones@ventanamicro.com,
	emil.renner.berthing@canonical.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v2 10/13] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Message-ID: <Y4eG1vwwjKIMx7gs@spud>
References: <20221128102632.435174-1-heiko@sntech.de>
 <20221128102632.435174-11-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128102632.435174-11-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_083750_309482_AD436452 
X-CRM114-Status: GOOD (  32.30  )
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

On Mon, Nov 28, 2022 at 11:26:29AM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Alternatives live in a different section, so addresses used by call
> functions will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

This looks like an improved version of what I gave an R-b for last time?
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/alternative.h |  3 ++
>  arch/riscv/kernel/alternative.c      | 72 ++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c       | 11 ++++-
>  3 files changed, 84 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 6511dd73e812..c58ec3cc4bc3 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -27,6 +27,9 @@ void __init apply_boot_alternatives(void);
>  void __init apply_early_boot_alternatives(void);
>  void apply_module_alternatives(void *start, size_t length);
>  
> +void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
> +				      int patch_offset);
> +
>  struct alt_entry {
>  	void *old_ptr;		 /* address of original instruciton or data  */
>  	void *alt_ptr;		 /* address of replacement instruction or data */
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index a7d26a00beea..292cc42dc3be 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -15,6 +15,8 @@
>  #include <asm/vendorid_list.h>
>  #include <asm/sbi.h>
>  #include <asm/csr.h>
> +#include <asm/insn.h>
> +#include <asm/patch.h>
>  
>  struct cpu_manufacturer_info_t {
>  	unsigned long vendor_id;
> @@ -53,6 +55,76 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
>  	}
>  }
>  
> +static unsigned int riscv_instruction_at(void *p, unsigned int offset)
> +{
> +	u16 *parcel = p + (offset * sizeof(u32));
> +
> +	return (unsigned int)parcel[0] | (unsigned int)parcel[1] << 16;
> +}
> +
> +static inline bool riscv_insn_is_auipc_jalr(u32 insn1, u32 insn2)
> +{
> +	return riscv_insn_is_auipc(insn1) && riscv_insn_is_jalr(insn2);
> +}
> +
> +#define JALR_SIGN_MASK		BIT(RV_I_IMM_SIGN_OPOFF - RV_I_IMM_11_0_OPOFF)
> +#define AUIPC_PAD		(0x00001000)
> +
> +#define to_jalr_imm(value)						\
> +	((value & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF)
> +
> +#define to_auipc_imm(value)						\
> +	((value & JALR_SIGN_MASK) ?					\
> +	((value & RV_U_IMM_31_12_MASK) + AUIPC_PAD) :	\
> +	(value & RV_U_IMM_31_12_MASK))
> +
> +void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
> +				      int patch_offset)
> +{
> +	int num_instr = len / sizeof(u32);
> +	unsigned int call[2];
> +	int i;
> +	int imm;
> +	u32 rd1;
> +
> +	/*
> +	 * stop one instruction before the end, as we're checking
> +	 * for auipc + jalr
> +	 */
> +	for (i = 0; i < num_instr - 1; i++) {
> +		u32 inst1 = riscv_instruction_at(alt_ptr, i);
> +		u32 inst2 = riscv_instruction_at(alt_ptr, i + 1);
> +
> +		if (!riscv_insn_is_auipc_jalr(inst1, inst2))
> +			continue;
> +
> +		/* call will use ra register */
> +		rd1 = RV_EXTRACT_RD_REG(inst1);
> +		if (rd1 != 1)
> +			continue;
> +
> +		/* get and adjust new target address */
> +		imm = RV_EXTRACT_UTYPE_IMM(inst1);
> +		imm += RV_EXTRACT_ITYPE_IMM(inst2);
> +		imm -= patch_offset;
> +
> +		/* pick the original auipc + jalr */
> +		call[0] = inst1;
> +		call[1] = inst2;
> +
> +		/* drop the old IMMs */
> +		call[0] &= ~(RV_U_IMM_31_12_MASK);
> +		call[1] &= ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
> +
> +		/* add the adapted IMMs */
> +		call[0] |= to_auipc_imm(imm);
> +		call[1] |= to_jalr_imm(imm);
> +
> +		/* patch the call place again */
> +		patch_text_nosync(alt_ptr + i * sizeof(u32), call, 8);
> +	}
> +}
> +
>  /*
>   * This is called very early in the boot process (directly after we run
>   * a feature detect on the boot CPU). No need to worry about other CPUs
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 694267d1fe81..ba62a4ff5ccd 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -316,8 +316,15 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
