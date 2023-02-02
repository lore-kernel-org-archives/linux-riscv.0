Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067E7C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Feb 2023 11:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xaz0mAh1T+eMQp0R9e+uYyf69AGNavOOfmyoz8nIIAc=; b=xJG9wX0ECOvzr4
	6XjV2jYznaKxWGz4K7A1gocToxOiH6pAWc6KRPK3eu4X1giKkCbVo2vaw1b0kQWsdTEEljJeyJ05K
	Q94B2HsGWmMOdz0h3B8i9ke2+IADUAkO6+oQoMIkg/kuSbdfkx1jKM/g2VVj+ylQk315qmwaWqwOj
	n3eCrljPCMQ1SS5xfMf0s4F1xkGYIVX30rm0IbtyxbJC+1KLHy2MH0/U5EyvT1HNlqb3XXyxcOQFo
	bmN71gNOpDwKdAsVBZ2M+mcEp7vl1apC/uweSUVncIY5I+oMGy1SJOoqQdb/KGzzU/EWkChEHocnn
	ygaKDiN0le2zLtiDVf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXM5-00FW9g-PM; Thu, 02 Feb 2023 11:02:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNXM3-00FW7H-Bm
	for linux-riscv@lists.infradead.org; Thu, 02 Feb 2023 11:02:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D52D261AB3;
	Thu,  2 Feb 2023 11:02:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B71C4339B;
	Thu,  2 Feb 2023 11:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675335728;
	bh=lzDIUBwozYSnkNAtq+CbXRRVFuVSaq6m9YLSNh7qQGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MoJmx3pzVPOfdioUSvGq2DqDBcmghnKSAm4WKHhY1lPV58gO+92ShLq4EzyxcbnNY
	 Jf+OdjwR1imNuLA/e9WQH249Z9jr/lbBxU1znZGtQ7eSS2Y9btxdFV+kAh4d4GlKeB
	 vj6o8j9R8WO8WzQDBH4aXVZDRAJQW0w6i3Y8/P7oSvOjGqTAJxZZ3wSg8cbT5e699A
	 3zHWZKizXZA6Xsry1mnf7nzqiIkCuYCJnhDV30We5RpfeF6IUZrHZaQ2GwzGoDQiyG
	 QOF09Mhp1+jMIBZPrar5kffHQbUpUD8XFIBbO5klhiBXIOX2LQOr+eyPSKGHqvk6nQ
	 kVPlLKoHGwbLA==
Date: Thu, 2 Feb 2023 12:02:02 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Daire.McNamara@microchip.com
Cc: linux-riscv@lists.infradead.org, kw@linux.com,
	Conor.Dooley@microchip.com, devicetree@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-pci@vger.kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, bhelgaas@google.com
Subject: Re: [PATCH v3 00/11] PCI: microchip: Partition address translations
Message-ID: <Y9uYKp24fHGkqI5Z@lpieralisi>
References: <20230111125323.1911373-1-daire.mcnamara@microchip.com>
 <d5a5ba3b01953c9db435f2371adee6e2b61d26dd.camel@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d5a5ba3b01953c9db435f2371adee6e2b61d26dd.camel@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_030211_505161_ED572CC3 
X-CRM114-Status: GOOD (  38.80  )
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

On Tue, Jan 31, 2023 at 05:03:00PM +0000, Daire.McNamara@microchip.com wrote:
> Hi all,
> 
> Just touching base here.  Can I take it that things are in-hand, and
> this patchset is moving into the kernel or is there something I need to
> do at my end?

I will have a look shortly, sorry for the delay.

Thanks,
Lorenzo

> best regards
> daire
> 
> On Wed, 2023-01-11 at 12:53 +0000, daire.mcnamara@microchip.com wrote:
> > From: Daire McNamara <daire.mcnamara@microchip.com>
> > 
> > Changes since v2:
> > - Replaced GENMASK(63,0) with GENMASK_ULL(63,0) to remove warning
> > - Added patch to avoid warning on cast of argument to
> > devm_add_action_or_reset()
> > - Added patch to enable building driver as a module
> > 
> > Changes since v1:
> > - Removed unused variables causing compile warnings
> > - Removed incorrect Signed-off-by: tags
> > - Capitalised msi and msi-x
> > - Capitalised FIC and respelled busses to buses
> > - Capitalised all comments
> > - Renamed fabric inter connect to Fabric Interface Controller as per
> > PolarFire SoC TRM
> > 
> > Microchip PolarFire SoC is a 64-bit device and has DDR starting at
> > 0x80000000 and 0x1000000000. Its PCIe rootport is connected to the
> > CPU
> > Coreplex via an FPGA fabric. The AXI connections between the Coreplex
> > and
> > the fabric are 64-bit and the AXI connections between the fabric and
> > the
> > rootport are 32-bit.  For the CPU CorePlex to act as an AXI-Master to
> > the
> > PCIe devices and for the PCIe devices to act as bus masters to DDR at
> > these
> > base addresses, the fabric can be customised to add/remove offsets
> > for bits
> > 38-32 in each direction. These offsets, if present, vary with each
> > customer's design.
> > 
> > To support this variety, the rootport driver must know how much
> > address
> > translation (both inbound and outbound) is performed by a particular
> > customer design and how much address translation must be provided by
> > the
> > rootport.
> > 
> > This patchset contains a parent/child dma-ranges scheme suggested by
> > Rob
> > Herring. It creates an FPGA PCIe parent bus which wraps the PCIe
> > rootport
> > and implements a parsing scheme where the root port identifies what
> > address
> > translations are performed by the FPGA fabric parent bus, and what
> > address translations must be done by the rootport itself.
> > 
> > See 
> > https://lore.kernel.org/linux-pci/20220902142202.2437658-1-daire.mcnamara@microchip.com/
> > for the relevant previous patch submission discussion.
> > 
> > It also re-partitions the probe() and init() functions as suggested
> > by
> > Bjorn Helgaas to make them more maintainable as the init() function
> > had
> > become too large.
> > 
> > It also contains some minor fixes and clean-ups that are pre-
> > requisites:
> > - to align register, offset, and mask names with the hardware
> > documentation
> >   and to have the register definitions appear in the same order as in
> > the
> >   hardware documentation;
> > - to harvest the MSI information from the hardware configuration
> > register
> >   as these depend on the FPGA fabric design and can vary with
> > different
> >   customer designs;
> > - to clean up interrupt initialisation to make it more maintainable;
> > - to fix SEC and DED interrupt handling.
> > 
> > I expect Conor will take the dts patch via the soc tree once the PCIe
> > parts
> > of the series are accepted.
> > 
> > Conor Dooley (1):
> >   riscv: dts: microchip: add parent ranges and dma-ranges for IKRD
> >     v2022.09
> > 
> > Daire McNamara (10):
> >   PCI: microchip: Correct the DED and SEC interrupt bit offsets
> >   PCI: microchip: Remove cast warning for devm_add_action_or_reset()
> > arg
> >   PCI: microchip: enable building this driver as a module
> >   PCI: microchip: Align register, offset, and mask names with hw docs
> >   PCI: microchip: Enable event handlers to access bridge and ctrl
> > ptrs
> >   PCI: microchip: Clean up initialisation of interrupts
> >   PCI: microchip: Gather MSI information from hardware config
> > registers
> >   PCI: microchip: Re-partition code between probe() and init()
> >   PCI: microchip: Partition outbound address translation
> >   PCI: microchip: Partition inbound address translation
> > 
> >  .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  62 +-
> >  drivers/pci/controller/Kconfig                |   2 +-
> >  drivers/pci/controller/pcie-microchip-host.c  | 688 +++++++++++++---
> > --
> >  3 files changed, 533 insertions(+), 219 deletions(-)
> > 
> > 
> > base-commit: 3c1f24109dfc4fb1a3730ed237e50183c6bb26b3

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
