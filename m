Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F289AC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ci35/w+GZ2Bm/l95o8mtIPS40N34fqvGF7u+wUTZGp4=; b=SM6Sd8YhSdOE2y
	zkErALmXXjWel495MLB03+klIxCGYrql2kj0SIyBkBByKiJHQpRC9XEU8vM0QmT0lv6ZWk522+ML1
	IleDZq0WtYGsdavygTojfDHRjIldCvrtsjDH9JIsd8U79UEfdhNfPav+ruiEBdH+2gMzZlUz7sIVg
	QVdunDIVAKthzSluYAbZ0pir7xUbNpOkrM1wrQb+GvoYaPtS4uzC6fjh9I6Vv87FwIn/rPmJPNF/q
	ZvnzMtJoEg5Lv23LaUEdWs83fcLnj2T/jtjHCSpRM1x0nMclS4tRHCMbL5lCDySY/9vZIh+Bfyyu5
	rRqNhjORKPu7jCFSPtAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQe6-002Yr9-OC; Thu, 06 Oct 2022 13:10:38 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQe4-002Yot-Nx
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 13:10:38 +0000
Received: by mail-ed1-x530.google.com with SMTP id w10so2742839edd.4
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 06:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=2j3ygm+GSrR/kLyqMDlbC2b6qASfbfMJleAyszzEGTQ=;
        b=ZWBM0uCbPzhrgCjdFK9EkQwJqNvxYkgf9YOIb49x/8b1QImU3eoQXh4wYwySagDVTm
         l2ZLhv0Lwy5tsjO5rjnh3St9a+dAaV63QCzT7hHuP0ndum9zqBYnUfCxag8++A+58MPI
         BFYO0srN5xxVxCKPBm1QUpquGIeplt9d19LH2RqXnLGg8qQxY3f1oNEr+6Nj5kxas9bq
         wF5klqgjVKxSYqKN43EDfXcqvSZAfgNIZe7TlFGKnjS05ivFwK9NgSq3Zk03k4Drw716
         C5aq5G2DerEiPeBLf24HmIwi16MSW0K5Xqb/HAkspomYZhgb+ukcBzI9PlP95oYM6rwM
         umZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2j3ygm+GSrR/kLyqMDlbC2b6qASfbfMJleAyszzEGTQ=;
        b=yj2cFOT5xDcI3Uol26FiyFVa04QRBMGdCFbwNEYZUmrSXzcM8tuoMiyaxk9lk/YruZ
         Jlj9ln7Agp0+DHo1gzFnGU4Ko+LjRyr2vIjZh1OhnNNuZwmEQk4p9+z49BBgZ25pASJk
         6c6wwtAcLZ6D6eH4AQ5AxZu/4eRZ7CmLAMSaRmDrEVkb0kDn/wYFgCLreMZPO2acJkaU
         vABuYRw/KC+IHKjzFNb4F/t3L9w5+GFPGzc+wbYZmz5YfyBf3Mi7JlKF88+8EP5h/h+Z
         5Vqb0mKZQkNyiygLz6l/ptp+v9icH2fJpBZIPQq1Anosx3fgvRuyiNfFOOUnNQTnXh6I
         5XWQ==
X-Gm-Message-State: ACrzQf1GXrDRvsTwgZcchXW6XGU7z3oA/uzDA0lbFSaJ5xyjUqHt1xDL
	JCNrtF8bxNDbjq6HjQlUkaShNQ==
X-Google-Smtp-Source: AMsMyM5ssASFggd3BrLF/QiCZwS2iMg5YlzHPO9Ef9AWdzNL9idpBus68/QMYchoiXaaJ2f65IbkAA==
X-Received: by 2002:a05:6402:2949:b0:451:fabf:d88a with SMTP id ed9-20020a056402294900b00451fabfd88amr4461739edb.324.1665061834369;
        Thu, 06 Oct 2022 06:10:34 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id d1-20020a056402144100b00456f2dbb379sm2606754edx.62.2022.10.06.06.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:10:34 -0700 (PDT)
Date: Thu, 6 Oct 2022 15:10:33 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] riscv: move riscv_noncoherent_supported() out of
 ZICBOM probe
Message-ID: <20221006131033.jfb62me2zxz67gfs@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_061036_799262_E5B3418C 
X-CRM114-Status: GOOD (  17.15  )
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

On Thu, Oct 06, 2022 at 03:08:11PM +0800, Jisheng Zhang wrote:
> It's a bit wired to call riscv_noncoherent_supported() once when

s/wired/weird/

s/once/each time/

> insmod a module. Move the calling out of feature patch func.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/kernel/cpufeature.c | 7 +------
>  arch/riscv/kernel/setup.c      | 4 ++++
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 3b5583db9d80..03611b3ef45e 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -272,12 +272,7 @@ static bool __init_or_module cpufeature_probe_zicbom(unsigned int stage)
>  	case RISCV_ALTERNATIVES_EARLY_BOOT:
>  		return false;
>  	default:
> -		if (riscv_isa_extension_available(NULL, ZICBOM)) {
> -			riscv_noncoherent_supported();
> -			return true;
> -		} else {
> -			return false;
> -		}
> +		return riscv_isa_extension_available(NULL, ZICBOM);
>  	}
>  #endif
>  
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 2dfc463b86bb..1a055c3f5d9d 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -299,6 +299,10 @@ void __init setup_arch(char **cmdline_p)
>  	riscv_init_cbom_blocksize();

I think we can move this riscv_init_cbom_blocksize() down to be above the
new #ifdef in order to keep like calls grouped. It doesn't matter though.

>  	riscv_fill_hwcap();
>  	apply_boot_alternatives();
> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +	if (riscv_isa_extension_available(NULL, ZICBOM))
> +		riscv_noncoherent_supported();
> +#endif
>  }
>  
>  static int __init topology_init(void)
> -- 
> 2.37.2

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
