Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFF1D2A53C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 18:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DaVwrvPNvj8wHwrHIWeDLf/AU6ED+xFxz2Gf9qdOKO4=; b=ISy9UyNA3mESTa
	ScH4kX1RxvaZJmx0s2vsz5D+ddsk+qRYWsHTHSKYr4oyrnfb2u7OIfhNv7xCXIkuk2QnT/WYBCQyt
	bq/bHFDr+BmsFNFppBVDNa04+TsGOEnqyfvBvGvPTlaVP8KnAxmzRRI5ZOxRQQs+ziudIbjxsT3hV
	+586PLphcFuPjOUJqM3rDbiQ9Eb3Oqsct7yGhi1I7q3FC7QPeqsATY3MfWHXG7OV3PqCRd8HseHvQ
	11m9r+zyhjjHG4dds1S1zzKIVdqvz+kF7/iuXa8mNchAkljA9nFZhHbgH+y8vGQNfAANSluGezFct
	Q9vnblZOo1MGUpUJ6TxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t18ZT-0000000Cesn-2uXC;
	Wed, 16 Oct 2024 18:16:31 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t18YD-0000000Cei8-2u45
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 18:15:15 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7ea79711fd4so71767a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1729102512; x=1729707312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fkgg/XiYmuwxuU0YWtVe0AMhNojrUfbhQVkInOv4lBU=;
        b=FkNW1qU03AkEF/+2EvXmiNd151kfg9QR5lWY9I2f7YANEOUe2AXMa5y8sYv7ija39e
         Xh5ZYGomIJIjuruLhdRy7hvZazNRNFLq60A3KA0zURjneyrXQngYaxhVqXRzDNwOjFgf
         skXWt5qT2zdVgFG/Xp+jtluE9wDx0LYd7fzGiyWRbhEkqKR1Yafmy7bGcS1DmYxr6bt6
         dJry+rppkJinu9wouppfoG1X3K6NmD3ccIRa54zhXgvvDT+eRNNPgtyQcb2yy78Jdb/P
         9eU46/F1jB5p/ZvHueBrdflwbLCknFEJ14+hYmRhtjbYUHXmhk9qY4BDO2/stYFkrxW8
         j8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729102512; x=1729707312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkgg/XiYmuwxuU0YWtVe0AMhNojrUfbhQVkInOv4lBU=;
        b=TwMMyd15uGmcmh9+fD3kmq10xTqNoTLMAxdNpzQ3zTwR4fAMVfxGLfPG4+G10erohw
         85BC6b7GXqouFXB2gb/+ysTzbpKyJbdXrnN0i3cZPNtZ3cGYCpdo7eV2UgKuy30tSos/
         +FCXxamLEtH32gop+tB38XPhiiywW2s1B7bg4U0jesVgWOpfXyPrsBoDdPOIZeLv1QAL
         g+76Q4csi4DBtPhxhBJbJTtCCJYr5oVHsKR575q0YMGEb2de6PSjIKusX8uZ1HPiLx/D
         xQJ4jPQ6ET5A/aTcqpVtdsXLa1LJgi7J+MUzF3heFFxmgdxcpAWtfXla719hmbGxa4KU
         qMqw==
X-Forwarded-Encrypted: i=1; AJvYcCVdeVAiWhyoHV2q7UXcJM2GfzYiUMoaNIYmqv2g2+O+vWe4Jbpvb2viZrIv5hYUst4PeaIAZvyEow1wxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwItliRxKSw0PzNIW+wX2sxu66zOF95cMH9noxHE4EDZQCKLC3x
	ocH1TBdQZ1M603mAvg1x2B+F2/NB3VpVYh7n5bQVceXkXqeEMcY+osBAsUB13v0=
X-Google-Smtp-Source: AGHT+IFPs/1VOYlgs8ynT/CESZBXXAGDk0R6M8OaJ6CAurUUdtWENPzhZVi9D9E3OSJvDP5dBev+bQ==
X-Received: by 2002:a17:90a:5647:b0:2e1:682b:361a with SMTP id 98e67ed59e1d1-2e3ab8bb22bmr5177503a91.28.1729102512217;
        Wed, 16 Oct 2024 11:15:12 -0700 (PDT)
Received: from x1 (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08d082dsm79600a91.23.2024.10.16.11.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 11:15:11 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:15:10 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] pinctrl: th1520: Fix potential null pointer
 dereference on func
Message-ID: <ZxACrl/0hUE62eGN@x1>
References: <20241016155655.334518-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241016155655.334518-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_111513_770957_F2F15DB0 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, Oct 16, 2024 at 04:56:55PM +0100, Colin Ian King wrote:
> The initialization of muxtype deferences pointer func before func
> is sanity checked with a null pointer check, hence we have a null
> pointer deference issue. Fix this by only deferencing func with
> the assignment to muxtype after func has been null pointer checked.
> 
> Fixes: 1fc30cd92770 ("pinctrl: th1520: Factor out casts")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-th1520.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
> index 7474d8da32f9..e641bad6728c 100644
> --- a/drivers/pinctrl/pinctrl-th1520.c
> +++ b/drivers/pinctrl/pinctrl-th1520.c
> @@ -803,11 +803,12 @@ static int th1520_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  {
>  	struct th1520_pinctrl *thp = pinctrl_dev_get_drvdata(pctldev);
>  	const struct function_desc *func = pinmux_generic_get_function(pctldev, fsel);
> -	enum th1520_muxtype muxtype = (uintptr_t)func->data;
> +	enum th1520_muxtype muxtype;
>  
>  	if (!func)
>  		return -EINVAL;
>  
> +	muxtype = (uintptr_t)func->data;
>  	return th1520_pinmux_set(thp, thp->desc.pins[gsel].number,
>  				 th1520_pad_muxdata(thp->desc.pins[gsel].drv_data),
>  				 muxtype);
> -- 
> 2.39.5
> 

Acked-by: Drew Fustini <dfustini@tenstorrent.com>

I've tested this on top of next-20241016 on the BeagleV Ahead and
LicheePi 4A.

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
