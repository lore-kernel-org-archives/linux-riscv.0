Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AA2C77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 24 May 2023 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gQ89IGIUoPce9el8NNZ93OdY3J6OzCr+jHrMxrOMMA0=; b=30+24KCjmmZA8y
	YA3Ezd8QXMS6CIJDJf5ZzRnWFmCGUiezSwrHMA9zADTQcy01EgfmVpU4Uh+fx108ZdMsSwV76VIxq
	6FdlbxBA1chXH/pqm4aL3KO73Uqo3ic9Bh2RfXtE1Nxpj5n1yImPLlu2++yrA++JYfbxiQgNQErzj
	lEnO/pc7CEzQlKDdbcTW+3UsXO4RfBbsAKUn2F+qWX2p5W9Vk62AtUWJQoF3jwPSFboUPYHVHeOfd
	hhyHRMzdjKkyEKBYo/oVKupBruR+37YJ5MnBbnghKbUXgrd8lf0+faiZ2SxVqklipLwei3UWEaFvo
	8SO4jpaepFHb/GcB0GTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kgU-00CvSu-0s;
	Wed, 24 May 2023 09:21:30 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1kg6-00CvDk-0h;
	Wed, 24 May 2023 09:21:07 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6af81142b6dso24578a34.2;
        Wed, 24 May 2023 02:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684920063; x=1687512063;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ooM2WEkot7KuXyG8TFkP/cOGbwCsIoaqyATdhVKfqHo=;
        b=HBEc9mO06vm9bQAonCs6c9uTU79VKDtglBubGUrjlRhq+bAj3aixF8W8rLB0BK3Rt3
         sX+p4hq+RsCAPIjZ5pZwsdeEjnDnVDvjLk5LZl7sNZTjY59C+zre7EJSLYmnT+940Ccj
         vnjkPoXpqivcp1k0FHuzl2iqt8J6HgmdyFOsrHAbgucMAzFZSqjH6IkPSxcOhT+g6eFf
         BuKQDChhtNGQDWt2nwqBTRnqe2YZ5D/Jeie7IIMWgtvImBokGiodLFJGpzysp8hkAt6j
         1ZakrYiacPGK4tGLk78aoh1///cm6/LqyIs0QBQ6HWfvEHZsdfQ9xKOabF/sQDc4cbsr
         VylQ==
X-Gm-Message-State: AC+VfDx/LaSKkR/DD774JVOBOl1IWHgCRV3A2wN86+B1EpGOsf+EBB6u
	0jFg66zZIoCkX4qg/U82+g==
X-Google-Smtp-Source: ACHHUZ4tFm4ZuNjyciy5rDRzPIQPer8A2tuJgUMFQzjxCy7xPQFdCReLHYiLcV5WSajQCgi+WrZNxA==
X-Received: by 2002:a05:6830:1b67:b0:6af:8b3f:cda4 with SMTP id d7-20020a0568301b6700b006af8b3fcda4mr3059936ote.13.1684920062785;
        Wed, 24 May 2023 02:21:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a23-20020a9d6e97000000b006af8ac6ed5dsm1992509otr.38.2023.05.24.02.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 02:21:02 -0700 (PDT)
Received: (nullmailer pid 3187102 invoked by uid 1000);
	Wed, 24 May 2023 09:21:00 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Caleb Connolly <caleb.connolly@linaro.org>, devicetree@vger.kernel.org, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, linux-iio@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Haibo Chen <haibo.chen@nxp.com>, 
	Chen-Yu Tsai <wens@csie.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Conor Dooley <conor@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, linux-sunxi@lists.linux.dev, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, linux-riscv@lists.infradead.org, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, ChiYuan Huang <cy_huang@richtek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Samuel Holland <samuel@sholland.org>, 
	Cosmin Tanislav <demonsingur@gmail.com>, William Breathitt Gray <william.gray@linaro.org>
In-Reply-To: <20230524082744.3215427-3-bigunclemax@gmail.com>
References: <20230524082744.3215427-1-bigunclemax@gmail.com>
 <20230524082744.3215427-3-bigunclemax@gmail.com>
Message-Id: <168492006052.3187086.8767275310596142124.robh@kernel.org>
Subject: Re: [RFC PATCH v1 2/4] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329 SoCs GPADC
Date: Wed, 24 May 2023 04:21:00 -0500
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_022106_256617_34B5FD3D 
X-CRM114-Status: GOOD (  13.23  )
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


On Wed, 24 May 2023 11:27:31 +0300, Maxim Kiselev wrote:
> Allwinner's D1, T113s and R329 SoCs have a new general purpose ADC.
> This ADC is the same for all of this SoCs. The only difference is
> the number of available channels.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
Error: Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dts:27.28-29 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1512: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230524082744.3215427-3-bigunclemax@gmail.com

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
