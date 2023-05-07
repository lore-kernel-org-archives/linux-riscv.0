Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1E7C77B7D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 May 2023 09:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bef15VTldmfRcmsj5KhKuZq+ES+FB2HGAih08JdQ/6E=; b=RT5JrBwLnpu2ok
	Oob+kQboVuuugSwqfRF55qqVZh+KtkQZ1nWtkWFsZ7alAMLwsc+n0vDHJqcI1UzfeihkM/yD+Ol7d
	NjRR9uutcVPQNEcyLHj6F5nxDkH1nN+GDKN4BzIztyEmQ1ix/5cmprrJWhwf9yQPF6UGFgpJ503r9
	+8OF29giMKE3HesiB37xz37vD0kh3JxuvJLgX8g93ojYwvUcjQ27pRKeh4868B7vxY5Hi6vYfdycV
	t3F5b4OSqkvdSDl6W8OxmJMX9tTVOkOHRXWNtkvB0H+xjVS7WR/UA+2z/IWw1BqIjLyxL8ZbXfJUX
	7F6u7wB7sK8bYRwkxjAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvb47-00FfSH-0U;
	Sun, 07 May 2023 09:52:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvb43-00FfQZ-0P;
	Sun, 07 May 2023 09:52:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A9912F4;
	Sun,  7 May 2023 02:53:04 -0700 (PDT)
Received: from slackpad.lan (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D3C743F64C;
	Sun,  7 May 2023 02:52:16 -0700 (PDT)
Date: Sun, 7 May 2023 10:52:01 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Maxime Ripard <mripard@kernel.org>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 4/5] spi: sun6i: add support for R329/D1/R528/T113s
 SPI controllers
Message-ID: <20230507105201.530523b1@slackpad.lan>
In-Reply-To: <20230506232616.1792109-5-bigunclemax@gmail.com>
References: <20230506232616.1792109-1-bigunclemax@gmail.com>
	<20230506232616.1792109-5-bigunclemax@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_025223_213474_EECEF585 
X-CRM114-Status: GOOD (  18.64  )
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

On Sun,  7 May 2023 02:26:07 +0300
Maksim Kiselev <bigunclemax@gmail.com> wrote:

> These SoCs has two SPI controllers. One of it is quite similar to previous
> ones, but with internal clock divider removed; the other added MIPI DBI
> Type-C offload based on the first one.
> 
> Add basical support for these controllers. As we're not going to
> support the DBI functionality now, just implement the two kinds of
> controllers as the same.
> 
> Co-developed-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  drivers/spi/spi-sun6i.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
> index 1e9e9a8159d9..292fd6101283 100644
> --- a/drivers/spi/spi-sun6i.c
> +++ b/drivers/spi/spi-sun6i.c
> @@ -739,9 +739,17 @@ static const struct sun6i_spi_cfg sun8i_h3_spi_cfg = {
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
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, sun6i_spi_match);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
