Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D814CCA47A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 12:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+gUoSSH3luXEdN9QFo9qi72itbSPhFbMTqSID4BCDY=; b=uMz8w6BsyyqtOY
	Zk7SGa/dt3P7y0zyyfDQGVQQe/hQZ6PhWtRF6nzU3wVeGVtYbIrKF1Lw/pOfMXJsANNthd1VSe+5h
	MMUevKu7qEUeNAPdNgXu5brWDCzmoqaLWJdSV4iXYCIQ6+yD8A8aTLiA7uknflezA8DSNjC0aozml
	AncH4BQ8k1In9BUMN43M2Vy6r6w0J4XvJd2hE5Asoh37zWhrrZ/ob5yYTcUDMBhnOxs9AuR+YJV2/
	wpGzotsefC9jqAcJfSYXiYm4bohFm4eNxnB7COkjjGVox8Gbsjb/J/HU1HFoJ++Rh6hd3dmPcJCFI
	EpdqJyhdOQ/SX+l9ZNtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oJx-002FZV-Rc; Thu, 16 Jun 2022 12:09:57 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1oJv-002FY8-2o
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 12:09:56 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o1oJo-0005ZY-OM; Thu, 16 Jun 2022 14:09:48 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Christoph Hellwig <hch@lst.de>
Cc: Christoph Hellwig <hch@lst.de>, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com, philipp.tomsich@vrull.eu, samuel@sholland.org, atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr, robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, drew@beagleboard.org, Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH 2/3] riscv: Implement Zicbom-based cache management operations
Date: Thu, 16 Jun 2022 14:09:47 +0200
Message-ID: <2041345.KlZ2vcFHjT@diego>
In-Reply-To: <20220616115342.GA11289@lst.de>
References: <20220610004308.1903626-1-heiko@sntech.de> <1752040.TLkxdtWsSY@diego> <20220616115342.GA11289@lst.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_050955_157139_1A23753E 
X-CRM114-Status: GOOD (  17.28  )
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

Am Donnerstag, 16. Juni 2022, 13:53:42 CEST schrieb Christoph Hellwig:
> On Thu, Jun 16, 2022 at 11:46:45AM +0200, Heiko St=FCbner wrote:
> > Without CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE and friends
> > dev_is_dma_coherent() will always return true otherwise the dma_coherent
> > attribute. Hence the "coherent" value for every system not managing thi=
ngs
> > will suddenly show as non-coherent where it showed as coherent before.
> =

> Yes.
> =

> > As we already have detection-points for non-coherent systems (zicbom
> > detection, t-head errata detection)
> =

> No, we don't.  There are plenty of reasons to support Zicbom without
> every having any non-coherent DMA periphals.  Or just some non-coherent
> ones.  So that alone is not a good indicator at all.
> =

> The proper interface for that in DT-based setups i of_dma_is_coherent(),
> which looks at the dma-coherent DT property.  And given that RISC-V
> started out as all coherent we need to follow the powerpc way
> (CONFIG_OF_DMA_DEFAULT_COHERENT) and default to coherent with an
> explcit propery for non-coherent devices, and not the arm/arm64 way
> where non-coherent is the default and coherent devices need the property.

I did look at the dma-coherent-property -> of_dma_is_coherent()
	 -> of_dma_configure_id() -> arch_setup_dma_ops() chain yesterday
which setups the value dev_is_dma_coherent() returns.

The Zicbom extension will only be in new platforms, so none of the currently
supported ones will have that. So my thinking was that we can default to
true in arch_setup_dma_ops() and only use the read coherency value when
actual cache-managment-operations are defined.

My guess was that new platforms implementing cache-management will want
to be non-coherent by default?

So if the kernel is running on a platform not implementing cache-management
dev_is_dma_coherent() would always return true as it does now, while on a
new platform implementing cache-management we'd default to non-coherent
and expect that new devicetree/firmware to specify the coherent devices.





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
