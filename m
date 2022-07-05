Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E421C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A6bsUV3dZ9eYQmSneSZj2LdJldR0TtnA2fBFxDNoghA=; b=oDcQy6isinRyl2
	wOknfAjwmL9n9ENUP6fEIIY5MPIOixjJBDytPnhhC+vIcQJCLfbjVmXOYcYwtFSVe91IrZ2THL2md
	2zurACLrExvxqc0aGqkTB3UDUUM42GEiJuwIlWm6UndLArEGdGfDMdjjLiURXb+99EvrLZFq8ZUcm
	LAM+3gWIW/A+riQsq+DHMftYOXADBUrmqtwMZSiQC9+GEKH3EVv/bhVzEcELkgd7X620NeaFgJArn
	jpE1QwE+fyWUwOagdB5GPDvcFLLyk+9jPEvEXtp6E+JLqTk8Si2kC1F1KfmffRCXZBPwLo86Daxv2
	pDQtgy/jJ5oAQLgj82Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8ld0-001XOw-47; Tue, 05 Jul 2022 16:42:22 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8lcv-001XMX-BY
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 16:42:21 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0C53367373; Tue,  5 Jul 2022 18:42:14 +0200 (CEST)
Date: Tue, 5 Jul 2022 18:42:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: LABBE Corentin <clabbe@baylibre.com>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, herbert@gondor.apana.org.au,
	hch@lst.de, heiko@sntech.de, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <20220705164213.GA14484@lst.de>
References: <20220701132735.1594822-1-clabbe@baylibre.com> <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk> <YsP0eekTthD4jWGV@Red>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YsP0eekTthD4jWGV@Red>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_094217_563009_510EDBFA 
X-CRM114-Status: GOOD (  11.44  )
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

On Tue, Jul 05, 2022 at 10:21:13AM +0200, LABBE Corentin wrote:
> 
> I just copied what did drivers/crypto/xilinx/zynqmp-sha.c.
> I tried to do flush_dcache_range() but it seems to not be implemented on riscV.

That driver is broken and should no have been merged in that form.

> And flush_dcache_page(virt_to_page(addr), len) produce a kernel panic.

And that's good so.  Drivers have no business doing their own cache
flushing.  That is the job of the dma-mapping implementation, so I'd
suggest to look for problems there.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
