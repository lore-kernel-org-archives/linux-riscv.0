Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CF7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 17:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qrlw80T6T/bk+qnPsXHHb8KEBuw9nDqleksRoOyCtgM=; b=V0WHAtDw6PCW+e
	Ow52eGrM5XFhXsy8WToQlhk0FhxMHTFDnp7edwcYMrGVKo0b2gho/Nc8gQlMZEkkstKnDhGdGX/zX
	gZ2kG5ocUfJ3WMhfByJVTSlsDyAoTqi43gvgLDVJDMWR8jD1wngDcsGrn3A3+caX16E8Y6Q6f+o4U
	iChVuYuDywACeYfn87zdbhtdMSv30474J2DVnqgt2pCHLDWlE6pGwK4+Js5WkXfiteAwxZRNktfJd
	wwVlKyHJTTp/uT8FQG9WfhDuCy4+6oB3qvb1sGr2pq5EWxky94iPoRy1Zf5YY4VlOV/vhsmV8X3Ux
	YWRfyWRZX9TQdGQVrxFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4xN-005hHV-CM; Fri, 18 Nov 2022 17:15:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow4xK-005hFo-03
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 17:15:12 +0000
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 286F93F481
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 17:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668791708;
	bh=JOZUK9RGSwdPJyBqQhjDoeKgKG9IktmohsvMmg16Drk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=ktPTIeqCh/Ooq6hundAd5mRPzREgOrhzrpML+xLv3i2dJEWS/NG7XIqJxJ7NKQvoM
	 MPQRAbfjbpBexfrvR+T00YfGLK/gYqMswnpvtm5iIESU6qdQA0ujWQ55j4lEO9Vn3U
	 VMwapxHpHGeesPnw3ihx6MGz2MQkOlkm4cpjrxXJuTDlvfbhUpEvGcmi5RInT1fYiG
	 6QM1rNu5iQwPA5ILISCO4VbnnLhU2U3A3mpO6osrMFl9IDFPtMyC99pBQ8c09bRa1f
	 4Wu2FX38V1R+OjRDpL4iWChR6bJle7L3ti683zPpu1TV/1SxvlpQejaXyPF/C5z750
	 VlKId926gFHFg==
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-39967085ae9so1093907b3.11
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 09:15:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOZUK9RGSwdPJyBqQhjDoeKgKG9IktmohsvMmg16Drk=;
        b=zmhH03zWZPPB0fEI1SILdcDyugrbhQ6xO8okCmylC1TjrLh8gPwDxUXbQDizMemj8H
         DBML7sXO8eNbPbSvQ+IpHh49rF5quvvEluKMzhgQRXDtIhXROoqNCY/IODpR9kA0e7Wt
         3mUkacBq1j31AhOTu1LMlQ8tlM8mOeC1he4oVvy4+5pD9bDX8JPmpEUHWWHgft/2l2dx
         kBuqNEkKu4tVLNgzboUNYZ7FIIO0ZtxFqrk6xjxF7B8MufC595sIh4iuXLYK1eyKF7Ke
         0NqHNwGXX+eJCb4dm/myQKM9qacm2THue9NXnmpL0g5l/Pq6HxTNum3JH2MZptr99oU4
         kB4Q==
X-Gm-Message-State: ANoB5pkjJWjJs0l5qRH8WsEb49AJcSYKM9ftj29PzsBjesIsYehFfX00
	0AIgS1AQE6yBEt3dxFL+h2s69am4FWWoyk3zJakuZbtTi/JDW2B1U8eZ2f3o4myWGiUtJsCH45E
	hpJnEMMbad9ODiuBKuyx/GOF9Bgc4kiZa49I2SzU40d1pbiUwZZ6IA3z8en9NNA==
X-Received: by 2002:a25:e80f:0:b0:6df:927f:38c9 with SMTP id k15-20020a25e80f000000b006df927f38c9mr7103653ybd.92.1668791707105;
        Fri, 18 Nov 2022 09:15:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4I4oZFvr41MjaIHsCGKb3O39hviHXG7d6XOFbJmPb2RtvH+a1VVrT4/f02mov5cJMQQ0aIly9y6uogaTo3+EY=
X-Received: by 2002:a25:e80f:0:b0:6df:927f:38c9 with SMTP id
 k15-20020a25e80f000000b006df927f38c9mr7103630ybd.92.1668791706858; Fri, 18
 Nov 2022 09:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com> <20221118010627.70576-14-hal.feng@starfivetech.com>
In-Reply-To: <20221118010627.70576-14-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 18:14:50 +0100
Message-ID: <CAJM55Z8Vfoi5bPLNUOX-F5R5hfwg_20HiGLyjcmziYMiz24xBQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/14] reset: starfive: Add StarFive JH7110 reset driver
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_091510_408363_30E98386 
X-CRM114-Status: GOOD (  26.29  )
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

On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> Add auxiliary driver to support StarFive JH7110 system
> and always-on resets.
>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/reset/starfive/Kconfig                |  8 +++
>  drivers/reset/starfive/Makefile               |  1 +
>  .../reset/starfive/reset-starfive-jh7110.c    | 67 +++++++++++++++++++
>  .../reset/starfive/reset-starfive-jh71x0.h    |  7 ++
>  4 files changed, 83 insertions(+)
>  create mode 100644 drivers/reset/starfive/reset-starfive-jh7110.c
>
> diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
> index 9d15c4110e40..fab1a081af17 100644
> --- a/drivers/reset/starfive/Kconfig
> +++ b/drivers/reset/starfive/Kconfig
> @@ -10,3 +10,11 @@ config RESET_STARFIVE_JH7100
>         default SOC_STARFIVE
>         help
>           This enables the reset controller driver for the StarFive JH7100 SoC.
> +
> +config RESET_STARFIVE_JH7110
> +       bool "StarFive JH7110 Reset Driver"
> +       depends on AUXILIARY_BUS && CLK_STARFIVE_JH7110_SYS
> +       select RESET_STARFIVE_JH71X0
> +       default CLK_STARFIVE_JH7110_SYS
> +       help
> +         This enables the reset controller driver for the StarFive JH7110 SoC.
> diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
> index f6aa12466fad..7a44b66fb9d5 100644
> --- a/drivers/reset/starfive/Makefile
> +++ b/drivers/reset/starfive/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_RESET_STARFIVE_JH71X0)            += reset-starfive-jh71x0.o
>
>  obj-$(CONFIG_RESET_STARFIVE_JH7100)            += reset-starfive-jh7100.o
> +obj-$(CONFIG_RESET_STARFIVE_JH7110)            += reset-starfive-jh7110.o
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> new file mode 100644
> index 000000000000..00f3b4ecfb02
> --- /dev/null
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -0,0 +1,67 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Reset driver for the StarFive JH7110 SoC
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Hal Feng <hal.feng@starfivetech.com>
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +
> +#include "reset-starfive-jh71x0.h"
> +
> +#include <dt-bindings/reset/starfive-jh7110.h>
> +
> +static int jh7110_reset_probe(struct auxiliary_device *adev,
> +                             const struct auxiliary_device_id *id)
> +{
> +       struct reset_info *info = (struct reset_info *)(id->driver_data);
> +       void __iomem *base = dev_get_drvdata(adev->dev.parent);
> +
> +       if (!info || !base)
> +               return -ENODEV;
> +
> +       return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
> +                                             base + info->assert_offset,
> +                                             base + info->status_offset,
> +                                             info->asserted,
> +                                             info->nr_resets,
> +                                             false);
> +}
> +
> +static const struct reset_info jh7110_sys_info = {
> +       .nr_resets = JH7110_SYSRST_END,
> +       .assert_offset = 0x2F8,
> +       .status_offset = 0x308,
> +       .asserted = NULL,
> +};
> +
> +static const struct reset_info jh7110_aon_info = {
> +       .nr_resets = JH7110_AONRST_END,
> +       .assert_offset = 0x38,
> +       .status_offset = 0x3C,
> +       .asserted = NULL,
> +};

It doesn't seem like syscrg, aoncrg or stgcrg have any inverted lines.
Do you know if any other CRGs do? If not you can just leave out the
.asserted member and always pass NULL.

> +static const struct auxiliary_device_id jh7110_reset_ids[] = {
> +       {
> +               .name = "clk_starfive_jh71x0.reset-sys",
> +               .driver_data = (kernel_ulong_t)&jh7110_sys_info,
> +       },
> +       {
> +               .name = "clk_starfive_jh71x0.reset-aon",
> +               .driver_data = (kernel_ulong_t)&jh7110_aon_info,
> +       },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(auxiliary, jh7110_reset_ids);
> +
> +static struct auxiliary_driver jh7110_reset_driver = {
> +       .probe          = jh7110_reset_probe,
> +       .id_table       = jh7110_reset_ids,
> +};
> +module_auxiliary_driver(jh7110_reset_driver);
> +
> +MODULE_DESCRIPTION("StarFive JH7110 Reset Driver");
> +MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
> index e6b27110de48..63a94ee1b395 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
> @@ -6,6 +6,13 @@
>  #ifndef __RESET_STARFIVE_JH71X0_H
>  #define __RESET_STARFIVE_JH71X0_H
>
> +struct reset_info {
> +       unsigned int nr_resets;
> +       unsigned int assert_offset;
> +       unsigned int status_offset;
> +       const u32 *asserted;
> +};

This struct isn't used outside of reset-starfive-jh7110.c, so no need
to define it in this header.
Also consider calling it jh7110_reset_info so it blends in with the
functions defined in that file.

>  int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_node,
>                                    void __iomem *assert, void __iomem *status,
>                                    const u32 *asserted, unsigned int nr_resets,
> --
> 2.38.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
