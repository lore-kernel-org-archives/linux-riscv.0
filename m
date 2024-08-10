Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0117CC3DA7F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Aug 2024 09:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VTKO2nTwV3jRvdPrr9HHmvPZwY1cDHT5a6oZPF0ldL4=; b=djNmxRcKNl63+XmceTIIS07lQe
	HivppttaZLH1sUCsTG41B1/4oKXOhTH5ViStcMQVND3Zyr4RjqJS2PH8QXhsK+rlFmTnr0woAAz85
	J7TxnCzeM3PtBepgJTIb0r/XJbwTUZKTrIQj+COGeDpL6PhOEMoM30iCZUM7V5PFqacWT5yJI4YFH
	VJExaj6hkm/UDanM0+CZgLjUNNJgsV2pj8cz/gseqez01ybW7VrMV8LkXBDnmeCmACzeDfp4+eK8L
	xpDTMIm3M9TLQwokb8AIG4HyofrrRjGXkFj99IRWJsOEaIzgR0WVNfjg4RybBVGYpQf3t7HUzPOrg
	AO3OoFKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sciIv-0000000Dqw9-241B;
	Sat, 10 Aug 2024 09:22:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sciIs-0000000Dquv-2aPX
	for linux-riscv@lists.infradead.org;
	Sat, 10 Aug 2024 09:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A29C6CE1715;
	Sat, 10 Aug 2024 09:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F99FC32781;
	Sat, 10 Aug 2024 09:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723281742;
	bh=Wggb/KQ1jKzObVCEvDWxIY7sWLOyIi04ajTFUixFNFk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=uWc8zMTK3+JFSfRE4Upg+8OwemqhRtOApSPiIGfMsxKKNajedEje03C/BxPMpMlek
	 fUdIesxdzg2OD0Y7oJFKxYGIU/FJcf6QsoApcw3eiqSzUVjk8QlAXDi4GBoaqTgZaK
	 nR8IY6MskxFW1JH44tJQ1W5Pd6VMFGiXpMGCxu2b0EVssNkWnjYuxbhdZC62ke7qOa
	 pMAQGMBVDNXpu0Y9B1NNIFUFMK2L0ncp1ZJTO+i0hiNIBd8R7NIH3n7d7BzNzvjxec
	 mfh1b/XaO2VBiRH76hPIbA5QtspnIk1CtBz+Eqd8eI7UkmxGgwXqGXl2D2KylBKu1+
	 CAanTqeZMfr1A==
Date: Sat, 10 Aug 2024 03:22:21 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Vinod Koul <vkoul@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>
In-Reply-To: <IA1PR20MB4953DBA230FF57B2F78F7283BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB49530ABC137B465548817077BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953DBA230FF57B2F78F7283BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-Id: <172328174147.2924175.10204174788649625539.robh@kernel.org>
Subject: Re: [PATCH v10 1/3] dt-bindings: dmaengine: Add dma multiplexer
 for CV18XX/SG200X series SoC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240810_022226_864785_BAABBB32 
X-CRM114-Status: GOOD (  11.68  )
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


On Sat, 10 Aug 2024 16:38:53 +0800, Inochi Amaoto wrote:
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
> ---
>  .../bindings/dma/sophgo,cv1800b-dmamux.yaml   | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/dma/sophgo,cv1800-dmamux.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/dma/sophgo,cv1800b-dmamux.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/IA1PR20MB4953DBA230FF57B2F78F7283BBBB2@IA1PR20MB4953.namprd20.prod.outlook.com

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
