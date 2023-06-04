Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12B1C7EE29
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jun 2023 12:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z5Xt+m55vStGpJV++1IR0/rDplksi52IqUuZB8p1vc4=; b=pCzgT0wnY2b9Dz
	Rw/aDCLNKoZGtmeNmcIm2cm7uuMIBFAX1XI/sjgoW6+X9ai872LgSA/nGKPG+r2ePv84O9zLQd6wA
	979dAkZTOnAqJJrvd9hQQW/hUrn/mxvqjuNxx8EOH3tKyr3HSh3F9IeQYsLzGCp1T+Q3KDGAQrMaO
	g8W9s4j7EfdPOobZW/u3zsfC5afjFD/K6PjlbXJ4pexU0Gw2mUpaZVyglQa5Oso+nwy1bKHVuJnBP
	fMPCiXBOx/1xhz+/1x7SzR2LN1jN9HzrOK7IG6XGePja69lwZFxVAi+1YfP0mOZy1Xs1bjZos43Ra
	H2AtFGGufEEJckmM5qDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nGD-00CB3e-2X;
	Sun, 04 Jun 2023 12:55:05 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5nGA-00CB2v-1W
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jun 2023 12:55:04 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 354CsxC8002327;
	Sun, 4 Jun 2023 14:54:59 +0200
Date: Sun, 4 Jun 2023 14:54:59 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 00/12] nolibc: add generic part1 of prepare for rv32
Message-ID: <ZHyJo6Xo5BTf/Np9@1wt.eu>
References: <cover.1685777982.git.falcon@tinylab.org>
 <9fd76795-65df-4964-bc80-fb1d4f92c402@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9fd76795-65df-4964-bc80-fb1d4f92c402@t-8ch.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_055502_803435_31759961 
X-CRM114-Status: GOOD (  27.64  )
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

On Sun, Jun 04, 2023 at 08:49:52AM +0200, Thomas Wei=DFschuh wrote:
> On 2023-06-03 15:59:29+0800, Zhangjin Wu wrote:
> > Hi, Willy
> > =

> > This is the v3 generic part1 for rv32, all of the found issues of v2
> > part1 [1] have been fixed up, several generic patches have been fixed up
> > and merged from v2 part2 [2] to this series, the standalone test_fork
> > patch [4] is merged with a Reviewed-by line into this series too.
> > =

> > This series is based on 20230528-nolibc-rv32+stkp5 branch of [5].
> > =

> > Changes from v2 -> v3:
> > =

> > * selftests/nolibc: fix up compile warning with glibc on x86_64
> > =

> >   Use simpler 'long long' conversion instead of old #ifdef ...
> >   (Suggestion from Willy)
> > =

> > * tools/nolibc: add missing nanoseconds support for __NR_statx
> > =

> >   Split the compound assignment into two single assignments
> >   (Suggestion from Thomas)
> > =

> > * selftests/nolibc: add new gettimeofday test cases
> > =

> >   Removed the gettimeofday(NULL, &tz)
> >   (Suggestion from Thomas)
> > =

> > All of the commit messages have been re-checked, some missing
> > Suggested-by lines are added.
> > =

> > The whole patchset have been tested on arm, aarch64, rv32 and rv64, no
> > regressions (the next compile patchset is required to do rv32 test).
> > =

> > The nolibc-test has been tested with glibc on x86_64 too.
> > =

> > Btw, we have found such poll failures on arm (not introduced by this
> > patchset), this will be fixed in our coming ppoll_time64 patchset:
> > =

> > 48 poll_null =3D -1 ENOSYS                                        [FAIL]
> > 49 poll_stdout =3D -1 ENOSYS                                      [FAIL]
> > 50 poll_fault =3D -1 ENOSYS  !=3D (-1 EFAULT)                       [FA=
IL]
> > =

> > And the gettimeofday_null removal patch from Thomas [3] may conflicts
> > with the gettimeofday removal and addition patches, but it is not hard
> > to fix.
> > =

> > Best regards,
> > Zhangjin
> > ---
> > =

> > [1]: https://lore.kernel.org/linux-riscv/cover.1685362482.git.falcon@ti=
nylab.org/T/#t
> > [2]: https://lore.kernel.org/linux-riscv/cover.1685387484.git.falcon@ti=
nylab.org/T/#t
> > [3]: https://lore.kernel.org/lkml/20230530-nolibc-gettimeofday-v1-1-730=
7441a002b@weissschuh.net/
> > [4]: https://lore.kernel.org/lkml/61bdfe7bacebdef8aa9195f6f2550a5b0d33a=
ab3.1685426545.git.falcon@tinylab.org/
> > [5]: https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
> > =

> > Zhangjin Wu (12):
> >   selftests/nolibc: syscall_args: use generic __NR_statx
> >   tools/nolibc: add missing nanoseconds support for __NR_statx
> >   selftests/nolibc: allow specify extra arguments for qemu
> >   selftests/nolibc: fix up compile warning with glibc on x86_64
> >   selftests/nolibc: not include limits.h for nolibc
> >   selftests/nolibc: use INT_MAX instead of __INT_MAX__
> >   tools/nolibc: arm: add missing my_syscall6
> >   tools/nolibc: open: fix up compile warning for arm
> >   selftests/nolibc: support two errnos with EXPECT_SYSER2()
> >   selftests/nolibc: remove gettimeofday_bad1/2 completely
> >   selftests/nolibc: add new gettimeofday test cases
> >   selftests/nolibc: test_fork: fix up duplicated print
> > =

> >  tools/include/nolibc/arch-arm.h              | 23 +++++++++++
> >  tools/include/nolibc/stdint.h                | 14 +++++++
> >  tools/include/nolibc/sys.h                   | 39 +++++++++---------
> >  tools/testing/selftests/nolibc/Makefile      |  2 +-
> >  tools/testing/selftests/nolibc/nolibc-test.c | 42 ++++++++++++--------
> >  5 files changed, 85 insertions(+), 35 deletions(-)
> =

> For the full series:
> =

> Reviewed-by: Thomas Wei=DFschuh <linux@weissschuh.net>

I forgot to say, all the series is now queued, and I squashed the
__NR_statx fix into Thomas' patch.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
