Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D69EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 08:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I07HKKEr9lRt/3LOp5DgKMDgCR/tQfz8IWzzCNfDQ8M=; b=XCGOPEf5+YZ2nO
	UTYNeZxZSIjv1Si1CW4RGWfzzXzNbNU1LlZrKDCCONaScBqbSiJ6Kjpj1QuG/gjPja7El7PwhQpKM
	oh9DVYKXj2kKGDOZja2+44+WlRM7YLC4OlSSQA1cX+zEP1S5LGvg10lddg2h7BYeZl7nTX7Nr6nDw
	JXR5GWxQ6j0lWTycms+5HXGwsxlIL2GdJpsa0VooiMoNBLBJFy7D6VrVTq2HOsb2umRiQHfff8vxj
	5jRjz7FiSyCav1COt3mgkVjen5mG5MJeuCxbVIlU9DNQR2NjIbx+713Pc/VF3PVvOWBD/xQJBbycq
	ZLLZ+IpPEsvIjuc4CA1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEak-009hHy-2c;
	Mon, 03 Jul 2023 08:07:26 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGEag-009hGI-1r
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 08:07:25 +0000
X-QQ-mid: bizesmtp65t1688371613txz6f5uw
Received: from linux-lab-host.localdomain ( [119.123.131.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Jul 2023 16:06:52 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: C46Rb8GPIEdHxAFCE3BvkSlNOAIZKwGCuo6b9oMnIg2+3RsnASJ4Odgdn480K
	D9O/zHQs9+SI0waAap24x1DtHFT1YhLFoXm+IHocqEYwW6JswgvloZwfQAJN6UsHkvyaP9x
	QyBfBnAjQS8LVnCs302OFPUOYjidAiN/QvVkBaZGWrOwLLOZotAu8RmowxqfgV/oY7Kp6Rx
	q2GZuLW+0aFiIafX5uuKHRaz+7efPvRT8FTu1WQZrCDywPojQ0HrrqkoL49Q1GenSQ+3x14
	g/7TqCVqZOHLLlXzTLGfS0VAr0TFd7f+RwSYEOw4TIw4AtYEt2zSett+Kx0g+o/bTv4XZtb
	qQevDcOllpzai0lcp+5UgkPNFxGHTFnhRL6r+g56jEEFEc4T7w=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 351077419301285196
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	david.laight@aculab.com,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@weissschuh.net,
	thomas@t-8ch.de
Subject: Re: [PATCH v5 14/14] selftests/nolibc: add mmap and munmap test cases
Date: Mon,  3 Jul 2023 16:06:47 +0800
Message-Id: <20230703080647.491363-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <ZKJ35DyPOG+LAy5j@1wt.eu>
References: <ZKJ35DyPOG+LAy5j@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_010722_929201_D7AF44CA 
X-CRM114-Status: GOOD (  41.94  )
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

Hi, Willy

> On Mon, Jul 03, 2023 at 02:03:23PM +0800, Zhangjin Wu wrote:
> > > > - the others, for kernel without procfs
> > > >   let it pass even with 'worst case' kernel configs
> > > 
> > > You should include /dev/zero, which is commonly used to allocate anonymous
> > > memory and is more likely present and readable than any of the other files.
> > > And another file of choice is obviously argv[0] ;-)  In this case you don't
> > > need any of the other extra ones. Thus I could suggest that you try in this
> > > order:
> > > 
> > >     /dev/zero, /proc/self/exe, /proc/1/exe, argv[0]
> > > 
> > > and be done with it. That doesn't prevent one from extending the list if
> > > really needed later, but I doubt it would be needed. Also, it's already
> > > arranged in a read-write, then read-only fallbacks mode, so if we later
> > > need to add more complex tests involving writes, the writable /dev/zero
> > > will have precedence.
> > >
> > 
> > Cool, both /dev/zero and argv[0] are very good candidates ;-)
> > 
> > Just verified both of them, works perfectly.
> > 
> > - /dev/zero
> > 
> >   we need to mknod it in prepare()
> 
> Indeed.
> 
> >   and also, in test_mmap_munmap(),
> >   stat() return a zero size of /dev/zero, in this case, we should assign
> >   a non-zero file_size ourselves.
> > 
> >     -       file_size = stat_buf.st_size;
> >     +       /* file size of the special /dev/zero is 0, let's assign one manually */
> >     +       if (i == 0)
> >     +               file_size = 3*page_size - 1;
> >     +       else
> >     +               file_size = stat_buf.st_size;
> 
> OK but why this -1 ? That doesn't sound right, unless you explicitly want
> a file size that's not multiple of a page size for whatever reason ?
>

Just make sure the file size is a litle random, not just aligned with
PAGE_SIZE, it is ok without '-1' ;-)

> > - argv[0]
> > 
> >   since nolibc has no realpath() currently, we can simply
> >   support the current path and the absolute path like this:
> > 
> >     nolibc-test.c:
> > 
> >     /* assigned as argv[0] in main(), will be used by some tests */
> >     static char exe[PATH_MAX + 1];
> > 
> >     main():
> > 
> >     /* get absolute path of myself, nolibc has no realpath() currently */
> >     #ifndef NOLIBC
> >             realpath(argv[0], exe);
> >     #else
> >             /* assume absolute path has no "./" */
> >             if (strncmp(argv[0], "./", 2) != 0)
> >                     strncat(exe, argv[0], strlen(argv[0]) + 1);
> >             else {
> >                     pwd = getenv("PWD");
> >                     /* skip the ending '\0' */
> >                     strncat(exe, getenv("PWD"), strlen(pwd));
> >                     /* skip the first '.' */
> >                     strncat(exe, argv[0] + 1, strlen(argv[0]));
> >             }
> >     #endif
> 
> No, please, not like this. Just copy argv[0] (the pointer not the
> contents) and you're fine:
>
>     static const char *argv0;
> 
>     int main(int argc, char **argv, char **envp)
>     {
>             argv0 = argv[0];
>             ...
>     }
> 
> Nothing more, nothing less. Your program will always have its correct
> path when being called unless someone purposely forces it to something
> different, which is not our concern at all since this is a test program.
> And I'd rather call it "argv0" which exactly tells us what it contains
> than "exe" which can be misleading for that precise reason.
>

Yeah, locally, I just used a global argv0 pointer directly, but
chroot_exe("./nolibc-test") not work when run 'libc-test' in host
system, that is why I tried to get an absolute path ;-)

    CASE_TEST(chroot_exe);        EXPECT_SYSER(1, chroot(exe), -1, ENOTDIR); break;

    -->

    19 chroot_exe = -1 ENOENT  != (-1 ENOTDIR)                      [FAIL]

I removed the "proc ?" check manually to test if it also work with
CONFIG_PROC_FS=n. it doesn't work, without absolute path, we need to add
the ENOENT errno back to the errno check list.

I'm not sure if the other syscalls require an absolute path, so, the
realpath() is called in this proposed method.

> > A full functional realpath() is a little complex, such as '../' support and
> > even symlink support, let's delay its requirement at current stage ;-)
> 
> Please do not even engage into this, and keep in mind that the sole
> purpose of this test program is to help developers simply add tests to
> the set of existing ones. If the program becomes complex for doing stuff
> that is out of its scope, it will become much harder to extend and users
> will lose interest and motivation for updating it.
> 
> > one or both of them may also help the other test cases:
> > 
> > - chroot_exe (used '/init' before)
> > 
> >     CASE_TEST(chroot_exe);        EXPECT_SYSER(1, chroot(proc ? "/proc/self/exe" : exe), -1, ENOTDIR); break;
> > 
> > - chmod_exe (replace the one: chmod_tmpdir in another patchset)
> > 
> >     CASE_TEST(chmod_exe);       EXPECT_SYSZR(1, chmod(proc ? "/proc/self/exe" : exe, 0555)); break;
> > 
> >     It should be safe enough to only remove the writable attribute for the test
> >     program.
> > 
> > - stat_timestamps (used '/init' before)
> > 
> >     if (stat("/proc/self/", &st) && stat(exe, &st) && stat("/dev/zero", &st) && stat("/", &st))
> 
> Indeed, why not!
>

Ok, without absolute path, the chroot_exe() will be changed back to
something like this:

    CASE_TEST(chroot_exe);        EXPECT_SYSER2(1, chroot(proc ? "/proc/self/exe" : argv0), -1, ENOTDIR, ENOENT); break;

Best regards,
Zhangjin

> > Will update the related patches with them.
> 
> OK thanks!
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
