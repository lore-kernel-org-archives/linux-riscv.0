Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C164C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 20:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ePuMo2+61QDNOX/dU9Vv8YBICpkFAx5ayTukq6/sQvQ=; b=wBo1+yi8+wKd+o
	oU2noCGbmW65DNJCnjgovaaKwN1dSY4qNne8OYGLULrUowbyQofVH1sDbKiW7imN++DklHFWewLRj
	uiCApib5Rn6RIlUcaTnd2zXPayPk+9SShOSkk/R0ReTEJem8qR3i8Fi3Y/ToxeG8DteSZ1RayNsY/
	F9cF9N+j+Pa3dIwxqv0osRyauobjeDfFl289oeFEPynSxqdtpLlN5gHnW4D3QfQGokXpS4tOu541f
	uTThZd3VABD58YnQbXPs07BtAbHcGlW3IL9BiAqyromqNJ7BNn9i7PNQFTMnIS79p+TqA6pBkk2fI
	3UiTBUhFPFlWX1MIRiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMybn-00G2G4-8k; Wed, 23 Feb 2022 20:51:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMybk-00G2Fi-AY
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 20:51:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D87BC615BF;
 Wed, 23 Feb 2022 20:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06108C340E7;
 Wed, 23 Feb 2022 20:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645649491;
 bh=fuBbEnwtDxq+kiQXx8gxSj7IRCfE9GArt5C1WdOxPbI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=k600/LqrVOgUpVAQTlIMr5ar7Gb1FMGwtEL7yplP6HRlmTtueupWshev9F4nYEhUA
 YLLAMQLykHFJP60Ur1b2gxqkYtsCgRtS6cx9zhxQUfLlpHwgRzvm6ScAqmySiAl0aK
 uWDHI/ivvvl3hcjJHz57Ly/2Q+uCI0mKtMLdNeWdqbtGNQEQlRV2zX8LCh5P2gJDC1
 Zfo3EK1E0MV15ni2U5x53DKNoc+dnDyQuYcYIUgNSJmu24f+R8YVDcdMzOSXSDUX31
 VLXXTI9bp7sXld5FfnvXLS4XTTPl6+3xYH6FvQMEza2diqj4RD9UxhiRO4bQgbxf8U
 ivug1SmqHD64Q==
Date: Wed, 23 Feb 2022 14:51:29 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: paul.walmsley@sifive.com, greentime.hu@sifive.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv4 1/2] PCI: fu740: fix finding GPIOs
Message-ID: <20220223205129.GA148800@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221210347.1335004-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_125132_426210_55FB9A15 
X-CRM114-Status: GOOD (  22.06  )
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

On Mon, Feb 21, 2022 at 09:03:46PM +0000, Ben Dooks wrote:
> The calls to devm_gpiod_get_optional() have the -gpios at the end of
> the name but the GPIO core code is already adding the suffix during
> the lookup. This means the PCIe driver is not finding the necessary
> reset or power lines to allow initialisation of the PCIe.
> 
> This bug has not been noticed as if U-Boot has setup the GPIO lines
> for the hardware when it does the PCIe initialisation (either by
> booting from PCIe or user command to access PCIe) then the PCIe
> will work in Linux. The U-Boot as supplied by SiFive does not by
> default initialise any PCIe component.

Lorenzo, if you apply this, would you mind s/fix/Fix/ in the subject?
Or maybe even update to "Drop redundant '-gpios' from DT GPIO lookup"?

> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/pci/controller/dwc/pcie-fu740.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> index 00cde9a248b5..842b7202b96e 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -259,11 +259,11 @@ static int fu740_pcie_probe(struct platform_device *pdev)
>  		return PTR_ERR(afp->mgmt_base);
>  
>  	/* Fetch GPIOs */
> -	afp->reset = devm_gpiod_get_optional(dev, "reset-gpios", GPIOD_OUT_LOW);
> +	afp->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
>  	if (IS_ERR(afp->reset))
>  		return dev_err_probe(dev, PTR_ERR(afp->reset), "unable to get reset-gpios\n");
>  
> -	afp->pwren = devm_gpiod_get_optional(dev, "pwren-gpios", GPIOD_OUT_LOW);
> +	afp->pwren = devm_gpiod_get_optional(dev, "pwren", GPIOD_OUT_LOW);
>  	if (IS_ERR(afp->pwren))
>  		return dev_err_probe(dev, PTR_ERR(afp->pwren), "unable to get pwren-gpios\n");
>  
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
