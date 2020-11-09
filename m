Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF94EC2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 19:59:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39914206F1
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 19:59:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lamat3IC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yscmii5O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39914206F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kYyJCs2FBVe/2Z8U9Sn7V2yALZ6emENLM9SCovX/Pck=; b=Lamat3ICXCKmIIDPB70oekULe
	nQ08pEbreIhqN51HAxsPvugiaSc5fPLYSfSutpOVt61eSaYWu0y9J5PkilKCl1fvqsG2+DqJ8dYaf
	c9Aox69NGctKivzCfBgRjmR+RMxksCPJ2WqIt5O0kzKXf8ihYAKCMazgUv2pQ09srgyaOUMuUFv7f
	XzZvS0PfFEa8RDm0pD9UThqlN2ZJsFrldS30mZ5F+xUuuOSZU36tfMm+X0aM0uvSFjpq5ClR2PQKl
	Qp1skaAZbgnzutGltRPUkHYbQQ+IEMaer6Ff/fqGggiyxouLA75Kxj02bGJtLhWZudTgEb1rSQVDq
	VHFEmYr3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcDJv-0000e4-US; Mon, 09 Nov 2020 19:59:19 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcDJt-0000dM-Tp
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 19:59:18 +0000
Received: by mail-lj1-x242.google.com with SMTP id y25so10997937lja.9
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 11:59:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=S3iazPmtjzMdjRarndPr8r8baCDNuFU5wUTeFbgI2sQ=;
 b=Yscmii5OjIHoiyc3HGuG5+5bgq5BO8r2948cOAd1ItbG8PA768drEKR4S4fxiFL/lO
 n/mZ3WkP2bIUbzP+SFYrbD3JGSvYsdPJ6p+bmqxyrvmhehvAoAMmGWYc131Z4TUucC7I
 hgsWBGO0FipMkNLE6Ve5dKGMtQw8+rmzjCze5mF/vMPiEyswKoD14EpvBWf0geyIVXuZ
 0F6yzZrmpj/ivx9+A0OaILCkNutDwKVbKsPsnpgDtozA5I8UDqho79YIeoEtuFI52XPh
 0HrRE/LGTRrWqOVRYaynUp8n9uftu7Ro2FWWNDqrPdfZ5Jr1k7cCQOs7SuK7GK9W9p1i
 M5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=S3iazPmtjzMdjRarndPr8r8baCDNuFU5wUTeFbgI2sQ=;
 b=HEBOWJw0gwgj0hQoQGRdXx0hpcta3qN2UcOuiqahhflN5gIIegOLbSqQHuH0C4Sl30
 Vx3Ore+uBbQCZ+7qHg87L1kCQvxjSSiDsVuMeJ3+8HYFUJz3ehhffkD9SPlUkg7sipLf
 izbaxpBV9vuO94l+Xz7WuItnRa+5XCxXbOX+TtqYTY1i82FvL1d+XXz8/KbbLNcSomAa
 RzSBBrT8OrPwafpiAiOy57MDy7Z8xr7y1dcNex6I+q3bLNXaa1V6FjxjVZ44Wb+Ak53O
 BB7ysr1tnt4WUe8gS5IEeYYgcpHKh2SiF1/6a1zE3IYXgpIp1HUehwElK6874ZX+kb/A
 obZQ==
X-Gm-Message-State: AOAM531rWTIDGxEUhQVIFDEw3rxDKE4FuIu0ZhIup/OUHj7lZUVJ09s9
 zQVUfLS9qJIOIc93WScjXaCV3KYfQVGUhwGT
X-Google-Smtp-Source: ABdhPJzZmgrWnRvtkYdvSKe5iYqnKYNSn92AAZUaNbioHnovUHyViefzfa6TyUqom+q15qRa/ht1nw==
X-Received: by 2002:a05:651c:1256:: with SMTP id
 h22mr7331152ljh.263.1604951956194; 
 Mon, 09 Nov 2020 11:59:16 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id p25sm783725lfc.125.2020.11.09.11.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 11:59:15 -0800 (PST)
Date: Mon, 9 Nov 2020 22:59:13 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 04/32] spi: dw: Introduce polling device tree property
Message-ID: <20201109195913.itgfj2ga5y7sr6zx@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-5-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-5-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_145917_984189_85005D29 
X-CRM114-Status: GOOD (  25.39  )
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 07, 2020 at 05:13:52PM +0900, Damien Le Moal wrote:
> With boards that have slow interrupts context switch, and a fast device
> connected to a spi master, e.g. an SD card through mmc-spi,

> using
> dw_spi_poll_transfer() intead of the regular interrupt based
> dw_spi_transfer_handler() function is more efficient and

I can believe in that. But the next part seems questionable:

> can avoid a lot
> of RX FIFO overflow errors while keeping the device SPI frequency
> reasonnably high (for speed).

No matter whether it's an IRQ-based or poll-based transfer, as long as a
client SPI-device is connected with a GPIO-based chip-select (or the
DW APB SSI-controller feature of the automatic chip-select toggling is
fixed), the Rx FIFO should never overrun. It's ensured by the transfer
algorithm design by calculating the rxtx_gap in the dw_writer()
method. If the error still happens then there must be some bug in
the code.

It's also strange to hear that the polling-based transfer helps
to avoid the Rx FIFO overflow errors, while the IRQ-based transfer
causes them. Both of those methods are based on the same dw_writer()
and dw_reader() methods. So basically they both should either work
well or cause the errors at same time.

So to speak could you more through debug your case?

On the other hand the errors (but not the Rx FIFO overflow) might be
caused by the DW APB SSI nasty feature of the native chip-select
automatic assertion/de-assertion. So if your MMC-spi port is handled
by the native DW APB SSI CS lane, then it won't work well for sure.
No matter whether you use the poll- or IRQ-based transfers.

-Sergey


> Introduce the "polling" device tree
> property to allow requesting polled processing of transfer depending on
> the connected device while keeping the spi master interrupts property
> unschanged. E.g. device trees such as:
> 
> Generic soc.dtsi dts:
> 
> spi0: spi@53000000 {
> 	#address-cells = <1>;
> 	#size-cells = <0>;
> 	compatible = "snps,dw-apb-ssi";
> 	reg = <0x53000000 0x100>;
> 	interrupts = <2>;
> 	...
> }
> 
> Board specific dts:
> 
> ...
> &spi0 {
> 	polling;
> 	status = "okay";
> 
> 	slot@0 {
> 		compatible = "mmc-spi-slot";
> 		reg = <0>;
> 		voltage-ranges = <3300 3300>;
> 		spi-max-frequency = <4000000>;
> 	};
> }
> 
> will result in using polled transfers for the SD card while other boards
> using spi0 for different peripherals can use interrupt based transfers
> without needing to change the generic base soc dts.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  drivers/spi/spi-dw-mmio.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index d0cc5bf4fa4e..3f1bc384cb45 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -20,6 +20,7 @@
>  #include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
> +#include <linux/interrupt.h>
>  
>  #include "spi-dw.h"
>  
> @@ -246,9 +247,13 @@ static int dw_spi_mmio_probe(struct platform_device *pdev)
>  
>  	dws->paddr = mem->start;
>  
> -	dws->irq = platform_get_irq(pdev, 0);
> -	if (dws->irq < 0)
> -		return dws->irq; /* -ENXIO */
> +	if (device_property_read_bool(&pdev->dev, "polling")) {
> +		dws->irq = IRQ_NOTCONNECTED;
> +	} else {
> +		dws->irq = platform_get_irq(pdev, 0);
> +		if (dws->irq < 0)
> +			return dws->irq; /* -ENXIO */
> +	}
>  
>  	dwsmmio->clk = devm_clk_get(&pdev->dev, NULL);
>  	if (IS_ERR(dwsmmio->clk))
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
