Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BB9C44536
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 23:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=7+tk7WnBkoyZUo6Xhkk6/HYU46EVflLQzAvEgcOiTYg=; b=XI+noBtOWQIqBM
	pwNoP+Y6DOx6eKypnWfrrLSMKiqOUjLcgN99A6pR/BweKQnut4j/k2UDJhOv7DXOqbidoG7A108st
	ilMfk6gj+a2Lyb/ii/zr3LCeLaMVR9yKub4t3YwZvVyX3/ls7vVah05x+kQxwgDwhVVxTfPM9LEN3
	f5mtGUAQElw7/8wqGlkvZkNyXO7OWpfmqoTj7VnQhZuBNItw8vxNbZXvi9irTpIDmw9WZf8Nt5GLi
	knFRzfjejzaK//1bYVZjJUTFUCs5+M4Lg2KOGcEM4LCRv6VL/uuWG1Fr/n/mLnR6pd3sqWatUIVtF
	2JB5Jy/lB676xxz6hk5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihm5-00000006BLU-1fOR;
	Wed, 21 Jan 2026 23:38:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vihm2-00000006BL7-49Ge
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 23:38:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A474041697;
	Wed, 21 Jan 2026 23:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A20C4CEF1;
	Wed, 21 Jan 2026 23:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769038685;
	bh=weaJN1Iequ/ZyzA1DPueH31401FC5DUZbpwwcPNyzmQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BeikHttwrCy8vR2Z2txVC+OK5mggBSlKkHUlak+4qJNsLFrRy2lVin2znkr8uhTQV
	 hDrmRILtEmj7vUJozkGZqTtkC7jUFLFbW93vmaGTVqr/Sn5lqEpjj1cfK583XK2h1W
	 cWE3lMXXh6kONxTUrzilJiZU5A5Y89Zu2yn7RIUyGceGoUtYvSK8Y5rNZvlAy9u9iN
	 R2s2BfJMHAxgIvFEovn2WRV21tJsbeLz8tsu8o8CSDoBDHmaPSHQj2jCW8PFkiE8aJ
	 ocO0pWswC8u3eMGvxOnwCJab2Y+7vdjDnkfCiO1CZLrXf1aJX6D22EoP5AUFp1+EdI
	 qGoPNveHv3RcA==
Date: Wed, 21 Jan 2026 17:38:04 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Creeley, Brett" <bcreeley@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH v2 2/4] PCI/MSI: Check msi_addr_mask in
 msi_verify_entries()
Message-ID: <20260121233804.GA1221537@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260121-pci-msi-addr-mask-v2-2-f42593168989@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_153807_073692_C59D18A0 
X-CRM114-Status: GOOD (  19.44  )
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

[+cc Thomas, thread at https://lore.kernel.org/r/20260121-pci-msi-addr-mask-v2-0-f42593168989@iscas.ac.cn]

On Wed, Jan 21, 2026 at 11:49:38AM +0800, Vivian Wang wrote:
> Instead of a 32-bit/64-bit dichotomy, check the MSI address against
> msi_addr_mask.
> 
> This allows platforms with MSI doorbell above 32-bit address space to
> work with devices without full 64-bit MSI address support, as long as
> the doorbell is within addressable range of MSI of the device.
> 
> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
> 
> ---
> v2: No changes
> ---
>  drivers/pci/msi/msi.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 48f5f03d1479..2ecbcd6c436a 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -321,14 +321,17 @@ static int msi_setup_msi_desc(struct pci_dev *dev, int nvec,
>  static int msi_verify_entries(struct pci_dev *dev)
>  {
>  	struct msi_desc *entry;
> +	u64 address;
>  
>  	if (dev->msi_addr_mask == DMA_BIT_MASK(64))
>  		return 0;
>  
>  	msi_for_each_desc(entry, &dev->dev, MSI_DESC_ALL) {
> -		if (entry->msg.address_hi) {
> -			pci_err(dev, "arch assigned 64-bit MSI address %#x%08x but device only supports 32 bits\n",
> -				entry->msg.address_hi, entry->msg.address_lo);
> +		address = (u64)entry->msg.address_hi << 32 |
> +			  entry->msg.address_lo;
> +		if (address & ~dev->msi_addr_mask) {
> +			pci_err(dev, "arch assigned 64-bit MSI address %llx above device MSI address mask %llx\n",

Use %#llx so it's clear these addresses are hex.  The previous message
did that, not sure why you dropped it.

> +				address, dev->msi_addr_mask);
>  			break;
>  		}
>  	}
> 
> -- 
> 2.52.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
