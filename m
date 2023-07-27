Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C434C001DC
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 15:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yZ0SAlVV6rEs7+9MGOxGxWIxDFsgopq32DJAbkEHBg=; b=tmHDjKXzLQsRw/
	HmXVnyR1oRod7jVm4uRe9ZF5tSIXqZjxd9cguPGhLsOs/vvPUynsjSjAmaoeEnajAGbITtuMruABR
	qhuz6C01CR38JJH52SriwshDaNWt7x1RJ84ig7QzCA4Yj2LSk1lQ+GfA0QnI6+q1TQVY+ZAx5LnY+
	1drFhf5v+0e6wJJ+p2inzoCEUTX5Gf0H/9PoRUoqumxUgWQRCrPXx0r4M3+ANycOnXFLng5Q78r8g
	6iLXpxtQkSnq/v7jiN1+bt1KSbFNwF0oQt8owx5jt4PqpmH0Rh6lOO7B9OKj6VWu2X1mHmjxTjg3K
	OTbh0ttzyXIzteamOkng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2uM-00Fssj-1j;
	Thu, 27 Jul 2023 15:28:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP2uJ-00FsqI-1l
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 15:28:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0F0DD61CB7;
	Thu, 27 Jul 2023 15:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C962C433C7;
	Thu, 27 Jul 2023 15:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690471682;
	bh=izxQ/NRJBO6j/aIHrUmKUiuLXeceL8X6rh8Ywm6hmA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kajoPCjYdOfvWbO4QlS1jjP1vh8MWPPIbAb8s6W4Sofyw9Vijl/6q4Bkr4Up981RV
	 aCAcjDmrQelGAi+N/z0/ius6UAOKHOrz0joQ3OAKQwMlUxaQCT4qsxj8f88QUCXnlY
	 9DYAqfT/xMMbHkv3Q94PoacrpAav4MGF1TMw+EFmsgIpSt1EmRlxtLnCsHGKEHYCSi
	 UCjDPjQUgsvjhKP0JGMp3BdR+ATfRrfOfB17H8vbNSu14dgfr9mGrHWfC+R1Wf0i1r
	 uhMZh6ci5uTGbP9OcxzAQblMoPzvbea9h405UbzLNN/y6nTf+QE9GUjv/LkvUkIJkN
	 W+Tvztl2QsSKQ==
Date: Thu, 27 Jul 2023 17:27:57 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: daire.mcnamara@microchip.com, conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 7/8] PCI: microchip: Rename and refactor
 mc_pcie_enable_msi()
Message-ID: <ZMKM/f3q1o7N/bBv@lpieralisi>
References: <20230630154859.2049521-8-daire.mcnamara@microchip.com>
 <20230719174135.GA507746@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230719174135.GA507746@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_082803_629215_ABAF6006 
X-CRM114-Status: GOOD (  19.43  )
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

On Wed, Jul 19, 2023 at 12:41:35PM -0500, Bjorn Helgaas wrote:
> On Fri, Jun 30, 2023 at 04:48:58PM +0100, daire.mcnamara@microchip.com wrote:
> > From: Daire McNamara <daire.mcnamara@microchip.com>
> > 
> > After improving driver to get MSI-related information from
> > configuration registers (set at power on from the Libero FPGA
> > design), its now clear that mc_pcie_enable_msi() is not a good
> 
> it's (contraction of "it is")
> 
> > name for this function.  The function is better named as
> > mc_pcie_fixup_ecam() as its purpose is to correct the queue
> > size of the MSI CAP CTRL.
> 
> > -static void mc_pcie_enable_msi(struct mc_pcie *port, void __iomem *base)
> > +static void mc_pcie_fixup_ecam(struct mc_pcie *port, void __iomem *ecam)
> 
> Since the purpose of this seems to be to fix stuff in the MSI cap,
> removing "msi" from the name seems weird.  The fact that it uses ECAM
> to access the registers is incidental.
> 
> > -	msg_ctrl &= ~PCI_MSI_FLAGS_QSIZE;
> > -	msg_ctrl |= queue_size << 4;
> > -	writew_relaxed(msg_ctrl, base + cap_offset + PCI_MSI_FLAGS);
> > +	reg &= ~PCI_MSI_FLAGS_QSIZE;
> > +	reg |= queue_size << 4;
> 
> Could maybe use FIELD_PREP() instead of the shift?  I guess this would
> go in the "Gather MSI information" patch.

Daire,

can you follow up on these review comments please ?

Thanks,
Lorenzo

> 
> Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
