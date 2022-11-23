Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692A4C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 23:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAv2POACshiQQNrBIUYjwdh5h0/EsLfGaDJ1+8DZOnc=; b=Pa3Fh9U5ae/Jte
	wTgYRP6WLmK1fZWKp9l7nUh1YfVoCNueehFkI79opTPEne3/BGYnGqvh4mJL5y7t5nhO8SFt7eMmZ
	xmK6UbaImSBsYfm9wR96ijkMyAfEfnJNwSTvkamL2YZZQohNm2hJxFf2zUGTf+Z3QRsOrNbXm5i/G
	As2pxkBqNnPIOPN0CRAiXYlR5n4yhdRkB6LMq4FWib7ZkNedD4QbEavg41fnKOOV9cU1VNZAw6M/f
	eqYDqSHjWvKHFFwsUL5eYHNXgRSsLO2yG+8d6F3nmf2iVci5XPxFuE8GdpbzKjf8UKmmLqrCI/JsT
	UV0u5ncLQM2sZaGp/kdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxyoL-002o4f-9D; Wed, 23 Nov 2022 23:05:45 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxyoI-002o3j-NQ
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 23:05:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 52DFAB82561;
	Wed, 23 Nov 2022 23:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E2FC433C1;
	Wed, 23 Nov 2022 23:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669244740;
	bh=WvDBwfjaVvOEQHGt0bchNUrMTBCVHmD1JG+lP6VucLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jh9kNXFSMAKzWA+V3l4fe4QxYCWzFE2/GBMio9EPM0YfsF8DbM14ZMv0oVoQovCL+
	 8jsErEyb3HKVHH6463oP5BCN+aV0cHmDUXhHdTE7oTTthQeFO1y38j9JBVrELF4zL7
	 HaWrOPTVIrw509rg/c+4eDYOUDVNhQshxtw8QZdizkbYnPw71eBHzpWYoSxbB72Biw
	 Al4grabUH4nFdMcovOtUTCVHaFvHRENFkfoBy0muARkd6n5DIP+nEmkI5hbns/vYEn
	 DGmHpHPGLifdqRT919caaHGq1usKRKXV66wsyureNun8pPaHRR61SqbQoez/cyiInk
	 QJtxtP5JRVI0w==
Date: Wed, 23 Nov 2022 23:05:34 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 8/9] PCI: microchip: Partition inbound address
 translation
Message-ID: <Y36nPubPl08F/nag@spud>
References: <20221116135504.258687-1-daire.mcnamara@microchip.com>
 <20221116135504.258687-9-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116135504.258687-9-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_150543_076057_4661D056 
X-CRM114-Status: GOOD (  22.60  )
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

On Wed, Nov 16, 2022 at 01:55:03PM +0000, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> On Microchip PolarFire SoC the PCIe rootport is behind a set of fabric
> inter connect (fic) busses that encapsulate busses like ABP/AHP, AXI-S
> and AXI-M. Depending on which fic(s) the rootport is wired through to
> cpu space, the rootport driver needs to take account of the address
> translation done by a parent (e.g. fabric) node before setting up its
> own inbound address translation tables from attached devices.
> 
> Parse the dma-range properties to determine how much address translation
> to perform in the root port and how much is being provided by the
> fabric.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 184 ++++++++++++++++++-
>  1 file changed, 178 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> index 62f8c5edfd0e..a90a0a675f14 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c

> @@ -940,6 +954,46 @@ static int mc_pcie_init_irq_domains(struct mc_pcie *port)
>  	return mc_allocate_msi_domains(port);
>  }
>  
> +static int mc_pcie_setup_inbound_ranges(struct platform_device *pdev, struct mc_pcie *port)
> +{
> +	void __iomem *bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	phys_addr_t pcie_addr;
> +	phys_addr_t axi_addr;
> +	u32 atr_size;
> +	u32 val;
> +	int i;
> +
> +	for (i = 0; i < port->num_inbound_windows; i++) {
> +		atr_size = ilog2(port->inbound_windows[i].size) - 1;
> +		atr_size &= GENMASK(5, 0);
> +
> +		pcie_addr = port->inbound_windows[i].pci_addr;
> +
> +		val = lower_32_bits(pcie_addr) & GENMASK(31, 12);
> +		val |= (atr_size << ATR_SIZE_SHIFT);
> +		val |= ATR_IMPL_ENABLE;
> +		writel(val, bridge_base_addr +
> +		       ATR0_PCIE_WIN0_SRCADDR_PARAM + (i * ATR_WINDOW_DESC_SIZE));
> +		writel(upper_32_bits(pcie_addr), bridge_base_addr +
> +		       ATR0_PCIE_WIN0_SRC_ADDR + (i * ATR_WINDOW_DESC_SIZE));
> +
> +		axi_addr = port->inbound_windows[i].axi_addr;
> +
> +		writel(lower_32_bits(axi_addr), bridge_base_addr +
> +		       ATR0_PCIE_WIN0_TRSL_ADDR_LSB + (i * ATR_WINDOW_DESC_SIZE));
> +		writel(upper_32_bits(axi_addr), bridge_base_addr +
> +		       ATR0_PCIE_WIN0_TRSL_ADDR_UDW + (i * ATR_WINDOW_DESC_SIZE));
> +
> +		writel(TRSL_ID_AXI4_MASTER_0, bridge_base_addr +
> +		       ATR0_PCIE_WIN0_TRSL_PARAM + (i * ATR_WINDOW_DESC_SIZE));
> +
> +		dev_dbg(&pdev->dev, "0x%010llx..0x%010llx -> 0x%010llx\n",
> +			pcie_addr, pcie_addr + port->inbound_windows[i].size - 1, axi_addr);

If you're going to leave the dbg print in, can you make it more verbose
so that the log message stands on its own?

Other than that, I made most of my comments before submission so LGTM..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
