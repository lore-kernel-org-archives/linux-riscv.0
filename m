Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4159DC433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsdyQHjH8EEKrmg8D38AIcUfpGhCc0+TkbIH7UQ2css=; b=35gWPHFkpux80W
	qUY4jO4aUW12sN98l0YCd6mrdmsoLSxv5NhVcJYXmGu1i4Le/Tx1h1BbSaL/K5G8Q+xwoZT3luk/W
	4yCPkkQJknEyaXkqLCGT0pr+Q38jJKcGUpnvne/Kxl/Ss1zjObCqzM4am/kl7NXfYjeWiGFU8WwcG
	0oxsUx1tyb0sfyxq4G9shesGRqyKvnaV79uzr2odWberT5qXTS9BL43rUUBFd1kwtcGHWIngQO/5y
	z00k8MhXaQ2nhOrr5BIMEQ8LzPJUjOWK/ipi31QhXwQ5idGdJzRT9vCW46g79yDRwDCXeD8wRgn/H
	fe9FI1t/2p2V66zIsj+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQgM-002Zgj-KI; Thu, 06 Oct 2022 13:12:58 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQgG-002Zdk-Rk
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 13:12:56 +0000
Received: by mail-ej1-x632.google.com with SMTP id qn17so4592809ejb.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 06:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Uj6swI85SnMt4TKWB4hA3wAhngDCYA06Mr8UAbXCX9Q=;
        b=VLze14syKQUDXjp5/yioqgGgQub40T7iLwx0bcq0vmk1DWgeotwUNey5IC5+jct8we
         advC8w3sx41bRGYKYK5gbZ3vtJ3XOWmDnIPPeqfndqbJIUT7VP6bD9r0CGGUXE78xtVl
         VBjwCFz/fl9AYvb14rHbDLU/irXt5UNnAk6F0jrnNMLtciVTtH2pW7n62PIYonunUR2T
         exA5+/dMg9cW0Y1IqJ0mJ+wxJioANSA61aUWYPvyV6a3rHC0fMIDadBuvjwxIeQToRLd
         sZxGZTI6OkF10MbSdAkr9JI1OqzrBcz++Jj3efKBO3YxUbQxRpaHZ53TURiKSNQaNs8d
         rksw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Uj6swI85SnMt4TKWB4hA3wAhngDCYA06Mr8UAbXCX9Q=;
        b=qwLDDSlVlR0rAd1aNXtBs0lmpHBpc7x43XzC7M1vTcja6On/X8DCtGKCPOQE2yAboX
         mTSPxQQgfUCaqaQM0YHAR832DhGLsgEOwrQJrisYsvy07tJBy/94GQ714ekDPan4njnu
         xVBYCn+b1UEdLZ1Av8Ih3Zs4poVYsYr75dmAto8mRPdMNe49mVvdeyFL6Pvf2NPHGIQT
         5id8cpM1CR7K5tYvkb5pxDvczSDPfimUXsCrye1MlsSckS6ixuubEnpvQBbvTtRYN/Ag
         r8zp0JeMQ/5zK6pgJkSaQebIHn7sFj2mJ/U5QDbCYGdmVe9CEPdPHjDWhymGT00aSZVe
         ORVA==
X-Gm-Message-State: ACrzQf2gYhSub6jtiQk3pUKypTVGpTThlttPVpwh1z7iWQKZ8KEclR2x
	5cDr2ph9nA++U1VOyPcJV35rpWXltexVcw==
X-Google-Smtp-Source: AMsMyM5SXI6WyfxKVT3COUhfJ3/eLrlCeOa5idtoTaRyPcPX0sjtGwzkIm7M3KN/vsm+USPV7Fj4Dg==
X-Received: by 2002:a17:907:8686:b0:78b:9606:8b9c with SMTP id qa6-20020a170907868600b0078b96068b9cmr4032609ejc.134.1665061967759;
        Thu, 06 Oct 2022 06:12:47 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id c25-20020aa7c999000000b00457160c3c77sm5707205edt.20.2022.10.06.06.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:12:47 -0700 (PDT)
Date: Thu, 6 Oct 2022 15:12:46 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/8] riscv: cpufeature: detect
 RISCV_ALTERNATIVES_EARLY_BOOT earlier
Message-ID: <20221006131246.45m2qqoqfzq6dmls@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_061252_921032_72668BF8 
X-CRM114-Status: GOOD (  14.61  )
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

On Thu, Oct 06, 2022 at 03:08:12PM +0800, Jisheng Zhang wrote:
> Now, the riscv_cpufeature_patch_func() do nothing in the stage of
> RISCV_ALTERNATIVES_EARLY_BOOT. We can move the detection of "early
> boot" stage earlier.
> 
> In following patch, we will make riscv_cpufeature_patch_func() scans
> all ISA extensions.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/cpufeature.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 03611b3ef45e..afa54635c180 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -307,6 +307,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
>  	struct alt_entry *alt;
>  	u32 tmp;
>  
> +	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
> +		return;
> +
>  	for (alt = begin; alt < end; alt++) {
>  		if (alt->vendor_id != 0)
>  			continue;
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
