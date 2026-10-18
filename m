Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DE6CCF2C9
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Oct 2026 04:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qqQEjvL6ocVnljdPbFZik7GS+R8WdgnPnLpIBa1lAUY=; b=JdLwchXwQlKsxO
	A/LcffKL0F06ueP4t7+XzcN7XCKIlmKyrJDJk1d8fueWgrkvKODVoDELDqPVzg0bMsMX4TgKhwnxh
	hd/DMpVC4WJJalsa+8o6wQUQq3ik0fqHBECtOf+zIjr8n8n+06VPDnsb/Z16od6TO7QaiXWznAXUd
	WqOWJ/09rZ2FkV06i1I2XlieeB2/QW3cYlAdBBFCMGAz6UCGo9xeJRwdrCIKg6lFU7U1h2gMiZAHd
	ODww2TdPLCzCgRgpr8LW1U8+ML2dIpO2BR1GVMJAwUxixZIZndfzRsEIWwOOtiXyL3j1+yQtBiiUI
	fyTZoL1GFzL21+5ayXjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIUC-00000005W1n-0MIc;
	Sun, 18 Oct 2026 04:27:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIIUA-00000005W1g-2YpF
	for linux-riscv@lists.infradead.org;
	Sun, 18 Oct 2026 04:27:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 771CC60230;
	Sun, 18 Oct 2026 04:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E97A91F000C6;
	Sun, 18 Oct 2026 04:26:54 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] PCI: spacemit: Ignore link partner PERST on K1
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Encrow Thorne <encrow.thorne@linux.spacemit.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, linux-pci@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com>
References: <20260924-spacemit-k1-pcie-fix-v1-1-002b5c1ba9fc@linux.spacemit.com>
Date: Sun, 18 Oct 2026 09:56:35 +0530
Message-Id: <179229759512.2114.3306580489141327360.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1642;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=+JZBFoP6UNzCFMG8ksizQMfuFaGhbvgaHgjE0pQtPfU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq1EqICXdhzjUEDQMjpvZ3wE8aqjI6trQnPERXd
 f3BCRP+uG+JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCatRKiAAKCRBVnxHm/pHO
 9RhIB/0UnDR/cESj/ARcD4ltFPWMso/Y5xVbiFQY1/4b25i2qjtVDRbpD7lI1LAgivEOE5F0p2J
 f4YHBCbHjrJOTHsTWR6Ytqe4LD2d4Os3j19iUkzQRmEGw+tIeHY8pAhTeOk57zdKRAXt7DMqgYw
 srp8+/o8jR9O6VbQN/GCaPSOCoxscKPxbUuYJYCISRR428OYkmUWOKEPZ6/a2zASB09HG2JI1ac
 Qd74hdQr3HJGVUIprrUFwQUfHMgSRIAjQidIWMV7mXJ6TnIScvP7G33ipEunr7F2KSuk9Ocgtr3
 4NxELV3NJebnOqeLgHZVZ5663Q9mEYHelv4z6u+iA5xndgYT
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-09-24 10:04 +0800, Encrow Thorne wrote:
> The K1 PCIe controller and PHY are affected by the PERST signal from
> the link partner during initialization. With some devices connected,
> this can prevent host initialization from progressing and cause the
> system to hang while probing the PCIe controller.
> 
> Set PCIE_IGNORE_PERSTN before accessing the DBI registers. When set,
> this bit makes both the PCIe controller and PHY ignore the PERST
> signal from the link partner.
> 
> This allows host initialization to complete without being affected by
> the link partner's PERST state.
> 
> Signed-off-by: Encrow Thorne <encrow.thorne@linux.spacemit.com>
> ---
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index 0564c46e2f48..98f067e1ba81 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -44,6 +44,7 @@
>  
>  #define PCIE_CONTROL_LOGIC			0x0004
>  #define PCIE_SOFT_RESET			BIT(0)
> +#define PCIE_IGNORE_PERSTN			BIT(2)
>  
>  struct k1_pcie {
>  	struct dw_pcie pci;
> @@ -137,6 +138,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * When set to 1, the PCIe controller and PHY ignore the PERST signal
> +	 * from the link partner in both RC and EP modes.
> +	 */

What? PERST# is an output signal to RC and input to Endpoint. PERST# is not
controlled by the Endpoint, but only by the RC/host.

- Mani


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
