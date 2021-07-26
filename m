Return-Path: <SRS0=HVPl=MS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 810FFC4338F
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 07:00:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51C3560243
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jul 2021 07:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51C3560243
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zB6rDJt6HZUj300TOIEYhWUZMvAxq5TY1a2++22CQG8=; b=bHz9v4OsQ8o9Ce
	JqEmYCx3vQoapOSMg9UnScLqB2ObPDRC/sNR1X/8pjbUSlSnBorTorxoaHSroKujTEYc+EstDRxUm
	bjEtkv4we4oqMI+UfqLVzc/BGdt5jVGhc2O4y1/XxfyOQJXyywO53kJ6T00jQjy8a1wvErB1MsY1W
	alns0HDV4Q54n3BnIs6kIYuXkmAXncVnIQHLJt/scAG58nYrHUTG7FocNX8ZlHfQvUr2Tse6h+Ykh
	9pN/y1cX8Q9bv7VPxRkRNQ+6KmAx6bcRn7Vuv1C4zRoBnlhmB7kmkPMoKgp2Vzn/EzApjr7oblbxJ
	7WxC3WOJpLRucz0edBoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7ubP-009nt3-Rj; Mon, 26 Jul 2021 07:00:39 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7ubM-009nsE-Vt
 for linux-riscv@lists.infradead.org; Mon, 26 Jul 2021 07:00:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id DA9D068B05; Mon, 26 Jul 2021 09:00:30 +0200 (CEST)
Date: Mon, 26 Jul 2021 09:00:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Atish Patra <atish.patra@wdc.com>
Cc: linux-kernel@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Christoph Hellwig <hch@lst.de>, devicetree@vger.kernel.org,
 Dmitry Vyukov <dvyukov@google.com>, Frank Rowand <frowand.list@gmail.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 iommu@lists.linux-foundation.org, linux-riscv@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Tobias Klauser <tklauser@distanz.ch>
Subject: Re: [RFC 3/5] dma-mapping: Enable global non-coherent pool support
 for RISC-V
Message-ID: <20210726070030.GB9035@lst.de>
References: <20210723214031.3251801-1-atish.patra@wdc.com>
 <20210723214031.3251801-4-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210723214031.3251801-4-atish.patra@wdc.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_000037_212902_0425772B 
X-CRM114-Status: GOOD (  15.93  )
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

On Fri, Jul 23, 2021 at 02:40:29PM -0700, Atish Patra wrote:
> Currently, linux,dma-default is used to reserve a global non-coherent pool
> to allocate memory for dma operations. This can be useful for RISC-V as
> well as the ISA specification doesn't specify a method to modify PMA
> attributes or page table entries to define non-cacheable area yet.
> A non-cacheable memory window is an alternate options for vendors to
> support non-coherent devices.

Please explain why you do not want to use the simply non-cachable
window support using arch_dma_set_uncached as used by mips, niops2 and
xtensa.

> +static int __dma_init_global_coherent(phys_addr_t phys_addr, dma_addr_t device_addr, size_t size)




>  {
>  	struct dma_coherent_mem *mem;
>  
> -	mem = dma_init_coherent_memory(phys_addr, phys_addr, size, true);
> +	if (phys_addr == device_addr)
> +		mem = dma_init_coherent_memory(phys_addr, device_addr, size, true);
> +	else
> +		mem = dma_init_coherent_memory(phys_addr, device_addr, size, false);

Nak.  The phys_addr != device_addr support is goign away.  This needs
to be filled in using dma-ranges property hanging of the struct device.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
