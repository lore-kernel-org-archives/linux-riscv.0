Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14D3C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XV5TIqXwYLln0XBbXLWPDW7gei3NT/b0tdIDUPsApFg=; b=xDXYm8+B0Whwg2
	RKdsLRzZLs3E6itdGIS/f9gvw2k7Sp1KQZME6st5cv74Qcf1j6GzUM02qWMoYfRRTotSUr+ADgZCx
	g1kxyDCbgy6QgH81VLtncKDq4BVjyrD/HaALDXHuoi3qN/0nnXlpmmu3JbjUo1AxzabugqNNX/1WD
	kHdhp2G+5yCptWXuj0buCP7qN4kcU3i8dOcVes5kZG4eRAhRVP2UfzfOdS0n8IkMvARCyjCJ30I6A
	yk7aVe0+ivql/fzfaVyfp3X2/HsEeNxnofInumC1omrD6DQAJmyucGW7wB60YLlis6sWXFAX0R+mD
	Sp0BYwlJFJo4Yvmb0HUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obqAm-005kKr-VP; Fri, 23 Sep 2022 21:25:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obqAj-005kK7-Fa
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 21:25:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E13AEB82292;
	Fri, 23 Sep 2022 21:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 660F5C433C1;
	Fri, 23 Sep 2022 21:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663968318;
	bh=hsD/lZITtHJp72cz/xXd+DURtS1POakzVq0Ixobci8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W/IhEsOKbcxSPvU3zcTj1Y6sdZN7FRaXkT41fjCAYlwbL8RBsyhTXkfSnAFLArfDX
	 R/VzThTTE91mtv2qyBs6xjIvfGccKwp1V5CWhGdWJHkvlgKSfI8lsnMEhvTym5Sb6g
	 xvF8CcJvVPKImsccq9nkknvb8j8u1Dpyf1LswNuzip+bWuOrp7nKmr9aaQtVz9pCxY
	 tBPVA2kgmhckorZ3sOu+AudJDSCikzaPBfknqb5mkVaHco0J/uMHFSU5Ss5HwUqKvu
	 B98nePFTXvaMUi97S9HLuLfy9GL4QvXknaLMweV9BTuAEF0Ctn6OpRlYU96CraofYf
	 yU6GLzDAmBsfA==
Date: Fri, 23 Sep 2022 22:25:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH] PCI: fu740: do not use clock name when requesting clock
Message-ID: <Yy4kOZDIUP7chGZp@spud>
References: <20220907054020.745672-1-uwu@icenowy.me>
 <20220923211439.GA1418979@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220923211439.GA1418979@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_142521_684627_6D0EAD47 
X-CRM114-Status: GOOD (  27.22  )
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
Cc: Rob Herring <robh@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 23, 2022 at 04:14:39PM -0500, Bjorn Helgaas wrote:
> On Wed, Sep 07, 2022 at 01:40:20PM +0800, Icenowy Zheng wrote:
> > The DT binding of FU740 PCIe does not enforce a clock-names property,
> > and there exist some device tree that has a clock name that does not
> > stick to the one used by Linux DT (e.g. the one shipped with current
> > U-Boot mainline).
> > 
> > Drop the name in the clock request, instead just pass NULL (because
> > this device should have only a single clock).
> 
> If you rework this for any reason, please capitalize the subject line
> to match the convention:

It prob needs a v2 because the first sentence of the commit message is
wrong, I recently added the binding enforcement.

Thanks,
Conor.

> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/log/drivers/pci/controller/dwc/pcie-fu740.c
> 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > ---
> >  drivers/pci/controller/dwc/pcie-fu740.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-fu740.c b/drivers/pci/controller/dwc/pcie-fu740.c
> > index 0c90583c078b..edb218a37a4f 100644
> > --- a/drivers/pci/controller/dwc/pcie-fu740.c
> > +++ b/drivers/pci/controller/dwc/pcie-fu740.c
> > @@ -315,7 +315,7 @@ static int fu740_pcie_probe(struct platform_device *pdev)
> >  		return dev_err_probe(dev, PTR_ERR(afp->pwren), "unable to get pwren-gpios\n");
> >  
> >  	/* Fetch clocks */
> > -	afp->pcie_aux = devm_clk_get(dev, "pcie_aux");
> > +	afp->pcie_aux = devm_clk_get(dev, NULL);
> >  	if (IS_ERR(afp->pcie_aux))
> >  		return dev_err_probe(dev, PTR_ERR(afp->pcie_aux),
> >  					     "pcie_aux clock source missing or invalid\n");
> > -- 
> > 2.37.1
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
