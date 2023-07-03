Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7FFEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 06:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9QSA2v8fZR9dcVMY/hECNzREJdS3Ho6FcUghHOp9CM=; b=0ha0EMZXh2B+Uw
	uYakpZbDhW12akYBjM932LO6U7s1CkBk9FKWDTotofWc6WucM7afJVdlzVt7nL72TIQ/XptbuV6pj
	MWxCVVtcv/nxG+68okzy+kHbw3ANg/LP06NsN/9zt4Epme+pk0CYgfkqC/uNu8cbUeo4YKKtdPpce
	9uYYcUkgikGiAPZEfHAp3i9aAtraN6MKAh00foh80Ws2SKkiHmEMEHtVpI/njigI2bxkVsNNFfEkj
	KXnUEvMyZMxWOVWAF0bJVDXwYj+7iJKIyxHUYRvO5loRKWEYsAnRE2ORyMmR4xLxMdFRXDDWFHNK+
	BTbt3Rr7zfNDVH0ofmPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCfH-009PoD-00;
	Mon, 03 Jul 2023 06:03:59 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGCfD-009Pl1-1f
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 06:03:57 +0000
X-QQ-mid: bizesmtp68t1688364205t17ezhh7
Received: from linux-lab-host.localdomain ( [119.123.131.49])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Jul 2023 14:03:24 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: ZgHZPTZ8fzM2scasbR4KDNmzDJ57tOJaycJ/uri88ZY5e961v5sezP2d2eDKd
	3MdVLM6sDzieW/jVdp4RNJ3nRvnXbXxXbGuQPhrYGOS3e/iPaCcunS/dl8B8d0KuCs7Rsmd
	JI8jk7TEjFMrn0lSPIoSvYGnrMwVR9p1BoIABpJsWbowe1RNCD+wpl1I4PSJ4nRE/Oa3FQY
	HRG0QxFy7CrQlfKOlUOphW+aVbdrXa4K869Z8zz5tGD5nPCJrcaT8fWKqXoYo/lohCk/+tA
	D0NTEWTwXJpfmls1KsrvfSeqtvAfzFPbkZhkNBlzorNCEacgiiPis39vsCRU442licX8Ol2
	hGnzTZOUkila+j5Mho=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11292108538094942741
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
Date: Mon,  3 Jul 2023 14:03:23 +0800
Message-Id: <20230703060323.487347-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230702193306.GK16233@1wt.eu>
References: <20230702193306.GK16233@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230702_230355_894672_5A115B11 
X-CRM114-Status: GOOD (  25.12  )
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

> Hi Zhangjin,
> 
> On Wed, Jun 28, 2023 at 09:51:57PM +0800, Zhangjin Wu wrote:
> > Three mmap/munmap related test cases are added:
> > 
> > - mmap_bad: the length argument must be greater than 0, otherwise, fail
> >   with -EINVAL.
> > 
> > - munmap_bad: invalid (void *)-1 address fail with -EINVAL.
> > 
> > - mmap_munmap_good: mmap() a file with good offset and then munmap().
> > 
> > Note, it is not easy to find a unique file for mmap() in different
> > scenes, so, a file list is used to search the right one:
> > 
> > - /proc/1/exe, for 'run' and 'run-user' target
> >   'run-user' can not find '/proc/self/exe'
> > 
> > - /proc/self/exe, for 'libc-test' target
> >   normal program 'libc-test' has no permission to access '/proc/1/exe'
> 
> Strictly speaking, if your executable is not readable (e.g. chmod 111
> due to a restrictive umask) it will also fail that one.
>

ok.

> > - the others, for kernel without procfs
> >   let it pass even with 'worst case' kernel configs
> 
> You should include /dev/zero, which is commonly used to allocate anonymous
> memory and is more likely present and readable than any of the other files.
> And another file of choice is obviously argv[0] ;-)  In this case you don't
> need any of the other extra ones. Thus I could suggest that you try in this
> order:
> 
>     /dev/zero, /proc/self/exe, /proc/1/exe, argv[0]
> 
> and be done with it. That doesn't prevent one from extending the list if
> really needed later, but I doubt it would be needed. Also, it's already
> arranged in a read-write, then read-only fallbacks mode, so if we later
> need to add more complex tests involving writes, the writable /dev/zero
> will have precedence.
>

Cool, both /dev/zero and argv[0] are very good candidates ;-)

Just verified both of them, works perfectly.

- /dev/zero

  we need to mknod it in prepare() and also, in test_mmap_munmap(),
  stat() return a zero size of /dev/zero, in this case, we should assign
  a non-zero file_size ourselves.

    -       file_size = stat_buf.st_size;
    +       /* file size of the special /dev/zero is 0, let's assign one manually */
    +       if (i == 0)
    +               file_size = 3*page_size - 1;
    +       else
    +               file_size = stat_buf.st_size;


- argv[0]

  since nolibc has no realpath() currently, we can simply
  support the current path and the absolute path like this:

    nolibc-test.c:

    /* assigned as argv[0] in main(), will be used by some tests */
    static char exe[PATH_MAX + 1];

    main():

    /* get absolute path of myself, nolibc has no realpath() currently */
    #ifndef NOLIBC
            realpath(argv[0], exe);
    #else
            /* assume absolute path has no "./" */
            if (strncmp(argv[0], "./", 2) != 0)
                    strncat(exe, argv[0], strlen(argv[0]) + 1);
            else {
                    pwd = getenv("PWD");
                    /* skip the ending '\0' */
                    strncat(exe, getenv("PWD"), strlen(pwd));
                    /* skip the first '.' */
                    strncat(exe, argv[0] + 1, strlen(argv[0]));
            }
    #endif

A full functional realpath() is a little complex, such as '../' support and
even symlink support, let's delay its requirement at current stage ;-)

one or both of them may also help the other test cases:

- chroot_exe (used '/init' before)

    CASE_TEST(chroot_exe);        EXPECT_SYSER(1, chroot(proc ? "/proc/self/exe" : exe), -1, ENOTDIR); break;

- chmod_exe (replace the one: chmod_tmpdir in another patchset)

    CASE_TEST(chmod_exe);       EXPECT_SYSZR(1, chmod(proc ? "/proc/self/exe" : exe, 0555)); break;

    It should be safe enough to only remove the writable attribute for the test
    program.

- stat_timestamps (used '/init' before)

    if (stat("/proc/self/", &st) && stat(exe, &st) && stat("/dev/zero", &st) && stat("/", &st))

Will update the related patches with them.

Thanks,
Zhangjin

> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
