Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1BEC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 13:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L2PBuj9Jx5iqwkHc6Bf4fWw9gtp4CUP3uNos+3cY7zE=; b=EWFG7Le2Sd/n9E
	nygKO6gLtnMHSnGwbfhodBAqodrAJHL8klACw05xfKnRTn6a8uu+CprK4FFPics/VO3GqxxXaC6tb
	YSDedjdSDkSBa3ZF4xeVYd8sgXnqiG5UjeeCG1VqCVKqEpnYw7ySx7gOIHQpTSjZI+pz+5OZRROdy
	DYRNtO9pejnh8Avk/tcOiPNcPUWQ0dsg+ACFmSyDFiFyB18rxWJ2s/NA5dQjUQ5g77SF2eAowLYE9
	IZMkVAOtYzbyT6N0OQopVgl5ZTRoEjx721eEp45AxPI/A1NTlINCYZoTddakGWTCO161TIPpH5Sim
	ouQIwg8LHqKr9Y2c04Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYQ0-00GaiR-GW; Fri, 25 Nov 2022 13:07:00 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyYPx-00GahU-9s
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 13:06:59 +0000
Received: by mail-ej1-x634.google.com with SMTP id vv4so10263954ejc.2
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 05:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJLey7GpifqavHRoBifTQZLqld8WN/1b6ELJ+q34KaQ=;
        b=k0pNkyw6TFVU6NHo4LkonM6wi9tgUMtvgMlMc81urQqm00OWu2Xr7nYcD2PJkSYb9x
         EjLs7qjW5IMwNSuS2uCP3zF0GNIBRP5NvcEkCjk+2FCSSD+ZSP6Vm5pRvU2qBFPxROPg
         NaqUZH8Bg1lfPcIcK/yS5GZSveFHB0/DKOy8GDYqgHHWzUf7M909GkCbdjA64VilWG9/
         qsdLpmJwQtAY1C8KfyaWmkY0GKfp78vyo2Xsi97uMrHvQU/IQvhq2gNDTKiixrRamDoS
         4GIRh8fdRJvOZ25YEDMVLEqsCbkUNFOHnyz3+rJOIWAa76/m+1InXxYKVajebEB7UOZQ
         Hf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJLey7GpifqavHRoBifTQZLqld8WN/1b6ELJ+q34KaQ=;
        b=GA7xPTjAK3VQ1aWkZbo76siXD9Bqu+IYQ5WRvOIGnowxWMaN+2dvoHfBisS/uEjl72
         J6rxmO6LnhN/e0V4b18YO4Nc45kPK1BBEKmZH2jLEabSdgBF4pbZdJ0ipxprnVpzn9jB
         owfADiJUkqeYdkXdRi0A6HbrLhsodvOQyTscjlC4wDOL0SaIZXil6YhwodUTu8OANhBr
         zRbq8WrmcVzo1sWHtqhLT2ZqGXmpS5Q1lCxZE+NNrGMRGjngYp8nNYeeVglQFF9jQebh
         dgV4cfFYKlu1+05/LM7ARF9JqKwJP4dy3/9DJoWHw4LKyCHy8KAiXOJ4W/MdVpHadGke
         x2sA==
X-Gm-Message-State: ANoB5plioPGs8H7T+hl2s4cFJVsnSBlxSKVnQ1kNoRmk6mCJnNIAYBy0
	Ph9B74fpkBIB7vmDUAF4jajxqKKpJxxt3w==
X-Google-Smtp-Source: AA0mqf6G9ROzHaSZ78Of60duPBl4Wb/Iv2uGgjYYJcfr2X++Jtn+8RGtuRb5yaBsviDAumVT+jVX7A==
X-Received: by 2002:a17:906:1495:b0:7ad:d250:b904 with SMTP id x21-20020a170906149500b007add250b904mr15967424ejc.633.1669381613432;
        Fri, 25 Nov 2022 05:06:53 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id i13-20020a17090639cd00b0078d957e65b6sm1542420eje.23.2022.11.25.05.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 05:06:53 -0800 (PST)
Date: Fri, 25 Nov 2022 14:06:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	prabhakar.csengg@gmail.com
Subject: Re: [PATCH 1/4] riscv: Don't duplicate __ALTERNATIVE_CFG in
 __ALTERNATIVE_CFG_2
Message-ID: <20221125130647.rufk3zho5mdracpq@kamzik>
References: <20221125113959.35328-1-ajones@ventanamicro.com>
 <20221125113959.35328-2-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125113959.35328-2-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_050657_367314_0EE08E72 
X-CRM114-Status: GOOD (  14.87  )
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

On Fri, Nov 25, 2022 at 12:39:56PM +0100, Andrew Jones wrote:
> Build __ALTERNATIVE_CFG_2 by adding on to __ALTERNATIVE_CFG rather
> than duplicating it.
> 
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/include/asm/alternative-macros.h | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
> index ec2f3f1b836f..64be770df89a 100644
> --- a/arch/riscv/include/asm/alternative-macros.h
> +++ b/arch/riscv/include/asm/alternative-macros.h
> @@ -49,14 +49,7 @@
>  
>  .macro __ALTERNATIVE_CFG_2 old_c, new_c_1, vendor_id_1, errata_id_1, enable_1, \
>  				  new_c_2, vendor_id_2, errata_id_2, enable_2
> -886 :
> -	.option push
> -	.option norvc
> -	.option norelax
> -	\old_c
> -	.option pop
> -887 :
> -	ALT_NEW_CONTENT \vendor_id_1, \errata_id_1, \enable_1, \new_c_1
> +	__ALTERNATIVE_CFG old_c, new_c_1, vendor_id_1, errata_id_1, enable_1

I just realized that I forgot my slashes on these macro arguments.

I'll wait for other feedback before sending a v2.

Thanks,
drew

>  	ALT_NEW_CONTENT \vendor_id_2, \errata_id_2, \enable_2, \new_c_2
>  .endm
>  
> @@ -116,14 +109,7 @@
>  					enable_1,			\
>  				   new_c_2, vendor_id_2, errata_id_2,	\
>  					enable_2)			\
> -	"886 :\n"							\
> -	".option push\n"						\
> -	".option norvc\n"						\
> -	".option norelax\n"						\
> -	old_c "\n"							\
> -	".option pop\n"							\
> -	"887 :\n"							\
> -	ALT_NEW_CONTENT(vendor_id_1, errata_id_1, enable_1, new_c_1)	\
> +	__ALTERNATIVE_CFG(old_c, new_c_1, vendor_id_1, errata_id_1, enable_1) \
>  	ALT_NEW_CONTENT(vendor_id_2, errata_id_2, enable_2, new_c_2)
>  
>  #define _ALTERNATIVE_CFG_2(old_c, new_c_1, vendor_id_1, errata_id_1,	\
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
