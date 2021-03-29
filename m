Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21727C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93B05617C9
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93B05617C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/wdfMfqCc6HdGbTm9igHYFlhvN9lUuctv5o6KK3Fpak=; b=kHmevB+Fy4IW8EyJviHTLVf1f
	WbaZ1Gygnprn0Ei2FiS8ci/g9YQ31gNn0pQJyyPP83TAQIpV9xaXrnjMDjzfzlKTiCqQNDiE9xiSe
	drKQYvORF1MAVpVce29k6MCWGOTZagocWSnbV+PnMKW210WdBeSPyYXFUiuKiGnHus6aThdyNSwWc
	IcXs8OpaX3xE3VYBBWahEazVv6YfoAwn1LVaCBMBV5COXflxbeHIVNigN3c96bIz0Gk4tSqNaFh9K
	8AJM9Bu4kCOgr7G7kbLK4h2Q+lQlhcaHRNi/YdnaE0uOIQIBnqDLkAa057T9ONRaeaIXrXwxaFGE7
	BEV6as/TA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxqm-001Iop-Az; Mon, 29 Mar 2021 19:47:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQrL6-000f3O-Cj
 for linux-riscv@desiato.infradead.org; Mon, 29 Mar 2021 12:49:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1918iT4uzotqNOl2NIVcMWIyYjsHFO6ajOdXvBHTmz0=; b=OsUkcjaEC5QtmphwWlRuqGUNXm
 sguIJD8uR8Q6kUa/CzuVxzzaza4CR5bOBGKP4wnkUapwhIyaIa816SR+QuolvtGEeRoMiWR2U9eOr
 Y1eGuQ39WXYD2PlMMJRwOtlSCLtcRu4QL+9EJgRmP4v9eAwl7tq2lUyzErBosRYBRiXGA6p4r3piE
 l3JMoIDOkzIUC+gtjIaBZ6l+MT9NDe1uo3vldrRNQoHOB8kZQIUDYfehHZXB4CZYq4g4KuqP6ffRZ
 BR6rRc+bXfkJyW0+ypDZRJmZNSqGj/yhXMvIYXGocXid1OhDKbYDx235eu3aXlyeJx62QZv3dzYgb
 mTqTXNMg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lQrKo-001aXI-L9; Mon, 29 Mar 2021 12:49:37 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CFD843011FE;
 Mon, 29 Mar 2021 14:49:31 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id BA3C42BB1A697; Mon, 29 Mar 2021 14:49:31 +0200 (CEST)
Date: Mon, 29 Mar 2021 14:49:31 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Mar 29, 2021 at 08:01:41PM +0800, Guo Ren wrote:
> u32 a = 0x55aa66bb;
> u16 *ptr = &a;
> 
> CPU0                       CPU1
> =========             =========
> xchg16(ptr, new)     while(1)
>                                     WRITE_ONCE(*(ptr + 1), x);
> 
> When we use lr.w/sc.w implement xchg16, it'll cause CPU0 deadlock.

Then I think your LL/SC is broken.

That also means you really don't want to build super complex locking
primitives on top, because that live-lock will percolate through.

Step 1 would be to get your architecute fixed such that it can provide
fwd progress guarantees for LL/SC. Otherwise there's absolutely no point
in building complex systems with it.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
