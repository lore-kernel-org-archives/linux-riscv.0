Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCCB4C433ED
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 09:25:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 644F361222
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 09:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 644F361222
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NeW4ZbI8InlvXVxrZst39+gAhnupFmUGwhj8EeXFFWA=; b=m81Q75WUE50MDmNzJ+fVPl4y/
	pdQX81aVzbwZSV77MbHtGeu0wDEeyE/yEBksx2hW4gioiWpXMIQWPW1Nkp//0pSMVr2r+x2Q23Ekk
	d57XQyyAAMpguTfLEcxjk62+WLTdLboIYRel+h0a5Cet32SKx6HB+ISO/ZE0eVVoJ54yaP+xsfK/f
	KV08lRegnWRYdMMbl0UBjKMD4eaekd6LveYIQTQtBWKKYWQNsIqM7Vga/5U3O6WJriATyM8FNd5Zx
	F4/Z9ZLvk56NR+yEqljW7DhKlwxff30Ze8ulAJFwof4jbhzGxXn1gx14V/oKVbPsOJnyrDXQzm731
	FEIwE64Ug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyEv-00FVnA-W4; Thu, 15 Apr 2021 09:24:47 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lWyEs-00FVmx-VT; Thu, 15 Apr 2021 09:24:43 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 344C2300209;
 Thu, 15 Apr 2021 11:24:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E6C982022421A; Thu, 15 Apr 2021 11:24:41 +0200 (CEST)
Date: Thu, 15 Apr 2021 11:24:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Stafford Horne <shorne@gmail.com>, Guo Ren <guoren@kernel.org>,
 Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, jonas@southpole.se,
 stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC][PATCH] locking: Generic ticket-lock
Message-ID: <YHgGWT6eJOAofVaA@hirez.programming.kicks-ass.net>
References: <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <YHVTgfCpxpINc8sM@hirez.programming.kicks-ass.net>
 <CAJF2gTQaF8wBCp-L6vgJPcu6EnFRWmh_qZMX2PiEfj0Z70-Ykg@mail.gmail.com>
 <YHaU4uxr6emrivuu@hirez.programming.kicks-ass.net>
 <YHawVOIHmDPbTmoB@hirez.programming.kicks-ass.net>
 <YHbBBuVFNnI4kjj3@hirez.programming.kicks-ass.net>
 <20210414204734.GJ3288043@lianli.shorne-pla.net>
 <YHf00hgpB5C20tH3@hirez.programming.kicks-ass.net>
 <20210415090215.GA1015@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210415090215.GA1015@arm.com>
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

On Thu, Apr 15, 2021 at 10:02:18AM +0100, Catalin Marinas wrote:
> IIRC, one issue we had with ticket spinlocks on arm64 was on big.LITTLE
> systems where the little CPUs were always last to get a ticket when
> racing with the big cores. That was with load/store exclusives (LR/SC
> style) and would have probably got better with atomics but we moved to
> qspinlocks eventually (the Juno board didn't have atomics).

That sounds like a fundamental LL/SC fail, and I'm not sure qspinlock
will help with that at all. The big cores can still hog the lock word
and starve the little ones.

And those things not having AMOs there's really not much you can do. You
want the big cores to back off, but they're having success, not failure.
I suppose you can add a delay after a successful LL/SC, but that sucks.

I suppose modern big.little things will have AMOs, so maybe nobody still
cares about those systems.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
