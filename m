Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79D6C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/Jc7u/PGHgSvvdo+vwz8p/Ut6GehVI7rxv8QE5EhMs=; b=A7zDc4gjylFTLj
	ixfgUUCvR0OyiDCmz4OHxXFzN8m1C9cyzaWGYfmuGHOfox0+x4znIAs1qjrrfh4YD7I4oqiDlETId
	QDdNYfBou9MtfAEl1GTFnmPUZZo3vJX3k0PrAJtoT/W8XCbrbKwnjhjkkS6piOX5BShVxNOU3PZ/t
	77ZKcF9eTyaNZYwYESgDSImhlp6leVowIxezTYjHj8cBGPtEruY+AW6LyGnJYCjivOF4n1Q9s11lm
	FgKlhADrniuLMS+iYxiBdFUKognbQ7FF4+Nma6hnMMZ9/LaJS4nJx3qbcNmB0sbJNqCrnwuNYKaWY
	p0v9GpTzmr8mYjWUaBYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1X8r-00Fool-Js; Wed, 15 Jun 2022 17:49:21 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1X8o-00Fomf-SC
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 17:49:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id F33DE68AFE; Wed, 15 Jun 2022 19:49:10 +0200 (CEST)
Date: Wed, 15 Jun 2022 19:49:10 +0200
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
Message-ID: <20220615174910.GA26607@lst.de>
References: <20220610004308.1903626-1-heiko@sntech.de> <20220610004308.1903626-3-heiko@sntech.de> <20220610055608.GA24221@lst.de> <110361853.nniJfEyVGO@diego>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <110361853.nniJfEyVGO@diego>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_104919_101579_A01D0AB7 
X-CRM114-Status: GOOD (  12.53  )
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

On Wed, Jun 15, 2022 at 06:56:40PM +0200, Heiko St=FCbner wrote:
> If I'm reading things correctly [0], the default for those functions
> is for those to be empty - but defined in the coherent case.

That's not the point.

Zicbom is just an extension that allows the CPU to support managing
cache state.  Non-coherent DMA is just one of the use cases there
are others like persistent memory.  And when a CPU core supports
Zicbom it might or might not have any non-coherent periphals.  Or
even some coherent and some non-coherent ones, something that
is pretty common in arm/arm64 CPUs, where PCIe is usually cache
coherent, but some other cheap periphals might not be.

That is why Linux ports require the plaform (usually through
DT or ACPI) to mark which devices are coherent and which ones
are not.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
