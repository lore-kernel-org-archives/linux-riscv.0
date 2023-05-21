Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE67DC77B73
	for <linux-riscv@archiver.kernel.org>; Sun, 21 May 2023 03:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnpzRAkP8u7LgB/zgkU0XelwZtAzXpgmwxTw0/PeM6s=; b=Uwdq8OSo4jizsZ
	+sJFczjZfLW4YXEqyp6CYulBsJQ5yxjqpCOSj/6ROHl4/Pjb+g+usD7WKsmqsCzWzU9yjIGFLV4Pk
	U+y4ghrvvO0G54noGyheljrRaxndEFtjXt99o6QsH4pgH9ZCKPPj6GBrFKoDUUFFlNtrDTU0q8qkp
	aw2H9M6PkFfQ7T0pJ2bZHL9De+oVmIfl5ejbpiW7RHSLmSJLFcOlICW2kHpF7qRmMmc9HRjxBTtKx
	58NTcumKJUACdTwzcqXl1rMGaTy5xu3tkYi+m9RzRRAJa8EHcGZB1QzupVpOBzlFCMzYaQuNyvTTL
	uxldhQCYlfwrmON57UtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0aDM-003069-0v;
	Sun, 21 May 2023 03:58:36 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0aDH-003050-2g
	for linux-riscv@lists.infradead.org;
	Sun, 21 May 2023 03:58:34 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 34L3wDfn016942;
	Sun, 21 May 2023 05:58:13 +0200
Date: Sun, 21 May 2023 05:58:13 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: thomas@t-8ch.de, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, shuah@kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] selftests/nolibc: Fix up compile error for rv32
Message-ID: <ZGmW1YEUWASzEJ13@1wt.eu>
References: <20230520140949.GA27611@1wt.eu>
 <20230520183022.35929-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230520183022.35929-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_205832_451906_31DCA369 
X-CRM114-Status: GOOD (  36.65  )
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

On Sun, May 21, 2023 at 02:30:22AM +0800, Zhangjin Wu wrote:
> > > The goal of this second test was to make sure that arguments are passed
> > > in the correct order. For this I tried to have a syscall were the
> > > checked error is generated from a non-first argument.
> > > (The NULL generating the EFAULT).
> > > So the new check does not fullfil this goal anymore.
> > 
> > Ah OK good to know.
> >
> 
> does this meet the requirement? the 3rd argument shouldn't < 0, otherwise, there is an EFAULT. 
> 
>     CASE_TEST(syscall_args);      EXPECT_SYSER(1, syscall(__NR_read, 1, &tmp, -1), -1, EFAULT); break;
> 
> It get such test result:
> 
>     70 syscall_args = -1 EFAULT                                      [OK]

I think what Thomas meant is that he wants to be sure the call doesn't
end up as read(-1, &tmp, 1). Here you could have -EBADF or -EFAULT, it
depends. Anyway other solutions can be found if necessary. Another
approach could be to switch back to __NR_fstat and condition it to its
definition.

> > > Maybe we can find a new syscall to test with?
> > 
> > Maybe it would be worth considering pselect() or equivalent which
> > involve many arguments. I don't know if rv32 has fstatat() or
> > lstat() for example, that could be used as alternatives ?
> >
> 
> Unfortuantely, none of them is available in rv32, we have the same tricks you used in another reply:
> 
>     $ echo "#include <asm/unistd.h>" | \
>         riscv64-linux-gnu-gcc -march=rv32im -mabi=ilp32 -Wl,-melf32lriscv_ilp32 -xc - -E -dM | \
>         grep -E "pselect|fstat|lstat"
>     #define __NR_pselect6_time64 413
>     #define __NR3264_fstatfs 44
>     #define __NR_fstatfs64 __NR3264_fstatfs

Then probably fstatfs should work equally for this test.

> Or, use the rv32 test result as a crude reference:
(... trimmed to keep only the failed ones ...)
> 
>     15 chmod_net = -1 ENOENT                                        [FAIL]
>     16 chmod_self = -1 ENOENT  != (-1 EPERM)                        [FAIL]
>     17 chown_self = -1 ENOENT  != (-1 EPERM)                        [FAIL]
>     20 chroot_exe = -1 ENOENT  != (-1 ENOTDIR)                      [FAIL]
>     30 fork = 1 ENOSYS                                              [FAIL]
>     33 gettimeofday_null = -1 ENOSYS                                [FAIL]
>     35 gettimeofday_bad1 = -1 ENOSYS  != (-1 EFAULT)                [FAIL]
>     36 gettimeofday_bad2 = -1 ENOSYS  != (-1 EFAULT)                [FAIL]
>     37 gettimeofday_bad2 = -1 ENOSYS  != (-1 EFAULT)                [FAIL]
>     45 link_cross = -1 ENOENT  != (-1 EXDEV)                        [FAIL]
>     51 poll_null = -1 ENOSYS                                        [FAIL]
>     52 poll_stdout = -1 ENOSYS                                      [FAIL]
>     53 poll_fault = -1 ENOSYS  != (-1 EFAULT)                       [FAIL]
>     56 select_null = -1 ENOSYS                                      [FAIL]
>     57 select_stdout = -1 ENOSYS                                    [FAIL]
>     58 select_fault = -1 ENOSYS  != (-1 EFAULT)                     [FAIL]
>     64 wait_child = -1 ENOSYS  != (-1 ECHILD)                       [FAIL]
>     65 waitpid_min = -1 ENOSYS  != (-1 ESRCH)                       [FAIL]
>     66 waitpid_child = -1 ENOSYS  != (-1 ECHILD)                    [FAIL]
>     Errors during this test: 19

So that's a lot of failures and we should start to blindly degrade other
tests just for the sake of fixing these ones here, it should be done more
carefully.

> As my latest reply here [1] explains, this error is not really rv32 specific,
> all of the time32 based syscalls and even the other 32bit syscalls have been
> disabled by default for new architectures (add the author of commit
> "c8ce48f06503" in the cc list), rv32 here is a very good test case for such
> trend.

I'm fine with going in that direction if that's the future, and using
rv32 as a guide towards this. *BUT* it doesn't mean we have to break
the rest that currently works on existing platforms and is currently
used by various programs. Maybe it means that some of these tests
should be grouped together into a time32_syscall category that's only
tested when __ARCH_WANT_TIME32_SYSCALLS is defined. It would also help
figure what is wrong for some of them. For example chmod/chown/link above
seem to indicate that /proc is not mounted in your test config, not that
the syscalls are not supported. This it seems to me that on this platform
we should still see these syscalls fail and the other ones not executed.

Another approach would be to just group them for easier detection of
the __ARCH_WANT_TIME32_SYSCALLS vs other ones, but not disable them, so
that we can watch the progress made on supporting the mapping of these
ones on new syscalls instead.

And for the one that you changed from __NR_stat to __NR_read, I'm
proposing that either we find another one that works everywhere, or
that we just revert the change and guard it under an ifdef, because
having a direct reference to a syscall number requires that it exists
and I agree that we must not break the build in such a case.

My preference for the short term would be the following:
  1) make sure we fix build issues for all platforms, including rv32
  2) make sure Thomas' work on syscall() and STKP works fine where it
     should, as it used to till now on other platforms

  => this should be added to the 6.5 queue, and for this I don't want
     to make this series regress as it should be queued quickly so that
     test code used by other developers working on 6.5 is reasonably
     stabilized.

  3) evaluate what needs to be done regarding time32, this implies
     working in the lower abstraction layers to depend on
     __ARCH_WANT_TIME32_SYSCALLS and use the new syscalls instead.

  => I don't know how much work it requires; if it's trivial this
     could possibly be for 6.5, otherwise it will have to be postponed.

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
