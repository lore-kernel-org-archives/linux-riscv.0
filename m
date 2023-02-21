Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AF5C61DA3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Feb 2023 17:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QR1gemzBZ/lsf+HJdhRzuHghwqzCnWA9W8E7v/JJqlo=; b=AYMMnG4DyGKQuH
	2Uf9n60iVrfEj035CM8yu60V5jgTsR5QghzMtv48jmDqCOu358p+mUmKbBO0HGQV2P7juUlM7eLN0
	0MmF5f8y0OoFXyyMUyjDxsy3t0gcS6FZ1+XJcZEn7m3BIEYAs8iHrsjJ6ekGzAW3zm8Ifz2FKGKsQ
	pMaYD8JPeqbN3Ae4X1nkJ1Cnpwqf5NQEwO+StInUFe0gJ7Pag7jGcFsPLPYO564znTXA+CR/rXqMH
	TCd9f57xT4QQWb1h/7xaKyLdeCgYaDvPOdConKVHxG88dEsShcXTzNDiVwXiB5Dw/5mjiUOVnB2Ek
	sC0F6MNfYLSV+Wk3vAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUW1g-0093Lc-6S; Tue, 21 Feb 2023 17:02:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUW1e-0093Ko-B1
	for linux-riscv@bombadil.infradead.org; Tue, 21 Feb 2023 17:01:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L4Qq5cpBFpgwagp9AE1jw12RMdS+BYeFZ1I210i8/Rk=; b=YVnIN0DK6OsbTlO1ocm0EEQS06
	9A06cFLtSiV6D3FQMjxETFdVGoSZfiLmGl1kVw1oj5RhzGTiW62q9hEI5CBsQDHJq/L/3nohpWOrN
	amm9AT9gqNdF89cYNLPpISsMip4g9K8g4hfjcDqZ1R6yJVGoTRAEszIqFhC+8d4Jz8PSq87at/vMn
	vWREOYoQ50xAkxjJAFA/F8iGECSMf/kyoKjCRs3LhW/qWhAFbCP/N2gLXjFNgL/H4ABy/RxGGRNx0
	12hRSOsGVN5eW2BsgaqRiSLcWANMDXn4T/nTEYZeNLU3GSkLHe2d7es9nfDT5HI2KFo98hhytPMax
	VGqj9Viw==;
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pUUe4-00CCXU-2g
	for linux-riscv@lists.infradead.org;
	Tue, 21 Feb 2023 15:33:38 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 917403F583
	for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 15:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676993606;
	bh=L4Qq5cpBFpgwagp9AE1jw12RMdS+BYeFZ1I210i8/Rk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=tIn4P7WfzB0P9PQ6E14pCgKRJfLZQf046YMb9vPEMDvYYOS9DpQKPVlpsxwxfUpAj
	 N2XHrF1nBqJpYVsnvUl6I94qOY2I6Lon4CiQRi97ZxnXWbYmcccE1YvS7jws4JQaP3
	 /LoitP73GZ+NP6vaqQZmckXTKppUMbYZ/XtU+mrfv79z6XAUXzwUf+wXatspbTv2Q2
	 KG1scrl0mSjOQ7L4hTkd5GTea6rTVQLvbmgiS/VCVIUuSNFYYf1KsYRP7xqHg/LkBa
	 bbvlMeYStUwjUKzRwnHdeQQaFYkdZCPcfRKAaa2w24aJI8/uqEjQ9F2vTh8x+vsz7C
	 s7VO/DZq24ErQ==
Received: by mail-qv1-f69.google.com with SMTP id y6-20020ad457c6000000b00535261af1b1so2215745qvx.13
        for <linux-riscv@lists.infradead.org>; Tue, 21 Feb 2023 07:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L4Qq5cpBFpgwagp9AE1jw12RMdS+BYeFZ1I210i8/Rk=;
        b=ObW0QaeUab9eZ7xLRSxtIM9ILnVk5lJ0LB41EpnEGGslwOgcVxePtVrHFtnvTTiUPt
         Uws4N0knLphBHmobrY/XGQ4Y1F8lfUb//v6sDL+feQCK9fcAiIcVGmdGuei+DUA56n7S
         uKA4Qz5R+ajPEZOjnEn7tOYIMwQVRQQ9cRGWyKQxg8GgtNHO/PKFv7iq6t5+C89MrCMI
         YsoNCa6ciG/u8OXewPgOa4qwekOOl5hUfRh0prSadaRKmMBZvSiEClqSM25btt9uwTYl
         Dq4jMv+DccZ3wUPHV/fzCyphckUhci/q5okBJn5pjZ7UgolrXoXhaFp5Y7acUfHr2ED4
         4CnQ==
X-Gm-Message-State: AO0yUKUuYJD+WMQwTGn/h3lj0nkAxwYnpa+HvOnCD+jhd1PNrcjAuHBr
	znxPf2kZ+kFmhpKzO0S7BcWdjlOwf7/5c/0Pffor/yEmZXxCJnTZb1AErQ6hopvuG50BFSeZMKe
	UBbHLL/yBRmJYJlVQTl2dUuTjvRHxswIwHYPcdTFbWHVtzXIgDGsNB5BvTgbLvQ==
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id y16-20020a0cd990000000b00570fc874f2cmr844739qvj.83.1676993605488;
        Tue, 21 Feb 2023 07:33:25 -0800 (PST)
X-Google-Smtp-Source: AK7set+eeC9t2mpELInJfxD7Yobd/u+LgOJZpX5mua0EuSfRFqXwkek8mhoYknpGc56WgnZGZ/ArALCDKxPQQlhlND4=
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id
 y16-20020a0cd990000000b00570fc874f2cmr844729qvj.83.1676993605220; Tue, 21 Feb
 2023 07:33:25 -0800 (PST)
MIME-Version: 1.0
References: <20230221024645.127922-1-hal.feng@starfivetech.com> <20230221024645.127922-14-hal.feng@starfivetech.com>
In-Reply-To: <20230221024645.127922-14-hal.feng@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Tue, 21 Feb 2023 16:33:09 +0100
Message-ID: <CAJM55Z_O9K=sCRXga9pMOXk9YjXc1v_V0e5S-8xN9Mi8gvHzvg@mail.gmail.com>
Subject: Re: [PATCH v4 13/19] reset: starfive: Add StarFive JH7110 reset driver
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_153333_063901_D7DA533E 
X-CRM114-Status: GOOD (  26.87  )
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

On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> Add auxiliary driver to support StarFive JH7110 system
> and always-on resets.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  drivers/reset/starfive/Kconfig                |  8 +++
>  drivers/reset/starfive/Makefile               |  1 +
>  .../reset/starfive/reset-starfive-jh7110.c    | 64 +++++++++++++++++++
>  .../reset/starfive/reset-starfive-jh71x0.h    |  6 ++
>  4 files changed, 79 insertions(+)
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
> index 000000000000..83577d1b7fc6
> --- /dev/null
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Reset driver for the StarFive JH7110 SoC
> + *
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/auxiliary_bus.h>
> +
> +#include "reset-starfive-jh71x0.h"
> +
> +#include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +static int jh7110_reset_probe(struct auxiliary_device *adev,
> +                             const struct auxiliary_device_id *id)
> +{
> +       struct reset_info *info = (struct reset_info *)(id->driver_data);
> +       void __iomem **base = (void __iomem **)dev_get_drvdata(adev->dev.parent);

Hi Hal,

I saw the kernel test robot complain about this, but I still wonder if
the extra level of indirection is really needed. Isn't it enough to
just add the explicit casts, so

dev_set_drvdata(priv->dev, (void *)priv->base);

in the clock drivers and here just

void __iomem *base = (void __iomem *)dev_get_drvdata(adev->dev.parent);

> +
> +       if (!info || !base)
> +               return -ENODEV;
> +
> +       return reset_starfive_jh71x0_register(&adev->dev, adev->dev.parent->of_node,
> +                                             *base + info->assert_offset,
> +                                             *base + info->status_offset,
> +                                             NULL,
> +                                             info->nr_resets,
> +                                             NULL);
> +}
> +
> +static const struct reset_info jh7110_sys_info = {
> +       .nr_resets = JH7110_SYSRST_END,
> +       .assert_offset = 0x2F8,
> +       .status_offset = 0x308,
> +};
> +
> +static const struct reset_info jh7110_aon_info = {
> +       .nr_resets = JH7110_AONRST_END,
> +       .assert_offset = 0x38,
> +       .status_offset = 0x3C,
> +};
> +
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
> +MODULE_AUTHOR("Hal Feng <hal.feng@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive JH7110 reset driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
> index db7d39a87f87..e485472e1adc 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
> @@ -6,6 +6,12 @@
>  #ifndef __RESET_STARFIVE_JH71X0_H
>  #define __RESET_STARFIVE_JH71X0_H
>
> +struct reset_info {
> +       unsigned int nr_resets;
> +       unsigned int assert_offset;
> +       unsigned int status_offset;
> +};

As far as I can tell this struct isn't used anywhere but in
reset-starfive-jh7110.c. If so just move it there, and in any case
please call it something less generic like struct jh7110_reset_info.

> +
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
