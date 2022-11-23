Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B60C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5sVBTg0nwi3C3BhQrFtakjL0+LnMFdqH4zbUejTGas=; b=yzuIYO9wl8b2DT
	+rI4hjcFmGrkg/3VUdWTcqWAyo7q5KwF5K5C62lqD89XUuSk8gWaBSBIM3Drf6xPtIazi4qCJmYc1
	RWcUIS638bxw4D3n7HVIX+1n67qedmgDudfE+Gbn8hVTSyMREyUol1eLxEoQuGrpv/RBR/Qg6U8tx
	eOGFumI8eMsOsiDyg/NnNu5fVdaU+Qj2Uqg5aG7i5bdUvDhwsBg0eah9SsGNjHQlDjG9AR9bw0pxW
	nB5Gq8QYNRFXSUYnoGkFgQuKd+vKKBVK6yfsK09vJTUSTZ9bDyjO3cKaP647J5vSWsQ9vS59PHFlV
	JOMGFoc3Yn34P81+qAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxxNs-002Wt1-EW; Wed, 23 Nov 2022 21:34:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxxNo-002WsT-N5
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 21:34:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB75961F34;
	Wed, 23 Nov 2022 21:34:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3D8C433D6;
	Wed, 23 Nov 2022 21:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669239255;
	bh=ttMnqx4iEKEd6geGNacCiYRbZj8zxa04+xKggspTI3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pdX0/svkQ/HYg3xS3rH6GcyUNRLwoipJuiIoygPCKDNw+pLtkul/tX757vACpYGtR
	 MpvHKe6k1Tb+iT91JVu4FK3toFOR4Az9ePc6k0aa94gQ1+ix+KqTbFDrieh+wK/gJc
	 Ppv9XHefhHc3s2gtDMADjnMc7oHB10KYGHKygBkaeflbErUVlML+bbop6qe7ZG8vFX
	 Pbu9mvMSPje3BJilqEGydf34aXaSS6QuG2ZDWL0i1b0IT2lvOQS+qHHSu+dByXDIms
	 qUILaMekxYgX4AkuAZkZBaZRG+7Kf7m/DpCGsCk58TtYVqOOv7PBP4rIZSJqS5fpgZ
	 aylWlicVQFkXQ==
Date: Wed, 23 Nov 2022 21:34:10 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 3/9] PCI: microchip: Enable event handlers to access
 bridge and ctrl ptrs
Message-ID: <Y36R0jXXx6AwrLub@spud>
References: <20221116135504.258687-1-daire.mcnamara@microchip.com>
 <20221116135504.258687-4-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116135504.258687-4-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_133416_845569_3631893D 
X-CRM114-Status: GOOD (  18.85  )
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

On Wed, Nov 16, 2022 at 01:54:58PM +0000, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Minor re-organisation so that event handlers can access both a pointer
> to the bridge area of the PCIe rootport and the ctrl area of the PCIe
> rootport.

Perhaps explaining why we would want to access both, when we've not
needed to so far, would be helpful so that this commit message will make
sense in isolation would be nice. The mechanics of the change seem good
to me though:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 31 ++++++++++----------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> index 30153fd1a2b3..a81e6d25e347 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -654,9 +654,10 @@ static inline u32 reg_to_event(u32 reg, struct event_map field)
>  	return (reg & field.reg_mask) ? BIT(field.event_bit) : 0;
>  }
>  
> -static u32 pcie_events(void __iomem *addr)
> +static u32 pcie_events(struct mc_pcie *port)
>  {
> -	u32 reg = readl_relaxed(addr);
> +	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
> +	u32 reg = readl_relaxed(ctrl_base_addr + PCIE_EVENT_INT);
>  	u32 val = 0;
>  	int i;
>  
> @@ -666,9 +667,10 @@ static u32 pcie_events(void __iomem *addr)
>  	return val;
>  }
>  
> -static u32 sec_errors(void __iomem *addr)
> +static u32 sec_errors(struct mc_pcie *port)
>  {
> -	u32 reg = readl_relaxed(addr);
> +	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
> +	u32 reg = readl_relaxed(ctrl_base_addr + SEC_ERROR_INT);
>  	u32 val = 0;
>  	int i;
>  
> @@ -678,9 +680,10 @@ static u32 sec_errors(void __iomem *addr)
>  	return val;
>  }
>  
> -static u32 ded_errors(void __iomem *addr)
> +static u32 ded_errors(struct mc_pcie *port)
>  {
> -	u32 reg = readl_relaxed(addr);
> +	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
> +	u32 reg = readl_relaxed(ctrl_base_addr + DED_ERROR_INT);
>  	u32 val = 0;
>  	int i;
>  
> @@ -690,9 +693,10 @@ static u32 ded_errors(void __iomem *addr)
>  	return val;
>  }
>  
> -static u32 local_events(void __iomem *addr)
> +static u32 local_events(struct mc_pcie *port)
>  {
> -	u32 reg = readl_relaxed(addr);
> +	void __iomem *bridge_base_addr = port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	u32 reg = readl_relaxed(bridge_base_addr + ISTATUS_LOCAL);
>  	u32 val = 0;
>  	int i;
>  
> @@ -704,15 +708,12 @@ static u32 local_events(void __iomem *addr)
>  
>  static u32 get_events(struct mc_pcie *port)
>  {
> -	void __iomem *bridge_base_addr =
> -		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> -	void __iomem *ctrl_base_addr = port->axi_base_addr + MC_PCIE_CTRL_ADDR;
>  	u32 events = 0;
>  
> -	events |= pcie_events(ctrl_base_addr + PCIE_EVENT_INT);
> -	events |= sec_errors(ctrl_base_addr + SEC_ERROR_INT);
> -	events |= ded_errors(ctrl_base_addr + DED_ERROR_INT);
> -	events |= local_events(bridge_base_addr + ISTATUS_LOCAL);
> +	events |= pcie_events(port);
> +	events |= sec_errors(port);
> +	events |= ded_errors(port);
> +	events |= local_events(port);
>  
>  	return events;
>  }
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
