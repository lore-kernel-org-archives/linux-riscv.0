Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5E6C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 11:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JNyrAkQoq2wba2fQuctq1koOYTu8px7FBhOQH6zwKc=; b=JQfRNLBR8KaP7s
	T6KqBNge/Ycxg6bw2Jo831D2vvJedmzx/UgJXRFLliF0o1qdbupKWbtmwiO5Bkb2jq/5JGVpangWu
	q2saa9Kgu/dsQ296q4HTK3m6RtR187oCBqj0wcg5Z6KSzjB6m3leS9jGPQwITr7kmlZsneDxgW75R
	AQ7K+0RxYLQaRpM9JRGbwkydKqzLCZ4m9606ruuz5KH+CL/i0r4Er88SGY4I3u+oldg9+3Y2omAT5
	BpfoCwEZt5ySQ0myZIhBwPPil8zgQOPSjNHeCVQfMULrEA1pUflh9eSIYEP9kjWS2gfe02VmJ05xT
	z7qBVxVSpcAtG8bTNbFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93fh-009lg3-Bj; Wed, 06 Jul 2022 11:58:21 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o93fe-009lcH-65
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 11:58:19 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id A49B868AA6; Wed,  6 Jul 2022 13:58:07 +0200 (CEST)
Date: Wed, 6 Jul 2022 13:58:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Christoph Hellwig <hch@lst.de>, LABBE Corentin <clabbe@baylibre.com>,
	herbert@gondor.apana.org.au, heiko@sntech.de,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RFC PATCH] crypto: flush poison data
Message-ID: <20220706115807.GA16222@lst.de>
References: <20220701132735.1594822-1-clabbe@baylibre.com> <4570f6d8-251f-2cdb-1ea6-c3a8d6bb9fcf@codethink.co.uk> <YsP0eekTthD4jWGV@Red> <20220705164213.GA14484@lst.de> <ec401a51-5895-fce7-1075-a2c964466d2b@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec401a51-5895-fce7-1075-a2c964466d2b@codethink.co.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_045818_415055_327F19C6 
X-CRM114-Status: GOOD (  11.14  )
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

On Wed, Jul 06, 2022 at 10:47:24AM +0100, Ben Dooks wrote:
> I'm not sure that the dma-mapping code for non-coherent riscv systems
> did get sorted. I couldn't find any when looking in 5.17.

Yes, none of that is upstream.  But as supporting it is essential for
the allwinner SOCs I'm pretty sure Corentin is not actually using an
upstream kernel anyway.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
