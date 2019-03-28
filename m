Return-Path: <SRS0=Etk4=R7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FD53C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E404820823
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2019 16:57:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JaFH9B+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E404820823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yW5CKOn8nvGMkzYOEljqCLXaXyjsVGKYCqOXW7OwDuI=; b=JaFH9B+6L6zcNv
	Pz9PUk0y4NaVeqDpvAcCcp/EFqlINk/OSVH/vi4HWug1gwBlfUWPol0f82HxvW9lt9uuEVs5Krirx
	/3R1DWGt+DuEEFe74kIM0dTllZiWMX8zitI7xTNKoNBXS+7BvlW1DJkTGLpITdhNdu0/I1/ym3PSp
	spPKG42wUfsA0apP9NyYckqysxGqN5U3d5VUl/J1JMgo3nSYF01RdpZGNh7lD52TgSOvzravpzNwr
	N53aXDz+abJXTqhLJV5IPCMC0HvKP+Nje4/6KUfarBUJF9NMRMGk9YEDV7u/A18ZNNEldTsXo0+9r
	6IMQGcuD1HCpz1JXjz6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9YLT-0004Hh-M1; Thu, 28 Mar 2019 16:57:39 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h9YLS-0004Fj-8r; Thu, 28 Mar 2019 16:57:38 +0000
Date: Thu, 28 Mar 2019 09:57:38 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH v4 5/5] riscv: implement IPI-based remote TLB shootdown
Message-ID: <20190328165738.GB10231@infradead.org>
References: <cover.1553647082.git.gary@garyguo.net>
 <d1c980f2e49192c7cb2ddd4f3e4af577d1eaf539.1553647082.git.gary@garyguo.net>
 <20190327073131.GA4519@infradead.org>
 <be4911ab-9234-132d-1421-f0a06c2038d4@garyguo.net>
 <20190328163647.GA6577@infradead.org>
 <bf1771ca-6bb9-0740-87e4-3ef91e680bf4@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf1771ca-6bb9-0740-87e4-3ef91e680bf4@garyguo.net>
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
Cc: Palmer Dabbelt <palmer@sifive.com>, Anup Patel <Anup.Patel@wdc.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 28, 2019 at 04:47:36PM +0000, Gary Guo wrote:
> Caller of local_flush_tlb_page (and the non-local) version shouldn't 
> care about ASID. They only care about a particular MM. flush_tlb_page 
> always takes a MM as argument and I see no point about why we shouldn't 
> in the local version.

There is exactly two callers in the tree with your patches, one of
which is the !SMP version of flush_tlb_page, and the other is
update_mmu_cache, so I'm really not worried about spreading ASID
information too far.  And all that is only a concern once we get
ASID support anyway.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
