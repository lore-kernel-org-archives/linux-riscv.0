Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C855E7718B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 08:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9v8nC3gUOn3KyUmQYNvBj8NIenP7nClg1wX1cjnASjI=; b=p0cxlHHs4XTvjn
	Xtvdf1P8zY7KTa+So3Alvk27eR6xU1FzVF1DctMNNpF8i8m9xS2ZwNjsN4liZhs/LvjO4AT/gy60L
	LO1XPABhEgKfwP2jn5QLQ7rkzKNDSToXWkF/7zicapQLzHWX7XXGxpnbQeeOYOpF8kQWWjt30r4Im
	ggkhnTiaZ72KwEszQ9tdJeHUFVrC8B1cC+Z/HjZCGFmGZgG5LwUMpMiUOVcBvkfbsj0bm7NchxVfa
	2CYaSWo9h3Onkiy3ZRKPfACgmI9UI9MCLqcm9OPkPBbMWbZTq3TF/ANqbIFzqTW92+4uyIAKUxmlk
	0bBrll4zH/GfvTmVcwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdZK-00000009ZVc-2WNv;
	Mon, 23 Dec 2024 08:13:38 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPdZH-00000009ZUt-2jrj
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 08:13:37 +0000
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 4BN8DJbb003891;
	Mon, 23 Dec 2024 09:13:19 +0100
Date: Mon, 23 Dec 2024 09:13:19 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, Zhangjin Wu <falcon@tinylab.org>
Subject: Re: [PATCH 1/6] tools/nolibc: add support for waitid()
Message-ID: <20241223081319.GA3840@1wt.eu>
References: <20241221-nolibc-rv32-v1-0-d9ef6dab7c63@weissschuh.net>
 <20241221-nolibc-rv32-v1-1-d9ef6dab7c63@weissschuh.net>
 <20241221163540.GA11984@1wt.eu>
 <732f202e-c0de-493e-adec-59fe069b17c9@t-8ch.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <732f202e-c0de-493e-adec-59fe069b17c9@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_001336_123385_DDA14D41 
X-CRM114-Status: GOOD (  25.23  )
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

Hi Thomas!

On Sun, Dec 22, 2024 at 12:39:01PM +0100, Thomas Wei=DFschuh wrote:
> > Maybe it will be time for us to run an overall audit of arch-dependent
> > syscalls we currently have, to make sure that the common ones continue
> > to work fine there (and waitpid() definitely is as common a syscall as
> > open() since it's the good old and portable one).
> =

> Isn't this what nolibc-test is already doing?

My concern is that it might be progressively going away from this if
we replace some standard syscalls with new ones that are cross-arch.

> Or do you also want to compare it to non-current kernel versions?

I mean that we progressively replace old posix calls with new cross arch
ones in the system (e.g. open->openat, waitpid->waitid etc) and normally
it's a libc's role to preserve application-level compatibility by
maintaining the mapping between standard ones and specific ones so that
applications relying on standard ones continue to work, and that was one
of the original goals of nolibc.

I have nothing against missing some calls in newly added architectures,
of course, but when I'm seeing for example that we switch some of the
lower layer tests to use a pipe because some call was not present, I
tend to think that maybe we should first define what is the minimal set
of working syscalls that the nolibc-test program requires to be usable
on any arch.

In the current case, we seem to have to arbiter between pipe() and
lseek() support for basic nolibc-test support. But maybe a new arch will
be added for which it will be the opposite choice between the two. We
may very well require both of them to work if needed, or either, at the
risk of delaying support of a specific arch in the future, but that's
fine.

Second we should have a new look at all our supported calls and check if
some of them are present while the legacy calls they're supposed to
replace is missing (which would be perfectly possible). For example if
we had implemented waitpid() much later, it would have been perfectly
possible that we'd only implement waitid() and miss waitpid() that
applications expect.

Honestly it's not a particularly interesting job to do. That's why I'm
mostly saying that we should just keep that in mind to be careful with
new additions.

> In general the special rv32 syscalls are not really
> architecture-dependent, they just dropped the "legacy" ones, especially
> all using 32bit timestamps.

I understand, and when adding a new arch we need to start with something.
I just think that we should consider that for a new arch to switch from
"in progress" to "working", it would require the legacy ones working on
other archs to work on that one as well. My concern is that early boot
tools would only build on certain archs but not all when all of them are
supposed to be in a working state. When it fails everywhere that's fine,
it just means we're missing some calls and the user is welcome to submit
a patch. But when the user only tests on, say, x86 and arm, and someone
relies on that to package kernels and discovers late that it fails on
riscv for example, that's a problem. Note that I'm just making up examples,
and not designating any particular issue.

Maybe it would be convenient to maintain a support matrix for the syscalls
we currently support. It could look something like:

   waitpid()   x86: native
               arm: native
               riscv32: via waitid()
               foobar: not yet

   open()      ...

etc. I could try to work on such a thing if you're interested as well, but
not now as I don't have the time at the moment.

Cheers,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
