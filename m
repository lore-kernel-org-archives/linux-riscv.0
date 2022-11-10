Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6345C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 21:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=r1vOvByp0IaLwyrhGtlSxVCYALGDqud/+TEoFbQeEro=; b=DA/WmJymUt/nES
	3KMSkoddqMCQhNP9iSiChQJNWHVUgkYH9Gx7iONmd0+FLdJdPjeqzb5cofxUYnYWvdR8NECOTYBbt
	x4EJfAnQNmj+c7hEOEZMPXS9BHsQtSFJ+R1A3lTkwJsfcp4phR7OQ/QOeqT7PWOv4MM2qUDjcwmca
	2ewhndKU1sKerI4moxmixKSdMbR+qEkRmA23nVGHhJ6kgL/RCS7Dgn+gxKuGLA42LcRUhtxG/2nGe
	tT7TgqSAnwSTy1SBupQnet5TafNPXkDWi5F6pBACSxbq5t4oNVFZAODYKpGTkcoWG6iCrgKoara0A
	gmfQxMDsmvv7mJpUz8HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otEhL-00ALTv-3K; Thu, 10 Nov 2022 21:02:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otEh5-00ALKq-G8; Thu, 10 Nov 2022 21:02:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14F1361E56;
	Thu, 10 Nov 2022 21:02:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AFFAC433C1;
	Thu, 10 Nov 2022 21:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668114157;
	bh=dFjwsB2x4Vktj11UP1nFbKy1JuZUspP3pjwcHIsSSnc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iJwMckJy0uCcByLR5dTqb/sLhh/p4neWekIYZaZ3yeonbwH09ch8EqoG8ecGOC/gh
	 LxSdAJBLbKmEE3CXGDI3A7Vc6BCxXLJ/bsFq5hQJgqS/nai15IhiKGetEeKH4+vpT2
	 j9Ld+7uAe0Uz9IipZQ/88pm8pLqURo9XzvxQWuunebeReJqpcbJfuCN8BWniAwIWF9
	 a+ZwQoYjb1mS5vRmT3xSXjeYdGWxfBo/pZQHhYRV38fM2nHaPFfGhzmt8f50haLCEQ
	 7sSMDQr3yt4Z74/HTNY4ceRxsq+32kGBXwaNszYjSX1Y2pvyiMxqjjRM7Gykh+Y6zM
	 XSZjD4/Y6CHGA==
Date: Thu, 10 Nov 2022 15:02:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Tom Joseph <tjoseph@cadence.com>, Rob Herring <robh@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Toan Le <toan@os.amperecomputing.com>,
	Joyce Ooi <joyce.ooi@intel.com>, Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	bcm-kernel-feedback-list@broadcom.com, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-tegra@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v3 0/5] PCI: Remove unnecessary <linux/of_irq.h> includes
Message-ID: <20221110210235.GA671572@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221031153954.1163623-1-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_130239_660703_2229284D 
X-CRM114-Status: GOOD (  16.73  )
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

On Mon, Oct 31, 2022 at 10:39:49AM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Many host controller drivers #include <linux/of_irq.h> even though they
> don't need it.  Remove the unnecessary #includes.
> 
> v2: https://lore.kernel.org/r/20221025185147.665365-1-helgaas@kernel.org/
> v1: https://lore.kernel.org/r/20221019195452.37606-1-helgaas@kernel.org/
> 
> Changes from v2 to v3:
>   - Include <linux/irqdomain.h> explicitly in xgene-msi, which doesn't need
>     <linux/of_irq.h> itself, but relied on it to include
>     <linux/irqdomain.h>.  On x86, this was covered up by the fact that
>     <linux/msi.h> includes <asm/msi.h>, which includes <asm/irqdomain.h>,
>     which includes <linux/irqdomain.h>.  But on parisc, <asm/msi.h> is
>     actually asm-generic/msi.h, which does *not* include
>     <linux/irqdomain.h>
>   - Pick up tags from Conor Dooley and Thomas Petazzoni
> 
> Changes from v1 to v2:
>   - Include <linux/irqdomain.h> explicitly in altera-msi and microchip,
>     which don't need <linux/of_irq.h> itself, but relied on it to include
>     <linux/irqdomain.h>
>   - Include <linux/irqdomain.h> explicitly in mvebu, which needs both it
>     and <linux/of_irq.h>
> 
> Bjorn Helgaas (5):
>   PCI: altera-msi: Include <linux/irqdomain.h> explicitly
>   PCI: microchip: Include <linux/irqdomain.h> explicitly
>   PCI: mvebu: Include <linux/irqdomain.h> explicitly
>   PCI: xgene-msi: Include <linux/irqdomain.h> explicitly
>   PCI: Remove unnecessary <linux/of_irq.h> includes
> 
>  drivers/pci/controller/cadence/pci-j721e.c   | 1 -
>  drivers/pci/controller/dwc/pci-layerscape.c  | 1 -
>  drivers/pci/controller/dwc/pcie-armada8k.c   | 1 -
>  drivers/pci/controller/dwc/pcie-tegra194.c   | 1 -
>  drivers/pci/controller/pci-mvebu.c           | 1 +
>  drivers/pci/controller/pci-v3-semi.c         | 1 -
>  drivers/pci/controller/pci-xgene-msi.c       | 2 +-
>  drivers/pci/controller/pci-xgene.c           | 1 -
>  drivers/pci/controller/pcie-altera-msi.c     | 2 +-
>  drivers/pci/controller/pcie-iproc-platform.c | 1 -
>  drivers/pci/controller/pcie-iproc.c          | 1 -
>  drivers/pci/controller/pcie-microchip-host.c | 2 +-
>  drivers/pci/controller/pcie-rockchip-host.c  | 1 -
>  drivers/pci/controller/pcie-xilinx-cpm.c     | 1 -
>  drivers/pci/controller/pcie-xilinx-nwl.c     | 1 -
>  15 files changed, 4 insertions(+), 14 deletions(-)

I put these on a pci/kbuild branch that I propose to merge in after
everything else.  Lorenzo, let me know if you prefer another approach.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
