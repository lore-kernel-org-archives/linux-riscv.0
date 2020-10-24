Return-Path: <SRS0=l2pG=D7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F21C2D0A3
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2020 05:13:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E707122254
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Oct 2020 05:13:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t9KKvpWj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="L8BR2Whn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E707122254
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6nSetnYoW95Azi5/sQjv/SvmQ7+FZuA5zOHJyOgiaYQ=; b=t9KKvpWjVvH0KSbXAFps7rxNwj
	K3wcgHqNptYDnI2ui2+shUzQiebLC2g64XKQtCRgrmXOVtOvtxdKoWD13qtwrsBjiNiEva5W26lLN
	lhU5ScIkMaYUUV0EfbzPSzt9YL0h4AINzfnfyLe/FLxQxtsaqFzmjPDYi9gm7XZSOv6uNaH9DNy7j
	QN6am29J41LQvi/kdM9C3dq2WbKolBODSIHE3Qy92/aQVWskmevuc0MSHC7C0Mb+fb7M+kUXzHvdS
	B33I7RcMfBl4rR03nC4uOGp3nj92A9gu3RASeVA2J0mDocS/iz0AGzkAsBFa3+SupW9PksabbAKL8
	gWXM52xA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWBrY-0001lL-RN; Sat, 24 Oct 2020 05:13:08 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWBrW-0001kn-My
 for linux-riscv@lists.infradead.org; Sat, 24 Oct 2020 05:13:07 +0000
Received: by mail-pj1-x1044.google.com with SMTP id lt2so321880pjb.2
 for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2020 22:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=FyIsB+gaIcHxAQo0rZx0L2tAsyceupiqK9XkzWHDLMc=;
 b=L8BR2WhnzckT0m5aJ2aziY/2sezjG6V4vvxTR2ESbuEPjQpo4d5cdvEk3NnGhDBrGV
 5181WmnG94aj9yAZ/Z/YYDieUsQDwZyVwzpVdWdvR21qhWuqZb1QsUN/D94ZjGUv0JDH
 Yx/INTBKLLTgFpyOnoys3oQ4Jh4s/GXVXSmMnzoKRjhkgDC2NxbvsaXL32R9u46zpIV4
 qj0AbCj6Qyzh+839aCLQcydRpCaO7j+5JLvD3ZszS7x6glkLLH4DmcNkTdcUktvz4S2Z
 XBtguqvu6GFnVOOEh6muyb7+7UZXP4UPPDKB7nN7d9E71szPEz92xHm6cM3hBK9mZ/me
 oG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=FyIsB+gaIcHxAQo0rZx0L2tAsyceupiqK9XkzWHDLMc=;
 b=BC/xM9AfmtqH4ByucJ1cgR+CUyB9CE6IwSjVyHYvvnhwVu1ITo5PMaBYzxOwt9LX8p
 Dt2bbXBGfGG17lCPNsjooyIK/tPvwdWWRQeCNik1xm90yv2r+70oS0NZt0oT4RUXHsAX
 nG2t1GmQn81JCZYxwp2kTwJBPaYRyaNyR66Vac38HE+c6eF1JqAAZYxKu+S35Dn3XLxw
 9LWf/gixyx3GEUcFuEr/0zr9y+HRzOg7pmCvVAONUB/P5bO8qQ3EE8Q7pBxNpyNI21Lb
 q0uIts16Wgjggv0X6FNlMzSTCVA3v+2+6iA8mzzaZGzl0ESGl/qDQjPe9HKM4/qPe6Or
 CyxQ==
X-Gm-Message-State: AOAM532iglgJ88/5RRbTXXiBqo7qdXMopzDQOx3Ml+f0s6vUhW1USX0O
 UiRM0lzNXsRh9aIboZssAD1jqAtB7yIKEA==
X-Google-Smtp-Source: ABdhPJxhR31oDZ8cgCyRu5/yU1XmD4TCgTc2I/xDbH4a4w1D+xJ3c0rv/CuK6EmkbJ6JGXmZ2jj62Q==
X-Received: by 2002:a17:90a:fd12:: with SMTP id
 cv18mr990882pjb.221.1603516382692; 
 Fri, 23 Oct 2020 22:13:02 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id y137sm4070147pfc.77.2020.10.23.22.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 22:13:02 -0700 (PDT)
Date: Fri, 23 Oct 2020 22:13:02 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Oct 2020 22:12:46 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.10 Merge Window, Part 2
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-ed53d520-0ecd-4767-ade1-f4266118c3c0@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201024_011306_887785_0394E06F 
X-CRM114-Status: GOOD (  15.48  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit de22d2107ced3cc5355cc9dbbd85e44183546bd5:

  RISC-V: Add page table dump support for uefi (2020-10-02 14:31:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.10-mw1

for you to fetch changes up to e8d444d3e98c255f91d228984abc46cfdfaf48b4:

  riscv: remove address space overrides using set_fs() (2020-10-04 10:27:10 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.10 Merge Window, Part 2

This actually just contains a single patch set:

* The remainder of Christoph's work to remove set_fs, including the RISC-V
  portion.

----------------------------------------------------------------
I know I said in the previous PR that I'd keep including shortlogs as of the
last tag, but I haven't done that here as it would include my previous PR.
Essentially I wanted to wait for the base branch of this to land first, as it
touched a lot.  Rather than rebasing I've just left the original merge in
place and sent a shortlog against master.

I'm not sure why the diffstat shows so much more, though.  I manually checked
the commits and my merge has the same commits yours does.  It's my first time
trying this particular sort of merge (though the last one had a tag-based merge
of the same sort, which IIUC shouldn't be any different) so hopefully it went
OK.

Christoph Hellwig (8):
      uaccess: provide a generic TASK_SIZE_MAX definition
      asm-generic: improve the nommu {get,put}_user handling
      asm-generic: add nommu implementations of __{get,put}_kernel_nofault
      asm-generic: make the set_fs implementation optional
      riscv: use memcpy based uaccess for nommu again
      riscv: refactor __get_user and __put_user
      riscv: implement __get_kernel_nofault and __put_user_nofault
      riscv: remove address space overrides using set_fs()

Palmer Dabbelt (1):
      Merge branch 'base.set_fs' of git://git.kernel.org/.../viro/vfs into for-next

 arch/Kconfig                            |   3 +
 arch/alpha/Kconfig                      |   1 +
 arch/arc/Kconfig                        |   1 +
 arch/arm/Kconfig                        |   1 +
 arch/arm64/Kconfig                      |   1 +
 arch/c6x/Kconfig                        |   1 +
 arch/csky/Kconfig                       |   1 +
 arch/h8300/Kconfig                      |   1 +
 arch/hexagon/Kconfig                    |   1 +
 arch/ia64/Kconfig                       |   1 +
 arch/m68k/Kconfig                       |   1 +
 arch/microblaze/Kconfig                 |   1 +
 arch/mips/Kconfig                       |   1 +
 arch/nds32/Kconfig                      |   1 +
 arch/nios2/Kconfig                      |   1 +
 arch/openrisc/Kconfig                   |   1 +
 arch/parisc/Kconfig                     |   1 +
 arch/powerpc/include/asm/processor.h    |   7 --
 arch/powerpc/include/asm/thread_info.h  |   5 +-
 arch/powerpc/include/asm/uaccess.h      |  67 ++++--------
 arch/powerpc/kernel/signal.c            |   3 -
 arch/powerpc/lib/sstep.c                |   6 +-
 arch/riscv/Kconfig                      |   1 +
 arch/riscv/include/asm/thread_info.h    |   6 --
 arch/riscv/include/asm/uaccess.h        | 177 ++++++++++++++++----------------
 arch/riscv/kernel/process.c             |   1 -
 arch/riscv/lib/Makefile                 |   2 +-
 arch/s390/Kconfig                       |   1 +
 arch/sh/Kconfig                         |   1 +
 arch/sparc/Kconfig                      |   1 +
 arch/um/Kconfig                         |   1 +
 arch/x86/ia32/ia32_aout.c               |   1 -
 arch/x86/include/asm/page_32_types.h    |  11 ++
 arch/x86/include/asm/page_64_types.h    |  38 +++++++
 arch/x86/include/asm/processor.h        |  60 +----------
 arch/x86/include/asm/thread_info.h      |   2 -
 arch/x86/include/asm/uaccess.h          |  26 +----
 arch/x86/kernel/asm-offsets.c           |   3 -
 arch/x86/lib/getuser.S                  |  47 ++++-----
 arch/x86/lib/putuser.S                  |  25 ++---
 arch/xtensa/Kconfig                     |   1 +
 drivers/misc/lkdtm/bugs.c               |  10 --
 drivers/misc/lkdtm/core.c               |   2 -
 drivers/misc/lkdtm/lkdtm.h              |   2 -
 drivers/misc/lkdtm/usercopy.c           |  15 ---
 fs/proc/inode.c                         | 119 ++++++++++++++-------
 fs/proc/proc_sysctl.c                   |  48 ++++-----
 fs/read_write.c                         |  69 ++++++++-----
 fs/splice.c                             | 130 +++--------------------
 include/asm-generic/uaccess.h           | 109 ++++++++++++--------
 include/linux/bpf-cgroup.h              |   2 +-
 include/linux/fs.h                      |   2 -
 include/linux/proc_fs.h                 |   1 +
 include/linux/uaccess.h                 |  22 ++++
 kernel/bpf/cgroup.c                     |   2 +-
 lib/test_bitmap.c                       |  91 ++++------------
 tools/testing/selftests/lkdtm/tests.txt |   2 -
 57 files changed, 509 insertions(+), 629 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
