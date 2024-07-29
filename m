Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EEC3C3DA61
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jul 2024 05:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RjOQFnHAnu9JLs/0sZsJxlBv8O9h/Umhiah1rG6yNgk=; b=dBNpKeeKQPOOAsDb8zEL89y5fZ
	01C2HwF/d+cgUdPtoTSYV8AbSiUpZ5TuGaYEZjkQ1v2NE4LJPSsTy+ira/onZUI/j1PkOQWwPZh3V
	JocvyxdZYt5CX/xePlOHsQIXCMW8uhoROl572An8qOJbs4koYZqYy6rI1a2d3uRgxW0bFHio0A+Zb
	EOSEtLtOh2/3YyNfS105+pJXbwn/bkc7Zu02eoHTxW54bIrljxSkn+v/FCxP7dCKJanWBKAK6BN8P
	hsqXW6StWwH/lW2xHKFSeEjaCTdwcVnQ4F/Hd175jnJe0GuZbxr+SE49d2TMbQNAnaFjGFYCHQzKd
	4uyJ+ETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYIpS-0000000A2Mc-49O1;
	Mon, 29 Jul 2024 05:21:50 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYIpP-0000000A2M5-39UL
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jul 2024 05:21:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 84847CE016A;
	Mon, 29 Jul 2024 05:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07B1EC32786;
	Mon, 29 Jul 2024 05:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722230504;
	bh=KruHvoHH42zwDU1xGJ3PkJoXwnikfd0WtTHCdlVyxtM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=cXRsqslYpi8b2/pM30oSUMlqF+vLezHFJPViUlcz/TYJ0YmJSAOoKWYGEKYOQ5/Te
	 nzaZ1t9jRXAcaNTDI2ld0oDP/Jl5juLPDIvluplad0WCiL4Ajhxte63YLpMqx/lWoa
	 tfOLUFfqs2+nEpPpGX5lF6cUpaMTC1DfuPu8bJC/pT4pkDhmjQ7KXhiCQ2MIQ606OS
	 mSWy3n0jENFeJJrrn+mhagS7LNx+cuKonx0U+VR8vTFduO2dp7M26R12SMTq4ok2Fv
	 mib9WriSAVJWyI+k/JpUNTTMhH+R5HHvXjA425eEa7TbTRJelZdjCxtnQLRZVo60oZ
	 9Mzc+wWcxdRWw==
Date: Mon, 29 Jul 2024 00:21:42 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 dmaengine@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Liu Gui <kenneth.liu@sophgo.com>, linux-riscv@lists.infradead.org, 
 Chen Wang <unicorn_wang@outlook.com>, Vinod Koul <vkoul@kernel.org>
In-Reply-To: <IA1PR20MB4953865775FA926B2BA4580CBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49535EC188F8EE3F8FD0B68DBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953865775FA926B2BA4580CBBB72@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-Id: <172223050278.2763977.11180028101195359000.robh@kernel.org>
Subject: Re: [PATCH v8 RESEND 1/3] dt-bindings: dmaengine: Add dma
 multiplexer for CV18XX/SG200X series SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240728_222148_171491_0613B7F9 
X-CRM114-Status: GOOD (  11.89  )
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


On Mon, 29 Jul 2024 12:36:51 +0800, Inochi Amaoto wrote:
> The DMA IP of Sophgo CV18XX/SG200X is based on a DW AXI CORE, with
> an additional channel remap register located in the top system control
> area. The DMA channel is exclusive to each core.
> 
> In addition, the DMA multiplexer is a subdevice of system controller,
> so this binding only contains necessary properties for the multiplexer
> itself.
> 
> Add the dmamux binding for CV18XX/SG200X series SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/dma/sophgo,cv1800-dmamux.yaml    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800-dmamux.example.dtb: dma-router@154: dma-masters: 4294967295 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/dma/dma-router.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/IA1PR20MB4953865775FA926B2BA4580CBBB72@IA1PR20MB4953.namprd20.prod.outlook.com

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
