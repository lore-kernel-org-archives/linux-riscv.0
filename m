Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98797C531CC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 22:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=FWW+nI1qAWxPShz9WvU1WN3M6bheeeFCVHb+NfYxqSQ=; b=A2ntMZuw4DmBOz
	1OsN4fcHKMiYWt+Q6o/hKAs72jEwURIVbPc8oSuJTZVjAVV9NepNUcHVAFbiRrD4PozSKzHL4MNfE
	Qv8xvfFlYYyxLRqhRtA4Mkc2WuxkY+uky7PwxCGq+t9hKveqpya/+jlUCK4stE3DmWpsjkxYWMlYN
	IcgTIqh8yXeN2/Kk1QMvXmtjz5gUCQj3RPa/AXJTZeL/91ECfH8SOoFdu1II2PfEnOEyddZiGGRI2
	tj4Sv+1BVC1PmgfCc2/Ish7Gm8ESNJ2XOdyFngQbsdXwfprDCIGUhyf413qER39RPGdDtKBXQqdny
	YSjgOCyvlr0WUjdsaIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1U8-0000000F97q-0v4P;
	Thu, 23 Jul 2026 22:01:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn1U7-0000000F97j-0s5e
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 22:01:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F2ABE60A62;
	Thu, 23 Jul 2026 22:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 776E01F000E9;
	Thu, 23 Jul 2026 22:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784844101;
	bh=OW/+87f6scqS9+baO5oS3wrBMXJyQ9fPEVbIi5XahiE=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=MjSCNQcVKVQv+ToMyLY8eAAyNOGdd5VUcZhTZEBbmzpXEiCMKNHyapzKUeB7ue6NA
	 org747FcrPp40vt7dWhc/j5vWPqZCR053IQzlYSKYJ5XkJvvahiW1zNE++zdFLAxf0
	 AaYuUGttAQzLVKNq7tsg4HyVnKqKZIa+3hTft3p6NYpcSWT/4SPnpE/rzyBlFYJHOe
	 eo00KRTion3zzkR5b3mggyKVtjlVWd1AMg4zpPNxrj7pB/L8asp/3SReYNPRyTdvfx
	 Vxnoj6/VA+iGK+IQKjNbTKt5vOz2z2pV9Ley4Zen/zaNFoYdgtnPtguCkZcKc+Q43J
	 ZSgdG7WZP1LHw==
Date: Thu, 23 Jul 2026 17:01:40 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Bjorn Helgaas <bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] PCI: Move Spacemit vendor and device IDs to
 linux/pci_ids.h
Message-ID: <20260723220140.GA865834@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <073fbf4b41804285b2df6fbb4efce0ed@realtek.com>
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

On Thu, Jul 23, 2026 at 01:19:47AM +0000, Ping-Ke Shih wrote:
> Hi PCI maintainers,
> 
> Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> wrote:
> > Move the vendor and device ID for the existing Spacemit K1 PCIe Root
> > Complex to include/linux/pci_ids.h. Also add K3's Root Complex device ID
> > to this header. This is done so that these values can be referenced in
> > the rtw89 driver to enable 36-bit DMA ability in it for WiFi to function
> > on the K3 Pico ITX board.
> > 
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 3 ---
> >  include/linux/pci_ids.h                       | 4 ++++
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > index be20a520255b6..f89c6d46c7684 100644
> > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > @@ -21,9 +21,6 @@
> > 
> >  #include "pcie-designware.h"
> > 
> > -#define PCI_VENDOR_ID_SPACEMIT         0x201f
> > -#define PCI_DEVICE_ID_SPACEMIT_K1      0x0001
> > -
> >  /* Offsets and field definitions for link management registers */
> >  #define K1_PHY_AHB_IRQ_EN                      0x0000
> >  #define PCIE_INTERRUPT_EN              BIT(0)
> > diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> > index 1c9d40e09107d..d6f26cacc8e35 100644
> > --- a/include/linux/pci_ids.h
> > +++ b/include/linux/pci_ids.h
> > @@ -2640,6 +2640,10 @@
> >  #define PCI_VENDOR_ID_SUNIX            0x1fd4
> >  #define PCI_DEVICE_ID_SUNIX_1999       0x1999
> > 
> > +#define PCI_VENDOR_ID_SPACEMIT         0x201f
> > +#define PCI_DEVICE_ID_SPACEMIT_K1      0x0001
> > +#define PCI_DEVICE_ID_SPACEMIT_K3      0x0002
> > +
> >  #define PCI_VENDOR_ID_HINT             0x3388
> >  #define PCI_DEVICE_ID_HINT_VXPROII_IDE 0x8013
> 
> As patch 2/2 obviously goes to wireless-next tree, can I take this 
> dependency patch to my tree? 

Yes, that's what my Acked-by at
https://lore.kernel.org/all/20260716164336.GA40813@bhelgaas means.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
