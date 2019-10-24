Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E71CA9EB9
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 01:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2812084B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 01:30:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tJjoElqy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2812084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=on+wI4v94QfqOTCWJPe42+1Cy0MyZ+fOiKoVV/9rDR0=; b=tJjoElqyUl3tin
	/qgxeogz+VRVmDKQz+lqvE/EoLsLd1axtGxlDof27yk8v0r33YzmuvYOZZy4v/gcKCvay29hPH51I
	Tt4bYgKY+daJh6SEfUxLFe94a2gdn3dRJtyHDicFjQRcBCZBV+pWohL1DzuF5rYXcp9wLTmZ9TMn+
	phbWM5JrQXCTGktE+ygB0pJ+Kc39q2leSleGVlZRv3nbfrni3Eyf/kLABBzYvmaDYZpdmAoIxaKup
	aP3dKXTJPF2XiYcGvzE5NVKuUpLYXe0Z/cB/EQmiYuM6ymwO17b6P9RFJsx9QdJcE5LOUv9yi+T7W
	2lZVSHWaByupFPXApb2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNRxF-0001YO-TN; Thu, 24 Oct 2019 01:30:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1iNRxD-0001Xn-Co; Thu, 24 Oct 2019 01:30:19 +0000
Date: Wed, 23 Oct 2019 18:30:19 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] irqchip: Skip contexts other supervisor in plic_init()
Message-ID: <20191024013019.GA675@infradead.org>
References: <alpine.DEB.2.21.9999.1910231152580.16536@viisi.sifive.com>
 <mhng-aefb3209-29c4-46db-8cf2-e12db46d9a6e@palmer-si-x1c4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-aefb3209-29c4-46db-8cf2-e12db46d9a6e@palmer-si-x1c4>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: jason@lakedaemon.net, maz@kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, alan.mikhak@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, tglx@linutronix.de,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 23, 2019 at 03:07:10PM -0700, Palmer Dabbelt wrote:
> > > +		/* skip contexts other than supervisor external interrupt */
> > > +		if (parent.args[0] != IRQ_S_EXT)
> > >  			continue;
> > 
> > Will this need to change for RISC-V M-mode Linux support?
> > 
> > https://lore.kernel.org/linux-riscv/20191017173743.5430-1-hch@lst.de/
> 
> Yes.

For M-mode we'll want to check IRQ_M_EXT above.  So we should just
merge this patch ASAP and then for my rebased M-mode series I'll
fix the check to do that for the M-Mode case, which is much cleaner
than my hack.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
