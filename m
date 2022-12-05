Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50751C47089
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zi+pl8Hj/ieiD6V9C4SdVLXEcK4RC78oQylAO7pgzwY=; b=TcLoUk+kqt76dn
	rKwJnIvrshrULrmYmb2riGaG2r9y7kpbQFD88pi85fIO4+zAAkK6lnJA5igdx5UmdHwJ93qL2LxlY
	O239aYeoWM090STwPfagddICGdz+R+q+Aei/OYsCdMt3DfcFoV2ghbH8lOWrd/i0uI0Ct70EAGs4B
	TOGsNF9U2TSqGZnbc2/yCe9bTEa5UfGWZephQTs+A/P8rXO9L1VQI44iskDJou6Cici/K8ybLHFA0
	bTvu2VI+DCJwrHslbBYUOzKSEAn/rcXfwvjYNZzlKHqfQNg6ftFThYAvSiLLVb5cRA38B8wz/l+MN
	br82oUYcFo0/TM2VJL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DRA-004p0s-Ru; Mon, 05 Dec 2022 15:31:20 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2DR7-004orN-VO; Mon, 05 Dec 2022 15:31:19 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p2DQy-0004NP-Vn; Mon, 05 Dec 2022 16:31:09 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Date: Mon, 05 Dec 2022 16:31:08 +0100
Message-ID: <4764569.GXAFRqVoOG@diego>
In-Reply-To: <20221204174632.3677-2-jszhang@kernel.org>
References: <20221204174632.3677-1-jszhang@kernel.org> <20221204174632.3677-2-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_073118_042230_44F519B2 
X-CRM114-Status: GOOD (  25.54  )
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

Am Sonntag, 4. Dezember 2022, 18:46:20 CET schrieb Jisheng Zhang:
> Alternatives live in a different section, so offsets used by jal
> instruction will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/alternative.h |  2 ++
>  arch/riscv/kernel/alternative.c      | 38 ++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c       |  3 +++
>  3 files changed, 43 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index c58ec3cc4bc3..33eae9541684 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -29,6 +29,8 @@ void apply_module_alternatives(void *start, size_t length);
>  
>  void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
>  				      int patch_offset);
> +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> +			       int patch_offset);
>  
>  struct alt_entry {
>  	void *old_ptr;		 /* address of original instruciton or data  */
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 292cc42dc3be..9d88375624b5 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -125,6 +125,44 @@ void riscv_alternative_fix_auipc_jalr(void *alt_ptr, unsigned int len,
>  	}
>  }
>  
> +#define to_jal_imm(value)						\
> +	(((value & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_11_0_OPOFF) | \
> +	 ((value & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) | \
> +	 ((value & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) | \
> +	 ((value & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF))
> +
> +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> +			       int patch_offset)
> +{

I think we might want to unfiy this into a common function like

	riscv_alternative_fix_offsets(...)

so that we only run through the code block once

	for (i = 0; i < num_instr; i++) {
		if (riscv_insn_is_auipc_jalr(inst1, inst2)) {
			riscv_alternative_fix_auipc_jalr(...)
			continue;
		}

		if (riscv_insn_is_jal(inst)) {
			riscv_alternative_fix_jal(...)
			continue;
		}
	}

This would also remove the need from calling multiple functions
after patching alternatives.

Thoughts?


Heiko

> +	int num_instr = len / sizeof(u32);
> +	unsigned int call;
> +	int i;
> +	int imm;
> +
> +	for (i = 0; i < num_instr; i++) {
> +		u32 inst = riscv_instruction_at(alt_ptr, i);
> +
> +		if (!riscv_insn_is_jal(inst))
> +			continue;
> +
> +		/* get and adjust new target address */
> +		imm = RV_EXTRACT_JTYPE_IMM(inst);
> +		imm -= patch_offset;
> +
> +		/* pick the original jal */
> +		call = inst;
> +
> +		/* drop the old IMMs, all jal imm bits sit at 31:12 */
> +		call &= ~GENMASK(31, 12);
> +
> +		/* add the adapted IMMs */
> +		call |= to_jal_imm(imm);
> +
> +		/* patch the call place again */
> +		patch_text_nosync(alt_ptr + i * sizeof(u32), &call, 4);
> +	}
> +}
> +
>  /*
>   * This is called very early in the boot process (directly after we run
>   * a feature detect on the boot CPU). No need to worry about other CPUs
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index ba62a4ff5ccd..c743f0adc794 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -324,6 +324,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  			riscv_alternative_fix_auipc_jalr(alt->old_ptr,
>  							 alt->alt_len,
>  							 alt->old_ptr - alt->alt_ptr);
> +			riscv_alternative_fix_jal(alt->old_ptr,
> +						  alt->alt_len,
> +						  alt->old_ptr - alt->alt_ptr);
>  		}
>  	}
>  }
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
