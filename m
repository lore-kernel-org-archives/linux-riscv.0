Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FBAC74A5B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Mar 2023 20:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkHqHQ/jc7cz/9pYLgmt9fPX49h3Xttc+o/jDWCc8sM=; b=NQccszIgtYMIqT
	Y7GOCb/EWjvxEGJMFk4XybMzr2vmE8eIoSN/IlmSsOMz7TdlY0BzUj53sQlLCYwDyQXYyRX7e4MKc
	LOw/WcGcX/nbq2M+PYu4tD1z5nYyYHblhF0YcjO1sa9PjpkMTZeo2jk2L9dpyx+CLac8x/A/RmTpY
	Koe0xe6dUs4kRoZ/T/kh9Schbm8IMbnG+hdu6uQobWkPwtNsirVLfbyoE96mLjRgYkzVNHCUnscTQ
	muucnWyBGWDMi8hZy7xCBY/3+rIMDSgL5cAm1i5zJJi79fmqufEo3diKxlxwGlXjnK6KRhj4PeF+Z
	qWfSKWKTGShXFGv8YKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgWdn-0098va-01;
	Sun, 26 Mar 2023 20:06:59 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgWdj-0098tv-0F
	for linux-riscv@lists.infradead.org;
	Sun, 26 Mar 2023 20:06:57 +0000
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1D87F44307
	for <linux-riscv@lists.infradead.org>; Sun, 26 Mar 2023 20:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1679861207;
	bh=B1v1iH+fF/1+vTpKguvwCqEy5/hkXODIAl2CV+b61Yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=OHa8rIra/GgR45o676aFcg+J4ma07N3ETL7AiPlTs8rVRrEr951ZIV7xRSLzqb3nV
	 6WonftSNBjjEKAN1mYF81lxKbQQvL2cbqVTiPYXWyQ3BraNojIDkYv7QZfBfxoIODE
	 7O0AH+bf6P4iOuG8U9BIGPl2d5faIzcmNieOut9YGavpOIyg6lI7PnZPRj/LqJ1vyS
	 KIal59fe+dtIfdhmRgJB5s/zxztwELZMCRfKxYYZfOiXgHIJCBbV+Wyunr+eYxkd2Z
	 50KUZ8y5wvoP8HJTQUUdRdZ4IcMcNcBZO/1AdzUPtNa8A7k09v9j/0Bp8R2+0R5S5o
	 uwwITGDI8sweQ==
Received: by mail-qv1-f70.google.com with SMTP id dg8-20020a056214084800b005acc280bf19so2797546qvb.22
        for <linux-riscv@lists.infradead.org>; Sun, 26 Mar 2023 13:06:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679861206;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B1v1iH+fF/1+vTpKguvwCqEy5/hkXODIAl2CV+b61Yg=;
        b=Iad6hxE8enWFC7pIHSXcwoi3pd/F98KRxUVIeiQYaqg2P3ADWKXO4vaNExXgyLPKCH
         cMzwycrx+bEYNMJftzB843G2vabnsa6DZ591u52+ouQmXRii3MUMm/7ZZqHlCbI3stPy
         QAEylPj1zIpjzmXwm5m6ZFie4803HIG6Roip9ePIEKX8UcZkHB0AUj3kjT7H0UISNYAz
         jr2DAFfNpkXYUCCGJ+DKLndSDHe0q91QO2xhz9al+gqLLspBoO15wiWvTsX3NQ8gDL35
         TvUoM1LWDtuIaJYsznX7l8uQpOlyd09aOBOeBJEXZ3ALOQn2PT1xWHzQai+HQUmNc4vN
         6dpg==
X-Gm-Message-State: AO0yUKWCdRb5H/OT865Y9jcaKbvskoBf+rf3ELgF50O+EuClk1jmrkHm
	TSF2uh+RU202ntQS0B8vDt8e6vtCbFWf0icWfMXgZdIBxQ6sRtvdy/ebNRu4EzMmlDvQ1wWG75p
	Dl1W4sWWC2iMnuP9iycHvLli6DdHIVCD4yv6DzO3fakOrEHl6EavHNBq+b02LqA==
X-Received: by 2002:a05:620a:3186:b0:745:a35f:ad71 with SMTP id bi6-20020a05620a318600b00745a35fad71mr2333700qkb.13.1679861206111;
        Sun, 26 Mar 2023 13:06:46 -0700 (PDT)
X-Google-Smtp-Source: AK7set8TkaE8FZSbREPKLW5Qlp+WuBYnT/gzlAiwH6L+GhwYNfQi8KBW9TXeSiBXBhxpryDxhtJkhJB8dLOlt3rFtRM=
X-Received: by 2002:a05:620a:3186:b0:745:a35f:ad71 with SMTP id
 bi6-20020a05620a318600b00745a35fad71mr2333680qkb.13.1679861205809; Sun, 26
 Mar 2023 13:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230320103750.60295-1-hal.feng@starfivetech.com>
 <20230320103750.60295-14-hal.feng@starfivetech.com> <CAJM55Z_jY67-SUZm3PDRKQTXZS4BJ6jUTBKXMqMTNW5MTFXK_g@mail.gmail.com>
 <c7bd699c-77fe-c01b-bbc6-be7ddc511a20@starfivetech.com>
In-Reply-To: <c7bd699c-77fe-c01b-bbc6-be7ddc511a20@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sun, 26 Mar 2023 22:06:29 +0200
Message-ID: <CAJM55Z-GAFO_7sUv0KeX28h=PWRscDie1S2=+kg6O0rZevhBug@mail.gmail.com>
Subject: Re: [PATCH v6 13/21] clk: starfive: Add StarFive JH7110 system clock driver
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
X-CRM114-CacheID: sfid-20230326_130655_280788_46186F4D 
X-CRM114-Status: GOOD (  32.13  )
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

On Sat, 25 Mar 2023 at 16:54, Hal Feng <hal.feng@starfivetech.com> wrote:
> On Fri, 24 Mar 2023 15:39:54 +0100, Emil Renner Berthing wrote:
> > On Mon, 20 Mar 2023 at 11:38, Hal Feng <hal.feng@starfivetech.com> wrote:
> [...]
> >> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> >> new file mode 100644
> >> index 000000000000..f98a508969c3
> >> --- /dev/null
> >> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> >> @@ -0,0 +1,450 @@
> >> +// SPDX-License-Identifier: GPL-2.0
> >> +/*
> >> + * StarFive JH7110 System Clock Driver
> >> + *
> >> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> >> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> >> + */
> >> +
> >> +#include <linux/clk.h>
> >> +#include <linux/clk-provider.h>
> >> +#include <linux/init.h>
> >> +#include <linux/io.h>
> >> +#include <linux/platform_device.h>
> >> +
> >> +#include <dt-bindings/clock/starfive,jh7110-crg.h>
> >> +
> >> +#include "clk-starfive-jh71x0.h"
> >> +
> >> +/* external clocks */
> >> +#define JH7110_SYSCLK_OSC                      (JH7110_SYSCLK_END + 0)
> >> +#define JH7110_SYSCLK_GMAC1_RMII_REFIN         (JH7110_SYSCLK_END + 1)
> >> +#define JH7110_SYSCLK_GMAC1_RGMII_RXIN         (JH7110_SYSCLK_END + 2)
> >> +#define JH7110_SYSCLK_I2STX_BCLK_EXT           (JH7110_SYSCLK_END + 3)
> >> +#define JH7110_SYSCLK_I2STX_LRCK_EXT           (JH7110_SYSCLK_END + 4)
> >> +#define JH7110_SYSCLK_I2SRX_BCLK_EXT           (JH7110_SYSCLK_END + 5)
> >> +#define JH7110_SYSCLK_I2SRX_LRCK_EXT           (JH7110_SYSCLK_END + 6)
> >> +#define JH7110_SYSCLK_TDM_EXT                  (JH7110_SYSCLK_END + 7)
> >> +#define JH7110_SYSCLK_MCLK_EXT                 (JH7110_SYSCLK_END + 8)
> >> +#define JH7110_SYSCLK_PLL0_OUT                 (JH7110_SYSCLK_END + 9)
> >> +#define JH7110_SYSCLK_PLL1_OUT                 (JH7110_SYSCLK_END + 10)
> >> +#define JH7110_SYSCLK_PLL2_OUT                 (JH7110_SYSCLK_END + 11)
> >> +
> >> +static const struct jh71x0_clk_data jh7110_sysclk_data[] __initconst = {
> >> +       /* root */
> >> +       JH71X0__MUX(JH7110_SYSCLK_CPU_ROOT, "cpu_root", 2,
> >> +                   JH7110_SYSCLK_OSC,
> >> +                   JH7110_SYSCLK_PLL0_OUT),
> >> +       JH71X0__DIV(JH7110_SYSCLK_CPU_CORE, "cpu_core", 7, JH7110_SYSCLK_CPU_ROOT),
> [...]
> >> +       /* qspi */
> >> +       JH71X0_GATE(JH7110_SYSCLK_QSPI_AHB, "qspi_ahb", CLK_IGNORE_UNUSED, JH7110_SYSCLK_AHB1),
> >> +       JH71X0_GATE(JH7110_SYSCLK_QSPI_APB, "qspi_apb", CLK_IGNORE_UNUSED, JH7110_SYSCLK_APB_BUS),
> >
> > Hi Hal,
> >
> > Thanks for going through clocks marked with CLK_IGNORE_UNUSED and
> > either remove the flags or mark them as critical.. It seems you've
> > missed these two though.
>
> The QSPI module of JH7110 supported by Cadence, requires three
> clocks (qspi_ahb, qspi_apb and qspi_ref), but the Cadence QSPI
> driver only supports one clock. As the StarFive QSPI support
> patches [1] had been accepted, I kept these two flags here.

The QSPI driver obviously needs to be fixed so it doesn't depend on
the bootloader leaving the clocks enabled. I don't think we should add
these flags just to work around that until it gets fixed.

> [1] https://lore.kernel.org/all/20230302105221.197421-1-william.qiu@starfivetech.com/
>
> >
> [...]
> >> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> >> index b372083d11c3..a8c60630ae73 100644
> >> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> >> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> >> @@ -5,6 +5,7 @@
> >>   * Copyright (C) 2021-2022 Emil Renner Berthing <kernel@esmil.dk>
> >>   */
> >>
> >> +#include <linux/auxiliary_bus.h>
> >>  #include <linux/clk-provider.h>
> >>  #include <linux/debugfs.h>
> >>  #include <linux/device.h>
> >> @@ -331,3 +332,52 @@ const struct clk_ops *starfive_jh71x0_clk_ops(u32 max)
> >>         return &jh71x0_clk_inv_ops;
> >>  }
> >>  EXPORT_SYMBOL_GPL(starfive_jh71x0_clk_ops);
> >> +
> >> +#if IS_ENABLED(CONFIG_CLK_STARFIVE_JH7110_SYS)
> >> +
> >> +static void jh7110_reset_unregister_adev(void *_adev)
> >> +{
> >> +       struct auxiliary_device *adev = _adev;
> >> +
> >> +       auxiliary_device_delete(adev);
> >> +}
> >> +
> >> +static void jh7110_reset_adev_release(struct device *dev)
> >> +{
> >> +       struct auxiliary_device *adev = to_auxiliary_dev(dev);
> >> +
> >> +       auxiliary_device_uninit(adev);
> >> +}
> >> +
> >> +int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
> >> +                                    const char *adev_name,
> >> +                                    u32 adev_id)
> >> +{
> >> +       struct auxiliary_device *adev;
> >> +       int ret;
> >> +
> >> +       adev = devm_kzalloc(priv->dev, sizeof(*adev), GFP_KERNEL);
> >> +       if (!adev)
> >> +               return -ENOMEM;
> >> +
> >> +       adev->name = adev_name;
> >> +       adev->dev.parent = priv->dev;
> >> +       adev->dev.release = jh7110_reset_adev_release;
> >> +       adev->id = adev_id;
> >> +
> >> +       ret = auxiliary_device_init(adev);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       ret = auxiliary_device_add(adev);
> >> +       if (ret) {
> >> +               auxiliary_device_uninit(adev);
> >> +               return ret;
> >> +       }
> >> +
> >> +       return devm_add_action_or_reset(priv->dev,
> >> +                                       jh7110_reset_unregister_adev, adev);
> >> +}
> >> +EXPORT_SYMBOL_GPL(jh7110_reset_controller_register);
> >> +
> >> +#endif
> >
> > Hey, sorry for not noticing this before, but is there a reason these
> > JH7110-specific functions must be added to the generic JH71x0 code?
> > Can't they be added to the JH7110 SYSCRG driver, and then let the
> > other CRG drivers depend on that (which they already do because of
> > clock dependencies)?
>
> It's ok to move these functions to clk-starfive-jh7110-sys.c. By the
> way, could I still keep the declaration in clk-starfive-jh71x0.h?

I'd just add a clk-starfive-jh7110.h file.

> Best regards,
> Hal
>
> >
> >> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
> >> index 34bb11c72eb7..cfe69aabd65a 100644
> >> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> >> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
> >> @@ -120,4 +120,12 @@ struct jh71x0_clk_priv {
> >>
> >>  const struct clk_ops *starfive_jh71x0_clk_ops(u32 max);
> >>
> >> +#if IS_ENABLED(CONFIG_CLK_STARFIVE_JH7110_SYS)
> >> +
> >> +int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
> >> +                                    const char *adev_name,
> >> +                                    u32 adev_id);
> >> +
> >> +#endif
> >> +
> >>  #endif
> >> --
> >> 2.38.1
> >>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
