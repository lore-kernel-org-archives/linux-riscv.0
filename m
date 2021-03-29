Return-Path: <SRS0=/EkZ=I3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 092A5C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:12:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D5766196E
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Mar 2021 19:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D5766196E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZOHefo8nC62ocln0/ZqE2jOX89HyhTlnRgKwoD+kV4U=; b=RHdDTWYzcu7DuGosi0kA07K8O
	F+NfvC+a0s4YVuDSsoXe+6O4LOujQFsayE0BaiEyCPGutaVrd5zPP0K5ld2DyfeTRliOZJK5ug/ol
	GQB2omzuSTxskS1hBCCms6FA7ZBFMKmZEq00lNF32RxtGcrp26CEk+r0rXXSRXct2BOh7qEZC3RLx
	uKVq95CaJ5F6NwDusf7gXLfxNp6FXK5gFN1GHza7wiCZ7vHLBsVv9CoEgK5r/rg5jQo7dbk05VKaa
	4kREthU1L3/jD4OymHn4ihcTYGdIVIUWRSdPeeCPykXapKV+cX+cFk5c/RqmV9qDcaGFuLkBX5VV+
	KckIwfxFg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxIW-001BxL-53; Mon, 29 Mar 2021 19:11:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq6L-000cOh-10
 for linux-riscv@desiato.infradead.org; Mon, 29 Mar 2021 11:30:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=xAASgCT1znE4iZyX4yKtFW+FR4NtFv4F0rZP0TttRpc=; b=IUiKLtt370+VXpr4Dpb9tIRnmD
 lUlt8V0bVGbfLA+R8YSPIs2KN/WpHeEsLTx1xJLbLiXLynAZmIxYNh4kuFIPd1cjaXGTgOSWQoOIV
 QETpqcvhbwpVKGfbKrnWvzkGFspWw6FRMud3euBEeDrqOAmp45mWd2u7Kvf3O9M4aI5VFhAcu8//F
 AOGsqL6Ut9BtLNCe6g8wHoyGxVKxBkiRTrveBGZbdnHRjwFwVYBvF/DfhKrlZ9HZXRFFvwsnKDWWN
 e5CnjI2RJ1h+QIvFIOvGX8kRLrM3d7ZO9E4RhkJ9yNOU24aaT28io+SH1vNMaNB0s+x2RrCPd/ZBl
 5izOhRpA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq5j-001TUs-4F; Mon, 29 Mar 2021 11:30:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 982223069B1;
 Mon, 29 Mar 2021 13:29:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 85F90207539C8; Mon, 29 Mar 2021 13:29:54 +0200 (CEST)
Date: Mon, 29 Mar 2021 13:29:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Anup Patel <anup@brainfault.org>,
 Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Subject: Re: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Message-ID: <YGG6Ms5Rl0AOJL2i@hirez.programming.kicks-ass.net>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAK8P3a2bNH-1VjsZmZJkvGzzZY=ckaaOK9ZGL-oD0DH4jW-+kQ@mail.gmail.com>
 <YGG3JIBVO0w6W3fg@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YGG3JIBVO0w6W3fg@hirez.programming.kicks-ass.net>
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

On Mon, Mar 29, 2021 at 01:16:53PM +0200, Peter Zijlstra wrote:
> Anyway, an additional 'funny' is that I suspect you cannot prove fwd
> progress of the entire primitive with any of this on. But who cares
> about details anyway.. :/

What's the architectural guarantee on LL/SC progress for RISC-V ? And
what if you double loop it like cmpxchg() ?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
