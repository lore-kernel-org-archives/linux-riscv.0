Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B2F4C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 23 May 2023 18:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=baGOL3smF4rrkkJsSHwkh1y+grJDJrn2zBM79lXcnPs=; b=w13uTdUYvu0ohY
	KJWd8X9skrPMQy2PjRA5WPeRWELH3im8qNU/4z1Axex3lTI84PqQkhQkI6SFcDm8GTbBqWN5hJNVJ
	G2pXg+rGsNhfY2J7efTsHpZNLKJAnddmIJwm7QnHxOLptD9XZ2tWGLy54P/MZws6agPo31MTFGZDk
	NyGqdguQQbF2gLGdyN/VT7uUFJRe763Y5agnCfmni7Tg7cyFyQQfOR/acXDB4dvfgnNLc8WwJiwbQ
	stYLqwEDnFJ1krimhueArv/8T3c6f7aUeFgpmV+RohsJNnAdKtKe1V+2rFpMV7lfJvrnZqFp2bKlO
	WyqY/lO4AFS2M+1003zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1XC6-00BBfk-0d;
	Tue, 23 May 2023 18:57:14 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1XC2-00BBZy-10
	for linux-riscv@lists.infradead.org;
	Tue, 23 May 2023 18:57:12 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 34NIuQ9H014160;
	Tue, 23 May 2023 20:56:26 +0200
Date: Tue, 23 May 2023 20:56:26 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, aou@eecs.berkeley.edu, arnd@arndb.de,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, shuah@kernel.org
Subject: Re: [PATCH] selftests/nolibc: Fix up compile error for rv32
Message-ID: <ZG0MWgK81xeq96K5@1wt.eu>
References: <20230521180823.164289-1-falcon@tinylab.org>
 <20230523180340.466619-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523180340.466619-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_115710_949343_BAA7DBE9 
X-CRM114-Status: GOOD (  40.19  )
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

On Wed, May 24, 2023 at 02:03:40AM +0800, Zhangjin Wu wrote:
> Hi, Willy, Thomas
> 
> Good news, I just fixed up all of the time32 syscalls related build and
> test failures for rv32 and plan to send out the whole patchset tomorrow.

Ah that's excellent!

> The patchset is based on 20230520-nolibc-rv32+stkp2 of [1] and the new
> statckprotect patchset [2] (If v2 is ready, I prefer to rebase on v2).

I'm really sorry for still failing to merge Thomas' branch but I'm on
the last mile to a release (next week) and collecting last minute stuff
from everywhere and my days and nights are really too short these days :-(

> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/wtarreau/nolibc.git
> [2]: https://lore.kernel.org/linux-riscv/20230521100818.GA29408@1wt.eu/T/#t
> 
> For the fstat compile issue, I prefer to use a __NR_statx for rv32
> instead of using fstatfs, because of different fstatfs* have different
> errno's, it is ugly to use lots of macros ;-) what's your suggestion?
> 
> Here is the __NR_statx version:
> 
>     +static int test_syscall_args(void)
>     +{
>     +#ifdef __NR_statx
>     +	return syscall(__NR_statx, 0, NULL, 0, 0, NULL);
>     +#elif defined(__NR_fstat)
>     +	return syscall(__NR_fstat, 0, NULL);
>     +#else
>     +#error Neither __NR_statx nor __NR_fstat defined, cannot implement syscall_args test
>     +#endif
>     +}
> 
> And the fstatfs version:
> 
>     +#ifdef __NR_fstatfs64
>     +#define EXPECT_SYSER_SYSCALL_ARGS() EXPECT_SYSER(1, syscall(__NR_fstatfs64, 0, 0, NULL), -1, EINVAL)
>     +#elif defined(__NR_fstatfs)
>     +#define EXPECT_SYSER_SYSCALL_ARGS() EXPECT_SYSER(1, syscall(__NR_fstatfs, 0, NULL), -1, EFAULT)
>     +#elif defined(__NR_fstat)
>     +#define EXPECT_SYSER_SYSCALL_ARGS() EXPECT_SYSER(1, syscall(__NR_fstat, 0, NULL), -1, EFAULT)
>     +#else
>     +#error None of __NR_fstatfs64, __NR_fstatfs and __NR_fstat defined, cannot implement syscall_args test
>     +#endif

The first one indeed looks cleaner, I agree! Can't we just use statx
for all archs then and further simplify this ?

> And I plan to move __NR_fstat as the first branch to make sure it works
> as before on the other platforms.

Note that it was very recently added (recent batch of updates from
Thomas) and still only queued in my branch, so we can reorder everything
as we want and if in the end we drop some of these patches or change some
approaches to be more portable from the beginning, that's always better.

> >     30 fork = 1 ENOSYS                                              [FAIL]
> >     33 gettimeofday_null = -1 ENOSYS                                [FAIL]
> >     35 gettimeofday_bad1 = -1 ENOSYS  != (-1 EFAULT)                [FAIL]
> >     36 gettimeofday_bad2 = -1 ENOSYS  != (-1 EFAULT)                [FAIL]
> >     37 gettimeofday_bad2 = -1 ENOSYS  != (-1 EFAULT)                [FAIL]
> >     51 poll_null = -1 ENOSYS                                        [FAIL]
> >     52 poll_stdout = -1 ENOSYS                                      [FAIL]
> >     53 poll_fault = -1 ENOSYS  != (-1 EFAULT)                       [FAIL]
> >     56 select_null = -1 ENOSYS                                      [FAIL]
> >     57 select_stdout = -1 ENOSYS                                    [FAIL]
> >     58 select_fault = -1 ENOSYS  != (-1 EFAULT)                     [FAIL]
> >     64 wait_child = -1 ENOSYS  != (-1 ECHILD)                       [FAIL]
> >     65 waitpid_min = -1 ENOSYS  != (-1 ESRCH)                       [FAIL]
> >     66 waitpid_child = -1 ENOSYS  != (-1 ECHILD)                    [FAIL]
> >
> 
> All of the above failures have been fixed up, some of them are very
> easy, some of them are a little hard.
> 
> 1. 30, 64-66 depends on wait4, use waitid instead
> 2. 33-37 depends on gettimeofday, use clock_gettime64 instead
> 3. 51-53 depends on ppoll, use ppoll_time64 instead
> 4. 56-58 depends on pselect*, use pselect_time64 instead

Awesome!

> And I have found there are two same 'gettimeofday_bad2', is it designed?
> If no, I will send a patch to dedup it:
> 
>     CASE_TEST(gettimeofday_bad2); EXPECT_SYSER(1, gettimeofday(NULL, (void *)1), -1, EFAULT); break;
>     CASE_TEST(gettimeofday_bad2); EXPECT_SYSER(1, gettimeofday(NULL, (void *)1), -1, EFAULT); break;

I remember this one and I couldn't spot it last time. We had two accidental
duplicates, I searched them and managed to find the first one (which I
dropped a version or two ago) and didn't spot the remaining one so I
thought it was already gone. Apparently not! Fell free to send a patch
to kill it, of course!

> > My suggestion is directly fix up the failures one by one in current stage,
> > because nolibc currently only uses part of the time32 syscalls, it may be not
> > that complex to fix up them. Have read the code of musl and glibc today, both
> > of them have good time64 syscalls support, I plan to fix up the above failures
> > in several days, hope so but no promise ;-)
> >
> 
> both musl and glibc help a lot, but also encounter some critical issues, for
> example, to pass some test cases, it is required to emulate the same path of
> the target syscalls and return the same errno's for them, the code comment will
> exaplain the details.

OK but you know, we're only entitled to respect the documented syscall
errors. If we've used some in our tests because "it's just how they happen
to work" and the behavior changes on a different implementation while still
matching the man page, we may have to adjust some of our tests. On the
other hand if a remapped syscall doesn't respect the man page, it will
break some existing code and needs to be fixed (which is exactly the
purpose of nolibc-test in the first place).

> > And another question: for the new changes, If a platform support both of the
> > 32bit and 64bit syscalls, do we need to put the 64bit syscalls at first?
> >
> 
> To make sure not touch too much on the code and reduce test cost, the patchset
> just kept the default code order and let the old code in the first branch.

I'm fine with this. I absolutely don't care a single second about the
tests performance (they're instantaneous right now, an extra "if" will
not even be noticeable). Similarly we'll care about the code size when
the resulting binary reaches hundreds of kB. What matters for now is
that regular contributors like Thomas, Mark and you find it easy enough
to add or fix some entries without having to think about tons of stuff
to do it properly. The rest is just accessory.

> I plan to send the whole patchset tomorrow.

OK thank you! I prefer to warn you that it's unlikely that I'll be able
to work on it before the week-end, though, so take your time.

Thanks again,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
