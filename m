Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5E0C77B7D
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 14:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMcLWYA+3mt4mr+z8Gjt+muRPC8oqReBZS9QrkTc5HE=; b=toN7d08ywIIdGJ
	rtnogmBdUtgkltfQCXvNHBZFLlF7xe5+eU2uEUvCEgH6lNqwJ/ZjKOME6sSuko/eASXEwwuvqOZro
	U7fHk9QwPhp3Qv8JupiS3WG4jjqY1mr2pS2l1lR/dqnRM6iXECA/FYOqdZB4atW19oMtIpTijan2N
	yv2/vTQIUyhRxJlsZeCciSGhEP0tjdY7fPeYtZ1zz+BkBGhhTAgNj7css7Jk0uUgaO2oIuiZzfMax
	6/R9+uBcKhDxGzUWik9mOWCyVgh5Xm34/kCK65lUmJfBJCbRVs+7CL54DJ6XVYiQ7HBIQMBC+uu3V
	BT2EQBESHajjs2ENxOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0NHU-001eFn-2G;
	Sat, 20 May 2023 14:10:00 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0NHR-001eF1-1O
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 14:09:59 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34KE9n6D027634;
	Sat, 20 May 2023 16:09:49 +0200
Date: Sat, 20 May 2023 16:09:49 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, aou@eecs.berkeley.edu,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, shuah@kernel.org
Subject: Re: [PATCH] selftests/nolibc: Fix up compile error for rv32
Message-ID: <20230520140949.GA27611@1wt.eu>
References: <20230520-nolibc-stackprotector-riscv-v1-1-d8912012a034@weissschuh.net>
 <20230520120254.66315-1-falcon@tinylab.org>
 <958f09b4-8cd7-46b3-aa54-4d981fd8f1bc@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <958f09b4-8cd7-46b3-aa54-4d981fd8f1bc@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_070958_338921_3764CA43 
X-CRM114-Status: GOOD (  14.60  )
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

On Sat, May 20, 2023 at 04:00:54PM +0200, Thomas Wei=DFschuh wrote:
> > diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testi=
ng/selftests/nolibc/nolibc-test.c
> > index 063f9959ac44..d8b59c8f6c03 100644
> > --- a/tools/testing/selftests/nolibc/nolibc-test.c
> > +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> > @@ -596,7 +596,7 @@ int run_syscall(int min, int max)
> >  		CASE_TEST(write_badf);        EXPECT_SYSER(1, write(-1, &tmp, 1), -1=
, EBADF); break;
> >  		CASE_TEST(write_zero);        EXPECT_SYSZR(1, write(1, &tmp, 0)); br=
eak;
> >  		CASE_TEST(syscall_noargs);    EXPECT_SYSEQ(1, syscall(__NR_getpid), =
getpid()); break;
> > -		CASE_TEST(syscall_args);      EXPECT_SYSER(1, syscall(__NR_fstat, 0,=
 NULL), -1, EFAULT); break;
> > +		CASE_TEST(syscall_args);      EXPECT_SYSER(1, syscall(__NR_read, -1,=
 &tmp, 1), -1, EBADF); break;
> =

> The goal of this second test was to make sure that arguments are passed
> in the correct order. For this I tried to have a syscall were the
> checked error is generated from a non-first argument.
> (The NULL generating the EFAULT).
> So the new check does not fullfil this goal anymore.

Ah OK good to know.

> Maybe we can find a new syscall to test with?

Maybe it would be worth considering pselect() or equivalent which
involve many arguments. I don't know if rv32 has fstatat() or
lstat() for example, that could be used as alternatives ?

> The code should have had a comment I guess.

Indeed ;-)

With that said, if rv32 is missing some essential syscalls, my question
regarding its relevance here still holds!

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
