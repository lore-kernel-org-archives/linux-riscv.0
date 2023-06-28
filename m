Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C5DEB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jun 2023 13:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRDQ+GkSllF97Wx2Q1xKZEhBgrIi9xNv9n4386UxV+Q=; b=M6MvIo/2mMjLIr
	u8GXkb+nDipos54++fqxaQrj8i4kZ3NQMNDO7KRr6H51C0aC8GJVBOPLmfZ/aTbGM51AO+rRRD6ti
	3f97NqhXqJ6KmCn8IJEEU16Pmv1nzjyHJn+krkH+ODGugdzmAu2751Wej8nwYcOYoApP5urQOCZNe
	NlrAJBtcbfkaHS6LcNqdH8WZtBW8wzvg8NIwq2l/yWWK1Qp08fVNgOiP7UFWZBSVwZTRu5Lfo0YR9
	TDdB+W5p0yrt3lnI23ejf+UT/oj6J35y0MdDVAiBpM877vnJmlcO4rPQM2Jdfx9rR4sdr5MAlprkQ
	m7sUbJ1O7trksTW7iqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUtt-00Fiol-0H;
	Wed, 28 Jun 2023 13:08:01 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEUto-00FinJ-1N
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jun 2023 13:07:59 +0000
X-QQ-mid: bizesmtp65t1687957648tu9qyfcj
Received: from linux-lab-host.localdomain ( [116.30.129.193])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 28 Jun 2023 21:07:27 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: 3M0okmaRx3gb4FdeRUhO6aTI0YLKsUxEqUK9Nx/Uxnu07QNHgt2LGMOPoBR/s
	GPh7o8giMgIt60FJvxcE7e5uRKmM3LPCus9zqtpWhLnvkdQpDIxv78aaFlZDtvHnwaZlRvo
	Po9QXf3TC7/3rx5coDBkXBvbt1tlCI+a0AR0zuWB6UpzZymRvSMZJEG8wczWFFQmVIjXUzM
	QxsOGKF/smUpbO48jbVNMpfmAzXtcrI0FYkwdjpyNGAOwkfdM+6yh8VqMf2H5tZdMkT2pOf
	thJyfho1d46/BmsEnLiUTEz0Kk9W10JyVGI7ZXubxvWKJqLPQaj7AQU/oqWmziSroABw4Gf
	g/f0Afn0QLWyXsur/DiDeoSoirimQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15580650534271053015
From: Zhangjin Wu <falcon@tinylab.org>
To: thomas@t-8ch.de,
	w@1wt.eu
Cc: falcon@tinylab.org,
	arnd@arndb.de,
	david.laight@aculab.com,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 00/14] tools/nolibc: add a new syscall helper
Date: Wed, 28 Jun 2023 21:07:16 +0800
Message-Id: <cover.1687957589.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1687187451.git.falcon@tinylab.org>
References: <cover.1687187451.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_060756_785360_0BACA8BE 
X-CRM114-Status: GOOD (  12.14  )
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

Willy, Thomas

This is the revision of our 'tools/nolibc: add a new syscall helper'
series [1].

It mainly applies the core part of suggestions from Thomas (Many thanks)
and cleans up the multiple whitespaces issues reported by
scripts/checkpatch.pl.

Changes from v4 --> v5:

* tools/nolibc: sys.h: add a syscall return helper
  tools/nolibc: unistd.h: apply __sysret() helper
  tools/nolibc: sys.h: apply __sysret() helper
  tools/nolibc: unistd.h: reorder the syscall macros
  tools/nolibc: __sysret: support syscalls who return a pointer
  selftests/nolibc: add EXPECT_PTREQ, EXPECT_PTRNE and EXPECT_PTRER
  selftests/nolibc: add sbrk_0 to test current brk getting

    The same to original v4 series, no code change.

* tools/nolibc: string.h: clean up multiple whitespaces with tab
  tools/nolibc: arch-*.h: clean up multiple whitespaces
  tools/nolibc: arch-loongarch.h: shrink with SYSCALL_CLOBBERLIST
  tools/nolibc: arch-mips.h: shrink with SYSCALL_CLOBBERLIST

    Clean up the multiple whitespaces issues reported by
    scripts/checkpatch.pl, prepare for the coming mips my_syscall6()

    This cleanup is also required by another new arch shrink patchset.

    In v4, we didn't touch multiple whitespaces, because the
    changes are huge, but it is really important to do this
    before being always 'complained' by scripts/checkpatch.pl in the
    future.

* tools/nolibc: add missing my_syscall6() for mips

    Use tab instead of multiple whitespaces, let scripts/checkpatch.pl
    happy, also apply SYSCALL_CLOBBERLIST

* tools/nolibc: clean up mmap() support

    Include <linux/mman.h> and remove more macros from nolibc side.

    The return type of sys_mmap() is reserved as before, not changed
    currently.
  
* selftests/nolibc: add mmap and munmap test cases

    Applies some suggestions from Thomas,

    - Rebase length and offset on page_size and file_size

    - make sure the last offset argument is not always zero to test
      my_syscall6()

    - easier the for loop with NULL check

    - use /proc/1/exe and /proc/self/exe for run, run-user and libc-test

      but still reserve the old init files to align our another attempt
      to remove the unnecessary dependency on procfs (this is important
      to let developers happy to do all-architectures-test, the
      accumulated time cost and wait is really appreciable, it is really
      a pain for me to do repeated all-architectures-test for the new
      'minimal' kernel config patchset [2], a v2 is ready for it).

Best regards,
Zhangjin
---
[1]: https://lore.kernel.org/lkml/cover.1687187451.git.falcon@tinylab.org/
[2]: https://lore.kernel.org/lkml/cover.1687706332.git.falcon@tinylab.org/

Zhangjin Wu (14):
  tools/nolibc: sys.h: add a syscall return helper
  tools/nolibc: unistd.h: apply __sysret() helper
  tools/nolibc: sys.h: apply __sysret() helper
  tools/nolibc: unistd.h: reorder the syscall macros
  tools/nolibc: string.h: clean up multiple whitespaces with tab
  tools/nolibc: arch-*.h: clean up multiple whitespaces
  tools/nolibc: arch-loongarch.h: shrink with SYSCALL_CLOBBERLIST
  tools/nolibc: arch-mips.h: shrink with SYSCALL_CLOBBERLIST
  tools/nolibc: add missing my_syscall6() for mips
  tools/nolibc: __sysret: support syscalls who return a pointer
  tools/nolibc: clean up mmap() support
  selftests/nolibc: add EXPECT_PTREQ, EXPECT_PTRNE and EXPECT_PTRER
  selftests/nolibc: add sbrk_0 to test current brk getting
  selftests/nolibc: add mmap and munmap test cases

 tools/include/nolibc/arch-aarch64.h          | 210 +++++-----
 tools/include/nolibc/arch-arm.h              | 240 ++++++------
 tools/include/nolibc/arch-i386.h             | 226 +++++------
 tools/include/nolibc/arch-loongarch.h        | 219 +++++------
 tools/include/nolibc/arch-mips.h             | 241 ++++++------
 tools/include/nolibc/arch-riscv.h            | 208 +++++-----
 tools/include/nolibc/arch-s390.h             | 202 +++++-----
 tools/include/nolibc/arch-x86_64.h           | 222 +++++------
 tools/include/nolibc/nolibc.h                |   9 +-
 tools/include/nolibc/string.h                |   8 +-
 tools/include/nolibc/sys.h                   | 391 +++----------------
 tools/include/nolibc/types.h                 |   6 +
 tools/include/nolibc/unistd.h                |  13 +-
 tools/testing/selftests/nolibc/nolibc-test.c | 115 ++++++
 14 files changed, 1083 insertions(+), 1227 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
