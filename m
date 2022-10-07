Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 813C8C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 09:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSFkQSkv5zyiNLZxOwjtOUOXoAl+ZBPvc4Xxx+qL6/A=; b=kQUjRBur8udMzC
	tZEGkf5iI921fPSiAb0XeZoGymEL4FDnrlwXCrgx4fxlj31dPYEh0O/Vgd25ct/w27k0cOiqQ1aC9
	oPYu0XqTN3wdx6ft3IaZDlQI8HdhAyE/hOx4bYzJhFXlIVT/X4+qVSrWFNVpxM2Om2MGbpj8IQC+I
	zllJ5bYuiuYtweZufve9qjkf7DnAZNeNUwkpGw+4E8dP3Nd/7EL61nxeI7dATVz4K0YJekuR92j8P
	8okRauqLvO/h8cOwtQQtni/0qYqNTMM9tm5/DusyhDqIG/ZQID7Wn+oKDdl1uLyDGYLWKgFCrtc2o
	IxZM2/iBo26uln20pajw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjVP-008GtR-6E; Fri, 07 Oct 2022 09:18:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogjVM-008GpH-BO
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 09:18:53 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ogjVF-000618-UU; Fri, 07 Oct 2022 11:18:45 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH 1/8] riscv: move riscv_noncoherent_supported() out of ZICBOM probe
Date: Fri, 07 Oct 2022 11:18:45 +0200
Message-ID: <4842439.0VBMTVartN@diego>
In-Reply-To: <20221006070818.3616-2-jszhang@kernel.org>
References: <20221006070818.3616-1-jszhang@kernel.org> <20221006070818.3616-2-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_021852_420972_A295F718 
X-CRM114-Status: GOOD (  17.87  )
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

Hi,

Am Donnerstag, 6. Oktober 2022, 09:08:11 CEST schrieb Jisheng Zhang:
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

The nice thing about doing this in cpufeature_probe_zicbom is that
you keep all the "ifs" in one place, where now you have 2 places that
check the existence of the extension.

The overhead is one "x = true" setting on each call to _probe() and with
this change things are now also handled differently between the main
implementation and the deviants.

Though I guess, I'll let others do the judgement call on what is the
desired way to go ;-) .


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
