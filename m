Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D26C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 19:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=v3YYZR9nJ0VnoLTSFr4D2F/2VhSUXGOKkTcxWjb6RPY=; b=JtM02fylzIy/ah1nyGiS83Sp6Q
	VFzXtxgGTimF4fTpzXDqK1zbbisd9HkcdTEN7L/w3efeYBFl9AKXlin+B89Zm2ULXuP55b+5zs1wI
	iiREd3ZL0m5IlXK1QuV2FTHk3/rov8ZH/W+RdbbQQen8HiLbjjqX5sv4BtOUkBxPUe5sROsADDtNz
	Dm8cxoIkBsayYwGhv7Zs2V/L4K4IIdFUjpxyw6GPEh3e6Jy9dG8z+DXhMBJIDtwrqx/mF80bFsqKz
	dEoFO6gz1ZA+r13Q63TiRPNecBAcBlojRciNmKo5L0f+c50QTXe3NwJo/lIPIEacMLBL2bpbWIToL
	h6o1ovUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGl6v-00000006Jez-0SSX;
	Mon, 10 Jun 2024 19:55:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGl6r-00000006JdU-0LlL
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 19:55:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A31F060C0B;
	Mon, 10 Jun 2024 19:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3D9C2BBFC;
	Mon, 10 Jun 2024 19:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718049315;
	bh=LgwfT+NlcekJn/xBU7CuSKhAj48i5B9TsbBtDkPsoEQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=ZrWNiMoEFb5XzmI0cWBqy9iCFfaZVMo+YT9ESg/t2QqSBX+TAPQYzOPoj3hI0E0iQ
	 rVav7WXcnUMQ5tqHzqQbgn5b8lDUYXbsOy/GzvOshUJYwT4bLqqLlEUPs/geIIQhvX
	 0Mg8XUxRQ2osyy2uOJgXsC2fhJgA5s+bCyoPZNkkKH/Sn12QZqjnRj6GvKABH4HNJy
	 ++vCs08JvYvlon+/T9CpWXjRyIKGEMvTKm/UFxOOB7nM4IqM2vcnkNa2ElMQKEk6a0
	 2o4wagmY2vOz42w9NwpT0shKgvGfesJ05KFYw56obpi+D/lwPtXKBO2ynj21mZBaZ+
	 H45ntW9qJuJtQ==
Date: Mon, 10 Jun 2024 13:55:14 -0600
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org, 
 conor@kernel.org, linux-riscv@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240610-vertical-frugally-a92a55427dd9@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy>
Message-Id: <171804879964.2984749.10332965123533794635.robh@kernel.org>
Subject: Re: [PATCH v1 0/5] PolarFire SoC Icicle Reference Design PCIe
 ?support?/fixes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_125517_250354_0632C293 
X-CRM114-Status: GOOD (  21.55  )
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


On Mon, 10 Jun 2024 12:09:12 +0100, Conor Dooley wrote:
> Hey all,
> 
> Here's some patches that add an Erratum to enable non-coherent DMA
> support for PolarFire SoC. By nature of being an FPGA, and due to the
> PCIe root ports being only 32-bit capable, many bitstreams configure the
> FPGA fabric such that peripherals in the fabric become non-coherent. The
> PCIe root ports on PolarFire SoC are connected to the core-complex via
> the fabric, and therefore can be (and regularly are) made DMA
> non-coherent. The Icicle Kit Reference Design has been configuring the
> PCIe root port in this manner since late 2022 and in a way unsupported
> by mainline since earlier that year. Adding this non-coherent DMA
> support makes PCIe functional on those FPGA designs. Daire did almost all
> the work to figure out how to support these kinds of designs, and this
> series depends on his patches to introduce the required dma-ranges
> handling for the root port driver:
> https://lore.kernel.org/linux-pci/20240531085333.2501399-1-daire.mcnamara@microchip.com/
> 
> The final patch depends on:
> https://lore.kernel.org/linux-pci/20240527-slather-backfire-db4605ae7cd7@wendy/
> 
> I'm not sure if an Erratum is really the right way to go about doing
> this, but I didn't want to make ARCH_MICROCHIP depend on NONPORTABLE.
> An alternative would be to add a menu under drivers/soc like Renesas
> does and allow it to be toggled as an option there instead.
> 
> Thanks,
> Conor.
> 
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Samuel Holland <samuel.holland@sifive.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> 
> Conor Dooley (5):
>   cache: ccache: allow building for PolarFire
>   cache: ccache: add mpfs to nonstandard cache ops list
>   RISC-V: Add an MPFS erratum for PCIe
>   riscv: dts: microchip: modify memory map & add dma-ranges for pcie on
>     icicle
>   riscv: dts: microchip: update pcie reg properties
> 
>  arch/riscv/Kconfig.errata                     | 19 +++++
>  .../dts/microchip/mpfs-icicle-kit-fabric.dtsi | 77 ++++++++++++-------
>  .../boot/dts/microchip/mpfs-icicle-kit.dts    | 44 +++++++++--
>  .../dts/microchip/mpfs-m100pfs-fabric.dtsi    |  6 +-
>  .../dts/microchip/mpfs-polarberry-fabric.dtsi |  6 +-
>  drivers/cache/Kconfig                         |  2 +-
>  drivers/cache/sifive_ccache.c                 |  2 +
>  7 files changed, 116 insertions(+), 40 deletions(-)
> 
> --
> 2.43.2
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y microchip/mpfs-icicle-kit.dtb' for 20240610-vertical-frugally-a92a55427dd9@wendy:

arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg: [[48, 0, 0, 134217728], [0, 1124106240, 0, 8192], [0, 1124114432, 0, 8192]] is too long
	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg-names:1: 'apb' was expected
	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: reg-names: ['cfg', 'bridge', 'ctrl'] is too long
	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#
arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dtb: pcie@3000000000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'dma-noncoherent', 'interrupt-controller', 'interrupt-map', 'interrupt-map-mask', 'interrupt-parent', 'interrupts', 'msi-parent', 'reg', 'reg-names' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/microchip,pcie-host.yaml#






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
