Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2527C3DA42
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Jul 2024 23:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Uy/j8bQ5W7jnUoy2KQ4ZSUc7YdLpJlx1dOfqnLrSim0=; b=LtOZgFYUacCKmAPf7+toxAuQAF
	E/cJJhQzPaMlvZPeTaGtrENNoSbW3IkZgrgIJ1R270QifxBI3fzZe0z6K+RSfgHc02c4KDbUVunyI
	uiqd5LaUKEsIAWCmtno0UOF2ckXdpKFp8XQVQcBTxNHoC/8Qb5NGxH3/K6ekjnRWf9002FN66dNV5
	MTxQaIwkcYZYYC4cPibgp67Uhf+Zjd8r9Ad5DUoE/CiA7v1MJ6QEc1HZMV5wTkOryp/ASUBe8hsmM
	0c7dmSDy6XfmL6a0d/6b4l9ye9tt+o2mbVP100HokLVxAUXsD0i61DyUfw5y+Jb8HAB0+YWQBqJ5Q
	H1GHkZCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSmJP-00000003P2J-0bll;
	Sat, 13 Jul 2024 23:37:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSmJ5-00000003Oxw-2MVO;
	Sat, 13 Jul 2024 23:37:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F3791CE0ABA;
	Sat, 13 Jul 2024 23:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101D6C32781;
	Sat, 13 Jul 2024 23:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720913851;
	bh=1MKxAWYwekOaP2fx1r0IX5frF/qFcCGEptjnVO3Gg9s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=CZVK73jCSuzWb30m9mu0yZbd8+rqCqBXF8zwLg36U2uuXLUckq2rh0Fg19VyhdmdM
	 qGm264HTLM9JjcMrD8M8ZCKVeJFFycPtBnPsQPNoWxdy4SnOxnnOL2fc3hZQhjJFMY
	 +T8LqZSu9bF5YfNoPEbPmINfW3Ntdo6t09gCmEfCDExxpxxLHKbBiBcpl2hQvA0G/e
	 1ynZicnLJWjk5Ye8gV+nd/Up/nWY7878TrArmmSr8dtTVJSLayq21TqPt20TL1MzrC
	 6jPR5JCTjmzE1xhT85vaezu3AcWRch2pvgX6Y6fq8au+mKKziET+bR6MgINxxsZVhK
	 LpqxOqCBrULTg==
Date: Sat, 13 Jul 2024 17:37:29 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Drew Fustini <drew@pdp7.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org, 
 Eric Dumazet <edumazet@google.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Paolo Abeni <pabeni@redhat.com>, Jose Abreu <joabreu@synopsys.com>, 
 Fu Wei <wefu@redhat.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, 
 Jakub Kicinski <kuba@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Guo Ren <guoren@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240713-thead-dwmac-v1-2-81f04480cd31@tenstorrent.com>
References: <20240713-thead-dwmac-v1-0-81f04480cd31@tenstorrent.com>
 <20240713-thead-dwmac-v1-2-81f04480cd31@tenstorrent.com>
Message-Id: <172091384997.169230.1017177117936828717.robh@kernel.org>
Subject: Re: [PATCH RFC net-next 2/4] dt-bindings: net: add T-HEAD dwmac
 support
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_163735_980913_360CC32C 
X-CRM114-Status: GOOD (  11.01  )
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


On Sat, 13 Jul 2024 15:35:11 -0700, Drew Fustini wrote:
> From: Jisheng Zhang <jszhang@kernel.org>
> 
> Add documentation to describe T-HEAD dwmac.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Link: https://lore.kernel.org/r/20230827091710.1483-3-jszhang@kernel.org
> Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
> [drew: change apb registers from syscon to second reg of gmac node]
> Signed-off-by: Drew Fustini <drew@pdp7.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml        |  1 +
>  .../devicetree/bindings/net/thead,dwmac.yaml       | 81 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  3 files changed, 83 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.yaml: properties:reg: {'minItems': 2, 'maxItems': 2, 'items': [{'description': 'DesignWare GMAC IP core registers'}, {'description': 'GMAC APB registers'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.yaml: properties:reg: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'DesignWare GMAC IP core registers'}, {'description': 'GMAC APB registers'}] is too long
	[{'description': 'DesignWare GMAC IP core registers'}, {'description': 'GMAC APB registers'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.yaml: properties:reg-names: {'minItems': 2, 'maxItems': 2, 'items': [{'const': 'dwmac'}, {'const': 'apb'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.yaml: properties:reg-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'dwmac'}, {'const': 'apb'}] is too long
	[{'const': 'dwmac'}, {'const': 'apb'}] is too short
	False schema does not allow 2
	1 was expected
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: snps,pbl: [32] is not of type 'integer'
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: snps,pbl: [32] is not of type 'integer'
	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/thead,dwmac.example.dtb: ethernet@e7070000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,fixed-burst', 'snps,pbl' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240713-thead-dwmac-v1-2-81f04480cd31@tenstorrent.com

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
