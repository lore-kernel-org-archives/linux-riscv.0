Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE27EEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 09:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+MFvdzCYkdRxD0+d7YjSveOwc/fn9paSM2vZcI51ExQ=; b=g0Vd0hXGc26xb6
	4SRfHj5LrEhlhf97rEh2Gfpuw25faPpd4nVvjkAIMjKqgeqC/mIimb+DwPtd0qFkNJnCzCGBkP72W
	gmWM4Dvy7cr9lLCEIA9ljXFlhZA3GrkpORVRN+aZQ8IxPAiDQgBSpe4hllVskZAgA2PSoOMcNQRbY
	B6BVncsn+5MaI0HAUF3LI1NRppFZdNW+zy2KOU5mvkz81IBEy0PjqvDWCieTeM5M7K2wk2IY7aipv
	PXzKN6+2/Fd0lT3aejcZEHbMSaQ1nH3/IBZAo31C1VAqtLBXKNnhIcx7VE3N4Y28bWp+fHBgXcIQ3
	Cgin0eJ4DB2w5wAx1ASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGIP-00A274-0S;
	Mon, 03 Jul 2023 09:56:37 +0000
Received: from ded1.1wt.eu ([163.172.96.212] helo=1wt.eu)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGIM-00A26C-01
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 09:56:36 +0000
Received: (from willy@localhost)
	by mail.home.local (8.17.1/8.17.1/Submit) id 3639uRd9023860;
	Mon, 3 Jul 2023 11:56:27 +0200
Date: Mon, 3 Jul 2023 11:56:27 +0200
From: Willy Tarreau <w@1wt.eu>
To: Zhangjin Wu <falcon@tinylab.org>
Cc: arnd@arndb.de, david.laight@aculab.com, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux@weissschuh.net, thomas@t-8ch.de
Subject: Re: [PATCH v5 14/14] selftests/nolibc: add mmap and munmap test cases
Message-ID: <ZKKbS3cwKcHgnGwu@1wt.eu>
References: <ZKJ35DyPOG+LAy5j@1wt.eu>
 <20230703080647.491363-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230703080647.491363-1-falcon@tinylab.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_025634_486670_43D70DCB 
X-CRM114-Status: GOOD (  22.62  )
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

On Mon, Jul 03, 2023 at 04:06:47PM +0800, Zhangjin Wu wrote:
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

Then we have a problem somewhere else and the test should be debugger
instead. Are you sure there isn't a successful chdir() test before it
for example, that would change the directory ? If so maybe we just need
to save the current dir before calling it and restore it later.

> I removed the "proc ?" check manually to test if it also work with
> CONFIG_PROC_FS=n. it doesn't work, without absolute path, we need to add
> the ENOENT errno back to the errno check list.

Same as above.

> I'm not sure if the other syscalls require an absolute path, so, the
> realpath() is called in this proposed method.

No, please do not overengineer tests. That's only hiding the dust under
the carpet and people adding more tests later that will randomly fail
will have a very hard time trying to figure what's happening under the
hood. If a test doesn't work as expected, we must not try to work around
it, but arrange to fix it.

Thanks,
Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
