Return-Path: <SRS0=DSzU=WD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30FEC433FF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 15:12:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79E54218FE
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 15:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NVYMLGjk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 79E54218FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uw0v1l0VJHXPHI9IuX8U5R8fFOPLNYGmphCpDBVCdRI=; b=NVYMLGjk03k31W
	fd3+8TBVPIvQxmRZ4/T/0IUiHGjIBK9vYcZ7BznzSJVXuQQyLz7ci9rBoUWtULfDHRKx0EAqEnMfM
	OwIkYuk4ST5K6k4SJszAAVmDVViaOBtyanKOe8KlUPaofkTo8Efl2p4Q9hKoMJwFbEnY3mODsXmub
	OnXBYOR2nrcPlJBFOuFvNfmog7vr1fsrWjJcc0oc8mq34HgMa3JO4eN1sTiUsa+V0dt2Luy5DS+QS
	AHloK22bQiYYvwkH7t07OZGt2mtIw63gy9MX8UjfB0iYuDyFZeS4FIUJPkwfU2q2lKi2WeM5DOaj3
	RV8188i5VKNGhPSzU3uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvNc7-0004ba-B1; Wed, 07 Aug 2019 15:12:31 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hvNc6-0004bD-1i; Wed, 07 Aug 2019 15:12:30 +0000
Date: Wed, 7 Aug 2019 08:12:30 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH] riscv: kbuild: add virtual memory system selection
Message-ID: <20190807151229.GA16432@infradead.org>
References: <alpine.DEB.2.21.9999.1907261259420.26670@viisi.sifive.com>
 <20190802084453.GA1410@infradead.org>
 <alpine.DEB.2.21.9999.1908061648220.13971@viisi.sifive.com>
 <20190807054246.GB1398@infradead.org>
 <c331e389-5f33-634a-f62f-e48251ca4cfe@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c331e389-5f33-634a-f62f-e48251ca4cfe@ghiti.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 07, 2019 at 09:04:40AM +0200, Alexandre Ghiti wrote:
> I took a look at how x86 deals with 5-level page table: it allows to handle
> 5-level and 4-level at runtime by folding the last page table level (cf
> Documentation/x86/x86_64/5level-paging.rst). So we might want to be able to
> do the same and deal with that at runtime.

Yes, following the X86_5LEVEL model is the right thing.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
