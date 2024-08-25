Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF874C5321E
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Aug 2024 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:From:MIME-Version:Date:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ab+4KG1R+ojM53oB0kA5sTSdgzFNL2xVS3uLk+pJPHg=; b=ZKclLmYAONEm+i
	Dt55323/lDEL8e/e381aQJy+RvYqWZb1QJQPbKCuJIEpM7MdaBWl2eLx/uTLrQkaSCZjUxYbZL5fW
	p1nfyYZG4YJD1WPu8DnLq0OxtOU7pau4ijEty8GUYidpJ3EqXMJcvqS3anTCjamrstAvEx63Paqmz
	PoKsdKjEfvoQ/UZYlsbzuEldOv3rJpJXbSA5lRf3AS7cFkc0+/sLCENYIPYkvN18RbNDf7V1mG4M/
	AH/iIL7Nr47TPkKdInsBvilg/WfZ//fICNZhgXx+OJOiQmb4xb+n91Jo6WOFkAQbly7TqwHUz9DeE
	DNHkOS0YWcSRrTDgkqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE8z-00000004U0R-1yQO;
	Sun, 25 Aug 2024 14:23:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siE8v-00000004TzV-21ef
	for linux-riscv@lists.infradead.org;
	Sun, 25 Aug 2024 14:22:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 589DA60B93;
	Sun, 25 Aug 2024 14:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834ABC32782;
	Sun, 25 Aug 2024 14:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724595776;
	bh=rkM9g5ut8ywJerR7d/mwyAA5vHOU2dkdY0f6Jmpzmac=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Xz0fqWmPZPSg4jiwhxs39YBOFbQPsN0KG1K/Qa/qt7Gk/UEh1FeMBEMoIBVZwDuDK
	 tN/qOtV7RWXaLVlOFjQAdC33a90uackR9kNV4W5RRUoIO9Vg2Yau4wffY2l0cjxqgF
	 EQos4hGwcSZtmWjXLgB2VKLU1Yv1qbfy6BMGEuCrtdliMULQqTW5qHCv26nP9bUP/m
	 5Nj+o4BuTmjtaSK9rpcDUmSdoSMl+/rfjaJ+vRy/IdKPdc6bpjK4V7TXHCywedgfjp
	 YDf2YIX7NU6BEyK8PnVMlnzJVeuk8MYwjglmDo4rHlNPRQxsLzSi5NY9LwNeCM6IIi
	 IrL1+i4yKHn8Q==
Date: Sun, 25 Aug 2024 09:22:53 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
In-Reply-To: <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
Message-Id: <172459577302.1848940.15978105845752882956.robh@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents
 for K1 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_072257_634892_22004F25 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, linux-gpio@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, Jesse Taube <jesse@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


On Sun, 25 Aug 2024 13:10:02 +0000, Yixun Lan wrote:
> Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> 
> Two vendor specific properties are introduced here, As the pinctrl
> has dedicated slew rate enable control - bit[7], so we have
> spacemit,slew-rate-{enable,disable} for this. For the same reason,
> creating spacemit,strong-pull-up for the strong pull up control.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 134 +++++++++++++++++
>  include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  | 161 +++++++++++++++++++++
>  2 files changed, 295 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml: patternProperties:-cfg$:patternProperties:-pins$:properties:drive-strength-microamp: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.example.dtb: dsi-phy@10215000: drive-strength-microamp: 4000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/phy/mediatek,dsi-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/mediatek,dsi-phy.example.dtb: dsi-phy@10215000: drive-strength-microamp: 4000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dtb: pinctrl@10005000: i2c0-pins:pins1:drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.example.dtb: pins1: drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.example.dtb: pinctrl@10005000: i2c0-pins:pins:drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8186-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8186-pinctrl.example.dtb: pins: drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.example.dtb: pinctrl@10005000: i2c0-pins:pins:drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8195-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8195-pinctrl.example.dtb: pins: drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.example.dtb: pinctrl@10005000: i2c0-pins:pins:drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.example.dtb: pins: drive-strength-microamp: 1000 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.example.dtb: pinctrl@d401e000: '#gpio-range-cells', '#pinctrl-cells' do not match any of the regexes: '-cfg$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.example.dtb: uart0-2-pins: drive-strength-microamp: 32 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org

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
