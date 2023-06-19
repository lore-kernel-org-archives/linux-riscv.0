Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BC3EB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7kjw8SefXvSaG0zsjU+6V3I1qQuyhMO8++gAHuoIE8E=; b=jSBr8I7kqGgVGN
	j6PnQnxUraO/6JfyWFSP7QjfFdNb0nhxwK4L72BL7OJltGwcRcyAjStczZomgePONM3L/OkYgvq3w
	N2yvk0d0vOfZYhqrHixFfNlk3eo5VZ6DgCjCrCpUDrVnPYmpWKHVZz0Ri0y2FCmbHIvWfK0BdtY7N
	J7Mw6btq9b4Wzr48582yU7MkeVJn6zi4ChEwnjX2aiuTKg9z2SunBrCPqmgXeVmXyCW/CdGvweN0f
	w1ofgfLYnKzrTuBNEf1ZAfUV24nNTzljgSOc5585pYoKl5iQPvUP+CwIfl+FSMARv9ySvlfz6ayoZ
	/JzvYsn5kTRwKF55pm3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBGzi-008nly-2c;
	Mon, 19 Jun 2023 15:40:42 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBGzf-008nkT-0Q
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 15:40:42 +0000
X-QQ-mid: bizesmtp74t1687189213tv6onhfr
Received: from linux-lab-host.localdomain ( [116.30.126.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 19 Jun 2023 23:40:12 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: vLOCICHxEeCdPu6sxmPtsZK2JR41RQr69IIe96Zy/WgX2mbiQUxlN61O1ndW5
	UXzJ/B3lyJL6i/R4h2zRfxILs4UT4iZK/xKxFXfZAStwRkWnCA54CN1R+h240f1a7vUDO3/
	vMoRBnTqis9myq4zdL+BbIlnDjNPZ962VZv3wXbhNiRgYZI2w3Dj/SdjGuNHQO3j1f6zjKM
	UZTSf39u/FPW9KwavQfUU+v5KDVtC11x9oecSsl8y8FJPAOhzbc0MbKcryZKBLiVLdItFmA
	aUj65E8V8cq0Uv3Npj72F0SD/lHFd0Ewb7iBcLfUmCR1xMxTG+vhiFhjqf20Jl7rfolA9lw
	PeOBTP07LE3SqrAjWC6NlCkB2M4sTqroI+QAmozZOxeapmlPnk=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11779720520343571934
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: david.laight@aculab.com,
	arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v4 00/10] tools/nolibc: add a new syscall helper
Date: Mon, 19 Jun 2023 23:40:10 +0800
Message-Id: <cover.1687187451.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_084039_467632_AEB10B86 
X-CRM114-Status: GOOD (  10.05  )
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

Hi, Thomas, David, Willy

Thanks very much for your kindly review.

This is the revision of v3 "tools/nolibc: add a new syscall helper" [1],
this mainly applies the suggestion from David in this reply [2] and
rebased everything on the dev.2023.06.14a branch of linux-rcu [3].

The old __sysret() doesn't support the syscalls with pointer return
value, this revision now supports such syscalls. The left mmap() syscall
is converted to use this new __sysret() with additional test cases.

Changes from v3 -> v4:

* tools/nolibc: sys.h: add a syscall return helper
  tools/nolibc: unistd.h: apply __sysret() helper
  tools/nolibc: sys.h: apply __sysret() helper

  The original v3 series, no code change, except the Reviewed-by lines
  from Thomas.

* tools/nolibc: unistd.h: reorder the syscall macros

  reorder the syscall macros in using order and align most of them.

* tools/nolibc: add missing my_syscall6() for mips

  required by mmap() syscall, this is the last missing my_syscall6().

* tools/nolibc: __sysret: support syscalls who return a pointer

  Apply suggestion from David.  

  Let __sysret() also supports syscalls with pointer return value, so, the
  return value is converted to unsigned long and the comparing of < 0 is
  converted to the comparing of [(unsigned long)-MAX_ERRNO, (unsigned long)-1].

  This also allows return a huge value (not pointer) with highest bit as 1.

  It is able to merge this one to the first one if necessary.

* tools/nolibc: clean up mmap() support

  Apply new __sysret(), clean up #ifdef and some macros.

* selftests/nolibc: add EXPECT_PTREQ, EXPECT_PTRNE and EXPECT_PTRER
  selftests/nolibc: add sbrk_0 to test current brk getting
  selftests/nolibc: add mmap and munmap test cases

  Add some mmap & munmap test cases and the corresponding helpers, to
  verify one of the new helpers, a sbrk_0 test case is also added.

Best regards,
Zhangjin
---
[1]: https://lore.kernel.org/linux-riscv/87e7a391-b97b-4001-b12a-76d20790563e@t-8ch.de/
[2]: https://lore.kernel.org/linux-riscv/94dd5170929f454fbc0a10a2eb3b108d@AcuMS.aculab.com/
[3]: https://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git/

Zhangjin Wu (10):
  tools/nolibc: sys.h: add a syscall return helper
  tools/nolibc: unistd.h: apply __sysret() helper
  tools/nolibc: sys.h: apply __sysret() helper
  tools/nolibc: unistd.h: reorder the syscall macros
  tools/nolibc: add missing my_syscall6() for mips
  tools/nolibc: __sysret: support syscalls who return a pointer
  tools/nolibc: clean up mmap() support
  selftests/nolibc: add EXPECT_PTREQ, EXPECT_PTRNE and EXPECT_PTRER
  selftests/nolibc: add sbrk_0 to test current brk getting
  selftests/nolibc: add mmap and munmap test cases

 tools/include/nolibc/arch-mips.h             |  26 ++
 tools/include/nolibc/nolibc.h                |   9 +-
 tools/include/nolibc/sys.h                   | 391 +++----------------
 tools/include/nolibc/types.h                 |  11 +
 tools/include/nolibc/unistd.h                |  13 +-
 tools/testing/selftests/nolibc/nolibc-test.c |  90 +++++
 6 files changed, 191 insertions(+), 349 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
