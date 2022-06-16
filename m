Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B3DC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wapzOXKZxFmgqh2AxFx4F4V914zKP5JuGtJnkQiVzqo=; b=WJDpz62LEB88go
	QSefygOsv1M58PwSe1NJQBGp/PLIb6tYMdbL23hhmBylh60znT04uHfQRPfgMowZEV46AP2Naa5sJ
	IHIcr0tuzRr9svrKd0obuicJsSblhPjppk/U8odod7+nBObCtcr/4palPXIya/QVecXxQNJZXQHbI
	CZbBetcaFghTbk7/lV1h5tw8KpShxW4aFZlgj/4fJ7YDQFfgxVEAyceynKT3d3CBuMlfEWdSZVHzT
	lQGnaWXKE7qY+z1ZeYFu+HJeO1bZKcVv6mMkzGbBf7X2lrgLhomF3j6s1IZRcAh3nAa2BQKr1wdHe
	v2Yyo6RtLSbfFWpZ5dYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1m5X-001k9s-W2; Thu, 16 Jun 2022 09:46:56 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1m5V-001k8R-9J
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 09:46:54 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o1m5O-0004rx-Ut; Thu, 16 Jun 2022 11:46:46 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Christoph Hellwig <hch@lst.de>, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com, philipp.tomsich@vrull.eu, samuel@sholland.org, atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr, robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, drew@beagleboard.org, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 2/3] riscv: Implement Zicbom-based cache management operations
Date: Thu, 16 Jun 2022 11:46:45 +0200
Message-ID: <1752040.TLkxdtWsSY@diego>
In-Reply-To: <20220615174910.GA26607@lst.de>
References: <20220610004308.1903626-1-heiko@sntech.de> <110361853.nniJfEyVGO@diego> <20220615174910.GA26607@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_024653_361240_BE338365 
X-CRM114-Status: GOOD (  19.73  )
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

Hi,

Am Mittwoch, 15. Juni 2022, 19:49:10 CEST schrieb Christoph Hellwig:
> On Wed, Jun 15, 2022 at 06:56:40PM +0200, Heiko St=FCbner wrote:
> > If I'm reading things correctly [0], the default for those functions
> > is for those to be empty - but defined in the coherent case.
> =

> That's not the point.
> =

> Zicbom is just an extension that allows the CPU to support managing
> cache state.  Non-coherent DMA is just one of the use cases there
> are others like persistent memory.  And when a CPU core supports
> Zicbom it might or might not have any non-coherent periphals.  Or
> even some coherent and some non-coherent ones, something that
> is pretty common in arm/arm64 CPUs, where PCIe is usually cache
> coherent, but some other cheap periphals might not be.
> =

> That is why Linux ports require the plaform (usually through
> DT or ACPI) to mark which devices are coherent and which ones
> are not.

I "get" it now I think. I was somewhat struggling what you were aiming
at, but that was something of not seeing "the forest for the trees" on
my part. And of course you were right in recognizing that issue :-) .

Without CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE and friends
dev_is_dma_coherent() will always return true otherwise the dma_coherent
attribute. Hence the "coherent" value for every system not managing things
will suddenly show as non-coherent where it showed as coherent before.


As we already have detection-points for non-coherent systems (zicbom
detection, t-head errata detection) I guess just also switching some boolean
might solve that, so that arch_setup_dma_ops() will set the dma_coherent
attribute to true always except when some non-coherent system is detected.


void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
                const struct iommu_ops *iommu, bool coherent)
{
        /* only track coherent attributes, if cache-management is available=
 */
        if (enable_noncoherency)
                dev->dma_coherent =3D coherent;
        else
                dev->dma_coherent =3D true;
}


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
