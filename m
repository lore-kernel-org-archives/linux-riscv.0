Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CBA8C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6A4463219
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:02:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6A4463219
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENFFyojl50QvVJnNc3cxioF4/frwiP2cQy+P7FL/iHw=; b=Z4V02f1gIws+cO
	FH6dK6j7hqwjyNB5q2keMS+VjpecJjtf9Ojll2RXSTCFeu+lkB8ODgPxZnzggG5e5sYj/+nIj+7aE
	ohvgWWoKVyLpzCnpfClFOP38iNw2jqG562rM17WqQMJU0mcNJKPenbjCa9qkyCs5jtvJF2QeKWI6T
	icqx6awP4CQ4e13eOqLv5oLgarTiOmxADPU5Y7sywEecWfzXbnlRzEtAXJQBrz0go/DT6lHP0sq7U
	AH71wCZBrd5BlqnbXrdNkSKuQq/NU6hiPEqZ7PQ4Mpagn+924iRoWePGHDAX70fAJMWdTx08AZif2
	ofMTNxAQvPiFC7ujRwWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn0u8-002G94-RS; Tue, 16 Nov 2021 16:01:52 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn0u5-002G88-8O
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 16:01:51 +0000
Received: by mail-ed1-x52b.google.com with SMTP id t5so4488929edd.0
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 08:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ySPSIhgGlDPGDfTKXPQfx7BBJ7PKQuLIgLGG9EGPNjU=;
 b=P+2E8VGaViDHPR1oCM4hxl7uAIciZnec+yHqRWkb3fHtlsZOQdkyJAB910tWekry2c
 oRS4ADqHapGgPr7/dgg4TstxNTnr0OpxsmoteMLvKuSpzKOy7N/hK7JdetI+WZ+8MCQm
 hDsc91gwb+jVjMWsUXJeADGC4s7N5kQwgM2Mk3MDrB9FcpH8VUyhOKFRgFRyO166fx8o
 H4u6QrphHFnaUz7hbgQ7YVRJW64h+bKTOLGkh0Kr8Uy7M+zi4rUOZPDwA2YgMNKGEplc
 jhrflLvc2I26TA21C3nhXPp6/bWR7EFzaTX0BY9tR3v4IJyx0KfZOdN7Ic4atndNB2XZ
 83Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ySPSIhgGlDPGDfTKXPQfx7BBJ7PKQuLIgLGG9EGPNjU=;
 b=vI89DoRmDBf2sQ1aSPE4ftcL8wf7e7aDWAiwPBEvyHpbovqIR4Kr4GbmbD36F4MzP+
 KvbvWN2tpwIPyLcFYS5/bS0E7j+0mbqpYRmI0yZ3ZrEptj0UB9dO4pUDsRgtj+zZxWfE
 KDwgOK5WHIO3BGQnfC8ZcWbg3ZHfkDWBRLKhuMTXR6fRWptDL5fG3gO9l7M6vRA2E1cS
 o8A+v21JjTqP7DX3GLG4KbNLpKMvPUFRrdW8OflV6LUsQzx+sX01OmC2+2fv4e8CGXfQ
 6y5N6N7Thf95lc/PxrZ97gVKylj6q8gyNvRXfK15/aonZIOh8XpMBpehgcCV05CQ+iuz
 eLsg==
X-Gm-Message-State: AOAM5320rXVG+TfgfiJHRROE/X5NfuvMIOvoODlN3WyHYiZcWFIY1RbS
 Z1xsCUiD/RXtkpn4ocvJg9CjKXLRVjsNTa8nwHc=
X-Google-Smtp-Source: ABdhPJyNe+0XxZ3ZIzgFXMTNdR5XxYAdKqcxEUj45ALL6BVP0JadkcURTMN/dOrb6B++nliOzLRdTmk/2Rz/zA1Etv4=
X-Received: by 2002:a05:6402:2067:: with SMTP id
 bd7mr11757034edb.240.1637078507230; 
 Tue, 16 Nov 2021 08:01:47 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
 <20211116150119.2171-10-kernel@esmil.dk>
In-Reply-To: <20211116150119.2171-10-kernel@esmil.dk>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Nov 2021 18:01:05 +0200
Message-ID: <CAHp75VcUziRv4_U9aDfKu2SKnqj1dab7y+N90tw0JaEKxWW_wQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_080149_337459_C0EFFCF0 
X-CRM114-Status: GOOD (  36.83  )
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

On Tue, Nov 16, 2021 at 5:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> Add a driver for the StarFive JH7100 reset controller.

Thanks!
Couple of minor remarks below and take my
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  MAINTAINERS                           |   7 +
>  drivers/reset/Kconfig                 |   7 +
>  drivers/reset/Makefile                |   1 +
>  drivers/reset/reset-starfive-jh7100.c | 176 ++++++++++++++++++++++++++
>  4 files changed, 191 insertions(+)
>  create mode 100644 drivers/reset/reset-starfive-jh7100.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2548ef1f8246..1152f5d94690 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18137,6 +18137,13 @@ F:     Documentation/devicetree/bindings/clock/starfive,jh7100-clkgen.yaml
>  F:     drivers/clk/starfive/clk-starfive-jh7100.c
>  F:     include/dt-bindings/clock/starfive-jh7100.h
>
> +STARFIVE JH7100 RESET CONTROLLER DRIVER
> +M:     Emil Renner Berthing <kernel@esmil.dk>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
> +F:     drivers/reset/reset-starfive-jh7100.c
> +F:     include/dt-bindings/reset/starfive-jh7100.h
> +
>  STATIC BRANCH/CALL
>  M:     Peter Zijlstra <peterz@infradead.org>
>  M:     Josh Poimboeuf <jpoimboe@redhat.com>
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 85024eb1d2ea..6f8ba0ddc05f 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -224,6 +224,13 @@ config RESET_SOCFPGA
>           This enables the reset driver for the SoCFPGA ARMv7 platforms. This
>           driver gets initialized early during platform init calls.
>
> +config RESET_STARFIVE_JH7100
> +       bool "StarFive JH7100 Reset Driver"
> +       depends on SOC_STARFIVE || COMPILE_TEST
> +       default SOC_STARFIVE
> +       help
> +         This enables the reset controller driver for the StarFive JH7100 SoC.
> +
>  config RESET_SUNXI
>         bool "Allwinner SoCs Reset Driver" if COMPILE_TEST && !ARCH_SUNXI
>         default ARCH_SUNXI
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 21d46d8869ff..bd0a97be18b5 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -29,6 +29,7 @@ obj-$(CONFIG_RESET_RZG2L_USBPHY_CTRL) += reset-rzg2l-usbphy-ctrl.o
>  obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
>  obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>  obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
> +obj-$(CONFIG_RESET_STARFIVE_JH7100) += reset-starfive-jh7100.o
>  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>  obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
>  obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
> diff --git a/drivers/reset/reset-starfive-jh7100.c b/drivers/reset/reset-starfive-jh7100.c
> new file mode 100644
> index 000000000000..2f7615cbf1dc
> --- /dev/null
> +++ b/drivers/reset/reset-starfive-jh7100.c
> @@ -0,0 +1,176 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Reset driver for the StarFive JH7100 SoC
> + *
> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +#include <linux/bitmap.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
> +#include <linux/spinlock.h>
> +
> +#include <dt-bindings/reset/starfive-jh7100.h>
> +
> +/* register offsets */
> +#define JH7100_RESET_ASSERT0   0x00
> +#define JH7100_RESET_ASSERT1   0x04
> +#define JH7100_RESET_ASSERT2   0x08
> +#define JH7100_RESET_ASSERT3   0x0c
> +#define JH7100_RESET_STATUS0   0x10
> +#define JH7100_RESET_STATUS1   0x14
> +#define JH7100_RESET_STATUS2   0x18
> +#define JH7100_RESET_STATUS3   0x1c

> +#if BITS_PER_LONG == 64
> +#define jh7100_reset_read      readq
> +#define jh7100_reset_write     writeq
> +#else
> +#define jh7100_reset_read      readl
> +#define jh7100_reset_write     writel
> +#endif

No need, just use always readq() / writeq() and include io-64-nonatomic-lo-hi

> +/*
> + * Writing a 1 to the n'th bit of the m'th ASSERT register asserts
> + * line 32m + n, and writing a 0 deasserts the same line.
> + * Most reset lines have their status inverted so a 0 bit in the STATUS
> + * register means the line is asserted and a 1 means it's deasserted. A few
> + * lines don't though, so store the expected value of the status registers when
> + * all lines are asserted.
> + */
> +static const DECLARE_BITMAP(jh7100_reset_asserted, 4 * 32) = {
> +       BITMAP_FROM_U64(BIT_ULL_MASK(JH7100_RST_U74) |
> +                       BIT_ULL_MASK(JH7100_RST_VP6_DRESET) |
> +                       BIT_ULL_MASK(JH7100_RST_VP6_BRESET) |
> +                       BIT_ULL_MASK(JH7100_RST_HIFI4_DRESET) |
> +                       BIT_ULL_MASK(JH7100_RST_HIFI4_BRESET)),
> +       BITMAP_FROM_U64(BIT_ULL_MASK(JH7100_RST_E24)),
> +};
> +
> +struct jh7100_reset {
> +       struct reset_controller_dev rcdev;
> +       /* protect registers against concurrent read-modify-write */
> +       spinlock_t lock;
> +       void __iomem *base;
> +};
> +
> +static inline struct jh7100_reset *
> +jh7100_reset_from(struct reset_controller_dev *rcdev)
> +{
> +       return container_of(rcdev, struct jh7100_reset, rcdev);
> +}
> +
> +static int jh7100_reset_update(struct reset_controller_dev *rcdev,
> +                              unsigned long id, bool assert)
> +{
> +       struct jh7100_reset *data = jh7100_reset_from(rcdev);
> +       unsigned long offset = id / BITS_PER_LONG;
> +       void __iomem *reg_assert = data->base + JH7100_RESET_ASSERT0 + offset * sizeof(long);
> +       void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(long);
> +       unsigned long mask = BIT_MASK(id);

It's better to group offset and mask, so it will give a hint to human
and compiler that
'/' + '%' can be optimized to one assembly instructions on some
architectures (in case of compile-test or new RISC-V types, I dunno if
they have it now).

And use BIT_WORD() for offset calculation. Same for the above function.

> +       unsigned long done = jh7100_reset_asserted[offset] & mask;
> +       unsigned long value;
> +       unsigned long flags;
> +       int ret;
> +
> +       if (!assert)
> +               done ^= mask;
> +
> +       spin_lock_irqsave(&data->lock, flags);
> +
> +       value = jh7100_reset_read(reg_assert);
> +       if (assert)
> +               value |= mask;
> +       else
> +               value &= ~mask;
> +       jh7100_reset_write(value, reg_assert);
> +
> +       /* if the associated clock is gated, deasserting might otherwise hang forever */
> +       ret = readx_poll_timeout_atomic(jh7100_reset_read, reg_status, value,
> +                                       (value & mask) == done, 0, 1000);
> +
> +       spin_unlock_irqrestore(&data->lock, flags);
> +       return ret;
> +}
> +
> +static int jh7100_reset_assert(struct reset_controller_dev *rcdev,
> +                              unsigned long id)
> +{
> +       return jh7100_reset_update(rcdev, id, true);
> +}
> +
> +static int jh7100_reset_deassert(struct reset_controller_dev *rcdev,
> +                                unsigned long id)
> +{
> +       return jh7100_reset_update(rcdev, id, false);
> +}
> +
> +static int jh7100_reset_reset(struct reset_controller_dev *rcdev,
> +                             unsigned long id)
> +{
> +       int ret;
> +
> +       ret = jh7100_reset_assert(rcdev, id);
> +       if (ret)
> +               return ret;
> +
> +       return jh7100_reset_deassert(rcdev, id);
> +}
> +
> +static int jh7100_reset_status(struct reset_controller_dev *rcdev,
> +                              unsigned long id)
> +{
> +       struct jh7100_reset *data = jh7100_reset_from(rcdev);
> +       unsigned long offset = id / BITS_PER_LONG;
> +       void __iomem *reg_status = data->base + JH7100_RESET_STATUS0 + offset * sizeof(long);
> +       unsigned long value = jh7100_reset_read(reg_status);
> +       unsigned long mask = BIT_MASK(id);
> +
> +       return !((value ^ jh7100_reset_asserted[offset]) & mask);
> +}
> +
> +static const struct reset_control_ops jh7100_reset_ops = {
> +       .assert         = jh7100_reset_assert,
> +       .deassert       = jh7100_reset_deassert,
> +       .reset          = jh7100_reset_reset,
> +       .status         = jh7100_reset_status,
> +};
> +
> +static int __init jh7100_reset_probe(struct platform_device *pdev)
> +{
> +       struct jh7100_reset *data;
> +
> +       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(data->base))
> +               return PTR_ERR(data->base);
> +
> +       data->rcdev.ops = &jh7100_reset_ops;
> +       data->rcdev.owner = THIS_MODULE;
> +       data->rcdev.nr_resets = JH7100_RSTN_END;
> +       data->rcdev.dev = &pdev->dev;
> +       data->rcdev.of_node = pdev->dev.of_node;
> +       spin_lock_init(&data->lock);
> +
> +       return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> +}
> +
> +static const struct of_device_id jh7100_reset_dt_ids[] = {
> +       { .compatible = "starfive,jh7100-reset" },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver jh7100_reset_driver = {
> +       .driver = {
> +               .name = "jh7100-reset",
> +               .of_match_table = jh7100_reset_dt_ids,
> +               .suppress_bind_attrs = true,
> +       },
> +};
> +builtin_platform_driver_probe(jh7100_reset_driver, jh7100_reset_probe);
> --
> 2.33.1
>


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
