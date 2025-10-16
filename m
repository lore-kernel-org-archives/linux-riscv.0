Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4DD8CCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 11:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qr5WvHuonQmYBveBZcjioc0XiBL8UecGMogO4+HYhYo=; b=ECMPN/gw8pYZat
	dHLWociKk+VQyP6UXS6P8lkKul8uNX8GD7HW8vffBia1SjldaD1zFRTaArI/alk+QcRCWvVXSAUbX
	9Ci77lvLpVIJOdHkyb6EOKv5Re8Qs9QsDx+B++6BeM0uPb5G80xmrwU4m4T6PkZ3sKqFlxBhbbFjE
	EQ7UwCVbZG4UaYvWA9CASyuC4BZtHQDL7pofjFbkmGtuyEffDJNT8ZE7L0ORDUsJ7CsPxksZ0UZuC
	Tp23Idzmu3il9+Sa5t+orqJ1WXD4GvACO+mB0MEmeJpTghLzdidgpqYcbVWhRrrAocmDgLvXfSgVB
	VnsaKRmz9xxNz7aJZqhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Lyo-00000004XNx-3JCF;
	Thu, 16 Oct 2025 11:17:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Lyn-00000004XMx-188l
	for linux-riscv@bombadil.infradead.org;
	Thu, 16 Oct 2025 11:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZYlnRbR85BMI5xfmS2JQ4t6NckrSBoGG/E3T6d+H0Bk=; b=axQTpyFbgELqsU5vcbq2Vb8zKk
	sy9VLb8rdr2P6HhIWF9/Q5WRCq161hR+YyJbdnh0h7eQ3eZWGTCmLBZivHigIGXwsS1kqhE1eonfy
	u5B4YGR5T0FZh9j9q9fi3dYxTXd9y5E7Ghe9JwkfzIxrbiarUIjna9Aem58pl8Zb/bYEz7oplOJ9T
	Bl3l6xPpibMbLetGEf4jVJzEgP7+hYiC1C7a9il6oUm0kw2gIU9uzuvtOOEXIuzQFKP6El0/AD1Bc
	51RNMWR/GABnC47XoooX+QfRYztDCPe5TcSxZB7jI9Bwfm5U45z1zZTIWydDQK+y3buhcRAJPleQJ
	dG13cWug==;
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Ly8-00000001vtY-1jKC
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 11:16:41 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 59GBCfS4020808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Oct 2025 19:12:41 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS31.andestech.com (10.0.1.89)
 with Microsoft SMTP Server id 14.3.498.0; Thu, 16 Oct 2025 19:12:41 +0800
Date: Thu, 16 Oct 2025 19:12:36 +0800
From: Randolph Lin <randolph@andestech.com>
To: Niklas Cassel <cassel@kernel.org>
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
Subject: Re: [PATCH v6 1/5] PCI: dwc: Allow adjusting the number of ob/ib
 windows in glue driver
Message-ID: <aPDTJKwmpxolGEyj@swlinux02>
References: <20251003023527.3284787-1-randolph@andestech.com>
 <20251003023527.3284787-2-randolph@andestech.com>
 <aO4bWRqX_4rXud25@ryzen>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aO4bWRqX_4rXud25@ryzen>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 59GBCfS4020808
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_121630_199561_E9F14202 
X-CRM114-Status: GOOD (  20.51  )
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

Hi Niklas,

On Tue, Oct 14, 2025 at 11:43:53AM +0200, Niklas Cassel wrote:
> [EXTERNAL MAIL]
> 
> On Fri, Oct 03, 2025 at 10:35:23AM +0800, Randolph Lin wrote:
> > The number of ob/ib windows is determined through write-read loops
> > on registers in the core driver. Some glue drivers need to adjust
> > the number of ob/ib windows to meet specific requirements,such as
> 
> Missing space after comma.
> 
> 

Thanks a lot. I will fix it in the next patch.

> > hardware limitations. This change allows the glue driver to adjust
> > the number of ob/ib windows to satisfy platform-specific constraints.
> > The glue driver may adjust the number of ob/ib windows, but the values
> > must stay within hardware limits.
> 
> Could we please get a better explaination than "satisfy platform-specific
> constraints" ?
> 

Due to this SoC design, only iATU regions with mapped addresses within the
32-bits address range need to be programmed. However, this SoC has a design
limitation in which the maximum region size supported by a single iATU
entry is restricted to 4 GB, as it is based on a 32-bits address region.

For most EP devices, we can only define one entry in the "ranges" property
of the devicetree that maps an address within the 32-bit range,
as shown below:
	ranges = <0x02000000 0x0 0x10000000 0x0 0x10000000 0x0 0xf0000000>;

For EP devices that require 64-bits address mapping (e.g., GPUs), BAR
resources cannot be assigned.
To support such devices, an additional entry for 64-bits address mapping is
required, as shown below:
	ranges = <0x02000000 0x0 0x10000000 0x0 0x10000000 0x0 0xf0000000>,
		 <0x43000000 0x1 0x00000000 0x1 0x00000000 0x7 0x00000000>;

In the current common implementation, all ranges entries are programmed to
the iATU. However, the size of entry for 64-bit address mapping exceeds the
maximum region size that a single iATU entry can support. As a result, an
error is reported during iATU programming, showing that the size of 64-bit
address entry exceeds the region limit.

In this SoC design, 64-bit addresses are hard-wired and can skip iATU
programming. Thus, the driver needs to recount the "ranges" entries whose
size fits within the 4GB platform limit.

There are four scenarios:
32-bits address, size < 4GB: program to iATU
64-bits address, size < 4GB: program to iATU
32-bits address, size > 4GB: assuming this condition does not exist
64-bits address, size > 4GB: skip case

We will recount how many outbound windows will be programmed to the iATU; 
this is why we need to adjust the number of entries programmed to the iATU.

> Your PCIe controller is synthesized with a certain number of {in,out}bound
> windows, and I assume that dw_pcie_iatu_detect() correctly detects the number
> of {in,out}bound windows, and initializes num_ob_windows/num_ib_windows
> accordingly.
> 
> So, is the problem that because of some errata, you cannot use all the
> {in,out}bound windows of the iATU?
>

Similar to the erratum, all inbound and outbound windows remain functional,
as long as each iATU entry complies with the 4 GB size constraint.

> Because it is hard to understand what kind of "hardware limit" that would
> cause your SoC to not be able to use all the available {in,out}bound windows.
> 
> Because it is simply a mapping in the iATU (internal Address Translation Unit).
> 
> In fact, in many cases, e.g. the NVMe EPF driver, then number of {in,out}bound
> windows is a major limiting factor of how many outstanding I/Os you can have,
> so usually, you really want to be able to use the maximum that the hardware
> supports.
> 
> 
> TL;DR: to modify this common code, I think your reasoning has to be more
> detailed.
> 

I will include additional explanations along with the application scenarios of
this SoC, and refactor the commit message.

> 
> 
> Kind regards,
> Niklas

Sincerely,
Randolph

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
