Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECE8C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 08:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sLrr2WLL/hCnn10h8V0+j0f293CwsfvxZ4mmo8f7Wuc=; b=dkfJH66oUWdvdf
	iB3r15xgTox/YcHTnjQPPvo7XHpHGfnS1BtzyWKqx15ziLrviYj8ek0goo/WLLI4re46oQuWOnyU8
	YRkEK/Gw5ancuRpmXJX2e0aNMRR5JbAcbePZrrTMhzyy8E0fO/DiKVojtPA/Tq2+ih0KTzHkl13rM
	PV77GG3ZdzwwatF109thq5b+kihw9tDDps3HniUhaixqbkEUmBAb+9gbOfQvv98+qoNhmsDp59Kvd
	V4YLBx+klaYr+/PhEWPU/4YYyQOfmlj59HJjCvefRlbsZcETuQHdhDVJHipBcJ8EXn1al7sUBYytg
	VRpGBJHo31rmo/m8c7Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAFR-005sWm-DE; Tue, 10 Jan 2023 08:44:45 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFAFE-005sMz-RZ
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 08:44:34 +0000
Received: by mail-wm1-x332.google.com with SMTP id o15so8199245wmr.4
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jan 2023 00:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKXhZEJvQ6GFIGiCrOy6IFi9XwUrkz/m7Tf2uaEICDI=;
        b=eW4E8MlhrXZFcJyXVEjE1p4kRWNOWCDIjujxitqk6d0KzqnZXh8KzVD2UK1i78BrsH
         XGhYC4o3o/564OJkzckzPc3bXTG3kkxAqVuFb//WjVIsfUq4+X99rFLqCXk82lOtg9UC
         1fEHkXGMiEtA4XdHUEpCHBG3snUl/LNJYU5/ioAvSw9c9u8YkE1EqpoyT9emibpQEhXR
         hEAHn9VFBLMqhSBQsQgydyrbs221sMP6dkRmQNsdnBkFyMhzdY+hEU++gvMuwHbNQL4C
         U9b5K0UeGoow+4/i8TqggJW6FVcPoZtYrVirNwY4GM+m91RzjXT3LjSQEtbpG/bjorkq
         McMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKXhZEJvQ6GFIGiCrOy6IFi9XwUrkz/m7Tf2uaEICDI=;
        b=zVBV6jd0J1N0Ykd2lxUerCByTajKOowB6Afepe0+eC9BvsSROIbVNVwG4itxJXIgNy
         PMh1nqYn+dqJhf9VlOPm4tmMC77YEda9ddZVJ6n9FrAzO4BMz5lzJjlBQEq/bjSx+rFe
         XpxJJ7/k70H7TOeAygitgYQWG5U1+3DAjwGl1zRZ3ZxmD8SWHmaYQvAI0HMmLfnexzqb
         +ZF+xlogJKRneD0hjZyPvVrbg1hPboA3R+XegyEwKVCWbt8pSS5umZhLtk0jrdTmSJ2v
         7NS3c8ReJ1QhdHj80TzohTysEfuwuMa3wpnZo9HDVEkpIVIes3g8KIjg1IRYjlosOa2o
         AsWw==
X-Gm-Message-State: AFqh2kq6YdjKJLuUmxgeGbFbcMsChfJwHh2GYPdTEDJhPGPVli+capHr
	Irhr49CVlyJ4Cb1y9OfcCMig93abuZmmudQF
X-Google-Smtp-Source: AMrXdXvsi+asmo2jHR0CrrPuc+jmd7jMqNhajr6AxKzrYv302Mo/+yfFw5t0sD9JazKMSTG/yk4EbQ==
X-Received: by 2002:a05:600c:3507:b0:3d9:f8a1:710d with SMTP id h7-20020a05600c350700b003d9f8a1710dmr1082253wmq.6.1673340266688;
        Tue, 10 Jan 2023 00:44:26 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05600c3caa00b003b4cba4ef71sm21447657wmb.41.2023.01.10.00.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 00:44:26 -0800 (PST)
Date: Tue, 10 Jan 2023 09:44:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, conor@kernel.org,
	philipp.tomsich@vrull.eu, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 2/5] RISC-V: add helpers for J-type immediate handling
Message-ID: <20230110084425.wupytnd5juzowzme@orel>
References: <20230109181755.2383085-1-heiko@sntech.de>
 <20230109181755.2383085-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109181755.2383085-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_004432_922804_4ACF369B 
X-CRM114-Status: GOOD (  22.38  )
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

On Mon, Jan 09, 2023 at 07:17:52PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Similar to the helper for the u-type + i-type imm handling, add helper-
> functions for j-type immediates.
> 
> While it also would be possible to open-code that bit of imm wiggling
> using the macros already provided in insn.h, it's way better to have
> consistency on how we handle this across all function encoding/decoding.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 0455b4dcb0a7..9eea61a3028f 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -301,6 +301,32 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
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
> +	*insn &= ~GENMASK(31, 12);
> +	*insn |= (((imm & (RV_J_IMM_10_1_MASK << RV_J_IMM_10_1_OFF)) << RV_I_IMM_11_0_OPOFF) |
                                                                        ^ RV_J_IMM_10_1_OPOFF
									(as pointed out by Conor)

> +		  ((imm & (RV_J_IMM_11_MASK << RV_J_IMM_11_OFF)) << RV_J_IMM_11_OPOFF) |
> +		  ((imm & (RV_J_IMM_19_12_OPOFF << RV_J_IMM_19_12_OFF)) << RV_J_IMM_19_12_OPOFF) |
                           ^ RV_J_IMM_19_12_MASK


> +		  ((imm & (1 << RV_J_IMM_SIGN_OFF)) << RV_J_IMM_SIGN_OPOFF));

nit: can drop the outermost ()

> +}
> +
>  /*
>   * Put together one immediate from a U-type and I-type instruction pair.
>   *
> -- 
> 2.35.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
