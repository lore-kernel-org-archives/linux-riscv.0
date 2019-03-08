Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7168DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:39:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CA412085A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 14:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jopPGuMD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CA412085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fyVUIBV64nweSn4VRpk8eOaSDrYfsD2ojAOYGxsE4A=; b=jopPGuMDwNFemu
	kxUpqtLtRXcEVlVt6sVlOeDPXykWIhjS0loon6fEwpIFWYCXBI3UtBbGwglG9VTBrjS8hWlzkP/xH
	poNN358MC8aheErql6nO8vvzyOvEJUoks2yYe4Jja+eIXmpjkSOO2kNU04Zm/NahlAzVW0wh9SqHN
	Pt5/znAmKh5IaWyaPVXJ5Y8MHp6iWGFtYds5xkw5HzuiYdB+CBxbgS3MdNyfwYqio8Ztn7DvptN8B
	3miQourlJ8DQbnfHH4ApmosasvuOAgPL8EzbYWEonOS9dDJvKhdy3qlYo9XZPFxCRj5IrI/5yNCpw
	x7iDqns6Ne+jn2P3JUWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2Gen-0006Wk-W2; Fri, 08 Mar 2019 14:39:29 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h2Gem-0006WZ-Et; Fri, 08 Mar 2019 14:39:28 +0000
Date: Fri, 8 Mar 2019 06:39:28 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
Message-ID: <20190308143928.GC32707@infradead.org>
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

> +menu "Virtual memory management"
> +
> +config RISCV_TLBI_IPI
> +	bool "Use IPI instead of SBI for remote TLB shootdown"
> +	default n
> +	help
> +	  Instead of using remote TLB shootdown interfaces provided by SBI,
> +	  use IPI to handle remote TLB shootdown within Linux kernel.
> +
> +	  BBL/OpenSBI are currently ignoring ASID and address range provided
> +	  by SBI call argument, and do a full TLB flush instead. This may
> +	  negatively impact performance on implementations with page-level
> +	  sfence.vma support.
> +
> +	  If you don't know what to do here, say N.

Requiring a kconfig here is rather sad.  For now I would just
switch entirely to your non-SBI version as doing SBI calls for this
is rather pointless to start with.  Either we get real architectural
hardware acceleration, or we might as well use IPIs ourselves.

That being said if there are strong arguments to keep the old code
I'd still prefer that to be runtime selectable.

> +
> +config RISCV_TLBI_MAX_OPS
> +	int "Max number of page-level sfence.vma per range TLB flush"
> +	range 1 511
> +	default 1
> +	help
> +	  This config specifies how many page-level sfence.vma can the Linux
> +	  kernel issue when the kernel needs to flush a range from the TLB.
> +	  If the required number of page-level sfence.vma exceeds this limit,
> +	  a full sfence.vma is issued.
> +
> +	  Increase this number can negatively impact performance on
> +	  implemntations where sfence.vma's address operand is ignored and
> +	  always perform a global TLB flush.
> +
> +	  On the other hand, implementations with page-level TLB flush support
> +	  can benefit from a larger number.
> +
> +	  If you don't know what to do here, keep the default value 1.

Again, I don't think hardcoding this makes any sense.  To make the
setting it needs to be overridable, and preferably provided by the
SBI code in some form (DT entry?).

> index 54fee0cadb1e..f254237a3bda 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -1,6 +1,5 @@
>  /*
> - * Copyright (C) 2009 Chen Liqin <liqin.chen@sunplusct.com>
> - * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2019 Gary Guo, University of Cambridge

Unless you complete rewrite the file it is rather rude to remove
the existing copyright.  There still seem to be a decent amount
of at least comments left from the old codebase.

> +static inline void local_flush_tlb_page(struct vm_area_struct *vma,
> +		unsigned long addr)
> +{
> +	__asm__ __volatile__ ("sfence.vma %0, %1" : : "r" (addr), "r" (0) : "memory");
> +}

Please avoid lines over 80 chars.  Also I find inline assembly much
easier to read if each argument has its own line.

> +#ifndef CONFIG_SMP

If you rewrite this anyway can you switch the order around and use
an ifdef instead of ifndef?

> +extern void flush_tlb_all(void);
> +extern void flush_tlb_mm(struct mm_struct *mm);
> +extern void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
> +extern void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
> +		unsigned long end);
> +extern void flush_tlb_kernel_range(unsigned long start, unsigned long end);

No need for all the externs.

> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> new file mode 100644
> index 000000000000..76cea33aa9c7
> --- /dev/null
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -0,0 +1,144 @@
> +/*
> + * Copyright (C) 2019 Gary Guo, University of Cambridge
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */

Please use an SPDX tag instead of the license boilerplate.

> +#include <linux/mm.h>
> +#include <asm/sbi.h>
> +
> +/*
> + * BBL/OpenSBI are currently ignoring ASID and address range provided
> + * by SBI call argument, and do a full TLB flush instead.

This is really information for the changelog, not really for the code.

> +static void ipi_remote_sfence_vma(void *info)
> +{
> +	struct tlbi *data = (struct tlbi *) info;

No need for the cast.

> +	if (size == (unsigned long) -1) {

Maybe add a symbolic RISCV_FLUSH_ALL macros for the magic -1?

> +void flush_tlb_page(struct vm_area_struct *vma,
> +		unsigned long addr)

The second argument easily fits onto the first line.

> +void flush_tlb_range(struct vm_area_struct *vma,
> +		unsigned long start, unsigned long end)

Same here.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
