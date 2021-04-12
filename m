Return-Path: <SRS0=xUWo=JJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E0CEC433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 14:52:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4B2C6128C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Apr 2021 14:52:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4B2C6128C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9LxoKRO9l/B6IubonRD4rnrIFANU46Z7hm9UfVRrA6o=; b=Fxq2HcQtrdkOQrkoSZUamb0+R
	ARtoFIPjyoFoYXQelJkgdRGjDZNiHtUAM5xqYbnmRPU3Yeh7ZyStBuTMcQN8LUe6pQyMUojOA+hx5
	K9/Gfxy3ixpFGzdnFqs+Zmx2o+1jxj7/hvxUfKF1HwJkhIACa+BRMGdDDD/TTY/Z86kQ6lLp/23j/
	i4D1hyb1ZuAr2KksQiX6ZriMGNUlwJkscsQllmykccc1BvlJXLIEhn9YgBpW0NfA5TPSfRlcpJw2A
	PIsN/CvfgIlqB0GbTfi8OlO1SwMBhVGJyE+paJdX/fCWccxYap+YfepTnaFzDE1N/LlfNZjJNvxJY
	7z7ZN+bWw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVxuy-0070VX-EW; Mon, 12 Apr 2021 14:52:00 +0000
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lVxuv-0070VF-9F; Mon, 12 Apr 2021 14:51:57 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D6D8D300036;
 Mon, 12 Apr 2021 16:51:55 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 8283A2040BB0F; Mon, 12 Apr 2021 16:51:55 +0200 (CEST)
Date: Mon, 12 Apr 2021 16:51:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christophm30@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Guo Ren <guoren@linux.alibaba.com>, catalin.marinas@arm.com,
 will.deacon@arm.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Message-ID: <YHRei8/8cIe6BNtE@hirez.programming.kicks-ass.net>
References: <CAAhSdy1JHLUFwu7RuCaQ+RUWRBks2KsDva7EpRt8--4ZfofSUQ@mail.gmail.com>
 <mhng-0bf68290-a014-43d7-b193-8ac839c5433a@palmerdabbelt-glaptop>
 <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Please fix your mailer to properly flow text. Reflowed it for you.

On Mon, Apr 12, 2021 at 03:32:27PM +0200, Christoph M=FCllner wrote:

> This discussion came up again a few weeks ago because I've been
> stumbling over the test-and-set implementation and was wondering if
> nobody cared to improve that yet.

> Then I saw, that there have been a few attempts so far, but they did
> not land.  So I brought this up in RVI's platform group meeting and
> the attendees showed big interest to get at least fairness. I assume
> Guo sent out his new patchset as a reaction to this call (1 or 2 days
> later).
> =

> We have the same situation on OpenSBI, where we've agreed (with Anup)
> to go for a ticket lock implementation.  A series for that can be
> found here (the implementation was tested in the kernel):
> http://lists.infradead.org/pipermail/opensbi/2021-April/000789.html
> =

> In the mentioned RVI call, I've asked the question if ticket locks or
> MCF locks are preferred.  And the feedback was to go for
> qspinlock/qrwlock. One good argument to do so would be, to not have to
> maintain an RV-specific implementation, but to use a well-tested
> in-kernel mechanism.

qrwlock does not depend on qspinlock; any fair spinlock implementation
works, including ticket.

> The feedback in the call is also aligned with the previous attempts to
> enable MCF-locks on RV.  However, the kernel's implementation requires
> sub-word atomics. And here is, where we are.  The discussion last week
> was about changing the generic kernel code to loosen its requirements
> (not accepted because of performance regressions on e.g. x86) and if
> RV actually can provide sub-word atomics in form of LL/SC loops (yes,
> that's possible).

So qspinlock is a complex and fickle beast. Yes it works on x86 and
arm64 (Will and Catalin put a _lot_ of effort into that), but IMO using
such a complex thing needs to be provably better than the trivial and
simple thing (tickets, test-and-set).

Part of that is fwd progress, if you don't have that, stay with
test-and-set. Will fixed a number of issues there, and -RT actually hit
at least one.

Debugging non-deterministic lock behaviour is not on the fun list.
Having something simple (ticket) to fall back to to prove it's your lock
going 'funneh' is very useful.

> Providing sub-word xchg() can be done within a couple of hours (some
> solutions are already on the list), but that was not enough from the
> initial patchset from Michael on (e.g. Christoph Hellwig asked back
> then for moving arch-independent parts into lib, which is a good idea
> given other archs do the same).  So I expect this might require some
> more time until there is a solution, that's accepted by a broad range
> of maintainers.

Using a lib/ cmpxchg based xchg16 is daft. Per the very same arguments I
made elsewhere in the thread. cmpxchg() based loops have very difficult
fwd progress guarantees, esp. so on LL/SC architectures.

What I would do is create a common inline helper to compute that {addr,
mask, val} setup with a comment on how to use it.

(As is, we have at least 2 different ways of dealing with ENDIAN-ness)

> I've been working on a new MCF-lock series last week.  It is working,
> but I did not publish it yet, because I wanted to go through the 130+
> emails on the riscv-linux list and check for overseen review comments
> and validate the patch authors.

> You can find the current state here:
> https://github.com/cmuellner/linux/pull/new/riscv-spinlocks =


That's not public. But if that's not qspinlock, how are you justifying a
complex spinlock implementation? Does it perform better than ticket?

> So, if you insist on ticket locks, then let's coordinate who will do
> that and how it will be tested (RV32/RV64, qemu vs real hw).

Real hardware is all that counts :-)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
