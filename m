Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3140C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HFnu5C1tnEbIQzTwpURxNgcdhYVFn2S3nrxR6FHDI0s=; b=Wg6nyIawhAXm7J
	z7j7X2Co2SDaUSsxor2Frwg6zdhPOdj6uh9jF6SW8sEP/XLDLwglCYdGgOglZe+dkWJzW/hJOUJ4I
	G23IKkKCeQV2C6x4RHYhqM9dz1blVEay5JSIZn3PDqtAUK99lV4cs4JDUK8M9BZsFN6DWsN1oV/QQ
	5MyjrCL/dppni70iVmZMn2UdWUDw6TEZJxsdy8XxvYCoiwGTfifuVE1ChmEHSdBgYtPnz3JqrHW3U
	UZZIoDYvJjUpq38fJXlRC5n1LkYu28Cb0g/bkFL72c4IAiBLk/Oqg96tp/2zl1/HSpkx03AbhwE5T
	byOX1OeUVB5cca9HNZSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuETk-00F7gh-6k; Thu, 26 May 2022 14:28:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuETi-00F7gT-7W; Thu, 26 May 2022 14:28:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k7apNoi1g1YhGHKMlKvo5ejDwWGQrfqPL3Ty5xTWm5Q=; b=jt2D3c7xgVZUKhGsBafhmm2sFE
	7iHXpIRdAmkRqKCTrByt8vvIu4Y3EGktUCpnmPTFxq5LEtvIgLU7neTQ7C/IsI99LeEY7HaXKuYy7
	5ZrEicxpMCl0i/enkPZwHxhNQ3wSCLz0PWMpopuxkJst9ua3Mey2ATEpeisJ/smtNzknhVcxsQdkT
	dSKtJhfNJpH19fcWEk13NeBfTP6RD6LPE68nShdvuaPUklK12w19DAh/i1OVAzpUZ0A5rCLZKasUp
	WeWqziAdu0JgzoPn8WlmbMtIWF1JBvKksSw7KZdNfdrklRu0O6zxydJrgJF+gvKG7sfmTWPCyIS6G
	yc+jDrmg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuETR-001JAt-Fo; Thu, 26 May 2022 14:28:25 +0000
Date: Thu, 26 May 2022 15:28:25 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jessica Clarke <jrtc27@jrtc27.com>,
	kernel test robot <lkp@intel.com>,
	virtualization@lists.linux-foundation.org, netdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-rdma@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-parport@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-mm@kvack.org, linux-fbdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, alsa-devel@alsa-project.org
Subject: Re: [linux-next:master] BUILD REGRESSION
 8cb8311e95e3bb58bd84d6350365f14a718faa6d
Message-ID: <Yo+OiR6abzVksVTM@casper.infradead.org>
References: <628ea118.wJYf60YnZco0hs9o%lkp@intel.com>
 <20220525145056.953631743a4c494aabf000dc@linux-foundation.org>
 <F0E25DFF-8256-48FF-8B88-C0E3730A3E5E@jrtc27.com>
 <20220525152006.e87d3fa50aca58fdc1b43b6a@linux-foundation.org>
 <Yo7U8kglHlcvQ0Ri@casper.infradead.org>
 <20220526084832.GC2146@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220526084832.GC2146@kadam>
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

On Thu, May 26, 2022 at 11:48:32AM +0300, Dan Carpenter wrote:
> On Thu, May 26, 2022 at 02:16:34AM +0100, Matthew Wilcox wrote:
> > Bizarre this started showing up now.  The recent patch was:
> > 
> > -       info->alloced += compound_nr(page);
> > -       inode->i_blocks += BLOCKS_PER_PAGE << compound_order(page);
> > +       info->alloced += folio_nr_pages(folio);
> > +       inode->i_blocks += BLOCKS_PER_PAGE << folio_order(folio);
> > 
> > so it could tell that compound_order() was small, but folio_order()
> > might be large?
> 
> The old code also generates a warning on my test system.  Smatch thinks
> both compound_order() and folio_order() are 0-255.  I guess because of
> the "unsigned char compound_order;" in the struct page.

It'd be nice if we could annotate that as "contains a value between
1 and BITS_PER_LONG - PAGE_SHIFT".  Then be able to optionally enable
a checker that ensures that's true on loads/stores.  Maybe we need a
language that isn't C :-P  Ada can do this ... I don't think Rust can.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
