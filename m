Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02175C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 20:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=008HiBueNAc16HyfQyajCEf3+W+lN766a7O+4yQDBX0=; b=pda5+Aj/hY0KRi
	UWH3s4DszRLEBUYhdhIr9sDFdInpJvJxdoOb+yaYQwlkgB3mLfbbwAH+8Roinnfbya+dxxrqLB92T
	dzekSnmYaZMzRXFJG3BY/U2X7YRmMxttSpP1Sr7iM9Fruzwi7P/+nBHtnodLUGxCqKraJGUZvo/Nv
	hLJd0Eb+GB9ysuuTXQZrmyDxCwEqBZzYbWAo9XXen4m9FOOWZXBwjLQWXlaFyiRD1zSfP+A66wTIv
	z3LuOzWWwa9hTrf/CE+A8Pu8Z7vZy34FS3WqLt82GqNnMGF3GvJWDQNCxUVduSIrGpNSEcK8Nr+/x
	V7igdSItl/3I2ALbzIsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1wjS-00HS50-5L; Mon, 27 Dec 2021 20:36:34 +0000
Received: from netrider.rowland.org ([192.131.102.5])
 by bombadil.infradead.org with smtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1wjO-00HS3r-FB
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 20:36:32 +0000
Received: (qmail 1062827 invoked by uid 1000); 27 Dec 2021 15:36:25 -0500
Date: Mon, 27 Dec 2021 15:36:25 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-usb@vger.kernel.org
Subject: Re: [RFC 31/32] usb: handle HAS_IOPORT dependencies
Message-ID: <YcojyRhALdm40gfk@rowland.harvard.edu>
References: <20211227164317.4146918-1-schnelle@linux.ibm.com>
 <20211227164317.4146918-32-schnelle@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227164317.4146918-32-schnelle@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_123630_703583_71FA8304 
X-CRM114-Status: GOOD (  18.86  )
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

On Mon, Dec 27, 2021 at 05:43:16PM +0100, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=n will result in inb()/outb() and friends
> not being declared. We thus need to guard sections of code calling them
> as alternative access methods with CONFIG_HAS_IOPORT checks. Similarly
> drivers requiring these functions need to depend on HAS_IOPORT.

A few things in here can be improved.

> 
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/usb/core/hcd-pci.c    |   3 +-
>  drivers/usb/host/Kconfig      |   4 +-
>  drivers/usb/host/pci-quirks.c | 127 ++++++++++++++++++----------------
>  drivers/usb/host/pci-quirks.h |  33 ++++++---
>  drivers/usb/host/uhci-hcd.c   |   2 +-
>  drivers/usb/host/uhci-hcd.h   |  77 ++++++++++++++-------
>  6 files changed, 148 insertions(+), 98 deletions(-)

> diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
> index ef08d68b9714..bba320194027 100644
> --- a/drivers/usb/host/pci-quirks.c
> +++ b/drivers/usb/host/pci-quirks.c

> +#ifdef CONFIG_USB_PCI_AMD
> +#if IS_ENABLED(CONFIG_USB_UHCI_HCD) && defined(CONFIG_HAS_IOPORT)

In the original, the following code will be compiled even if
CONFIG_USB_UHCI_HCD is not enabled.  You shouldn't change that.

>  /*
>   * Make sure the controller is completely inactive, unable to
>   * generate interrupts or do DMA.

> @@ -1273,7 +1277,8 @@ static void quirk_usb_early_handoff(struct pci_dev *pdev)
>  			 "Can't enable PCI device, BIOS handoff failed.\n");
>  		return;
>  	}
> -	if (pdev->class == PCI_CLASS_SERIAL_USB_UHCI)
> +	if (IS_ENABLED(CONFIG_USB_UHCI_HCD) &&
> +	    pdev->class == PCI_CLASS_SERIAL_USB_UHCI)
>  		quirk_usb_handoff_uhci(pdev);

Same idea here.

>  	else if (pdev->class == PCI_CLASS_SERIAL_USB_OHCI)
>  		quirk_usb_handoff_ohci(pdev);
> diff --git a/drivers/usb/host/pci-quirks.h b/drivers/usb/host/pci-quirks.h
> index e729de21fad7..42eb18be37af 100644
> --- a/drivers/usb/host/pci-quirks.h
> +++ b/drivers/usb/host/pci-quirks.h
> @@ -2,33 +2,50 @@
>  #ifndef __LINUX_USB_PCI_QUIRKS_H
>  #define __LINUX_USB_PCI_QUIRKS_H
>  
> -#ifdef CONFIG_USB_PCI
>  void uhci_reset_hc(struct pci_dev *pdev, unsigned long base);
>  int uhci_check_and_reset_hc(struct pci_dev *pdev, unsigned long base);
> -int usb_hcd_amd_remote_wakeup_quirk(struct pci_dev *pdev);
> +
> +struct pci_dev;

This can't be right; struct pci_dev is referred to three lines earlier.
You could move this up, but it may not be needed at all.

> diff --git a/drivers/usb/host/uhci-hcd.h b/drivers/usb/host/uhci-hcd.h
> index 8ae5ccd26753..8e30116b6fd2 100644
> --- a/drivers/usb/host/uhci-hcd.h
> +++ b/drivers/usb/host/uhci-hcd.h
> @@ -586,12 +586,14 @@ static inline int uhci_aspeed_reg(unsigned int reg)
>  
>  static inline u32 uhci_readl(const struct uhci_hcd *uhci, int reg)
>  {
> +#ifdef CONFIG_HAS_IOPORT
>  	if (uhci_has_pci_registers(uhci))
>  		return inl(uhci->io_addr + reg);
> -	else if (uhci_is_aspeed(uhci))
> +#endif

Instead of making all these changes (here and in the hunks below), you
can simply modify the definition of uhci_has_pci_registers() so that it
always gives 0 when CONFIG_HAS_IOPORT is N.

Alan Stern

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
