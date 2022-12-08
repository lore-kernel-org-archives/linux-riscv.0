Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C45C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 14:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TMBQhC93J6YHQDl5ktdO8KdH1cU5jCFRBRr2vLXK1w4=; b=LdAc80mQqyth4i
	/+k/oZNOxltLFj4ENSWpV8MivKWmrlaCkYoYkROqHa44IvpL5DGU1VWcu70deytstE87uxpB8o8EV
	n/fZxlK4ckZlbETamqkJ5Nis4vW0c15ibKl3wwodWbhP5tdf8638bfdVfz8WdsowGn6DHsytAq3vy
	Rb1vtTWFUR0fkDcb3agxQBzTKlmqVx3+43DgiKUZ1zL+n7EX/SanPAS16GWzgtlwT57ozJAu6fyBp
	Cisru8eEtUHX/KDEgQNFk57/lFKqGbPufixDKHNzdRygQMbcB5iMLnr4NtElu4tcC9TvxsKLOL2Uv
	tiMrH2OY3CmzYZi4vqNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IBq-002Ehc-TL; Thu, 08 Dec 2022 14:47:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3IBn-002Eaw-H2
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 14:47:57 +0000
Received: by mail-ej1-x631.google.com with SMTP id ud5so4611692ejc.4
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 06:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f56fs6iNlDUIFdtZhl9rxCkqSVsJ9wdDceNxOKSKKCQ=;
        b=VoVT1ruLo21pXN0ZL3f+PUciDlulXZvwIhNWwLWn2ffxtHrm5tHLpIoqgp8VJHLVPp
         hqnifBrDGyQ1m+nh8Og+QLYZCXGuqp4bd7DJUV/6EORy9mHc/OfKideBbJCs6w+sNHKD
         lXn3HY49fmTDXaEfT0ig6Fvbl/+mnWwFE58XKeimeXcgK6eDkrsCo5bGf9iM3QbevZvM
         BqXrocThoe4Lt/n2nRU+RnXLo/q3Mmhh6+x0mauo3C9EO1uDXNOiFU+rlLAMaMBkEE0x
         sfWaU35ki8uhrfaOQkT6+p9MxvQxRzuk9V6Gc9bxDyV3AwJ+4wgBZRgmr0Wr2FHVNkU1
         Cb5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f56fs6iNlDUIFdtZhl9rxCkqSVsJ9wdDceNxOKSKKCQ=;
        b=fmQSTxeZbM9MrB7BmompUY2WFME8v1EPEfhsms/GrvLgCckaco03Wzo/b97GHB1coR
         TC3EbFRpNc15A3fFW4scJ6dpFWl+WcX6yVnH4PxtHp1l+Lu2bT0YCsE15r0wE6llI3+W
         94AqppE8aVOxGrB+x1LBzqLAUjTIDbFdJYMovQHp6cFyMZyDuNy/xD41yTYxjWOdS52l
         r/U/ND+djB/VyNU4IORttiddrmMGQkpwnsH7NTi8AqArjopwGmYZzdlbknKe/GYFjs02
         HA0BlwprlhS+CYVZevf/aqP+EYGEMb4zFns36cu+QFhtNGCVPz3Kth6TpzvTm6wx7kDZ
         XLWA==
X-Gm-Message-State: ANoB5pkRHH5a8YYldoqcTqdiUBVNU6bLM5pJb86IuqY+vw1TKzol7pi6
	ppJeCiOWlV8oOXSm5cmlOMes6PwSOwRq1vvD
X-Google-Smtp-Source: AA0mqf6tXv05rlT7hE8t6dL2iX4h33eptvrfsq8nmk0r9q+PUIRoEYPXUtJ4ABuuGFg2HJTd1bDlfQ==
X-Received: by 2002:a17:906:b150:b0:7a6:b59c:1e1b with SMTP id bt16-20020a170906b15000b007a6b59c1e1bmr2143118ejb.29.1670510871837;
        Thu, 08 Dec 2022 06:47:51 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id e10-20020a056402088a00b00463bc1ddc76sm3433596edy.28.2022.12.08.06.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 06:47:51 -0800 (PST)
Date: Thu, 8 Dec 2022 15:47:50 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 12/12] RISC-V: fix auipc-jalr addresses in patched
 alternatives
Message-ID: <20221208144750.fihf7rhst5bsgdxx@kamzik>
References: <20221207180821.2479987-1-heiko@sntech.de>
 <20221207180821.2479987-13-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221207180821.2479987-13-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_064755_592904_C6A5B7CC 
X-CRM114-Status: GOOD (  31.72  )
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

On Wed, Dec 07, 2022 at 07:08:21PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Alternatives live in a different section, so addresses used by call
> functions will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/alternative.h |  3 ++
>  arch/riscv/kernel/alternative.c      | 56 ++++++++++++++++++++++++++++
>  arch/riscv/kernel/cpufeature.c       |  5 ++-
>  3 files changed, 63 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 6511dd73e812..1bd4027d34ca 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -27,6 +27,9 @@ void __init apply_boot_alternatives(void);
>  void __init apply_early_boot_alternatives(void);
>  void apply_module_alternatives(void *start, size_t length);
>  
> +void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> +				   int patch_offset);
> +
>  struct alt_entry {
>  	void *old_ptr;		 /* address of original instruciton or data  */
>  	void *alt_ptr;		 /* address of replacement instruction or data */
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index a7d26a00beea..c29e198ed9df 100644
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
> @@ -53,6 +55,60 @@ static void __init_or_module riscv_fill_cpu_mfr_info(struct cpu_manufacturer_inf
>  	}
>  }
>  
> +static u32 riscv_instruction_at(void *p)
> +{
> +	u16 *parcel = p;
> +
> +	return (unsigned int)parcel[0] | (unsigned int)parcel[1] << 16;
> +}
> +
> +static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 insn1, u32 insn2, int patch_offset)

Maybe instead of 'insn1' and 'insn2' names we should use the names
'auipc' and 'jalr' to self-document which is which.

> +{
> +	/* pick the original auipc + jalr */

If we change the names, then the comment above could be removed.

> +	u32 call[2] = { insn1, insn2 };
> +	s32 imm;
> +
> +	/* get and adjust new target address */
> +	imm = riscv_insn_extract_utype_itype_imm(insn1, insn2);
> +	imm -= patch_offset;
> +
> +	/* update instructions */
> +	riscv_insn_insert_utype_itype_imm(call, imm);
> +
> +	/* patch the call place again */
> +	patch_text_nosync(ptr, call, sizeof(u32) * 2);
> +}
> +
> +void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
> +				      int patch_offset)
> +{
> +	int num_instr = len / sizeof(u32);
> +	int i;
> +
> +	/*
> +	 * stop one instruction before the end, as we're checking
> +	 * for auipc + jalr
> +	 */
> +	for (i = 0; i < num_instr; i++) {
> +		u32 inst = riscv_instruction_at(alt_ptr + i * sizeof(u32));
> +
> +		/* may be the start of an auipc + jalr pair */
> +		if (riscv_insn_is_auipc(inst) && i < num_instr - 1) {
> +			u32 inst2 = riscv_instruction_at(alt_ptr + (i + 1) * sizeof(u32));
> +
> +			if (!riscv_insn_is_jalr(inst2))
> +				continue;
> +
> +			/* call will use ra register */
> +			if (RV_EXTRACT_RD_REG(inst) != 1)
> +				continue;
> +
> +			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
> +							 inst, inst2, patch_offset);
> +		}
> +	}
> +}
> +
>  /*
>   * This is called very early in the boot process (directly after we run
>   * a feature detect on the boot CPU). No need to worry about other CPUs
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 694267d1fe81..e91ec3d8e240 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -316,8 +316,11 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  		}
>  
>  		tmp = (1U << alt->errata_id);
> -		if (cpu_req_feature & tmp)
> +		if (cpu_req_feature & tmp) {
>  			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
> +			riscv_alternative_fix_offsets(alt->old_ptr, alt->alt_len,
> +						      alt->old_ptr - alt->alt_ptr);
> +		}
>  	}
>  }
>  #endif
> -- 
> 2.35.1
>

Besides the naming nit which probably isn't worth respinning for

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
