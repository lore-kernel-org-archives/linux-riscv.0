Return-Path: <SRS0=JEfp=W2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBFE1C3A5A6
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2019 16:08:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0EB423427
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2019 16:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bVu9gkNS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0EB423427
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgcfYeYOyQAQijJ2ixXikO2U9XWnE8Fdh8f6qPoExI8=; b=bVu9gkNSWCDpIQ
	VJLCMLaUwcVILYn+MQ6SgQ2bDR7RLdmUwDfv/WFjxgxXDPWP58fu/kCK3pTWHOy1h/mdwm6h/c5As
	PEeoUa5dVb4ScVoe+oMNyqXvuYhFUR/TgEKNGph3zAf22s8ehhrOdyovPgVjkn5NLM4mGzi9kUDUQ
	muvtf9jUaZfELcufoTEpbhLwQyjUlqaSDTY2aWz2kdT0lDA7xCL2nuOWmdg4iPn2n+IqWm7ss5jJv
	o9SOnQtCdfVFPgGK6p8ghAVxza+xAHI/JmEsUMCLLbCdpw1NTB3jvrQ1JH52vLF7aKohRWzwCirAr
	DBxQg5nz78N2m7/juD9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3jSI-0007Ow-IW; Fri, 30 Aug 2019 16:08:54 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3jQa-0005m8-70; Fri, 30 Aug 2019 16:07:09 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 5D5BB227A8A; Fri, 30 Aug 2019 18:07:05 +0200 (CEST)
Date: Fri, 30 Aug 2019 18:07:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Stafford Horne <shorne@gmail.com>
Subject: Re: [PATCH 05/26] openrisc: map as uncached in ioremap
Message-ID: <20190830160705.GF26887@lst.de>
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-6-hch@lst.de>
 <20190823135539.GC24874@lianli.shorne-pla.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823135539.GC24874@lianli.shorne-pla.net>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_090708_701169_B336D2F0 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-hexagon@vger.kernel.org, x86@kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Greentime Hu <green.hu@gmail.com>,
 linux-mtd@lists.infradead.org, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 23, 2019 at 10:55:39PM +0900, Stafford Horne wrote:
> On Sat, Aug 17, 2019 at 09:32:32AM +0200, Christoph Hellwig wrote:
> > Openrisc is the only architecture not mapping ioremap as uncached,
> > which has been the default since the Linux 2.6.x days.  Switch it
> > over to implement uncached semantics by default.
> > 
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> > ---
> >  arch/openrisc/include/asm/io.h      | 20 +++-----------------
> >  arch/openrisc/include/asm/pgtable.h |  2 +-
> >  arch/openrisc/mm/ioremap.c          |  8 ++++----
> >  3 files changed, 8 insertions(+), 22 deletions(-)
> 
> Acked-by: Stafford Horne <shorne@gmail.com>

Can you send this one to Linus for 5.4?  That would help with the
possibility to remove ioremap_nocache after that.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
