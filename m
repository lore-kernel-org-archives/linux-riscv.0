Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B91C38142
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hrkN/NKN0/j9kOHkxHTW38gEtf8yZhTlYrh9V5LOg6k=; b=ZkebKiVycoA0Zq
	Cy7eO1/wk+mS/8R95WappAlrc90pVMSlmsCGLQqAaXjtOn3dHE1L05Rmpihs0sdmQASunEPJd/ptw
	pO6QeIaWVtK7Ajv3JpWTUvJknCIJv1O2KYphrHIKdl1qXYaUyGevI+Yv5+7dj4XI0xgia3am4Uh6j
	LRTQWrh8UrE8LYpfjswqr8fQyuqOHnWNiq3MgIT0IE+l13QmWeAjOSMTXf2NSE4pEKaMFvFCGlIEX
	ow5MItN0ODO8PV1cNSyjWnqXm+lmTXY+IHPrtol/7RKSS9tnriKHfzAQB/oonKRJMbqld+X8SJfiL
	Vk2clkTHdZiLzmHsLLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIQYG-0047x2-5L; Thu, 19 Jan 2023 08:45:40 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIQYD-0047wP-OB
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 08:45:38 +0000
Received: by mail-ed1-x52c.google.com with SMTP id x36so1913033ede.13
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 00:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MetS4zEUaxTfPd/u3Ip9L5fgpunrgvS3jQ8pBOXt1mM=;
        b=PP4FgTsOX7M7u20b3L0El1yV5cE65Y86ooftaSLBpFPeygfOBLHIFCEch+eqAzHbFB
         5r0a/kFOb8+5d+yu2OKxVCujxhqNuLnmyCFaAAd4NyNUpRK36cBTvSVcidxbwUtOgySf
         xj2wcJ5VQSlf6Vx0E0DCZdtAo/ySP8fWsI+kF1jeGt7GP7FtwiTKqoe2fKK1DFG5FL+b
         UGKgfmyHdXDLSqsxVXbRonqHuXFo9rtSj607TajE1MU9StjF3BsitnybzgVBUMfjpeZn
         0GPQSuryTGCAABSm7vZJgi56f2oc3MR6L56nwBqq4SLkfmOtXDTTiye53dw78LDPG0RL
         9Ocg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MetS4zEUaxTfPd/u3Ip9L5fgpunrgvS3jQ8pBOXt1mM=;
        b=ETVRFh+KapceHyMLzCT1coNXNncrHGqMDH+v5eG/cZudFtdJONDMDs9lOuJf1ZWlZw
         aO0pXU27qMU+Xr4AKj60LUj1ZX7E6jCQyZdrbT74Iw2xx7kH97pCQfV6Z2qEmJh+dTMr
         2qWK2Gu06HLQbJRl5TbDSXadURNmBPAFf1uoDpYF3wMDDPiMEx4zUlc9Zpgxcxylka7l
         z5Xh2FuXKdWAgJMtRMFiD6a0fkInOHSS4iruiEYriPZ8bWeAM0xmfmOjcbKgv2zAjCKR
         EtWKvvHLGGdmfnyhZxfNI2MKnx1s1aRZhmbYa9GJOOrjv7yu007IN8i50v4SCnLHE5Wt
         TfHA==
X-Gm-Message-State: AFqh2krbU8DX2YTadKjPJ7L9UlKiRfH89gAigUm5W2sfSzsYomNOm+Py
	lZ5ziM3aoBNKy9vSP2Z4eF9hLw==
X-Google-Smtp-Source: AMrXdXs2xG8hVYhIa1aU3CZbotbYriwT0Cnx4/lLKT7ZPgtBxrr5nbaBghkK/Mu1CsMf1UZNzrngLw==
X-Received: by 2002:a05:6402:1ccc:b0:49c:fdd2:a47d with SMTP id ds12-20020a0564021ccc00b0049cfdd2a47dmr12308104edb.37.1674117936369;
        Thu, 19 Jan 2023 00:45:36 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id eo9-20020a056402530900b00463bc1ddc76sm7520001edb.28.2023.01.19.00.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 00:45:36 -0800 (PST)
Date: Thu, 19 Jan 2023 09:45:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: alternative: proceed one more instruction for
 auipc/jalr pair
Message-ID: <20230119084534.v3asjioao2zyvpje@orel>
References: <20230115162811.3146-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230115162811.3146-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_004537_805088_A078F702 
X-CRM114-Status: GOOD (  16.47  )
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

On Mon, Jan 16, 2023 at 12:28:11AM +0800, Jisheng Zhang wrote:
> If we patched auipc + jalr pair, we'd better proceed one more
> instruction. Andrew pointed out "There's not a problem now, since
> we're only adding a fixup for jal, not jalr, but we should
> future-proof this and there's no reason to revisit an already fixed-up
> instruction anyway."
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/kernel/alternative.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
> index fc341b69bf62..2354c69dc7d1 100644
> --- a/arch/riscv/kernel/alternative.c
> +++ b/arch/riscv/kernel/alternative.c
> @@ -122,6 +122,7 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
>  
>  			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
>  							 insn, insn2, patch_offset);
> +			i++;
>  		}
>  
>  		if (riscv_insn_is_jal(insn)) {
> -- 
> 2.38.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
