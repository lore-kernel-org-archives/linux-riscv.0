Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C0A2C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 11:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HlJb9PkOysEQqLB/fKK2SNlHGRhApZus2eMTUXNn6Aw=; b=V5WjfgSiiKvoi1
	2y1z08+ILPjEIEJa/F8cup/9suZRnZHlAyCC9mdkfWIZxcvky1AhnLmEway/Zyh5N3lR2dwnct9/7
	eo763bfWDJaDVDMeAOwpoukdgkdcRbVq6yeXbMX7L4DmpChHVL2WFlt/LnPbiQgdOmKKo81AA7zP0
	PZ0T8vkuKdQqblqhv8BZ3qCOxRLq8A6w8GuTFNqV4G4sPo7VvRCdVLIm8txe0pstCER7NJDBkx4En
	hlG9+c9M86N/qiybwDwRVPTzIbVTb7KXkjhCf1PG5UYNntwKdbGc0tbfGWeOpXL8D8Tfzg/SSEutr
	6u19wwFjebfPlTmH4njQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1o4Q-002BhH-Vi; Thu, 16 Jun 2022 11:53:54 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1o4N-002Bd0-2f
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 11:53:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 129BB67373; Thu, 16 Jun 2022 13:53:43 +0200 (CEST)
Date: Thu, 16 Jun 2022 13:53:42 +0200
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
Message-ID: <20220616115342.GA11289@lst.de>
References: <20220610004308.1903626-1-heiko@sntech.de> <110361853.nniJfEyVGO@diego> <20220615174910.GA26607@lst.de> <1752040.TLkxdtWsSY@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1752040.TLkxdtWsSY@diego>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_045351_324777_54EA27F3 
X-CRM114-Status: GOOD (  11.03  )
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

On Thu, Jun 16, 2022 at 11:46:45AM +0200, Heiko St=FCbner wrote:
> Without CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE and friends
> dev_is_dma_coherent() will always return true otherwise the dma_coherent
> attribute. Hence the "coherent" value for every system not managing things
> will suddenly show as non-coherent where it showed as coherent before.

Yes.

> As we already have detection-points for non-coherent systems (zicbom
> detection, t-head errata detection)

No, we don't.  There are plenty of reasons to support Zicbom without
every having any non-coherent DMA periphals.  Or just some non-coherent
ones.  So that alone is not a good indicator at all.

The proper interface for that in DT-based setups i of_dma_is_coherent(),
which looks at the dma-coherent DT property.  And given that RISC-V
started out as all coherent we need to follow the powerpc way
(CONFIG_OF_DMA_DEFAULT_COHERENT) and default to coherent with an
explcit propery for non-coherent devices, and not the arm/arm64 way
where non-coherent is the default and coherent devices need the property.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
