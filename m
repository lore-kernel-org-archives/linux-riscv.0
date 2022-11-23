Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABF5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 23:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7oAm/N5LfsMZIb2Ag27zBKWsRVAwaPb3hzDRVSwNQk=; b=Jo5vFaukPv+UuO
	wOatjTEtKjuC0rSQnq0bx2oaUxXAN70B5uFzT+WGRgYIu8sLOsvXMZB+NdumX1FLhihaxAyZxjNxm
	5YHUtfO9JjVag1IC1qqFS0dkgOOktashtkR0bTZSTGdzpj+a/Otvfrs51uLm8JiSuUO0F/CSsuCgI
	v89W/P2kvUmGdWRhgLuVkmtVFlYxemYzZVWO9BJDllR50DW2VnTdEIOWO+Jq5NFH/Qib89WfY87j1
	jemuI1QWdDftNSJlui62x7gYaEB/MxWPp7BihTsql1mO0lv+6+n1HzCU/V0XcxdXP3hGdfsYHNvVD
	LjIte8psc0u3ydrdAnwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxyxh-002qXG-Pk; Wed, 23 Nov 2022 23:15:25 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxyxe-002qWd-IO
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 23:15:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 02ECEB82503;
	Wed, 23 Nov 2022 23:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A532C433C1;
	Wed, 23 Nov 2022 23:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669245319;
	bh=bWh0T0oFSkJB4PdiGGy2fzByge1TZxmhgUDK3+WVRwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hOsL4XS3Ls3qrj//pdUPbpdj+bs3yrDTUf2+YCvHJOcLO96rX1hwTJysQesJ4OxXO
	 1QN13hX76UR86edLyOE82ZXmQIOb6+ciFjaOFlb/HzTB6QcttSr7FiWjsu6OdlW0hI
	 ESLz2htJ4t/8vPubL5XR/fY7MCxlq0qOIk1M62UvPMcT9rnBqIz0BSRdGbJZ5u5M6N
	 IfSKX0Lj22j6681Hku9IO3xbNOf94rmi/G0aD0aOe3AtJ1xUeS4zPBqN05bZa9nOpu
	 7Mp3b1P4NYcUXM3CfdzyhKoaIva8vB4wB6yuQPMPbR6SLHag8QJ6uAeFvNSj3XFEqz
	 VzfK2GNkl40MQ==
Date: Wed, 23 Nov 2022 23:15:14 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 0/9] PCI: microchip: Partition address translations
Message-ID: <Y36pgsCplC5hN2ij@spud>
References: <20221116135504.258687-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116135504.258687-1-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_151522_947341_CC42748F 
X-CRM114-Status: GOOD (  30.60  )
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

Hey Daire,

On Wed, Nov 16, 2022 at 01:54:55PM +0000, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Microchip PolarFire SoC is a 64-bit device and has DDR starting at
> 0x80000000 and 0x1000000000. Its PCIe rootport is connected to the CPU
> Coreplex via an FPGA fabric. The AXI connections between the Coreplex and
> the fabric are 64-bit and the AXI connections between the fabric and the
> rootport are 32-bit.  For the CPU CorePlex to act as an AXI-Master to the
> PCIe devices and for the PCIe devices to act as bus masters to DDR at these
> base addresses, the fabric can be customised to add/remove offsets for bits
> 38-32 in each direction. These offsets, if present, vary with each
> customer's design.
> 
> To support this variety, the rootport driver must know how much address
> translation (both inbound and outbound) is performed by a particular
> customer design and how much address translation must be provided by the
> rootport.
> 
> This patchset contains a parent/child dma-ranges scheme suggested by Rob
> Herring. It creates an FPGA PCIe parent bus which wraps the PCIe rootport
> and implements a parsing scheme where the root port identifies what address
> translations are performed by the FPGA fabric parent bus, and what
> address translations must be done by the rootport itself.

I've tried this scheme with a bunch of different PCI configurations, and
it holds water, so I am happy with it :) Hopefully Rob is a lot happier
with this version of it too!

It's been long enough that I think you should be good to submit a
cleaned up version, provided Rob's happy on the DT side I think.

Thanks,
Conor.

> See https://lore.kernel.org/linux-pci/20220902142202.2437658-1-daire.mcnamara@microchip.com/
> for the relevant previous patch submission discussion.
> 
> It also re-partitions the probe() and init() functions as suggested by
> Bjorn Helgaas to make them more maintainable as the init() function had
> become too large.
> 
> It also contains some minor fixes and clean-ups that are pre-requisites:
> - to align register, offset, and mask names with the hardware documentation
>   and to have the register definitions appear in the same order as in the
>   hardware documentation;
> - to harvest the MSI information from the hardware configuration register
>   as these depend on the FPGA fabric design and can vary with different
>   customer designs;
> - to clean up interrupt initialisation to make it more maintainable;
> - to fix SEC and DED interrupt handling.
> 
> I expect Conor will take the dts patch via the soc tree once the PCIe parts
> of the series are accepted.
> 
> Conor Dooley (1):
>   riscv: dts: microchip: add parent ranges and dma-ranges for IKRD
>     v2022.09
> 
> Daire McNamara (8):
>   PCI: microchip: Align register, offset, and mask names with hw docs
>   PCI: microchip: Correct the DED and SEC interrupt bit offsets
>   PCI: microchip: Enable event handlers to access bridge and ctrl ptrs
>   PCI: microchip: Clean up initialisation of interrupts
>   PCI: microchip: Gather MSI information from hardware config registers
>   PCI: microchip: Re-partition code between probe() and init()
>   PCI: microchip: Partition outbound address translation
>   PCI: microchip: Partition inbound address translation
> 
>  .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  62 +-
>  drivers/pci/controller/pcie-microchip-host.c  | 676 +++++++++++++-----
>  2 files changed, 522 insertions(+), 216 deletions(-)
> 
> 
> base-commit: 3c1f24109dfc4fb1a3730ed237e50183c6bb26b3
> -- 
> 2.25.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
