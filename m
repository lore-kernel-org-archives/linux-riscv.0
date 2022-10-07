Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7AFC433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 02:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=vWpN0BCBENnK9hzG+VAVr/W7rh0310Uz107GDJ0AjTI=; b=Q75B5R6h+Y49oOFzntNFIlHcuM
	tUI0iTirBbvgxeqWcrYWeyRsBOCkdS8tgP9hII4OgKyMv0tVT64vTBVlFWq7/tRFCPOgMN9csPvOL
	yNCieZizi6/RziaUOMzhRSj4wLDRwPFoRwUpkLyT91EArbzlQn9UtjfAqv4vDJoSi4N4u9yIWWACc
	F7OF/EnMuBN86qoNTvbkYLOrVk8UOppunW8a+5pVRyDjO2BhV/71S6SX3e2f37B1wB5qSkI6r7+uB
	ooGKMgX2N4qb3/5HoE7Ev3uWltvWSLdJaa3CyorZ+Xu6/zutgQlGTGRpMhGnNG/KyxT2nWI3qMyv3
	4LRBgJAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogdZ0-006kEa-Kr; Fri, 07 Oct 2022 02:58:14 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogdYw-006kCX-Gr
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 02:58:12 +0000
Received: by mail-pg1-x52b.google.com with SMTP id a23so3458368pgi.10
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 19:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HHqtVs8j+ID4jgqw57yAt3FtHMv/XStpjtf/AugVE1Y=;
        b=FhXOA3SGFnbaWCxieNMDC1nYdp/i+xNk1Qz42dQC7LPITUdJcbeCD8MXgS1lEAl+Ff
         4Q7YoMcKPvYOvGsh593C5ovx3865nXrA4jLf7wZ6cTMZUoq9waJYSMYXPSQEZ+w3HOfW
         SISSGdo5Z4e4aPv8ylbZrhV5D33e1LqZ6TLSZgZCWwGJxqu9Znv9u20bgyXS8gVa0ASs
         6oMiHtBzpvqB4UNYNn2PU4RhiMUmuVPtXdpJnizixXLqZONDEPwtTxWTvvvXE6FfdHDg
         qTnnVa5pvh83sPhZySmfb1IUP1QM5OkEgfI1ZDKgrJT5AWmx6IBhYMpJj9qfGXXUNk4O
         NuLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHqtVs8j+ID4jgqw57yAt3FtHMv/XStpjtf/AugVE1Y=;
        b=bewrC85sG24rRMsCFs0i7dH96XcJVM5qRMfoU4aGpe9QHxq73Q9ifKUnMgohQFhxzQ
         yf8JWIfK1CK/quKHtKBV6GxLDnbHNtk6TWEkLevZN+IreO4e8enX7FROY39cAld49sRF
         DhZYNwa5tySfP7nBKg56hCVH1A80VeQofysfIIcbrXHpQZ+pXjQAlUnTsUBg2++lmrAs
         KeBtuScd6hdjmDV7/sLjyAn7qRmrUfGmJ/neuGRr9AUP/xwm3s0q8EIxb6XDMzT2dYAU
         X89ILPL/X74PRJwto85YxdhPyu4Ev/JVp27BvH/cdIKijEPUEF9qhjTe9dJCZ6F1UmOu
         TshA==
X-Gm-Message-State: ACrzQf14CMq0eMlg8begDrlqLLsMDCxrJnPqirlcdHy5s+yc83OqED69
	k9HHfK01/HXTM3zl80SviWpGRQ==
X-Google-Smtp-Source: AMsMyM53dmoZUhAeR2ad3+PvCeAPrlnhjAul4X/Pb1ufZcrCsgu+iGRJpvj0OGds7mcXRXSYxl4bQA==
X-Received: by 2002:a05:6a00:14d3:b0:546:e93c:4768 with SMTP id w19-20020a056a0014d300b00546e93c4768mr2621000pfu.36.1665111487824;
        Thu, 06 Oct 2022 19:58:07 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id f17-20020a170902ce9100b00172f4835f60sm333199plg.189.2022.10.06.19.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 19:58:07 -0700 (PDT)
Date: Thu, 06 Oct 2022 19:58:07 -0700 (PDT)
X-Google-Original-Date: Thu, 06 Oct 2022 19:57:50 PDT (-0700)
Subject: Re: [PATCH 3/3] EDAC/sifive: use sifive_ccache instead of sifive_l2
In-Reply-To: <20220829062202.3287-4-zong.li@sifive.com>
CC: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, greentime.hu@sifive.com, conor.dooley@microchip.com,
  devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  zong.li@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-fe7df193-2cac-4022-928d-a18e63f5e1c1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_195810_576415_7ADF1573 
X-CRM114-Status: GOOD (  20.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 28 Aug 2022 23:22:02 PDT (-0700), zong.li@sifive.com wrote:
> The sifive L2 has been renamed to sifive CCACHE, EDAC driver needs to
> apply the change as well

That means the build would be broken before this patch, which we 
generally try to avoid as it breaks things like bisecting.

>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  drivers/edac/Kconfig       |  2 +-
>  drivers/edac/sifive_edac.c | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> index 17562cf1fe97..456602d373b7 100644
> --- a/drivers/edac/Kconfig
> +++ b/drivers/edac/Kconfig
> @@ -473,7 +473,7 @@ config EDAC_ALTERA_SDMMC
>
>  config EDAC_SIFIVE
>  	bool "Sifive platform EDAC driver"
> -	depends on EDAC=y && SIFIVE_L2
> +	depends on EDAC=y && SIFIVE_CCACHE
>  	help
>  	  Support for error detection and correction on the SiFive SoCs.
>
> diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
> index ee800aec7d47..b844e2626fd5 100644
> --- a/drivers/edac/sifive_edac.c
> +++ b/drivers/edac/sifive_edac.c
> @@ -2,7 +2,7 @@
>  /*
>   * SiFive Platform EDAC Driver
>   *
> - * Copyright (C) 2018-2019 SiFive, Inc.
> + * Copyright (C) 2018-2022 SiFive, Inc.
>   *
>   * This driver is partially based on octeon_edac-pc.c
>   *
> @@ -10,7 +10,7 @@
>  #include <linux/edac.h>
>  #include <linux/platform_device.h>
>  #include "edac_module.h"
> -#include <soc/sifive/sifive_l2_cache.h>
> +#include <soc/sifive/sifive_ccache.h>
>
>  #define DRVNAME "sifive_edac"
>
> @@ -32,9 +32,9 @@ int ecc_err_event(struct notifier_block *this, unsigned long event, void *ptr)
>
>  	p = container_of(this, struct sifive_edac_priv, notifier);
>
> -	if (event == SIFIVE_L2_ERR_TYPE_UE)
> +	if (event == SIFIVE_CCACHE_ERR_TYPE_UE)
>  		edac_device_handle_ue(p->dci, 0, 0, msg);
> -	else if (event == SIFIVE_L2_ERR_TYPE_CE)
> +	else if (event == SIFIVE_CCACHE_ERR_TYPE_CE)
>  		edac_device_handle_ce(p->dci, 0, 0, msg);
>
>  	return NOTIFY_OK;
> @@ -67,7 +67,7 @@ static int ecc_register(struct platform_device *pdev)
>  		goto err;
>  	}
>
> -	register_sifive_l2_error_notifier(&p->notifier);
> +	register_sifive_ccache_error_notifier(&p->notifier);
>
>  	return 0;
>
> @@ -81,7 +81,7 @@ static int ecc_unregister(struct platform_device *pdev)
>  {
>  	struct sifive_edac_priv *p = platform_get_drvdata(pdev);
>
> -	unregister_sifive_l2_error_notifier(&p->notifier);
> +	unregister_sifive_ccache_error_notifier(&p->notifier);
>  	edac_device_del_device(&pdev->dev);
>  	edac_device_free_ctl_info(p->dci);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
