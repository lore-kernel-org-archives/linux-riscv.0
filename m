Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F78C5DF67
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 21:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fd+2LoOzVuy+DgFXqMCpLK6bgWSnrAdFe329AykEdmM=; b=JYTa0lWsFOjFdk
	yw+wnPGIYMsJqdsj9VJq44p4URkMmDmFlkZjW2Sdr7fDzWwZQ361KPT5DqZTGFGHkFLlgy30/JWNX
	70Dsaggebm08nJHhjnazTUcnkUsBr3HNHScgb0SsKFuueqr924dxdeQ1KvY07emocCFDqb/LVi+b4
	fMde8FY+rLXwJifYMooZ/AI9GgxpBT4RVrbd974JgPSmJsvvIA7ItS2EosSOaqAz0sZwtSpnYwje9
	MEaIBvKbdSXLqHiSHz8ePpu+D/CtAvA7e5EodBs89BpEa1IZ0uSBjMhm41WxODS05pChJNmnETovF
	RfjFwm+FSN7PrpLti/ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMKE-00000004Dhz-0nEQ;
	Sat, 15 Aug 2026 21:53:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMKC-00000004Dhj-3OnM
	for linux-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 21:53:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 26B56407AA;
	Sat, 15 Aug 2026 21:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCFD1F000E9;
	Sat, 15 Aug 2026 21:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786830836;
	bh=Mng5BWniPeM9reYy1Ta8r3Rg3KlW7xeXbQGcgXUrO34=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=P2YM3pUORIKpEYq4xfYIc2GwhcWeDZbxxcP4lsSSZX/EuKfkGIWFksrUm593hpj2V
	 QQPywa1gnaeYt6zSlInPsAX27cRe8s3RcSoAyIxeR6w8UaWMRtczvz/33lIgHFTDkV
	 CZWbqITuvZ9Z20aWtrPOtTot/pwF5WNkbuR7C5IPRM1mACFS+UKhF04YIcaSEpkFaj
	 AsBRHxRNvFa14B/+nZEevp/yHgMvu7ZdmFwijPehZABB8DJ4Ozke5BAzm8GXCwkphl
	 Ao0gYq+evbHOqdOXx9cBoRRFKCyhJcfkOx4HrsAH7Wmi5hrAY8u2p68T84DqkrKYJ1
	 F2EvcDDE3s9rw==
Date: Sat, 15 Aug 2026 22:53:48 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Janani Sunil <janani.sunil@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>, Marius Cristea
 <marius.cristea@microchip.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Kent Gustavsson <kent@minoris.se>, Conor
 Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, Janani Sunil <jan.sun97@gmail.com>,
 <linux-spi@vger.kernel.org>, Kent Gustavsson <nedo80@gmail.com>,
 <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v8 3/3] iio: dac: Add AD5529R DAC driver support
Message-ID: <20260815225348.7a3bef4d@jic23-huawei>
In-Reply-To: <20260805-ad5529r-driver-v8-3-b41781f5632a@analog.com>
References: <20260805-ad5529r-driver-v8-0-b41781f5632a@analog.com>
	<20260805-ad5529r-driver-v8-3-b41781f5632a@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Wed, 5 Aug 2026 09:17:43 +0200
Janani Sunil <janani.sunil@analog.com> wrote:

> Add support for AD5529R 16-channel, 12/16 bit Digital to Analog Converter
> from Analog Devices.
> 
> The device communicates over SPI and supports per-channel output range
> configuration. An optional external 4.096V reference can be used in
> place of the internal reference.
> 
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>
> ---
>  MAINTAINERS               |   1 +
>  drivers/iio/dac/Kconfig   |  17 ++
>  drivers/iio/dac/Makefile  |   1 +
>  drivers/iio/dac/ad5529r.c | 530 ++++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 549 insertions(+)
> 
>

...

> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 657c68e75542..bb1d59889a2a 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -134,6 +134,23 @@ config AD5449
>  	  To compile this driver as a module, choose M here: the
>  	  module will be called ad5449.
>  
> +config AD5529R
> +	tristate "Analog Devices AD5529R High Voltage DAC driver"
> +	depends on SPI_MASTER
> +	select REGMAP_SPI
> +	help
> +	  Say yes here to build support for Analog Devices AD5529R
> +	  16-Channel, 12-Bit/16-Bit, 40V High Voltage Precision Digital to Analog

Trivial but this wrap is rather random. Please tidy it up to a consistent 80 chars

> +	  Converter.
> +
> +	  The device features multiple output voltage ranges from -20V to +20V,
> +	  built-in 4.096V voltage reference, and digital functions including
> +	  toggle, dither, and ramp modes. Supports both 12-bit and 16-bit
> +	  resolution variants.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called ad5529r.
> +
>  config AD5592R_BASE
>  	tristate


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
