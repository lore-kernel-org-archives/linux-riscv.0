Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7C20EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 07:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ppHu7EBQIoyuczyOZyLdsIuJrtTlqfC+pPQOmHWIOEc=; b=WvYci8wUjuiz+d
	ixhjgGdxUVJBa/leAHaLZ6GBbdFtWL0WZ+1uhrlbAQhW27e17sYkJ0lViliUc3rfEtwvlfr4qFYFc
	sQKx4aEcGAVBl90CcPKPbhG2X6I6eCAFJEgk2y71cjywH+VZ/O8Yvf6BthKo/8/klIupRObZr40QY
	gC35+9MWMzk6B81R57EBAo1NGacQO72GBETZH/37TPk40xfWDtb8SiVgpVz5Tnxn5vjlM1ODwddwG
	XoOfYaxn21ZwOwXxveE5eXKKaLAycnmF1CmyNL+5MV2mPPphzF+9iABIhz4nJmoyXLXwVFEARV3JE
	YmBskKuBlfKEApWwK7kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDwK-009Zpn-07;
	Mon, 03 Jul 2023 07:25:40 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGDwE-009Zmn-2S
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 07:25:38 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3637POX9022120;
	Mon, 3 Jul 2023 09:25:24 +0200
Date: Mon, 3 Jul 2023 09:25:24 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, david.laight@aculab.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux@weissschuh.net, thomas@t-8ch.de
Subject: Re: [PATCH v5 14/14] selftests/nolibc: add mmap and munmap test cases
Message-ID: <ZKJ35DyPOG+LAy5j@1wt.eu>
References: <20230702193306.GK16233@1wt.eu>
 <20230703060323.487347-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703060323.487347-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_002536_329399_BE248F22 
X-CRM114-Status: GOOD (  30.72  )
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

On Mon, Jul 03, 2023 at 02:03:23PM +0800, Zhangjin Wu wrote:
> > > - the others, for kernel without procfs
> > >   let it pass even with 'worst case' kernel configs
> > 
> > You should include /dev/zero, which is commonly used to allocate anonymous
> > memory and is more likely present and readable than any of the other files.
> > And another file of choice is obviously argv[0] ;-)  In this case you don't
> > need any of the other extra ones. Thus I could suggest that you try in this
> > order:
> > 
> >     /dev/zero, /proc/self/exe, /proc/1/exe, argv[0]
> > 
> > and be done with it. That doesn't prevent one from extending the list if
> > really needed later, but I doubt it would be needed. Also, it's already
> > arranged in a read-write, then read-only fallbacks mode, so if we later
> > need to add more complex tests involving writes, the writable /dev/zero
> > will have precedence.
> >
> 
> Cool, both /dev/zero and argv[0] are very good candidates ;-)
> 
> Just verified both of them, works perfectly.
> 
> - /dev/zero
> 
>   we need to mknod it in prepare()

Indeed.

>   and also, in test_mmap_munmap(),
>   stat() return a zero size of /dev/zero, in this case, we should assign
>   a non-zero file_size ourselves.
> 
>     -       file_size = stat_buf.st_size;
>     +       /* file size of the special /dev/zero is 0, let's assign one manually */
>     +       if (i == 0)
>     +               file_size = 3*page_size - 1;
>     +       else
>     +               file_size = stat_buf.st_size;

OK but why this -1 ? That doesn't sound right, unless you explicitly want
a file size that's not multiple of a page size for whatever reason ?

> - argv[0]
> 
>   since nolibc has no realpath() currently, we can simply
>   support the current path and the absolute path like this:
> 
>     nolibc-test.c:
> 
>     /* assigned as argv[0] in main(), will be used by some tests */
>     static char exe[PATH_MAX + 1];
> 
>     main():
> 
>     /* get absolute path of myself, nolibc has no realpath() currently */
>     #ifndef NOLIBC
>             realpath(argv[0], exe);
>     #else
>             /* assume absolute path has no "./" */
>             if (strncmp(argv[0], "./", 2) != 0)
>                     strncat(exe, argv[0], strlen(argv[0]) + 1);
>             else {
>                     pwd = getenv("PWD");
>                     /* skip the ending '\0' */
>                     strncat(exe, getenv("PWD"), strlen(pwd));
>                     /* skip the first '.' */
>                     strncat(exe, argv[0] + 1, strlen(argv[0]));
>             }
>     #endif

No, please, not like this. Just copy argv[0] (the pointer not the
contents) and you're fine:

    static const char *argv0;

    int main(int argc, char **argv, char **envp)
    {
            argv0 = argv[0];
            ...
    }

Nothing more, nothing less. Your program will always have its correct
path when being called unless someone purposely forces it to something
different, which is not our concern at all since this is a test program.
And I'd rather call it "argv0" which exactly tells us what it contains
than "exe" which can be misleading for that precise reason.

> A full functional realpath() is a little complex, such as '../' support and
> even symlink support, let's delay its requirement at current stage ;-)

Please do not even engage into this, and keep in mind that the sole
purpose of this test program is to help developers simply add tests to
the set of existing ones. If the program becomes complex for doing stuff
that is out of its scope, it will become much harder to extend and users
will lose interest and motivation for updating it.

> one or both of them may also help the other test cases:
> 
> - chroot_exe (used '/init' before)
> 
>     CASE_TEST(chroot_exe);        EXPECT_SYSER(1, chroot(proc ? "/proc/self/exe" : exe), -1, ENOTDIR); break;
> 
> - chmod_exe (replace the one: chmod_tmpdir in another patchset)
> 
>     CASE_TEST(chmod_exe);       EXPECT_SYSZR(1, chmod(proc ? "/proc/self/exe" : exe, 0555)); break;
> 
>     It should be safe enough to only remove the writable attribute for the test
>     program.
> 
> - stat_timestamps (used '/init' before)
> 
>     if (stat("/proc/self/", &st) && stat(exe, &st) && stat("/dev/zero", &st) && stat("/", &st))

Indeed, why not!

> Will update the related patches with them.

OK thanks!
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
