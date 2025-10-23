Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC42CCD1BE
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 12:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LTjWd7qWLkmnsBcYQinY9qB0UPcoA39wmKMQcuotWXk=; b=KzfN6RnzASQXTm
	3Cn1AUm7IFvyMnrrMkFfDFnKi9q8vpGF7AU14DfubBYFgIUZjqXPrySNqedTO5uaT8m6JT20V+cXC
	r5BU0fsmI8R0X9qNUb+g5d+w7PzuTDaAa+LBpjivfEjjXhdojYPxfGERr9P8GoqhWShcTbiqwtUBA
	OCG1qaRBDCCYCvpjFE1o3bZqB37dYthoc3V3k76k315vN6at9pfUiiNQAurf71C8HqKAb1S/JU8Kp
	zA4Q8Z6B/RQ9Oz3SBeEYuLAQ4ACBQONntuIeWUcszj0J6PdPIetQ9VAhEG7lGsNNsH27MQIskG1gc
	7mBhGwPs4H7LKmZ02vGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuMc-00000006EW8-1Pn1;
	Thu, 23 Oct 2025 12:24:18 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuMZ-00000006EVh-2ikr
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 12:24:17 +0000
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 59NCC0oR040580
	for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 20:12:00 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 59NC80MN038496
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Oct 2025 20:08:00 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS31.andestech.com (10.0.1.89)
 with Microsoft SMTP Server id 14.3.498.0; Thu, 23 Oct 2025 20:08:00 +0800
Date: Thu, 23 Oct 2025 20:07:53 +0800
From: Randolph Lin <randolph@andestech.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <jingoohan1@gmail.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
        <kwilczynski@kernel.org>, <robh@kernel.org>, <bhelgaas@google.com>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <alex@ghiti.fr>,
        <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <ben717@andestech.com>,
        <inochiama@gmail.com>, <thippeswamy.havalige@amd.com>,
        <namcao@linutronix.de>, <shradha.t@samsung.com>, <pjw@kernel.org>,
        <randolph.sklin@gmail.com>, <tim609@andestech.com>
Subject: Re: [PATCH v8 4/5] PCI: andes: Add Andes QiLai SoC PCIe host driver
 support
Message-ID: <aPoamRtpsT-MK9v0@swlinux02>
References: <20251014120349.656553-5-randolph@andestech.com>
 <20251021170516.GA1193376@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251021170516.GA1193376@bhelgaas>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 59NCC0oR040580
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_052416_037050_07C0A03F 
X-CRM114-Status: GOOD (  24.49  )
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

Hello Bjorn,
On Tue, Oct 21, 2025 at 12:05:16PM -0500, Bjorn Helgaas wrote:
> [EXTERNAL MAIL]
> 
> On Tue, Oct 14, 2025 at 08:03:48PM +0800, Randolph Lin wrote:
> > Add driver support for DesignWare based PCIe controller in Andes
> > QiLai SoC. The driver only supports the Root Complex mode.
> 
> > + * Setup the Qilai PCIe IOCP (IO Coherence Port) Read/Write Behaviors to the
> > + * Write-Back, Read and Write Allocate mode.
> 
> s/Setup/Set up/
> s/Qilai/QiLai/
> 

ok

> > + * The QiLai SoC PCIe controller's outbound iATU region supports
> > + * a maximum size of SZ_4G - 1. To prevent programming failures,
> > + * only consider bridge->windows with sizes within this limit.
> > + *
> > + * To ensure compatibility with most endpoint devices, at least
> > + * one memory region must be mapped within the 32-bits address space.
> > + */
> > +static int qilai_pcie_host_fix_ob_iatu_count(struct dw_pcie_rp *pp)
> > +{
> > +     struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +     struct device *dev = pci->dev;
> > +     struct resource_entry *entry;
> > +     /* Reserved 1 ob iATU for config space */
> > +     int count = 1;
> > +     bool ranges_32bits = false;
> > +     u64 pci_addr;
> > +     u64 size;
> > +
> > +     resource_list_for_each_entry(entry, &pp->bridge->windows) {
> > +             if (resource_type(entry->res) != IORESOURCE_MEM)
> > +                     continue;
> > +
> > +             size = resource_size(entry->res);
> > +             if (size < SZ_4G)
> > +                     count++;
> > +
> > +             pci_addr = entry->res->start - entry->offset;
> > +             if (pci_addr < SZ_4G)
> > +                     ranges_32bits = true;
> > +     }
> > +
> > +     if (!ranges_32bits) {
> > +             dev_err(dev, "Bridge window must contain 32-bits address\n");
> > +             return -EINVAL;
> 
> Is this really a PCI host controller driver probe failure?  I assume
> there are devices that only have 64-bit BARs and could work fine
> without a 32-bit window?
> 
> If a device requires a 32-bit BAR, and the PCI core can't assign such
> an address, and gracefully decline to enable a device where we
> couldn't assign the BAR, I think that would be preferable and would
> identify the specific device that doesn't work.
>

I have a clear understanding of the meaning behind this.
However, based on reviewer Niklas's suggestion, I have decided to use patch [1].
As a result, the function that adjusts the number of ib/ob window is no longer needed.

[1]: https://lore.kernel.org/linux-pci/aPDObXsvMoz1OYso@ryzen/T/#m11c3d95215982411d0bbd36940e70122b70ae820

> > +     }
> > +
> > +     pci->num_ob_windows = count;
> > +
> > +     return 0;
> > +}
> 
Sincerely,
Randolph Lin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
