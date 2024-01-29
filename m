Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0981C47DA9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 22:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=NrJ06gpA+nz4mLjH8SmeH8dqyi8rFrYIaZOVZiKcn7A=; b=Utbbgsag3jLVTVLPPQr3cYImNM
	YEm8IU1Rny6oCoLmYKXB/JYkHaznd9xBqQiDH/JmA/dAgxL+bRKPyNFW0UoycbWMQt/pmKVocmjMO
	qDmvzm63EzJr1WZsa3lwXqcSiqulRW6jSKQ++RvpFtiICmleXBrwdcqB1kDlRA1DGIwTYgwublyaZ
	Qntv1x5GZuNk5jUQWmjXBE5w8MHlYWZLIFeWJj6hhxzLAvq7hhkYr7Jr8xl/Ae7RC7FAikU1lEMZF
	HiuSn6yAw/ZwUAk830CGhuBji6Lc7/KKHyOjj+nGw8ZYCY+TxCh5SL2W9TZF96nEU4GAOghJSXLuH
	/s7Lwm6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUa0E-0000000ESOP-3NXn;
	Mon, 29 Jan 2024 22:21:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUa0B-0000000ESNl-38xR
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 22:21:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6BEDC622ED;
	Mon, 29 Jan 2024 22:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D415BC433F1;
	Mon, 29 Jan 2024 22:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706566874;
	bh=HPUoP6eW0UIad8w+O0F0hkehgUlt/2XjPLLSrb9Sz/s=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ioTaToqJpsbXqfc8N3OnyUxt/4NvmFgDBQVEAi8DoZvPAZTa2Ce6GJ+iefQvXvLUu
	 qBAirrsMSlaD+b5bzden4b+b1EEyqXq0NIPswLcAUlRpKhQgmPNWKDte72r5Atn0Eu
	 PfDZcijwXm7mYODqBHNqizbuTrNVxwJQloOnm3naJXLHPOHsPOEVZVJeyuNNWmOY1B
	 ZjOBlDD3cj+/JDMdCvk4D4pfBvksMlvyGr1Fabpb68AZ2HLVnqMEecL1gdzlYUBRfS
	 HyXbk7AFwPnOT4R01w7kdLiD2bzmr/T2z6YaCObsRBqURBhJtx6EbL64TN2bfYW24s
	 5XuvOEPBBsLrg==
Date: Mon, 29 Jan 2024 16:21:12 -0600
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Kevin Xie <kevin.xie@starfivetech.com>, 
 Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 linux-pci@vger.kernel.org, Daire McNamara <daire.mcnamara@microchip.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Mason Huo <mason.huo@starfivetech.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
In-Reply-To: <20240129010142.3732-4-minda.chen@starfivetech.com>
References: <20240129010142.3732-1-minda.chen@starfivetech.com>
 <20240129010142.3732-4-minda.chen@starfivetech.com>
Message-Id: <170656679886.3057.12378312489853176077.robh@kernel.org>
Subject: Re: [PATCH v14,RESEND 19/22] dt-bindings: PCI: Add StarFive JH7110
 PCIe controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_142115_903275_4FF14A0D 
X-CRM114-Status: UNSURE (   9.85  )
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


On Mon, 29 Jan 2024 09:01:39 +0800, Minda Chen wrote:
> Add StarFive JH7110 SoC PCIe controller dt-bindings. JH7110 using PLDA
> XpressRICH PCIe host controller IP.
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/pci/starfive,jh7110-pcie.yaml    | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml:
Error in referenced schema matching $id: http://devicetree.org/schemas/pci/plda,xpressrich3-axi-common.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.example.dtb: pcie@940000000: False schema does not allow {'compatible': ['starfive,jh7110-pcie'], 'reg': [[9, 1073741824, 0, 268435456], [0, 721420288, 0, 16777216]], 'reg-names': ['cfg', 'apb'], '#address-cells': [[3]], '#size-cells': [[2]], '#interrupt-cells': [[1]], 'device_type': ['pci'], 'ranges': [[2181038080, 0, 805306368, 0, 805306368, 0, 134217728], [3271557120, 9, 0, 9, 0, 0, 1073741824]], 'starfive,stg-syscon': [[4294967295]], 'bus-range': [[0, 255]], 'interrupts': [[56]], 'interrupt-map-mask': [[0, 0, 0, 7]], 'interrupt-map': [[0, 0, 0, 1, 2, 1], [0, 0, 0, 2, 2, 2], [0, 0, 0, 3, 2, 3], [0, 0, 0, 4, 2, 4]], 'msi-controller': True, 'clocks': [[4294967295, 86], [4294967295, 10], [4294967295, 8], [4294967295, 9]], 'clock-names': ['noc', 'tl', 'axi_mst0', 'apb'], 'resets': [[4294967295, 11], [4294967295, 12], [4294967295, 13], [4294967295, 14], [4294967295, 15], [4294967295, 16]], 
 'perst-gpios': [[4294967295, 26, 1]], 'phys': [[4294967295]], 'interrupt-controller': {'#address-cells': [[0]], '#interrupt-cells': [[1]], 'interrupt-controller': True, 'phandle': [[2]]}, '$nodename': ['pcie@940000000']}
	from schema $id: http://devicetree.org/schemas/pci/starfive,jh7110-pcie.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.example.dtb: pcie@940000000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-controller', 'interrupt-map', 'interrupt-map-mask', 'interrupts', 'msi-controller', 'ranges', 'reg', 'reg-names' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/starfive,jh7110-pcie.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240129010142.3732-4-minda.chen@starfivetech.com

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
