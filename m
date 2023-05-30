Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3FEC77B73
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 10:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sLP2qyIF8cA0HNEhhQvimBfWAOvz6dlCuDC+BRDaomg=; b=HnhLJB7zETHlzF
	dUrgwAdIs7TCI72Shz/JC7jXsurbME8AYeGVXpHdVphNOKncHkCLdJfs9dtpSofi5pqlf8vn4nl7M
	FuINdsBqyx2jp+KUiTWL99Xy8wHaOroa7facj0INWoGLWinj9r/PuXbTW3MBtthLmDcCdRgBVvuP+
	ecIB9VBuWnqHbQFpJbe5ae0TPbazXXMLY2WhTELHACqp7HGbYViXQMP8HRtnlJq86yAhesU7U2mie
	uyj8U+VKLGLG09RazhGHPCuh8TakVtcQoC+X54+Z5ZITgY48WfuXU5QZkr5fytgzYH4dDy7/3RxOc
	hFMj3Eoo0tNjx4BuqbmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wtV-00DR2j-1Z;
	Tue, 30 May 2023 10:48:01 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wtR-00DQyj-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 10:48:00 +0000
X-QQ-mid: bizesmtp68t1685443664twnpak60
Received: from linux-lab-host.localdomain ( [119.123.130.226])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 18:47:43 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: C46Rb8GPIEfLZaiD+Tj2Qw68S6CmHsgj7w+vsvgLRgBtK+77c1nm1Y+dZQciE
	yMI6X0Dlof9TqnGRL08Kb5tY/A2buyMdyGThpzwm1QqEHoKx4+PP5RZVSQGL6e09Ea2ij32
	pPlQiDnGe+eyZW3rXAOllns96irDaF1DQpNSoiDmefKR8ZO5cCnENDJLPXotANFNbd81R+Y
	MiTH03hSIMCL7dPxdORkEpZqOKy7IzSF54yu/EZozLuPdDxiZXEZkCLD9UtK56W3I2zckfd
	HIY0mB8eeNxgNNPDkUCYIK9Awd6LZ1jompcNnI9riAwkgLIieRr3LCP0yt7i4pzAAoUxlcU
	4jPq803VQxMD7rewyydupUZpW5wDtbxi7hA247/bsd/DPeXpc4lyUaSL+QCT5H2ADuk79yh
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14120017678416040009
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH 0/4] selftests/nolibc: add user-space 'efault' handler
Date: Tue, 30 May 2023 18:47:38 +0800
Message-Id: <cover.1685443199.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_034757_514231_8A00394B 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
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

Hi, Willy, Thomas

This is not really for merge, but only let it work as a demo code to
test whether it is possible to restore the next test when there is a bad
pointer access in user-space [1].

Besides, a new 'run' command is added to 'NOLIBC_TEST' environment
variable or arguments to control the running iterations, this may be
used to test the reentrancy issues, but no failures found currently ;-)

With glibc, it works as following:

    $ ./nolibc-test run:2,syscall:28-30,stdlib:1
    Running iteration(s): 2

    Current iteration: 1

    Running test 'syscall', from 28 to 30
    28 dup3_m1 = -1 EBADF                                            [OK]
    29 efault_handler ! 11 SIGSEGV                                   [OK]
    30 execve_root = -1 EACCES                                       [OK]
    Errors during this test: 0

    Running test 'stdlib'
    1 getenv_blah = <(null)>                                         [OK]
    Errors during this test: 0

    Total number of errors in the 1 iteration(s): 0

    Current iteration: 2

    Running test 'syscall'
    28 dup3_m1 = -1 EBADF                                            [OK]
    29 efault_handler ! 11 SIGSEGV                                   [OK]
    30 execve_root = -1 EACCES                                       [OK]
    Errors during this test: 0

    Running test 'stdlib'
    1 getenv_blah = <(null)>                                         [OK]
    Errors during this test: 0

    Total number of errors in the 2 iteration(s): 0

With nolibc, it will be skipped (run:2,syscall:28-30,stdlib:10):

    Running iteration(s): 2

    Current iteration: 1

    Running test 'syscall', from 28 to 30
    28 dup3_m1 = -1 EBADF                                            [OK]
    29 efault_handler                                               [SKIPPED]
    30 execve_root = -1 EACCES                                       [OK]
    Errors during this test: 0

    Running test 'stdlib', from 10 to 10
    10 strrchr_foobar_o = <obar>                                     [OK]
    Errors during this test: 0

    Total number of errors in the 1 iteration(s): 0

    Current iteration: 2

    Running test 'syscall', from 28 to 30
    28 dup3_m1 = -1 EBADF                                            [OK]
    29 efault_handler                                               [SKIPPED]
    30 execve_root = -1 EACCES                                       [OK]
    Errors during this test: 0

    Running test 'stdlib', from 10 to 10
    10 strrchr_foobar_o = <obar>                                     [OK]
    Errors during this test: 0

    Total number of errors in the 2 iteration(s): 0

Best regards,
Zhangjin
---

[1]: https://lore.kernel.org/linux-riscv/20230529113143.GB2762@1wt.eu/ 

Zhangjin Wu (4):
  selftests/nolibc: allow rerun with the same settings
  selftests/nolibc: add rerun support
  selftests/nolibc: add user space efault handler
  selftests/nolibc: add user-space efault restore test case

 tools/testing/selftests/nolibc/nolibc-test.c | 247 +++++++++++++++++--
 1 file changed, 221 insertions(+), 26 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
