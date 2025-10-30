Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F113CCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 23:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2UKv4SGpzpawLUe0dZrOvRpHO/8lNK2FROXKz1TjBjY=; b=JQBCcgDeAPYOmS
	sL/a4TjQ9LCAmReEuWjZpH5eqsfEJptf3gKszSH4xHlYTsOQk6JVIfDpB5lfMfdHaYv5TX/XrisqO
	xXfr/ZApunzpymaNZTXN//CFMq7EYuRV5oNKPYzJej0FPLs7RlNQR8oAVdvgmoKDyTY/SQIq0zj+a
	ANFGbO0PePaJyeH8p0jsU5y3aW1vxkyH/rxm3DLH+Vv2BpVtetZtjkYQCiOrUA3h+UkphjrAD88Uq
	5QXdbf/t5Da0yd+2ZpJZglTxqU+UDVwBPde2i4iwuT9UyRepg2YK4CCZDf9g6oDMeMEVTK4QHqflE
	gDKKLkeMRL79pMFZCwOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbka-000000056hl-2t73;
	Thu, 30 Oct 2025 23:08:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEbkS-000000056gb-1ncE
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 23:08:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 649BB602E9;
	Thu, 30 Oct 2025 23:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89F8C4CEF1;
	Thu, 30 Oct 2025 23:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761865683;
	bh=Hhw2jTxSrvIEy2c0QEBAcQT6LpKNYPq4ieFoWvYy+PM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Cu7+0WuWK26SqRg2QXxQec4K85YUonv/QEL4nOlHAMH2Rfx2AEEyIsWIokySSoknL
	 IMegYPEIo3S/ZfBia6pXO6gQ0fo0lEVN+wsWYekUE/TJ1nITUf/JTkxfSU6aZOp0em
	 05+Xq8qrQONacUARBVl6CcglHO6YChgDoYk91nTNaFdax8IpzHs4uD1sN3r3LJBumD
	 DH8lHrJdDDmsEoqKJ9zE64StIYEQIZnjARLqYSPu9+JCyKxTvFbhieE4vh2B3XgnQs
	 ss08RhwhVBzaegeESDm8JN8Rbt0wv4OUSp7dl26Ax7EZKOSXmNJpMxxmDsDDgqQl8h
	 IsuyOVHmtM0Mg==
Date: Thu, 30 Oct 2025 18:08:01 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	robh@kernel.org, bhelgaas@google.com, dlan@gentoo.org,
	aurelien@aurel32.net, johannes@erdfelt.com, p.zabel@pengutronix.de,
	christian.bruel@foss.st.com, thippeswamy.havalige@amd.com,
	krishna.chundru@oss.qualcomm.com, mayank.rana@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com, shradha.t@samsung.com,
	inochiama@gmail.com, guodong@riscstar.com,
	linux-pci@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/7] PCI: spacemit: introduce SpacemiT PCIe host driver
Message-ID: <20251030230801.GA1660222@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251030220259.1063792-6-elder@riscstar.com>
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

In subject, capitalize "introduce" to match history.  Or you could
just use "Add ...", which has the advantage of being shorter.

On Thu, Oct 30, 2025 at 05:02:56PM -0500, Alex Elder wrote:
> Introduce a driver for the PCIe host controller found in the SpacemiT
> K1 SoC.  The hardware is derived from the Synopsys DesignWare PCIe IP.
> The driver supports three PCIe ports that operate at PCIe gen2 transfer
> rates (5 GT/sec).  The first port uses a combo PHY, which may be
> configured for use for USB 3 instead.
> ...

I guess this doesn't support INTx interrupts at all?

> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -509,6 +509,17 @@ config PCI_KEYSTONE_EP
>  	  on DesignWare hardware and therefore the driver re-uses the
>  	  DesignWare core functions to implement the driver.
>  
> +config PCIE_SPACEMIT_K1
> +	tristate "SpacemiT K1 PCIe controller (host mode)"

Move this to keep the menu items alphabetized by vendor.

> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on PCI && OF && HAS_IOMEM

I don't think you need PCI or OF.

> +	select PCIE_DW_HOST
> +	select PCI_PWRCTRL_SLOT
> +	default ARCH_SPACEMIT
> +	help
> +	  Enables support for the PCIe controller in the K1 SoC operating
> +	  in host mode.

Most help text includes both the vendor and the product line names.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
