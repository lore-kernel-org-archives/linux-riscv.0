Return-Path: <SRS0=D0Wr=CO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB46C433E2
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 07:17:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B9720760
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2020 07:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xXVASGYb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B9720760
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AwawhG8+x8Y/Ji3mdLiKckAww5yV5kk6sHKo62zpi3E=; b=xXVASGYbXsXtOlO1dBsFPUEAI
	oAMIsmgxYjOyX0oA1qUHhVx9vpaKdqLVksDNvuycQ4ekN+k5SgDsApKzmzK3jlj33OhgquBo02Gm8
	Uw93JvJETJMFzE7jn+GTl1WsMv1RS37w6guFOBUCyenFgImGFKSE9Qa88ZV04hwVvWbKDj52D694a
	bsJOEibnqLtFJXTPV1yhtbW4FO1Tin+zgetZqZSLqPwXpB/tLUNtffZB84zXO8aWnY3C+xkvKEeGp
	4OzU4pKpV+UXO7N2aiIrEXCdpJU/22qeA94+EZItO0rAXWzQZ1ssHDnOFltHTy//Rh1V8ZjgTKABP
	z3DMJp9Zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kESSC-0003Mn-1A; Sat, 05 Sep 2020 07:17:40 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kESSA-0003MR-4d
 for linux-riscv@lists.infradead.org; Sat, 05 Sep 2020 07:17:38 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id B982C68BEB; Sat,  5 Sep 2020 09:17:35 +0200 (CEST)
Date: Sat, 5 Sep 2020 09:17:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: remove set_fs for riscv
Message-ID: <20200905071735.GB13228@lst.de>
References: <20200904165216.1799796-1-hch@lst.de>
 <CAK8P3a3t8a0gD2HsoPsMi7whtNb7BdzPN6-oo6ABnqkbQJoBfA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3t8a0gD2HsoPsMi7whtNb7BdzPN6-oo6ABnqkbQJoBfA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_031738_304464_43E053AE 
X-CRM114-Status: GOOD (  10.57  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 04, 2020 at 08:15:03PM +0200, Arnd Bergmann wrote:
> Is there a bigger plan for the rest? I can probably have a look at the Arm
> OABI code if nobody else working on that yet.

m68knommu seems mostly trivial and not interact much with m68k/mmu,
so that woud be my next target.  All the other seems to share more
code for the mmu and nommu case, so they'd have to be done per arch.

arm would be my first target because it is used widespread, and its
current set_fs implemenetation is very strange.  But given thar you
help maintaining arm SOCs and probably know the arch code much better
than I do I'd be more than happy to leave that to you.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
