Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58FE8C6FD1C
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 12:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hq/mDFi/4grOd2SkcKV+nMD49iLekjKkSl26bC/VxiM=; b=G3ZcjoqwwmNuaY
	YU3LFYotKevfnYXsDytozHyvSsUfcqJZtUQXlToTAV3Xp3vLAujvPqvhkVWaR8iFkx1ZRKDBwpDcj
	7XWMFlJiBwOQGTy+JDuq6KY1yg3F74e83rYrZbiuTvPdXv0fKPKE5xoKF8s2BieNXh7Wp7sRjM9rg
	bx0u0mcsBYNTRnWJuNYqDoDPs4J0ta0IhrJy3SY+0zh5YxTh32a8/bzduCvsfvWdClx+XPn3H4nyZ
	dYlmtKUfM+AAEEeK29KXdlg1kxC4CtSfjek8WEj0BlDIMcoxC6IBRz6R/4KXES0Ph7KKoT4SwGEiR
	J9mx19LbjTef2UrRIRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfghl-004O2R-1I;
	Fri, 24 Mar 2023 12:39:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfghf-004NyR-0k
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 12:39:33 +0000
Received: by mail-wr1-x429.google.com with SMTP id r29so1647150wra.13
        for <linux-riscv@lists.infradead.org>; Fri, 24 Mar 2023 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1679661567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2vDjOO3u5NrLuNTfiEX5xpBBmNaynKtTiPAN1r+oGQA=;
        b=SlEaAlQdUiCY9rRw+Jpcudsuh4bqM00Umv1wD3ZyEY3C8mY5/gcTxF/dK1XO7rbp9L
         QYWASLIfIa8trRlXG+RD8ahU+LtJxjn2Chy21ejcYjqG10O0bfyQdeVpnMBu0yWLGRfk
         9ygaXal4Ek75ASiZlSeljLCnJGHReo9qNxQyXUuU22aPRa3zPXK523GTV15rDrAoCfor
         rbxb1cHHMIehP1NKcqSLcMyqp3kMZ2ehArDtbD81zFFOrgvOT9ekHm8McYXQoCVpbM5f
         sm8WMNevDFmM4Ns5nmXzhfEgBoTssRveQnCAuiCXrBHEkQFtHO6eySgcMHA49qBIefmK
         FgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679661567;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vDjOO3u5NrLuNTfiEX5xpBBmNaynKtTiPAN1r+oGQA=;
        b=HffS2HNjxVxzTPslxDpcKNkCpp5bb4gn/ovSDESujN2Cd3KmJqTI97kJQ1AjJkpPV9
         baasogbsL351DGpXB2nyVTeyZvwKxiTE0l4F3wXzYRi5GJtrhNMn21zMaYRI4fjRe0j7
         24CyMPP4SXJOms1TSuYhhuLjB4Xy8Hoqf7pbE594hvq806gSYvLFAiiiwQn/Vi3pAEaU
         8iOIFyAHDg0SFUM3CwPyLBkJLYvLBtUIdcCP+0NtWlwBIFPcX2W1RGDkK3YYpA//l2kr
         bz9LvO13m4fZcYw2SVMiDROdvQPVZTyCjjLHAF+nEJb5uNXBFWGIRWO1I2LUtY29rf/w
         XICA==
X-Gm-Message-State: AAQBX9c0mMoxQF7wWQKjzyW/SijaTCY8x3m7AG34CqmZjsXCDz7eG114
	WZEnOH1/jwkwU07AOMVXE9hbQg==
X-Google-Smtp-Source: AKy350bEOg0BRw1mif/aUXNxqiGlaUM9IfAMPTpKin+hA349t7znDFrZd5iEERPDJ4/Fx8Mi7EnT3w==
X-Received: by 2002:adf:ef85:0:b0:2c7:bb13:e23f with SMTP id d5-20020adfef85000000b002c7bb13e23fmr2013765wro.24.1679661567156;
        Fri, 24 Mar 2023 05:39:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d4e8d000000b002ceacff44c7sm18456350wru.83.2023.03.24.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 05:39:26 -0700 (PDT)
Date: Fri, 24 Mar 2023 13:39:25 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: palmer@dabbelt.com, conor@kernel.org, Jason@zx2c4.com,
	apatel@ventanamicro.com, heiko.stuebner@vrull.eu,
	jszhang@kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com
Subject: Re: [PATCH v1] RISC-V: convert new selectors of RISCV_ALTERNATIVE to
 dependencies
Message-ID: <20230324123925.4snctouu2zyvizot@orel>
References: <20230324121240.3594777-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324121240.3594777-1-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_053931_270737_F6B64429 
X-CRM114-Status: GOOD (  21.24  )
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

On Fri, Mar 24, 2023 at 12:12:41PM +0000, Conor Dooley wrote:
> for-next contains two additional extensions that select
> RISCV_ALTERNATIVE. RISCV_ALTERNATIVE no longer needs to be selected by
> individual config options as it is now selected for !XIP_KERNEL builds
> by the top level RISCV option.
> These extensions rely on the alternative framework, so convert the
> "select"s to "depends on"s instead.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Applies on top of my series doing the aforementioned conversion:
> https://lore.kernel.org/all/20230324100538.3514663-3-conor.dooley@microchip.com/
> 
> This patch is sent on its own, because I expect the others to be applied
> to fixes, as it fixes a v6.3 regression.
> For this patch, I applied my other series to v6.3-rc1 and merged that
> into for-next, and created this patch on top of the result.
> ---
>  arch/riscv/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index d2acd69d6e3e..a48d1ee677ec 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -402,8 +402,8 @@ config RISCV_ISA_C
>  config RISCV_ISA_SVNAPOT
>  	bool "SVNAPOT extension support"
>  	depends on 64BIT && MMU
> +	depends on RISCV_ALTERNATIVE
>  	default y
> -	select RISCV_ALTERNATIVE
>  	help
>  	  Allow kernel to detect the SVNAPOT ISA-extension dynamically at boot
>  	  time and enable its usage.
> @@ -478,8 +478,8 @@ config RISCV_ISA_ZICBOM
>  
>  config RISCV_ISA_ZICBOZ
>  	bool "Zicboz extension support for faster zeroing of memory"
> -	depends on !XIP_KERNEL && MMU
> -	select RISCV_ALTERNATIVE
> +	depends on MMU
> +	depends on RISCV_ALTERNATIVE
>  	default y
>  	help
>  	   Enable the use of the ZICBOZ extension (cbo.zero instruction)
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
