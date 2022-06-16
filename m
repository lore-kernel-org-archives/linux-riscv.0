Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD92C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 12:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWBXYCv3Bk2GSDftkptm045aVLkT4ATYFNRxXQp5l/o=; b=Qh8os+xQ3kzUmn
	R6vulJy70lm7KLeixUw9+KU0+BqtHA8ImALfb1T/JP2iAj6iArNttAk+61BdM6jFmPoEWz37ZZ5yn
	2dH4iZQGI094rkP+M38jmXXLVrjyhgSU0VSrQw069F1HrG0I4B1Tmm2lFkqUsm4xMlLe/5mIuEQ7R
	2l28iCcFsCh3BdC6CHAJM+MZKLWLHU9bDTteuRMufvtQNEoHyFv4AGrXx/5FJdcGKaZlFdF8R/gar
	mcfxO2jlKebGHD5pA4gPJBe6rTcfD5yZlxnq9QmLmUFEeB8w5ZU2r9yjw1u67fEdlXkfQbYFk9K3l
	kC+IoLaUYrb4N1tNhRPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oLz-002FwC-V1; Thu, 16 Jun 2022 12:12:03 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oLx-002FvU-In
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 12:12:02 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 464AD67373; Thu, 16 Jun 2022 14:11:57 +0200 (CEST)
Date: Thu, 16 Jun 2022 14:11:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Christoph Hellwig <hch@lst.de>, palmer@dabbelt.com,
	paul.walmsley@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org,
	cmuellner@linux.com, philipp.tomsich@vrull.eu, samuel@sholland.org,
	atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
	robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	drew@beagleboard.org, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 2/3] riscv: Implement Zicbom-based cache management
 operations
Message-ID: <20220616121157.GA11657@lst.de>
References: <20220610004308.1903626-1-heiko@sntech.de> <1752040.TLkxdtWsSY@diego> <20220616115342.GA11289@lst.de> <2041345.KlZ2vcFHjT@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2041345.KlZ2vcFHjT@diego>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_051201_827202_85324FAE 
X-CRM114-Status: UNSURE (   7.52  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jun 16, 2022 at 02:09:47PM +0200, Heiko St=FCbner wrote:
> My guess was that new platforms implementing cache-management will want
> to be non-coherent by default?

No.  Cache incoherent DMA is absolutely horrible and almost impossible
to get right for the corner cases.  It is a cost cutting measure seen on
cheap SOCs and mostly avoided for more enterprise grade products.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
