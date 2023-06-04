Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA06C7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 19:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNoWvdXEoskTJ+AnhGS7PRbjEC5jCGIjm4o9o4aAX5w=; b=0ygwmdxlCOOaZ3
	QYjlWl/ggy5HfYKCeo/6CutnZoFb1ZQsFlMFbM86D3Hclh9CmOuc/eI4lp6d6Yeab8sZdgAslPHA/
	VdbfEJ8TGtrJhOvW03uvhuk1+rNrOD5ZKghAwSp13+kMECtM5lILZDTPkMyW6rQDjnCRCO2cy3kMw
	SyVN1bTtooxytpdMu/finqoDoSJ7MZw3yG/hCOemYAHvZkk0HC5d8d7IXKe2PnAlAWI81k8h56nMW
	NQikbFaDyS6TT3IR9qQhKQxOA7iWCY85E/1moZRT1mNt7YMN+2rmSvAvauCnP10PCKtk/6Y5sO8sq
	d7r5WsoUB/zQpk4A2eyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5tPm-00CtyL-25;
	Sun, 04 Jun 2023 19:29:22 +0000
Received: from mail-io1-f47.google.com ([209.85.166.47])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5tPi-00Ctuh-0i;
	Sun, 04 Jun 2023 19:29:20 +0000
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-77493b3d18cso162793939f.0;
        Sun, 04 Jun 2023 12:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685906948; x=1688498948;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ij5XhT5jB8Nf96u95NnR46WqBGb6FiYB0L867QNIR/M=;
        b=PiACdlqxFqOh84dMPpz/gDIBqA9SGe4MbPSS7xE1KpgXQHg2GShEoHTa+ztI1PuxKl
         pUMbZ2Ry7+YLUQ6/oZCnAptci2vVAGuoVCX79D8EE4DDjHAO4nSPN+EYf3hWLbpASnA4
         Q8WtbUualYjqdipf4BDVLS43jjWJvOrlVoN0SCSqyxrEdmBCHyTguncP9srGjuo2s2+g
         xgEK3rnA4wIHOE3qtOlL5bC8maGOUdoiEmNWc0Kz7yOQ8Y2CUf/uZ8OsmASC3Hv52HB1
         buznvFHqk3VsJLOesivfPjGnjolyqxf0Vei6TAk5XBl7E24s/HviK3iF0VIjrp6MH+93
         PC2g==
X-Gm-Message-State: AC+VfDxpK7BS6eotRPQOs5WYRhzZ/Ejmi1XxCkgcnxeRqcljtg/lS0fM
	9PYFl26dO4rw/GjtKn1U/g==
X-Google-Smtp-Source: ACHHUZ4JJS8XBgdt1+SzDtD2MEpxUV98/xM2bSyFtyQkPzj8iOewpvgcay8t2+isMQNpFA3ff4OK9g==
X-Received: by 2002:a05:6602:2584:b0:76c:785f:8f82 with SMTP id p4-20020a056602258400b0076c785f8f82mr11914911ioo.6.1685906948618;
        Sun, 04 Jun 2023 12:29:08 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id a22-20020a056638019600b0041abd81975bsm1697542jaq.153.2023.06.04.12.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 12:29:07 -0700 (PDT)
Received: (nullmailer pid 3700333 invoked by uid 1000);
	Sun, 04 Jun 2023 19:29:04 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: ChiYuan Huang <cy_huang@richtek.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
	William Breathitt Gray <william.gray@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Haibo Chen <haibo.chen@nxp.com>, 
	devicetree@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Andre Przywara <andre.przywara@arm.com>, Mike Looijmans <mike.looijmans@topic.nl>, 
	Chen-Yu Tsai <wens@csie.org>, Ramona Bolboaca <ramona.bolboaca@analog.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Cosmin Tanislav <demonsingur@gmail.com>, linux-iio@vger.kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	=?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
In-Reply-To: <20230604185336.1943889-3-bigunclemax@gmail.com>
References: <20230604185336.1943889-1-bigunclemax@gmail.com>
 <20230604185336.1943889-3-bigunclemax@gmail.com>
Message-Id: <168590694462.3700314.2525765521559343425.robh@kernel.org>
Subject: Re: [PATCH v3 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Date: Sun, 04 Jun 2023 13:29:04 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_122918_265776_F33D3CFB 
X-CRM114-Status: GOOD (  12.17  )
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


On Sun, 04 Jun 2023 21:53:15 +0300, Maksim Kiselev wrote:
> From: Maxim Kiselev <bigunclemax@gmail.com>
> 
> Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> This ADC is the same for all of this SoCs. The only difference is
> the number of available channels.
> 
> Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 90 +++++++++++++++++++
>  1 file changed, 90 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.example.dtb: adc@2009000: interrupts: [[73], [4]] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230604185336.1943889-3-bigunclemax@gmail.com

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
