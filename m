Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3529D606A32F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 23:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c3haj7vg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PVnQXRQw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rDLu5YXFxCGcT+v/7cGZBRfbGtIedEgVm6SxOQUbZUo=; b=c3haj7vgevqyd387YTCGinFgGN
	zJq15idZAJ1v6ynRtCKruX4rqNpjCX6Q/3gd7uw3TIsz0aRYA0Oedy5UC8uNZsVeGsZ3NFJURBkT4
	WABQFX/j0BuZwjHydVV7384kWBLJzOkPSdr2jARv1B5kTKsL0NOf3VUZnLs0bDFr5WG5vuGLAiQE/
	uw/ikrz+fKK0BElo6nAnAGKOXIdNrlR+cYdvepI27MRm5EQO7mMtKmkyzQ+tfjI5n6wqzpYGxK0iP
	LRcZskT4zYsfh9cNzaRCer2pEXJStxmxOZmuv9tMbYBSftA/6GWqT03JuRV7K8XoMNRI9eD3kLK7F
	tzLbYU+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqOH-00000005uOL-1aNX;
	Tue, 27 Oct 2026 23:15:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqOG-00000005uO0-1ptM;
	Tue, 27 Oct 2026 23:15:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D51FC43E67;
	Tue, 27 Oct 2026 23:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875A81F01825;
	Tue, 27 Oct 2026 23:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793142935;
	bh=CA/7Tox0t7EgvF7I3HnmzpFFxPiq5q1ElSMkzQot6VE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=PVnQXRQwjWsHVoayiNThshV99xcymU/V/pIZswtKDDmYMDJnOaOF0e4WQ7NFLyn2U
	 hgbefSKUGrnKZ0wCwyAx6tS3q1iVEd2hqs5S1mvjxrh7pnqk7AkuDvh0wc0rFHGQZW
	 CCI0r4bHaPu9ujtyJPNsRSPmR/5zGCIWHZHLXZ5Wp8LZlMpqX2Pd+u+Ay/HTGI+req
	 r/99UDdROlN1XtaPaPQIWoAM1cKqtxREE8Szyk5HcNBzLT3i1yjFBRXX1sUwq8EkYr
	 wrMun3XHkKgkbcRXvN7v9s6BDe1OKuYAOrghVqQXkizpkbbFOoNsm+SD4JzlS8ufzX
	 6Z8j9YCxGv+ew==
Date: Tue, 27 Oct 2026 18:15:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, jingoohan1@gmail.com, imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/16] PCI: dwc: Cache PCIe capability offset
Message-ID: <20261027231534.GA520774@bhelgaas>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261027122827.2725643-1-18255117159@163.com>
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
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 08:28:11PM +0800, Hans Zhang wrote:
> Hi,
> 
> The DWC PCIe core and its platform drivers repeatedly call
> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to obtain the offset of the
> PCI Express Capability structure, including in paths that run more than
> once such as link polling, suspend/resume and interrupt handlers.
> 
> Add a cached pcie_cap field to struct dw_pcie and a
> dw_pcie_get_pcie_cap() helper that performs the lookup on first use and
> caches the result, then convert the core and the 14 platform drivers
> that use PCI_CAP_ID_EXP.
> 
> After this series, dw_pcie_find_capability(..., PCI_CAP_ID_EXP) no
> longer appears in drivers/pci/controller/dwc/ outside of the helper
> itself.
> ...

> base-commit: 4352b8aee98005853aa63f57d6377282de17a33f

This does indeed apply cleanly on 4352b8aee980 ("Merge tag
'i3c/for-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/i3c/linux"),
but that's pretty old and not really useful any more.

PCI topic branches are typically based on -rc1, but of course v7.4-rc1
hasn't been tagged.  Until it is, you can use pci/main as a good base.
It's currently 17bb0e2f6c80 ("Merge tag 'pci-v7.4-changes' of
git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci"), so
drivers/pci/ in v7.4-rc1 will be pretty close to that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
