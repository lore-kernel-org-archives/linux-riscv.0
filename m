Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC1BC282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:46:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6ACB222B1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Vzay73LC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6ACB222B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkOc3ZtO3Ri3hPO2CjfOmIZlEOOu+ZVxXO5BuyIkHtM=; b=Vzay73LC4Ifapj
	q0FmFzlFqU6vdJ9gUyfFRCY07DO8L96A4Q0oyPbUh6uqu3mDG4kDdSg8BrWaSj4fIxV+E8w4TL/V9
	yYNl9dFdJv09kLhwJtdc5N4UkTHA3xZGeTguhKEMpLIqmyRfMh9Uj3/L1sdWO6lGKr5e9EidMps5x
	9Q9WFOsnFA2tyXz4McqL3h2yt1EWMPtk3sI+Areb+fDDthK7GdXWRvalLClyLGoMnHuwASEB8mO3Z
	220xsS4y2kqZ5wiw1T3dQhXCO2wzQSKkiIoW9I/MhZJXp1s4QxVKCmkTOx4vNaISmd+PYJTCQ2GdC
	OpOaFfrM+oUQo7rgEfYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtyc1-0006Xs-MS; Wed, 13 Feb 2019 17:46:21 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtybz-0006XR-6i
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 17:46:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCBFFA78;
 Wed, 13 Feb 2019 09:46:18 -0800 (PST)
Received: from fuggles.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 522783F675;
 Wed, 13 Feb 2019 09:46:17 -0800 (PST)
Date: Wed, 13 Feb 2019 17:46:08 +0000
From: Will Deacon <will.deacon@arm.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/2] asm-generic/io: Pass result on inX() accessor to
 __io_par()
Message-ID: <20190213174608.GA29100@fuggles.cambridge.arm.com>
References: <20190211174544.4302-1-will.deacon@arm.com>
 <20190211174544.4302-2-will.deacon@arm.com>
 <CAK8P3a1gmJTt+jdTbdSYZ0z43qodxf+co757K1-Hq1mj4fCqQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a1gmJTt+jdTbdSYZ0z43qodxf+co757K1-Hq1mj4fCqQA@mail.gmail.com>
User-Agent: Mutt/1.11.1+86 (6f28e57d73f2) ()
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_094619_249415_CA455A84 
X-CRM114-Status: GOOD (  19.82  )
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 andrew.murray@arm.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 12, 2019 at 12:55:17PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 11, 2019 at 6:45 PM Will Deacon <will.deacon@arm.com> wrote:
> >
> > The inX() I/O accessors must enforce ordering against subsequent calls
> > to the delay() routines, so that a read-back from a device can be used
> > to postpone a subsequent write to the same device.
> >
> > On some architectures, including arm64, this ordering can only be
> > achieved by creating a dependency on the value returned by the inX()
> > operation, so we need to pass the value we read to the __io_par()
> > macro in this case.
> >
> > Reported-by: Andrew Murray <andrew.murray@arm.com>
> > Signed-off-by: Will Deacon <will.deacon@arm.com>
> > ---
> >  include/asm-generic/io.h | 8 ++++----
> 
> For changing the asm-generic file in the arm64 tree,
> 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks, Arnd.

> For all I can see, this should not conflict with the usage of the
> same macros on RISC-V, though it does make add a significant
> difference, so I'd like to see an Ack from the RISC-V folks as
> well (added to Cc), or possibly a change to arch/riscv/include/asm/io.h
> to do a corresponding change.

There's already a comment in that header which says that the accesses are
ordered wrt timer reads, so I don't think anything needs to change there.
For consistency with the macro arguments, I could augment their __io_par to
take the read value as an unused argument, if that's what you mean?

Will

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
