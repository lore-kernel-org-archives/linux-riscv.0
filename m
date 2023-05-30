Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A852C7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 12:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9csS06fJaxiHEgVauKoPaV6t/w+e9G5ADJdEBR+FDIM=; b=dNV/V9W68kDtyJ
	KheBYC1Ufq7OKEDuX0u3NP/T5odRhSOkuXr/sAx64vWUYOxzZxtU7H+L5fZbnbgQokf4iR3WczJrl
	dh22Y0NPjIX94ddScg51DfpXKz4aouYNRgo0WsFpfl8JJER6A7LVsOTsAYZKVKgwNInMtSVtSg0Ze
	PpHN+zZCV0q6QyIWgOVbg+06BR4R7kvt9TieoBiSKQyuMhCz9iJ+DA5ml3nlUmk0aPX7JYI449cgX
	5Mg7Hqc8pw3xCD0KldPAr2gOER6CQtfaG5bcmfmUP/1E9LoZImYm4h/hn08wHpPjcfUajeLHUzR5R
	ulCNN6eiceOUeio+6EGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3y6X-00DmtC-0h;
	Tue, 30 May 2023 12:05:33 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3y6T-00Dmfd-2p
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 12:05:31 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 34UC50Vg015106;
	Tue, 30 May 2023 14:05:00 +0200
Date: Tue, 30 May 2023 14:05:00 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] selftests/nolibc: add new gettimeofday test cases
Message-ID: <ZHXmbNg4BdJNd4cO@1wt.eu>
References: <cover.1685428087.git.falcon@tinylab.org>
 <bfc3dba52300dcce03ae1c7c41f2bb8984cf459b.1685428087.git.falcon@tinylab.org>
 <96f1134d-ce6e-4d82-ae00-1cd4038809c4@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96f1134d-ce6e-4d82-ae00-1cd4038809c4@t-8ch.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_050530_347103_2D433C7D 
X-CRM114-Status: GOOD (  20.78  )
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

On Tue, May 30, 2023 at 12:59:31PM +0200, Thomas Wei=DFschuh wrote:
> On 2023-05-30 14:37:49+0800, Zhangjin Wu wrote:
> > These 3 test cases are added to cover the normal using scenes of
> > gettimeofday().
> > =

> > They have been used to trigger and fix up such issue:
> > =

> >     nolibc-test.c:(.text.gettimeofday+0x54): undefined reference to `__=
aeabi_ldivmod'
> > =

> > This issue happens while there is no "unsigned int" conversion in the
> > new clock_gettime / clock_gettime64 syscall path of gettimeofday():
> > =

> >     tv->tv_usec =3D ts.tv_nsec / 1000;
> > =

> > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > ---
> >  tools/testing/selftests/nolibc/nolibc-test.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > =

> > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testi=
ng/selftests/nolibc/nolibc-test.c
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
> >  		CASE_TEST(getdents64_root);   EXPECT_SYSNE(1, test_getdents64("/"), =
-1); break;
> >  		CASE_TEST(getdents64_null);   EXPECT_SYSER(1, test_getdents64("/dev/=
null"), -1, ENOTDIR); break;
> >  		CASE_TEST(gettimeofday_null); EXPECT_SYSZR(1, gettimeofday(NULL, NUL=
L)); break;
> > +		CASE_TEST(gettimeofday_tv);   EXPECT_SYSZR(1, gettimeofday(&tv, NULL=
)); break;
> > +		CASE_TEST(gettimeofday_tz);   EXPECT_SYSZR(1, gettimeofday(NULL, &tz=
)); break;
> =

> Calling gettimeofday(NULL, ...) will actually segfault on glibc.
> It works when calling through the VDSO, but not the logic in glibc
> itself, which is guess is allowed by POSIX.

Then that's shocking, because the man page says:

       If either tv or tz is NULL, the corresponding structure is not  set =
 or
       returned.   (However, compilation warnings will result if tv is NULL=
.)

I'd expect glibc to at least support what'd documented in the man
page :-/

> I propose to avoid doing it :-)

If you're certain that's the case, then I agree.

> Either we gate the existing test in #ifdef NOLIBC or we remove it.

Better not keep tests specific to nolibc if they aim at verifying some
compatibliity.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
