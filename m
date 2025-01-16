Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DC4C02187
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jan 2025 15:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=otT6UoXSgb6sngtlXJG+ZQijIifOMzeGrrRVMPBNNaw=; b=z/YkOVQ/XH6w0E
	bb3WbKu+scOQBr6LVj85aOgqe8kd1chCvAfbAYO+Gyoa5Q2VDiTFJaH/MbQ+Z6WqwnpOnT0ariC3D
	ReTEXr0vBhPWM0iT9lyNCJEN8rBMdYdwiR5lNVUX58+Md73Qz2N04Hb56c8t7Ts2AcYwK5Wfhm5xH
	m+qjdamYvzFobeqJqPBB+YVAqJbTuOMM6zPo/UoAER0ljasRrC8nbI55OX7iLMGSeBtVqYkmnZkgW
	HZ/VyH8bkMZsfGnw3vyVeqwrOmhEPceCNAACEe/KcxvIhNQtocBWbMXAnrCewUkMFxdaxZ8dsnhb9
	fUdqNufT2wIF7XbVHMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYS1L-0000000FN6u-0Noy;
	Thu, 16 Jan 2025 15:42:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYS1H-0000000FN51-3qol
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jan 2025 15:42:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9E7C85C5D04;
	Thu, 16 Jan 2025 15:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C28C4CED6;
	Thu, 16 Jan 2025 15:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737042175;
	bh=nD0X0oy3la4gXRSkQ8W320ykisHeMxZjcoEa/f28P/Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZjayvIUaZR9UjvX27UNiGpuUWHbmuwwZJhz7zm5gsFBLM/l0XXzwxjZtqEM4tpITT
	 FABzM8rLFoBC1Db/z1uqsy0XFiqpCMHXVHeNo7dJX7qJoE1D81HBT+vIugSbBEB6nM
	 IB8mdmWsDuHwhQ3YW47fY3lAMNRWV3Gw3aMoKTjp5MuXg9pm4HEr7Fe546hIo98Byy
	 5oKfsb0XgoThFnFxDwHm3Aklod4Tkce0kpnNVFlml0YESnigMhzk+MC1fq4XFkeukP
	 HMiVKMMqGMRFYEU+RyAmzG4pg6NscdKgoWxzFBUttKtFX5Op1JBGHRb9TBbnBvbNi9
	 ENKpHKwowW4nQ==
Date: Thu, 16 Jan 2025 09:42:53 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: daire.mcnamara@microchip.com
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	conor.dooley@microchip.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, ilpo.jarvinen@linux.intel.com,
	kevin.xie@starfivetech.com
Subject: Re: [PATCH v10 1/3] PCI: microchip: Fix outbound address translation
 tables
Message-ID: <20250116154253.GA584488@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250115001309.GA508227@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_074255_999061_4BA75891 
X-CRM114-Status: GOOD (  19.54  )
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

On Tue, Jan 14, 2025 at 06:13:10PM -0600, Bjorn Helgaas wrote:
> On Fri, Oct 11, 2024 at 03:00:41PM +0100, daire.mcnamara@microchip.com wrote:
> > From: Daire McNamara <daire.mcnamara@microchip.com>
> > 
> > On Microchip PolarFire SoC (MPFS) the PCIe Root Port can be behind one of
> > three general-purpose Fabric Interface Controller (FIC) buses that
> > encapsulate an AXI-M interface. That FIC is responsible for managing
> > the translations of the upper 32-bits of the AXI-M address. On MPFS,
> > the Root Port driver needs to take account of that outbound address
> > translation done by the parent FIC bus before setting up its own
> > outbound address translation tables.  In all cases on MPFS,
> > the remaining outbound address translation tables are 32-bit only.
> > 
> > Limit the outbound address translation tables to 32-bit only.
> 
> I don't quite understand what this is saying.  It seems like the code
> keeps only the low 32 bits of a PCI address and throws away any
> address bits above the low 32.
> 
> If that's what the FIC does, I wouldn't describe the FIC as
> "translating the upper 32 bits" since it sounds like the translation
> is just truncation.
> 
> I guess it must be more complicated than that?  I assume you can still
> reach BARs that have PCI addresses above 4GB using CPU loads/stores?
> 
> The apertures through the host bridge for MMIO access are described by
> DT ranges properties, so this must be something that can't be
> described that way?

Ping?  I'd really like to understand this before the v6.14 merge
window opens on Sunday.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
