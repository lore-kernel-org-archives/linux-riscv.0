Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CBBC77B7E
	for <linux-riscv@archiver.kernel.org>; Sat, 27 May 2023 05:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfpyZTzVD7tAHaPu2kL+9j9YD6xQfK8n7veJYRT93X8=; b=zjdeeSh7lMwq/9
	Bg5e4Pb/DmkYt06QnFmDIZ9cryMe5bCvimj3kEcygg61N/arZSFm1RhnXOALxfQFQrZc7FOkciD2B
	lkvBqCa/TO3ksPxyqvzqQ09Q5PRaj+11Y9MmQ6UO/mPVx3jJOhXnzV5bKm4l8sKvym1p25uYm2D05
	wFuih/0zryzg5+L+kZVC+f4MnR1emVPPbv7donP3VbmHv6MxCMiVV6g5mvf6CG4ZvEyqVvSTSQ0IG
	6idbVRDIwo2MpOyvvwV69yvT/QTaci7PVRU76qWahUME6st1xFyjmwP8efy1SfsDn8oUTaxtJZ5Rm
	17gc5YWgTHQWDmQvCWWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2mES-004ue4-1q;
	Sat, 27 May 2023 05:12:48 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2mEO-004udM-0K
	for linux-riscv@lists.infradead.org;
	Sat, 27 May 2023 05:12:46 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 34R5Ccrb019728;
	Sat, 27 May 2023 07:12:38 +0200
Date: Sat, 27 May 2023 07:12:38 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH 13/13] tools/nolibc: sys_gettimeofday: riscv: use
 __NR_clock_gettime64 for rv32
Message-ID: <ZHGRRtEURNb9eUAP@1wt.eu>
References: <29e4b23d-27cb-4101-bfe9-c6b412222578@t-8ch.de>
 <20230527012635.19595-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230527012635.19595-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_221244_736595_31A9EE9D 
X-CRM114-Status: GOOD (  29.78  )
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

Hi Zhangjin,

On Sat, May 27, 2023 at 09:26:35AM +0800, Zhangjin Wu wrote:
> > > @@ -554,7 +560,47 @@ long getpagesize(void)
> > >  static __attribute__((unused))
> > >  int sys_gettimeofday(struct timeval *tv, struct timezone *tz)
> > >  {
> > > +#ifdef __NR_gettimeofday
> > >  	return my_syscall2(__NR_gettimeofday, tv, tz);
> > > +#elif defined(__NR_clock_gettime) || defined(__NR_clock_gettime64)
> > > +#ifdef __NR_clock_gettime
> > > +	struct timespec ts;
> > > +#else
> > > +	struct timespec64 ts;
> > > +#define __NR_clock_gettime __NR_clock_gettime64
> > > +#endif
> > > +	int ret;
> > > +
> > > +	/* make sure tv pointer is at least after code segment */
> > > +	if (tv != NULL && (char *)tv <= &etext)
> > > +		return -EFAULT;
> > 
> > To me the weird etext comparisions don't seem to be worth it, to be
> > honest.
> >
> 
> This is the issue we explained in commit message:
> 
>     * Both tv and tz are not directly passed to kernel clock_gettime*
>       syscalls, so, it isn't able to check the pointer automatically with the
>       get_user/put_user helpers just like kernel gettimeofday syscall does.
>       instead, we emulate (but not completely) such checks in our new
>       __NR_clock_gettime* branch of nolibc.
> 
> but not that deeply described the direct cause, the direct cause is that the
> test case passes a '(void *)1' and the kernel space of gettimeofday can simply
> 'fixup' this issue by the get_user/put_user helpers, but our user-space tv and
> tz code has no such function, just emulate such 'fixup' by a stupid etext
> compare to at least make sure the data pointer is in data range. Welcome better
> solution.
> 
>     CASE_TEST(gettimeofday_bad1); EXPECT_SYSER(1, gettimeofday((void *)1, NULL), -1, EFAULT); break;
>     CASE_TEST(gettimeofday_bad2); EXPECT_SYSER(1, gettimeofday(NULL, (void *)1), -1, EFAULT); break;

I also disagree with this approach. The purpose of nolibc is not to serve
"nolibc-test", but to serve userland programs in the most efficient way
possible in terms of code size. Nolibc-test only tries to reproduce a
number of well-known success and error cases that applications might
face, to detect whether or not we implemented our syscalls correctly and
if something recently broke on the kernel side. In no case should we
adapt the nolibc code to the tests run by nolibc-test.

What this means here is that we need to decide whether the pointer check
by the syscall is important for applications, in which case we should do
our best to validate it, or if we consider that we really don't care a
dime since invalid values will only be sent by bogus applications we do
not expect to support, and we get rid of the test. Note that reliably
detecting that a pointer is valid from userland is not trivial at all,
it requires to rely on other syscalls for the check and is racy in
threaded environments.

I tend to think that for gettimeofday() we don't really care about
invalid pointers we could be seeing here because I can't imagine a
single case where this wouldn't come from an application bug, so in
my opinion it's fine if the application crashes. The problem here is
for nolibc-test. But this just means that we probably need to revisit
the way we validate some failures, to only perform some of them on
native syscalls and not emulated ones.

One approach might consist in tagging emulated syscalls and using this
for each test. Originally we only had a 1:1 mapping so this was not a
question. But with all the remapping you're encountering we might have
no other choice. For example for each syscall we could have:

  #define _NOLIBC_sys_blah_native 0  // implemented but emulated syscall
  #define _NOLIBC_sys_blah_native 1  // implemented and native syscall

And our macros in nolibc-test could rely on this do skip some tests
(just skip the whole test if _NOLIBC_sys_blah_native is not defined,
and skip some error tests if it's 0).

Overall what I'm seeing is that rv32 integration requires significant
changes to the existing nolibc-test infrastructure due to the need to
remap many syscalls, and that this will result in much cleaner and more
maintainable code than forcefully inserting it there. Now that we're
getting a cleaner picture of what the difficulties are, we'd rather
work on these as a priority.

Regards,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
