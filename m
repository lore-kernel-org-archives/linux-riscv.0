Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F8FCCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 17:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KbkI1OGorAO1AQfBxGgA8q4j89velRi5Tc4VohfGEg0=; b=QvN4U9Z3DtZyjl
	p+R7wbzO4PzLUSUibqTLgPZRJI7BhAmNlcDSe+0wgBhtk7Q1DhK71rnSiuaxi1xU6SIkq3q8A5Noj
	aSFCjMFyr6GKqvTchwhQbgCOn8KfnWy/13C0jJ2uOhgtHPmMpn+QyrTWjApEcNbQTAaDjVjL0H5jC
	qUect6jsq0wYMNGbxnFI7N8E3miobcPSCH3Ooe8wZ1hYiBJOlzwgsIekIbBhMHe4xtxn8Ar52LVvi
	1ud9bq2Y86DuOzSxCbVGBRBfdGNBnT0SsRSW+HDxAge4cRd3VUbJL2PPBG+Ah/aVAxkgh5nK6ovGj
	Ag1HfgNAIwumZESC3kFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jAA-0000000H70h-3cBu;
	Tue, 14 Oct 2025 17:50:18 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8jA6-0000000H70I-29ON
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 17:50:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so120163b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Oct 2025 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760464213; x=1761069013; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k2QNuMvMJ8hOs9o9vuGhQfun+FldhTpl0eJUr8np6xQ=;
        b=Yj4qugdxzM2Jz075OVplHmmDIsN2z4spE4uSFLpwdalR3GAYnkd4e3+hmzmdcQvjqI
         KtB5dRoD1UscB7W441e0vFjAzQtS/HauQduj5YKVdWMoLnklh0jyFQ2Xr1h33JixiL5g
         oouAVkplvzgIs3TVRE+ZQPo1s2JBQ+zbefX1LLaAdv2lry7Y6sp5FebZPTCP4jkPdY0z
         3N+Z+Z9eAr319kA7QZiruZZ4kb61WSbjLFXWfCt4AQsg4K7rDZpo4DxIebBpwLwgNvqb
         yvNe0Mxn8vmk+CXzHe2cjPpdp6gTixTQj/CgF68WkQedSPZg2p+SyxUuhhAX+jZa5tzG
         0/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760464213; x=1761069013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2QNuMvMJ8hOs9o9vuGhQfun+FldhTpl0eJUr8np6xQ=;
        b=OgoFb3MDsRTzxDWCoIa3RBA3jqyZ8hlNk9wrBkgoZ0fLHtObCBhZBQ1O+uxMibGQf0
         tKnYFOHgEZocpcF0zQsDek32cGcfCZMXvBiAFHKPbCe+3jwfsSc0kaZH+yZKnJX+ZLJ/
         XVi0b4aYSWaCXcjI2Cb5GiNJdeQz2HS73RrfpH4YEE9M3zdi6BsTDsKj/oKwfLxRYM9X
         DgLaVIKxzBhB6kAMUJrOk6kAx2mTrROiE8da8d1wboR635p0L7N2qrLT6dYsPmSiJkKC
         KouFP4dkDW8cFGNm9DF4zs/UEg8yTKOLl6mbSFAlFV6HbO+mvnFiJwK89aPx+/MQMnls
         b8Sg==
X-Forwarded-Encrypted: i=1; AJvYcCVdhO4tWO9WUx69lbGu5Yuyw/QDYxqlguAmAAK6fYvVCu4N6xx+ldce0H7yLdcbo3hqbcca/OihTMAl0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzCdsIFmB6Qfn0pbHI7JYZh0giELGFg2y07kmKBRemk6nG4I9KK
	fVOJxIli6f/RV0TbCLSYLMD9+xkxATr1mz/m3rCYtNk5kPsAf7D+uRaYHw2MPiGJjZQ=
X-Gm-Gg: ASbGncs6zVYyjJuigy8o597OkBl0RIdwqZ49hSfYBWew2f062Ppl7LB887+pHZkwiBY
	W34YJtZbU9wNDHBRS2yPcaeXhQvCq5L3mvCRo3arVZR95h3xGqIQDJgWPOkr9uOIRS4PrUb8s2R
	FtSvB0ll6PIVJGyI+GSvSq2bHEkf81dGeDnwuRD5XR2tU1c+dh8bSR8pCYyWrclPf2o7rfvAe4N
	TPJSzjGM9Up/a8gieBWz6edfRh0dtfP9jp4pLjrt4/dmt3Zytg5GxhA6JT6ivcpT2iaF+T8oVUX
	OmKvbwP96RcpLO+jlEiJEBW1/TB37YLPjIzwV82ts7XgPLQsk4uICZN8AEpIS5I+ISTqC2k9M2Z
	11fWSlGQfTdn/SfXOcvjnVgX1TzCznxJCUvUjr2FPNbQkj/KnNQ765w==
X-Google-Smtp-Source: AGHT+IHXEC/fYEZU7ntLTxdrj6qLAlHg65WozvdVDhTEcndBfhncNRLxc0EQohnoBL02yBvQfbeF8Q==
X-Received: by 2002:a05:6a20:a128:b0:32d:95f2:1fe with SMTP id adf61e73a8af0-32da8df32d3mr32604180637.2.1760464213348;
        Tue, 14 Oct 2025 10:50:13 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e3f89sm15486434b3a.66.2025.10.14.10.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 10:50:12 -0700 (PDT)
Date: Tue, 14 Oct 2025 12:50:11 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: Don't print details of CPUs disabled in DT
Message-ID: <20251014-5305a0b88ee761d57e3f29bb@orel>
References: <20251014163009.182381-1-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251014163009.182381-1-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_105014_581349_E81FA6DF 
X-CRM114-Status: GOOD (  19.77  )
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

On Tue, Oct 14, 2025 at 10:00:09PM +0530, Anup Patel wrote:
> Early boot stages may disable CPU DT nodes for unavailable
> CPUs based on SKU, pinstraps, eFuse, etc. Currently, the
> riscv_early_of_processor_hartid() prints details of a CPU
> if it is disabled in DT which has no value and gives a
> false impression to the users that there some issue with
> the CPU.
> 
> Fixes: e3d794d555cd ("riscv: treat cpu devicetree nodes without status as enabled")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kernel/cpu.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index f6b13e9f5e6c..3dbc8cc557dd 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -62,10 +62,8 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
>  		return -ENODEV;
>  	}
>  
> -	if (!of_device_is_available(node)) {
> -		pr_info("CPU with hartid=%lu is not available\n", *hart);
> +	if (!of_device_is_available(node))
>  		return -ENODEV;
> -	}
>  
>  	if (of_property_read_string(node, "riscv,isa-base", &isa))
>  		goto old_interface;
> -- 
> 2.43.0
>

Maybe we should keep the message as a pr_debug()?

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
