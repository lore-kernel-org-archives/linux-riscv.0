Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A811CC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 05:49:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78ACA2082E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 05:49:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DhTK4BPG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78ACA2082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7iJk2GOX0XZiwi1w8rjn9tqioVjRomgf1kkEiKQP2fE=; b=DhTK4BPGSMvzVO
	KQviXCj83gqHRj9HUNy4lUAuwxHxCZuh38smZsfwVmBWAuPKEBbISHcCHV/UG18gdr7Lh7VpBud0d
	aIIPGnYkFhXHIhv8/PxFGEsk1PMyJn7Q0TbQXitnPqabPPWGCWm/5l/xiAz+sVgHcq2CZk8vZ3vTg
	Py5yd/3ohlDeAbM55hytNXXCulNTqC+uEc28EqFyotxPmJ7jbGqI+BreV1K2cfVGmpmGo+SMvXlBB
	VZR3+qj2sU9P9cYaCayApqc0T6CLKs5emPlNZulpFLO/mMz0eKqDVHC3N6zfiWrQMyUQqjbEfjp2r
	deB7hb3HBfRyYuw4tEow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEp4V-00071M-KS; Fri, 12 Apr 2019 05:49:55 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hEp4S-00070r-AI; Fri, 12 Apr 2019 05:49:52 +0000
Date: Thu, 11 Apr 2019 22:49:52 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
Message-ID: <20190412054952.GA26672@infradead.org>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411114616.GA10032@infradead.org>
 <alpine.DEB.2.21.9999.1904111405470.19990@viisi.sifive.com>
 <3cf7f2d8-3039-7dd7-e243-77433b1f23a6@wdc.com>
 <alpine.DEB.2.21.9999.1904111618460.21321@viisi.sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.9999.1904111618460.21321@viisi.sifive.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 05:08:11PM -0700, Paul Walmsley wrote:
> However: the vast majority of users -- even embedded users -- will not use 
> a kernel with a bundled DTB.  This is because it irrevocably ties that 
> kernel binary to one specific board type.  I hope it is obvious why this 
> would be a non-starter for Linux distributions, and, more generally, 
> anyone who wants their kernels to be usable on multiple boards.  Those 
> distributors would need to ship one kernel binary per board, or bloat 
> their kernels with DTBs and come up with some new mechanism to select one.

Yes, that is the point why the DTB usually comes with the firmware.
In my case I need it because by nommu M-mode Linux port targeted to
the Kendrye _is_ the firmware and there is nothing else running on that
tiny system.

But why are you submitting the DTB files if there is not ways use them
from the kernel?  That is what I was wondering about.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
