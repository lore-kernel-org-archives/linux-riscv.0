Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAFAC7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 19:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWk098ETvP4UZWvnG2QgoLuYb5T36rmi2rfaFOTv+jE=; b=yTOw4qqvcDttqi
	kETHPDqkmJxHceFrHUM57cnF2IzCnflUfre2l6jK6WOgXnHtSrKrxdXvA/uLARoy+8x9c0dLLT7M0
	LnZJDEroyBXzWuliUkV5O+BOqUutCOsF1krD7JoQ1k5ghrFLITxzuYSv4WcoWwvn9dj8ysVnyNPkl
	HoHySJBpPiOLSpo6VIr9G09yT529laWQBGYjQAVPKIdmAmAPHrA+/Y50ZEeDh6nTIbo0EZWK737tp
	ntMT35G+t1vE2RAfjCQDQGupml+rIKTyC2SOTjIte/a7hVirr0BPRwHtFGntfWr4fPCWkdOGSaKxd
	S/rU5A8nqs2n+wfFHaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5tBU-00CrZe-0e;
	Sun, 04 Jun 2023 19:14:36 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5tBR-00CrYC-0s
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 19:14:35 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 354JETSX003679;
	Sun, 4 Jun 2023 21:14:29 +0200
Date: Sun, 4 Jun 2023 21:14:29 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/4] selftests/nolibc: add user-space 'efault' handler
Message-ID: <ZHzilYf5bGx3w+yE@1wt.eu>
References: <cover.1685443199.git.falcon@tinylab.org>
 <ZHxv7kIm2kEAfin2@1wt.eu>
 <c6129c15-7e95-4f6c-b4db-c6b5daa6d3cc@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c6129c15-7e95-4f6c-b4db-c6b5daa6d3cc@t-8ch.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_121433_740808_591B7AC9 
X-CRM114-Status: GOOD (  35.80  )
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

On Sun, Jun 04, 2023 at 09:07:25PM +0200, Thomas Wei=DFschuh wrote:
> On 2023-06-04 13:05:18+0200, Willy Tarreau wrote:
> > Hi Zhangjin,
> > =

> > On Tue, May 30, 2023 at 06:47:38PM +0800, Zhangjin Wu wrote:
> > > Hi, Willy, Thomas
> > > =

> > > This is not really for merge, but only let it work as a demo code to
> > > test whether it is possible to restore the next test when there is a =
bad
> > > pointer access in user-space [1].
> > > =

> > > Besides, a new 'run' command is added to 'NOLIBC_TEST' environment
> > > variable or arguments to control the running iterations, this may be
> > > used to test the reentrancy issues, but no failures found currently ;=
-)
> > =

> > Since the tests we're running are essentially API tests, I'm having
> > a hard time seeing in which case it can be useful to repeat the tests.
> > I'm not necessarily against doing it, I'm used to repeating tests for
> > example in anything sensitive to timing or race conditions, it's just
> > that here I'm not seeing the benefit. And the fact you found no failure
> > is rather satisfying because the opposite would have surprised me.
> > =

> > Regarding the efault handler, I don't think it's a good idea until we
> > have signal+longjmp support in nolibc. Because running different tests
> > with different libcs kind of defeats the purpose of the test in the
> > first place. The reason why I wanted nolibc-test to be portable to at
> > least one other libc is to help the developer figure if a failure is in
> > the nolibc syscall they're implementing or in the test itself. Here if
> > we start to say that some parts cannot be tested similarly, the benefit
> > disappears.
> > =

> > I mentioned previously that I'm not particularly impatient to work on
> > signals and longjmp. But in parallel I understand how this can make the
> > life of some developers easier and even allow to widen the spectrum of
> > some tests. Thus, maybe in the end it could be beneficial to make progr=
ess
> > on this front and support these. We should make sure that this doesn't
> > inflate the code base however. I guess I'd be fine with ignoring libc-
> > based restarts on EINTR, alt stacks and so on and keeping this minimal
> > (i.e. catch a segfault/bus error/sigill in a test program, or a Ctrl-C
> > in a tiny shell).
> > =

> > Just let us know if you think that's something you could be interested
> > in exploring. There might be differences between architectures, I have
> > not checked.
> =

> If the goal is to handle hard errors like segfaults more gracefully,
> would it not be easier to run each testcase in a subprocess?
> =

> Then we can just check if the child exited successfully.
> =

> It should also be completely architecture agnostic.

Could be, indeed. However it would complexify a bit strace debugging,
but yeah that might be something to think about.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
