Return-Path: <SRS0=k7QB=MW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D58BC43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 12:35:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F8342087A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 12:35:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lAz6mWXI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="GFUBM7+f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F8342087A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PvyQ0C9uD/yUW+ZExFopC+SW6WSGPGMXXwc7aObsAU=; b=lAz6mWXIoTNRVf
	NHcjPSX4RCSpP26eaGpuQp+wHYanMBueg7lo74aLMhnpexRg0c0QzjFejzZSOhfFBAv8MvN95LCZj
	H7qn6E3ddnN69sA1YjuLJXWTha2ZblNawuqKSfpYx44iO5IYZ4zF/Aja9B6LNcJeOa6E0IiLnZNrH
	rtgtejQEjMDNHU3BOAGDNTWGupjWX8qnt1+hVEefSeJgH+7fjySa6nlcSVAfX+/dbG7DoWhJR3s8Z
	UZYXjLMTWHurn0IdQBug9Wp2ercDnk6/EdRyUqa185altUQkxXaZXkjMvE3nBxcKUWHtog6snpEv+
	0nEDtoxBmRHrtPlZm2JQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gADiN-0005bL-IW; Wed, 10 Oct 2018 12:35:47 +0000
Received: from mail-it1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gADiJ-0005a2-Tu
 for linux-riscv@lists.infradead.org; Wed, 10 Oct 2018 12:35:45 +0000
Received: by mail-it1-x143.google.com with SMTP id q70-v6so7720783itb.3
 for <linux-riscv@lists.infradead.org>; Wed, 10 Oct 2018 05:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LK9+G6KymxKlkyxnkqpHkZFSykVTIPaNiAUqgugUA9Q=;
 b=GFUBM7+fUw2M70npY32WActEysjzu9z/LR6Fe27VNBC769C1UHnZCXXMtEfC5tKOOp
 /eOV+FPRWAJ7gqpL57o2yjEEysIsnkP49siSfeuJuPRWThJE20pVQZbi3r7IrRC3bMfZ
 RGTpZSmCZs3NWNhOHqhwJINCX1Be/WoDoIOZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LK9+G6KymxKlkyxnkqpHkZFSykVTIPaNiAUqgugUA9Q=;
 b=tcCF0ZnUGcT+5MtjZO40z0iA+Xe8OWoug9SF/s7Z8LGE4JtpaP0THcCywjQGDZC0db
 TbsZVEZYwTMltchlC9QE91TgFtSKfGQEfiy6L0UvdHOIhwRmxchduJN3BEQEH9IXPnkl
 GBDTBacLpvpPrXOLxE6SdCd7zWdX/6ZckzGN09I2VJtLL6JcY1sNy6suh7GE052bv78l
 IyXLdBhWeJfVmAnxTvuTz4jS42lNQt4Im6o2qLBKPZwAc0O7YxjUX7LUdy32AGROp7ts
 szZ1y03+QqIHBmEKTBsOt+kEqIQnfg9D5SH/2JIZIOmMp0pzSZe2O+07vbG+/SlHTbXM
 qMIQ==
X-Gm-Message-State: ABuFfojhF6AevVhhmhqQa0BLYFf3HIIycQRj09tQB/08PW3f7kqKbhRr
 hH7Eb9vUDcA/q3HsrniT510EakeES5UXBDCoDiaP7A==
X-Google-Smtp-Source: ACcGV61pZB4/wRZzO5PTioNsRJR2UzNnZD7+zC9PHibIDNtS1MeFg+J/Wfl9xwlGbj9WLSHQ0AmgYSGrokyZtRoMqXo=
X-Received: by 2002:a02:7789:: with SMTP id
 g131-v6mr25519247jac.66.1539174931405; 
 Wed, 10 Oct 2018 05:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-5-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1539111085-25502-5-git-send-email-atish.patra@wdc.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Oct 2018 14:35:19 +0200
Message-ID:
 <CACRpkdaoBwqQ4V5Hm9f_G5_jrdkvjT5anhBK1_HoFTj6=cba-Q@mail.gmail.com>
Subject: Re: [RFC 4/4] gpio: sifive: Add GPIO driver for SiFive SoCs
To: atish.patra@wdc.com, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181010_053543_971759_9CCDFBB6 
X-CRM114-Status: GOOD (  20.63  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-pwm@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181010123519.RVexDppaPFpIWl7QU_hpP8tc5qqWPJgeuLYn0FaGbeQ@z>

Hi Atish,

thanks for your patch!

On Tue, Oct 9, 2018 at 8:51 PM Atish Patra <atish.patra@wdc.com> wrote:

> From: "Wesley W. Terpstra" <wesley@sifive.com>
>
> Adds the GPIO driver for SiFive RISC-V SoCs.
>
> Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> [Atish: Various fixes and code cleanup]
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

(...)

> +config GPIO_SIFIVE
> +       bool "SiFive GPIO support"
> +       depends on OF_GPIO
> +       select GPIOLIB_IRQCHIP

I suggest to add
select GPIO_GENERIC as per below.

Maybe select REGMAP_MMIO as well.

> +       help
> +         Say yes here to support the GPIO device on SiFive SoCs.
> +

> +#include <linux/of_irq.h>
> +#include <linux/irqchip/chained_irq.h>

Do you need these two? I think <linux/gpio/driver.h>
will bring them in for you.

> +#include <linux/pinctrl/consumer.h>

Are you using this?

> +struct sifive_gpio {
> +       raw_spinlock_t          lock;
> +       void __iomem            *base;
> +       struct gpio_chip        gc;
> +       unsigned long           enabled;

Since max GPIO is 32 why not use an u32 for this?

> +       unsigned int            trigger[MAX_GPIO];
> +       unsigned int            irq_parent[MAX_GPIO];
> +       struct sifive_gpio      *self_ptr[MAX_GPIO];
> +};
> +
> +static void sifive_assign_bit(void __iomem *ptr, unsigned int offset, int value)
> +{
> +       /*
> +        * It's frustrating that we are not allowed to use the device atomics
> +        * which are GUARANTEED to be supported by this device on RISC-V
> +        */
> +       u32 bit = BIT(offset), old = ioread32(ptr);
> +
> +       if (value)
> +               iowrite32(old | bit, ptr);
> +       else
> +               iowrite32(old & ~bit, ptr);
> +}

This looks like a mask and set implementation, you are
essentially reinventing regmap MMIO and the
regmap_update_bits() call. Could you look into
just using regmap MMIO in that case?

If you need examples, look at gpio-mvebu.c that calls
devm_regmap_init_mmio() for example.

> +static int sifive_direction_input(struct gpio_chip *gc, unsigned int offset)
> +static int sifive_direction_output(struct gpio_chip *gc, unsigned int offset,
> +static int sifive_get_direction(struct gpio_chip *gc, unsigned int offset)
> +static int sifive_get_value(struct gpio_chip *gc, unsigned int offset)
> +static void sifive_set_value(struct gpio_chip *gc, unsigned int offset,

These functions look like a typical hardware that can use

GPIOLIB_GENERIC and bgpio_init() to set up the accessors.

See gpio-ftgpio010.c for an example.

As a bonus you will get .get/.set_multiple implemented by
the generic GPIO.

> +static void sifive_irq_enable(struct irq_data *d)
> +static void sifive_irq_disable(struct irq_data *d)
(...)
> +static struct irq_chip sifive_irqchip = {
> +       .name           = "sifive-gpio",
> +       .irq_set_type   = sifive_irq_set_type,
> +       .irq_mask       = sifive_irq_mask,
> +       .irq_unmask     = sifive_irq_unmask,
> +       .irq_enable     = sifive_irq_enable,
> +       .irq_disable    = sifive_irq_disable,

The handling of .irq_enable and .irq_disable has
changed upstream. Please align with the new codebase
as changed by Hans Verkuil:

commit 461c1a7d4733d1dfd5c47b040cf32a5e7eefbc6c
"gpiolib: override irq_enable/disable"
commit 4e9439ddacea06f35acce4d374bf6bd0acf99bc8
"gpiolib: add flag to indicate if the irq is disabled"

You will need to rebase your work on the v4.20-rc1 once it is
out. Right now the changes are on linux-next or my devel
branch.

> +       ngpio = of_irq_count(node);
> +       if (ngpio >= MAX_GPIO) {
> +               dev_err(dev, "Too many GPIO interrupts (max=%d)\n", MAX_GPIO);
> +               return -ENXIO;
> +       }
(...)
> +       for (gpio = 0; gpio < ngpio; ++gpio) {
> +               irq = platform_get_irq(pdev, gpio);
> +               if (irq < 0) {
> +                       dev_err(dev, "invalid IRQ\n");
> +                       gpiochip_remove(&chip->gc);
> +                       return -ENODEV;
> +               }

This is an hierarchical IRQ so it should use an hierarchical
irqdomain.

I am discussing with Thierry to make more generic irq domains
for hierarchical IRQ GPIOs, until then you have to look at
gpio-thunderx.c, gpio-uniphier.c or gpio-xgene-sb.c that all
use hierarchical IRQs.

Yours,
Linus Walleij

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
