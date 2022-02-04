Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F78C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Feb 2022 22:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=Aau+/6b2fpaxXa/CeIK7ynTHAd/bEwvq5mjXw2byih8=; b=ONxy9M07SC6kMm
	mvXnIGS3Eh4+ablwuG7Kqbq9hBEyB4X9MHMCR0ru6YdUudtJn39QrAF4qWmRGpjKRC+BGWIpueJ5r
	Ni7I6BFTcx8uw3DTLlhrFVib0HKS955J70Rs+dqwxpMuuZPqhStoI3/V1DG7yIN7OpHmPLt2wq9So
	9LC82jDvbsCwmVdefVf00YbljkYnCAV4motUb0Wetu05sN6Lraycm4be5BnDIPZKPAXNbokRB4xBz
	2Zk7ul3pGeOkYK5wm1rBcGUCseMbLbDPyhLSrXMl+s2/Ny8+jxATBzgNNct7mZVYqA7RAIzIhCEzO
	KtRVxdJZG0A7N8V4ha8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nG7S7-005czk-Gx; Fri, 04 Feb 2022 22:53:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nG7S5-005cz2-1t
 for linux-riscv@lists.infradead.org; Fri, 04 Feb 2022 22:53:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B1714B83951;
 Fri,  4 Feb 2022 22:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8B7EC004E1;
 Fri,  4 Feb 2022 22:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644015190;
 bh=/GzwVvJMLbvFuL7505iRlddvcEtqGqqgxMSACzO5WaM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=SCVpnqN0O2Oeo+jsHYY7UyYnv8LrQu8v/cO91izw0Zs9hvvq2hXLdmscEji4rFGvO
 4RVO1ELuhL6b6ui5qdKFNgQ12FWmn2nziYmt7qR/M91iMcgxs77FjfsURueL/THNew
 bkxAIjyODRfFB63pWunMh1AN6cjSiVWSxf0jOh3MGFS0fQvsc22UCBJBJIShflV0ux
 SxeQ2X4ACfvBtpgXvzY6IZGxcnLmwIl9ZrR5QJCQt/e1CyyzAXF7Lb2a46NU5S99Ba
 /0LYuDB8NnUZBQt4sScS2ZoK9AVN3t77ImLm+NkChXapZ+I3ZkLZVw01Zz7wm6YCL+
 NJqaHHqyz4e3w==
Date: Fri, 4 Feb 2022 16:53:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: paul.walmsley@sifive.com, greentime.hu@sifive.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] PCI: fu740: fix finding gpios
Message-ID: <20220204225308.GA225749@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220204173821.281784-1-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220204_145313_256944_B325CF4D 
X-CRM114-Status: GOOD (  22.19  )
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

Follow subject line convention (s/fix/Fix/, s/gpios/GPIOs/).

On Fri, Feb 04, 2022 at 05:38:21PM +0000, Ben Dooks wrote:
> The calls to devm_gpiod_get_optional() have the -gpios on
> the name. This means the pcie driver is not finding the
> necessary reset or power gpios to allow the pcie devices
> on the SiFive Unmatched boards.
> 
> Note, this was workng around 5.16 and may not have been
> broken? There is still an issue if uboot has not probed
> the pcie bus then there are no pcie devices shown when
> Linux is started.

Wrap to fill 75 columns
s/gpios/GPIOs/
s/pcie/PCIe/
s/workng/working/
s/to allow the pcie devices/to allow the PCIe devices <to something>?/

I can't tell what this is saying.  It used to work and something broke
it?  If so, we should have a "Fixes:" tag to identify the commit that
broke it.

Or it used to work and "may *not* have been broken"?  I'm confused.

Unclear how uboot is involved.

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
