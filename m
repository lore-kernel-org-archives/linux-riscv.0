Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1B0E77188
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 00:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hZHJ7qeqmfqG5uQKc/LC4GqRcXgdetzJXdfJJxvOvEQ=; b=KPRxtcmsOgQzxc
	JZ4E9wit+FklghnmNJ05Af+i8Dymc3czJncBeyaAuPH8z4wtxRFYqcuqMhfFwHUMvsJt/wXgonqIP
	TlQqJZ7/TOIr19fVUQMVqwN5SQ9fItIYU9bqfevK4qkBqowIj5lCAIk7IUXdrjbl9jEnTv0WZ1595
	O6MbzFaHW8TxOKkcICJPCHxxlUn6SCgIwpSA+92eRAUiwNsJeTCa9aDmxY0gsyQ6HOjTs9ip6pegX
	hUBjfwjTtL3EsS6qaoY2yTYaPcCjO4YZXKc0yafwvWiLXt9N7QIug7Sbhis1HL9yFQSpGredL7NVz
	kqUJU/3k9rb9I0t5aA2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrKk-0000000ACzA-2Zeo;
	Wed, 15 Jan 2025 00:32:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqCK-0000000A5Fn-15DH
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 23:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=gGXDcZ1Hud/GL2ZHjmtyDBpDthzvgRK7rVEcYTDA/cw=; b=WnM8f5k4NU/myo6YChrywLjM0m
	iLuWwKYpSSPyNSsEZweYTTVaCeLV8Blda7loU3n90DyBKXyPQobmHqGb4WeRnz51bpF5pgRNVJ3fp
	6AfgEJrJNAxK9nEJQc2SUnTWyZyUCoyhXpXxEwPFmLeGWCzBvhOnmBkjLwj9EX8bNkoveyVh+GhRb
	odAVyQWfFf+KdZpG/JyrmJa77Pz0yKWFJG3CnkwYXDbY37n5iOCBzUA/iHKYHAvVlHdZ5zckCQtII
	JWecf6QFDL3KaLJKY8UzMbq7AFYO4htTKT3yIooGqi1/qj5wqq0L16XoifXi+3Wr1NjGkKrr8Oa4e
	vRM+iakw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqCG-0000000AgV0-10IJ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 23:19:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CC713A41E0A;
	Tue, 14 Jan 2025 23:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EBDC4CEDD;
	Tue, 14 Jan 2025 23:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736896780;
	bh=L6B6WDszISMt6Ham4nV/TMXvAl8fXJGFrEuTt4xWNE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SZajQZdjOwBfNi9tg2ujzMMljXGL40t9RiHvJVDGaWNYPa8w6nLKeO3RTQIaF5Y3c
	 5GgkzXTxe/fwKz+0MINkN6Rx2fDI9waCP1p4rKbJzrRVaf5tBkOOIWPNx2O2y30eiW
	 aHBnafdqCP+XcAkyw5N697QUaVxvox7UjcTATXmos8mOpWBRfKZR8PIfDUNzLwa5CZ
	 T8DJSJfDrZWzcXEUbkNgi8Z37teAOsyxON2ckbhZ1WfKKF0kvGtnWSkXiKfaQx+qAP
	 toHISZ3fERNW2HY+zz6xNG+/IKy0SzD23WCNF59Bv9dyX09m0iGLw4F5Tpy/QWmwQ7
	 8++o9Z2NqLM0Q==
Date: Tue, 14 Jan 2025 17:19:39 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: daire.mcnamara@microchip.com, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, conor.dooley@microchip.com,
	lpieralisi@kernel.org, kw@linux.com, robh@kernel.org,
	bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com,
	kevin.xie@starfivetech.com
Subject: Re: [PATCH v10 0/3] Fix address translations on MPFS PCIe controller
Message-ID: <20250114231939.GA496825@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250114-espresso-display-846f670d2088@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_231945_203930_896F8787 
X-CRM114-Status: GOOD (  31.07  )
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

On Tue, Jan 14, 2025 at 05:16:10PM +0000, Conor Dooley wrote:
> Hey folks,
> 
> Has this patchset fallen through the cracks?

Yes, unfortunately.  I applied it to pci/controller/microchip for
v6.14.

I had to adapt it slightly to account for the changes of ac7f53b7e728
("PCI: microchip: Add support for using either Root Port 1 or 2"), so
please take a look and make sure I did it right.

> On Wed, Nov 13, 2024 at 11:50:44AM +0000, Conor Dooley wrote:
> > On Fri, Oct 11, 2024 at 03:00:40PM +0100, daire.mcnamara@microchip.com wrote:
> > > From: Daire McNamara <daire.mcnamara@microchip.com>
> > > 
> > > Hi all,
> > > 
> > > On Microchip PolarFire SoC (MPFS), the PCIe controller is connected to the
> > > CPU via one of three Fabric Interface Connectors (FICs).  Each FIC present
> > > to the CPU complex as 64-bit AXI-M and 64-bit AXI-S.  To preserve
> > > compatibility with other PolarFire family members, the PCIe controller is
> > > connected to its encapsulating FIC via a 32-bit AXI-M and 32-bit AXI-S
> > > interface.
> > > 
> > > Each FIC is implemented in FPGA logic and can incorporate logic along its 64-bit
> > > AXI-M to 32-bit AXI-M chain (including address translation) and, likewise, along
> > > its 32-bit AXI-S to 64-bit AXI-S chain (again including address translation).
> > > 
> > > In order to reduce the potential support space for the PCIe controller in
> > > this environment, MPFS supports certain reference designs for these address
> > > translations: reference designs for cache-coherent memory accesses
> > > and reference designs for non-cache-coherent memory accesses. The precise
> > > details of these reference designs and associated customer guidelines
> > > recommending that customers adhere to the addressing schemes used in those
> > > reference designs are available from Microchip, but the implication for the
> > > PCIe controller address translation between CPU-space and PCIe-space are:
> > > 
> > > For outbound address translation, the PCIe controller address translation tables
> > > are treated as if they are 32-bit only.  Any further address translation must
> > > be done in FPGA fabric.
> > > 
> > > For inbound address translation, the PCIe controller is configurable for two
> > > cases:
> > > * In the case of cache-coherent designs, the base of the AXI-S side of the
> > >   address translation must be set to 0 and the size should be 4 GiB wide. The
> > >   FPGA fabric must complete any address translations based on that 0-based
> > >   address translation.
> > > * In the case of non-cache coherent designs, the base of AXI-S side of the
> > >   address translation must be set to 0x8000'0000 and the size shall be 2 GiB
> > >   wide.  The FPGA fabric must complete any address translation based on that
> > >   0x80000000 base.
> > > 
> > > So, for example, in the non-cache-coherent case, with a device tree property
> > > that maps an inbound range from 0x10'0000'0000 in PCIe space to 0x10'0000'0000
> > > in CPU space, the PCIe rootport will translate a PCIe address of 0x10'0000'0000
> > > to an intermediate 32-bit AXI-S address of 0x8000'0000 and the FIC is
> > > responsible for translating that intermediate 32-bit AXI-S address of
> > > 0x8000'0000 to a 64-bit AXI-S address of 0x10'0000'0000.
> > > 
> > > And similarly, for example, in the cache-coherent case, with a device tree
> > > property that maps an inbound range from 0x10'0000'0000 in PCIe space to
> > > 0x10'0000'0000 in CPU space, the PCIe rootport will translate a PCIe address
> > > of 0x10'0000'0000 to an intermediate 32-bit AXI-S address of 0x0000'0000 and
> > > the FIC is responsible for translating that intermediate 32-bit AXI-S address
> > > of 0x0000'0000 to a 64-bit AXI-S address of 0x10'0000'0000.
> > > 
> > > See https://lore.kernel.org/all/20220902142202.2437658-1-daire.mcnamara@microchip.com/T/
> > > for backstory.
> > > 
> > > Changes since v9:
> > > - Dropped plda_setup_inbound_address_translation() from StarFive driver
> > 
> > Since I had some success bumping the other series for this driver, any
> > chance of some attention here?
> > AFAIK, Daire's addressed what's been pointed out by reviewers and
> > exempted the StarFive driver from overwriting the firmware-set values
> > with once calculated from DT as they requested.
> 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
