Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63230C6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Mar 2023 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8sD/ITU+2MqjqiR2DSg2Z5PinCtOjsP2R1Bcu9vs7kY=; b=XNNF0pBZDD7UcF
	ufa7znMNtAYGew7iQLbU5JxvRJ9KNYfWuDIqofpPY9A5Pglzx5/Dp5fdQ7kSNN7+kGa1Ncqeu+V6g
	mT9gRkv4rXfj8OqV61v/dX0cM6Ai73TN3dUd0jGYI2XFuL1JSduqpuftdLMgDKFXraYdQwmQV2ihG
	1awZ60utKl7aar8kBufpz7/ywgItmZsrz/n9E6LE2GgxIG1b6mODbyN0fvxNMRD0sPMOnXaZf/Isb
	ME09UDIXTKcrd6S8xE++reCcDrGSOuslBYZmVfJOoIyWYstFcQ/Oc1wUh9pjJcEhDTGvFtVloQc9t
	l1xKvMIzunAzCgd+cjSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pezEi-00GFth-2X;
	Wed, 22 Mar 2023 14:14:44 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pezEf-00GFsE-1d
	for linux-riscv@lists.infradead.org;
	Wed, 22 Mar 2023 14:14:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id i5so26670123eda.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Mar 2023 07:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679494476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vrBLYZsw5G0+YFt9jsACsmIvyXhFhihfb4FaByN7ulY=;
        b=Q8RwqWsRbMVfc6tnd4mZC9Rny5aPATDLB3Hvh3pnT8v5G8mq/yJYzeaCVJRCA00yrm
         3r5O2d4o7q04K1xf3gnzb2/Ogfg4+KoJ3KmFzVgo3KokAzI/PM4eZhp+4+gGJbr1h+Vz
         tZDMY8F2B998eB1UApEN1cGEggdSLS6wLzFC0Er8k1KJARxiqKbUXCcW6eRQ9cSloRvL
         qJQKAj/Tl1WOuCGrKpbzTO7JN7Y6Q8RKGKgLkliGnv1f3HFMvOFxyfSgtl4+mB6yoTDH
         R6wqbO3t9Ax/XafChiLYHyL61CbyuQlsXCY2V3dUQezf83Z/Zg86vGj5re3OdMAE5Hs4
         /kag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrBLYZsw5G0+YFt9jsACsmIvyXhFhihfb4FaByN7ulY=;
        b=vtxBWeJy2RuFOd7iGRPgHl95/llYQz61ieKN2mVgetdkd6j7IX0fflaqvjpzbUVo65
         g3x1fBTsun10sRGUAwf8CVJrE4cqfDLaI3cMYGPMyQoEDRLLU00HsZhM9s8Lzm90NzS2
         LZ54aZza7B3bBdBEgyrFecC1GWgDRFABiNk+FL0Ro+aZ+lKZOXbA1fYsLFzyCKXCgtZj
         fGZvA/waQylwJ9FIwqndEhpwzh3DwPXLDL/wcxSKVApgqVu5cX/XWfiKgxqoblCM9iPs
         MweVrFz5LxCyySMUnAjp5BvFScLfWEANENlqFyIyADgkX+b8/qh1c04srIsysSgFKJ6z
         5+CQ==
X-Gm-Message-State: AO0yUKXHRD69ck/4u+fVxAbiYgbTPkCf6po+9t2bldfmJVYPh5YJujqr
	ijKCsl7s3lWCqt4UkQLISO0XeQ==
X-Google-Smtp-Source: AK7set+zTYwl633hah+ZyRfepOEIEbx312l59V4REkcnwJaukszyh6jaz/asPGEVrry4eSSWBRij2g==
X-Received: by 2002:a17:906:d8ba:b0:933:32a9:bfb2 with SMTP id qc26-20020a170906d8ba00b0093332a9bfb2mr6328707ejb.57.1679494476458;
        Wed, 22 Mar 2023 07:14:36 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i22-20020a17090671d600b0093348be32cfsm5292213ejk.90.2023.03.22.07.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:14:35 -0700 (PDT)
Date: Wed, 22 Mar 2023 15:14:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	conor.dooley@microchip.com, atishp@rivosinc.com
Subject: Re: [PATCH] riscv: say disabling zicbom if no or bad
 riscv,cbom-block-size found
Message-ID: <20230322141434.t6lhgczcl77sy35j@orel>
References: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230317134512.254627-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_071441_575063_CA9FA748 
X-CRM114-Status: GOOD (  19.79  )
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

On Fri, Mar 17, 2023 at 01:45:12PM +0000, Ben Dooks wrote:
> If Zicbom is present but there was no riscv,cbom-blocks-size property found
> during the cpu feeatures probe, or the cbom-block-size is not valid, then
> the extension will be disabled. Make the print explicitly say this is
> disabled to ensure that there is no confusion about what is being done.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  arch/riscv/kernel/cpufeature.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 59d58ee0f68d..c8b883827840 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -72,10 +72,10 @@ static bool riscv_isa_extension_check(int id)
>  	switch (id) {
>  	case RISCV_ISA_EXT_ZICBOM:
>  		if (!riscv_cbom_block_size) {
> -			pr_err("Zicbom detected in ISA string, but no cbom-block-size found\n");
> +			pr_err("Zicbom detected in ISA string, disabling as no cbom-block-size found\n");
>  			return false;
>  		} else if (!is_power_of_2(riscv_cbom_block_size)) {
> -			pr_err("cbom-block-size present, but is not a power-of-2\n");
> +			pr_err("Zicbom disabled as cbom-block-size present, but is not a power-of-2\n");
>  			return false;
>  		}
>  		return true;
> -- 
> 2.39.2
>

Hi Ben,

If you wanted to rebase this on riscv-linux/for-next, then you could make
the same changes for zicboz at the same time.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
