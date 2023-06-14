Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF9AEB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVwb/ocQHod9ZBq1Cpq+S2I9+gkwqMeVJpkeYLPLRHs=; b=bxNoEs77w0VCqU
	KVMdUIZXkvTTbZCKZBv609+tApihneFv6i8K5A0uns8d/oCXe41+okmlqJC25atdNJHZHXj4hPwmQ
	8IVHtg1eG6Iw/GANfkWKegvWy2ZuI8DPdUytja62ZbKdS9MW0Qf6ap4kIlZKQon+k/TJ4oDvom7JW
	XtGw1a1xgG6Wg38pvBquq3aOhSg6QlkoiAb++f8elxkm3mZrGJr3j04nV8MEiNkdygTtSqI2H3VOj
	0tXQD3AqWZQ9kY0idlw3JiGqq7l/QNT2zrfx3V7213lt/bM+EmU/Nqi0Rf2sLU09woGhcADkk3jOc
	Whkb0gFbOHSuGxQQuqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9RPs-00BtmJ-1n;
	Wed, 14 Jun 2023 14:24:08 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9RPo-00BtlI-0l;
	Wed, 14 Jun 2023 14:24:05 +0000
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-340b7da7e3aso1215865ab.3;
        Wed, 14 Jun 2023 07:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686752642; x=1689344642;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=//LQdmeIx8VDOjysyrkzNeX5nkq2mzKxfmFr/6gfOOo=;
        b=VnKes1l3H5U0OrCyV1KCr4q7otvnPxRp9C8mwGBiJ4QO/iNOgII1KHxnpSYU6cpdPG
         GpqUT/BxhvmjxASGcL2Qt8vgdqj+o+iyt6unsuHh4T+R+QSRRpxRUBRnmASIt/xPthS6
         fgiRcykM4ix4RWDAd16SjaD9ayGSF+tiwbtxP+RmvhGe8Lp/pJ6TdSHrpO41qxFsK2m/
         T0dOf1cdEWIBPJHsoMocezh1RvW+HzOwF0vLyyYFeLQn7UxIH7NRf1fwrlV1m1CpiGXw
         t53hUwRxWAeIVb1+c1MDVq+It7ICn11m6zA15UI55nUum8oJLV89qK+7XKvE3PSy1UAJ
         71uA==
X-Gm-Message-State: AC+VfDwAk7+NvKf4LuQrBNq2Zm76crKpMXLamGpDPgXp4jVsCih+zP1I
	W5Jy8Mm2cqdSTctOGgER6A==
X-Google-Smtp-Source: ACHHUZ7wXmcmWVBGnccJZukbwYP+C9yoCz/N62Wnj/yTIO7plH80L5GUh4kr2WXJ6/m3J00pZBVtGQ==
X-Received: by 2002:a92:db47:0:b0:33d:a34a:2d42 with SMTP id w7-20020a92db47000000b0033da34a2d42mr12955717ilq.20.1686752642282;
        Wed, 14 Jun 2023 07:24:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id c5-20020a02a405000000b0041848ea6594sm4885425jal.34.2023.06.14.07.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jun 2023 07:24:01 -0700 (PDT)
Received: (nullmailer pid 1344045 invoked by uid 1000);
	Wed, 14 Jun 2023 14:23:58 -0000
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Maksim Kiselev <bigunclemax@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-arm-kernel@lists.infradead.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor+dt@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, linux-riscv@lists.infradead.org, 
	Ramona Bolboaca <ramona.bolboaca@analog.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	William Breathitt Gray <william.gray@linaro.org>, Jonathan Cameron <jic23@kernel.org>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-iio@vger.kernel.org, 
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	ChiYuan Huang <cy_huang@richtek.com>, =?UTF-8?Q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Caleb Connolly <caleb.connolly@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>
In-Reply-To: <20230614132644.699425-3-bigunclemax@gmail.com>
References: <20230614132644.699425-1-bigunclemax@gmail.com>
 <20230614132644.699425-3-bigunclemax@gmail.com>
Message-Id: <168675263824.1343935.18392695577959894991.robh@kernel.org>
Subject: Re: [PATCH v6 2/3] dt-bindings: iio: adc: Add Allwinner
 D1/T113s/R329/T507 SoCs GPADC
Date: Wed, 14 Jun 2023 08:23:58 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_072404_273881_6CC401A2 
X-CRM114-Status: GOOD (  15.47  )
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


On Wed, 14 Jun 2023 16:26:26 +0300, Maksim Kiselev wrote:
> Allwinner's D1/T113s/R329/T507 SoCs have a new general purpose ADC.
> This ADC is the same for all of this SoCs. The only difference is
> the number of available channels.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../iio/adc/allwinner,sun20i-d1-gpadc.yaml    | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg:items: 'oneOf' conditional failed, one must be fixed:
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg:items: 'anyOf' conditional failed, one must be fixed:
		'Maksimum' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
		'type' was expected
		from schema $id: http://devicetree.org/meta-schemas/core.yaml#
	{'minimum': 0, 'Maksimum': 15} is not of type 'array'
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg: 'anyOf' conditional failed, one must be fixed:
	'maxItems' is a required property
		hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
	'items' is not one of ['maxItems', 'description', 'deprecated']
	'items' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
	/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg:items: 'oneOf' conditional failed, one must be fixed:
		/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/adc/allwinner,sun20i-d1-gpadc.yaml: patternProperties:^channel@[0-9a-f]+$:properties:reg:items: 'anyOf' conditional failed, one must be fixed:
			'maxItems' is a required property
				hint: Only "maxItems" is required for a single entry if there are no constraints defined for the values.
			'minimum' is not one of ['maxItems', 'description', 'deprecated']
			'Maksimum' is not one of ['maxItems', 'description', 'deprecated']
			Additional properties are not allowed ('Maksimum', 'minimum' were unexpected)
				hint: Arrays must be described with a combination of minItems/maxItems/items
			'Maksimum' is not one of ['description', 'deprecated', 'const', 'enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
			hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
			from schema $id: http://devicetree.org/meta-schemas/core.yaml#
		{'minimum': 0, 'Maksimum': 15} is not of type 'array'
		hint: "items" can be a list defining each entry or a schema applying to all items. A list has an implicit size. A schema requires minItems/maxItems to define the size.
		from schema $id: http://devicetree.org/meta-schemas/core.yaml#
	hint: cell array properties must define how many entries and what the entries are when there is more than one entry.
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230614132644.699425-3-bigunclemax@gmail.com

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
