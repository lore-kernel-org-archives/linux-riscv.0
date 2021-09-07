Return-Path: <SRS0=0BIX=N5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18457C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 10:42:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDF4960F21
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Sep 2021 10:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CDF4960F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0n26RtNXjaoOjGXKUKbOke8D1L1DA+w9Ya5n9Icvpaw=; b=xqie+xoDZb4X1h
	MNch7sAh5TqGKxVuledHpJqoN5juBh8PQCBzSvFhz0EcZ3q+OVsih9iQy6HvS6Si20T1ESEq56wjF
	YFAyz8opaxnRZZwmLksS2p3wlbHSWBfFUNRhu4U5FwLfSZ7y15aHD1WcWionWc0E9X4/SHBKnFZ+4
	gtGJOcEBc5eA6VOCsaFAGHnaaiXQGlPQlmqOoL1VMIQW06XD19EpCrjOSP3L96wa6wqqkx81XwRv8
	FtivxW0rQVjW20X+zEArmEuLDmqcxpZ/O1sDFJDNRDTNZkXs/wRjj7u3UgZsN50pmTGohhVW3h9Gw
	xHG9W+7vdcN6y+mrizgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNYYN-003Quj-R3; Tue, 07 Sep 2021 10:42:11 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNYY8-003QrP-S9
 for linux-riscv@lists.infradead.org; Tue, 07 Sep 2021 10:41:58 +0000
Received: by mail-lf1-x12d.google.com with SMTP id t19so18592173lfe.13
 for <linux-riscv@lists.infradead.org>; Tue, 07 Sep 2021 03:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OhaD61tWBABFBKPbk39Bf67VDPEJcFHjjk5fNX+E5yU=;
 b=h7YlEPMvvvWPmHN0mOYi63YLv6yVF12bWfWtFS2c/y76M7DqdhGZgUL8k/OEZ3Vn9h
 VFr38ZRutYOrE2jaJI0KzAnPQ89g3pfYAjYVs7nYK8M3SoVoRPXshdxy3l/BGhWqsxSr
 BKmujtY4i+oSjJsk+Bjz4H6+ekmJl53x5L9YaM1IFfVsjOeTNaWw+f8LM6ilMA60YHa6
 VvXR7wKrFogELILtXEQSnZ5azgT6lpAc6JXXAgrB27dXd4MyW96PZTzDFG9mtcZAulk7
 /H7wMnUESOcVAn9vb7gbNOECshMIeJzlR6Y5nkqYuKPk42GSe4Go2m1DGjd+N4MgixOC
 WpWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OhaD61tWBABFBKPbk39Bf67VDPEJcFHjjk5fNX+E5yU=;
 b=k4AuMiV5/NJmN00ZMH6b0uh+xkVVUivkfaRVmMk0+5+CTskvqTLD8mi/XqDQETlG3t
 Hn7FrHZNJeklOipvXuePiViqHPqFf82lgegpfyWz2L+YY001mi3Ui62+bJPRf2eUQQSW
 nGRim2y62sKVbRaQPB911DfDmufFtmRlkebEIJ7Y663bqt3oAmtWaSX2bW90+rdp1uej
 X5S9ZBduNV2BDet1YLYOpocGtoYCOwEXfNGjRZUWWsm8FCDeWlc8i80dEa48hLj+abgy
 hcVBAt54WkGnQ22w/GOafGGx2pUUsfjREbQr5gZp/VO3tSHdtnYBuCJkkYnz5BYXVqTW
 v4zQ==
X-Gm-Message-State: AOAM533CrFc2gE7nAIwrd8c+EZB9dOba4b65r7I5I7g9LXFxA0aONjUH
 7hjsA5CEDRmSIICX7HQvQwuMQSMqobWXaAmdCcNqtA==
X-Google-Smtp-Source: ABdhPJx5OzN424vh3oUBOd8az3yzOHpWuZvPJYGzzfbrnfcRI/DT6ljkNdyfvmPJ0H6drgHJs7FbTfrhZnQn3vKdz38=
X-Received: by 2002:a19:ac42:: with SMTP id r2mr12064265lfc.167.1631011314103; 
 Tue, 07 Sep 2021 03:41:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com>
In-Reply-To: <20210904000543.2019010-2-saravanak@google.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 7 Sep 2021 12:41:18 +0200
Message-ID: <CAPDyKFrsKvHXMT-6CuFXKfqX+hZa3vGAu7hQz=9ZYBC7-dYS0w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To: Saravana Kannan <saravanak@google.com>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Rob Herring <robh+dt@kernel.org>, Android Kernel Team <kernel-team@android.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210907_034156_960631_9470BB87 
X-CRM114-Status: GOOD (  28.98  )
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

On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
>
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
>
> [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Tested-by: Saravana Kannan <saravanak@google.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

I will run some tests as soon as I can and let you know the results.

Kind regards
Uffe

> ---
>  drivers/bus/simple-pm-bus.c | 32 +++++++++++++++++++++++++++++---
>  1 file changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 01a3d0cd08ed..3e086a9f34cb 100644
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
> +                       return 0;
> +               else
> +                       return -ENODEV;
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
> +       { .compatible = "arm,amba-bus", .data = ONLY_BUS },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, simple_pm_bus_of_match);
> --
> 2.33.0.153.gba50c8fa24-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
