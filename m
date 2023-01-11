Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38915C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 17:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zpcTAtBOFdVjM3fJuDXpxMc016tPZCAYwTlzh72tcvo=; b=kLvsHGZo752VbJ
	n7SEZDLlgAJR2vrjpkJ384fszavtptvITTk/9XFs0YHC9gcOkaZ3/cODFDL1JPGU89ZNi0O5yVyyo
	VqilTBtFtIdnkMq/U6mh8+3UyILixkAIEwIXa2Gumh+mkjv47+lEzsw2UkLuxtaBRmBHym0UwZ2EM
	clZwKnJ8v1/+zZSTLkbzyiDUSTPR8TNUpbqELdjJ+ecHd8qRUkR0Ff4e06T3DoFLKHPQcmnc95NvZ
	f1WjIgMwhOE0k8jTnG0Te+XpcPoUOw1hByVHhY5BqmZ4wvZOBfPjc9LXwCoppcmLwm+//2FAToHlt
	RnyY/niOkwP5S/qpdfkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFfKq-00CXgN-HQ; Wed, 11 Jan 2023 17:56:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFfKm-00CXeJ-J9
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 17:56:23 +0000
Received: by mail-wr1-x430.google.com with SMTP id k8so1374199wrc.9
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jan 2023 09:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iATtwX45ufevzGDCQk6FprOJLywVs059/Zoh+UqczYk=;
        b=oHmNoS5cGMmc4TMWWpwfbgeQ0tDKdN4IhHoVwR8mNEI0Apy9bv+5hVi4JYXKYlzaoN
         UWkNzMkI8H/sPR1qDuxOUdv2Na+csxtsLqVWd62z8U6urrXwYkcGbwGjf/7hCW4AKFQm
         EaT0pHS+rJ7NtVH9/wC8elXCHT0D5AHVPufa2gQhUXePqahPkaX+JqSuqs1qnftV5BLg
         f3zkMVLgVNvaDCh61ZnLDK6QugohhnwOPYWE6IxKQaW5LwmwY7hRNmhhiD7SAb5lVY9Q
         FJ6/K6MhV/8l1/scnfsGPmFMIfOG183LDroX+o01Bp9nC+4T090vIPN33+X23vZHo8Hr
         dsAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iATtwX45ufevzGDCQk6FprOJLywVs059/Zoh+UqczYk=;
        b=Fb2YYTNOnJxh3+1reXGOEV0gLiDTRzqypsH5tNs0TsVCf59rMzh0fbwal4gJtDUthQ
         bMZ0Bg3IKtKEQtx72lrgp8NcUzUGhE0xsO4q1Jc/yPn2CFJwEh8BaI+vIN/H1K/nohaa
         /iw7dqlglPZF4s6Q+LpUcbSLVX8x2wWpS0Swt0OzPEwvdSSCWNqKoB3BDrAEEPd2rHfz
         uqfNw7GNsfLGG+Eduky3xxawW2ffPWKFVf9U3bcKHoArpgXxSAALygK0U+fOrZk2GvLo
         gf1RW9Rt6S561tubRRMgf1YC4Rd/X7EFq/V5s73aPpF/vfNcgOQ1cpT98MLasA/4wm7C
         A8yA==
X-Gm-Message-State: AFqh2krCDom11nfuEg3BNpxBY5xkDaduGDS12DVeeJ7L4rL58YgN0IHl
	KIkliHfPSwD73dFmBreoH6FI3A==
X-Google-Smtp-Source: AMrXdXtF/CJ1z+mSVHqSfXPznFXga6/+3peruKnsc6Yyigv0V5rinWx4z34Y3uC7wHeAaIrU2EeLyA==
X-Received: by 2002:a5d:5592:0:b0:2a2:4313:e880 with SMTP id i18-20020a5d5592000000b002a24313e880mr15167085wrv.61.1673459776750;
        Wed, 11 Jan 2023 09:56:16 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id c13-20020adffb0d000000b00241fde8fe04sm14243618wrr.7.2023.01.11.09.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 09:56:16 -0800 (PST)
Date: Wed, 11 Jan 2023 18:56:15 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v3 01/13] riscv: fix jal offsets in patched alternatives
Message-ID: <20230111175615.p7vpq6joyrzomcmz@orel>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230111171027.2392-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_095620_652443_B83D4E20 
X-CRM114-Status: GOOD (  23.51  )
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

On Thu, Jan 12, 2023 at 01:10:15AM +0800, Jisheng Zhang wrote:
> Alternatives live in a different section, so offsets used by jal
> instruction will point to wrong locations after the patch got applied.
> 
> Similar to arm64, adjust the location to consider that offset.
> 
> Co-developed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/insn.h   | 27 +++++++++++++++++++++++++++
>  arch/riscv/kernel/alternative.c | 27 +++++++++++++++++++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 98453535324a..1d2df245d0bd 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -291,6 +291,33 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
>  	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
>  	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
>  
> +/*
> + * Get the immediate from a J-type instruction.
> + *
> + * @insn: instruction to process
> + * Return: immediate
> + */
> +static inline s32 riscv_insn_extract_jtype_imm(u32 insn)
> +{
> +	return RV_EXTRACT_JTYPE_IMM(insn);
> +}
> +
> +/*
> + * Update a J-type instruction with an immediate value.
> + *
> + * @insn: pointer to the jtype instruction
> + * @imm: the immediate to insert into the instruction
> + */
> +static inline void riscv_insn_insert_jtype_imm(u32 *insn, s32 imm)
> +{
> +	/* drop the old IMMs, all jal IMM bits sit at 31:12 */
> +	*insn &= ~GENMASK(31, 12);
> +	*insn |= (RV_X(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
> +		 (RV_X(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
> +		 (RV_X(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
> +		 (RV_X(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
> +}
> +
>  /*
>   * Put together one immediate from a U-type and I-type instruction pair.
>   *
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index 6212ea0eed72..3d4f1f32c7f6 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -79,6 +79,21 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
>  	patch_text_nosync(ptr, call, sizeof(u32) * 2);
>  }
>  
> +static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
> +{
> +	s32 imm;
> +
> +	/* get and adjust new target address */
> +	imm = riscv_insn_extract_jtype_imm(jal_insn);
> +	imm -= patch_offset;
> +
> +	/* update instruction */
> +	riscv_insn_insert_jtype_imm(&jal_insn, imm);
> +
> +	/* patch the call place again */
> +	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
> +}
> +
>  void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
>  				      int patch_offset)
>  {
> @@ -106,6 +121,18 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
>  			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
>  							 insn, insn2, patch_offset);
>  		}
> +
> +		if (riscv_insn_is_jal(insn)) {
> +			s32 imm = riscv_insn_extract_jtype_imm(insn);
> +
> +			/* Don't modify jumps inside the alternative block */
> +			if ((alt_ptr + i * sizeof(u32) + imm) >= alt_ptr &&
> +			    (alt_ptr + i * sizeof(u32) + imm) < (alt_ptr + len))
> +				continue;
> +
> +			riscv_alternative_fix_jal(alt_ptr + i * sizeof(u32),
> +						  insn, patch_offset);
> +		}
>  	}
>  }
>  
> -- 
> 2.38.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
