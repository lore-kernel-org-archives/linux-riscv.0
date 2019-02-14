Return-Path: <SRS0=J1nd=QV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2804FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 17:04:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0C3222DA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 14 Feb 2019 17:04:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HEU3TK6+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA0C3222DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ViBtOy5TIBWp2I5x1DnGwp0V0usoXZuMkbDwmPJPkOc=; b=HEU3TK6+sjQW/r
	glwFUhinssyjv20lUVmuydLDaDFuSyG6IYi9C317t8Z1oeYLepPK7aTkDEffjZwIvyI6WOFu/Y2VC
	6beYzW5PnEApWsQ8m1d0BabWl8WVYYF24MzMQt+SiQCBTzcJyd2zSUJ1kiVwgh4scHk6JE0j0gFdX
	fzk7QWF7weYsBm9wU9mVXWUbz9881C6pDQunRCjPqY0vLeJCrgAQ3cyX/0TW0PHBCyYTJCEp5UFhA
	UajclscGVDKRQJbcYIi8ro1hhEPBoT/YHy2fKz7r3bV3XV11sLOxver27M2cZCXZU4aAbXTCLJiJx
	b6YN0KlSKlQI0Np+Z6KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1guKRJ-0000nY-5H; Thu, 14 Feb 2019 17:04:45 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1guKRG-0000nD-JR
 for linux-riscv@lists.infradead.org; Thu, 14 Feb 2019 17:04:44 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 0BBFA6FA8D; Thu, 14 Feb 2019 18:04:41 +0100 (CET)
Date: Thu, 14 Feb 2019 18:04:40 +0100
From: Christoph Hellwig <hch@lst.de>
To: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 03/11] kernel/locks: consolidate RWSEM_GENERIC_* options
Message-ID: <20190214170440.GB32441@lst.de>
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-4-hch@lst.de>
 <CAMuHMdW4C1McxL-e7ZSiSOiiE5D=xbBK8FZOwuJ1w0kK3CR1Hg@mail.gmail.com>
 <d9aeeedd-ce72-f58f-d858-3e340c073414@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9aeeedd-ce72-f58f-d858-3e340c073414@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190214_090442_786669_A0F741B6 
X-CRM114-Status: UNSURE (   6.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-kbuild <linux-kbuild@vger.kernel.org>, linux-xtensa@linux-xtensa.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 14, 2019 at 10:26:52AM -0500, Waiman Long wrote:
> Would you mind dropping just patch 3 from your series?

Sure, we can just drop this patch.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
