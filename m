Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564D1C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 10:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hc9I39KkQx2t+yyAWSJrQdbAes2OrCyDRAs960jKBjo=; b=silcbrePP9BR7N
	rOMTPicyqfXBWCU/F+7eDCADAFUhnhL6OSGkEzY99l5C9d81c2hPkwSRkAfpUtiMGdJQspycG+0LN
	64KwwQi9IFSkZu9e/GkCf1t5ZaOp0jnIthyiO3LwPQ2/VMUR5wte4nIOnZZS35OFiB2dyemGIrMvw
	BCj5kKa+N0fuu7CJN0uK86cXwFvcDDwa18Brbni5a9t+omDlnRUvDmgdv+74dV843SHKZ8ZcX0f1d
	o58/cFWr9L7zjrKTBIwq+D7u1tyLGdGwEYBlf4DKvacNN3aK8RriNQWlAzFkSSJcaSHV7o/yKWcsf
	U24noXlD7ZF1UCZsl3wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZres-001crq-Tx; Thu, 31 Mar 2022 10:04:02 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZrep-001cot-PT
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 10:04:01 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8B8CF68BFE; Thu, 31 Mar 2022 12:03:56 +0200 (CEST)
Date: Thu, 31 Mar 2022 12:03:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
 atishp@atishpatra.org, anup@brainfault.org, drew@beagleboard.org,
 hch@lst.de, arnd@arndb.de, wens@csie.org, maxime@cerno.tech,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com,
 behrensj@mit.edu, xinhaoqu@huawei.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com,
 rtrauben@gmail.com, samuel@sholland.org, cmuellner@linux.com,
 philipp.tomsich@vrull.eu
Subject: Re: [PATCH v8 12/14] riscv: remove FIXMAP_PAGE_IO and fall back to
 its default value
Message-ID: <20220331100356.GI23422@lst.de>
References: <20220324000710.575331-1-heiko@sntech.de>
 <20220324000710.575331-13-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324000710.575331-13-heiko@sntech.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_030400_010810_E414A289 
X-CRM114-Status: GOOD (  10.22  )
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

On Thu, Mar 24, 2022 at 01:07:08AM +0100, Heiko Stuebner wrote:
> If not defined in the arch, FIXMAP_PAGE_IO defaults to PAGE_KERNEL_IO,
> which we defined when adding the svpbmt implementation.
> 
> So drop the FIXMAP_PAGE_IO riscv define.

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
