Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08EE6C7EE2C
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 09:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JM05W4oFsr/xFgccIZgel1h/ghmqz+KuCRE8dkNeQIA=; b=rB1deb2H4kOv4j
	bUQZdcQZzoymqpkrYO7NIbwK4lmn1bt3FX2kzI4oN8iGb1vfby7WaDuecnchgKmRiPwtG8mN16J7L
	tT+dOhe2M0YyBVUZDIpsLd2ER7hJx0HpD4F5jFCrgHSF1Fdfpw1NIzurObj34QG9kJEU7Fx2ZRRGE
	P8PqCQVnZthvl6HvMSeQT/peu2GSfb1H4/QzmjNqzlU+e93eSJJRG4w+QMdmEntiE9QCwi8dO2TzY
	dYADner9q+a3srIwvuPuuCZroe+d5buoDuvyhgCnwxXweEQVtia3IPBslN07Rh0XNYh8HdQNZLUwd
	6z6+lKElFH1gvokgz+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ktZ-00Cz1D-1p;
	Wed, 24 May 2023 09:35:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1ktG-00Cynu-0l;
	Wed, 24 May 2023 09:34:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA44A1042;
	Wed, 24 May 2023 02:35:22 -0700 (PDT)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AC91B3F67D;
	Wed, 24 May 2023 02:34:33 -0700 (PDT)
Date: Wed, 24 May 2023 10:34:31 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Conor Dooley <conor@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Cosmin Tanislav
 <demonsingur@gmail.com>, Mike Looijmans <mike.looijmans@topic.nl>, Haibo
 Chen <haibo.chen@nxp.com>, ChiYuan Huang <cy_huang@richtek.com>, Ramona
 Bolboaca <ramona.bolboaca@analog.com>, Ibrahim Tilki
 <Ibrahim.Tilki@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>,
 William Breathitt Gray <william.gray@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Leonard =?UTF-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [RFC PATCH v1 0/4] Add support for Allwinner GPADC on
 D1/T113s/R329 SoCs
Message-ID: <20230524103431.50c6a2fd@donnerap.cambridge.arm.com>
In-Reply-To: <20230524082744.3215427-1-bigunclemax@gmail.com>
References: <20230524082744.3215427-1-bigunclemax@gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_023442_370981_24F14899 
X-CRM114-Status: GOOD (  18.86  )
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

On Wed, 24 May 2023 11:27:29 +0300
Maxim Kiselev <bigunclemax@gmail.com> wrote:

Hi Maxim,

many thanks for your work on this and for posting it!

> This series adds support for general purpose ADC (GPADC) on new
> Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> provides basic functionality for getting ADC channels data.
> 
> All of the listed SoCs have the same IP. The only difference is the number
> of available channels:
>      T113 - 1 channel
>      D1   - 2 channels
>      R329 - 4 channels

This may sound kind of obvious, but wouldn't it be easier to model this
with one compatible string, and have the number of channels as a DT
property?
Or, alternatively, using iio/multiplexer/io-channel-mux.yaml, since it's
only one ADC anyway?

And btw: it seems that the T507 (the H616 die with a different pinout) has
the same IP, with four channels:
http://dl.linux-sunxi.org/T507/

Cheers,
Andre

> This series is just an RFC and I would be glad to see any comments
> about it.
> 
> 
> Maxim Kiselev (4):
>   iio: adc: Add Allwinner D1/T113s/R329 SoCs GPADC
>   dt-bindings: iio: adc: Add Allwinner D1/T113s/R329 SoCs GPADC
>   ARM: dts: sun8i: t113s: Add GPADC node
>   riscv: dts: allwinner: d1: Add GPADC node
> 
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    |  52 ++++
>  arch/arm/boot/dts/sun8i-t113s.dtsi            |  12 +
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |  10 +
>  drivers/iio/adc/Kconfig                       |  10 +
>  drivers/iio/adc/Makefile                      |   1 +
>  drivers/iio/adc/sun20i-gpadc-iio.c            | 275 ++++++++++++++++++
>  6 files changed, 360 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
>  create mode 100644 drivers/iio/adc/sun20i-gpadc-iio.c
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
