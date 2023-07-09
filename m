Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BE4EB64DC
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a7P8GVVpqjNh7FXQue/zyvzEsE2OGYA17959dacEbRo=; b=OrVdIyeqRVwIII
	0h/7sBxg+4KEBgU738PboMjWw1UnP34ktV5pgSEiW6F1lIBQiqEuLnRg8mp1vdNAEHX/kIM0VZyeO
	k2BMmgwioox267FkKZR9BpoJg2IAmQnq5s1w+hCmD5dbPIIR1mODvcoYCqfMZSzQaQDmr7l53TtGl
	yuNMis00cD4jL7+/i9SXeGRiT2jLMU2RY61TazWsJecPBpxy786urXkIT3edXmPsB2BGI68OZgHGE
	js7OFmZFzjse86hJ9+UXh5FcnpY4/ixX1ogPSDqWqhBE7H+LP636RqKfA5tgzF1M1q6PQZHbYa7Fb
	YHOhzTz/61xWl4SkqIog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIZES-009ZXs-31;
	Sun, 09 Jul 2023 18:34:04 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIZEM-009ZUO-2M
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 18:34:01 +0000
X-QQ-mid: bizesmtp62t1688927603tclsk3kn
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Jul 2023 02:33:22 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: FCwU1VixZy9c9Sh7mKzbIInPmpaFf5dRU/cduiTKcBYHZo6BQDkVsomfwpohQ
	O5XocE0E67aRtZ7OORO3AAgJRZohbgOhUFxCytVpRHWs7OgO6PEWZDxSyGmNm6x7Y3Xb++t
	ZRjLpCQVB90bHS5bbETtpkuTCrBYz7T9SvRx+CM9oEOLwZV5m3GIl98Y10Y7iDmG7c+0w+u
	utJRuK3L9dmaSIOLug5AQpGH+ZJPtsEaVg6clKnaXGRThvZa958rx8RSOy/I5gF+n5pFhvd
	qYKgOwABgrH62IPVmzpOivvjbfZst1Cb/qvXexpMl2eUkQVKR68CFSQFP6oeOqCOIWmlekV
	o/WjJaVnEZoJ1LIXwo=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11853465242003201255
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	david.laight@aculab.com,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: Re: [PATCH v6 13/15] selftests/nolibc: add mmap_bad test case
Date: Mon, 10 Jul 2023 02:33:22 +0800
Message-Id: <20230709183322.96859-1-falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230709091547.GD9321@1wt.eu>
References: <20230709091547.GD9321@1wt.eu>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_113359_109117_4C7C60BF 
X-CRM114-Status: GOOD (  17.27  )
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

> On Fri, Jul 07, 2023 at 11:05:49PM +0800, Zhangjin Wu wrote:
> > The length argument of mmap() must be greater than 0, passing a zero
> > length argument expects failure with -EINVAL.
> 
> This one doesn't work for me on x86_64 kernel 5.15.112, qemu userland:
> 
>   46 mmap_bad = <0x0> EEXIST  != (<0xffffffffffffffff> EINVAL)    [FAIL]
>

Just rerun 'run-user' on x86_64 with kernel 5.11.0-41-generic, it is ok.

The failure is very interesting, and also rechecked the kernel mmap code:

    unsigned long do_mmap(struct file *file, unsigned long addr,
                        unsigned long len, unsigned long prot,
                        unsigned long flags, unsigned long pgoff,
                        unsigned long *populate, struct list_head *uf)
    {
        ...
        if (!len)
                return -EINVAL; 
        ...
    }

    $ git blame -L 1202,1202 mm/mmap.c
    e37609bb36f70 (Piotr Kwapulinski 2015-06-24 16:58:39 -0700 1202)        if (!len)

    $ git show e37609bb36f706c954e82e580e2e790e9d5caef8:Makefile 
    VERSION = 4
    PATCHLEVEL = 1
    SUBLEVEL = 0
    EXTRAVERSION =

So, the kernel side should be ok from v4.1?

For qemu-user, I have rechecked the following version:

    $ qemu-x86_64 --version
    qemu-x86_64 version 4.2.1 (Debian 1:4.2-3ubuntu6.18)

    $ qemu-x86_64 --version
    qemu-x86_64 version 7.0.0 (Debian 1:7.0+dfsg-7ubuntu2.6~backport20.04.202306190332~ubuntu20.04.1)

    $ build/x86_64/pc/qemu/v8.0.2/qemu-x86_64 --version
    qemu-x86_64 version 8.0.2 (v8.0.2-dirty)

all of them work well, as a comparison, what's your qemu-user version?

> This EEXIST actually is the errno from the previous test. If I run
> the test natively it's OK:
> 
>   $ ./nolibc-test syscall:46
>   Running test 'syscall'
>   46 mmap_bad = <0xffffffffffffffff> EINVAL                        [OK]
>   Errors during this test: 0
> 
> I'll queue it anyway for now but it would be nice that we figure what's
> happening (even if we need to adjust or drop the test if it's a false
> positive) so that we don't get used to "ah this is a normal error".
>

Yes, if there is a failure, we should figure out why. It is ok for me to remove
this one or let's find another errno condition before we find the root cause of
the reported failure. 

Thanks,
Zhangjin
 
> Willy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
