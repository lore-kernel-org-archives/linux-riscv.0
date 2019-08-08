Return-Path: <SRS0=gQVT=WE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DAC4C433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2019 21:47:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B97D21874
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2019 21:47:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Goi+UkjA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="opUMVt0G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B97D21874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mKIJwMLkL8eZgeHBFX09/9L7VJ6Ij5fau4aro1LBlEE=; b=Goi+UkjAAp+0DG
	n2PK16E5AaGnqpoctwrLVgO61fM6LPxsA/R8v0oQ1hnE4dLpvoRh5x52iOkWO1YcTy2Q8+Z6XJWV4
	oPBSIYFYoeTnQB1nm8Z5DeLZFxEeby0EXP8vaf9dt3vM3GSfOABnJvNQBXqi2nv7eY/zzLeksCOyF
	5fH6rNfQrRCGepPn3bX68/SIemTLP3dAOF5fTuTLulpN0NhzFplwIg2Ejlu+SHLJAfExahztE/bBi
	Gpp04tf+pgsiveG/7ZcX8UHHzyM9Ru9YdwYhXlE9P29aGjaamM3loXw6tQ3/IiasSBjgjQqnL/GaX
	bvYMPFSwZzbzWQLv4mXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvqFv-00025l-1e; Thu, 08 Aug 2019 21:47:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvqFt-00025S-HF
 for linux-riscv@lists.infradead.org; Thu, 08 Aug 2019 21:47:30 +0000
Received: from localhost (unknown [150.199.191.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E9BA021874;
 Thu,  8 Aug 2019 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565300849;
 bh=vG7jKkEd8XcA9+P2LeOF6CIxzYS5OeGuGE45x2CRGSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=opUMVt0G8O9WCbMpvtgG81GcK9OmkTHd8OQ7YfusFWIzrAVFBCybyjtsfn9Uw+7xN
 Xb1yeoZLxo4lZAHUdD2CMnGhv7CdnbDf2uFzuMrFcXQ3Pf80HWHMbaw+38Bi31odbX
 abWk6E491TFBB96Ac8IIAIBJ02cp9J3AXMvuiiVg=
Date: Thu, 8 Aug 2019 16:47:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] pci: Kconfig: select PCI_MSI_IRQ_DOMAIN by default on
 RISC-V
Message-ID: <20190808214728.GC7302@google.com>
References: <alpine.DEB.2.21.9999.1907251426450.32766@viisi.sifive.com>
 <20190808195546.GA7302@google.com>
 <alpine.DEB.2.21.9999.1908081349210.6414@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1908081349210.6414@viisi.sifive.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_144729_620229_882DCDE0 
X-CRM114-Status: GOOD (  27.26  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Wesley Terpstra <wesley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 08, 2019 at 01:51:50PM -0700, Paul Walmsley wrote:
> On Thu, 8 Aug 2019, Bjorn Helgaas wrote:
> > On Thu, Jul 25, 2019 at 02:28:07PM -0700, Paul Walmsley wrote:
> > > From: Wesley Terpstra <wesley@sifive.com>
> > > 
> > > This is part of adding support for RISC-V systems with PCIe host 
> > > controllers that support message-signaled interrupts.
> > > 
> > > Signed-off-by: Wesley Terpstra <wesley@sifive.com>
> > > [paul.walmsley@sifive.com: wrote patch description; split this
> > >  patch from the arch/riscv patch]
> > > Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> > > ---
> > >  drivers/pci/Kconfig | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> > > index 2ab92409210a..beb3408a0272 100644
> > > --- a/drivers/pci/Kconfig
> > > +++ b/drivers/pci/Kconfig
> > > @@ -52,7 +52,7 @@ config PCI_MSI
> > >  	   If you don't know what to do here, say Y.
> > >  
> > >  config PCI_MSI_IRQ_DOMAIN
> > > -	def_bool ARC || ARM || ARM64 || X86
> > > +	def_bool ARC || ARM || ARM64 || X86 || RISCV
> > 
> > The other arches listed here either supply their own include/asm/msi.h
> > or generate it:
> > 
> >   $ ls arch/*/include/asm/msi.h
> >   arch/x86/include/asm/msi.h
> > 
> >   $ grep msi.h arch/*/include/asm/Kbuild
> >   arch/arc/include/asm/Kbuild:generic-y += msi.h
> >   arch/arm64/include/asm/Kbuild:generic-y += msi.h
> >   arch/arm/include/asm/Kbuild:generic-y += msi.h
> >   arch/mips/include/asm/Kbuild:generic-y += msi.h
> >   arch/powerpc/include/asm/Kbuild:generic-y += msi.h
> >   arch/sparc/include/asm/Kbuild:generic-y += msi.h
> > 
> > For example, see
> > 
> >   f8430eae9f1b ("PCI/MSI: Enable PCI_MSI_IRQ_DOMAIN support for ARC")
> >   be091d468a0a ("arm64: PCI/MSI: Use asm-generic/msi.h")
> >   0ab089c2548c ("ARM: Add msi.h to Kbuild")
> > 
> > I didn't look into the details of msi.h generation, but I assume
> > RISC-V needs to do something similar?  If so, I think that should be
> > part of this patch to avoid issues.
> > 
> > If CONFIG_GENERIC_MSI_IRQ_DOMAIN is defined, include/linux/msi.h
> > #includes <asm/msi.h> and I don't see where that would come from.
> 
> Commit 251a44888183 ("riscv: include generic support for MSI irqdomains") 
> has been merged upstream for this purpose:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=251a44888183003b0380df184835a2c00bfa39d7
> 
> The original patch was split into a RISC-V component and a generic PCI 
> component to reduce the risk of merge conflicts.
> 
> Does that work for you?

Indeed, sorry I missed it.  I generally work based on -rc1, and it
looks like 251a44888183 was merged after -rc1.

Since we're after the merge window, the default target would be v5.4,
but I see some post-rc1 pull requests from you, so if you need this in
v5.3, let me know.

I applied your patch to pci/msi for v5.4 for now.

Bjorn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
