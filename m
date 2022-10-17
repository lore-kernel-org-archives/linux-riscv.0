Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74FEC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 15:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qRfs8fHrPPx8u3EuTnCHAZhKXpIOLwJTn6u/uOO2Hk=; b=PUHDhSDNbxhFPD
	kObIG95GD1vH1x6iABkDX9nc3Y+8bAoeyBda2evsyNNmmOFhExnSeHVGQZNS0ONdtUjorJdhITKyz
	PxO1Krd3GLhQSob0NpXsNu2TOzfQMmLlKve6O+2UzMp2GgO7QoAsJviomi/uqyUAXB0prdBF1Cv4q
	8KtB7z50ya7d4K4bPNmXNoKftAj9W+FsApmHnk6mc97WLhPcQWzY04eIgKCGQDaLA7MYZLhCv7qUG
	tIDosqkqVCXX/VaM8IHR5OOjdKVGcCaCcL0XU5/WLH9TX19Ceq8SMCufVc70DSLHcS+Qo1g74Osnb
	At5Y8vlPf5FlKTEg6ulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSKN-00DPPv-Gf; Mon, 17 Oct 2022 15:46:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okSKK-00DPM0-Cp
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 15:46:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BDCB561008;
	Mon, 17 Oct 2022 15:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B37C433C1;
	Mon, 17 Oct 2022 15:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666021611;
	bh=rHCkAfGa8/ABbu2gDOSUeVhbB0WdX8Iwc/RI5rF44tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SbtzMYc1a6hvC1//cHAMwBrLx5jw/8pLWL6EGPS3AfhVf1db0Vt4/ExQ8shEOlpR1
	 LFbiCnzLMBTR57P99Lj+cpENoLFoGjVgtchHybM5l1ehnshNZovSq877VuVkL4KRfl
	 vpkr+hsjjyEEkLmyhi8SERXANfUyDQtm7m8XQOuCSbLmeNlTMpt36lK4vpBfxyt355
	 84VfGCC9AD31CjpO98E6fk26HopBfeASuQQpoQjpwrunYPU67HwVOEjzlEcR9Nqpuj
	 +tq/mnLmFTH2b9+TOiwQQ/dK/p3+BWjUhpdHUsgASMJ6GFAcembxHMfmM/S1O+C1hr
	 ggPluzLIwpteA==
Date: Mon, 17 Oct 2022 16:46:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-riscv@lists.infradead.org, yash.shah@sifive.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 1/2] soc: sifive: ccache: fix missing iounmap() in error
 path in sifive_ccache_init()
Message-ID: <Y0145x9Y8MVb1Brw@spud>
References: <20221017084411.3557098-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221017084411.3557098-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_084652_492766_51DEC9E8 
X-CRM114-Status: GOOD (  22.86  )
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

On Mon, Oct 17, 2022 at 04:44:10PM +0800, Yang Yingliang wrote:
> Add missing iounmap() before return error from sifive_ccache_init().
> 
> Fixes: a967a289f169 ("RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive SoCs")

Hey Yang Yangliang,

Both of these patches look good to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

One question - of_find_matching_node() increments the refcount of np
right? It seems to me like we need an of_node_put() here, at the very
least in the error paths (do we need it in the success path too?).
If we are going to add cleanup to this driver, we may as well go the
whole hog I think.

In terms of the success paths, I assume the first place we can safely
let the reference go is just before the call to ccache_config_read()?

Please lmk if I am misunderstanding anything here...
Thanks,
Conor.

> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/soc/sifive/sifive_ccache.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> index 1c171150e878..25019c16d8ae 100644
> --- a/drivers/soc/sifive/sifive_ccache.c
> +++ b/drivers/soc/sifive/sifive_ccache.c
> @@ -222,13 +222,16 @@ static int __init sifive_ccache_init(void)
>  	if (!ccache_base)
>  		return -ENOMEM;
>  
> -	if (of_property_read_u32(np, "cache-level", &level))
> -		return -ENOENT;
> +	if (of_property_read_u32(np, "cache-level", &level)) {
> +		rc = -ENOENT;
> +		goto err_unmap;
> +	}
>  
>  	intr_num = of_property_count_u32_elems(np, "interrupts");
>  	if (!intr_num) {
>  		pr_err("No interrupts property\n");
> -		return -ENODEV;
> +		rc = -ENODEV;
> +		goto err_unmap;
>  	}
>  
>  	for (i = 0; i < intr_num; i++) {
> @@ -237,7 +240,7 @@ static int __init sifive_ccache_init(void)
>  				 NULL);
>  		if (rc) {
>  			pr_err("Could not request IRQ %d\n", g_irq[i]);
> -			return rc;
> +			goto err_unmap;
>  		}
>  	}
>  
> @@ -250,6 +253,10 @@ static int __init sifive_ccache_init(void)
>  	setup_sifive_debug();
>  #endif
>  	return 0;
> +
> +err_unmap:
> +	iounmap(ccache_base);
> +	return rc;
>  }
>  
>  device_initcall(sifive_ccache_init);
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
