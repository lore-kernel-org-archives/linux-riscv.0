Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98823CF9C6B
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 06:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sYJ0/t4wg4jNXoQaUu7mh6FhTHxDgfsj8FGcrabLZVU=; b=30MV3EwzfOX1qK
	/DMttZJkM3AOrOT1wH/C3qodSvDDJOmCdfxOXBMkIspYi6ldPOpn7pF9rIgLErcyb925WuWVCFRB+
	x5nM/nG7CgWDsbT9sXZ2+J8omJ7K1RuyAPaIts8oWura6G1kZaVLK+/iI4O6HTrHx18dHa2v3RBjz
	wZWLb0+R0wq2pTShbUtbAZCm43WwLIlSdfNuEBp4n2nbOMQ9V3jVkzjQxza2bE8otEqhWfOE5BYHx
	VDurqJoyWJWKel0+7mMbRdiiDjC5oJYqA1r+nLmAh+2GLF0eWpBFETVZaFwS6Fk93QYGzsic8mFH4
	0cde9D6HzKBZZhCycBTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sszCk-00000001HHz-1jFP;
	Tue, 24 Sep 2024 06:39:22 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sszCi-00000001HHO-2wcJ;
	Tue, 24 Sep 2024 06:39:20 +0000
Date: Mon, 23 Sep 2024 23:39:20 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Christoph Hellwig <hch@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>
Subject: Re: [PATCH] riscv: make ZONE_DMA32 optional
Message-ID: <ZvJemFN1qdvi8qo-@infradead.org>
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
 <Zu2A1l_cX36sOVcB@infradead.org>
 <VI1PR09MB233391A7544336FBD06303CE946E2@VI1PR09MB2333.eurprd09.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR09MB233391A7544336FBD06303CE946E2@VI1PR09MB2333.eurprd09.prod.outlook.com>
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

On Sun, Sep 22, 2024 at 10:06:59AM +0000, Vladimir Kondratiev wrote:
> This is the whole point - there are platforms where you can't allocate 32-bit
> dma-able memory.

Ugg.  They will be broke for all kinds of devices (plug in PCIe devices
IP IP blocks).

> Unless there's IOMMU or some platform specific tricks,
> DMA address is same as physical address.

Well, that's where the usual platform specific trick is, as the
platforms with high DRAM either have a mapping between physical
and DMA range (see the dma_ranges concept in the DMA and OF code)
or a mirror of the higher addresses.  Or very rarely (e.g. sparc)
a required IOMMU that is always used.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
