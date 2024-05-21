Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E03C25B74
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 22:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Z8b8O0wJ+FCdzm0HhO6O4NtYIeTNHGI0XTKQlhJkCVA=; b=lWncy9FqVO2Bm4
	vt0uRLWwPJWO2dm6c+G/gtV4AIlatTnR9M5SRd+W7LzdAtX5Q7tkPQ88X459VQA+RGQgOdd9XNMQE
	9g3Q7/XsAHLOWOKTXvSBYmR++k26dPXxVA1NJUQJ1rkerg/d4AKy5RzZswZPA6x1eta+mdto7x5Gi
	BXR7tM3ufwwCM/j5rf5kbzEtkfubK12aLud/rpmf/1qNZY7pjUI0hvbItWbO8h9Nst8UfO5TLF1Hm
	ySJsS1h+I0sxLJf4vhbCSvPD7i9OmPGl5rMAAZcujvZeVulxOgz7QlPTaC7cF/WSIb/uNSxIVrSX1
	PR8ONrXS7MjKBvmwG4tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9XrO-00000001EZK-3NY9;
	Tue, 21 May 2024 22:21:30 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9XrK-00000001EWa-41aP
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 22:21:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8B571CE1018;
	Tue, 21 May 2024 22:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AF01C2BD11;
	Tue, 21 May 2024 22:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716330083;
	bh=eTuD8TkoSJENTwFBMEinJkrb+PTHkp3uq6sPx3UUzN0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=cbknFbOrlq2asl7flaBNs5fBtXasvCVpbovNe1xwvZHA8ibl/wvjz6ialnpg5lH3C
	 OYZfHlDpi0x0d0WhqKOTT+MImfiymKZIpYgT41eKKMYbDvn/YjEGaFYtzr4Z7rM0VD
	 XhDjusLnYZK4vbQZdBwdz4NbOPXjejZ4lRZJ7dCyvuYnh/aXwK06d4j6U48nT6Gwz3
	 BNwC/CEyamHdqbrHMyKSUESNxuZXLqKgcFpEQ9sqvyyewxisaIzi26J8zj24xr5GSz
	 SuPC8GVpd1YtEgKvmsP9pki406qPwQHVVIHgiWQbVchwSWHiQVPWrkIZvJBBiDjsMS
	 ft7+VW0CcMoOA==
Date: Tue, 21 May 2024 17:21:21 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Minda Chen <minda.chen@starfivetech.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh+dt@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-pci@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mason Huo <mason.huo@starfivetech.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH v16 08/22] PCI: microchip: Change the argument of
 plda_pcie_setup_iomems()
Message-ID: <20240521222121.GA51329@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240328091835.14797-9-minda.chen@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_152127_427679_F52EA642 
X-CRM114-Status: GOOD (  22.47  )
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

The patch is OK, but the subject line is not very informative.  It
should be useful all by itself even without the commit log.  "Change
the argument of X" doesn't say anything about why we would want to do
that.

On Thu, Mar 28, 2024 at 05:18:21PM +0800, Minda Chen wrote:
> If other vendor do not select PCI_HOST_COMMON, the driver data is not
> struct pci_host_bridge.

Also, I don't think this is the real problem.  Your
PCIE_MICROCHIP_HOST Kconfig selects PCI_HOST_COMMON, and the driver
calls pci_host_common_probe(), so the driver wouldn't even build
without PCI_HOST_COMMON.

This patch is already applied and ready to go, but if you can tell us
what's really going on here, I'd like to update the commit log.

> Move calling platform_get_drvdata() to mc_platform_init().
> 
> Signed-off-by: Minda Chen <minda.chen@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/plda/pcie-microchip-host.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
> index 9b367927cd32..805870aed61d 100644
> --- a/drivers/pci/controller/plda/pcie-microchip-host.c
> +++ b/drivers/pci/controller/plda/pcie-microchip-host.c
> @@ -876,11 +876,10 @@ static void plda_pcie_setup_window(void __iomem *bridge_base_addr, u32 index,
>  	writel(0, bridge_base_addr + ATR0_PCIE_WIN0_SRC_ADDR);
>  }
>  
> -static int plda_pcie_setup_iomems(struct platform_device *pdev,
> +static int plda_pcie_setup_iomems(struct pci_host_bridge *bridge,
>  				  struct plda_pcie_rp *port)
>  {
>  	void __iomem *bridge_base_addr = port->bridge_addr;
> -	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
>  	struct resource_entry *entry;
>  	u64 pci_addr;
>  	u32 index = 1;
> @@ -1018,6 +1017,7 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  {
>  	struct device *dev = cfg->parent;
>  	struct platform_device *pdev = to_platform_device(dev);
> +	struct pci_host_bridge *bridge = platform_get_drvdata(pdev);
>  	void __iomem *bridge_base_addr =
>  		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
>  	int ret;
> @@ -1031,7 +1031,7 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	mc_pcie_enable_msi(port, cfg->win);
>  
>  	/* Configure non-config space outbound ranges */
> -	ret = plda_pcie_setup_iomems(pdev, &port->plda);
> +	ret = plda_pcie_setup_iomems(bridge, &port->plda);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
