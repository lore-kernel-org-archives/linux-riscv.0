Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7994CC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 20:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=hgNKimacvvOL0LicyuRDrs8cnLrmjJBJLW8hw61GKOA=; b=F0drB0jGqLxXrp
	vpDrK8RdL0cfGy+d9cioSEZpbJlCgDqSnPrrlF0jgoGy76nV1wVkYqfDGO2bKEfKXYQ+Qf2FzPyBI
	bHVbQDak47jww0H7oos+G6ZivJ4Hq1uJUiMeMMcFXkFXcaWhsLrxNvIMAZBOVXfDCkvzfGo3PVS4g
	c6G8vXOU7E5IUH7w8vxQjNuEv9KqcbpGLwBTmraiBx4hiP0NQP9gXoqgvq//YGe9hv+grNGBNhK1V
	3B3K6uL0A22s1BbrlkAOAPin3sewHnkeCtH15w2ZgOpgTgz65QFABBdRj5ZHF71Wqak/q3G9FI3/g
	UqsVohjPg8DP87rZbCyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMybz-00G2Ij-37; Wed, 23 Feb 2022 20:51:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMybw-00G2Hy-3n
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 20:51:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE9D86184A;
 Wed, 23 Feb 2022 20:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7A7C340E7;
 Wed, 23 Feb 2022 20:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645649503;
 bh=0SqsE3SLzZsa9zyLElBqmrdwV4hoS7Iv9GFhoTF5g+U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=US2/PMGO61W+lOicS973HTneLBfltUYIiOJIZb1wtOLIwUTPj6Gnph1e7FOwQSuGi
 /PnPoWjy3WAY+SUhu10zHzi/mWd/WKR6oaL/5aCz451OFJQ7rtJRDiQ2I77VgG57xN
 HOkUA4JGMIy8wO6jfwr+lb35/8ZI9ncNk9N9Lp9bCciYyx61eQfh3Yz79i30SKzBa4
 9TAG82cqPFV19zcc3KCeT+DpeTRyXIbhXHZHcqOiy1hKyYpXpSYOCPVjTQxDIcBhnn
 AUJtM40N7L8LDmQBgdgJWe+3wSI0gfZL3k5+RkDIOhaxvoPNu7wPpR5b/VkYPeWOO0
 bucANLzVXGOHw==
Date: Wed, 23 Feb 2022 14:51:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: paul.walmsley@sifive.com, greentime.hu@sifive.com,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv4 2/2] PCI: fu740: Force gen1 for initial device probe
Message-ID: <20220223205141.GA149346@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221210347.1335004-2-ben.dooks@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_125144_262474_3BCF915C 
X-CRM114-Status: GOOD (  28.61  )
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

On Mon, Feb 21, 2022 at 09:03:47PM +0000, Ben Dooks wrote:
> The fu740 PCIe core does not probe any devices on the SiFive Unmatched
> board without this fix from U-Boot (or having U-Boot explicitly start
> the PCIe via either boot-script or user command).
> 
> The fix claims to set the link-speed to gen1 to get the probe
> to work. As this is a copy from U-Boot, the code is assumed to be
> correct and does fix the issue on the Unmatched. The code is at:

Maybe something like:

  Limit the link to Gen1 speed.

since "the fix claims" and "the code is assumed" is sort of
weasel-worded.

The subject says "for initial device probe," but if you change
PCI_EXP_LNKCAP, I assume that limits the link speed forever, even
after a retrain?

> https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pci/pcie_dw_sifive.c#L271

Maybe use this so the link doesn't become stale when more things are
added to pcie_dw_sifive.c:

  https://source.denx.de/u-boot/u-boot/-/blob/master/drivers/pci/pcie_dw_sifive.c?id=v2022.01#L271

> The code has been this way since the driver was commited in:
> https://source.denx.de/u-boot/u-boot/-/commit/416395c772018c6bf52aad36aca163115001793f

s/commited/committed/

> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  drivers/pci/controller/dwc/pcie-fu740.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> index 842b7202b96e..19501ec8c487 100644
> --- a/drivers/pci/controller/dwc/pcie-fu740.c
> +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> @@ -177,11 +177,30 @@ static void fu740_pcie_init_phy(struct fu740_pcie *afp)
>  	fu740_phyregwrite(1, PCIEX8MGMT_PHY_LANE3_BASE, PCIEX8MGMT_PHY_INIT_VAL, afp);
>  }
>  
> +/* This is copied from u-boot. Force system to gen1 otherwise nothing probes
> + * as found on the SiFive Unmatched board.
> + */

s/u-boot/U-Boot/

Use usual multi-line comment style.

> +static void fu740_pcie_force_gen1(struct dw_pcie *dw, struct fu740_pcie *afp )
> +{
> +	unsigned val;

u32, since that's what dw_pcie_readl_dbi() returns and
dw_pcie_writel_dbi() expects.

> +
> +	dw_pcie_dbi_ro_wr_en(dw);
> +
> +	val = dw_pcie_readl_dbi(dw, 0x70 + PCI_EXP_LNKCAP);

I assume 0x70 is the offset of the PCIe Capability.  There should be a
#define for that.

> +	pr_info("%s: link-cap was %08x\n", __func__, val);

  dev_info(pci->dev, "...");

> +	dw_pcie_writel_dbi(dw, 0x70 + PCI_EXP_LNKCAP, val | 0xf);

I don't understand this.  Per PCIe r6.0, sec 7.5.3.6, 1111b is a
reserved encoding for the low four bits of PCI_EXP_LNKCAP.

If you want PCI_EXP_LNKCAP to advertise only 2.5 GT/s, the low four
bits should be 0001b to indicate Supported Link Speeds Vector field
bit 0, which is defined as 2.5 GT/s.

> +	dw_pcie_dbi_ro_wr_dis(dw);
> +}
> +
>  static int fu740_pcie_start_link(struct dw_pcie *pci)
>  {
>  	struct device *dev = pci->dev;
>  	struct fu740_pcie *afp = dev_get_drvdata(dev);
>  
> +	/* Force PCIe gen1 otherwise Unmatched board does not probe */
> +	fu740_pcie_force_gen1(pci, afp);

I guess the "Unmatched" board is the only thing we need to care about
here?  Are there or will there be other boards that don't need this?

>  	/* Enable LTSSM */
>  	writel_relaxed(0x1, afp->mgmt_base + PCIEX8MGMT_APP_LTSSM_ENABLE);
>  	return 0;
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
