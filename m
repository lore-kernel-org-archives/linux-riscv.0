Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6725CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 14:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J+kD/j6jlLVHsxY5h68s97xuk5AvZbuQqgg7svPcYCU=; b=vyV1Lmy/qABWtp
	9kgVkc0mj46ZtIVWISmclyi0yhJtqXv0yNfzl/EOmNLkQovcrXRcqabqSHoXeKSfTt2yfJOGfTi9o
	AfjEEEoAktrnUqouyjPBADkFW7P9D5ey/FgJhu2lkbwQaFifByQ2N50/bGyXvVbtAxNlMdb8JLTDC
	OfHhUv1rx+81X3fpS+lTlP34n5Ev5VIzMTRRGLlLn38e2irhdiaCcXIFQ74wEua81nFFW3EXW3gfu
	ByLJc8ukEmicGhJXNyWYS9gpfxQTlED2qEYFQv85BjwxtSSkZYSd7ItzAECw7hp4dIG/88mkCT7mv
	w3epzw4qq2exXHDUDE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3I2Y-001zaU-PW; Thu, 08 Dec 2022 14:38:22 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3I2U-001zUg-MK
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 14:38:20 +0000
Received: by mail-ej1-x634.google.com with SMTP id gh17so4531265ejb.6
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 06:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tEOwSnpY70i+BweardHXcLCGD1e9YgWr7mQBrpwxPEI=;
        b=AxY3tG2aOysE6jfzGh3sWvJtFaRz30ewv5desK2uZRW6e1LQXMVXOXqKBWkLHiHAW3
         ngP5Bx0qV2tsw8VfXbn7A22PYyUENzXrlQ3Z8jW4b4obW1zNE5vw5xl2cGywsXi0jGKN
         ld+ocSuQ/ITRB6BdP/4EjnIHWZnPoo5OBJn7YUCSQPpitFV32I4s8be5UBcpUULpJr8A
         5catkeGSuBt/qBOz4FGhpsA+EvnMLfkLSOTpUD+jy2/7cu+uPbXwSnatl8dpMDAelvHc
         8u4gSTAUOV/j3RBXtAC/CxRQRJuQj6CcSkS9Pt47aD1Ry8y/FsWyYqAgxv92HXDDPoic
         HwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEOwSnpY70i+BweardHXcLCGD1e9YgWr7mQBrpwxPEI=;
        b=fXgf0icL0N73flza2hZy0OMnNDsXia2MJ4gy9ZuqF2Sgxk4r0tpzTKMIE/6nMyAbTn
         zQDJmWkyeHGSfdza3eDDDFs4xLs392A2JV/HaI2c9UR7B6ZdWHo8dYzzS9L4aB8KmuJC
         qhC+UArILytwdgjnASiiuYhxiER9w+N1eYzpRoWQxGxfxEnUzUC9xsWgCvz7g5TIoskV
         wbzUTKoOXBTKRYAQ/SQSvcq87PS86DYSGVxG0/iHd/xsfL3Z3N9RFjXj2PZIMyivY5zy
         0GlPUB6E4eAJHc04n7arL5yNEGWwM44qEjI/jKu8P/ktunBexrwKM++6KpUEa3XvZbT9
         s37g==
X-Gm-Message-State: ANoB5pm1tOiM44pEfl8ZMXI2NJ5aCaEE2XW3gcS1adH+VbY9FBJYCop7
	MRekOh5STUjbMkE0GcVqLuR9WA==
X-Google-Smtp-Source: AA0mqf6RQUusjFo0VgPCznvIxsNN0CB+LPmWG15SdzeLDKaWTZNWrrHFlTBhKnFnmoNs9BoRH7HsTQ==
X-Received: by 2002:a17:906:2449:b0:7c0:f44d:984 with SMTP id a9-20020a170906244900b007c0f44d0984mr2196040ejb.74.1670510293253;
        Thu, 08 Dec 2022 06:38:13 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-748-2a9a-a2a6-1362.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:748:2a9a:a2a6:1362])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b007b8a8fc6674sm9773763ejh.12.2022.12.08.06.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 06:38:12 -0800 (PST)
Date: Thu, 8 Dec 2022 15:38:11 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, prabhakar.csengg@gmail.com,
	conor@kernel.org, philipp.tomsich@vrull.eu,
	emil.renner.berthing@canonical.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 11/12] RISC-V: add helpers for handling immediates in
 U-type and I-type pairs
Message-ID: <20221208143811.tluvayxdc5g4bw3e@kamzik>
References: <20221207180821.2479987-1-heiko@sntech.de>
 <20221207180821.2479987-12-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221207180821.2479987-12-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_063818_774926_1F2540FC 
X-CRM114-Status: GOOD (  23.55  )
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

On Wed, Dec 07, 2022 at 07:08:20PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> Used together U-type and I-type instructions can for example be used to
> generate bigger jumps (i.e. in auipc+jalr pairs) by splitting the value
> into an upper immediate (i.e. auipc) and a 12bit immediate (i.e. jalr).
> 
> Due to both immediates being considered signed this creates some corner
> cases, so add some helper to prevent this from getting duplicated in
> different places.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ---
>  arch/riscv/include/asm/insn.h | 47 +++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 2a23890b4577..bb1e6120a560 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -290,3 +290,50 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
>  	(RVC_X(x_, RVC_B_IMM_5_OPOFF, RVC_B_IMM_5_MASK) << RVC_B_IMM_5_OFF) | \
>  	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
>  	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
> +
> +/*
> + * Put together one immediate from a U-type and I-type instruction pair.
> + *
> + * The U-type contains an upper immediate, meaning bits[31:12] with [11:0]
> + * being zero, while the I-type contains a 12bit immediate.
> + * Combined these can encode larger 32bit values and are used for example
> + * in auipc + jalr pairs to allow larger jumps.
> + *
> + * @utype_insn: instruction containing the upper immediate
> + * @itype_insn: instruction
> + * Return: combined immediate
> + */
> +static inline s32 riscv_insn_extract_utype_itype_imm(u32 utype_insn, u32 itype_insn)

Might be nice to keep the interfaces of these two complementing functions
consistent by taking a u32 *insn here, like below. Or, below, taking
&utype_insn and &itype_insn, like here.

> +{
> +	s32 imm;
> +
> +	imm = RV_EXTRACT_UTYPE_IMM(utype_insn);
> +	imm += RV_EXTRACT_ITYPE_IMM(itype_insn);
> +
> +	return imm;
> +}
> +
> +/*
> + * Update a set of two instructions (U-type + I-type) with an immediate value.
> + *
> + * Used for example in auipc+jalrs pairs the U-type instructions contains
> + * a 20bit upper immediate representing bits[31:12], while the I-type
> + * instruction contains a 12bit immediate representing bits[11:0].
> + *
> + * This also takes into account that both separate immediates are
> + * considered as signed values, so if the I-type immediate becomes
> + * negative (BIT(11) set) the U-type part gets adjusted.
> + *
> + * @insn: pointer to a set of two instructions
> + * @imm: the immediate to insert into the two instructions
> + */
> +static inline void riscv_insn_insert_utype_itype_imm(u32 *insn, s32 imm)
> +{
> +	/* drop possible old IMM values */
> +	insn[0] &= ~(RV_U_IMM_31_12_MASK);
> +	insn[1] &= ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
> +
> +	/* add the adapted IMMs */
> +	insn[0] |= ((imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1));
> +	insn[1] |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
> +}
> -- 
> 2.35.1
>

Otherwise

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
