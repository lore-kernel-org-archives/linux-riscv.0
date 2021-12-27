Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F6C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 22:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ZPsxov/E8GI8svRe7AdweObm+Oi7Y8NfaAaZUZpl7RI=; b=AroOcu/mcH8MPp
	FVgSkLmfGj6V/z3lfRgi1+qd5CqDmp7HLMYOUxbV9IGmURP2f8TMPOAJNI3cHJWhWDJ4A/Cn0za+a
	wihiv3kBzHg7nMqtWM1k++S3WpthGbHvv4jAKqQkfQaPcqspIy5xKMp7w939OCEIGBapAGSnCHfsr
	9MRCjGcpC0Y0g/YKQgY8OIYtrGbt73XBNA5rZ3L4jF0oe8Ywuh9PhId/AxCeHwM01jogQZZXlekCD
	8zzhNpwM8pKbH54LPE6LevmwnJD5zzcnWMpXY+fe79b2h3E6XaqNIATgl1kj2YIH1GeVSXPjK3MMn
	O1jXj0BtU/zh13bFJ2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1y6s-00HVuc-Ns; Mon, 27 Dec 2021 22:04:50 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1y6p-00HVto-PS
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 22:04:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6948EB81151;
 Mon, 27 Dec 2021 22:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF63FC36AEA;
 Mon, 27 Dec 2021 22:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640642684;
 bh=WJL+K0hI3nwJke136i/0N4gSC4MX2UG4T24o5kI2ZCo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=LPLcrpwmwEpR6GXtmPDQxAS5U0HsQLi/CB9P+gregE+DcfQwu7ErElWcKXTZbMdU6
 XsCtsWEk0WBE+mdjM1tKbunFxcFQikU/+TA0D89rcFi86Y85WxzRdoIY86PRvjVdtG
 diIwKaiI3YvY4kYq43BX3PuQVbuHlqLoF3LUbX+n+6aL1J9DGg4HhKBvQx2P0XfAy7
 WusCUz7/Y5id3h1FfcJgYrgH5um91lNX8uL0nwr0Tpepdou9dSJJIXZ6GCtfCdLfBD
 LIlhhqwlkP3AiKo8eLFOy/k3gO8zizcoVOTtD8CF1BbmHHWy/myCg1kQ1We1WzE6Nq
 9m7bdLO4V7+kA==
Date: Mon, 27 Dec 2021 16:04:42 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 John Garry <john.garry@huawei.com>, Nick Hu <nickhu@andestech.com>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org
Subject: Re: [RFC 27/32] PCI/sysfs: make I/O resource depend on HAS_IOPORT
Message-ID: <20211227220442.GA1544995@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211227164317.4146918-28-schnelle@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_140448_165725_D1439DCA 
X-CRM114-Status: GOOD (  20.04  )
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

Make the subject match historical convention (capitalize "Make").

On Mon, Dec 27, 2021 at 05:43:12PM +0100, Niklas Schnelle wrote:
> Exporting I/O resources only makes sense if legacy I/O spaces are
> supported so conditionally add them only if HAS_IOPORT is set.

IIUC, the effect of this is that the "resource%d" file for an I/O BAR
still appears in /sys, but reads or writes will fail with ENXIO.
Worth mentioning that in the commit log, since one could interpret the
above as meaning that the "resource%d" file exists only if HAS_IOPORT
is set.  I think I will *exist* but not be very useful.

I also wonder what this looks like in the sysfs "resource" file and
via lspci.  I suppose it's useful if lspci shows the fact that the BAR
exists and is an I/O BAR, even if the arch doesn't set HAS_IOPORT.

> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/pci/pci-sysfs.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
> index cfe2f85af09e..a59a85593972 100644
> --- a/drivers/pci/pci-sysfs.c
> +++ b/drivers/pci/pci-sysfs.c
> @@ -1099,6 +1099,7 @@ static int pci_mmap_resource_wc(struct file *filp, struct kobject *kobj,
>  	return pci_mmap_resource(kobj, attr, vma, 1);
>  }
>  
> +#ifdef CONFIG_HAS_IOPORT
>  static ssize_t pci_resource_io(struct file *filp, struct kobject *kobj,
>  			       struct bin_attribute *attr, char *buf,
>  			       loff_t off, size_t count, bool write)
> @@ -1157,6 +1158,21 @@ static ssize_t pci_write_resource_io(struct file *filp, struct kobject *kobj,
>  
>  	return pci_resource_io(filp, kobj, attr, buf, off, count, true);
>  }
> +#else
> +static ssize_t pci_read_resource_io(struct file *filp, struct kobject *kobj,
> +				    struct bin_attribute *attr, char *buf,
> +				    loff_t off, size_t count)
> +{
> +	return -ENXIO;
> +}

I assume the sysfs infrastructure prevents or fails reads/write if
res_attr->read and res_attr->write are not set at all, so maybe we
wouldn't need the stubs if we did something like this?

    if (pci_resource_flags(pdev, num) & IORESOURCE_IO) {
  #ifdef CONFIG_HAS_IOPORT
      res_attr->read = pci_read_resource_io;
      res_attr->write = pci_write_resource_io;
      ...
  #endif
    } else {

> +static ssize_t pci_write_resource_io(struct file *filp, struct kobject *kobj,
> +				     struct bin_attribute *attr, char *buf,
> +				     loff_t off, size_t count)
> +{
> +	return -ENXIO;
> +}
> +#endif
>  
>  /**
>   * pci_remove_resource_files - cleanup resource files
> -- 
> 2.32.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
