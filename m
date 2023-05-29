Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7597C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tbXt3W2mk+0HR1bcshaMpcnR6EkYIyz0K1S6PgQgOno=; b=qEQNN0WJE18hb6
	KtGNU+EtAPf9Mhk9jpqSzQZhXoOcg7IXhg5NSwn3rIzxfSNhztUPpQbdpWxWUNuL+aQ+Ha/wPczeP
	G4lzip+VIaEeei/hPv8LilxoRr09REfWmewQ/FyJ/zRUInPuokQordRB48FJfQ870y0d4NGGR/NhA
	h3OHUXDW3nBuKGlarEN+qIQv3vb5G04GP6VgnRgkmwVWhtJGHPFZ0bbeXWhtHemU7LM9heMWg+RVX
	KSLV56IXBH0ULYTfCiRxiIsU1INhoKc93u8T0sJb997Ua815FaeLVXT5+thZf45N3BMtx+CgI/LEx
	Z68QU8G5D5CbBrmxbUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ioa-00BXdt-2P;
	Mon, 29 May 2023 19:46:00 +0000
Received: from bg4.exmail.qq.com ([43.154.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ioX-00BXcT-0n
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:45:59 +0000
X-QQ-mid: bizesmtp74t1685389534t2pmulyx
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:45:33 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: q+EIYT+FhZr5npvZn5RUSuCoEjlYjUFY7pH0vfKp8wnTF1d+eR9ArRWdMSotd
	gwHgiQyUkXUekZqHajk39a7kDlXuaLoJHlc/XWlniLk8SPET64nI2ROI+OY87xOMgRWwYXr
	NhzDgVTzfU1GpxKkbdJc9cdOIxbI+1rn1MYb+fdIPiEOgRvoZDPoUc9UdUuldIQe1xoP5j3
	bY40DDiCWS/ZwGdJ14peGqyZo6rIKEw+HxKEAwkXkF8TKA+Xn5174CPxllFTV03bNABvRj8
	3Z2IgCfIgLyo0n43JjOYK99rkJdRr421LHbHID1/Kfg9LepZ9LYCD8fs3g7KBi2/DnorgT/
	sg914fI0HQCCLj1Vu83jLXIfbtTnQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11560036856489134549
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 00/13] nolibc: add part2 of support for rv32
Date: Tue, 30 May 2023 03:45:23 +0800
Message-Id: <cover.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_124557_586950_AB330B36 
X-CRM114-Status: UNSURE (   8.41  )
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

Hi, all

Thanks very much for your review suggestions of the v1 series [1], we
just sent out the generic part1 [2], and here is the part2 of the whole
v2 revision.

Changes from v1 -> v2:

* Don't emulate the return values in the new syscalls path, fix up or
  support the new syscalls in the side of the related test cases (1-3)

  selftests/nolibc: remove gettimeofday_bad1/2 completely
  selftests/nolibc: support two errnos with EXPECT_SYSER2()
  selftests/nolibc: waitpid_min: add waitid syscall support

  (Review suggestions from Willy and Thomas)

* Fix up new failure of the state_timestamps test case (4, new)

  tools/nolibc: add missing nanoseconds support for __NR_statx

  (Fixes for the commit a89c937d781a ("tools/nolibc: support nanoseconds in stat()")

* Add new waitstatus macros as a standalone patch for the waitid support (5)

  tools/nolibc: add more wait status related types

  (Split and Cleanup for the waitid syscall based sys_wait4)

* Pure 64bit lseek and time64 select/poll/gettimeofday support (6-11)

  tools/nolibc: add pure 64bit off_t, time_t and blkcnt_t
  tools/nolibc: sys_lseek: add pure 64bit lseek
  tools/nolibc: add pure 64bit time structs
  tools/nolibc: sys_select: add pure 64bit select
  tools/nolibc: sys_poll: add pure 64bit poll
  tools/nolibc: sys_gettimeofday: add pure 64bit gettimeofday

  (Review suggestions from Arnd, Thomas and Willy, time32 variants have
   been removed completely and some fixups)

* waitid syscall support cleanup (12)

  tools/nolibc: sys_wait4: add waitid syscall support

  (Sync with the waitstatus macros update and Removal of emulated code)

* rv32 nolibc-test support, commit message update (13)

  selftests/nolibc: riscv: customize makefile for rv32

  (Review suggestions from Thomas, explain more about the change logic in commit message)

Best regards,
Zhangjin
---

[1]: https://lore.kernel.org/linux-riscv/20230529113143.GB2762@1wt.eu/T/#t
[2]: https://lore.kernel.org/linux-riscv/cover.1685362482.git.falcon@tinylab.org/

Zhangjin Wu (13):
  selftests/nolibc: remove gettimeofday_bad1/2 completely
  selftests/nolibc: support two errnos with EXPECT_SYSER2()
  selftests/nolibc: waitpid_min: add waitid syscall support
  tools/nolibc: add missing nanoseconds support for __NR_statx
  tools/nolibc: add more wait status related types
  tools/nolibc: add pure 64bit off_t, time_t and blkcnt_t
  tools/nolibc: sys_lseek: add pure 64bit lseek
  tools/nolibc: add pure 64bit time structs
  tools/nolibc: sys_select: add pure 64bit select
  tools/nolibc: sys_poll: add pure 64bit poll
  tools/nolibc: sys_gettimeofday: add pure 64bit gettimeofday
  tools/nolibc: sys_wait4: add waitid syscall support
  selftests/nolibc: riscv: customize makefile for rv32

 tools/include/nolibc/arch-aarch64.h          |   3 -
 tools/include/nolibc/arch-loongarch.h        |   3 -
 tools/include/nolibc/arch-riscv.h            |   3 -
 tools/include/nolibc/std.h                   |  28 ++--
 tools/include/nolibc/sys.h                   | 134 +++++++++++++++----
 tools/include/nolibc/types.h                 |  58 +++++++-
 tools/testing/selftests/nolibc/Makefile      |  11 +-
 tools/testing/selftests/nolibc/nolibc-test.c |  20 +--
 8 files changed, 202 insertions(+), 58 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
