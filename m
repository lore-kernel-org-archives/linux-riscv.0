Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99573E91289
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 07:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=v/Ru84NtnQLfRyrJcZP/s67ALVUOJPwFrGpGCBXhOBU=; b=I0rHb4WofTQdluVkNcQb6tQC4Q
	VkVwZQm/gqCn2Omgip7dOI3vScK4Yx5ILRZQeYTh2CS41pSAbZWtJJxZNWkMD9x2DTAgyZJLjsYMo
	u+Qu1FtnVSiE/FRJHMHqNkdXSl5YBpkm/QIecpUpOCMe2pvIJcENh5BHLjSI7arS3JA2g8/msmjMC
	CQ2hA6qLAYJv24EzynrVDPR4yR1aJ48ZgxGASIRCfAcBsySE8SUydDy7AU9YEPuwiD7wyq65bCYUv
	I4XUtE5rRbBvn/iAPqPX4F1GknilQCAyB+LHpNbPv9G2yz49hETeeUTpZEAiCk5CfnXm73H5CFYI8
	gM4yYBgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vntjz-00000009Y7s-2sVn;
	Thu, 05 Feb 2026 07:25:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vntjq-00000009Y68-0Tv0;
	Thu, 05 Feb 2026 07:25:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0592441FA;
	Thu,  5 Feb 2026 07:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B412BC4CEF7;
	Thu,  5 Feb 2026 07:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770276316;
	bh=XU5EtDFAlpiOcF192k6bjTw6Y4UVTAujOSvnW603CLI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=NEuiWOoAcszY0gDKY6U78AtLAaogMF1NFVu11Vf5EBI4RliU3MKTGFeVySCyjSNzS
	 XneKWztYDq5z558h9OUgy+cuUhjh/OfeE7Qq31VViJiHI5uPtR2W3VcGTzOcoT/6pG
	 PR/0CIsvFtjegS6Mix0kc8wMinJItVwqiPAq762/3oOSeQvK/OxbB2Rr2P8vb9Olcj
	 oDrtpLZWZv6biNwp2VP1PFCeVGCS+m3nxeHpMy5/y9iCOpQdkX5+Js7FuoE/ObOMEM
	 dyloVuNc7zsUsKJmWZzijTEl0tGgwJnTWZdr8gZDZXIA4tq2Qhfj9PIWR4CSwScNhc
	 /wxgE3dHiUcZw==
Date: Thu, 05 Feb 2026 01:25:15 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
 linux-aspeed@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
 Albert Ou <aou@eecs.berkeley.edu>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, 
 Joel Stanley <joel@jms.id.au>, Alexandre Ghiti <alex@ghiti.fr>, 
 Conor Dooley <conor+dt@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20260205-irqchip-v1-1-b0310e06c087@aspeedtech.com>
References: <20260205-irqchip-v1-0-b0310e06c087@aspeedtech.com>
 <20260205-irqchip-v1-1-b0310e06c087@aspeedtech.com>
Message-Id: <177027631587.4038923.11644467926032419641.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: interrupt-controller: aspeed: Add
 ASPEED AST2700 INTC0/INTC1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_232523_226057_D2E83282 
X-CRM114-Status: GOOD (  10.38  )
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


On Thu, 05 Feb 2026 14:07:19 +0800, Ryan Chen wrote:
> INTC0 is used to assert GIC if interrupt in INTC1 asserted.
> INTC1 is used to assert INTC0 if interrupt of modules asserted.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../aspeed,ast2700-interrupt.yaml                  | 207 +++++++++++++++++++++
>  1 file changed, 207 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-interrupt.example.dtb: /example-0/interrupt-controller@12100000: failed to match any schema with compatible: ['aspeed,ast2700-intc0-ic']
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-interrupt.example.dtb: /example-1/interrupt-controller@14c18000: failed to match any schema with compatible: ['aspeed,ast2700-intc1-ic']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260205-irqchip-v1-1-b0310e06c087@aspeedtech.com

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
