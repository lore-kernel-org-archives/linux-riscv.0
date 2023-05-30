Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663A9C77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Awoms/QZe6US4HqakO5XbkX+fngIvGGWYHRvTZcQaO0=; b=KQPHQXGh51dna6
	YUWVWxSwqPiZuOtvC9Pf4b+iRjuVXLaNNvdruATKm8Ilv7nKmWc4K8ujc23eSx80NY8P6fWHTTt9k
	N+GY/TGlyDVik0tIJG1kO7OLaaIcZw+IeJW5khxHxUB7kOljib+ZoKUL51LDu+khlJUK4n0p0Ezvi
	l/TrunpF1PlgViya+Dd/0AWej3Tz0Q70nBnQDuf72F6PpfNXPUdsxCmPoXJMJSisVhPI1R+Wh8oE3
	nGcj+lEnBtKvTs0IIzQrBfcyjRHRkvZYJDay+/5GNngDMj/Z93odyfnixeldnmR9uOFEwFnFJXT7O
	agDTP9VGTa9ptv75S3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xwJ-00DjnZ-2o;
	Tue, 30 May 2023 11:54:59 +0000
Received: from todd.t-8ch.de ([159.69.126.157])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3xwH-00DjmL-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 11:54:58 +0000
Date: Tue, 30 May 2023 13:54:54 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1685447694; bh=UqHfY6pvD8b+bFqIKuJqQan4Cce1GKY1FGquG94I2d8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UZ7h5OhG3eoXlkYDEJRYfcVV84YDwXc1DiJBuT0uBabLN9aUHzG1GaBZ9zere+3Sd
	 ugJ/BrTBkFDh+HDDLZ03XqEzFpiSS/1EcczCUtZU6skb1NUDXr7f2qXTzbNQ6s5s0C
	 ReUYthiWCB4vip0x8eeppr1XjDDiRz/EB5Pfqjl4=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, w@1wt.eu
Subject: Re: [PATCH 1/2] selftests/nolibc: add new gettimeofday test cases
Message-ID: <48f6986e-cefb-49f5-bbbb-a029d5397017@t-8ch.de>
References: <96f1134d-ce6e-4d82-ae00-1cd4038809c4@t-8ch.de>
 <20230530112806.404017-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230530112806.404017-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_045457_321577_3D4AA4D9 
X-CRM114-Status: GOOD (  27.07  )
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

On 2023-05-30 19:28:06+0800, Zhangjin Wu wrote:
> > On 2023-05-30 14:37:49+0800, Zhangjin Wu wrote:
> > > These 3 test cases are added to cover the normal using scenes of
> > > gettimeofday().
> > > 
> > > They have been used to trigger and fix up such issue:
> > > 
> > >     nolibc-test.c:(.text.gettimeofday+0x54): undefined reference to `__aeabi_ldivmod'
> > > 
> > > This issue happens while there is no "unsigned int" conversion in the
> > > new clock_gettime / clock_gettime64 syscall path of gettimeofday():
> > > 
> > >     tv->tv_usec = ts.tv_nsec / 1000;
> > > 
> > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > ---
> > >  tools/testing/selftests/nolibc/nolibc-test.c | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> > > index 8ba8c2fc71a0..20d184da9a2b 100644
> > > --- a/tools/testing/selftests/nolibc/nolibc-test.c
> > > +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> > > @@ -533,6 +533,8 @@ static int test_stat_timestamps(void)
> > >   */
> > >  int run_syscall(int min, int max)
> > >  {
> > > +	struct timeval tv;
> > > +	struct timezone tz;
> > >  	struct stat stat_buf;
> > >  	int euid0;
> > >  	int proc;
> > > @@ -588,6 +590,9 @@ int run_syscall(int min, int max)
> > >  		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), -1); break;
> > >  		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/null"), -1, ENOTDIR); break;
> > >  		CASE_TEST(gettimeofday_null); EXPECT_SYSZR(1, gettimeofday(NULL, NULL)); break;
> > > +		CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
> > > +		CASE_TEST(gettimeofday_tz);   EXPECT_SYSZR(1, gettimeofday(NULL, &tz)); break;
> > 
> > Calling gettimeofday(NULL, ...) will actually segfault on glibc.
> > It works when calling through the VDSO, but not the logic in glibc
> > itself, which is guess is allowed by POSIX.
> >
> 
> In low level gettimeofday syscall, it should be ok, will check the non-vdso
> code of glibc later. in musl, it returns 0 when it is NULL
> (src/time/gettimeofday.c).

It's fine for the Linux syscall, vdso, musl and nolibc.
It's not fine for glibc and gnulib.

> > I propose to avoid doing it :-)
> 
> Just checked it again, these two cases can also detect the issues (1):
> 
>     CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL)); break;
>     CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;
> 
>     (1) nolibc-test.c:(.text.gettimeofday+0x54): undefined reference to `__aeabi_ldivmod'

To be honest this does not look like a nolibc issue, more a compiler
setup problem. GCC generates calls to a function in libgcc that is not
linked for some reason.

Can you provide reproduction steps?

Also I guess a testcase that tests at runtime that the compilation has
worked is of limited use :-)
It either works or it never executes.

> we can directly remove the second one ;-)
> 
> > 
> > Either we gate the existing test in #ifdef NOLIBC or we remove it.
> 
> so, we still need to check the original gettimeofday_null test case for glibc?

The original testcase also needs adaption, yes.

> Thanks,
> Zhangjin
> 
> > 
> > > +		CASE_TEST(gettimeofday_tv_tz);EXPECT_SYSZR(1, gettimeofday(&tv, &tz)); break;
> > >  		CASE_TEST(getpagesize);       EXPECT_SYSZR(1, test_getpagesize()); break;
> > >  		CASE_TEST(ioctl_tiocinq);     EXPECT_SYSZR(1, ioctl(0, TIOCINQ, &tmp)); break;
> > >  		CASE_TEST(ioctl_tiocinq);     EXPECT_SYSZR(1, ioctl(0, TIOCINQ, &tmp)); break;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
