Return-Path: <SRS0=TeVA=MH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297F6C12002
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jul 2021 01:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D19A2613B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jul 2021 01:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D19A2613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s9DnyTlIqhgJ//ugtZl3WsTIDvHFAfVrZ/P05qs25Do=; b=JVad8qU28mb9aO
	nfG7JzDAQlPMd+H9xHRmBrj0rnQbePvt1fCC4P25tClFlT99HbKE9IrcEe8v+Klqpf1IsxcFPdewc
	KHKZYu8vAgapWQdRIG6sRqWvz8DCICCKPBROYRC7OBWt4ExD55vGkm2lAx5WigLfYr+nu2Iu7n2iB
	nvRJjKDzYy0gWlARuVnaJyM3zFvXeYZu33S3cZXxb29+RuAEhiSuanfREqKURgTyhklaO22mwoOf0
	icN8LtGiHNUCcE/xUBkFQP4nvgQ6q3zOI0k4jvqz5esnSf6SLLSgBFiqT5+3JbsyJ9Q25lK4RaK4J
	4dfata3/uFq4UQJA30vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3qVK-00GpAS-QX; Thu, 15 Jul 2021 01:49:34 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3qVC-00Gp9g-2m
 for linux-riscv@lists.infradead.org; Thu, 15 Jul 2021 01:49:28 +0000
Received: by mail-oi1-x22f.google.com with SMTP id t143so4606767oie.8
 for <linux-riscv@lists.infradead.org>; Wed, 14 Jul 2021 18:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mXpNyOyXWMYKpMN1qWv5H0GBm/j+VjKgL00Ru4rlGik=;
 b=Vc6DIqrUCFihVJxiYv2s0sz0UM6BSHgSbKh+V+vu0cDicRCA9cyGX42cXe78h983p6
 OsFkmS6vvZnDdZxQ1H04n+cpYA38SAVzew2uMcC1rM8zogJsPG9PxyAmT5w7TMrvDJRt
 4OipRVeqhCpcqeGQDrKyDUgFLFdLHIGLSSJIylvoKm0Z1F4nhum3VXdUPg7cdTgFXhAz
 qQIpUAIgTwnWkP+yiGD9hLeTIh3CvcBSTSOZ47GloE1MAqGl9UWaOycIiKBQ24y4my6o
 DXxaj3a6Aaru9Vp9k12q3dhw8W9aMIQ3JTAF5R5TaQmo7V1xGOt+hi4K8H6K/tPehurr
 fUNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mXpNyOyXWMYKpMN1qWv5H0GBm/j+VjKgL00Ru4rlGik=;
 b=r/AJhribsIw5quJxSyhlcX1otqs+57sIpBr5GqK/5jCb+ZQp4ZN/JRq6e2s/uLoWrg
 Ht4sZRcpVLp7VB0oCj5AZ/U+Hz62MK3URNYKQPrT57SsmC4r/nTGcuIcP/REHYSr9hBD
 Ml6c7RmwrJ6fg6IRWmvCKoakCuIJG5jM41NST7kS+niGZDbS1DZGllAtWPfzjJz9GwqO
 P/mXqjpHNjnnUmHHz9QYRQO+57KR70XL4Bh3cqRMVeEtTVHEH2JlwpzhRk7FxC1vGbnO
 5CwOEhRaElTe/M1do/dJJuwoLzqe/MCeEc3jP/4kQvP6tA8X5Wd+PO/x62WgPUH4tywF
 ZW8Q==
X-Gm-Message-State: AOAM531tZQ2Af1pxd+smSDXstF2A8997QgBNDKf9sDeLggVWLHJ1WKoh
 F0xcyT/StFzOHvQbeLR4iOPu6estDy+gk4zrvuI=
X-Google-Smtp-Source: ABdhPJx19NXVJbqyKQm403NMgC5SnDwF/wFzawtpW0DalX0MU+QDEL3WSaQREI/pqg8Ih19FqAW0fEXwkuwFtNKOqVo=
X-Received: by 2002:aca:af10:: with SMTP id y16mr5093465oie.12.1626313764133; 
 Wed, 14 Jul 2021 18:49:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210701002037.912625-1-drew@beagleboard.org>
 <20210701002037.912625-3-drew@beagleboard.org>
In-Reply-To: <20210701002037.912625-3-drew@beagleboard.org>
From: Ley Foon Tan <lftan.linux@gmail.com>
Date: Thu, 15 Jul 2021 09:49:12 +0800
Message-ID: <CAFiDJ5_mSuGx2pWm_LTitGEnScbv+MMbP1+N54CGvH8p8PE2PQ@mail.gmail.com>
Subject: Re: [RFC PATH 2/2] gpio: starfive-jh7100: Add StarFive JH7100 GPIO
 driver
To: Drew Fustini <drew@beagleboard.org>
Cc: Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Michael Zhu <michael.zhu@starfivetech.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Fu Wei <tekkamanninja@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Emil Renner Berthing <kernel@esmil.dk>, Huan Feng <huan.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_184926_193982_390B8D91 
X-CRM114-Status: GOOD (  28.64  )
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

Hi Drew


On Thu, Jul 1, 2021 at 8:25 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Add GPIO driver for the StarFive JH7100 SoC [1] used on the
> BeagleV Starlight JH7100 board [2].
>
> [1] https://github.com/starfive-tech/beaglev_doc/
> [2] https://github.com/beagleboard/beaglev-starlight
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Huan Feng <huan.feng@starfivetech.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  MAINTAINERS                         |   8 +
>  drivers/gpio/Kconfig                |   8 +
>  drivers/gpio/Makefile               |   1 +
>  drivers/gpio/gpio-starfive-jh7100.c | 425 ++++++++++++++++++++++++++++
>  4 files changed, 442 insertions(+)
>  create mode 100644 drivers/gpio/gpio-starfive-jh7100.c

[...]

> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index d7c81e1611a4..939922eaf5f3 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -132,6 +132,7 @@ obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)    += gpio-sama5d2-piobu.o
>  obj-$(CONFIG_GPIO_SCH311X)             += gpio-sch311x.o
>  obj-$(CONFIG_GPIO_SCH)                 += gpio-sch.o
>  obj-$(CONFIG_GPIO_SIFIVE)              += gpio-sifive.o
> +obj-$(CONFIG_GPIO_STARFIVE_JH7100)     += gpio-starfive-jh7100.o
Sort in alphabetical order.

>  obj-$(CONFIG_GPIO_SIOX)                        += gpio-siox.o
>  obj-$(CONFIG_GPIO_SL28CPLD)            += gpio-sl28cpld.o
>  obj-$(CONFIG_GPIO_SODAVILLE)           += gpio-sodaville.o
> diff --git a/drivers/gpio/gpio-starfive-jh7100.c b/drivers/gpio/gpio-starfive-jh7100.c
> new file mode 100644
> index 000000000000..b94ebfe9eaf7
> --- /dev/null
> +++ b/drivers/gpio/gpio-starfive-jh7100.c
> @@ -0,0 +1,425 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * GPIO driver for StarFive JH7100 SoC
> + *
> + * Copyright (C) 2020 Shanghai StarFive Technology Co., Ltd.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
Include files sort in alphabetical orde too.

> +
> +/*
> + * refer to Section 12. GPIO Registers in JH7100 datasheet:
> + * https://github.com/starfive-tech/beaglev_doc
> + */
> +
> +/* global enable */
> +#define GPIO_EN                0x0
> +
> +/* interrupt type */
> +#define GPIO_IS_LOW    0x10
> +#define GPIO_IS_HIGH   0x14
> +
> +/* edge trigger interrupt type */
> +#define GPIO_IBE_LOW   0x18
> +#define GPIO_IBE_HIGH  0x1c
> +
> +/* edge trigger interrupt polarity */
> +#define GPIO_IEV_LOW   0x20
> +#define GPIO_IEV_HIGH  0x24
> +
> +/* interrupt max */
> +#define GPIO_IE_LOW    0x28
> +#define GPIO_IE_HIGH   0x2c
> +
> +/* clear edge-triggered interrupt */
> +#define GPIO_IC_LOW    0x30
> +#define GPIO_IC_HIGH   0x34
> +
> +/* edge-triggered interrupt status (read-only) */
> +#define GPIO_RIS_LOW   0x38
> +#define GPIO_RIS_HIGH  0x3c
> +
> +/* interrupt status after masking (read-only) */
> +#define GPIO_MIS_LOW   0x40
> +#define GPIO_MIS_HIGH  0x44
> +
> +/* data value of gpio */
> +#define GPIO_DIN_LOW   0x48
> +#define GPIO_DIN_HIGH  0x4c
> +
> +/* GPIO0_DOUT_CFG is 0x50, GPIOn_DOUT_CFG is 0x50+(n*8) */
> +#define GPIO_DOUT_X_REG        0x50
> +
> +/* GPIO0_DOEN_CFG is 0x54, GPIOn_DOEN_CFG is 0x54+(n*8) */
> +#define GPIO_DOEN_X_REG        0x54
> +
> +#define MAX_GPIO        64
> +
> +struct starfive_gpio {
> +       raw_spinlock_t          lock;
> +       void __iomem            *base;
> +       struct gpio_chip        gc;
> +       unsigned long           enabled;
> +       unsigned int            trigger[MAX_GPIO];
> +       unsigned int            irq_parent[MAX_GPIO];
> +};
> +
> +static int starfive_direction_input(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +       unsigned long flags;
> +
> +       if (offset >= gc->ngpio)
> +               return -EINVAL;
> +
> +       raw_spin_lock_irqsave(&chip->lock, flags);
> +       writel_relaxed(0x1, chip->base + GPIO_DOEN_X_REG + offset * 8);
> +       raw_spin_unlock_irqrestore(&chip->lock, flags);
> +
> +       return 0;
> +}
> +
> +static int starfive_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +       unsigned long flags;
> +
> +       if (offset >= gc->ngpio)
> +               return -EINVAL;
> +
> +       raw_spin_lock_irqsave(&chip->lock, flags);
> +       writel_relaxed(0x0, chip->base + GPIO_DOEN_X_REG + offset * 8);
> +       writel_relaxed(value, chip->base + GPIO_DOUT_X_REG + offset * 8);
> +       raw_spin_unlock_irqrestore(&chip->lock, flags);
> +
> +       return 0;
> +}
> +
> +static int starfive_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +
> +       if (offset >= gc->ngpio)
> +               return -EINVAL;
> +
> +       return readl_relaxed(chip->base + GPIO_DOEN_X_REG + offset * 8) & 0x1;
> +}
> +
> +static int starfive_get_value(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +       int value;
> +
> +       if (offset >= gc->ngpio)
> +               return -EINVAL;
> +
> +       if (offset < 32) {
> +               value = readl_relaxed(chip->base + GPIO_DIN_LOW);
> +               value = (value >> offset) & 0x1;
> +       } else {
> +               value = readl_relaxed(chip->base + GPIO_DIN_HIGH);
> +               value = (value >> (offset - 32)) & 0x1;
> +       }
> +
> +       return value;
> +}
> +
> +static void starfive_set_value(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +       unsigned long flags;
> +
> +       if (offset >= gc->ngpio)
> +               return;
> +
> +       raw_spin_lock_irqsave(&chip->lock, flags);
> +       writel_relaxed(value, chip->base + GPIO_DOUT_X_REG + offset * 8);
> +       raw_spin_unlock_irqrestore(&chip->lock, flags);
> +}
> +
> +static void starfive_set_ie(struct starfive_gpio *chip, int offset)
> +{
> +       unsigned long flags;
> +       int old_value, new_value;
> +       int reg_offset, index;
> +
> +       if (offset < 32) {
> +               reg_offset = 0;
> +               index = offset;
> +       } else {
> +               reg_offset = 4;
> +               index = offset - 32;
> +       }
Quite a number of places do this checking/calculation, can move this
to a helper function.

> +       raw_spin_lock_irqsave(&chip->lock, flags);
> +       old_value = readl_relaxed(chip->base + GPIO_IE_LOW + reg_offset);
> +       new_value = old_value | (1 << index);
> +       writel_relaxed(new_value, chip->base + GPIO_IE_LOW + reg_offset);
> +       raw_spin_unlock_irqrestore(&chip->lock, flags);
> +}
> +
> +static int starfive_irq_set_type(struct irq_data *d, unsigned int trigger)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +       int offset = irqd_to_hwirq(d);
> +       unsigned int reg_is, reg_ibe, reg_iev;
> +       int reg_offset, index;
> +
> +       if (offset < 0 || offset >= gc->ngpio)
> +               return -EINVAL;
> +
> +       if (offset < 32) {
> +               reg_offset = 0;
> +               index = offset;
> +       } else {
> +               reg_offset = 4;
> +               index = offset - 32;
> +       }
> +
> +       reg_is = readl_relaxed(chip->base + GPIO_IS_LOW + reg_offset);
> +       reg_ibe = readl_relaxed(chip->base + GPIO_IBE_LOW + reg_offset);
> +       reg_iev = readl_relaxed(chip->base + GPIO_IEV_LOW + reg_offset);
> +
> +       switch (trigger) {
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               reg_is  &= ~(1 << index);
> +               reg_ibe &= ~(1 << index);
> +               reg_iev |= (1 << index);
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               reg_is  &= ~(1 << index);
> +               reg_ibe &= ~(1 << index);
> +               reg_iev &= (1 << index);
> +               break;
> +       case IRQ_TYPE_EDGE_BOTH:
> +               reg_is  |= ~(1 << index);
> +               reg_ibe |= ~(1 << index);
> +               // no need to set edge type when both
Use /**/ comment style.

> +               break;
> +       case IRQ_TYPE_EDGE_RISING:
> +               reg_is  |= ~(1 << index);
> +               reg_ibe &= ~(1 << index);
> +               reg_iev |= (1 << index);
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               reg_is  |= ~(1 << index);
> +               reg_ibe &= ~(1 << index);
> +               reg_iev &= (1 << index);
> +               break;
> +       }
> +
> +       writel_relaxed(reg_is, chip->base + GPIO_IS_LOW + reg_offset);
> +       writel_relaxed(reg_ibe, chip->base + GPIO_IBE_LOW + reg_offset);
> +       writel_relaxed(reg_iev, chip->base + GPIO_IEV_LOW + reg_offset);
> +       chip->trigger[offset] = trigger;
> +       starfive_set_ie(chip, offset);
> +       return 0;
> +}
> +
> +/* chained_irq_{enter,exit} already mask the parent */
> +static void starfive_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +       unsigned int value;
> +       int offset = irqd_to_hwirq(d);
> +       int reg_offset, index;
> +
> +       if (offset < 0 || offset >= gc->ngpio)
> +               return;
> +
> +       if (offset < 32) {
> +               reg_offset = 0;
> +               index = offset;
> +       } else {
> +               reg_offset = 4;
> +               index = offset - 32;
> +       }
> +
> +       value = readl_relaxed(chip->base + GPIO_IE_LOW + reg_offset);
> +       value &= ~(0x1 << index);
> +       writel_relaxed(value, chip->base + GPIO_IE_LOW + reg_offset);
> +}
> +
> +static void starfive_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +       unsigned int value;
> +       int offset = irqd_to_hwirq(d);
> +       int reg_offset, index;
> +
> +       if (offset < 0 || offset >= gc->ngpio)
> +               return;
> +
> +       if (offset < 32) {
> +               reg_offset = 0;
> +               index = offset;
> +       } else {
> +               reg_offset = 4;
> +               index = offset - 32;
> +       }
> +
> +       value = readl_relaxed(chip->base + GPIO_IE_LOW + reg_offset);
> +       value |= (0x1 << index);
> +       writel_relaxed(value, chip->base + GPIO_IE_LOW + reg_offset);
> +}
> +
> +static void starfive_irq_enable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +       int offset = irqd_to_hwirq(d);
> +
> +       starfive_irq_unmask(d);
> +       assign_bit(offset, &chip->enabled, 1);
> +}
> +
> +static void starfive_irq_disable(struct irq_data *d)
> +{
> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +       struct starfive_gpio *chip = gpiochip_get_data(gc);
> +       int offset = irqd_to_hwirq(d) % MAX_GPIO; // must not fail
> +
> +       assign_bit(offset, &chip->enabled, 0);
> +       starfive_set_ie(chip, offset);
> +}
> +
> +static struct irq_chip starfive_irqchip = {
> +       .name           = "starfive-jh7100-gpio",
> +       .irq_set_type   = starfive_irq_set_type,
> +       .irq_mask       = starfive_irq_mask,
> +       .irq_unmask     = starfive_irq_unmask,
> +       .irq_enable     = starfive_irq_enable,
> +       .irq_disable    = starfive_irq_disable,
> +};
> +
> +static irqreturn_t starfive_irq_handler(int irq, void *gc)
> +{
> +       int offset;
> +       int reg_offset, index;
> +       unsigned int value;
> +       unsigned long flags;
> +       struct starfive_gpio *chip = gc;
> +
> +       for (offset = 0; offset < MAX_GPIO; offset++) {
> +               if (offset < 32) {
> +                       reg_offset = 0;
> +                       index = offset;
> +               } else {
> +                       reg_offset = 4;
> +                       index = offset - 32;
> +               }
> +
> +               raw_spin_lock_irqsave(&chip->lock, flags);
> +               value = readl_relaxed(chip->base + GPIO_MIS_LOW + reg_offset);
> +               if (value & BIT(index))
> +                       writel_relaxed(BIT(index), chip->base + GPIO_IC_LOW +
> +                                       reg_offset);
> +               raw_spin_unlock_irqrestore(&chip->lock, flags);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int starfive_gpio_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct starfive_gpio *chip;
> +       struct gpio_irq_chip *girq;
> +       struct resource *res;
> +       int irq, ret, ngpio;
> +
> +       chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
> +       if (!chip)
> +               return -ENOMEM;
> +
> +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       chip->base = devm_ioremap_resource(dev, res);
Can use device managed function devm_
devm_platform_ioremap_resource(), then combile these 2 functions into
1.

> +       if (IS_ERR(chip->base)) {
> +               dev_err(dev, "failed to allocate device memory\n");
Perhaps change "allocate" to get or ioremap.

> +               return PTR_ERR(chip->base);
> +       }
> +
> +       irq = platform_get_irq(pdev, 0);
> +       if (irq < 0) {
> +               dev_err(dev, "Cannot get IRQ resource\n");
> +               return irq;
> +       }
> +
> +       raw_spin_lock_init(&chip->lock);
> +       chip->gc.direction_input = starfive_direction_input;
> +       chip->gc.direction_output = starfive_direction_output;
> +       chip->gc.get_direction = starfive_get_direction;
> +       chip->gc.get = starfive_get_value;
> +       chip->gc.set = starfive_set_value;
> +       chip->gc.base = 0;
> +       chip->gc.ngpio = MAX_GPIO;
> +       chip->gc.label = dev_name(dev);
> +       chip->gc.parent = dev;
> +       chip->gc.owner = THIS_MODULE;
> +
> +       girq = &chip->gc.irq;
> +       girq->chip = &starfive_irqchip;
> +       girq->parent_handler = NULL;
> +       girq->num_parents = 0;
> +       girq->parents = NULL;
> +       girq->default_type = IRQ_TYPE_NONE;
> +       girq->handler = handle_simple_irq;
> +
> +       ret = gpiochip_add_data(&chip->gc, chip);
Use devm_version, devm_gpiochip_add_data().

> +       if (ret) {
> +               dev_err(dev, "gpiochip_add_data ret=%d!\n", ret);
> +               return ret;
> +       }
> +
> +       /* Disable all GPIO interrupts before enabling parent interrupts */
Clear any pending interrupts as well when initialization.

> +       iowrite32(0, chip->base + GPIO_IE_HIGH);
> +       iowrite32(0, chip->base + GPIO_IE_LOW);
> +       chip->enabled = 0;
> +
> +       ret = devm_request_irq(dev, irq, starfive_irq_handler, IRQF_SHARED,
> +                              dev_name(dev), chip);
> +       if (ret) {
> +               dev_err(dev, "IRQ handler registering failed (%d)\n", ret);
> +               return ret;
> +       }
> +
> +       writel_relaxed(1, chip->base + GPIO_EN);
> +
> +       dev_info(dev, "StarFive GPIO chip registered %d GPIOs\n", ngpio);
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id starfive_gpio_match[] = {
> +       { .compatible = "starfive,jh7100-gpio", },
> +       { },
> +};
> +
> +static struct platform_driver starfive_gpio_driver = {
> +       .probe  = starfive_gpio_probe,
> +       .driver = {
> +               .name = "gpio_starfive_jh7100",
> +               .of_match_table = of_match_ptr(starfive_gpio_match),
> +       },
> +};
> +
> +static int __init starfive_gpio_init(void)
> +{
> +       return platform_driver_register(&starfive_gpio_driver);
> +}
> +subsys_initcall(starfive_gpio_init);
> +
> +static void __exit starfive_gpio_exit(void)
> +{
> +       platform_driver_unregister(&starfive_gpio_driver);
Do you expect GPIO driver can be removed?
The driver needs proper removal, provides .remove callback.
Example, call gpiochip_remove() , disable interrupt when removing.

> +}
> +module_exit(starfive_gpio_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Huan Feng <huan.feng@starfivetech.com>");
> +MODULE_DESCRIPTION("StarFive JH7100 GPIO driver");
> --

Regards
Ley Foon

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
