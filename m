Return-Path: <SRS0=4Q7i=IW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA67C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:32:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A846619B6
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Mar 2021 12:32:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A846619B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+ciSPhYlKjd+0p95c6TrXIYRsf76CpsK4VLTrNX/mRw=; b=nEFx7RYaTi/r8ePBEQNNcyjJy
	De4JTSETJpR4PRjhBgjWRIhi6HwXWx1S8V2ZNj0DXfoEFq5ObjqD6OAM7ut1DV6GY64xnnMxKyjvi
	cndyrjikAPEn2fJMaxs2rOsFe0a1EGQsWiMBdGAKdg5hW4gINlrOiOcqnUR8ZFoDtQ81NLdoPfIac
	8cuBz9FqowcBosJB5MaQXYW1zB0MeBE196YWGXmedCCEY9qOLyODgFk8YVVbli3uuTSPV/O0quzRY
	tnjJa+VW0OSXwYrMoH5Wp58/IIL6FVqBx8mFfFGSh5ekSqVHiMxwRTZ/xkV6LVkGP2uY+LuWDni2A
	TqoRsFN7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP2fx-00H69l-Lw; Wed, 24 Mar 2021 12:31:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP2ft-00H68v-Vw
 for linux-riscv@desiato.infradead.org; Wed, 24 Mar 2021 12:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=2ffc7nYszRPIxKliihnC5n90uCSWD4QXn2lTh95xNgA=; b=Qxr93f8l7eWrgFSC9F99sXFzXQ
 lC0604zmLZikerou9UaWz9R67NWKWhURTC2ORD5Oq9YMMwSvVYQJm5d5NuR8+/bMdULyw5eLEkslF
 M5LP/RLoRrBPX6G94aoG6mKJlqUGgdBoi/OiRJfm7GXhofAVBxZe+F/C2qwS5vPnjHgmW+lHp2HtP
 umiGhP4zSz9ZS9nXRp0PCmhcOjEl/pVh7dFfJS4EzZnrsBcucvxKcqaTIFISe20vBYrCXRMSTA/bj
 CqVMXS9uBeC9caiYK9zcL2TIrfMIYiBcaDsRlPSCyi5iKJ0j0AR4smCRkKfBkt5qlB85Nk/hWnscI
 AZMYQylg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lP2fS-00BKqV-6p; Wed, 24 Mar 2021 12:31:31 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7E60330377D;
 Wed, 24 Mar 2021 13:31:21 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 44F6D2BF5B73E; Wed, 24 Mar 2021 13:31:21 +0100 (CET)
Date: Wed, 24 Mar 2021 13:31:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Cc: Vitaly Wool <vitaly.wool@konsulko.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Anup Patel <anup@brainfault.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YFsxGZ6RJilO6OUl@hirez.programming.kicks-ass.net>
References: <1616580892-80815-1-git-send-email-guoren@kernel.org>
 <CAM4kBBK7_s9U2vJbq68yC8WdDEfPQTaCOvn1xds3Si5B-Wpw+A@mail.gmail.com>
 <CAJF2gTSmrZ4iVnoHJ8w5U8ZxxeN=9r5iu9m37ZLNGPp0Q+6wMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTSmrZ4iVnoHJ8w5U8ZxxeN=9r5iu9m37ZLNGPp0Q+6wMw@mail.gmail.com>
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

On Wed, Mar 24, 2021 at 08:24:34PM +0800, Guo Ren wrote:
> On Wed, Mar 24, 2021 at 7:16 PM Vitaly Wool <vitaly.wool@konsulko.com> wrote:
> >
> >
> >
> > On Wed, Mar 24, 2021, 11:16 AM <guoren@kernel.org> wrote:
> >>
> >> From: Guo Ren <guoren@linux.alibaba.com>
> >>
> >> This patch introduces a ticket lock implementation for riscv, along the
> >> same lines as the implementation for arch/arm & arch/csky.
> >
> >
> > Could you please provide a rationale for this? Like, what is wrong with the current implementation.
> Ticket based spinlock's principle is here:
> https://lwn.net/Articles/267968/
> 
> Current implementation will cause cache line bouncing when many harts
> are acquiring the same spinlock.
> I'm seeking a solution, maybe not fitting the current RISC-V base ISA.

Ticket locks as such don't solve the cacheline bouncing part, since
they're all still spinning on the same line. The big improvement ticket
locks bring is that the lock acquisition time becomes a function of the
longest hold time, instead of being unbounded.

However, combine it with the WFE (preferably the ARM64 variant) and you
can avoid the worst of the bouncing.

If you really want to get rid of the bouncing, go with qspinlock, which
will spin on a cpu local line. That said, qspinlock is quite gnarly
code, and only really wins from ticket when you have NUMA.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
