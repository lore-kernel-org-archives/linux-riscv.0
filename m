Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D3FC77B73
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 19:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tK7gYeT84W0/YO9R1l1MDiJeWPG7JoFTWjyl9pki58Y=; b=k7kT8jvCPc20Tq
	DL+AuczhpI9SKXHO8sugjoGMpHhIKQor0C5GvBtrk16fSKF9o/9QBBmOtA22TXW3k7TzAWq+hAbZy
	8tCNKHBgK7pYgPrN0cs8IyYnj1T4vHl7FIheCXdRLa0bbylbpy48lEALXc6sSPmrM7+ohfLEkkFwK
	zjuORV/oCGkpsD7lnYPoPoohDb+HCHaVFl8JsWxR1SfvUZ0xT9f4YiVG1K8RvboroEeC4n2D7EckN
	3dybWGwxkW6RFxz3QduVgwlTQgnAHk8Y3FmJIPDl+lX9u9AhqvJH7LKAG58Sb/l4fTtqeCXDt1cRa
	D6ns4+qOmcJ1KTIP+FyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5t4g-00CqSF-1g;
	Sun, 04 Jun 2023 19:07:34 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5t4c-00CqQM-0p
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 19:07:32 +0000
Date: Sun, 4 Jun 2023 21:07:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685905645; bh=tVL6rua96sFgrYX+hG+hECHYZwYEGKbaivsDiNvbYyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sa7eVeipLe2kCWP0XMt2fU3wqRXYQ5/Xf+VesjJK5KPZMG3Loir696DyY/gMAmOVq
	 R+P2+Yz/Gasv1bgoR+57TyuWfQi1YbWHUluQsgyiQvOnS69jUgmzuURcr+laWblmRz
	 BAR3FOS5k0JdfPSZr2hDYzPc/bTRqq2h1/5idb74=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/4] selftests/nolibc: add user-space 'efault' handler
Message-ID: <c6129c15-7e95-4f6c-b4db-c6b5daa6d3cc@t-8ch.de>
References: <cover.1685443199.git.falcon@tinylab.org>
 <ZHxv7kIm2kEAfin2@1wt.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZHxv7kIm2kEAfin2@1wt.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_120730_447251_68F2A2B4 
X-CRM114-Status: GOOD (  30.16  )
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

On 2023-06-04 13:05:18+0200, Willy Tarreau wrote:
> Hi Zhangjin,
> 
> On Tue, May 30, 2023 at 06:47:38PM +0800, Zhangjin Wu wrote:
> > Hi, Willy, Thomas
> > 
> > This is not really for merge, but only let it work as a demo code to
> > test whether it is possible to restore the next test when there is a bad
> > pointer access in user-space [1].
> > 
> > Besides, a new 'run' command is added to 'NOLIBC_TEST' environment
> > variable or arguments to control the running iterations, this may be
> > used to test the reentrancy issues, but no failures found currently ;-)
> 
> Since the tests we're running are essentially API tests, I'm having
> a hard time seeing in which case it can be useful to repeat the tests.
> I'm not necessarily against doing it, I'm used to repeating tests for
> example in anything sensitive to timing or race conditions, it's just
> that here I'm not seeing the benefit. And the fact you found no failure
> is rather satisfying because the opposite would have surprised me.
> 
> Regarding the efault handler, I don't think it's a good idea until we
> have signal+longjmp support in nolibc. Because running different tests
> with different libcs kind of defeats the purpose of the test in the
> first place. The reason why I wanted nolibc-test to be portable to at
> least one other libc is to help the developer figure if a failure is in
> the nolibc syscall they're implementing or in the test itself. Here if
> we start to say that some parts cannot be tested similarly, the benefit
> disappears.
> 
> I mentioned previously that I'm not particularly impatient to work on
> signals and longjmp. But in parallel I understand how this can make the
> life of some developers easier and even allow to widen the spectrum of
> some tests. Thus, maybe in the end it could be beneficial to make progress
> on this front and support these. We should make sure that this doesn't
> inflate the code base however. I guess I'd be fine with ignoring libc-
> based restarts on EINTR, alt stacks and so on and keeping this minimal
> (i.e. catch a segfault/bus error/sigill in a test program, or a Ctrl-C
> in a tiny shell).
> 
> Just let us know if you think that's something you could be interested
> in exploring. There might be differences between architectures, I have
> not checked.

If the goal is to handle hard errors like segfaults more gracefully,
would it not be easier to run each testcase in a subprocess?

Then we can just check if the child exited successfully.

It should also be completely architecture agnostic.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
