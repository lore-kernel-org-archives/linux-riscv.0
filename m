Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CF48C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 23:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=keFyJ97NuDfFvg96YtN5KhIXdFAC+M7XbNfCTxjWUgo=; b=lO5vtv0/Yyt7ym
	J3vlETKiVWbDyceyBW/2yNdk1V28D7raw/fyxMCQJw1hTRDOgO99yhuwkBKOgZv5Ndpv9bUN8/3X7
	rMDv2LB5+tdyXVapbIFBN/RTzgomEIvCBpbDA+9Ia9Vpp135ChchEMyVM/+fl4BYwvqPX5RkfAtDs
	ncymczZYWdAfGpYrIiGUyGgkeGmxkZZemLW+CrR6k/lKnnj0zYYgWP8aWvzhHtcef4gsLr1RVnQz2
	lqYOK1QwLF+ZOQOGYu1mDTOfqA2uU6oIPT6M2K6bQCK2VoRoSxpSqR3XfOO8ovxUj+IM8fT2BcHd7
	ZQfoWCgfaqcyzwsjrRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4rlK-005Eat-0A;
	Thu, 01 Jun 2023 23:31:22 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4rlF-005EaD-2O;
	Thu, 01 Jun 2023 23:31:19 +0000
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-77487fc1f16so19832539f.0;
        Thu, 01 Jun 2023 16:31:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685662274; x=1688254274;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cb1CfXzrs6lfSi6zBUOFLpr0Hb+1fAVic93bHB6hbRY=;
        b=T501VaYc3spMgG0WLkWTzsIPlar5v/uVAjqbEH9LFuM6LxYizbFh8qErnhU94X5QpX
         oXLxgbD0cGfq/Ale1FfOIi+9joXJCaINh5RYQzeRIuQFXO28O/dxbfziwfIv6jCDee8K
         7MEXRXECjN/N0ZQVVe0xVCkr0/IQCim2k4LoLkCX5RTXQvl6owDm8G3AGqjzaeHpSBYg
         NhDUPhPABIPCDjT7FFjWPdUxC4IpmZY2ru8accjSq75772cAJz+3gM2VTp5G89oQ7hil
         2D1Z+r6EozS6dvzJdtvFVYBFpVz0AbJu0V92a5ILOMF8pRrJCySeOYFQPIl7TRZWdj5T
         +tWA==
X-Gm-Message-State: AC+VfDxWiVBk//kNcc0zwIwT+HiEhOl0nIfKL0Wet2OV7pUfdKnUfrQE
	o6R0GY5vv8dMCBOuTIBa9A==
X-Google-Smtp-Source: ACHHUZ7KuUx3HpNpCs9tLCFhl7zyHSWtos++Yn9HCL/4MuIL0XWFVJLJNNAME44mwEOW+VqD1lLqrg==
X-Received: by 2002:a6b:a04:0:b0:76c:c701:2f77 with SMTP id z4-20020a6b0a04000000b0076cc7012f77mr857930ioi.3.1685662274343;
        Thu, 01 Jun 2023 16:31:14 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id k13-20020a056638370d00b0041ac54cbc60sm2507403jav.56.2023.06.01.16.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 16:31:13 -0700 (PDT)
Received: (nullmailer pid 680122 invoked by uid 1000);
	Thu, 01 Jun 2023 23:31:10 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Heiko Stuebner <heiko.stuebner@vrull.eu>, linux-iio@vger.kernel.org, 
	Samuel Holland <samuel@sholland.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Arnd Bergmann <arnd@arndb.de>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Caleb Connolly <caleb.connolly@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, Conor Dooley <conor+dt@kernel.org>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, linux-sunxi@lists.linux.dev, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	linux-riscv@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, linux-kernel@vger.kernel.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Rob Herring <robh+dt@kernel.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	William Breathitt Gray <william.gray@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
	ChiYuan Huang <cy_huang@richtek.com>, Jonathan Cameron <jic23@kernel.org>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Mike Looijmans <mike.looijmans@topic.nl>
In-Reply-To: <20230601223104.1243871-3-bigunclemax@gmail.com>
References: <20230601223104.1243871-1-bigunclemax@gmail.com>
 <20230601223104.1243871-3-bigunclemax@gmail.com>
Message-Id: <168566227051.680105.5733105640586356762.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Date: Thu, 01 Jun 2023 17:31:10 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_163117_805031_8D880E8D 
X-CRM114-Status: GOOD (  13.40  )
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


On Fri, 02 Jun 2023 01:30:40 +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> This ADC is the same for all of this SoCs. The only difference is
> the number of available channels.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dts:33.15-25: Warning (reg_format): /example-0/adc@2009000/channel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dts:37.15-25: Warning (reg_format): /example-0/adc@2009000/channel@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dts:32.23-34.15: Warning (avoid_default_addr_size): /example-0/adc@2009000/channel@0: Relying on default #address-cells value
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dts:32.23-34.15: Warning (avoid_default_addr_size): /example-0/adc@2009000/channel@0: Relying on default #size-cells value
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dts:36.23-38.15: Warning (avoid_default_addr_size): /example-0/adc@2009000/channel@1: Relying on default #address-cells value
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dts:36.23-38.15: Warning (avoid_default_addr_size): /example-0/adc@2009000/channel@1: Relying on default #size-cells value
Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230601223104.1243871-3-bigunclemax@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
