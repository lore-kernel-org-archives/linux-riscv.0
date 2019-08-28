Return-Path: <SRS0=k0Aq=WY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE28C3A5A1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2019 06:09:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B1432173E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2019 06:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TvbdzrXW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B1432173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68D2w/f6hDP8M+IrdRD5/xxU2nfOaTgfGe80G7BYAH8=; b=TvbdzrXWc2JHm0
	i7YlK0+ip1uw1/qEe7Db5w/LkjnUdOl731cf2y8xgOHiajUjCe40C5dPW5eAC6XdmSmSAQX5tOK8Q
	0kmKIVr2TNyox78Aj4f5tZotrhxOSKwXaVH+x1NHKcZdBPABWNXk4NnYm+2WQXtMaPx59sLLEhapZ
	+KhdDQyW3fNIVTf1/E4YZzAqvUbMUgo5UXr0a2XSaG0Uy9llQ4LxLe5UmNnX2b4+Ca613PJZUdgBi
	PIOCHVC5UEssi7D25J8zivVVux+67LLZu1CRduYoVYQS9Kr4HPmRUw4qbOCgBMsB2zC4z0NqmZlnx
	ny5ntlVIWqtyiAEr8bLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i2r9U-000658-9Q; Wed, 28 Aug 2019 06:09:52 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i2r9Q-00064Q-AZ
 for linux-riscv@lists.infradead.org; Wed, 28 Aug 2019 06:09:50 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9028268AFE; Wed, 28 Aug 2019 08:09:42 +0200 (CEST)
Date: Wed, 28 Aug 2019 08:09:42 +0200
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH 8/8] riscv: ignore the SYS_RISCV_FLUSH_ICACHE_LOCAL flag
Message-ID: <20190828060942.GA21592@lst.de>
References: <20190822065612.28634-9-hch@lst.de>
 <mhng-363188c5-b80c-4935-8a84-861fbdb1e8e4@palmer-si-x1e>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-363188c5-b80c-4935-8a84-861fbdb1e8e4@palmer-si-x1e>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190827_230948_519212_C627A7A0 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 27, 2019 at 06:10:33PM -0700, Palmer Dabbelt wrote:
> This is meant to perform a context-local flush, not a cpu-local flush.  The 
> whole point here is that userspace doesn't know anything about CPUs, just 
> contexts -- that's why we have this deferred flush mechanism.  I think the 
> logic is complicated but sound, and removing this will almost certainly 
> lead to huge performance degradation.

All calls to flush_icache_mm are local to the context.  Take a look at
what the current code does:

 - set all bits in context.icache_stale_mask
 - clear the current cpu from context.icache_stale_mask
 - flush the cpu local icache
 - create a local others mask containing every cpu running the context
   except for the current one
 - now if others is empty OR the local flag is set don't do anything
   but a memory barrier, else flush the other cpus

>
> Maybe I'm missing something, what is the specific issue?

The issue is that the current implementation of
SYS_RISCV_FLUSH_ICACHE_LOCAL only flushes the icache of the currently
running core, which is an interface that can't be used correctly.

riscv_flush_icache without that flag on the other handle already just
flushes the caches for the cpus that run the current context, and then
causes a deferred flush if the context gets run on another cpu
eventually.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
