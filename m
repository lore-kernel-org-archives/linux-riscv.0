Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC75C001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 17:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=GNaivuTEfnpWh+P//hTumjRw66ELXOBM0ArAdPjgfYU=; b=aqw3cgAV58eark
	VqJYYQ5FC/LyTB1M+fBLuf25GWozTAbjJeeOqHabqCyY9gXn8XXPMRJsjISIl6SB91x4BSmYxIAyM
	oYQ1spTx0WYrubKhZOhNnv7r9vwKWGffFYvocIyQoQJ2KB7rtOZxS4K7PIOpCE5de5iAb7bbJMSCd
	kPD+JtrdGd128mjhDDU7FA1WJ38QoNEIaZ9CuhGJlawq6rtWyxPT3h8SJephxjx8aPgtcoaq8Q/W6
	+8CBPVHBA9TdYnrgRRy/rR42/l20QYmOqpjMd3pF66W/XGy6a8Hn+ZFvPzaGfYuC2h/hg8Pn4Zntd
	j4lYbuyp3ybsP83IPpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMBBF-008NyK-0e;
	Wed, 19 Jul 2023 17:41:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMBBC-008NxJ-2V
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 17:41:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 48C5A617DA;
	Wed, 19 Jul 2023 17:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6399BC433C8;
	Wed, 19 Jul 2023 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689788497;
	bh=ngedI035SgHXmSnCO6TIlOqOLCKDSfYkvddTtkbFtJ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Gcegc2K6Alrm/VdE+aCFa5FCwFcdrmgS6Mj7FV7ZI1RgBKxyH+O/xWl0ji1/QLEyM
	 GU1CGi540Ge0dAdmviEgFz8dmevmGo0On1z+/fn1UJnvuJyLzTL0XsRofMusnV+o0w
	 cHZnQHNOBqRA8Ju/j+4ZucxLjY3Wh3LDs7+arw84dVnECTofDj18TO0jrXi5H/Asiv
	 yInRpYN5kokui/hBRbltB/EcT3nr5/MB+JGonceae1fVOFDjickIYjVXqeppB3adwR
	 8Uv8itg/CQzKgf5MYLPaZIbszl0hYM4OZVNGKPgu/jdk/m7jmfQkCHalAuFY1d39bx
	 uNKSj60mINR6A==
Date: Wed, 19 Jul 2023 12:41:35 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor@kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 7/8] PCI: microchip: Rename and refactor
 mc_pcie_enable_msi()
Message-ID: <20230719174135.GA507746@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230630154859.2049521-8-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_104138_857920_AC272A69 
X-CRM114-Status: GOOD (  14.31  )
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

On Fri, Jun 30, 2023 at 04:48:58PM +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> After improving driver to get MSI-related information from
> configuration registers (set at power on from the Libero FPGA
> design), its now clear that mc_pcie_enable_msi() is not a good

it's (contraction of "it is")

> name for this function.  The function is better named as
> mc_pcie_fixup_ecam() as its purpose is to correct the queue
> size of the MSI CAP CTRL.

> -static void mc_pcie_enable_msi(struct mc_pcie *port, void __iomem *base)
> +static void mc_pcie_fixup_ecam(struct mc_pcie *port, void __iomem *ecam)

Since the purpose of this seems to be to fix stuff in the MSI cap,
removing "msi" from the name seems weird.  The fact that it uses ECAM
to access the registers is incidental.

> -	msg_ctrl &= ~PCI_MSI_FLAGS_QSIZE;
> -	msg_ctrl |= queue_size << 4;
> -	writew_relaxed(msg_ctrl, base + cap_offset + PCI_MSI_FLAGS);
> +	reg &= ~PCI_MSI_FLAGS_QSIZE;
> +	reg |= queue_size << 4;

Could maybe use FIELD_PREP() instead of the shift?  I guess this would
go in the "Gather MSI information" patch.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
