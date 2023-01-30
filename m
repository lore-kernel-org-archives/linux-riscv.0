Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46431C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpP7kgWYhwSWXFsfTzbCkluSYPXoB38uvLbkogo1jps=; b=HU1dSgo8dmRRv6
	dhpekKV0LM4ryPM5GewkGsGeVUfNP7Xfqw/BtqXOQCM4A6jDy4wFOZMifJo3ctrCwDcGuE6w7qYAp
	2ulJa681puwZGFaRyU0ihFHMq6VMhAklmNPV9567bgE/0d5QXxcs8a+Py6DMOqIxPKDs7yZueflWh
	yR+RtteeKGLKWkk3oUgrRJwTYvr5sJIQ+Gz1wqHN87QjIdAZSUz12jO/UhuZJ3yu5nvLKd4cZjZ9E
	kGjECHFyudzCBSLQQtZvaV/LqZtK6Yif5Zhg0TshYxd5HHhXnKp3gKxUAL8RitBrgmXuEYIDlA2Ei
	GiBkVcGY9aUiK2ccvFuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOhh-002YwW-DM; Mon, 30 Jan 2023 07:35:49 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOhN-002Ytb-39
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 07:35:30 +0000
Received: by mail-ej1-x634.google.com with SMTP id k4so23606686eje.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 23:35:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OfETmmTJA09Tb8AAwAjfmJEnkRVB5Nh/ahlNcOn6vxY=;
        b=bjsmp1isU6JeAyrPafl3L1U7DNfyVJ7sYRyXRrE175aiUI/2CCvT/1eEPaazv+Yvzr
         S9bALfsn3Avv4bySMBtGJatKPejwOhl+czAR/5MK8owIcHVcO+iJxhQlUsEphQKEmvr9
         qwccWMUAb/DZhHCV04CXpw+sWhMP7GMgxlJgR9N9C5fWL0w09jzUNwW7UgpROjh8B6jP
         enUmx4jwCpVvP6iE6SHIlSjY/IY91awleHYf9FH6Tm/OqR27bvT+ncEwTotfB83eVEzL
         2nLYs3US7r4z75czWDIsrpgGbpMJ5mLuT3lFccdiyZ78NkRfVLlncKUWIGetayjrelFN
         f9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OfETmmTJA09Tb8AAwAjfmJEnkRVB5Nh/ahlNcOn6vxY=;
        b=wmx0FyM5L+cT0Aw5mLjNGD6wD1251p2/+2Ouixtywij/2PkOk6mwqOkGgDIHMTfGYg
         QrJfkBLOOwqdCgkxpudX0ZPNNOKc0wWF6Jb12x2+u5oiIgmGaXZMLwuRFy2b2GbY0lcA
         2GnpG3RA9QmJ14zIqhHvaU721UTXbT1ofXOEebgxuupfF757vQBwxR8PBmm21LEMgrPq
         WtqfJ1882GYzcJYLwPzszkTupKAo26RZcc0t+juDd3wqDnYZRAF8opGa22U9tE9+TBJq
         O6MGuKsCK8XaHZZcQG/sjSlfNBvE7xA+aS5Dg+tzprI/SrUry1RQRyKfhChR73e/lOj+
         fh4g==
X-Gm-Message-State: AO0yUKXficBS/zHSm5kIBIlaL43ZrlFCBi30X7uxXuAVcHDtEGf9BJZv
	hdE1bapYu1wwrvoo9VjFuyT3rA==
X-Google-Smtp-Source: AK7set/t4Qk5zw1F0DdvwAEi9Iqv8vsi6/do+RC5b14yJow5+FclmrhKfP/nnQ4XMUHXQu9DxceuHw==
X-Received: by 2002:a17:907:785:b0:88a:bb13:7329 with SMTP id xd5-20020a170907078500b0088abb137329mr208029ejb.53.1675064123856;
        Sun, 29 Jan 2023 23:35:23 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id fy37-20020a1709069f2500b0087fbf72175csm4050800ejc.103.2023.01.29.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 23:35:23 -0800 (PST)
Date: Mon, 30 Jan 2023 08:35:22 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Liao Chang <liaochang1@huawei.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	heiko.stuebner@vrull.eu, prabhakar.mahadev-lad.rj@bp.renesas.com,
	conor.dooley@microchip.com, jszhang@kernel.org,
	vincent.chen@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Add header include guards to insn.h
Message-ID: <20230130073522.ivv2izzayouhw6dm@orel>
References: <20230129094242.282620-1-liaochang1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230129094242.282620-1-liaochang1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_233529_157492_0D8DBD59 
X-CRM114-Status: GOOD (  15.60  )
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

On Sun, Jan 29, 2023 at 05:42:42PM +0800, Liao Chang wrote:
> Add header include guards to insn.h to prevent repeating declaration of
> any identifiers in insn.h.
> 
> Fixes: edde5584c7ab ("riscv: Add SW single-step support for KDB")
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  arch/riscv/include/asm/insn.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
> index 25ef9c0b19e7..22c7613bfda3 100644
> --- a/arch/riscv/include/asm/insn.h
> +++ b/arch/riscv/include/asm/insn.h
> @@ -3,6 +3,9 @@
>   * Copyright (C) 2020 SiFive
>   */
>  
> +#ifndef _ASM_RISCV_INSN_H
> +#define _ASM_RISCV_INSN_H
> +
>  #include <linux/bits.h>
>  
>  #define RV_INSN_FUNCT3_MASK	GENMASK(14, 12)
> @@ -365,3 +368,4 @@ static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype
>  	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
>  	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
>  }
> +#endif /* _ASM_RISCV_INSN_H */
> -- 
> 2.25.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
