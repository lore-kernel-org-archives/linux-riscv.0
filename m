Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44E0606A328
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 19:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kk2RuOUi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Lg2ZBkmh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=cFiunkQxzDu/+K8fh+iBVoj3UoZwgfHgbRXcmlsQ9fw=; b=Kk2RuOUiERsl3XPeaVFgmBWxsW
	wXae5v5Y8d1LmGhFvipb9+/xIBd2nbQ5KFFz3VxxTpSEbx9vHkn14o5ylHkrL1TSZdJqk7+CIAct2
	TPukrfcTO2FUGAPTxWw/x4HLIbpXRROeGy78ATxfsOfCfreY4ALvoQkIlFHYWRiEjyAncfZDZPzwX
	R6q9Uq/WIvzPI74wsPNnEJDmEFMcQUzYeD10YlrW5qOooKlR+1WE1b+hgBuoXUphFPuWeb1nRAjtC
	X1akhlyGZCXYHXkyRKNY7D3Omo6wtQRRiMezV/8kh/HejFsYnYpXUTrMBHwoLWAACeurShjRVrw4l
	dBq/8h5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2xC-0000000AIxp-31jI;
	Thu, 05 Nov 2026 19:16:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2x7-0000000AIxT-1qKb
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 19:16:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 576E960147;
	Thu,  5 Nov 2026 19:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D25801F000C1;
	Thu,  5 Nov 2026 19:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793906208;
	bh=e0BWnhNl7a2pPi8xA+Q0/ZqC7NPGJrybeKR7ZFEdk48=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=Lg2ZBkmhzpeqVo2McMUjpqVm89GQ8M7Aq8KwyCz6Yd2A6/UoE7uTkfLSLvRau4FrE
	 No7yRMoSqx8F0kNm/8n/roLaHFAlk2fr5Vr3BVTSj13DvKGMMga+6xQHXAWIH318eB
	 0T+sKmIpPN0YPtZF2TsKfDlfWD439i72XmKxR/0rIxl5JKVqUkk6j5EPB9yf1rlg6N
	 tNOCdSSYBkld2m8IBrCdUEEYr6/1bgHb5ZF3IAKjc8nUM5S6gIH3RoGEfpNuoMcxAn
	 DTWaxiZyINtJr4o2bqM1Jbk1s4qn4YadIEs/aXd+H4ovaI+aUpB3mFRxLG59PWuFvZ
	 h9SllyPeHnUrg==
Date: Thu, 5 Nov 2026 13:16:46 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Encrow Thorne <encrow.thorne@linux.spacemit.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Yixun Lan <dlan@kernel.org>, linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: spacemit: Ignore link partner PERST on K1
Message-ID: <20261105191646.GA1549319@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DMMXR8IGD585.1QXMWPOMI19UL@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 10:53:05AM +0800, Encrow Thorne wrote:
> On Thu Sep 24, 2026 at 10:23 AM CST, Troy Mitchell wrote:
> > On Thu Sep 24, 2026 at 10:04 AM +08, Encrow Thorne wrote:
> >> The K1 PCIe controller and PHY are affected by the PERST signal from
> >> the link partner during initialization. With some devices connected,
> >> this can prevent host initialization from progressing and cause the
> >> system to hang while probing the PCIe controller.
> >>
> >> Set PCIE_IGNORE_PERSTN before accessing the DBI registers. When set,
> >> this bit makes both the PCIe controller and PHY ignore the PERST
> >> signal from the link partner.
> >>
> >> This allows host initialization to complete without being affected by
> >> the link partner's PERST state.
> >>
> >> Signed-off-by: Encrow Thorne <encrow.thorne@linux.spacemit.com>
> > Fix tag and reported-by tag [1]?
> >
> > Link: https://lore.kernel.org/all/20260825052249.66921-1-bbanelli@gmail.com/ [1]
> 
> Thanks, I will add it in the next version.

If you haven't posted another version yet, s/PERST/PERST#/ in subject,
commit log, and comment to match spec usage.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
