Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C33EBC47089
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 14:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9eQiukUIbFlvdSRZLiT6SNc5M3h7yX8U2sFNih/P0LA=; b=KqtwZnA5xcFK25
	CT+7oMx6GNZO20P5SsuGqr8y/Uxyugys4WPEd0dk3ZWDaFW5WZRmphurkduUbWHdk7XqjiZ1WpCIZ
	KtKtwPCbhq7IJGqqvh8FoGoIf68Tcwq5xoyaaq0yCBb85CYtnWXxW5QnZY7fVZ2Zf6tgmPuqIgGvg
	RMVoSBHtCeUBcPPoGQ2Lh1cO+wABEO3JKrKlkXERjBcKFExruv5vBs+ZQuW1Npnd6MCK1Q5Mjl9MW
	aiSgWRgo59CHgSihzcbKpYyLbxHFcO1+pMCirv9o+8XknmFKfv12vI39pX6YF6dwR0AC1XLVSeuuj
	6ZFiztJrit/eJCEmXcow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CuC-004LpF-Nf; Mon, 05 Dec 2022 14:57:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Cu9-004Lg7-SP
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 14:57:15 +0000
Received: by mail-ej1-x629.google.com with SMTP id vp12so28439553ejc.8
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 06:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YavQRn8ABNnl6VLXMYcIqKWjcCYjTfj3xzmJuUcqTc=;
        b=bHkTvgpAVQT205acFfyNmm1rOtDvyKoT0fEnfw3WP4KnXTzCnwSOalRlsqnWkr2D6n
         YceU4iZ3HR4uOrb/DqUtQkDpgBxSA236XsCjo6IG1n4k7PR1+g9yTIevGx+O1H7G2YuG
         bBV/nB6s7FsazZnXq1wngyGmw9eIgjL6++jHhz6iwVQq/+0PixDk/7NpJg0aGTbe67il
         CZiWHSCPQA1oAEpvwZ2JaoO0lajrqbZj5Vs43Xrg90TqF58w5WNpnjMXCnF9kH+XMMK2
         /Qx7FTqAcYs30IaHEFtWliEtZxmjth3Pi8j4RbxFw4eQxKDfe3+iuc2WGcHxa32Nfb1b
         Qceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YavQRn8ABNnl6VLXMYcIqKWjcCYjTfj3xzmJuUcqTc=;
        b=KjSmla36wy7CupRgORRBnN2EdJMc9UQC7h9ygejHLIxrK8s0k/YxBdZbIs59MazKNC
         lhlJkpA3uag1s3EV0Zxd1ij23/MdEuK/ls6Uu952trYG6rCgSZ8LozXtZ7zWMynJJwxk
         FoWUDt+eYVuMJ0cYRfN3ONfcyk0jwvraf9RaXhbM9Tu0EUy1tlam+4yHiYKZF5hBcps8
         FRPQfIJ2NB7W+Ghsi8pcuE+0OyKfCuklUAvOM++9SeElwoY+54G0Px4z6gyWs31KsDjY
         PEQ5nFgKKB8dT8BzeWbplAninlVRjbJFqPyqOrcQbD7l9A4U0WnycN+VgtsopjFAr2Oo
         IzOg==
X-Gm-Message-State: ANoB5plQYn2q0BCFFaRTUkM9KlTpDjxIMw5TtJc+K81zbHFxdVCnz0cR
	go5Biv6kI29ZUvJF5EmLPmm85tGJSEEar+Ov
X-Google-Smtp-Source: AA0mqf4Qe5/y8pAKeMPpbuflQ6QNpod32NOLuouIvb3mtnoBiuFhmp9x7E1KYexhFn8/9rItbper9w==
X-Received: by 2002:a17:906:a0d7:b0:7b2:7af0:c231 with SMTP id bh23-20020a170906a0d700b007b27af0c231mr27245234ejb.240.1670252231113;
        Mon, 05 Dec 2022 06:57:11 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id kw26-20020a170907771a00b00783f32d7eaesm6264724ejc.164.2022.12.05.06.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 06:57:10 -0800 (PST)
Date: Mon, 5 Dec 2022 15:57:10 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <20221205145710.xzb4prrc44gv7mwm@kamzik>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221204174632.3677-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_065713_939323_9B3D789B 
X-CRM114-Status: GOOD (  25.21  )
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

On Mon, Dec 05, 2022 at 01:46:20AM +0800, Jisheng Zhang wrote:
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
                                                                 ^ RV_J_IMM_10_1_OPOFF

> +	 ((value & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) | \
> +	 ((value & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) | \
> +	 ((value & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF))

Should put () around value

> +
> +void riscv_alternative_fix_jal(void *alt_ptr, unsigned int len,
> +			       int patch_offset)
> +{
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

It'd be nice if this had a define.

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
> -- 
> 2.37.2
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
