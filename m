Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7181AC61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GVEqFoSvNAshj9cMZGdUXdUwSS75i7qoXV2Ru0r3eE0=; b=yxXHds6QYDL/bi
	YWpOpFtgWDUdoqhdOYe2CBjoqyjGmWUlU7VMiFzdOU3/L0yQHXvTl7tVMtYypvGB1uaNN37P6vXNJ
	AJlCin+SqWLEdEGkWjQiUG9/3lfpQvClic0kCxsyqcztSBTl59SFamXlMcJvywxPbbKc7Jl72E+Rj
	6yA24bX9qm3hfNNiEOHetHquWydNCjfY9PRC6nRCgbjLQEa9RQocoydWCEdmEKT40HsdHC6fqTmp6
	53GwmosrdqH1E/bCcNK2kLOo9bUILzPP0sm0xCN+aXNNJ/iLYjbg6AccuCA3jBzertHd1Y5TVM8kN
	t3QPgfbUOeI87i6ihI0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bzc-000POL-0v;
	Wed, 22 Nov 2023 01:25:28 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5bzZ-000PND-1T
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:25:27 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7a6774da682so273903539f.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 17:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700616324; x=1701221124; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BMxupQd497LdzSfq71N2Lrlf91nzxCDS16y5//A13wo=;
        b=YShOMuz2MetrF3TCPxjSarQq4xZc5ZDeLgUMMSzyYBwiUWGlib73wUJOO+posTIA0X
         wCef7u1BxRwoBsNfsSNqwFP2FVQcNHtSTKRxh/846cmptDGzzJ5b9PgYf146yAHQGhA2
         3X1tP9RJopTYnoiA0VVhdlPprPsQHjmiThUUcdqMsp8JevGrr1dsuCVtYC6cO22QWDqW
         0iOC+VRWgwDfUS9C5TlYY+zTb3C20G2Q06BkN/O77MQ+VJ64b7s6HTD1Q7TCvT1zQEWx
         dxymuGue3Lc9lBSsGtK9ZhDmVx4Txq2INfIp+7TRU0Uc1DjuKt1NTYxcOI1dpkjt/ZEC
         IUAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700616324; x=1701221124;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BMxupQd497LdzSfq71N2Lrlf91nzxCDS16y5//A13wo=;
        b=m+I8UGqi0X0lovjFxH0LkqpvQjDhzL3F+jURLDujZW2nEHEDWfgbKjDdB8il93kvNO
         OAIh0bDy6wYHccjUitI/RzuYJdwQ9ejB6VAtPnKdUTvQ5q4Qpx1Mktai9GsFuwkHsR4V
         A5i+WB5p9PEILcVLvCSqHfCsNyCJFz22hud4SsM3ZaEVIA/XqfHjUkV+0o5tJIQ0OGWD
         pGnQu83HLO1vl+GUzkptCYFQraELOEMApbvIkSmEM952jiijKE3x7l/MnAWlXGWSU6ZF
         SXktHhthW05UHkPT7TFPn2CEu6CXgIyH7a3lpyQSbfPSafnkniGfUSnngjnEZTIMZmnd
         1icw==
X-Gm-Message-State: AOJu0YxtfoFYLcu5IjXlUasTlL01XFNQ21s/twGTGT7omtvLi7ZIlBD+
	l9KDBw/BQROMYDQ0WeamvDPEiA==
X-Google-Smtp-Source: AGHT+IGd2vGwd7giL7IiRH+5KGiQaPdBluSITVY3kHLXCILv1oR63uIuSpDbZGfswF+tU7/fqS6Mqw==
X-Received: by 2002:a05:6602:1b04:b0:7a2:a8d5:e146 with SMTP id dk4-20020a0566021b0400b007a2a8d5e146mr576892iob.15.1700616324211;
        Tue, 21 Nov 2023 17:25:24 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id az2-20020a056638418200b004664b598273sm2122901jab.49.2023.11.21.17.25.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 17:25:23 -0800 (PST)
Message-ID: <d94d54d2-50a3-4dc8-9178-e69c118aeefe@sifive.com>
Date: Tue, 21 Nov 2023 19:25:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] soc: sifive: shunt ccache driver to drivers/cache
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Emil Renner Berthing <kernel@esmil.dk>,
 linux-kernel@vger.kernel.org
References: <20231012-mooing-refined-ad1ab421c0d3@spud>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231012-mooing-refined-ad1ab421c0d3@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_172525_508959_6AF76706 
X-CRM114-Status: GOOD (  19.97  )
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

Hi Conor,

On 2023-10-12 4:22 AM, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Move the ccache driver over to drivers/cache, out of the drivers/soc
> dumping ground, to this new collection point for cache controller
> drivers.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor@kernel.org>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Emil Renner Berthing <kernel@esmil.dk>
> CC: linux-kernel@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> ---
>  MAINTAINERS                                   | 14 +++++++-------
>  drivers/cache/Kconfig                         |  8 ++++++++
>  drivers/cache/Makefile                        |  3 ++-
>  drivers/{soc/sifive => cache}/sifive_ccache.c |  0
>  drivers/soc/Kconfig                           |  1 -
>  drivers/soc/Makefile                          |  1 -
>  drivers/soc/sifive/Kconfig                    | 10 ----------
>  drivers/soc/sifive/Makefile                   |  3 ---
>  8 files changed, 17 insertions(+), 23 deletions(-)
>  rename drivers/{soc/sifive => cache}/sifive_ccache.c (100%)
>  delete mode 100644 drivers/soc/sifive/Kconfig
>  delete mode 100644 drivers/soc/sifive/Makefile
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..ab32599fc799 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19580,6 +19580,13 @@ S:	Supported
>  N:	sifive
>  K:	[^@]sifive
>  
> +SIFIVE CACHE DRIVER
> +M:	Conor Dooley <conor@kernel.org>
> +L:	linux-riscv@lists.infradead.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> +F:	drivers/cache/sifive_ccache.c
> +
>  SIFIVE FU540 SYSTEM-ON-CHIP
>  M:	Paul Walmsley <paul.walmsley@sifive.com>
>  M:	Palmer Dabbelt <palmer@dabbelt.com>
> @@ -19595,13 +19602,6 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/dma/sifive,fu540-c000-pdma.yaml
>  F:	drivers/dma/sf-pdma/
>  
> -SIFIVE SOC DRIVERS
> -M:	Conor Dooley <conor@kernel.org>
> -L:	linux-riscv@lists.infradead.org
> -S:	Maintained
> -T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
> -F:	Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
> -F:	drivers/soc/sifive/
>  
>  SILEAD TOUCHSCREEN DRIVER
>  M:	Hans de Goede <hdegoede@redhat.com>
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index a57677f908f3..433b7ded8787 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -8,4 +8,12 @@ config AX45MP_L2_CACHE
>  	help
>  	  Support for the L2 cache controller on Andes Technology AX45MP platforms.
>  
> +if ARCH_SIFIVE || ARCH_STARFIVE

Since this is now in a file grouped/sorted by subsystem instead of by platform,
maybe it makes sense to convert this to a "depends on" line?

> +
> +config SIFIVE_CCACHE
> +	bool "Sifive Composable Cache controller"
> +	help
> +	  Support for the composable cache controller on SiFive platforms.
> +
> +endif
>  endmenu
> diff --git a/drivers/cache/Makefile b/drivers/cache/Makefile
> index 2012e7fb978d..7657cff3bd6c 100644
> --- a/drivers/cache/Makefile
> +++ b/drivers/cache/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
> -obj-$(CONFIG_AX45MP_L2_CACHE) += ax45mp_cache.o
> +obj-$(CONFIG_AX45MP_L2_CACHE)	+= ax45mp_cache.o
> +obj-$(CONFIG_SIFIVE_CCACHE)	+= sifive_ccache.o
> diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> similarity index 100%
> rename from drivers/soc/sifive/sifive_ccache.c
> rename to drivers/cache/sifive_ccache.c
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index d21e75d69294..76afeff93045 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -23,7 +23,6 @@ source "drivers/soc/qcom/Kconfig"
>  source "drivers/soc/renesas/Kconfig"
>  source "drivers/soc/rockchip/Kconfig"
>  source "drivers/soc/samsung/Kconfig"
> -source "drivers/soc/sifive/Kconfig"
>  source "drivers/soc/starfive/Kconfig"

This file has a conflict and needs to be rebased, but otherwise:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>

>  source "drivers/soc/sunxi/Kconfig"
>  source "drivers/soc/tegra/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index 0706a27d13be..ba8f5b5460e1 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -28,7 +28,6 @@ obj-y				+= qcom/
>  obj-y				+= renesas/
>  obj-y				+= rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
> -obj-y				+= sifive/
>  obj-y				+= sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
>  obj-y				+= ti/
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> deleted file mode 100644
> index 139884addc41..000000000000
> --- a/drivers/soc/sifive/Kconfig
> +++ /dev/null
> @@ -1,10 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -
> -if ARCH_SIFIVE || ARCH_STARFIVE
> -
> -config SIFIVE_CCACHE
> -	bool "Sifive Composable Cache controller"
> -	help
> -	  Support for the composable cache controller on SiFive platforms.
> -
> -endif
> diff --git a/drivers/soc/sifive/Makefile b/drivers/soc/sifive/Makefile
> deleted file mode 100644
> index 1f5dc339bf82..000000000000
> --- a/drivers/soc/sifive/Makefile
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -# SPDX-License-Identifier: GPL-2.0
> -
> -obj-$(CONFIG_SIFIVE_CCACHE)	+= sifive_ccache.o


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
