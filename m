Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D3DC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 13:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GPUuoOUEmtOwS8ZFRCWQaWG4pc0Q+nWbdNOScS6WvII=; b=SYQatdN7okA3S1
	3ZXKcL1ngxYM/MDWu99ihXNeJV62Wt0XK8e9u3vyZ706j7t027/OCbi9wRi7Wq6pbqLIiXlEleDKl
	CnsDaYKgbNSKI/lkWy6rx5GGMOpTJJfA6aA3TFkvTVIwNRbHQvaUUO2M+EQjlMtMaJFeigkGZKKEQ
	tUc+ZDtu7XiWt6BwJoNvhZFN3SScS2d7tSfqjuqwkK5bLC+XoZeW9qfG6xSB9BX9FFRdpP88S9YBe
	QaNQrFqJ+zXi6DGXAx86oW+HA48GoPOrnAExch0zC3pUb/8SPIwVV5lk24v8MJI2032L+hniqKHEa
	Y+BXX01a/CNrgQunm+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh9Wu-00DDyw-8v; Sat, 08 Oct 2022 13:06:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oh9Wr-00DDyQ-GP
	for linux-riscv@lists.infradead.org; Sat, 08 Oct 2022 13:06:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4884060AEE;
	Sat,  8 Oct 2022 13:06:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37826C433C1;
	Sat,  8 Oct 2022 13:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665234364;
	bh=H7rISWDXkngUvPpbP1IItKQyMeTVxkOe5m2lSjAHcB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FvItbNUfDAnJau58e4XAMWhwkdAVlsyW/WK+ET2tFNXymzragVktCk1hDylCAFjPp
	 MW/ZTRBbu/+2aHKEPX9PxVUQD6Sv1MlocqLbKQlUhwd3rgzWBlcA7aKv/AUsAifYao
	 Pl7cCA3e+hMKdpulqF7EvdpQgHDd4GeAajdzrCAGMFd6tINY4mzp6EpkE57v000/SZ
	 6kOCi3qSu6nN3Nu8DvuWap62ukQCvpGhGy3mYbnOROoAq6VbdgkS9nY4sHtd6gB4JG
	 Vg9SWCChICqSsoN3f4zS3uv4AuwP8A5pphGdM5TtEH+gCrlzUAH7sqWL4/qyk5MUSU
	 J6pywYoDpv2Bg==
Date: Sat, 8 Oct 2022 14:06:00 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] riscv: move riscv_noncoherent_supported() out of
 ZICBOM probe
Message-ID: <Y0F1uH71Ll7YGygB@spud>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_060609_624872_5E2DCF9D 
X-CRM114-Status: GOOD (  19.26  )
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
>  	riscv_fill_hwcap();
>  	apply_boot_alternatives();
> +#ifdef CONFIG_RISCV_DMA_NONCOHERENT
> +	if (riscv_isa_extension_available(NULL, ZICBOM))
> +		riscv_noncoherent_supported();
> +#endif

I have a personal bias against ifdefs where possible, maybe @Heiko
remembers why riscv_noncoherent_supported() was not defined as something
like `void riscv_noncoherent_support(void){}` for when that CONFIG is
not enabled? If it was this could become a an IS_ENABLED & we wouldn't
have to be so careful about wrapping it's usage in ifdefs.

Your change in isolation makes sense to me though, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  }
>  
>  static int __init topology_init(void)
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
