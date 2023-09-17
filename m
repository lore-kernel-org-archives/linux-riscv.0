Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D94ACD13CF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 15:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0aUNmGUZ0lgRD4xToAzo7Qs4IT9CuwtRc2uU/3W7PmM=; b=XN+laJCN/dDiMO
	KsOYBuuucLCdl9pcnDGbfzpYwQNk1zTRYoJE9Am04cXTKONHFvHQEOWhPqpqJerOzXC/K2w/Tsn7i
	vyuWjPozt+Ul7Zypas5dLzzE12eWRI2cE3SKkHH6HLaVOiP7gORbn4yb15DohYXeUwOYns9AF6YM6
	1ETCgBm+I4uU9Gbfm7BYmUXoLFtstXcOgZsGz1GYykeTNMahnCKKEf2PdfABEWgUGs1NrAEsYiOaJ
	UdxF74dcJ4KKwtEYnWyg60Aj6sBXeRgH+cvGMkM6w/pyodqwO/nzlEV9MHFd24K6i1gpsVKNMFhwC
	9870Z71Vg51wSQ1ACbrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtOI-00Dl3X-0q;
	Sun, 17 Sep 2023 15:08:54 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhtOD-00Dl2f-1z
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 15:08:52 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 38HF8KQT014506;
	Sun, 17 Sep 2023 17:08:20 +0200
Date: Sun, 17 Sep 2023 17:08:20 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] tools/nolibc: avoid unused parameter warnings for
 ENOSYS fallbacks
Message-ID: <20230917150820.GA14418@1wt.eu>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
 <20230914-nolibc-syscall-nr-v1-2-e50df410da11@weissschuh.net>
 <20230917025851.GE9646@1wt.eu>
 <2bd688b7-5f1b-44ca-a41b-6e90dc3e8557@t-8ch.de>
 <20230917094827.GA11081@1wt.eu>
 <1ef57a1e-89d3-4eb6-be12-3045a31f99e4@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ef57a1e-89d3-4eb6-be12-3045a31f99e4@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_080850_632543_CE39FB2F 
X-CRM114-Status: GOOD (  15.05  )
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

On Sun, Sep 17, 2023 at 05:07:18PM +0200, Thomas Wei=DFschuh wrote:
> On 2023-09-17 11:48:27+0200, Willy Tarreau wrote:
> > [..]
> > > Maybe the macro-equivalent of this?
> > > =

> > > static inline int __nolibc_enosys(...)
> > > {
> > > 	return -ENOSYS;
> > > }
> > > =

> > > The only-vararg function unfortunately needs C23 so we can't use it.
> > >
> > > It's clear to the users that this is about ENOSYS and we don't need a
> > > bunch of new macros similar.
> > =

> > I like it, I didn't think about varargs, it's an excellent idea! Let's
> > just do simpler, start with a first arg "syscall_num" that we may later
> > reuse for debugging, and just mark this one unused:
> > =

> >   static inline int __nolibc_enosys(int syscall_num, ...)
> >   {
> > 	(void)syscall_num;
> >   	return -ENOSYS;
> >   }
> =

> But which syscall_num to use, as the point of __nolibc_enosys() would be
> that no syscall number is available and the defines are missing.

good point :-)

> For debugging we could add a string argument, though.

That works for me.

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
