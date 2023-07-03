Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8652EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iI7hyRwfuVO9frxiq454WStuin5zJmVWIWCwutm3tAQ=; b=RuEm7FPGZoDAsd
	72qAv3FT7pOLViR6zri8lKvcq3Gigw4M+09NNCD2Bs38Yi7AXYZb5q2NUZjuHAyg+D4Ixwcs7fKD3
	SWrpe0zrVYIXapz+8MAd6JidO8ZwaoBWDL46QgmpPy4Qiv2Bd8BPJcBY6P8/pOC5NUnET89uI2aAF
	46ERYH79gu1/ODUgVhfG3bIzBJpixRmw2T97c2fXyziDZbA3hY2mrPz+tf9lKsP+6qK8gnezbONqC
	07avi6oSQ0sxDyqUitHHGHg/f4wEBEvmfNKPv63R2Ep/btXaG537TJhNmrPcdIPJJfB0Oh0MMJ9At
	JqExUjWwmfkBDNeZ3q+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEni-009jfE-2s;
	Mon, 03 Jul 2023 08:20:50 +0000
Received: from todd.t-8ch.de ([2a01:4f8:c010:41de::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEnf-009jcp-1V
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 08:20:49 +0000
Date: Mon, 3 Jul 2023 10:20:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1688372442; bh=eG4hejjueR/OQipmldkNjJWTBqfgbdBdHjpVICVNdr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8f5qUhQgUw3BKlidU3AXrWYiHHDaz7jEDMYnxmlvtjEohc3c2srqggGtDLtyNAq/
	 T+MgazLr1nJ4pjFOEwyQUt/HAQeTXb3Yna3H2VuxXyjsjl7LQ6T01StoBhB6MF5NsI
	 cpL4Jg4WFmpvkMoBE8Quz23HqZywFRmblvYwCKEw=
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: w@1wt.eu, arnd@arndb.de, david.laight@aculab.com, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 14/14] selftests/nolibc: add mmap and munmap test cases
Message-ID: <f74a85a5-ea9a-4819-a95e-aa9525bf84f9@t-8ch.de>
References: <ZKJ35DyPOG+LAy5j@1wt.eu>
 <20230703080647.491363-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703080647.491363-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_012047_662723_0BD6662C 
X-CRM114-Status: GOOD (  32.13  )
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

On 2023-07-03 16:06:47+0800, Zhangjin Wu wrote:
> Hi, Willy

> [..]

> > > - argv[0]
> > > 
> > >   since nolibc has no realpath() currently, we can simply
> > >   support the current path and the absolute path like this:
> > > 
> > >     nolibc-test.c:
> > > 
> > >     /* assigned as argv[0] in main(), will be used by some tests */
> > >     static char exe[PATH_MAX + 1];
> > > 
> > >     main():
> > > 
> > >     /* get absolute path of myself, nolibc has no realpath() currently */
> > >     #ifndef NOLIBC
> > >             realpath(argv[0], exe);
> > >     #else
> > >             /* assume absolute path has no "./" */
> > >             if (strncmp(argv[0], "./", 2) != 0)
> > >                     strncat(exe, argv[0], strlen(argv[0]) + 1);
> > >             else {
> > >                     pwd = getenv("PWD");
> > >                     /* skip the ending '\0' */
> > >                     strncat(exe, getenv("PWD"), strlen(pwd));
> > >                     /* skip the first '.' */
> > >                     strncat(exe, argv[0] + 1, strlen(argv[0]));
> > >             }
> > >     #endif
> > 
> > No, please, not like this. Just copy argv[0] (the pointer not the
> > contents) and you're fine:
> >
> >     static const char *argv0;
> > 
> >     int main(int argc, char **argv, char **envp)
> >     {
> >             argv0 = argv[0];
> >             ...
> >     }
> > 
> > Nothing more, nothing less. Your program will always have its correct
> > path when being called unless someone purposely forces it to something
> > different, which is not our concern at all since this is a test program.
> > And I'd rather call it "argv0" which exactly tells us what it contains
> > than "exe" which can be misleading for that precise reason.
> >
> 
> Yeah, locally, I just used a global argv0 pointer directly, but
> chroot_exe("./nolibc-test") not work when run 'libc-test' in host
> system, that is why I tried to get an absolute path ;-)
> 
>     CASE_TEST(chroot_exe);        EXPECT_SYSER(1, chroot(exe), -1, ENOTDIR); break;
> 
>     -->
> 
>     19 chroot_exe = -1 ENOENT  != (-1 ENOTDIR)                      [FAIL]
> 
> I removed the "proc ?" check manually to test if it also work with
> CONFIG_PROC_FS=n. it doesn't work, without absolute path, we need to add
> the ENOENT errno back to the errno check list.
> 
> I'm not sure if the other syscalls require an absolute path, so, the
> realpath() is called in this proposed method.
> 
> > > A full functional realpath() is a little complex, such as '../' support and
> > > even symlink support, let's delay its requirement at current stage ;-)
> > 
> > Please do not even engage into this, and keep in mind that the sole
> > purpose of this test program is to help developers simply add tests to
> > the set of existing ones. If the program becomes complex for doing stuff
> > that is out of its scope, it will become much harder to extend and users
> > will lose interest and motivation for updating it.
> > 
> > > one or both of them may also help the other test cases:
> > > 
> > > - chroot_exe (used '/init' before)
> > > 
> > >     CASE_TEST(chroot_exe);        EXPECT_SYSER(1, chroot(proc ? "/proc/self/exe" : exe), -1, ENOTDIR); break;
> > > 
> > > - chmod_exe (replace the one: chmod_tmpdir in another patchset)
> > > 
> > >     CASE_TEST(chmod_exe);       EXPECT_SYSZR(1, chmod(proc ? "/proc/self/exe" : exe, 0555)); break;
> > > 
> > >     It should be safe enough to only remove the writable attribute for the test
> > >     program.
> > > 
> > > - stat_timestamps (used '/init' before)
> > > 
> > >     if (stat("/proc/self/", &st) && stat(exe, &st) && stat("/dev/zero", &st) && stat("/", &st))
> > 
> > Indeed, why not!
> >
> 
> Ok, without absolute path, the chroot_exe() will be changed back to
> something like this:
> 
>     CASE_TEST(chroot_exe);        EXPECT_SYSER2(1, chroot(proc ? "/proc/self/exe" : argv0), -1, ENOTDIR, ENOENT); break;

Are you sure the ENOENT is really correct?
I played with this before and got ENOENT because before the chroot test
we have a testcase that does chdir("/").
And therefore the relative name in argv[0] was not resolving correctly
anymore against the changed working directory.

(You can also test this by executing *only* the chroot test and it
should work)

In general chroot() should work just fine with relative paths.

This is really a lot of complexity and discussion only to avoid
depending on procfs for the tests.

Thomas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
