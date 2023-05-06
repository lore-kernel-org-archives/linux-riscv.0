Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBACC77B7F
	for <linux-riscv@archiver.kernel.org>; Sat,  6 May 2023 21:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XuCj1+nu21zEkkvRtqOdq84Ir66qUacICaNLjpaUxEs=; b=vRnbP59GF0BXoJ
	FNbIuUB2l/ZBkyONx78peaQ7N7tqGUAcm2iPaIX2liM5FItJtTGYtb24BnkOOHAUvL4fzX5S9iH9T
	83rc7dxlujGoybpth5hIWn72rFyRl538J9wbS4GDnQd2smu8BzYGQvD6WFRf/HSe24ss0v6AqrWSk
	sPA3kaX1/7FpCXDe7W/sp9XYVe8TfeQFbmF4pSXTBxnHwnYxZ+2dnAb5W1cKJwKLOXbwXOsEF5D58
	NCjquuO2+yKqtw5cXs4Cu8wjhjZcRvYId59F6UUiOdhl8g71UKuWrp3KqeeieTEOoLyQ7P9lFCai/
	Oe7ekfw9hzPU3Mkqj40A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvPw6-00ERK8-0n;
	Sat, 06 May 2023 21:59:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvPw2-00ERIB-1m;
	Sat, 06 May 2023 21:59:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8AC2C1FB;
	Sat,  6 May 2023 15:00:04 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1CEFA3F5A1;
	Sat,  6 May 2023 14:59:16 -0700 (PDT)
Date: Sat, 6 May 2023 22:59:02 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/6] spi: sun6i: add support for R329 SPI controllers
Message-ID: <20230506225902.018ab828@slackpad.lan>
In-Reply-To: <20230506073018.1411583-5-bigunclemax@gmail.com>
References: <20230506073018.1411583-1-bigunclemax@gmail.com>
	<20230506073018.1411583-5-bigunclemax@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230506_145922_640980_FEF51D27 
X-CRM114-Status: GOOD (  21.49  )
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

On Sat,  6 May 2023 10:30:12 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> From: Icenowy Zheng <icenowy@aosc.io>
> 
> R329 has two SPI controllers. One of it is quite similar to previous
> ones, but with internal clock divider removed; the other added MIPI DBI
> Type-C offload based on the first one.
> 
> Add basical support for these controllers. As we're not going to
> support the DBI functionality now, just implement the two kinds of
> controllers as the same.
> 
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
>  drivers/spi/spi-sun6i.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
> index 82523011a3a5..fe287a45df9b 100644
> --- a/drivers/spi/spi-sun6i.c
> +++ b/drivers/spi/spi-sun6i.c
> @@ -715,9 +715,21 @@ static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
>  	.has_clk_ctl	= true,
>  };
>  
> +static const struct sun6i_spi_cfg sun50i_r329_spi_cfg = {
> +	.fifo_depth	= SUN8I_FIFO_DEPTH,
> +};
> +
>  static const struct of_device_id sun6i_spi_match[] = {
>  	{ .compatible = "allwinner,sun6i-a31-spi", .data = &sun6i_a31_spi_cfg },
>  	{ .compatible = "allwinner,sun8i-h3-spi",  .data = &sun8i_h3_spi_cfg },
> +	{
> +		.compatible = "allwinner,sun50i-r329-spi",
> +		.data = &sun50i_r329_spi_cfg
> +	},
> +	{
> +		.compatible = "allwinner,sun50i-r329-spi-dbi",
> +		.data = &sun50i_r329_spi_cfg
> +	},

As mentioned by others, we would not need to mention this compatible
string in the driver, the fallback string in the DT should take care
of the detection.

Rest looks fine.

Cheers,
Andre

>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_spi_match);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
