Return-Path: <SRS0=X+rF=T6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05842C28CC0
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 11:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF79A25874
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 May 2019 11:51:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g2oyBvCW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF79A25874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pC+oxBQGLHFGgy/14oXB69szaUcS1y13sNLXkP/b71Y=; b=g2oyBvCW6VBidL
	sXpejCAmNK323HdQiCLffLmUbt14NHaaM8aEIBCiSamw0R84X9TIDrbUDw0/ckJyNXe6zsEDBtPO3
	I+xQFZashXQ/BCUeSqAMnHIoOyHIs5VVomvdVWJaXd9c713uAHyqLkoHEI7EeNeosS/bU4Q6xJrm1
	hMJOPbujsO2Goezgy8a8GPkGHhI5dMdK0d05gqJcG6M2thTaZ9s4LTvb2V5srHILKurSxlHtcLYgs
	5IPxiooMZMx+dHddwCQUw9rnSdqy2l95P/WWv12Op//O6mt7pgBGo3tbzmUp5D2NtEjXUam6L/EGH
	v/V+cfq2Maj2z+rLzUuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hWJae-0005qb-87; Thu, 30 May 2019 11:51:24 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hWJaX-0005kQ-Jo; Thu, 30 May 2019 11:51:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E85B9374;
 Thu, 30 May 2019 04:51:13 -0700 (PDT)
Received: from e105550-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A814B3F5AF;
 Thu, 30 May 2019 04:51:09 -0700 (PDT)
Date: Thu, 30 May 2019 12:51:03 +0100
From: Morten Rasmussen <morten.rasmussen@arm.com>
To: "Andrew F. Davis" <afd@ti.com>
Subject: Re: [PATCH v6 1/7] Documentation: DT: arm: add support for sockets
 defining package boundaries
Message-ID: <20190530115103.GA10919@e105550-lin.cambridge.arm.com>
References: <20190529211340.17087-1-atish.patra@wdc.com>
 <20190529211340.17087-2-atish.patra@wdc.com>
 <49f41e62-5354-a674-d95f-5f63851a0ca6@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49f41e62-5354-a674-d95f-5f63851a0ca6@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190530_045117_656703_D116953D 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Rob Herring <robh@kernel.org>, Anup Patel <anup@brainfault.org>,
 Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, May 29, 2019 at 07:39:17PM -0400, Andrew F. Davis wrote:
> On 5/29/19 5:13 PM, Atish Patra wrote:
> >From: Sudeep Holla <sudeep.holla@arm.com>
> >
> >The current ARM DT topology description provides the operating system
> >with a topological view of the system that is based on leaf nodes
> >representing either cores or threads (in an SMT system) and a
> >hierarchical set of cluster nodes that creates a hierarchical topology
> >view of how those cores and threads are grouped.
> >
> >However this hierarchical representation of clusters does not allow to
> >describe what topology level actually represents the physical package or
> >the socket boundary, which is a key piece of information to be used by
> >an operating system to optimize resource allocation and scheduling.
> >
> 
> Are physical package descriptions really needed? What does "socket" imply
> that a higher layer "cluster" node grouping does not? It doesn't imply a
> different NUMA distance and the definition of "socket" is already not well
> defined, is a dual chiplet processor not just a fancy dual "socket" or are
> dual "sockets" on a server board "slotket" card, will we need new names for
> those too..

Socket (or package) just implies what you suggest, a grouping of CPUs
based on the physical socket (or package). Some resources might be
associated with packages and more importantly socket information is
exposed to user-space. At the moment clusters are being exposed to
user-space as sockets which is less than ideal for some topologies.

At the moment user-space is only told about hw threads, cores, and
sockets. In the very near future it is going to be told about dies too
(look for Len Brown's multi-die patch set).

I don't see how we can provide correct information to user-space based
on the current information in DT. I'm not convinced it was a good idea
to expose this information to user-space to begin with but that is
another discussion.

Morten

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
