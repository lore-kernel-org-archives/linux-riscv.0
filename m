Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE7DC83035
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=V6jZsNoqtNPrkqjpfa2rl3gCsqhaN/T9AE+XENUdm0E=; b=TWxksmeloTHMis
	rrjYemtH3P50QQe1e9MEU5Nj4QMPO3R4cU2omSncXx/PYRkVWIt7qX1elCQTVMPP4NquQ4b1LOo8c
	8MkbyDdbH14xKXjmiB6NHHSthQGKaU7xgDVlPFVI+GmRqwUks2osUjFAH1ffYwPQM11ZNP/ZASTHs
	LM/S1n9kez8ZFJzF7F/+cNUpuX+gxFlfLQHWZzHJt0cy/WU6fbAIx+k5BFf2fSzfhnX9Xjre9q3i6
	H5qIXiZI50+gQ5v4ypI7UivpuadNI11rtB5g5F2uWdgLZuzlOiy9ui2PbA9tf0epoyvQQggmr4HDQ
	FNg0VLPN+yK/81Vlifyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1b-000000039hr-0UxR;
	Mon, 30 Jun 2025 18:14:39 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIOY-000000035Ln-35gX;
	Mon, 30 Jun 2025 17:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBFE2A53459;
	Mon, 30 Jun 2025 17:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE78C4CEEF;
	Mon, 30 Jun 2025 17:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751304857;
	bh=TaK2FH9yiJmwJGSGOTvljnkUt8CYe3d5qFJFNNZcc/8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rJLQgmbt/DWmf4OmbJ0sQ8HOx5dQ42qQd0nK3vrJk8SDsdQq9pFGyR0MDLhz/FgQ4
	 8MdSqlyR+6NtxNLev58EJYpKPdaXTvvwRqT1Jjn3yvuX8Ig8MsZ+lUDpKZ5qERn851
	 d8o46yAD1RVx7OqwjKTAtG2cMRSLAG9vtFP7YX4w0/Y9+3++tSww8L9ENtdRmJzYYe
	 2tuL8S1OAKjPuaD733BRP/dvSN3vaxcrZHetDiYKI5ZJa2hPCyz3044QAx1/dSMr0b
	 SM9K525UNRUruJM5XR/Dd0LDH9N57GzTGODhjUSLjluIyi0KTOUws0oLwNN2F/7BHQ
	 F/2Ll3fpXF+TQ==
Date: Mon, 30 Jun 2025 12:34:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] PCI: host-generic: Fix driver_data overwriting bugs
Message-ID: <20250630173415.GA1787642@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <86ikkdb0uj.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_103418_847345_5F413126 
X-CRM114-Status: GOOD (  24.73  )
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

On Mon, Jun 30, 2025 at 06:23:00PM +0100, Marc Zyngier wrote:
> On Mon, 30 Jun 2025 18:06:01 +0100,
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> > 
> > On Wed, Jun 25, 2025 at 12:18:03PM +0100, Marc Zyngier wrote:
> > > Geert reports that some drivers do rely on the device driver_data
> > > field containing a pointer to the bridge structure at the point of
> > > initialising the root port, while this has been recently changed to
> > > contain some other data for the benefit of the Apple PCIe driver.
> > > 
> > > This small series builds on top of Geert previously posted (and
> > > included as a prefix for reference) fix for the Microchip driver,
> > > which breaks the Apple driver. This is basically swapping a regression
> > > for another, which isn't a massive deal at this stage, as the
> > > follow-up patch fixes things for the Apple driver by adding extra
> > > tracking.
> > 
> > Is there a bisection hole between patches 1 and 2?
> > 
> >   1: PCI: host-generic: Set driver_data before calling gen_pci_init()
> >   2: PCI: apple: Add tracking of probed root ports
> > 
> > If so, would it be practical to avoid the hole by reordering those
> > patches?
> 
> Sure, but you said you already had queued patch #1, and what is in
> -rc1 already breaks Geert's box. So no matter the order, we break
> something at some point.

I did, but when I saw your problem report and subsequent updates, I
put Geert's patch on hold.

> If you want to only break one thing, then yes, swapping these two
> patches is the correct thing to do.

I swapped them and put them back on pci/for-linus for v6.16:

  https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git/log/?h=for-linus&id=ba74278c638d

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
