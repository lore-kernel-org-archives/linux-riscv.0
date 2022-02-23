Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9798BC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 21:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDNfEE4Qmj/vg3Z7uYB8K+/ks6lsdktDmqc84poOBoA=; b=FE+vkn31ozHErm
	xX3awBI7rbUTfbv+pgXtSkAyFOCqSz3OPaJiY/o9LWLegiJOEg1DPDTYpZp0KTjZZ7VqDoGwSHLZP
	okAR4PjxY3fgJjGFrwL5+APBJKQ8EWtT90+OpBHYWt43wvpztq6p3HhUpZVWeCzZVQxo2stdoJOIo
	ggInwHJIoFuW8r64GzSl0RYSa/E41jcNKGPT0AaJIVzQmpzX+HAm7Zx6/uarAeNXzbrpvFSpA14XX
	Lp35v3hVDrBcTNd0S0Y/QgwtdNprO6+24In3sFZBa05GS45L4QYpZwyyzHhK6QJ+GDa94lha5dSBp
	SUJJ8UxQkL5AWOvZvoYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMz3E-00G5J9-7m; Wed, 23 Feb 2022 21:19:56 +0000
Received: from angie.orcam.me.uk ([2001:4190:8020::34])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMz3A-00G5IC-TY
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 21:19:54 +0000
Received: by angie.orcam.me.uk (Postfix, from userid 500)
 id 7946892009C; Wed, 23 Feb 2022 22:19:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by angie.orcam.me.uk (Postfix) with ESMTP id 7324B92009B;
 Wed, 23 Feb 2022 21:19:47 +0000 (GMT)
Date: Wed, 23 Feb 2022 21:19:47 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Ben Dooks <ben.dooks@codethink.co.uk>, paul.walmsley@sifive.com, 
 greentime.hu@sifive.com, lorenzo.pieralisi@arm.com, robh@kernel.org, 
 kw@linux.com, bhelgaas@google.com, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCHv4 2/2] PCI: fu740: Force gen1 for initial device probe
In-Reply-To: <20220223205141.GA149346@bhelgaas>
Message-ID: <alpine.DEB.2.21.2202232100220.27002@angie.orcam.me.uk>
References: <20220223205141.GA149346@bhelgaas>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_131953_159480_9DEDA459 
X-CRM114-Status: GOOD (  14.75  )
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

On Wed, 23 Feb 2022, Bjorn Helgaas wrote:

> > +	dw_pcie_dbi_ro_wr_dis(dw);
> > +}
> > +
> >  static int fu740_pcie_start_link(struct dw_pcie *pci)
> >  {
> >  	struct device *dev = pci->dev;
> >  	struct fu740_pcie *afp = dev_get_drvdata(dev);
> >  
> > +	/* Force PCIe gen1 otherwise Unmatched board does not probe */
> > +	fu740_pcie_force_gen1(pci, afp);
> 
> I guess the "Unmatched" board is the only thing we need to care about
> here?  Are there or will there be other boards that don't need this?

 I wonder if this is the other side of a supposed erratum observed here:

<https://lore.kernel.org/all/alpine.DEB.2.21.2202010240190.58572@angie.orcam.me.uk/>

Downstream there's the same ASMedia ASM2824 PCIe switch whose downstream 
ports don't want to train with a Pericom part above Gen1.

 Of course we don't know an ASM2824 is there until we have successfully 
negotiated the link, so we may have to generalise my proposal if we can 
find a way similar to what I have done for U-boot that does not disturb 
Linux's operation.  This is because there are PCIe option cards out there 
with the ASM2824 onboard, so it could be possible for the problem to 
trigger anywhere where the conditions for the erratum are met.

 Also in that case retraining should work with the cap removed to get a 
higher final speed just as with the Pericom part.

  Maciej

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
