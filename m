Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE09C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Jun 2022 09:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GKklWPD2oduefF2bcoxCaaAgtt7xjtvvueuKxEhn+tE=; b=tsibTns6wFrrUM
	Cbl7ItOn4t/nSngeGDXSzV3LR7/eFQy+SnWikRbQOz9jpumv1RPpVGkAddfpWy2ESrImsNqKDjkQs
	bJL/wlJ4sTxMi840hxpr7E6hZwahTPypVAV2MiPUAibLwP7B2B6Gr1isAINQV1BnjdaAE481Oyvan
	gHSXDDYSAgsBx/Omxdrnmje5zmKz5xL3NbeBYL4ylwUGnJxdLTd600FJxbMYhUkmDKHorTCSsUXS5
	DETLUrWSzBfibE2OPtbLvrU3uTYidRhR5zKo7ef5VShBI2qqoFdnluOBfITkadl2BUD4d5FovWYeN
	tcs943Jm/j3NDoA87xkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzxI7-00CFPU-S9; Sat, 11 Jun 2022 09:20:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzxI5-00CFN1-GF
	for linux-riscv@lists.infradead.org; Sat, 11 Jun 2022 09:20:22 +0000
Received: by mail-wr1-x435.google.com with SMTP id h5so1401595wrb.0
        for <linux-riscv@lists.infradead.org>; Sat, 11 Jun 2022 02:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=SN97VSJ1ccdaEz1KGuxxY4a0gyyHuUYZhfE4f2SEekI=;
        b=S4DZUmlE5di6YR+DIoUPQ2ra/KrGSonq34VzOmzlnMhnJ/HxCDBB68C8ftHGJHzwpl
         ZnkzQYPD3yYx9aij7Tjx83Zi6b8LbA+G007vdFsANw+kvjwuN5REGSdx9YCPnAhmROKA
         lrlSy34tfbKpOPTv8g/e4gxOivAwh9+midL5kcBmzjxVmRhaG/bWaJ54Zhs3ETeeE/7T
         qjyR8+VK4pjaAv895bKEbHQFdN2E4b0h27o8K/Od9CQj/89/m7SD3DLDQLvhTW1DsP95
         GeWzuds6Allhjh8Ks5c/BPdJdk8MGxEXZseC7QutKINlRk7WKAdR5P4yE0mwI20SNSDf
         Mneg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=SN97VSJ1ccdaEz1KGuxxY4a0gyyHuUYZhfE4f2SEekI=;
        b=gJJjpUON1P0DvLgxLBvQDIz11brN6MSHpXs/DGauy/PKdpjgDfm9D17/eRtTxM+6Zb
         lOcniYNuvaDohmE9llQNILsQ9eK/L/28msN2yIgmhQi0wfONGvc8ozECQF323mwrM9/F
         55KY0hi92tOrwV9HElQz4mErB/QhMuo51+ic9gXoYTjcQpGTeM9b7JbdJ0Dp73Ci6RB0
         YkZI8RNclIRvO2eLcZRb9J0DG92RV/2DoMuRiOeAWz9yqADFrULGVBuk9+Let59MlFKA
         pXQNTn7bbT1blsKFM+EAjcOi4L2DvZT+iEXj3F+Z6R9wpKacOlH/DhhxRHabyqUODOql
         o/2g==
X-Gm-Message-State: AOAM531NrlI/Na+8MtlRKkewxD0ZWKxsXGia1nTv34y8gYVOibfFbq4P
	yDPCvGK3r+C0veorRr8LjDabXA==
X-Google-Smtp-Source: ABdhPJyRht1sUkgMy4Z++odCZ2gsBir+F4UaeNv5bYzwGOOPas4d2NSfZ359qCB4ZMWqCE1OFKkt7w==
X-Received: by 2002:a5d:4f92:0:b0:214:c773:d615 with SMTP id d18-20020a5d4f92000000b00214c773d615mr41098127wru.525.1654939217948;
        Sat, 11 Jun 2022 02:20:17 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d48ce000000b002183cedbf34sm1949282wrs.73.2022.06.11.02.20.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Jun 2022 02:20:17 -0700 (PDT)
Message-ID: <50540bda-ffaa-1141-b077-197ac64fcdd1@conchuod.ie>
Date: Sat, 11 Jun 2022 10:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] spi: microchip-core: Fix the error handling path in
 mchp_corespi_probe()
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Conor Dooley <conor.dooley@microchip.com>, Mark Brown <broonie@kernel.org>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Lewis Hanly <lewis.hanly@microchip.com>, linux-riscv@lists.infradead.org,
 linux-spi@vger.kernel.org
References: <a90bec10dec43719b12afdb967e87526c4bc849a.1654933052.git.christophe.jaillet@wanadoo.fr>
From: Conor Dooley <mail@conchuod.ie>
In-Reply-To: <a90bec10dec43719b12afdb967e87526c4bc849a.1654933052.git.christophe.jaillet@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220611_022021_606783_BFDD8F5B 
X-CRM114-Status: GOOD (  16.71  )
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



On 11/06/2022 08:37, Christophe JAILLET wrote:
> clk_prepare_enable() is called instead of clk_disable_unprepare() in the
> error handling path of the probe function.
> 
> Change the function that is called so that resources are released
> correctly.
> 
> Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Hey Christophe,
Peng Wu already sent a patch for this, but thanks for trying
to clean up after me anyway.
Thanks,
Conor.

> ---
>  drivers/spi/spi-microchip-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
> index 5b2aee30fa04..bf6847d95fe3 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -580,7 +580,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
>  
>  error_release_hardware:
>  	mchp_corespi_disable(spi);
> -	clk_prepare_enable(spi->clk);
> +	clk_disable_unprepare(spi->clk);
>  error_release_master:
>  	spi_master_put(master);
>  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
