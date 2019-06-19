Return-Path: <SRS0=pesg=US=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA91C31E5B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 17:49:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE913214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2019 17:49:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PyZVsAfE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjOlTvbX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE913214AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D7Y6Tx7THWE/yKAyqoKnLaEUwFajtOGy3B60rrQql4c=; b=PyZVsAfEOMXLaC
	fGbyHHizcdo+wzGfNz0V+SQsO6alKmVUbAl0EoSeEiK1A95t7kBhgEZehLGvxs7xuQ4hyHywEqWf/
	jlmbxa7d3iFlbJQyjRYR3d+FvzwrWoW3UELnuM6eGZsiYZb53reM7P8RKdT+Gr/Rx1tlpu4LlE7Z/
	s1EKckbKn9A0o8eIpsNtXcvzLqk61jmwnhhkot7ALLbEV2e99QQJT3fwBLosekOA0jWTp/Me13cN4
	157xB77/7RIYJ2AL8gyxzMR3nEI9X4mvHdDNr3uKkKQt0JS0o3qQd9ZrqfKzK1AS4Ayo6uE4EJ3Yq
	krAZcJ60mHpTWq9PkLkw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdeiG-0005Jc-10; Wed, 19 Jun 2019 17:49:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdeWu-0007Fq-Vd; Wed, 19 Jun 2019 17:37:57 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ED25220645;
 Wed, 19 Jun 2019 17:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560965871;
 bh=FI/Aaanl67vGaL7CZBArwPQzwgfCA/zMq2im/eG81jE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gjOlTvbXBJ8Q7188Pf6UHmQ6i3qmehkbMqf7qti7BktvzpIvamuZ8KJmvYB8sjW4B
 ic35saUA2nB2ol0AYoe1ccLop1CBme8rVqGtfJN120tzxq8pq4jYyDPOER+Ya1ARQe
 n/0jMhsWjkDHoXZn4dxxh248BSTmyjh2BXwGmXoM=
Date: Wed, 19 Jun 2019 19:37:49 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Atish Patra <atish.patra@wdc.com>
Subject: Re: [PATCH v7 7/7] MAINTAINERS: Add an entry for generic
 architecture topology
Message-ID: <20190619173749.GA20916@kroah.com>
References: <20190617185920.29581-1-atish.patra@wdc.com>
 <20190617185920.29581-8-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617185920.29581-8-atish.patra@wdc.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_103753_058037_2D818D6B 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Richard Fontana <rfontana@redhat.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Anup Patel <anup@brainfault.org>, Russell King <linux@armlinux.org.uk>,
 Morten Rasmussen <morten.rasmussen@arm.com>, devicetree@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Otto Sabart <ottosabart@seberm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jun 17, 2019 at 11:59:20AM -0700, Atish Patra wrote:
> From: Sudeep Holla <sudeep.holla@arm.com>
> 
> arm and arm64 shared lot of CPU topology related code. This was
> consolidated under driver/base/arch_topology.c by Juri. Now RISC-V
> is also started sharing the same code pulling more code from arm64
> into arch_topology.c
> 
> Since I was involved in the review from the beginning, I would like
> to assume maintenance for the same.
> 
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Juri Lelli <juri.lelli@redhat.com>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
