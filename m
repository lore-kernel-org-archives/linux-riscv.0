Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFDCEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 14:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VJJsjBc3ygJ6l+QxKa7hyddnw4/jqKVcnLTWW/uUvVo=; b=T1DsnmYsKCXd5L
	wCsDSkpau9KafrndmG+lfgOhcezWk364+8iw2M91x3uxL3BXdMX6I459+BwSdbjgCzcELc+ztCBxD
	RLPsqNvk0iN+BP+ADCkgLoAkpEtcij3G00oNcIyEI43YmXNTnQy0yp1sRKaAS/gFEA41uqDPvmJpP
	zhuFmrFdHOq5eCKnXnRmqMRnhfUtdeMVu6rmceJQdfU5XVIyu9z1qmrdtnHCFhJwQgQWQYLEZoxv8
	P+honKS2f8TJoNl/UWJkrBjCnJkDLB8/EmXft6uGIWsOmhyQtcDFSVVsMOg6C/5x8YnOL5JKO2kvT
	1yFlIQ/IpLeyPT8kL47Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7vG-007gNW-0t;
	Wed, 19 Jul 2023 14:12:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM7vA-007gLM-1w
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 14:12:56 +0000
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 7AE6B3F721
	for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689775966;
	bh=fTUvgetUaqT3wHGPq5i4Fev7+8uAQkZMBnoHSdm3l3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=bywkgrySn1qYARM1u9eKGf84kdbHJU57+GgMk0C2y3THfW68HtKm+QlrCGKQpg99Q
	 Dl7H/2VLyw5vKd7LY+9RVf0jQamwPPneI8ZVUV84HmLHNkKJIYnDvxI6o8cu3FqU1w
	 3GieuNypeIl90HZTleaRLWrXsE7FlEPc8pwgpHRSDXQSeC3YBqVpJCvg/4CMbzX4N6
	 zkLjEuMNZM436JSGP2DFk/c69XqKwHrJYkpHvxewTGulB+6PXs54DmIv3A936Z+BzA
	 f0udUkNf5wu4JSXGWFxbfW+YXA7f+jQP6OecxiyrPUND3hz6MAA6/XTCF+aC5xv5k6
	 cTwXjUGFWcAxA==
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7656c94fc4eso863499185a.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 07:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689775965; x=1690380765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fTUvgetUaqT3wHGPq5i4Fev7+8uAQkZMBnoHSdm3l3w=;
        b=J/9yn+uI9Ujk181I00jViqqXypc477TvRSAVbBCJ9NFnDRHPZASExKe1LtRyhLKvkJ
         /w1s+PfNWkrOsWN5Ra7hWKSedfkALc7MAlIvITnD5a2LPAs+bWm0IDiV0WVB0dNuWUbw
         2Chb59UfwJkXbg27n5sLhQh4W4w+lPFOwRmpgTu9BiRYu86YyIFq+uVGuYyCMUTOsydC
         5tgeGo1IHo/2Bd6QWSt9cjgAPnfP3lAlxnfBY4MkE5us1uZcHAwO4JP54js3HNs78X93
         VO8afqHdvWJcEGkdgIsZQMLt7M9srbZsv/3HAvXTp0HWQSltkdPoHxPaIHYc5zUVzY+h
         vkFg==
X-Gm-Message-State: ABy/qLZw9tK5jHRePemH62VrnPV8RnaoN69/Q3jCnGlrfpIN2/LO2ZC4
	DuoZPiSXNsVCnJSs/9rLWOQs5UfHbXfI3+9WQ7Umj1YYkC/sFRU46OgwA++j04eUmd8/wSkaTl9
	PzasMZGiWNVSc2XgtGvKJ12jr2P/xjK0HSehptHAbbawVsl5VnbJUhlhkWytOaQ==
X-Received: by 2002:ac8:5a82:0:b0:3f9:cb01:9dae with SMTP id c2-20020ac85a82000000b003f9cb019daemr21215439qtc.50.1689775965159;
        Wed, 19 Jul 2023 07:12:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEyqJAW0YcwGXzwaqtO+haPvbXa6TVCnEWDq/UNmAT5PINh4LZDlSHEpJIERRJmT2R7L69By/E3f/BC3H9q+ls=
X-Received: by 2002:ac8:5a82:0:b0:3f9:cb01:9dae with SMTP id
 c2-20020ac85a82000000b003f9cb019daemr21215415qtc.50.1689775964905; Wed, 19
 Jul 2023 07:12:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230717205357.2779473-1-samuel.holland@sifive.com> <20230717205357.2779473-3-samuel.holland@sifive.com>
In-Reply-To: <20230717205357.2779473-3-samuel.holland@sifive.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 19 Jul 2023 16:12:28 +0200
Message-ID: <CAJM55Z8Q-kGFKhFc57_Ew+0VsmBqwLrBAaiaiJ5zYdu_OG-wMg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: sifive: Allow building the driver as a module
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_071254_387949_5DABF34F 
X-CRM114-Status: GOOD (  20.67  )
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

On Wed, 19 Jul 2023 at 08:26, Samuel Holland <samuel.holland@sifive.com> wrote:
>
> This can reduce the kernel image size in multiplatform configurations.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  drivers/gpio/Kconfig       | 2 +-
>  drivers/gpio/gpio-sifive.c | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index e382dfebad7c..1a8e8a8c85d6 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -564,7 +564,7 @@ config GPIO_SAMA5D2_PIOBU
>           maintain their value during backup/self-refresh.
>
>  config GPIO_SIFIVE
> -       bool "SiFive GPIO support"
> +       tristate "SiFive GPIO support"
>         depends on OF_GPIO
>         select IRQ_DOMAIN_HIERARCHY
>         select GPIO_GENERIC
> diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
> index 745e5f67254e..5941a817491c 100644
> --- a/drivers/gpio/gpio-sifive.c
> +++ b/drivers/gpio/gpio-sifive.c
> @@ -277,4 +277,6 @@ static struct platform_driver sifive_gpio_driver = {
>                 .of_match_table = sifive_gpio_match,
>         },
>  };
> -builtin_platform_driver(sifive_gpio_driver)
> +module_platform_driver(sifive_gpio_driver)
> +

While you're at it maybe also add the MODULE_AUTHOR() and
MODULE_DESCRIPTION() macros.

> +MODULE_LICENSE("GPL");
> --
> 2.40.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
