Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3455AC7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 11:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCQfUOyj/9p0V0Xdkm42Vu8TieIcXAVUhUypyz+L1Mk=; b=2Nv5EtoEfFAJ49
	6KjMEVaxiR79QQCZYjUBaDjumJE1ry306W/KW1K1GjNII/RvHuFWhg2+BoOk7ToSDPAvOASu/Z+Zl
	yyiNKlzgiw1cehc31jCS1d8Bo+pxbL2jqMSmpcb2WEAonS4Vq+VXu9m8y+yFoWhXQnqR/66O0Vvpb
	dd5pMdGxE6cIu8RKc1etXad055Abz2LxxEo/6Oyla9OLsNU6HiGzxbtegKtvtqIgIXaZKN9lxNC6a
	fZXM3SikBeS/qiyQBC7FLukjamhSsWW7uB4BZzFJcIMuHl2+BKGaCPotRQHrLo7rkCeyOOC+QX1L8
	8kZj/o72/EUz9bQMZFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xWe-00DeRM-1w;
	Tue, 30 May 2023 11:28:28 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xWb-00DeOu-0w
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 11:28:27 +0000
X-QQ-mid: bizesmtp76t1685446091t9abaw5r
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 19:28:10 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: XBN7tc9DADKii40bmE5sGvtC9c0wjUbBTZsZYzSjmYPV8vlhi9Gaaau5lxU9Y
	VTD/sTXRqUNm4xb+xV2+n6bSiwl3xsLACPXec0+JjoGtlQVen+X1tH8BaeqO1+6e25w/rlN
	FdRYkVmuF+8GeqTl/XcwvcEESpcnyUJ/8nmwIEVkGHgNAOyVU2Bj9n3TqGdqla6LQFxFDyv
	PbDiwIHF+QICRgIaj2BJbTjjeHbd0SvzOV9x2dGn1vsCJaKxOgX05lma3EgTm7tr/FD3WEy
	HTkE8Mpj/PMx29MLjWCTTqneLmWEwEk/iOqBJjQ4gXDlnAg78B5Uu3QQSueDQG7EJGi1J7l
	tM70IjevvjLxTMAcZILaYQgQ2333gVqt8+82iixCfiLbAbiHuI6L0wC7dua5dAk4NQ/+Gsn
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16639300519272177696
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	w@1wt.eu
Subject: Re: [PATCH 1/2] selftests/nolibc: add new gettimeofday test cases
Date: Tue, 30 May 2023 19:28:06 +0800
Message-Id: <20230530112806.404017-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <96f1134d-ce6e-4d82-ae00-1cd4038809c4@t-8ch.de>
References: <96f1134d-ce6e-4d82-ae00-1cd4038809c4@t-8ch.de>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_042825_624621_6BF7DC5D 
X-CRM114-Status: GOOD (  21.12  )
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

> On 2023-05-30 14:37:49+0800, Zhangjin Wu wrote:
> > These 3 test cases are added to cover the normal using scenes of
> > gettimeofday().
> > 
> > They have been used to trigger and fix up such issue:
> > 
> >     nolibc-test.c:(.text.gettimeofday+0x54): undefined reference to `__aeabi_ldivmod'
> > 
> > This issue happens while there is no "unsigned int" conversion in the
> > new clock_gettime / clock_gettime64 syscall path of gettimeofday():
> > 
> >     tv->tv_usec = ts.tv_nsec / 1000;
> > 
> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/testing/selftests/nolibc/nolibc-test.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> > index 8ba8c2fc71a0..20d184da9a2b 100644
> > --- a/tools/testing/selftests/nolibc/nolibc-test.c
> > +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> > @@ -533,6 +533,8 @@ static int test_stat_timestamps(void)
> >   */
> >  int run_syscall(int min, int max)
> >  {
> > +	struct timeval tv;
> > +	struct timezone tz;
> >  	struct stat stat_buf;
> >  	int euid0;
> >  	int proc;
> > @@ -588,6 +590,9 @@ int run_syscall(int min, int max)
> >  		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
> >  		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
> >  		CASE_TEST(gettimeofday_null); EXPECT_SYSZR(1, gettimeofday(NULL, NULL)); break;
> > +		CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
> > +		CASE_TEST(gettimeofday_tz);   EXPECT_SYSZR(1, gettimeofday(NULL, &tz)); break;
> 
> Calling gettimeofday(NULL, ...) will actually segfault on glibc.
> It works when calling through the VDSO, but not the logic in glibc
> itself, which is guess is allowed by POSIX.
>

In low level gettimeofday syscall, it should be ok, will check the non-vdso
code of glibc later. in musl, it returns 0 when it is NULL
(src/time/gettimeofday.c).

> I propose to avoid doing it :-)

Just checked it again, these two cases can also detect the issues (1):

    CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
    CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;

    (1) nolibc-test.c:(.text.gettimeofday+0x54): undefined reference to `__aeabi_ldivmod'

we can directly remove the second one ;-)

> 
> Either we gate the existing test in #ifdef NOLIBC or we remove it.

so, we still need to check the original gettimeofday_null test case for glibc?

Thanks,
Zhangjin

> 
> > +		CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;
> >  		CASE_TEST(getpagesize);       EXPECT_SYSZR(1, test_getpagesize()); break;
> >  		CASE_TEST(ioctl_tiocinq);     EXPECT_SYSZR(1, ioctl(0, TIOCINQ, &tmp)); break;
> >  		CASE_TEST(ioctl_tiocinq);     EXPECT_SYSZR(1, ioctl(0, TIOCINQ, &tmp)); break;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
