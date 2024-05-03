Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BF2C4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 13:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jRA+gKRPGrfA+k2jSZS7TgGCpOY2hR1YSYLczPZgh3M=; b=3ZOvS3ydRKl7cqNZidMWVn+GR2
	mgDh4JodZVhiFPzyRHW8sOEV4FcSeG7Vd/eN3lQBXRg5xASR3ORnhgQ7uesITlcrl9yxkAXM5Pr2H
	PWOE9RbS42CvU8RI2TO0RB6GpaFiSwKq7dhHe1TxldPaQvcOicSLN/R1/4ar0imZ2qgnwtmcIJ8vH
	4Sf/hH8I1kcmFzaJpNqPQcqeog2t0qFquV3ddFyzcad1431pGjVS0ezNNWHIbeV80+kOsXpXrEGca
	rzxA4tUH/fKW10/kZh5YpOkw4SDkUMAw780cdU7TAlQYLlUT2jYOZwyo4ND9Z+I0lS/yxfxjFXOnI
	ktNuQcJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2t42-0000000GgKg-33h2;
	Fri, 03 May 2024 13:35:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2t3z-0000000GgJk-1Haf
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 13:35:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4BB2661D97;
	Fri,  3 May 2024 13:34:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECD5EC2BBFC;
	Fri,  3 May 2024 13:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714743297;
	bh=AGslWhle4NIaFIY0mVoJpE21AAJwhRwa4mBQbv6ZRFM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=k8pxkAeRmvIoVFkp6t0iXIq3Gk4/1zk2zsNC6IImZ8848Oj6h/sv3hrHQbujGE8F9
	 Th53FltcJuJmWM2gttqffpQyn0Npyg8ipLNkJYhLH+ngxHqDK3G1LS+F2YNbjnur/a
	 R/IHfBkmS4ZD0JOoIfMgS+WDOyoynrWM0NOQaiPZlSb3RgE2ljKQ9+zpVOgoblwOg7
	 AMSE0fgJ+qkieWzWp+Dv9EdL1WrF4lrrEqD70VPZHcX4aYP5DYV9BCv4w+Seaa6lsj
	 J083SIH0G8vlrWMiVw/r9Cj97UYB9BVmfr3uAj+Q6fBKCffkmIgaQWIMwcnGC6hsgZ
	 OY1Fxq7Iuc7jg==
Date: Fri, 03 May 2024 08:34:55 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <drew@beagleboard.org>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Hal Feng <hal.feng@starfivetech.com>, 
 Emil Renner Berthing <kernel@esmil.dk>
In-Reply-To: <20240503111436.113089-2-yuklin.soo@starfivetech.com>
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
 <20240503111436.113089-2-yuklin.soo@starfivetech.com>
Message-Id: <171474329596.655929.15885006298482703153.robh@kernel.org>
Subject: Re: [RFC PATCH v3 1/7] dt-bindings: pinctrl: starfive: Add JH8100
 pinctrl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_063459_544494_9DB837EF 
X-CRM114-Status: UNSURE (   9.58  )
X-CRM114-Notice: Please train this message.
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


On Fri, 03 May 2024 19:14:30 +0800, Alex Soo wrote:
> Add documentation and header file for JH8100 pinctrl driver.
> 
> Signed-off-by: Alex Soo <yuklin.soo@starfivetech.com>
> ---
>  .../pinctrl/starfive,jh8100-aon-pinctrl.yaml  | 260 ++++++++++++++++++
>  .../starfive,jh8100-sys-east-pinctrl.yaml     | 222 +++++++++++++++
>  .../starfive,jh8100-sys-gmac-pinctrl.yaml     | 162 +++++++++++
>  .../starfive,jh8100-sys-west-pinctrl.yaml     | 219 +++++++++++++++
>  .../pinctrl/starfive,jh8100-pinctrl.h         |  13 +
>  5 files changed, 876 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-aon-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-east-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-west-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/starfive,jh8100-pinctrl.h
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.yaml:109:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-west-pinctrl.yaml:96:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-east-pinctrl.yaml:99:7: [warning] wrong indentation: expected 4 but found 6 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jh8100-aon-pinctrl.yaml:136:7: [warning] wrong indentation: expected 4 but found 6 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.yaml: properties:compatible: [{'items': [{'const': 'starfive,jh8100-sys-pinctrl-gmac'}, {'const': 'syscon'}, {'const': 'simple-mfd'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.yaml: properties:compatible: [{'items': [{'const': 'starfive,jh8100-sys-pinctrl-gmac'}, {'const': 'syscon'}, {'const': 'simple-mfd'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-west-pinctrl.yaml: properties:compatible: [{'items': [{'const': 'starfive,jh8100-sys-pinctrl-west'}, {'const': 'syscon'}, {'const': 'simple-mfd'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-west-pinctrl.yaml: properties:compatible: [{'items': [{'const': 'starfive,jh8100-sys-pinctrl-west'}, {'const': 'syscon'}, {'const': 'simple-mfd'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-east-pinctrl.yaml: properties:compatible: [{'items': [{'const': 'starfive,jh8100-sys-pinctrl-east'}, {'const': 'syscon'}, {'const': 'simple-mfd'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-east-pinctrl.yaml: properties:compatible: [{'items': [{'const': 'starfive,jh8100-sys-pinctrl-east'}, {'const': 'syscon'}, {'const': 'simple-mfd'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-aon-pinctrl.yaml: properties:compatible: [{'items': [{'const': 'starfive,jh8100-aon-pinctrl'}, {'const': 'syscon'}, {'const': 'simple-mfd'}]}] is not of type 'object', 'boolean'
	from schema $id: http://json-schema.org/draft-07/schema#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-aon-pinctrl.yaml: properties:compatible: [{'items': [{'const': 'starfive,jh8100-aon-pinctrl'}, {'const': 'syscon'}, {'const': 'simple-mfd'}]}] is not of type 'object', 'boolean'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-west-pinctrl.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-east-pinctrl.yaml: ignoring, error in schema: properties: compatible
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jh8100-aon-pinctrl.yaml: ignoring, error in schema: properties: compatible
Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-west-pinctrl.example.dtb: /example-0/soc/pinctrl@123e0000: failed to match any schema with compatible: ['starfive,jh8100-sys-pinctrl-west', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-gmac-pinctrl.example.dtb: /example-0/soc/pinctrl@12770000: failed to match any schema with compatible: ['starfive,jh8100-sys-pinctrl-gmac', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/pinctrl/starfive,jh8100-sys-east-pinctrl.example.dtb: /example-0/soc/pinctrl@122d0000: failed to match any schema with compatible: ['starfive,jh8100-sys-pinctrl-east', 'syscon', 'simple-mfd']
Documentation/devicetree/bindings/pinctrl/starfive,jh8100-aon-pinctrl.example.dtb: /example-0/soc/pinctrl@1f300000: failed to match any schema with compatible: ['starfive,jh8100-aon-pinctrl', 'syscon', 'simple-mfd']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240503111436.113089-2-yuklin.soo@starfivetech.com

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
