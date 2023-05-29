Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED19C77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q3MWDTLBVs5yu5FIm6OAGuHts55sp2wMcpjIlEWJ9BE=; b=xiPyOoYTVtpYES
	nQHvEqn4zkRy0VDDKSybrQvW2k3p2Y8Pq+zYyBhHkkC7h99Uhdb8DBxz7heF0xoXQwrh0aEv9XLc0
	iA+jZgqVY9cX8LGc7m3sM1AmYc17U1RCh3QXHlR72qZwFH/pLYVh4ErdP1/8ra2+I3vKHI4/ps9W2
	TfNkRUpKdbBq8CLXp/KJEEfgUWGvA7xU2D8ouy7epT0/H9Eq2YZbHH93UpzSCwjD1X+1ulJu4TfII
	TyIQr+CI+ZBTHzbwHzRa6DC7LIPVUxk3v+DxKyW62Vqd5qviVV/iHgidjdFrK75puRsj3+RuQnABG
	99Ur7LH7I4CNC/cc85hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3b6o-00AHru-18;
	Mon, 29 May 2023 11:32:18 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3b6j-00AHpA-3A
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 11:32:16 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 34TBVhxm002783;
	Mon, 29 May 2023 13:31:43 +0200
Date: Mon, 29 May 2023 13:31:43 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Zhangjin Wu <falcon@tinylab.org>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 00/13] tools/nolibc: riscv: Add full rv32 support
Message-ID: <20230529113143.GB2762@1wt.eu>
References: <b25f79f0-a8fb-428a-ad54-fc4afe0df6ff@t-8ch.de>
 <20230528183906.22547-1-falcon@tinylab.org>
 <f7332511-bb3f-4067-a0af-b6880294eded@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f7332511-bb3f-4067-a0af-b6880294eded@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_043214_488232_55508CF2 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Thomas,

On Mon, May 29, 2023 at 10:45:40AM +0200, Thomas Wei=DFschuh wrote:
> <lots of implementation>
> =

> > usage:
> > =

> >     $ gcc -o nolibc-test tools/testing/selftests/nolibc/nolibc-test.c
> >     $ ./nolibc-test
> >     ...
> >     35 gettimeofday_tz =3D 0                                           =
[OK]
> >     36 gettimeofday_tv_tz =3D 0                                        =
[OK]
> >     37 gettimeofday_bad1 =3D -1                                       [=
FAIL] (continued by sigaction/siglongjmp/sigsetjmp)
> >     38 gettimeofday_bad2 =3D -1                                       [=
FAIL] (continued by sigaction/siglongjmp/sigsetjmp)
> >     39 getpagesize =3D 0                                               =
[OK]
> >     40 ioctl_tiocinq =3D 0                                             =
[OK]
> >     41 ioctl_tiocinq =3D 0                                             =
[OK]
> >     ...
> > =

> > It did work as expected, but for nolibc, we still need to add sigaction=
/siglongjump/sigsetjmp support.
> > =

> > Will send a patch based on Willy's latest branch, perhaps this may help=
 us to
> > verify the future sigaction/siglongjump/sigsetjmp for nolibc.
> > =

> > ref: https://www.ibm.com/docs/en/i/7.1?topic=3Dssw_ibm_i_71/apis/sigset=
j.html
> >      https://www.ibm.com/docs/en/zos/2.1.0?topic=3Dfunctions-siglongjmp=
-restore-stack-environment-signal-mask
> =

> This seems very complicated for fairly limited gain to be honest.

I agree as well. I'm not denying the fact that one day we may want to
support signal, longjmp and friends but I'm not convinced we want to
go through that just to make a few uncertain tests succeed.

> If we really want to keep the current testcase we could also ensure that
> the pointer does not fall into the first page, as the first page is not
> mapped under Linux:
> =

> 0 <=3D addr < PAGE_SIZE
> =

> Or instead of PAGE_SIZE just hardcode 4096, as that should be the
> minimum size and and does not require a lookup.

I would not even do that. It brings nothing to the application layer and
inflates the code. I'd rather just get rid of the EFAULT test cases that
rely on an unreliable syscall (i.e. one that may either be a real syscall
or an emulated one). The value brought by these tests is extremely low
and they were implemented only because they were easy to do. If they're
causing pain, let's just drop them.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
