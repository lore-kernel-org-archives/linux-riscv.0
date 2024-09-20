Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE7C78849
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 14:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDUzvVpPrsQ3sKgsFy5XO5yQzZGPz73td2pWf5b/yr4=; b=tm1Yjrd3kUM6qr
	uvRaaaeMbFmmGKbypkbMFj1yShONb7QnCKrlFrANkOmehKyrNvp8stsDsmgAl/YBiQUAZo/iUbq8l
	kNfrVAwIIjlmz+HI4Yt0kiH4UkRI1l98C442dkKWyv7lJNs3FkpgInRzRWEBghg5wRuCHo56l14dG
	JM/vRBb2eglUqdBKLisApWWPP99zsM5g771vIovtkdJHgoj/W0gKFlvQkCDVNU5S50vLRd23xZonF
	b8uf1SxQZwjcblZVtUIshATCza/QaaQ/Q6SlgiY02B7H1H8hXkLJ91AXKOttbDF1sYRSOEWTxJRrU
	BfcNZ8kM5DrOkhJeeskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sreEy-0000000CK7d-2Gpb;
	Fri, 20 Sep 2024 14:04:08 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sreEw-0000000CK7O-25DY;
	Fri, 20 Sep 2024 14:04:06 +0000
Date: Fri, 20 Sep 2024 07:04:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] riscv: make ZONE_DMA32 optional
Message-ID: <Zu2A1l_cX36sOVcB@infradead.org>
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
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

On Tue, Aug 27, 2024 at 02:36:11PM +0300, Vladimir Kondratiev wrote:
> It is not necessary any RISCV platform has ZONE_DMA32.

That is an odd statement.  The point of ZONE_DMA32 is to make sure
that drivers can always allocate 32-bit DMAable memory, and without
ZONE_DMA32 that is very hard to provide unless you always have an
IOMMU.

> Example - if platform has no DRAM in [0..4G] region,
> it will report failure like below each boot.

ZONE_DMA32 is supposed to contain the 32-bit dma addressable memory,
not 32-bit physical.

Take a look at the changes that just went into Linus' tree for that.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
