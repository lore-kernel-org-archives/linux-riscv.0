Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B73C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Nov 2023 21:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hITWsCSimzgdVaJi9XoH88ezuzrPMKkUFkekGpplHnI=; b=t0wjcCqlUNMdPj
	Fl19E7OAOETl9O/Je5rhuR0BOBoCH1k8MLJYnnEJD6GEyjDFn8DbddfJahP1RE7V8QVzkMN/pi0NI
	p0eswTuJV0n/1zFrJ+NnGMrvuRgp5Z1FYB5KEaJWENh2e7J9wDxe2CAQ0RZ0sU2087dnPgcqdnV/b
	11Ky4l9XYwjWhYx2y8FjNYY39msTdtfSyDm7VxMH0RjwX7NB380hPR8KPsfPxwjqsajY4I29GvSBR
	Rv0nIzWJSf1yKDIQFdSsP1X8esSpMDrMlihtfiJJe7adVXCvKBLv2dqR5vp+ztWtxSHm5c0sYv/0z
	YKfK3YFmpmufL5LsNecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0TxJ-002TCU-1l;
	Tue, 07 Nov 2023 21:49:53 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0TxF-002TBL-2I
	for linux-riscv@lists.infradead.org;
	Tue, 07 Nov 2023 21:49:52 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6ce29d1db6eso73151a34.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Nov 2023 13:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699393786; x=1699998586; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9cnPkyoAwPK+jVS6+S43XhuubXzn4JzZxJpguJG5j1Y=;
        b=oChvmopVD0XHOfoO0cjOwtjCtu/peoOaYS8JhbiJHkBWQwgyH0895hlkNgSluyWYSG
         B2NBHuuZZQa7zx/0AFc38DiyO8ay11RrUVdmJd7znRvVnKMX8YfVbGWd5052xwHfBeZK
         ZJfWBPRFK02L2FM08bKnunterUezGv8Z3mgH7Q17YyR3J1BTyOjDL4Yf84+sIeWCyGha
         u82jmLoP/esteXVbLWdBdeMFiNdPR5YyDtUxSlb6+IpLd6oE6QlWK1RotG/LiC5fRTT1
         cBdW48TbA4PG6EwNpotavOS60xxUgBzrBbjQU/wdlm1qp7MNFT5yFrNYsmDFD6Oak9ib
         EJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699393786; x=1699998586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9cnPkyoAwPK+jVS6+S43XhuubXzn4JzZxJpguJG5j1Y=;
        b=TFJb/3bp3jPIRL1LtG+nTDPLGW3mJabWrTo/dUSTAErvNCLTn2gPqIEdCEYl6W+yC5
         6raqdLR8JrxkibYscgf6Zhkjl+LxS2KeUniSPOAGsa+91kYdILE/aUi5jH/vK2zOpvXh
         znDAQ3v8jjlRk7v358vG3jF1vuO+LmMpoZcn+fSsE2U0fphWTDt9QqvHPSNhaE1Wmrhp
         3Y8LgfWZ4cvleGsVRwlvk4/7ZkUwfNBqGKyetAjJNsreaF/utSRvPvZY3+lCp0bO6mJi
         2nwtqRyepU7Zh4jqNirH6Khu9zBFx8CwQHMpwWYoJiNQuaR+buDdohbpHaGtvolyatsq
         L7Eg==
X-Gm-Message-State: AOJu0Yx6/ynQoEUWa0h1afVZNkOm+C4i7gIeniw0n5AGnI7XptBNVLAw
	50yqPsfGkvdADCJ8p+xCOHPY9w==
X-Google-Smtp-Source: AGHT+IElCK+6XKu2Fb+QGs647xnr+icVdyvQRi9scmo+5xgKEf6+7yJVIRwe7/yU5xrsmClvpgY32w==
X-Received: by 2002:a05:6870:3124:b0:1e9:6a4e:6b56 with SMTP id v36-20020a056870312400b001e96a4e6b56mr2141225oaa.3.1699393785908;
        Tue, 07 Nov 2023 13:49:45 -0800 (PST)
Received: from ghost ([4.28.11.157])
        by smtp.gmail.com with ESMTPSA id c1-20020a056871034100b001ea4324364csm52587oag.12.2023.11.07.13.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 13:49:45 -0800 (PST)
Date: Tue, 7 Nov 2023 13:49:43 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: Don't rely on positional structure initialization
Message-ID: <ZUqw90codQ3csMtQ@ghost>
References: <20231107155529.8368-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231107155529.8368-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_134949_941434_C4BEFCCE 
X-CRM114-Status: GOOD (  18.77  )
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

On Tue, Nov 07, 2023 at 07:55:29AM -0800, Palmer Dabbelt wrote:
> Without this I get a bunch of warnings along the lines of
> 
>     arch/riscv/kernel/module.c:535:26: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
>       535 |         [R_RISCV_32] = { apply_r_riscv_32_rela },
> 
> This just mades the member initializers explicit instead of positional.
> I also aligned some of the table, but mostly just to make the batch
> editing go faster.
> 
> Fixes: 3bb2a41e5efd ("Merge patch series "riscv: Add remaining module relocations and tests"")
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
>  arch/riscv/kernel/module.c | 125 +++++++++++++++++++------------------
>  1 file changed, 65 insertions(+), 60 deletions(-)
> 
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 4b339729d5ec..56a8c78e9e21 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -532,69 +532,74 @@ static int apply_uleb128_accumulation(struct module *me, void *location, long bu
>   * This handles static linking only.
>   */
>  static const struct relocation_handlers reloc_handlers[] = {
> -	[R_RISCV_32] = { apply_r_riscv_32_rela },
> -	[R_RISCV_64] = { apply_r_riscv_64_rela },
> -	[R_RISCV_RELATIVE] = { dynamic_linking_not_supported },
> -	[R_RISCV_COPY] = { dynamic_linking_not_supported },
> -	[R_RISCV_JUMP_SLOT] = { dynamic_linking_not_supported },
> -	[R_RISCV_TLS_DTPMOD32] = { dynamic_linking_not_supported },
> -	[R_RISCV_TLS_DTPMOD64] = { dynamic_linking_not_supported },
> -	[R_RISCV_TLS_DTPREL32] = { dynamic_linking_not_supported },
> -	[R_RISCV_TLS_DTPREL64] = { dynamic_linking_not_supported },
> -	[R_RISCV_TLS_TPREL32] = { dynamic_linking_not_supported },
> -	[R_RISCV_TLS_TPREL64] = { dynamic_linking_not_supported },
> +	[R_RISCV_32]		= { .reloc_handler = apply_r_riscv_32_rela },
> +	[R_RISCV_64]		= { .reloc_handler = apply_r_riscv_64_rela },
> +	[R_RISCV_RELATIVE]	= { .reloc_handler = dynamic_linking_not_supported },
> +	[R_RISCV_COPY]		= { .reloc_handler = dynamic_linking_not_supported },
> +	[R_RISCV_JUMP_SLOT]	= { .reloc_handler = dynamic_linking_not_supported },
> +	[R_RISCV_TLS_DTPMOD32]	= { .reloc_handler = dynamic_linking_not_supported },
> +	[R_RISCV_TLS_DTPMOD64]	= { .reloc_handler = dynamic_linking_not_supported },
> +	[R_RISCV_TLS_DTPREL32]	= { .reloc_handler = dynamic_linking_not_supported },
> +	[R_RISCV_TLS_DTPREL64]	= { .reloc_handler = dynamic_linking_not_supported },
> +	[R_RISCV_TLS_TPREL32]	= { .reloc_handler = dynamic_linking_not_supported },
> +	[R_RISCV_TLS_TPREL64]	= { .reloc_handler = dynamic_linking_not_supported },
>  	/* 12-15 undefined */
> -	[R_RISCV_BRANCH] = { apply_r_riscv_branch_rela },
> -	[R_RISCV_JAL] = { apply_r_riscv_jal_rela },
> -	[R_RISCV_CALL] = { apply_r_riscv_call_rela },
> -	[R_RISCV_CALL_PLT] = { apply_r_riscv_call_plt_rela },
> -	[R_RISCV_GOT_HI20] = { apply_r_riscv_got_hi20_rela },
> -	[R_RISCV_TLS_GOT_HI20] = { tls_not_supported },
> -	[R_RISCV_TLS_GD_HI20] = { tls_not_supported },
> -	[R_RISCV_PCREL_HI20] = { apply_r_riscv_pcrel_hi20_rela },
> -	[R_RISCV_PCREL_LO12_I] = { apply_r_riscv_pcrel_lo12_i_rela },
> -	[R_RISCV_PCREL_LO12_S] = { apply_r_riscv_pcrel_lo12_s_rela },
> -	[R_RISCV_HI20] = { apply_r_riscv_hi20_rela },
> -	[R_RISCV_LO12_I] = { apply_r_riscv_lo12_i_rela },
> -	[R_RISCV_LO12_S] = { apply_r_riscv_lo12_s_rela },
> -	[R_RISCV_TPREL_HI20] = { tls_not_supported },
> -	[R_RISCV_TPREL_LO12_I] = { tls_not_supported },
> -	[R_RISCV_TPREL_LO12_S] = { tls_not_supported },
> -	[R_RISCV_TPREL_ADD] = { tls_not_supported },
> -	[R_RISCV_ADD8] = { apply_r_riscv_add8_rela, apply_8_bit_accumulation },
> -	[R_RISCV_ADD16] = { apply_r_riscv_add16_rela,
> -			    apply_16_bit_accumulation },
> -	[R_RISCV_ADD32] = { apply_r_riscv_add32_rela,
> -			    apply_32_bit_accumulation },
> -	[R_RISCV_ADD64] = { apply_r_riscv_add64_rela,
> -			    apply_64_bit_accumulation },
> -	[R_RISCV_SUB8] = { apply_r_riscv_sub8_rela, apply_8_bit_accumulation },
> -	[R_RISCV_SUB16] = { apply_r_riscv_sub16_rela,
> -			    apply_16_bit_accumulation },
> -	[R_RISCV_SUB32] = { apply_r_riscv_sub32_rela,
> -			    apply_32_bit_accumulation },
> -	[R_RISCV_SUB64] = { apply_r_riscv_sub64_rela,
> -			    apply_64_bit_accumulation },
> +	[R_RISCV_BRANCH]	= { .reloc_handler = apply_r_riscv_branch_rela },
> +	[R_RISCV_JAL]		= { .reloc_handler = apply_r_riscv_jal_rela },
> +	[R_RISCV_CALL]		= { .reloc_handler = apply_r_riscv_call_rela },
> +	[R_RISCV_CALL_PLT]	= { .reloc_handler = apply_r_riscv_call_plt_rela },
> +	[R_RISCV_GOT_HI20]	= { .reloc_handler = apply_r_riscv_got_hi20_rela },
> +	[R_RISCV_TLS_GOT_HI20]	= { .reloc_handler = tls_not_supported },
> +	[R_RISCV_TLS_GD_HI20]	= { .reloc_handler = tls_not_supported },
> +	[R_RISCV_PCREL_HI20]	= { .reloc_handler = apply_r_riscv_pcrel_hi20_rela },
> +	[R_RISCV_PCREL_LO12_I]	= { .reloc_handler = apply_r_riscv_pcrel_lo12_i_rela },
> +	[R_RISCV_PCREL_LO12_S]	= { .reloc_handler = apply_r_riscv_pcrel_lo12_s_rela },
> +	[R_RISCV_HI20]		= { .reloc_handler = apply_r_riscv_hi20_rela },
> +	[R_RISCV_LO12_I]	= { .reloc_handler = apply_r_riscv_lo12_i_rela },
> +	[R_RISCV_LO12_S]	= { .reloc_handler = apply_r_riscv_lo12_s_rela },
> +	[R_RISCV_TPREL_HI20]	= { .reloc_handler = tls_not_supported },
> +	[R_RISCV_TPREL_LO12_I]	= { .reloc_handler = tls_not_supported },
> +	[R_RISCV_TPREL_LO12_S]	= { .reloc_handler = tls_not_supported },
> +	[R_RISCV_TPREL_ADD]	= { .reloc_handler = tls_not_supported },
> +	[R_RISCV_ADD8]		= { .reloc_handler = apply_r_riscv_add8_rela,
> +				    .accumulate_handler = apply_8_bit_accumulation },
> +	[R_RISCV_ADD16]		= { .reloc_handler = apply_r_riscv_add16_rela,
> +				    .accumulate_handler = apply_16_bit_accumulation },
> +	[R_RISCV_ADD32]		= { .reloc_handler = apply_r_riscv_add32_rela,
> +				    .accumulate_handler = apply_32_bit_accumulation },
> +	[R_RISCV_ADD64]		= { .reloc_handler = apply_r_riscv_add64_rela,
> +				    .accumulate_handler = apply_64_bit_accumulation },
> +	[R_RISCV_SUB8]		= { .reloc_handler = apply_r_riscv_sub8_rela,
> +				    .accumulate_handler = apply_8_bit_accumulation },
> +	[R_RISCV_SUB16]		= { .reloc_handler = apply_r_riscv_sub16_rela,
> +				    .accumulate_handler = apply_16_bit_accumulation },
> +	[R_RISCV_SUB32]		= { .reloc_handler = apply_r_riscv_sub32_rela,
> +				    .accumulate_handler = apply_32_bit_accumulation },
> +	[R_RISCV_SUB64]		= { .reloc_handler = apply_r_riscv_sub64_rela,
> +				    .accumulate_handler = apply_64_bit_accumulation },
>  	/* 41-42 reserved for future standard use */
> -	[R_RISCV_ALIGN] = { apply_r_riscv_align_rela },
> -	[R_RISCV_RVC_BRANCH] = { apply_r_riscv_rvc_branch_rela },
> -	[R_RISCV_RVC_JUMP] = { apply_r_riscv_rvc_jump_rela },
> +	[R_RISCV_ALIGN]		= { .reloc_handler = apply_r_riscv_align_rela },
> +	[R_RISCV_RVC_BRANCH]	= { .reloc_handler = apply_r_riscv_rvc_branch_rela },
> +	[R_RISCV_RVC_JUMP]	= { .reloc_handler = apply_r_riscv_rvc_jump_rela },
>  	/* 46-50 reserved for future standard use */
> -	[R_RISCV_RELAX] = { apply_r_riscv_relax_rela },
> -	[R_RISCV_SUB6] = { apply_r_riscv_sub6_rela, apply_6_bit_accumulation },
> -	[R_RISCV_SET6] = { apply_r_riscv_set6_rela, apply_6_bit_accumulation },
> -	[R_RISCV_SET8] = { apply_r_riscv_set8_rela, apply_8_bit_accumulation },
> -	[R_RISCV_SET16] = { apply_r_riscv_set16_rela,
> -			    apply_16_bit_accumulation },
> -	[R_RISCV_SET32] = { apply_r_riscv_set32_rela,
> -			    apply_32_bit_accumulation },
> -	[R_RISCV_32_PCREL] = { apply_r_riscv_32_pcrel_rela },
> -	[R_RISCV_IRELATIVE] = { dynamic_linking_not_supported },
> -	[R_RISCV_PLT32] = { apply_r_riscv_plt32_rela },
> -	[R_RISCV_SET_ULEB128] = { apply_r_riscv_set_uleb128,
> -				  apply_uleb128_accumulation },
> -	[R_RISCV_SUB_ULEB128] = { apply_r_riscv_sub_uleb128,
> -				  apply_uleb128_accumulation },
> +	[R_RISCV_RELAX]		= { .reloc_handler = apply_r_riscv_relax_rela },
> +	[R_RISCV_SUB6]		= { .reloc_handler = apply_r_riscv_sub6_rela,
> +				    .accumulate_handler = apply_6_bit_accumulation },
> +	[R_RISCV_SET6]		= { .reloc_handler = apply_r_riscv_set6_rela,
> +				    .accumulate_handler = apply_6_bit_accumulation },
> +	[R_RISCV_SET8]		= { .reloc_handler = apply_r_riscv_set8_rela,
> +				    .accumulate_handler = apply_8_bit_accumulation },
> +	[R_RISCV_SET16]		= { .reloc_handler = apply_r_riscv_set16_rela,
> +				    .accumulate_handler = apply_16_bit_accumulation },
> +	[R_RISCV_SET32]		= { .reloc_handler = apply_r_riscv_set32_rela,
> +				    .accumulate_handler = apply_32_bit_accumulation },
> +	[R_RISCV_32_PCREL]	= { .reloc_handler = apply_r_riscv_32_pcrel_rela },
> +	[R_RISCV_IRELATIVE]	= { .reloc_handler = dynamic_linking_not_supported },
> +	[R_RISCV_PLT32]		= { .reloc_handler = apply_r_riscv_plt32_rela },
> +	[R_RISCV_SET_ULEB128]	= { .reloc_handler = apply_r_riscv_set_uleb128,
> +				    .accumulate_handler = apply_uleb128_accumulation },
> +	[R_RISCV_SUB_ULEB128]	= { .reloc_handler = apply_r_riscv_sub_uleb128,
> +				    .accumulate_handler = apply_uleb128_accumulation },
>  	/* 62-191 reserved for future standard use */
>  	/* 192-255 nonstandard ABI extensions  */
>  };
> -- 
> 2.42.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
