Return-Path: <SRS0=oCzz=N4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB62EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 07:54:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6949760F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Sep 2021 07:54:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6949760F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xh9O1A+sylgNZ+XVENq2P1yBtUAZWX0vv8wVIJrq0Q=; b=qOf/DAfl0XLBYR
	yBZg+lj5erd7/SlJN0B77E91UDQ19SY/u3wUNARpyAR+I29J+uQt9wmAF/wRGboKDq2rQ8MAPYqAl
	MxczPTzqcXxO5pUqtVa2HxzpDCm0nIPJyI7jAg0+ucBNjkdjfzk5/ICAkqSpp7AhjKM73wYTXDjNl
	feJKXx0wHHNhKfYshPm34URG9i/PgKhyXs3aInBQ4EjJZtVs9st1CjA9T7PSk1wsdYULJXLdHfM10
	JQUebYRxM/G4YPuUd7pV3JpzCpnIglPPbRvM2bihgMN80zPjIE8oJuqQxYh7s+K+BKX5Jhi3a9U12
	BceCMwlmxYxvKF6g3b9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mN9SK-0007AQ-IE; Mon, 06 Sep 2021 07:54:16 +0000
Received: from mail-vs1-f54.google.com ([209.85.217.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mN9S6-00077k-V2; Mon, 06 Sep 2021 07:54:04 +0000
Received: by mail-vs1-f54.google.com with SMTP id a21so4835714vsp.12;
 Mon, 06 Sep 2021 00:54:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xon8B2SCZnddw6P26dcLHhHXVXDY1KEqtTk0C4c5WI8=;
 b=ejzv7u03qowP339KXpsOzjB6KpMR0z+v8cnw6SVD1pXwayeQCA9klhEgAwrTZTcheH
 VvAGv9HiKB+ZRE6XhGTeP65MJCeNXWUn9jLbydy9JZNeXlzouJmYoTAlbaLlpBasBZDK
 30cSUi57ZLhCB8sATiBi2sEgME1TmHMk+1VwZy6sAX6zaE3sPpBrlOoWimrcCxIgni35
 4AFKFD4zJRAxXerF2wy/ELMoF8HQkc+IYKDKulfjMBwjAjSYrVRum0BVblV43vNWKUTH
 iQduABXnX1qx2Fa5OuP+DmbCZK3GH1t9ZuWQMLffYIoBsv0ktDe7XpGLlRixx7eecLzl
 idnA==
X-Gm-Message-State: AOAM533lUyttGqxCpHNT8e/HNsm0J4zf7JwaNpW0aG8tKwoUA72Bdh2T
 G9fzOP28QJxOzANjXkXgHDcDhZSOs07Uo3zBb9o=
X-Google-Smtp-Source: ABdhPJwiJLO1eun4znmfPQAmEZ02gXfXHVnSn4DLHuIKjjf0oWm84/rA+gjdhs/7qH0Ulg2tAq6+9LjizZw+NnURxdw=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr4993974vsl.9.1630914840618;
 Mon, 06 Sep 2021 00:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com>
In-Reply-To: <20210904000543.2019010-2-saravanak@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Sep 2021 09:53:49 +0200
Message-ID: <CAMuHMdUhZy7W_HLtNJ2ECK5uQV5xHV7pDk5BXfNUpW9L68G5Aw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Magnus Damm <magnus.damm@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Android Kernel Team <kernel-team@android.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Lee Jones <lee.jones@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210906_005403_062530_F02B7E3E 
X-CRM114-Status: GOOD (  37.20  )
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

Hi Saravana,

Thanks for your patch!

CC linux-pm, Lee (mfd)

On Sat, Sep 4, 2021 at 2:05 AM Saravana Kannan <saravanak@google.com> wrote:
> fw_devlink could end up creating device links for bus only devices.
> However, bus only devices don't get probed and can block probe() or
> sync_state() [1] call backs of other devices. To avoid this, probe these
> devices using the simple-pm-bus driver.
>
> However, there are instances of devices that are not simple buses (they
> get probed by their specific drivers) that also list the "simple-bus"
> (or other bus only compatible strings) in their compatible property to
> automatically populate their child devices. We still want these devices
> to get probed by their specific drivers. So, we make sure this driver
> only probes devices that are only buses.

Note that this can also be the case for buses declaring compatibility
with "simple-pm-bus".  However, at the moment, none of such device
nodes in upstream DTS files have device-specific drivers.

> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>

> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -13,11 +13,26 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>
> -
>  static int simple_pm_bus_probe(struct platform_device *pdev)
>  {
> -       const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> -       struct device_node *np = pdev->dev.of_node;
> +       const struct device *dev = &pdev->dev;
> +       const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> +       struct device_node *np = dev->of_node;
> +       const struct of_device_id *match;
> +
> +       match = of_match_device(dev->driver->of_match_table, dev);
> +
> +       /*
> +        * These are transparent bus devices (not simple-pm-bus matches) that
> +        * have their child nodes populated automatically.  So, don't need to
> +        * do anything more.
> +        */
> +       if (match && match->data) {
> +               if (of_property_match_string(np, "compatible", match->compatible) == 0)

Does this work as expected? Having multiple compatible values in a
device node does not guarantee there exist a separate driver for any
of the device-specific compatible values.

> +                       return 0;
> +               else
> +                       return -ENODEV;

So if we get here, as both branches use "return", we skip the
pm_runtime_enable() and of_platform_populate() below:
  - of_platform_populate() is handled for these buses by
    of_platform_default_populate(), so that's OK,
  - I'm wondering if any of the simple-mfd sub-devices use Runtime
    PM, but currently fail to save power because pm_runtime_enable()
    is never called for the MFD container, just like with simple-bus...

> +       }
>
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
> @@ -31,14 +46,25 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
>
>  static int simple_pm_bus_remove(struct platform_device *pdev)
>  {
> +       const void *data = of_device_get_match_data(&pdev->dev);
> +
> +       if (data)
> +               return 0;
> +
>         dev_dbg(&pdev->dev, "%s\n", __func__);
>
>         pm_runtime_disable(&pdev->dev);
>         return 0;
>  }
>
> +#define ONLY_BUS       ((void *) 1) /* Match if the device is only a bus. */
> +
>  static const struct of_device_id simple_pm_bus_of_match[] = {
>         { .compatible = "simple-pm-bus", },
> +       { .compatible = "simple-bus",   .data = ONLY_BUS },
> +       { .compatible = "simple-mfd",   .data = ONLY_BUS },
> +       { .compatible = "isa",          .data = ONLY_BUS },

#ifdef CONFIG_ARM_AMBA ?

> +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
>         { /* sentinel */ }

This is now (almost[*]) the same as of_default_bus_match_table[]
in drivers/of/platform.c. Perhaps it can be shared?

[*] Especially if "simple-pm-bus" and "simple-bus" would be treated
    the same.

>  };
>  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
