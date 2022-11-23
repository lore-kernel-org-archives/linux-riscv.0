Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E89C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 22:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3qvaXbG3yu8Tk9Av0TF5IWrCRFI6ZNW2fJ3hyt3hoFI=; b=Zar1IvNnBtNDZJ
	eaSqL8m+Yy7lcDHz3n1H9aI92aSSZiJr1bFXd8ELkx17HT2aA03YoTChGzKa1Uo+/ywSLE0IImp+h
	/hce23hD7Br5IectqOmTY/Er9Y4whpj9BlvY1yLptdWJ8iissceWAxzgCK9ldwmYr4qhH0CQ3pPCi
	nL41tDOe2kzmemf90MzOViXWCkzcRMO+hXjWxkJG8NX+JYRa9Xc10VeZ0YPuaWipm3twBLqcy2SD7
	wlzZvux7v9BxhYL2jlWGoeZl5nEn3VFyMMKlgjaPqfUYIfjY6TmCpvN5Q7UKy+50mPTVyQnUyweNY
	9iG/xqR+zDsOMYaKEHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxyPN-002ixx-E0; Wed, 23 Nov 2022 22:39:57 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxyPK-002ixK-IE
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 22:39:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0870B821B0;
	Wed, 23 Nov 2022 22:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6E7C433C1;
	Wed, 23 Nov 2022 22:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669243191;
	bh=a4+0uiLBUyE9xruBjqTz1QT1oKdoKy3V//RWTYjwkwY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ckM/t7ZKPNwm4Zuy7Uv7ff+ykJqZS0VjMONRm4ToWTuo/TVOIgm+DCpVBaQbrZVQV
	 5oF158/847ifg8T2T+ZAbs2q7b2bPIT9Av7mBk8sEE+Nd4K+L5d3gUiQLmuOte198h
	 jzaNpZIsLqhe2aEZhss2zLCaq7YcaSfVGI2heQIbfAxtwSNTPFCwL+n0Aci9SXBqZ9
	 0aDTulLNWUMMBn0zIrE0D9gPm/B994EqT5o2bWCU9Be2ZMrv/TpKaRoR8cyTzV2lMI
	 XqcW3gtWP30OBARqnEi8Ov5lqpxnboGARVYMETmGm7VboLN1xK48Nwxi8S1orSeTQD
	 IJMG3CWalhSxQ==
Date: Wed, 23 Nov 2022 22:39:46 +0000
From: Conor Dooley <conor@kernel.org>
To: daire.mcnamara@microchip.com
Cc: conor.dooley@microchip.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lpieralisi@kernel.org,
	kw@linux.com, bhelgaas@google.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v1 6/9] PCI: microchip: Re-partition code between probe()
 and init()
Message-ID: <Y36hMtARoGy2YULP@spud>
References: <20221116135504.258687-1-daire.mcnamara@microchip.com>
 <20221116135504.258687-7-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221116135504.258687-7-daire.mcnamara@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_143954_916895_3E91D4C2 
X-CRM114-Status: GOOD (  30.45  )
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

On Wed, Nov 16, 2022 at 01:55:01PM +0000, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Continuing to use pci_host_common_probe() for the PCIe root complex on
> PolarFire SoC was leading to an extremely large _init() function and
> some unnatural code flow. Re-partition so some tasks are done in
> a _probe() routine, which calls pci_host_common_probe() and then use a
> much smaller _init() function, mainly to enable interrupts after address
> translation tables are set up.
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/pci/controller/pcie-microchip-host.c | 55 ++++++++++++++------
>  1 file changed, 38 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/pci/controller/pcie-microchip-host.c b/drivers/pci/controller/pcie-microchip-host.c
> index faecf419ad6f..73856647f321 100644
> --- a/drivers/pci/controller/pcie-microchip-host.c
> +++ b/drivers/pci/controller/pcie-microchip-host.c
> @@ -381,6 +381,8 @@ static struct {
>  
>  static char poss_clks[][5] = { "fic0", "fic1", "fic2", "fic3" };
>  
> +static struct mc_pcie *port;
> +
>  static void mc_pcie_fixup_ecam(struct mc_pcie *port, void __iomem *ecam)
>  {
>  	struct mc_msi *msi = &port->msi;
> @@ -1095,7 +1097,34 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  {
>  	struct device *dev = cfg->parent;
>  	struct platform_device *pdev = to_platform_device(dev);
> -	struct mc_pcie *port;
> +	void __iomem *bridge_base_addr =
> +		port->axi_base_addr + MC_PCIE_BRIDGE_ADDR;
> +	int ret;
> +
> +	/* Configure address translation table 0 for PCIe config space */
> +	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start,
> +			     cfg->res.start,
> +			     resource_size(&cfg->res));
> +
> +	/* Need some fixups in config space */
> +	mc_pcie_fixup_ecam(port, cfg->win);
> +
> +	/* Configure non-config space outbound ranges */
> +	ret = mc_pcie_setup_windows(pdev, port);
> +	if (ret)
> +		return ret;
> +
> +	/* address translation is up; safe to enable interrupts */

I think that Bjorn mentioned it elsewhere, but consistent capitalisation
would be nice. Otherwise, code movement looks good to me.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> +	ret = mc_init_interrupts(pdev, port);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int mc_host_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
>  	void __iomem *bridge_base_addr;
>  	void __iomem *ctrl_base_addr;
>  	int ret;
> @@ -1104,13 +1133,8 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	port = devm_kzalloc(dev, sizeof(*port), GFP_KERNEL);
>  	if (!port)
>  		return -ENOMEM;
> -	port->dev = dev;
>  
> -	ret = mc_pcie_init_clks(dev);
> -	if (ret) {
> -		dev_err(dev, "failed to get clock resources, error %d\n", ret);
> -		return -ENODEV;
> -	}
> +	port->dev = dev;
>  
>  	port->axi_base_addr = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(port->axi_base_addr))
> @@ -1136,16 +1160,13 @@ static int mc_platform_init(struct pci_config_window *cfg)
>  	/* pick vector address from design */
>  	port->msi.vector_phy = readl_relaxed(bridge_base_addr + IMSI_ADDR);
>  
> -	/* Configure Address Translation Table 0 for PCIe config space */
> -	mc_pcie_setup_window(bridge_base_addr, 0, cfg->res.start & 0xffffffff,
> -			     cfg->res.start, resource_size(&cfg->res));
> -
> -	ret = mc_pcie_setup_windows(pdev, port);
> -	if (ret)
> -		return ret;
> +	ret = mc_pcie_init_clks(dev);
> +	if (ret) {
> +		dev_err(dev, "failed to get clock resources, error %d\n", ret);
> +		return -ENODEV;
> +	}
>  
> -	/* address translation is up; safe to enable interrupts */
> -	return mc_init_interrupts(pdev, port);
> +	return pci_host_common_probe(pdev);
>  }
>  
>  static const struct pci_ecam_ops mc_ecam_ops = {
> @@ -1168,7 +1189,7 @@ static const struct of_device_id mc_pcie_of_match[] = {
>  MODULE_DEVICE_TABLE(of, mc_pcie_of_match);
>  
>  static struct platform_driver mc_pcie_driver = {
> -	.probe = pci_host_common_probe,
> +	.probe = mc_host_probe,
>  	.driver = {
>  		.name = "microchip-pcie",
>  		.of_match_table = mc_pcie_of_match,
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
