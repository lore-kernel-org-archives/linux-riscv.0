Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E255BC54E66
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Mar 2024 04:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eb7F86jGUnYCE561IcWMypJAkTObRQR25xiN+D+OQNo=; b=g19VoPZigSxYhOQ8KLUw2Mskpr
	GGQmvMp9F0DlaCCHcEF+nwSb87UpoT7HklRzPrTg+XlvD4Tc3rFjeHFPEELQELn8Mn+DPEKEOltF7
	nh4/iSFpzvc29bKyOIgi/FddLetCUZXNPMTJqvJ64OJlQ6//COIpE2a/ct7ieqAFrbvKZdiZ3TW9B
	+6pi+fZmH/hVkrJfFcdbjz4JvFNI4Tp2+G6/vjhPQlDakK4Msm6cjsIAhSmPajFNamIKLvQQTn+4c
	j+6jVQG6TTrzIqae/94KYfrpMsquD3DXH/80z0W7zLsDaIsnn3TNd29LQ+clVowfaxtpOznpsy3DX
	0tRVFWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkzJk-0000000GdlQ-0x9f;
	Fri, 15 Mar 2024 04:37:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkzJg-0000000Gdl2-3HGB
	for linux-riscv@lists.infradead.org;
	Fri, 15 Mar 2024 04:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 65EA4616A8;
	Fri, 15 Mar 2024 04:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA0CC43390;
	Fri, 15 Mar 2024 04:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710477430;
	bh=PUemYcFBAHOYhcdhTqcE5Userz2v4Fkqh5RMcCkrqVo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=qx8emhmYpsXEI4WbCttop0+dqnAdklqAL0xSfWVGuLwPdLcIx+ZbIfV3QRPWl8CwD
	 eXoc4lvrLvY9uYFHvcYMIxoSNScxCtUxU6MP9hWzoEfJam6oOl/0Ek+hcy1z7Uvbjd
	 /CAfosxaXYlckrqBX1ARfopMr+MAWTOB7kHFwgl6PvZEQ4/qXI+HtBjygRJPftDaWC
	 5/DQftw1S2C5Dp2u6O2lFWHX9Mrw18iZOTRAbziHpjv1QQ8lhkrIcdwD4NXMw5HZHs
	 Y0cNBKjDEaz2ermjUPv0UIqXbtQIsyl9pipSSWgPD2w3dHlcCq9QJYAziyCG3K+rh5
	 GxVmnMqGTiYSw==
Date: Thu, 14 Mar 2024 22:37:07 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, dmaengine@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 dlan@gentoo.org, linux-riscv@lists.infradead.org, 
 Chen Wang <unicorn_wang@outlook.com>, Vinod Koul <vkoul@kernel.org>, 
 Jingbao Qiu <qiujingbao.dlmu@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Liu Gui <kenneth.liu@sophgo.com>
In-Reply-To: <IA1PR20MB4953D930316266781A229E97BB282@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB4953E7BB0B270157C8D1DDACBB282@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953D930316266781A229E97BB282@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-Id: <171047742671.4112904.2484238766002561256.robh@kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: soc: sophgo: Add top misc
 controller of CV18XX/SG200X series SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_213713_009641_FA00CAE9 
X-CRM114-Status: GOOD (  11.34  )
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


On Fri, 15 Mar 2024 10:50:33 +0800, Inochi Amaoto wrote:
> CV18XX/SG200X series SoCs have a special top misc system controller,
> which provides register access for several devices. In addition to
> register access, this system controller also contains some subdevices
> (such as dmamux).
> 
> Add bindings for top misc controller of CV18XX/SG200X series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  .../soc/sophgo/sophgo,cv1800-top-syscon.yaml  | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dts:25.13-44: Warning (reg_format): /example-0/syscon@3000000/dma-router@154:reg: property has invalid length (16 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dts:23.26-29.13: Warning (avoid_default_addr_size): /example-0/syscon@3000000/dma-router@154: Relying on default #address-cells value
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dts:23.26-29.13: Warning (avoid_default_addr_size): /example-0/syscon@3000000/dma-router@154: Relying on default #size-cells value
Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800-top-syscon.example.dtb: dma-router@154: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/IA1PR20MB4953D930316266781A229E97BB282@IA1PR20MB4953.namprd20.prod.outlook.com

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
