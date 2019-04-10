Return-Path: <SRS0=ShlG=SM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3839C10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 07:04:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FCFB217D6
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2019 07:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AP7E2siz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FCFB217D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r3/w5PxHUMDf9PDdX2CVttpe2QTDcH+meIUrxa9qBOE=; b=AP7E2sizc6/si6
	M35Go+nzkBHKjQ5KZMvOysZZucfJgybMNT1bEqKJtCUikbC3x/Owgm2c0reTKsoDhChXWlKaMljq7
	77UgJO0+hWcusc5VGEqfx81xC2U9Gs3oJ8dj9UmbZS2DMMaTpO2bxmTkwRPMlwuCLKe/X6EJb0aAP
	pDg+f/7yAo725+VJ/JemP6TtwoOY+4LxTFwOJ6bRiq8XVnZT8bMursVs0wwCoExX85ecgt2t2Wkek
	l/Ycl3oD1Lu6b/e0WxjcR51NX9iUHp7RcsMiUL5X/mdZH+JobH2LxAGT1lk73DoBJSQvEQIPh11Do
	CN2eLyP7HpPuOAaUaHhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hE7Hs-0005ip-HS; Wed, 10 Apr 2019 07:04:48 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hE7Hq-0005gz-QK; Wed, 10 Apr 2019 07:04:46 +0000
Date: Wed, 10 Apr 2019 00:04:46 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v4 0/5] TLB/I$ flush cleanups and improvements
Message-ID: <20190410070446.GA18678@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1553647082.git.gary@garyguo.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: Anup Patel <Anup.Patel@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>, opensbi@lists.infradead.org,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Mar 27, 2019 at 12:41:11AM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> This is the v4 of the general TLB/I$ flush improvement series.
> I still have tlbi_method=ipi being the default as opposed to what
> Atish suggests, as:
> * There are still usage of BBL in the wild
> * OpenSBI's support isn't made into stable yet.
> * OpenSBI's support on the dev branch has some racing issues yet to resolve.

Can you clarify the races?  I know Anup had some FIFO-order commits
in opensbi about a week ago, did they address you concerns?

Anup, do you have performance numbers for the old opensbi vs your
implementation of the optimized TLB flushing vs this patch?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
