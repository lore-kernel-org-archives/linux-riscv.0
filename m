Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45410C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 17:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/9YLLYYuD2Rgu4qMybse9GSBST6nDp55DY/4X2CDUVw=; b=1XjrpPNomzm2J9
	CluT2NHlFsztlcxqznZHiOfEobz3uNWZ4wDQTSkHZNfxJ0zRWrbXnN+rDdarcpc3gFYc+obv3hRKK
	su3zQvVK9NY/egYc/VHr9zAZ0Ofu2eYgyq/0PWOfeUDkGWCEzBHSXaOJ46UzGenCc43RsJbdylIFR
	X5AEfSzmMLX/hdDAn6Vo+UDprktQHghrdLsUTst3yfyRt/FJqZE9LiOw2Y3lCvgD0B5Nala/2u1n3
	sNa4YtZer3f6g15inWRPC/yK8pQA/UwXHRrUVfv3J6oUC0Om0jnAKPEBH1V7SCC9xcYVCulRS23+p
	SJPh/vNokVgliSyrWg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8mot-001zzk-BO; Tue, 05 Jul 2022 17:58:43 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8moq-001zyY-NP
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 17:58:41 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7FD8E67373; Tue,  5 Jul 2022 19:58:34 +0200 (CEST)
Date: Tue, 5 Jul 2022 19:58:34 +0200
From: Christoph Hellwig <hch@lst.de>
To: LABBE Corentin <clabbe@baylibre.com>
Cc: Christoph Hellwig <hch@lst.de>, Ben Dooks <ben.dooks@codethink.co.uk>,
	herbert@gondor.apana.org.au, heiko@sntech.de,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <20220705175834.GA15815@lst.de>
References: <20220701132735.1594822-1-clabbe@baylibre.com> <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk> <YsP0eekTthD4jWGV@Red> <20220705164213.GA14484@lst.de> <YsR7O4q4IRI14Wkc@Red>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YsR7O4q4IRI14Wkc@Red>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_105840_949156_36FCD009 
X-CRM114-Status: GOOD (  11.29  )
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

On Tue, Jul 05, 2022 at 07:56:11PM +0200, LABBE Corentin wrote:
> My problem is that a dma_sync on the data buffer corrupt the poison buffer as collateral dommage.
> Probably because the sync operate on a larger region than the requested dma_sync length.
> So I try to flush poison data in the cryptoAPI.

Data structures that are DMAed to must be aligned to
the value returned by dma_get_cache_alignment(), as non-coherent DMA
by definition can disturb the data inside that boundary.  That is not
a bug but fundamentally part of how DMA works when the device attachment
is not cache coherent.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
