Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D9EC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiidBY6juCu76wNhnQt4IgIgMZgaFjBZjnfQenhfEbo=; b=a9/4GV/a3k7qCD
	r3N3hRcJtS/A74ISOuMMswfKwlCZnHkwFC8gthsL3YVJV+cx5XELubwAJxDa8czB3ajYO4PKK/ukx
	kqnZnU8igYGRWBmcwYK48nY3eDIJcH9u8WN/gDukivqL7HINCzDuweha6UiPbmbfZH3JiNuRB4RPq
	UhgTMna9XApeXOT0Ax4PT/elTnvB36A7e3hULm/KdXtQLJ9RnojCtNN7nJC8oN9bhjWmIBIyotUUQ
	VRncWOdIY0JvY2Xs0udKY4W9W59jhKwf8djZHiC6XgFyY8lN8ti8AhSH7bcNHcZZdsiCikPGRnB5S
	XCu5ZQcUvzR456UyDyfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUptk-0000000H8Fv-2kjz;
	Tue, 30 Jan 2024 15:19:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUpti-0000000H8Eu-1r0s
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 15:19:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3377160BC4;
	Tue, 30 Jan 2024 15:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDB1DC43394;
	Tue, 30 Jan 2024 15:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706627977;
	bh=jPo6hyN6XhHYnljaQLnlP7oqLr70pQ2Jj+eWhTrA6zQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FeZ3AuoP0++uHYH1IylQRWG0HSkcfz9zMErCpgNZlOw4JrqPoo5ukCXKC6EVkt9sD
	 mTOsAqV1Qw1O3SMuQ9XrhG3wcxZ/iveBhDP5yPxjpF/81swPJNmreEdf0PCs5aUXmI
	 YsidSpMeGXcke4YqPG48aZUMBeNkMSzhpv75A+YEEJT5poAAadKksYTXYYs2f6RvPN
	 /E8enk2yfdRMzYyJST+ZF/pyXLbk7aLitBchMgJBv6TvUJPQG8mBEmwAFJd/6GCrDC
	 F9qSBo2zFv+4Vn6PC1v7I90dpHyVlrXvG+IC4WVGstJ2AT18dFe2QNBy2AVV4BRcLQ
	 a5Dg4ETfrzHJQ==
Date: Tue, 30 Jan 2024 09:19:34 -0600
From: Rob Herring <robh@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Kevin Xie <kevin.xie@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-pci@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	Mason Huo <mason.huo@starfivetech.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v14,RESEND 19/22] dt-bindings: PCI: Add StarFive JH7110
 PCIe controller
Message-ID: <20240130151934.GA1636501-robh@kernel.org>
References: <20240129010142.3732-1-minda.chen@starfivetech.com>
 <20240129010142.3732-4-minda.chen@starfivetech.com>
 <170656679886.3057.12378312489853176077.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <170656679886.3057.12378312489853176077.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_071938_588390_C89E32E1 
X-CRM114-Status: GOOD (  10.72  )
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

On Mon, Jan 29, 2024 at 04:21:12PM -0600, Rob Herring wrote:
> 
> On Mon, 29 Jan 2024 09:01:39 +0800, Minda Chen wrote:
> > Add StarFive JH7110 SoC PCIe controller dt-bindings. JH7110 using PLDA
> > XpressRICH PCIe host controller IP.
> > 
> > Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/pci/starfive,jh7110-pcie.yaml    | 120 ++++++++++++++++++
> >  1 file changed, 120 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
> > 
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml:
> Error in referenced schema matching $id: http://devicetree.org/schemas/pci/plda,xpressrich3-axi-common.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.example.dtb: pcie@940000000: False schema does not allow {'compatible': ['starfive,jh7110-pcie'], 'reg': [[9, 1073741824, 0, 268435456], [0, 721420288, 0, 16777216]], 'reg-names': ['cfg', 'apb'], '#address-cells': [[3]], '#size-cells': [[2]], '#interrupt-cells': [[1]], 'device_type': ['pci'], 'ranges': [[2181038080, 0, 805306368, 0, 805306368, 0, 134217728], [3271557120, 9, 0, 9, 0, 0, 1073741824]], 'starfive,stg-syscon': [[4294967295]], 'bus-range': [[0, 255]], 'interrupts': [[56]], 'interrupt-map-mask': [[0, 0, 0, 7]], 'interrupt-map': [[0, 0, 0, 1, 2, 1], [0, 0, 0, 2, 2, 2], [0, 0, 0, 3, 2, 3], [0, 0, 0, 4, 2, 4]], 'msi-controller': True, 'clocks': [[4294967295, 86], [4294967295, 10], [4294967295, 8], [4294967295, 9]], 'clock-names': ['noc', 'tl', 'axi_mst0', 'apb'], 'resets': [[4294967295, 11], [4294967295, 12], [4294967295, 13], [4294967295, 14], [4294967295, 15], [4294967295, 16]], 'perst-gpios': [[4294967295, 26, 1]], 'phys': [[4294967295]], 'interrupt-controller': {'#address-cells': [[0]], '#interrupt-cells': [[1]], 'interrupt-controller': True, 'phandle': [[2]]}, '$nodename': ['pcie@940000000']}
> 	from schema $id: http://devicetree.org/schemas/pci/starfive,jh7110-pcie.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.example.dtb: pcie@940000000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-controller', 'interrupt-map', 'interrupt-map-mask', 'interrupts', 'msi-controller', 'ranges', 'reg', 'reg-names' were unexpected)
> 	from schema $id: http://devicetree.org/schemas/pci/starfive,jh7110-pcie.yaml#

These are probably due to only patches 16-22 showing up in lore.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
