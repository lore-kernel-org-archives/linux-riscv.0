Return-Path: <SRS0=N7Yn=RL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E3FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:31:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0A7C20851
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2019 16:31:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="azj0Ze7V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0A7C20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UqYOz+DuzZOOwWI0F56/ozTkSh8vAx+72GjS+jreww8=; b=azj0Ze7VXxOKtB
	4AlK+fKZ7a5zY09qdNLCTbUwCQHL5rs99TaA2RLoLuyxhikRMSPQu1g+oHx2c3fzRv5I50kxWu61R
	nYEGg5lyyfyhg5m+uLWFxN/BE040+2QyiMBD8+el9w0A1P2rBqa9wYIbhuWHF7W2A4vDeEvjLC+l4
	4eod0cWOz9u3ybq5EhBACAUTHu+G4hW9li9shd9hyydbYXCQgvLfivrHo5ooHdrKa2X3OGoci9teb
	RF6AhdewMtM04luJ2GUiIUgl+Ob15MEwVhT++yLAMtzxnXh4A5rXAq34q6qUM2q8G9rwZJHa8qKyU
	VLYPJaCke7VwblVObPww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h2IP9-0005OZ-1E; Fri, 08 Mar 2019 16:31:27 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1h2IP7-0005OD-Pu; Fri, 08 Mar 2019 16:31:25 +0000
Date: Fri, 8 Mar 2019 08:31:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH 3/3] riscv: rewrite tlb flush for performance improvement
Message-ID: <20190308163125.GB310@infradead.org>
References: <LO2P265MB08471CC8597FD60691334624D64C0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
 <20190308143928.GC32707@infradead.org>
 <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <04cbcd8e-77b4-b3fa-8f9e-3aa07db781fc@garyguo.net>
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
Cc: Christoph Hellwig <hch@infradead.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Mar 08, 2019 at 03:55:43PM +0000, Gary Guo wrote:
> The problem is that technically SBI should hide the details, and we 
> should automatically, and transparently benefit from architectural 
> hardware acceleration.

But it doesn't.  The SBI effectively requires an additional trap,
which makes the whole thing a little pointless.  I'd much rather
have well working code in the kernel, and if people want to do
hardware based TLB flushing to propose a well defined Supervisor
ABI extension for it.

> Currently we have no way to retrieve the ideal size - so I just provide 
> a hardcoded constant. What do you suggest for short-term before we have 
> a reliable way to retrieve this value?

Kernel boot option.

> >> +#ifndef CONFIG_SMP
> > 
> > If you rewrite this anyway can you switch the order around and use
> > an ifdef instead of ifndef?
> 
> I did a fast grep on other archs, and it seems that at least for 
> CONFIG_SMP, it's more common to put non-SMP part first.

Most of that probably is copy and paste from x86 which had the
non-SMP version only first.  Still not a good idea.

> >> +	if (size == (unsigned long) -1) {
> > 
> > Maybe add a symbolic RISCV_FLUSH_ALL macros for the magic -1?
> 
> This is just to unify with SBI (currently we also use -1 in SBI-calls). 
> Since the argument is unsigned long, from 0 to -1 basically just 
> represent the entire address space. Do you think it's better to replace 
> all SBI with -1 argument with a macro as well?

Note that I'm fine keeping the (unsigned long)-1 as the actual ABI, it
just would nice to give it a symbolic name.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
