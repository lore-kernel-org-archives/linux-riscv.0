Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC30EB64D9
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jul 2023 14:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3XPWy8q3EXN+xyTncdUfLoWfhcG70RQJJonEG0nLUOk=; b=fzhbFmkddOKE4k
	Vy+FJS2R3oMKpWARe73wkc44J/QXOaVLmTnraigqSov5dMJL0CzvHNpdEZRS1+q8Od/ZflA02kmor
	y+/gKueYLO2+Z/227eFCIAUx2xShJCZ+H1kY0vfcqNacTtA08niwatZ0QInMv8N5d6iUQvKMOEMpM
	0ePm4L/RtcPiPlmFIwux7lsgTMIJJUTZFvL52rWGF0sfFMdip7RZo5H2ZQbZDCj4yB4X3EFu831vQ
	aQ5PAeMpUv+cSCy51eFOfhm88x7LaPG8gYizUkf/W/qKqxk56jK3xPHrLxhUNFpz4XnvnHECMsSeK
	637o1vmQN4YLj3OHLw0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmmi-004vM2-39;
	Fri, 07 Jul 2023 14:50:12 +0000
Received: from bg4.exmail.qq.com ([43.154.221.58])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHmme-004vIt-0j
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jul 2023 14:50:12 +0000
X-QQ-mid: bizesmtp62t1688741371t0rnd6is
Received: from linux-lab-host.localdomain ( [116.30.131.119])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Jul 2023 22:49:30 +0800 (CST)
X-QQ-SSF: 01200000000000D0W000000A0000000
X-QQ-FEAT: eSZ1CZgv+JAwAJkI8FYXTx4ksYAsemeAQTurvaB6LTavwvYKFyY/Q79bZX+kf
	WcNSonHl3f9YliNF/p7RBbIDaK75z3f+4qrd0b+0OBLnva8vPUhNeRNnee4NfEhL+cxq+YQ
	25mAxnyygTMo30Dyk+EnVDgjSKMOx3AkoroCL+0CqCcWhzw85ptYmYeUKI38KMRgvHUnU42
	mX71XcxAHe8FTeQnY+Y4fVuLq2ldsicok6K54xDltfdkVvosSh2ZgTkgJfYSkO2m6eZd7Qh
	CymWenTCKhqpXgNOAVoOPyp1blHJrVLsUFMC+0kQkU20r6LO1Z2Ggr4TP87hftH3Ea5vhi/
	dE6ibEMZ+0Ei2TkfutYXCzGX9ORDg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14084673947367091734
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v6 00/15] tools/nolibc: add a new syscall helper
Date: Fri,  7 Jul 2023 22:49:28 +0800
Message-Id: <cover.1688739492.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230707_075008_608190_139AB8ED 
X-CRM114-Status: GOOD (  10.11  )
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

Here is the v6 of the __sysret series [1], applies your suggestions.
additionally, the sbrk() also uses the __sysret helper.

These patches are tested (together with the coming v4 selftests/nolibc
patches) for all of the supported architectures:

           arch/board | result
          ------------|------------
      arm/vexpress-a9 | 142 test(s) passed, 1 skipped, 0 failed.
             arm/virt | 142 test(s) passed, 1 skipped, 0 failed.
         aarch64/virt | 142 test(s) passed, 1 skipped, 0 failed.
          ppc/g3beige | not supported
          ppc/ppce500 | not supported
              i386/pc | 142 test(s) passed, 1 skipped, 0 failed.
            x86_64/pc | 142 test(s) passed, 1 skipped, 0 failed.
         mipsel/malta | 142 test(s) passed, 1 skipped, 0 failed.
     loongarch64/virt | 142 test(s) passed, 1 skipped, 0 failed.
         riscv64/virt | 142 test(s) passed, 1 skipped, 0 failed.
         riscv32/virt | 0 test(s) passed, 0 skipped, 0 failed.
s390x/s390-ccw-virtio | 142 test(s) passed, 1 skipped, 0 failed.

Changes from v5 --> v6:

* tools/nolibc: arch-*.h: fix up code indent errors
  toolc/nolibc: arch-*.h: clean up whitespaces after __asm__

    Fix up the code indent errors and whitespaces between __asm__ and volatile.

    The post-whitespaces are reserved as before.

* tools/nolibc: arch-loongarch.h: shrink with _NOLIBC_SYSCALL_CLOBBERLIST
  tools/nolibc: arch-mips.h: shrink with _NOLIBC_SYSCALL_CLOBBERLIST

    Add _NOLIBC_ prefix for SYSCALL_CLOBBERLIST.

* tools/nolibc: add missing my_syscall6() for mips

    Use post-whitespaces instead of post-tab.

    The above 4 patches are preparation for this one.

* tools/nolibc: __sysret: support syscalls who return a pointer

    Add comments about the new errno range [-MAX_ERRNOR, -1], add ref to
    the musl and glibc.

* tools/nolibc: clean up mmap() routine

    Comment the MAP_FAILED return info.

* tools/nolibc: clean up sbrk() routine

    New patch, applies __sysret() helper too and also fixes up an error
    reported by scripts/checkpatch.pl.

* selftests/nolibc: export argv0 for some tests
  selftests/nolibc: prepare: create /dev/zero

    Prepare /dev/zero and argv0 for mmap test cases.

* selftests/nolibc: add EXPECT_PTREQ, EXPECT_PTRNE and EXPECT_PTRER
  selftests/nolibc: add sbrk_0 to test current brk getting

    No change.

* selftests/nolibc: add mmap_bad test case
  selftests/nolibc: add munmap_bad test case
  selftests/nolibc: add mmap_munmap_good test case

    Split the first two out to standalone patches.

    Add /dev/zero and argv0 to the file list and assigns a file_size
    manually for /dev/zero.

Best regards,
Zhangjin
---
[1]: https://lore.kernel.org/lkml/cover.1687957589.git.falcon@tinylab.org/

Zhangjin Wu (15):
  tools/nolibc: arch-*.h: fix up code indent errors
  toolc/nolibc: arch-*.h: clean up whitespaces after __asm__
  tools/nolibc: arch-loongarch.h: shrink with _NOLIBC_SYSCALL_CLOBBERLIST
  tools/nolibc: arch-mips.h: shrink with _NOLIBC_SYSCALL_CLOBBERLIST
  tools/nolibc: add missing my_syscall6() for mips
  tools/nolibc: __sysret: support syscalls who return a pointer
  tools/nolibc: clean up mmap() routine
  tools/nolibc: clean up sbrk() routine
  selftests/nolibc: export argv0 for some tests
  selftests/nolibc: prepare: create /dev/zero
  selftests/nolibc: add EXPECT_PTREQ, EXPECT_PTRNE and EXPECT_PTRER
  selftests/nolibc: add sbrk_0 to test current brk getting
  selftests/nolibc: add mmap_bad test case
  selftests/nolibc: add munmap_bad test case
  selftests/nolibc: add mmap_munmap_good test case

 tools/include/nolibc/arch-aarch64.h          |  28 ++--
 tools/include/nolibc/arch-arm.h              |  28 ++--
 tools/include/nolibc/arch-i386.h             |  24 ++--
 tools/include/nolibc/arch-loongarch.h        |  37 +++---
 tools/include/nolibc/arch-mips.h             |  73 +++++++----
 tools/include/nolibc/arch-riscv.h            |  14 +-
 tools/include/nolibc/arch-s390.h             |  14 +-
 tools/include/nolibc/arch-x86_64.h           |  28 ++--
 tools/include/nolibc/nolibc.h                |   9 +-
 tools/include/nolibc/sys.h                   |  55 ++++----
 tools/include/nolibc/types.h                 |   6 +
 tools/testing/selftests/nolibc/nolibc-test.c | 129 ++++++++++++++++++-
 12 files changed, 292 insertions(+), 153 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
