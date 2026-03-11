Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FC61125854
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 16:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kWKfn7MYFweExhHkpBUkZufSL9Ie91tECsEBJNNRHXQ=; b=XTFl62myYSGuE64lyJ1JGjIuXy
	nKQZ+Eup29emGYK9hc+oZY/E/Th07dyYQSCI7kDYQ8wCVlS8uGswUB7X8vudu4HjYFE7t1zybE9G0
	Sv6EcBPQUG+IuQPkAPKpo6C25pwIom6KktOGpYHI3acWVXkGyN10oYqvroDIbBiDW6/743F3xvY6I
	gKxlRnb0vvmXQLTt/Ykx4C5HlEhXCYpDzO2cAOF0F3ZWBfT0Jh0nY0wCE/hF+Qe3AbJauMqQK6vYz
	Rrg2eoTizUG6IAPwYXmz+N7uL5DSQ4kEwu405wC83z09Pq+Ngtjo090Vhhgh+1gQkI7ICl+q+05GM
	zxbsOCbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mcd-0000000BwCi-1yco;
	Wed, 11 Mar 2026 16:41:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0McZ-0000000BwCB-2qhh
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 16:41:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B5614429E;
	Wed, 11 Mar 2026 16:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DC7C19421;
	Wed, 11 Mar 2026 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773247278;
	bh=QGO6BKUP9pDJhAPyG3zMK+3Mt1ryUaCYnq9txTiAz88=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qBuZYhsBBsVfeLWUk4dPXkznjTVawAHeoidar7vOXWbXyplHqm3lcWsgiy6j58Bvu
	 61jRRYIhXc2szdqohF4n5VdavlWj5vlRYZ4qZ2+WSPS6T40DUQK+WSBTjJ1O1vxcpS
	 +bQZiMeY/vj292ZYAHdHtMnNLoc7Sj8IhOvQg1pHW4Q/OdbQLNCsnWbbcr0+P10Fx4
	 GlWbDclFRBvSSvVXTsPNbP+vL4360GtDV9HFVA4bQjqNo0ZzMU/PNqcIioz+CMKr7m
	 qUVyaSn7ECW1f+4ougu1NoWpOre0ww+fP4UrtkJkLvqYtAcphnuxk0Gds5gkFs3U8H
	 HOji2hwYaqmjw==
Date: Wed, 11 Mar 2026 11:41:17 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Daire McNamara <daire.mcnamara@microchip.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>
In-Reply-To: <20260311-collar-smokiness-5313aa648a6f@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
 <20260311-collar-smokiness-5313aa648a6f@spud>
Message-Id: <177324727784.4047403.339169143402607624.robh@kernel.org>
Subject: Re: [PATCH v12 2/4] dt-bindings: soc: microchip: document
 PolarFire SoC's gpio interrupt mux
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_094120_670428_B9D98FF2 
X-CRM114-Status: GOOD (  12.52  )
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


On Wed, 11 Mar 2026 15:17:39 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On PolarFire SoC there are more GPIO interrupts than there are interrupt
> lines available on the PLIC, and a runtime configurable mux is used to
> decide which interrupts are assigned direct connections to the PLIC &
> which are relegated to sharing a line.
> 
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../soc/microchip/microchip,mpfs-irqmux.yaml  | 77 +++++++++++++++++++
>  .../microchip,mpfs-mss-top-sysreg.yaml        |  4 +
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dts:18.33-24.11: Warning (interrupt_provider): /example-0/interrupt-controller@54: '#interrupt-cells' found, but node is not an interrupt provider
Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (microchip,mpfs-irqmux): interrupt-map-mask:0: 127 was expected
	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-irqmux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (microchip,mpfs-irqmux): 'interrupt-map' is a required property
	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-irqmux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (microchip,mpfs-irqmux): 'interrupt-map' is a dependency of 'interrupt-map-mask'
	from schema $id: http://devicetree.org/schemas/interrupt-controller.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (microchip,mpfs-irqmux): 'anyOf' conditional failed, one must be fixed:
	'interrupt-controller' is a required property
	'interrupt-map' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260311-collar-smokiness-5313aa648a6f@spud

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
