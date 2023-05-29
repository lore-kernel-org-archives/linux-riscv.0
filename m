Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEACBC7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 12:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VgQlsCsZenuEvpywhkEOECwe99d2garFLPPgWp0vRl4=; b=2TLaBqdHBN6Nrj
	BI6LT3Sxgu5i+QIdGOBNr+cIQFezTdsXmZQb0vJ2R/Tso4uGR5mJESZw4L7IQV5GZDVf5x8EpOxOd
	HYyfGJCFwRGjKBnH4Khgm0dThj+4kc3YAMNyTDc6Vqt6bBCwTUlAazqj99D4HNWsbAKRLQVGzVDm4
	axtN+yJBBN9LRX7vgviepLcBsXD19+owPhU+YZKo0D2VOfZsxXEqH8Q/jdzJuMJUAO4N3YMGYpZ8a
	fAMWo9hi3TGdeP6C+mIv1PxIbhbVHO2CKMCBc6NhGZe7uPOtLEJ1J+uRlEepOXZFBvHoFPZ4/cq8I
	pHlxevWy3h0bTLOVU1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cN1-00AUt5-0w;
	Mon, 29 May 2023 12:53:07 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3cMx-00AUqI-2z
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 12:53:05 +0000
X-QQ-mid: bizesmtp87t1685364752tbqd3nqk
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 May 2023 20:52:31 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: OtIeQkg1QQGBD0iLBToup91HWAyjlJVY4fLjrHRj7q8MuyQZoj33NImKcbBeW
	p9vltkf7/0x2zbr4+mAilzBanNznpBNtFIuFw0H1F2pL4EG2JiS9QHW+fvR2lzuKpU30WVE
	WH+RQJj+PFCq21EloybALD0VUiXVMilk+fQlL9XuebAJl8nt/pKkYYzrpU2Ma5AUZ0hRDAQ
	L78DyIuAVd2XnluRAE1GEvz8DeLa9HtBJpaTn90pq2+hMK3W8dgtNRElM69OKWJtdrDLiJG
	iWj2m+ixqt7Zi5gn5PAAADGr9EEthMhTEf8zWR0fcouVnPppFlqvkPrPw9+EWSgroYt+6AT
	4jmwCtoHH7LOqxjQ5k42+Bsc5tmVCBcMc6gHPdTdCJKUxAaSqkJyxRLgWHGzw==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12237914147384625680
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 0/7] nolibc: add generic part1 of prepare for rv32
Date: Mon, 29 May 2023 20:52:24 +0800
Message-Id: <cover.1685362482.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_055304_284334_91ADFE3A 
X-CRM114-Status: UNSURE (   8.43  )
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

Hi, All

Thanks very much for your review suggestions of the v1 series [1], this
is the generic part1 of the v2 revison.

* selftests/nolibc: syscall_args: use generic __NR_statx

    A more generic statx is used instead of fstat

    (Review suggestions from Willy, Arnd)

* selftests/nolibc: allow specify extra arguments for qemu

    Besides BIOS, QEMU_ARGS_EXTRA is better for more requirements

    (Review suggestions from Thomas, Willy)

* selftests/nolibc: fix up compile warning with glibc on x86_64

    Definition of uint64_t differs from glibc and nolibc, use the right
    print format here

* selftests/nolibc: not include limits.h for nolibc

    Remove the requirement of limits.h for nolibc can let us use older
    glibc for rv32

    (Review suggestions from thomas)

* selftests/nolibc: use INT_MAX instead of __INT_MAX__

    A trivial cleanup, based on the previous patch

* tools/nolibc: arm: add missing my_syscall6

    Required by future forced pselect6/pselect6_time64, tested on arm/vexpress-a9

    (Review suggestions from Arnd)

* tools/nolibc: open: fix up compile warning for arm

    A trivial fixup based on compiler's suggestion and glibc code

Best regards,
Zhangjin

----
[1]: https://lore.kernel.org/linux-riscv/20230529113143.GB2762@1wt.eu/T/#t

Zhangjin Wu (7):
  selftests/nolibc: syscall_args: use __NR_statx for rv32
  selftests/nolibc: allow specify extra arguments for qemu
  selftests/nolibc: fix up compile warning with glibc on x86_64
  selftests/nolibc: not include limits.h for nolibc
  selftests/nolibc: use INT_MAX instead of __INT_MAX__
  tools/nolibc: arm: add missing my_syscall6
  tools/nolibc: open: fix up compile warning for arm

 tools/include/nolibc/arch-arm.h              | 23 ++++++++++++++++++++
 tools/include/nolibc/stdint.h                | 14 ++++++++++++
 tools/include/nolibc/sys.h                   |  2 +-
 tools/testing/selftests/nolibc/Makefile      |  2 +-
 tools/testing/selftests/nolibc/nolibc-test.c | 14 +++++++-----
 5 files changed, 47 insertions(+), 8 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
