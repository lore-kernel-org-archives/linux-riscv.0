Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722C2E92FD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 03:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iWE4pDGjuN2pbIKRNeBK9GBPhfJl92dGG/tI4HJSquQ=; b=nhA/VUEgdFRMibKNcvY3u+T8E/
	iLXdfQcrStTaUyNwpohu7nVfv50yztH/04yCjb27nWD+5rSLGMea0U8uRh6Z36qi0tGYAzmqW5t8h
	BRnrHNx6YPpxe76Af21Jpd7qgw9QHW4/3E0Xe7kW3hsNylUhrvTd3ohPUm8haCWRtyLcMvy04f+3w
	JjzPErfQw2VAfKMEQ69ciek997lanYvHTbjNl4mv1WItIJ27EzrwWujmElcQ4uenlh4zDOVrFhl8Q
	iG/gHL1BSU2fWtBOgp3y1uOUDgXypqj3sjdE1UZAgEAC22P4XSxC4ZlGlRxb7HSle5NFEmOQ2WMPZ
	dPFqEwDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQcB-00000004N5a-3Xo5;
	Tue, 30 Dec 2025 03:41:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaQc9-00000004N4v-3Dur;
	Tue, 30 Dec 2025 03:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF9C540BA2;
	Tue, 30 Dec 2025 03:41:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAE5C4CEFB;
	Tue, 30 Dec 2025 03:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767066100;
	bh=FBYZJLqTJj6T2CX6kHrfFxJOGHTG7o2x6HGNVT60X5M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qvQBAtQs6VCjF05fQp//RYcW5/clAwkEWZcIAVdrEFtaVrhmCPWCZQ37T6UAi+WW1
	 +gefcz+yXppeFw9K6fvcUIM+iLHnaBOKDeAD2REOuya6o/gQ9LMI+VcSYf4hx7JXJ5
	 o6/3rjwKYP++mn3V+huuwTmy2AtvPLbgLD6tgPqvvREh2GYC4Tb166+9rwwJRCSRjX
	 UaKzZUgsOhXJwDDsrA8PUl5gQ3ae1Qvozeo5SuQ9vQELJYV39Egq2hZj2A/wFfwF1t
	 SfEclDYykILBvlp/QmgpRo8mwuGvLBLuce+efMxkFh6AFCXgIzWBFzSrViv+u0nSA1
	 yENqwPDAhv58Q==
Date: Mon, 29 Dec 2025 21:41:39 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, aou@eecs.berkeley.edu, 
 devicetree@vger.kernel.org, pjw@kernel.org, alex@ghiti.fr, conor@kernel.org, 
 gregkh@linuxfoundation.org, neil.armstrong@linaro.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, vkoul@kernel.org, 
 krzk+dt@kernel.org, linux-riscv@lists.infradead.org, palmer@dabbelt.com
To: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
In-Reply-To: <20251230023725.15966-4-jiayu.riscv@isrc.iscas.ac.cn>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
 <20251230023725.15966-4-jiayu.riscv@isrc.iscas.ac.cn>
Message-Id: <176706609879.3313806.3074189602443802489.robh@kernel.org>
Subject: Re: [PATCH 3/5] dt-bindings: usb: dwc2: Add support for Canaan
 K230 SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_194141_869319_C858D7C2 
X-CRM114-Status: GOOD (  11.61  )
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


On Tue, 30 Dec 2025 10:37:22 +0800, Jiayu Du wrote:
> Add 'canaan,k230-usb' compatible string with 'snps,dwc2' as fallback
> for the DWC2 IP which is used by Canaan K230.
> 
> Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml: Unresolvable reference: schemas/phy/canaan,k230-usb-phy.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml: properties:reg: {'description': 'Two register regions for USB PHY in HiSysConfig syscon block.', 'items': [{'description': 'USB PHY test control reg (pullup/pulldown config)'}, {'description': 'USB PHY core control reg (PLL/transceiver tuning)'}], 'minItems': 2, 'maxItems': 2} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
	False schema does not allow 2
	[{'description': 'USB PHY test control reg (pullup/pulldown config)'}, {'description': 'USB PHY core control reg (PLL/transceiver tuning)'}] is too long
	[{'description': 'USB PHY test control reg (pullup/pulldown config)'}, {'description': 'USB PHY core control reg (PLL/transceiver tuning)'}] is too short
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml
Lexical error: Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.example.dts:27.35-56 Unexpected 'K230_HS_USB0_AHB_GATE'
Lexical error: Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.example.dts:34.35-56 Unexpected 'K230_HS_USB1_AHB_GATE'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:145: Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1565: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251230023725.15966-4-jiayu.riscv@isrc.iscas.ac.cn

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
