Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B8CC44512
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 16:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=YxDZWbRrWuucWrFc5WAn6igtMRcu6xtkgy6BLonIByg=; b=s8rL36omrjoSTi
	ERn+9CDPJGdkY3nzftdPrxw+mQPLX9U9SyBitpkZpNDrGoUI40jzrUC+noP/8ehWko5qN7S0sLGkx
	iXo504KRSgdEqmQ61rsftOHQJ/S/HK4QVjjnpGHDCW+So9TcyV6gnyDFSg1pKMgIe9wYeYHNd2Mcc
	gOIBXHE2wHkPjMzzmGrOSZPIiD6VQDPIbOLx6H8ZRnnFAmhUoLpaRBR/cQEpdqrMS55ewPcv0TW1W
	HGI2cxERxgYWLvJHHcC+5ZD9YiFnQ7Ej5DrCC0BK8I3Ry8VT9GChZgeLQbQOA2Gdsxktci70mCgE9
	d36gOJJ4qK1BUU9bPzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPBU-00000000CEF-3tO4;
	Thu, 16 Jul 2026 16:43:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPBS-00000000CE5-3YWA
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 16:43:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 26C2F60A61;
	Thu, 16 Jul 2026 16:43:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CF91F000E9;
	Thu, 16 Jul 2026 16:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784220217;
	bh=uqfDMBky8ltos50nXdtqbBp/S+h2mdqQ130ynwz+gXE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=kGu44DrrjOKxlgbOcTiOuR1I/XNU2QiBR684H1vljQJXdas5Tzoj8WFgGq18y8Mlb
	 FTAtzUdlbr/OsvG55DWfX3M0V/K678nWbV4pH4Xcu0NY10xioGPGfxM3yFVRXieYbd
	 9Jtb68tARNAkX2cHgedXpUU9r44uDsW48K6q38H6hhxDbxfjbL+iqTar6vahWDD/hA
	 URrFDmx/r7ROje1vVzSFPhRpYQoYQYCKFAjzmbQmO4bplQzKYnuFT96LwM9a0N6Y1n
	 UcmE0g19yVWfd0PcPbKERL1iST9NijbSaMtQuf5KkQy6h5/ZRBn164en3PGbxv0oiX
	 A87mCkzrLrSbg==
Date: Thu, 16 Jul 2026 11:43:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>,
	Ping-Ke Shih <pkshih@realtek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/2] PCI: Move Spacemit vendor and device ID to
 linux/pci_Ids.h
Message-ID: <20260716164336.GA40813@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260715-rtw89-spacemit-k3-v1-1-e577bc63706b@oss.tenstorrent.com>
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

On Wed, Jul 15, 2026 at 10:21:54PM -0500, Anirudh Srinivasan wrote:
> Move the vendor and device IDs for Spacemit PCIe Root Complexes to
> include/linux/pci_ids.h so that they can be referenced elsewhere.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

To help motivate this patch, it would be nice to say specifically
where PCI_VENDOR_ID_SPACEMIT will be used.

In subject line, s/pci_Ids.h/pci_ids.h/

> ---
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 4 ----
>  include/linux/pci_ids.h                       | 4 ++++
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index 680acc93f5395..7b0bc1802954a 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -21,10 +21,6 @@
>  
>  #include "pcie-designware.h"
>  
> -#define PCI_VENDOR_ID_SPACEMIT		0x201f
> -#define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
> -#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
> -
>  /* Offsets and field definitions for link management registers */
>  #define K1_PHY_AHB_IRQ_EN			0x0000
>  #define PCIE_INTERRUPT_EN		BIT(0)
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 1c9d40e09107d..d6f26cacc8e35 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2640,6 +2640,10 @@
>  #define PCI_VENDOR_ID_SUNIX		0x1fd4
>  #define PCI_DEVICE_ID_SUNIX_1999	0x1999
>  
> +#define PCI_VENDOR_ID_SPACEMIT		0x201f
> +#define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
> +#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
> +
>  #define PCI_VENDOR_ID_HINT             0x3388
>  #define PCI_DEVICE_ID_HINT_VXPROII_IDE 0x8013
>  
> 
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
