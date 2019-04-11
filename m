Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87ACAC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:46:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56AFF2133D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:46:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OsQAb3k5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56AFF2133D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nCPqr0AGUN1Y4rQOAIHGeMqYQ3lIxZ2l7nIbMqEkygM=; b=OsQAb3k5Vl4ETp
	Wyvlml9V5H1koXMIXoAZwZtV3w8YbWdjGRaWJBia0gWa0Me0Wgy3T5I5PZknuHOFVZ1aGWaYtO7xh
	qnJ3bQV/trMFoyKbHWOJjRnViSzFzUWvPXv/g/TM+PcmvLCD8yEug0Ir3KVDtPt0XBpNaSGx71Ofb
	trb1ZoEZMXGka6IFtK6AUkHk3wxr+f9FMJz54XGSUj5b9L13hCXRS4AKV6PfhzgxcnFMQQwt27UJk
	54GpfabjByS6fFyAy/6HtHbHF4J5S55AAO05VXgS5lZFg6844DIiUpwgJoGWF0heizg2VmxQfojXt
	eZiaN3SHxfrKW94b6jUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEY9q-0004Ma-Gq; Thu, 11 Apr 2019 11:46:18 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hEY9o-0004MP-EB; Thu, 11 Apr 2019 11:46:16 +0000
Date: Thu, 11 Apr 2019 04:46:16 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 1/6] arch: riscv: add support for building DTB files from
 DT source data
Message-ID: <20190411114616.GA10032@infradead.org>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190411084304.5072-2-paul.walmsley@sifive.com>
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
Cc: devicetree@vger.kernel.org, Paul Walmsley <paul@pwsan.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 01:42:59AM -0700, Paul Walmsley wrote:
> Similar to ARM64, add support for building DTB files from DT source
> data for RISC-V boards.
> 
> This patch starts with the infrastructure needed for SiFive boards.
> Boards from other vendors would add support here in a similar form.

What do we build it for?  We'd really need something like this:

http://git.infradead.org/users/hch/misc.git/commitdiff/d6242aa147baf57e05e2932199c74d8d24b9926e
http://git.infradead.org/users/hch/misc.git/commitdiff/0cd5413c8094ab57b68e0629dacfed695f4c1ef1

To actually use the DT files.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
