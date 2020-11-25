Return-Path: <SRS0=npMT=E7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9AEC5519F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 14:18:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BDB5206D9
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2020 14:18:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oX3phC2h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZuzsjBMR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BDB5206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a9/UDag+lJ43YhY8JvwtMJPAuFHhBuD/oPI1XjSLa4Y=; b=oX3phC2h/ZHYijEYxQbxBVD/k
	f8y4jVn4K0xhYptNrs7gWNb++nUdvaUCMmBAF/T0ic002KKaFBoKQxSEmVc5DFqeSpJWjFCL1hqHl
	G217WobJbUKmg1U1JguirA9FvimEUu5Aw24eZztQIl7d/1RZBtjkTk3WDzWrgmghP+to0+ZTNs2El
	LPcNj4t0fsO4K6kpy13ZG74YERxcVMQOo/U7O4bshQO0YE+AEb7cJVqLqlWxaeuYdA8hAyKrx/Zfi
	lr1a4NlTQO5fjVySo8HgK4n5Is6dcDK4GXTqq5peygkGU4lSEwHN6eBpsXbXDmQ3YPPY2QUrIBMPb
	urxTO1qNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khvcj-0003Zf-3d; Wed, 25 Nov 2020 14:18:21 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khvce-0003Xm-6z
 for linux-riscv@merlin.infradead.org; Wed, 25 Nov 2020 14:18:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=wU0zOrnocdlJXkwamHXZAUVyZC76vH5lJ5qYsICzTKo=; b=ZuzsjBMR9U0lOnIq/91BDGYPEA
 xn+47d8MvnUyg0jb+LlGQaXhOVNZZ0HxdFkuGcVOIPoxSJme47cjFNsRC0seL2naATdv5B4NKA2JS
 VySBiCx2iK4Qxvk7FeoJeptUxcaJwpWZBeryC506uwx6HbbOxVl08piQ7f4EVkumqG22zzaoxbOV9
 DXq+CfJ/nHL3hVFaQDowit5vE3Sl5ttR9mpY5iFcJ3epNHQjktWxbaPPSzAkZDGQDZrhjwhOYd9se
 OfC4HUbDqj/yJToiL2Qhu9n6pCJ5nXaV2e92gxqPrVSFydbh9TstGdABE92ozX3z+457pVs+qha/t
 W5xl5aJg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khvcc-0001r2-CL; Wed, 25 Nov 2020 14:18:14 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B0254306E0C;
 Wed, 25 Nov 2020 15:18:13 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id A08ED22B9CF4B; Wed, 25 Nov 2020 15:18:13 +0100 (CET)
Date: Wed, 25 Nov 2020 15:18:13 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 2/5] riscv: Add QUEUED_SPINLOCKS & QUEUED_RWLOCKS supported
Message-ID: <20201125141813.GC2414@hirez.programming.kicks-ass.net>
References: <1606225437-22948-1-git-send-email-guoren@kernel.org>
 <1606225437-22948-2-git-send-email-guoren@kernel.org>
 <20201124143931.GI2414@hirez.programming.kicks-ass.net>
 <CAJF2gTTBbjOhvvLTd6d5zgb0kskoSJhPW7nmg==4w2wV+OaUgg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTTBbjOhvvLTd6d5zgb0kskoSJhPW7nmg==4w2wV+OaUgg@mail.gmail.com>
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
Cc: Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 25, 2020 at 08:52:23AM +0800, Guo Ren wrote:

> > I'm pretty sure there's a handfull of implementations like this out
> > there... if only we could share.
> Michael has sent qspinlock before, ref to Link below. He reused mips' code.
> 
> Link: https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/
> 
> Which short xchg implementation do you prefer (Mine or his)?

Well, it would be very nice to have mips/riscv/csky all use the same
header to implement these I suppose.

But then we're back to a cmpxchg-loop, in which case Arnd's suggestion
isn't worse.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
