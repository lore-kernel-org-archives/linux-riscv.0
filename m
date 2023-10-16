Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F23CDB465
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Oct 2023 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lybj76/BxyxZ6vWLxU1zM97jFwLVNBBBNytCUw6PBZI=; b=xt3IQTIU+weOL4
	XkLP2jvgAwEEeb1SFqtYLvtiH9B6ndPY4wG4swv7v9T+2Aps5W36RFNgUO19PUhvAFlO9VA5GJwrf
	U4gzkhrc+QE/XnCBaPXat1qYreETopionj4+67V3pfZVnX/rcakk/P5EqJwGBytb8MMKdSpfodTL/
	zhpDCElxDXit6nkb45z0ma+tw5Sr47PmbmbQUCXY7/vW55V3nNWNTmnEx0NdDesIWz3lovHuSuG8m
	bJ6I5GFc48Ubeuta1kbvq9xV6dvRVnQm912NihRtxkrXfGeX84HN1lm4WtGMJllEky9+UsmIPJXVX
	igd7Y0qYEZO/wrE8CwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNTL-009iTr-1i;
	Mon, 16 Oct 2023 13:17:27 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNTH-009iRv-2C
	for linux-riscv@lists.infradead.org;
	Mon, 16 Oct 2023 13:17:25 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id CD1D16732D; Mon, 16 Oct 2023 15:17:16 +0200 (CEST)
Date: Mon, 16 Oct 2023 15:17:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
	iommu@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-m68k@lists.linux-m68k.org,
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Jim Quinlan <james.quinlan@broadcom.com>
Subject: Re: [PATCH 01/12] riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't
 depend on RISCV_DMA_NONCOHERENT
Message-ID: <20231016131716.GA26484@lst.de>
References: <20231016054755.915155-1-hch@lst.de> <20231016054755.915155-2-hch@lst.de> <20231016-walmart-egomaniac-dc4c63ea70a6@wendy>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231016-walmart-egomaniac-dc4c63ea70a6@wendy>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_061723_860879_C53DD10E 
X-CRM114-Status: GOOD (  20.32  )
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

On Mon, Oct 16, 2023 at 01:49:41PM +0100, Conor Dooley wrote:
> Hey,
> 
> On Mon, Oct 16, 2023 at 07:47:43AM +0200, Christoph Hellwig wrote:
> > RISCV_NONSTANDARD_CACHE_OPS is also used for the pmem cache maintenance
> > helpers, which are built into the kernel unconditionally.
> 
> You surely have better insight than I do here, but is this actually
> required?
> This patch seems to allow creation of a kernel where the cache
> maintenance operations could be used for pmem, but would be otherwise
> unavailable, which seems counter intuitive to me.
>
> Why would someone want to provide the pmem helpers with cache
> maintenance operations, but not provide them generally?
> 

Even if all your periphals are cache coherent (very common on server
class hardware) you still need cache maintenance for pmem.  No need
to force the extra text size and runtime overhead for non-coherent DMA.

> I also don't really understand what the unconditional nature of the pmem
> helpers has to do with anything, as this patch does not unconditionally
> provide any cache management operations, only relax the conditions under
> which the non-standard cache management operations can be provided.

They simply were broken if a platform had non-standard cache mem but
only coherent DMA before.  That's probably more a theoretical than
practial case, but still worth fixing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
