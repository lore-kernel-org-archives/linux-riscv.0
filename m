Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526E9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jun 2022 04:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RgUKX0wStwdZerpws/JBs9HCowWW6dfvFhWBvt9TVY=; b=HAPZNab+3Cv6jF
	qIHTEWozKJVVGFpBKy4whuzDZU7L05LbhJpz/ZKDjJQ8MefPxvqCAQXzUPG9BD2fS65HErFxwRB9/
	HfJN7IAzI2rhcw6WT+aoPD6WkS32VZ5hxZmVwQ3a9bKTyjNqAj1oomT6RTRKnN3xWE0kgGdFwd1PJ
	Hey7/G19HthlhpyGEWe0xnluVb2d6slBosYAfmX3SAmq/c4FkXgZOb3I7VKI207NpngCicywsE9Ui
	+b08XY7siv8FaJEIUIhxhdliYe71i5OWjDDWUa6iT/ASuK490apgXW+VZnrYWsdbVsKxN6Dkp0HPP
	IEv15w4u6nGp4As0TctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6lnD-00F06g-Us; Thu, 30 Jun 2022 04:28:39 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ln9-00F05z-UD
	for linux-riscv@lists.infradead.org; Thu, 30 Jun 2022 04:28:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4C5E568AA6; Thu, 30 Jun 2022 06:28:30 +0200 (CEST)
Date: Thu, 30 Jun 2022 06:28:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	wefu@redhat.com, guoren@kernel.org, cmuellner@linux.com,
	philipp.tomsich@vrull.eu, hch@lst.de, samuel@sholland.org,
	atishp@atishpatra.org, anup@brainfault.org, mick@ics.forth.gr,
	robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org,
	drew@beagleboard.org, rdunlap@infradead.org,
	Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v5 3/4] riscv: Implement Zicbom-based cache management
 operations
Message-ID: <20220630042830.GB4958@lst.de>
References: <20220629215944.397952-1-heiko@sntech.de> <20220629215944.397952-4-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220629215944.397952-4-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_212837_073196_11047A0D 
X-CRM114-Status: GOOD (  12.11  )
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

On Wed, Jun 29, 2022 at 11:59:43PM +0200, Heiko Stuebner wrote:
> The Zicbom ISA-extension was ratified in november 2021
> and introduces instructions for dcache invalidate, clean
> and flush operations.
> 
> Implement cache management operations based on them.
> 
> Of course not all cores will support this, so implement an
> alternative-based mechanism that replaces empty instructions
> with ones done around Zicbom instructions.
> 
> As discussed in previous versions, assume the platform
> being coherent by default so that non-coherent devices need
> to get marked accordingly by firmware.

The subject here seems somewhat odd.  Yes, it does implement the
low-level cache management ops, but more importantly it adds
support for devices that are not DMA coherent.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
