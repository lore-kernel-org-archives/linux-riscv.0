Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97E3C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Cmr/wRHkqtPAPoBuEf+sHpluq1EAxOW3Nv5yeIM2Z08=; b=JOLwUib+CSMUUaErE/Iga3N5Xn
	WoO4epnLnH8rywFfGtsEeRnZh44Kwlxat4skXBY25Yj3hjgIPY2f2ArFMoAdQ5nFaxK3OmE9WAJdr
	nTf3gvZaBUFUfkUjbBXEZ9bSbwK5UdHrjfgyJJt/k8lzP1OZ4NtxSejhkLDltOkJiB1EFoAZL+8PT
	mL89dPFWZCibelU9NYXRzb2kMK3yiQAynqSN901tVrbjmKOLrtYpR42CvxS13SBvzY/XkJjFJi6LQ
	1OF8+i1XGlvAP0H2wUgxxpmIklV4s8p6nZ20WtDZYN9OGMV3zhb8C50Oa44iyoolZAmfcMBZGU58e
	iERWaNag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBaf7-00FfPn-0Z;
	Fri, 08 Dec 2023 13:13:01 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBaf3-00FfPL-3D
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 13:13:00 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9ABA241515
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 13:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702041175;
	bh=K9zgZeSUkIRgWWjMY0ssDLpumUX4eiD6JCn0PCUYG1U=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=g7CWAWM7LE9NDgp2iKsRf2J/mJ4VMrzl2ALULKIIOlaUq0QL3AuCpp8Mc7/KuLKGq
	 CVFqMrDV5eY390FzA/fbciqRTAHZhYg1XHD9SJBedYokhXOuh59qgWTbRNRNgyVZOx
	 vhWvHsON3ixKlsEccpdL53XFEX+ZJZEmyq+CFSI/LlR1DSSiE/SbmyHW/cTOsHWQmq
	 fFl+bT62l3Kzrg7cUpaVwKx/omysURH0qUjoAv05MDmCLvtBmQdFXJubGTaI3yHTnB
	 Y190X4LFM/VyKQ2nYYt38a6h0suow/AFwMxpLvilzME7R+1qDKNchC1hzx1wyNSzBS
	 7WRnbQo7aKCUg==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-42599db593fso17764641cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 05:12:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702041174; x=1702645974;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9zgZeSUkIRgWWjMY0ssDLpumUX4eiD6JCn0PCUYG1U=;
        b=cim8cqSadDN7tAzJgtB7F47lQJACOG+83YM+2uTzU/3uEB9OgQ+xc9x/H+7YG+UiaQ
         B0s8HIUjdgdo7n6h+qn9UpqIj/J9g/KC+dQpT1tzo5juEoPrrZ2a1KPUr0gVryr5u9/2
         RocwgM1SS2zEFCIDpjDVNYUIs/42I2G29fUKOTDL2PaqXb8bcVNss9VPWLkzuXpqT/Bo
         LSIrnLE2wg+KyTw5PgILiXyU7UiMaqNhxHdwXpaTlavWf79iDzp2aiQcOmu/Y7lB0vXz
         N4pr2yQFGiD3CjVX0iLYJdzcI/qMWTLozBEBE+6urswp3q0rWq9zZN782E7mVd21M3vg
         Kl9w==
X-Gm-Message-State: AOJu0YzWFT567SsCrxanFydZJNsacfDBReUQv/IZBsrWSFHr1MmlMTaE
	t5FE0dwdUIfoydr5HOhvv88ZZ2p+XTglsJn0JO10/CMiQol6VRZvZuWKorquyv5Rsrv0VhBLTEZ
	eIytJj1bwPaTI07kjaZ+6oiYtXncOs96MK06Wl3tymhEIsD1dovghmylnVSXOPg==
X-Received: by 2002:a05:622a:44d:b0:425:4054:bc5e with SMTP id o13-20020a05622a044d00b004254054bc5emr1204027qtx.58.1702041174446;
        Fri, 08 Dec 2023 05:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEMDwD1ffbD4BKzlSumuMZD3sOD+sywLn2kwgwb+azE8LEIA/r3L2mxNLPHVXDnFbuSkerKtd9gx6pjrsRIO9Y=
X-Received: by 2002:a05:622a:44d:b0:425:4054:bc5e with SMTP id
 o13-20020a05622a044d00b004254054bc5emr1204009qtx.58.1702041174155; Fri, 08
 Dec 2023 05:12:54 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 08:12:53 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206115000.295825-2-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com> <20231206115000.295825-2-jeeheng.sia@starfivetech.com>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 08:12:53 -0500
Message-ID: <CAJM55Z8uDFH1cmNdqLBy3sdF5ddxA5N1Mf_oeOmEiDg0z03AHg@mail.gmail.com>
Subject: Re: [PATCH v1 01/16] reset: starfive: Rename file name "jh71x0" to "common"
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, 
	xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_051258_435130_313F98C3 
X-CRM114-Status: GOOD (  15.09  )
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

Sia Jee Heng wrote:
> StarFive JH8100 shares a similar clock and reset design with JH7110.
> To facilitate the reuse of the file and its functionalities, files
> containing the "jh71x0" naming convention are renamed to use the
> "common" wording.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/clk/starfive/clk-starfive-jh7110-sys.c              | 2 +-
>  drivers/reset/starfive/Kconfig                              | 6 +++---
>  drivers/reset/starfive/Makefile                             | 2 +-
>  .../{reset-starfive-jh71x0.c => reset-starfive-common.c}    | 4 ++--
>  .../{reset-starfive-jh71x0.h => reset-starfive-common.h}    | 6 +++---
>  drivers/reset/starfive/reset-starfive-jh7100.c              | 2 +-
>  drivers/reset/starfive/reset-starfive-jh7110.c              | 4 ++--
>  .../{reset-starfive-jh71x0.h => reset-starfive-common.h}    | 4 ++--
>  8 files changed, 15 insertions(+), 15 deletions(-)
>  rename drivers/reset/starfive/{reset-starfive-jh71x0.c => reset-starfive-common.c} (97%)
>  rename drivers/reset/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (75%)
>  rename include/soc/starfive/{reset-starfive-jh71x0.h => reset-starfive-common.h} (81%)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 3884eff9fe93..6e45c580c9ba 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -14,7 +14,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/slab.h>
>
> -#include <soc/starfive/reset-starfive-jh71x0.h>
> +#include <soc/starfive/reset-starfive-common.h>
>
>  #include <dt-bindings/clock/starfive,jh7110-crg.h>
>
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> index d832339f61bc..29fbcf1a7d83 100644
> --- a/drivers/reset/starfive/Kconfig
> +++ b/drivers/reset/starfive/Kconfig
> @@ -1,12 +1,12 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>
> -config RESET_STARFIVE_JH71X0
> +config RESET_STARFIVE_COMMON
>  	bool
>
>  config RESET_STARFIVE_JH7100
>  	bool "StarFive JH7100 Reset Driver"
>  	depends on ARCH_STARFIVE || COMPILE_TEST
> -	select RESET_STARFIVE_JH71X0
> +	select RESET_STARFIVE_COMMON
>  	default ARCH_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive JH7100 SoC.
> @@ -15,7 +15,7 @@ config RESET_STARFIVE_JH7110
>  	bool "StarFive JH7110 Reset Driver"
>  	depends on CLK_STARFIVE_JH7110_SYS
>  	select AUXILIARY_BUS
> -	select RESET_STARFIVE_JH71X0
> +	select RESET_STARFIVE_COMMON
>  	default ARCH_STARFIVE
>  	help
>  	  This enables the reset controller driver for the StarFive JH7110 SoC.
> diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
> index 7a44b66fb9d5..582e4c160bd4 100644
> --- a/drivers/reset/starfive/Makefile
> +++ b/drivers/reset/starfive/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
> -obj-$(CONFIG_RESET_STARFIVE_JH71X0)		+= reset-starfive-jh71x0.o
> +obj-$(CONFIG_RESET_STARFIVE_COMMON)		+= reset-starfive-common.o
>
>  obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
>  obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-common.c
> similarity index 97%
> rename from drivers/reset/starfive/reset-starfive-jh71x0.c
> rename to drivers/reset/starfive/reset-starfive-common.c
> index 55bbbd2de52c..dab454e46bbf 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-common.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Reset driver for the StarFive JH71X0 SoCs
> + * Reset driver for the StarFive SoCs
>   *
>   * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
>   */
> @@ -12,7 +12,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/spinlock.h>
>
> -#include "reset-starfive-jh71x0.h"
> +#include "reset-starfive-common.h"
>
>  struct jh71x0_reset {
>  	struct reset_controller_dev rcdev;
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-common.h
> similarity index 75%
> rename from drivers/reset/starfive/reset-starfive-jh71x0.h
> rename to drivers/reset/starfive/reset-starfive-common.h
> index db7d39a87f87..266acc4b2caf 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-common.h
> @@ -3,12 +3,12 @@
>   * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
>   */
>
> -#ifndef __RESET_STARFIVE_JH71X0_H
> -#define __RESET_STARFIVE_JH71X0_H
> +#ifndef __RESET_STARFIVE_COMMON_H
> +#define __RESET_STARFIVE_COMMON_H
>
>  int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
>  				   void __iomem *assert, void __iomem *status,
>  				   const u32 *asserted, unsigned int nr_resets,
>  				   struct module *owner);
>
> -#endif /* __RESET_STARFIVE_JH71X0_H */
> +#endif /* __RESET_STARFIVE_COMMON_H */
> diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh7100.c
> index 2a56f7fd4ba7..546dea2e5811 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7100.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7100.c
> @@ -8,7 +8,7 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>
> -#include "reset-starfive-jh71x0.h"
> +#include "reset-starfive-common.h"
>
>  #include <dt-bindings/reset/starfive-jh7100.h>
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> index 29a43f0f2ad6..87dba01491ae 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7110.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -7,9 +7,9 @@
>
>  #include <linux/auxiliary_bus.h>
>
> -#include <soc/starfive/reset-starfive-jh71x0.h>
> +#include <soc/starfive/reset-starfive-common.h>
>
> -#include "reset-starfive-jh71x0.h"
> +#include "reset-starfive-common.h"
>
>  #include <dt-bindings/reset/starfive,jh7110-crg.h>
>
> diff --git a/include/soc/starfive/reset-starfive-jh71x0.h b/include/soc/starfive/reset-starfive-common.h
> similarity index 81%
> rename from include/soc/starfive/reset-starfive-jh71x0.h
> rename to include/soc/starfive/reset-starfive-common.h
> index 47b486ececc5..56d8f413cf18 100644
> --- a/include/soc/starfive/reset-starfive-jh71x0.h
> +++ b/include/soc/starfive/reset-starfive-common.h
> @@ -1,6 +1,6 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __SOC_STARFIVE_RESET_JH71X0_H
> -#define __SOC_STARFIVE_RESET_JH71X0_H
> +#ifndef __SOC_STARFIVE_RESET_COMMON_H
> +#define __SOC_STARFIVE_RESET_COMMON_H
>
>  #include <linux/auxiliary_bus.h>
>  #include <linux/compiler_types.h>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
