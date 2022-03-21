Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F81C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Mar 2022 20:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=yMk6qf+NHD0AVDL2H81ZsnCDkwy1FyMYP/lZniuzZtg=; b=2GS+1dywHnjam5
	0jefMjP/xCcIkZdvUKwmlNFo3wWlUhAZfMpTz36AOHFFVuAXlQBZoXs3fJxxPuEdkMCq244HWCzTv
	J0u542/RuKwKJ9ofatmgUeH4/3DeQkN7HHemO39faqSztSQ5gyzGLaymmOc1ONIWH12WN5mdSFrjH
	ge2bsm/0Yin+Se+lmrGOepqHEmtt0vJxzg5ksG3KBGSwG3C3k6GCHyx4x8ELNpub49hutK0ghP3AP
	ykWhLa7cg4yUiO5ROToNamBe8Gbs7TuMEN4SNf6fRxnYqVdRONFxkCcw2qPdfgUFz3M5JqTzYib8a
	xNy0tgrccTaWilPKpoIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWOic-0095do-Sl; Mon, 21 Mar 2022 20:33:34 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWOeV-00943V-Hz
 for linux-riscv@lists.infradead.org; Mon, 21 Mar 2022 20:29:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A44C8B819D9;
 Mon, 21 Mar 2022 20:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D08E6C36AE5;
 Mon, 21 Mar 2022 20:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647894554;
 bh=0t3di4frHw4wef47Rc5l5X8PkzcS5T+5paso1xex7hs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=ptM/44lFY5Xmt/PQ4iD4vJ6Xn1vhW/pwoPjQPSaBTDmnnKqih2lNfjkUsqWB5FMLt
 PvjW3onauXv6V9oi3raECGxU7o7OrNA0R7RuRvNa2YoQg8UPDKMrt0Ql+U/a8EKptH
 hE3dM1xl8s/6oPs+zSvtKmMGNHhM3V00FZInZO3juH9OXLwo07uD/2DJVsR2q0ZvZa
 2UWZdMKgeuxhsWjO/Zr5JRjQ045fUAP9I+Yymuiuguq6THcKS6Vl2MFrzaDY9hqcs1
 wDsJH2sxFZv93XOgd0V3o5oHuzlljP8Wg9dLhXaGcSLCq7k3ceC3gKfeJ4gnXG4fRW
 V5lzDyAtxVgRg==
Date: Mon, 21 Mar 2022 15:29:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Bjorn Helgaas <bhelgaas@google.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [V3] PCI: fu740: Drop to 2.5GT/s to fix initial device probing
 on some boards
Message-ID: <20220321202912.GA1120443@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318152430.526320-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_132919_958312_99CBB854 
X-CRM114-Status: GOOD (  33.44  )
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

On Fri, Mar 18, 2022 at 03:24:30PM +0000, Ben Dooks wrote:
> The fu740 PCIe core does not probe any devices on the SiFive Unmatched
> board without this fix (or having U-Boot explicitly start the PCIe via
> either boot-script or user command). The fix is to start the link at
> 2.5GT/s speeds and once the link is up then change the maximum speed back
> to the default.
> 
> The U-Boot driver claims to set the link-speed to 2.5GT/s to get the probe
> to work (and U-Boot does print link up at 2.5GT/s) in the following code:
> https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pci/pcie_dw_sifive.c?id=v2022.01#L271
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Lorenzo has an old version of this patch on his pci/fu740 branch.

Since we're now in the merge window, I applied this V3 patch to my
pci/host/fu740 branch so we can try to get this in for v5.18.

> --
> Note, this patch has had significant re-work since the previous 4
> sets, including trying to fix style, message, reliance on the U-Boot
> fix and the comments about usage of LINK_CAP and reserved fields.
> 
> v2:
> - fix issues with Gen1/2.5GTs
> - updated comment on the initial probe
> - run tests with both uninitialised and initialsed pcie from uboot
> ---
>  drivers/pci/controller/dwc/pcie-fu740.c | 52 ++++++++++++++++++++++++-
>  1 file changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> index 842b7202b96e..ecac0364178a 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -181,10 +181,60 @@ static int fu740_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct device *dev = pci->dev;
>  	struct fu740_pcie *afp = dev_get_drvdata(dev);
> +	u8 cap_exp = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +	int ret;
> +	u32 orig, tmp;
> +
> +	/*
> +	 * Force 2.5GT/s when starting the link, due to some devices not
> +	 * probing at higher speeds. This happens with the PCIe switch
> +	 * on the Unmatched board when U-Boot has not initialised the PCIe.
> +	 * The fix in U-Boot is to force 2.5GT/s, which then gets cleared
> +	 * by the soft reset does by this driver.
> +	 */
> +
> +	dev_dbg(dev, "cap_exp at %x\n", cap_exp);
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	tmp = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCAP);
> +	orig = tmp & PCI_EXP_LNKCAP_SLS;
> +	tmp &= ~PCI_EXP_LNKCAP_SLS;
> +	tmp |= PCI_EXP_LNKCAP_SLS_2_5GB;
> +	dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCAP, tmp);
>  
>  	/* Enable LTSSM */
>  	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
> -	return 0;
> +
> +	ret = dw_pcie_wait_for_link(pci);
> +	if (ret) {
> +		dev_err(dev, "error: link did not start\n");
> +		goto err;
> +	}
> +
> +	tmp = dw_pcie_readl_dbi(pci, cap_exp + PCI_EXP_LNKCAP);
> +	if ((tmp & PCI_EXP_LNKCAP_SLS) != orig) {
> +		dev_dbg(dev, "changing speed back to original\n");
> +
> +		tmp &= ~PCI_EXP_LNKCAP_SLS;
> +		tmp |= orig;
> +		dw_pcie_writel_dbi(pci, cap_exp + PCI_EXP_LNKCAP, tmp);
> +
> +		tmp = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
> +		tmp |= PORT_LOGIC_SPEED_CHANGE;
> +		dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, tmp);
> +
> +		ret = dw_pcie_wait_for_link(pci);
> +		if (ret) {
> +			dev_err(dev, "error: link did not start at new speed\n");
> +			goto err;
> +		}
> +	}
> +
> +	ret = 0;
> +err:
> +	WARN_ON(ret);	/* we assume that errors will be very rare */
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +	return ret;
>  }
>  
>  static int fu740_pcie_host_init(struct pcie_port *pp)
> -- 
> 2.35.1
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
