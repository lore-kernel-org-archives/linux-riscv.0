Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDBBBCD37B3
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Sep 2023 09:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ly788wTVgzUPBhCMKbs3ws0hsgbxkCJ4yJYt/JKEe3I=; b=PhCpl8wBieSxF9
	tq5dNV5N30s0I7+5cGIxnOf6+STIfvYlRiwTs+JQODM9bq1RNKCGaqCYaOXUPhYX02XyH0xMrKuer
	vskVJJheLM8sul7LFtgl0Y126cy8dFUUIsch5Lh8sitypTkmvjoalSq5tWKkIhzM5Lftx1EeAmznl
	wEZRmHXkU5V3AK2Z9N/jQ1wEfH8ytsOBheMUY0YtpGEds70cSPO5KS8I8EMNCsAxoln3hEx7F7HeY
	03UJJ4/tmMJcMjIUIYVnNw3+kOUatKoI4Ng8D8tMn9BhVIrRNHM6QX4NVt/U4gVut4RzxbL9oUafe
	Yck+1l3uA5hhW+HDlJLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhoOS-00DPth-2q;
	Sun, 17 Sep 2023 09:48:44 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhoOO-00DPsk-2N
	for linux-riscv@lists.infradead.org;
	Sun, 17 Sep 2023 09:48:42 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 38H9mRSk011095;
	Sun, 17 Sep 2023 11:48:27 +0200
Date: Sun, 17 Sep 2023 11:48:27 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] tools/nolibc: avoid unused parameter warnings for
 ENOSYS fallbacks
Message-ID: <20230917094827.GA11081@1wt.eu>
References: <20230914-nolibc-syscall-nr-v1-0-e50df410da11@weissschuh.net>
 <20230914-nolibc-syscall-nr-v1-2-e50df410da11@weissschuh.net>
 <20230917025851.GE9646@1wt.eu>
 <2bd688b7-5f1b-44ca-a41b-6e90dc3e8557@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2bd688b7-5f1b-44ca-a41b-6e90dc3e8557@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_024841_244412_6A97A857 
X-CRM114-Status: GOOD (  21.50  )
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

On Sun, Sep 17, 2023 at 07:49:57AM +0200, Thomas Wei=DFschuh wrote:
> On 2023-09-17 04:58:51+0200, Willy Tarreau wrote:
> > On Thu, Sep 14, 2023 at 06:01:18PM +0200, Thomas Wei=DFschuh wrote:
> > > The ENOSYS fallback code does not use its functions parameters.
> > > This can lead to compiler warnings about unused parameters.
> > > =

> > > Explicitly avoid these warnings.
> > =

> > Just out of curiosity, did you find a valid case for enabling this
> > warning or were you trying various combinations ? I'm asking because
> > I've never seen it enabled anywhere given that it's probably the most =

> > useless and unusable warning: as soon as you're dealing with function
> > pointers, you start to have multiple functions with a similar
> > prototype, some of which just don't need certain arguments, and the
> > only way to shut the warning is to significantly uglify the code.
> =

> nolibc-test uses it currently and I also used it in some projects.

OK then let's handle it.

> >   @@ -934,6 +960,11 @@ int sys_select(int nfds, fd_set *rfds, fd_set *w=
fds, fd_set *efds, struct timeva
> >    #endif
> >    	return my_syscall5(__NR__newselect, nfds, rfds, wfds, efds, timeout=
);
> >    #else
> >   +	return no_syscall5(nfds, rfds, wfds, efds, timeout);
> >   -	return -ENOSYS;
> >    #endif
> > =

> > What do you think ?
> =

> The idea sounds good. But "no_syscall5" sounds a bit non-obvious to me.

Of course, I was just trying to illustrate. I'm never good at giving
names.

> Maybe the macro-equivalent of this?
> =

> static inline int __nolibc_enosys(...)
> {
> 	return -ENOSYS;
> }
> =

> The only-vararg function unfortunately needs C23 so we can't use it.
>
> It's clear to the users that this is about ENOSYS and we don't need a
> bunch of new macros similar.

I like it, I didn't think about varargs, it's an excellent idea! Let's
just do simpler, start with a first arg "syscall_num" that we may later
reuse for debugging, and just mark this one unused:

  static inline int __nolibc_enosys(int syscall_num, ...)
  {
	(void)syscall_num;
  	return -ENOSYS;
  }

Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
