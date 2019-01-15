Return-Path: <SRS0=k4h2=PX=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8368C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 20:52:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A019E20657
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 15 Jan 2019 20:52:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sj9xmTLa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A019E20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6CjSZ/7gAinJhGMOpfoP9XVBAMyGrv/jYLCQ7IjsW8=; b=Sj9xmTLaOusWOn
	9SdAR4UZSkNjHRewRDcZxmOfj1fMxatHx2w1gSX8SJcj0lat+OTXa9eNbcldyLDD9Qdqh84kSnflc
	DdU9jH6WoghTC8W7r/hQbOmdtxOwB8j0/LfCVkYpOaD90gQYu7HVqYD3YRh1G5cGLN+o1g2BC/G4v
	L3udrLkmv4lzo3GJquQ5aSZbcAhyYvnXQMZueOHG3WCh1ms3s0caLhWEE/oK6ARpjC1JPp+j7nCja
	Lc2D7BqH/5fpJRm1ieGevxHPXvdkFw1VVoYZ9NraAbY4O6dPP12tx83wMl+xMS66X1ZKGA5C3o/Dn
	jZwER7U+hpfPQsWR6C9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gjVhb-0006oT-7Y; Tue, 15 Jan 2019 20:52:51 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1gjVhY-0006ns-JI; Tue, 15 Jan 2019 20:52:48 +0000
Date: Tue, 15 Jan 2019 12:52:48 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH 0/3] Hugetlbfs support for riscv
Message-ID: <20190115205248.GA21340@infradead.org>
References: <20181210062146.24951-1-aghiti@upmem.com>
 <91664ec7-d148-1c0a-8d1a-82815c5c7f6a@oracle.com>
 <20190115160429.GA29683@infradead.org>
 <5454277c-410d-f24e-882e-02442af8a719@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5454277c-410d-f24e-882e-02442af8a719@oracle.com>
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
Cc: mingo@kernel.org, aou@eecs.berkeley.edu, catalin.marinas@arm.com,
 palmer@sifive.com, ndesaulniers@google.com, Alexandre Ghiti <aghiti@upmem.com>,
 Christoph Hellwig <hch@infradead.org>, atish.patra@wdc.com,
 linux-riscv@lists.infradead.org, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jan 15, 2019 at 11:25:07AM -0800, Mike Kravetz wrote:
> I would actually prefer that this be a separate patch.  Why?
> - The functionality is arch independent and not specific to riscv.
> - This functionality was intended in commit 944d9fec8d7a ("hugetlb:
>   add support for gigantic page allocation at runtime").  However,
>   there was no need to tie the functionality to CMA or (MEMORY_ISOLATION
>   && COMPACTION).
> 
> I don't care enough to insist the patch be separate.  Just seems like
> it should be separate to me.

Oh, I agree it should be a separate patch.  But it would be nice to
merge it together with the RISC-V hugetlb support, so that it can
depend on the patch instead of the current somewhat odd Kconfig
dependencies.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
