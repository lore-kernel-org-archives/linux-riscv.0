Return-Path: <SRS0=F/sc=EY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D29C5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 08:29:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7269241A6
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2020 08:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jWgdhHAN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="x6eY0PCR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7269241A6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oLp/zrvYURz5l3NNu4ZzEHq3/QUYofpKXt1d/oOSoqU=; b=jWgdhHANGSWU4Q3TO6140LteT
	e7V2hQMVOIcYVaxfeeSEBgtFB4m6kOvkrNoH6B19+e5D4N/rxHEVwwZhDZE5p9w5PCCKc152VmM+3
	X3lWyzTVP2HHDTBcT1Sw0bKv2vAoFpb5o47vhSnuDIgKDib9wuHtbuYS+nIC8F2Ad79IHPJybgfSe
	OhRQd01/RElbe1QbOGR915ifK824t1Owhe2pFOsZKcEd9TlFFADTtsdPc8/ZIRS7BPGSIppGXmL+2
	hXvWohSAkYJIP0UH40g0aivheqtaZm+XbfwyUde69V0G3wm/TzMreJx4a0fo1mpYjTcTy3LGaiU4x
	d9NV67lKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfIqA-0002eL-Eg; Wed, 18 Nov 2020 08:29:22 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfIq7-0002cf-Oa
 for linux-riscv@lists.infradead.org; Wed, 18 Nov 2020 08:29:21 +0000
Received: by mail-ej1-x643.google.com with SMTP id s25so1533543ejy.6
 for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2020 00:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e7/0oySTdCBUS5K5VKhLrqKbbTWozDIFYehy2a24oc4=;
 b=x6eY0PCRQQMpbRy1Q6I+uu2YRoF0r80KxAZAQf9JYuY7YfySWIG/IDmCzLYv7CaBsZ
 7SrK4geFajx4WBuJSxw3oLdNfgW0ovgegiQHt/m9n7a5Utp8dDQlE6JCWoyW6R+lOpiT
 FbHpL2YR+nhQfigvVD3YVHC5Vc24MOU5GQlUSjGPtemOT/Z5V0IJEueviYI+TWfNxaMa
 JoqLlIzxPBgZ5/upGEV7DiBW9qID+MvjIB1WTzavkjzQuKhh+pftwAib3wjvLlUWrBWk
 6lPZj68GyYlz9r5ntU4DpfTriBwHExi1ODjUuostjEtrslX9QGrQ+IcWHX124w/4nQKd
 pMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e7/0oySTdCBUS5K5VKhLrqKbbTWozDIFYehy2a24oc4=;
 b=KQNJdj0bhRLpZmCEgw+3xeTo1sqcDzln5KFGb1SE37hC1TzaHgohEYoOGag2cKu3BL
 D4h4N+tQBh5/WTM8lNOrf70GMP3Y76/uJffflj0kZAEq/skKBdwApuhWQaScQQ5zVp3n
 l3kU8/xe7t55PU10b6o5Sl9IzFjlZng4p6CJ+/GxdCJhvvU6SD2zeLeYlv+zRko/ehto
 5cN85U/0SJlJtYKSb8+0+AWgIjhOxdfeNoRw9uAZ6rJRqZHDxgbgwrMunvMbhU17Dn36
 DEzXDq9S/+uWnu2ruvEeDJIokX1lLNrg+duupcH8g9Hbyu07DhXjsqujbSBR6eVnurUg
 FgoQ==
X-Gm-Message-State: AOAM533iNcHva6IrJI/B85Lfy/zwCuFyCO8HHu4R5ErwO0j+tOyoAWvJ
 GT6bnuDUNG90BbdAqB51JnOLJqN8MIpFpQXqyuHwaQ==
X-Google-Smtp-Source: ABdhPJxkvr9erWwYTMRmncD7Ew/aYtYR/RWu/Aktlh0nMa+Hl7GHN+3niImXyMHSA/Vx6TuVW+ZUpqtd4KMriVuXyzs=
X-Received: by 2002:a17:906:15cc:: with SMTP id
 l12mr21905044ejd.363.1605688157047; 
 Wed, 18 Nov 2020 00:29:17 -0800 (PST)
MIME-Version: 1.0
References: <20201113023355.43406-1-greentime.hu@sifive.com>
In-Reply-To: <20201113023355.43406-1-greentime.hu@sifive.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Wed, 18 Nov 2020 09:29:06 +0100
Message-ID: <CAMpxmJXhqprF2QcYwkwFnHzv0H4_944MGUtmi4Ra5s_CU3R9+A@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: To get gpio irq offset from device tree
 data
To: Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_032919_939292_E43D9226 
X-CRM114-Status: GOOD (  21.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Yash Shah <yash.shah@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 13, 2020 at 3:34 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
> need to add more macros for different platforms. This patch is tested in
> SiFive Unleashed board and SiFive Unmatched board.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/gpio/gpio-sifive.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index c54dd08f2cbf..630bddec48e5 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -29,7 +29,6 @@
>  #define SIFIVE_GPIO_OUTPUT_XOR 0x40
>
>  #define SIFIVE_GPIO_MAX                32
> -#define SIFIVE_GPIO_IRQ_OFFSET 7
>
>  struct sifive_gpio {
>         void __iomem            *base;
> @@ -37,7 +36,7 @@ struct sifive_gpio {
>         struct regmap           *regs;
>         unsigned long           irq_state;
>         unsigned int            trigger[SIFIVE_GPIO_MAX];
> -       unsigned int            irq_parent[SIFIVE_GPIO_MAX];
> +       unsigned int            irq_number[SIFIVE_GPIO_MAX];
>  };
>
>  static void sifive_gpio_set_ie(struct sifive_gpio *chip, unsigned int offset)
> @@ -144,8 +143,12 @@ static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>                                              unsigned int *parent,
>                                              unsigned int *parent_type)
>  {
> +       struct sifive_gpio *chip = gpiochip_get_data(gc);
> +       struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);
> +
>         *parent_type = IRQ_TYPE_NONE;
> -       *parent = child + SIFIVE_GPIO_IRQ_OFFSET;
> +       *parent = irqd_to_hwirq(d);
> +
>         return 0;
>  }
>
> @@ -165,7 +168,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>         struct irq_domain *parent;
>         struct gpio_irq_chip *girq;
>         struct sifive_gpio *chip;
> -       int ret, ngpio;
> +       int ret, ngpio, i;
>
>         chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>         if (!chip)
> @@ -200,6 +203,9 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>                 return -ENODEV;
>         }
>
> +       for (i = 0; i < ngpio; i++)
> +               chip->irq_number[i] = platform_get_irq(pdev, i);
> +
>         ret = bgpio_init(&chip->gc, dev, 4,
>                          chip->base + SIFIVE_GPIO_INPUT_VAL,
>                          chip->base + SIFIVE_GPIO_OUTPUT_VAL,
> --
> 2.29.2
>

Applied, thanks!

Bart

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
