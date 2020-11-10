Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC987C388F7
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 09:55:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5081D20780
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 09:55:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QVo65rvH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oVKCUZ34"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5081D20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g0Kn8CHLUfNH9qKkEAfc2hb15o0g4+MlN+3a79Ac9A0=; b=QVo65rvHw+7KppwCUKdLKi6mk
	4sYRiE4Yv5dWp5nezld+5QT2iqtK0lcGtBYQmVPOudHByqWeFTJh8Z8N4YXl0ta6hXv79dgFX/fzI
	/rdsEetIKNjOla7/ZcwPKk6bT/cOzdWsytNFjQVSULHW8yEnKlZ5Pav0bRalbn9o52ZViqBw/bpJs
	x3il+T02SS03VqZwqZwW2OjYIx7YiK04R68rZXkq+lwJ1neH/3WXytSXwCgYPip4gwcTcmY/R6YKl
	Pi58pyQG1DiLeJgzZo0zcv2UY4KZzJiB6CJepqRBZsI8z5CvpPC1jqsM9+MRd1F1MY8ZgKYrjj2r8
	2k+nDxhwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcQMc-000769-68; Tue, 10 Nov 2020 09:54:58 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcQMY-00073s-TJ
 for linux-riscv@lists.infradead.org; Tue, 10 Nov 2020 09:54:56 +0000
Received: by mail-ed1-x543.google.com with SMTP id l5so5525028edq.11
 for <linux-riscv@lists.infradead.org>; Tue, 10 Nov 2020 01:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X9uDWTdZOrL/c6ma/pF1vPxtR5z6xN7pII6X5JCa+BI=;
 b=oVKCUZ34X+b8Vmlc53bk/IFG3ItOaJatAlXIIVBsv97h3zNQ4zafGREBZFqDbhQ+bs
 4NYSulvgxTAfwDXqR1/KqAtCIy0CDJFXq/8KtyT7DXJNa+DLhECZa7vaSzXKB/qrWSbJ
 AU8We24/+LvI+KIX4cPCT2BphmuzFzhmzkITHx9sXFAnZv6zuLoTNXBkWYIlaFI//PKZ
 3HtVqPqnZegI1/DInmVP8M6uvK/3L8A5O/hJhZ6Pc1m16RCk7XkRAQelpLCErBWHPpg6
 gqkiwMTqCxo2Q1PLEtP69XTvOM43AAGUkhL27cTWmI00V5G7fc5L424pCIilMgw0GVb1
 YPVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X9uDWTdZOrL/c6ma/pF1vPxtR5z6xN7pII6X5JCa+BI=;
 b=pfh4nETHuUXPFmjXQvXlJhoBW2oS32gwqnBfXCaOo/VB83s+KsEkt5GMqQmTaX6Pdx
 TVm63zleIYhQtxCZC3r4p7uRr2bm5Bmxh46Me9s+uTcBEnh0CZaHUMqtezCONyGWujJP
 D/u07qqtdFVMtfzvF7wOgQpqHSAj/FikOGknAOcqDPcHrAekaUjw/wQzizMnUrPKxIiG
 asy+UnhhNEHmb1VmTSUX0W692toJtkUSiL2iZ5veTuAWA59nfdxAP+LvhVyMLCbK3CCO
 715MbVCpR8rc8ugYmrh188CVaIZBGZi9PzsPfNFKem/Q/F9iv/5UfFZDk29QQzTXXt4d
 7jSA==
X-Gm-Message-State: AOAM531n+92asZ0f1qRcc7uxhqGpud4tFAjfEc/k5WLghWBsK6m9v6Cf
 tIPLkNF+AUv/8EXNxgMIlDtTt4WFV7msmXWR4AZlIg==
X-Google-Smtp-Source: ABdhPJyE43bcMhWGPbK4rkErcAG8hr3o31St165QQHyGuiorFfmTFuAjP+8F3lp4KYIDGr2TcJsnX6YJG2hvAGzShIk=
X-Received: by 2002:a50:9e0b:: with SMTP id z11mr20703060ede.341.1605002090873; 
 Tue, 10 Nov 2020 01:54:50 -0800 (PST)
MIME-Version: 1.0
References: <20201109075702.21370-1-greentime.hu@sifive.com>
In-Reply-To: <20201109075702.21370-1-greentime.hu@sifive.com>
From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 10 Nov 2020 10:54:40 +0100
Message-ID: <CAMpxmJXx_qjpAxsQ4fCN9PfyZ5ANys2vGxrWKJWhNTOiEzM48g@mail.gmail.com>
Subject: Re: [PATCH] gpio: sifive: To get gpio irq offset from device tree data
To: Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_045455_067002_D250195A 
X-CRM114-Status: GOOD (  22.45  )
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

On Mon, Nov 9, 2020 at 8:57 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
> need to add more macros for different platforms. This patch is tested in
> SiFive Unleashed board and SiFive Unmatched board.
>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  drivers/gpio/gpio-sifive.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index c54dd08f2cbf..bfb915bf5d78 100644
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
> @@ -144,8 +143,10 @@ static int sifive_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
>                                              unsigned int *parent,
>                                              unsigned int *parent_type)
>  {
> +       struct sifive_gpio *chip = gpiochip_get_data(gc);
> +       struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);

Please add a newline here.

> +       *parent = irqd_to_hwirq(d);
>         *parent_type = IRQ_TYPE_NONE;
> -       *parent = child + SIFIVE_GPIO_IRQ_OFFSET;

And here while you're at it.

>         return 0;
>  }
>
> @@ -165,7 +166,7 @@ static int sifive_gpio_probe(struct platform_device *pdev)
>         struct irq_domain *parent;
>         struct gpio_irq_chip *girq;
>         struct sifive_gpio *chip;
> -       int ret, ngpio;
> +       int ret, ngpio, i;
>
>         chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>         if (!chip)
> @@ -200,6 +201,9 @@ static int sifive_gpio_probe(struct platform_device *pdev)
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

Bartosz

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
