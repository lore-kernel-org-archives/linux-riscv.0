Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418C4C77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 19:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LlzBYVtTYz22wpnxUf5ZGISwE/wSZ/Gun6ANkGzRaj4=; b=hyySMToAM53www
	qOKjDA7sINFGUA/gKp+YQnjTT2cMaIbSGVVdtfzuvtA/dX5JANR0h3brObtNpHK2vQM+vZzGt0EWJ
	yOo1D5A9PXe1BZB6zwvgjNPRcwOyYLSn7JpNDcMPlgJ5LEennwXIzEFCU79r0Rd3XyWr+tai80p2Y
	6zc/1mIkyXxsNSHzy6ZnelqbnGkK8RQaCpOtkjS2uJFCrWc/BGMJ3DVOrkhsVepIixF9f2UzKCmTq
	MC0YKoWNj/Al1V1RuLWPZCbYon/uPP2K7EkgNLL0D4yF5m0AiRxb1XMq6nFJsoycRB06OBDwqWMaR
	ovljd4oV39Uih96H2rPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFBu-0000000Fhdn-2MjS;
	Fri, 27 Jun 2025 19:56:54 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVFBr-0000000FhdP-2QsF
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 19:56:53 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-74924255af4so392357b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 12:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1751054210; x=1751659010; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kd16DZ58Lx6jlqmHg0BJHa0UNLPbmEfykzddN70SEj8=;
        b=K9uDjUhdc7qP5OdJHHGI85yEREnzZZrGS5xZcYmmWlSmdRxj3bxr1PPdSh4lXtVnBD
         tf25lgeGL/qAkV76V2Uqz/hg0V0MxKfwEKFaqt90sfvwRyD+bgu95TzygNhuzA7an8qR
         WQ7eV1uUs+z3gCE/z44W7JjyI/DrUlYM1KY1UB6MIAZzkqO03KRK8BnfT+sc1TfsJ9rN
         p+6Rj7+7YfJx8+W010kPmlhjqTrx2EoQvxc4oLTWXH+6qJtKhGoTXnu2jVQSASx8bzGA
         x5Jz/j545nNjYum39BIUJtY2VZD4dSrx/79ytq+hq7Q3ZwicYYMo32H9/VLDjQM2nFtZ
         NDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751054210; x=1751659010;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kd16DZ58Lx6jlqmHg0BJHa0UNLPbmEfykzddN70SEj8=;
        b=E7SijKF1vf6CNXShRU5OGjezGX59OcthpUMC5g35W4NrzsoNtx9RrntEqMgBtySS0n
         NTnFK+ACuwol9IObJIezka/PtaRFz3HkA3hf6uyLKavQgHc5AIWXYeRs0s1k/tEdG6xf
         LlwBm9QYISyQWZ05Xq8F9GUzLv4QyUXBKzuCul2EBQ/qS+ydGuo9wA98v+G/E1fh24yU
         qt+XQvE3enawm0co2ZT6aDC7+uWWwBlMOC2EsIOCbBtk20oyXCQSfLN1ySW2hPShujRA
         8SyqnwHJAeHs/a8PepiojVJVeSD+qEPV3VuagMt9CKIKPbBI3Wsew67yy7XvfM/gJACb
         CESA==
X-Gm-Message-State: AOJu0Yx2xUFsw0HVJdik5d4uxQAHK/AOO75/9SoialTGoWRyWkOXMzYl
	JasMxCVbPenhhzU6HR8d06kaTA9ImUWNyhWUG8hnBWqDf1KoQs/X9aJqE3xS81NQOkQYQnvi3vg
	PVcxVuk0=
X-Gm-Gg: ASbGncsrf3h6HVcp/6BfqRM/pqLde6BgS5zGYoW56OZI76nGv/o+Gp0R/n8wzf/nyUK
	lfBbwj2UKslRlQhaNDLFHk9hlh2IwIrFRFFakTi9zVbtzOwJMWVLfX2IFf3bWZMcJXuSkqa5Qjt
	IHo+tFJmKNHtfo8ajY9P3N5BibgYeNkwMJIZKw+jg6ydNLvJo5CVw5WuzTukZ/aewwq5m+/tunH
	rxcgvGyCPAHTaLBcZlSbgNSlx7/xHv7D5IQNNXeW6F3gcnOCA6HlP9yRvSf5v7C0J3GNNnN2Ew9
	1wsbWtAX2KwsoczeWtP4YCAba2zka7WG7vJx2CTRyTUKC8G/hMsK9CwoyybV
X-Google-Smtp-Source: AGHT+IEQsJdpkJDVb09SU1wr49pMTne/iSq+L4sJx5vWT2zoGuZipLcGALrfoeDygSP3qPW8yNJm9A==
X-Received: by 2002:a05:6a00:4b16:b0:740:aa33:c6f8 with SMTP id d2e1a72fcca58-74af6e662ddmr6737555b3a.7.1751054209885;
        Fri, 27 Jun 2025 12:56:49 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74af5574390sm3201286b3a.90.2025.06.27.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:56:49 -0700 (PDT)
Date: Fri, 27 Jun 2025 12:56:49 -0700 (PDT)
X-Google-Original-Date: Fri, 27 Jun 2025 12:56:41 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.16-rc4
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-BFF0FF2C-E730-45D5-8E5F-48D03E841EB2@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_125651_854492_649D2A72 
X-CRM114-Status: GOOD (  12.13  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.16-rc4

for you to fetch changes up to c5136add3f9b4c23b8bbe5f4d722c95d4cfb936e:

  riscv: export boot_cpu_hartid (2025-06-23 16:30:05 -0700)

----------------------------------------------------------------
There's a trivial merge conflict in .mailmap that's in next, but seems like
that's just bad luck on the timing.

----------------------------------------------------------------
RISC-V Fixes for 5.16-rc4

* .rodata is no longer linkd into PT_DYNAMIC, it was not supposed to be
  there in the first place and resultst in invalid (but unused) entries.
  This manifests as at least warnings in llvm-readelf.
* A fix for runtime constants with all-0 upper 32-bits.  This should
  only manifest on MMU=n kernels.
* A fix for context save/restore on systems using the T-Head vector
  extensions.
* A fix for a conflicting "+r"/"r" register constraint in the VDSO
  getrandom syscall wrapper, which is undefined behavior in clang.
* A fix for a missing register clobber in the RVV raid6 implementation.
  This manifests as a NULL pointer reference on some compilers, but
  could trigger in other ways.
* Misaligned accesses from userspace at faulting addresses are now
  handled correctly.
* A fix for an incorrect optimization that allowed access_ok() to mark
  invalid addresses as accessible, which can result in userspace
  triggering BUG()s.
* A few fixes for build warnings, and an update to Drew's email address.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix sparse warning in vendor_extensions/sifive.c

Charles Mirabile (1):
      riscv: fix runtime constant support for nommu kernels

Chunyan Zhang (1):
      raid6: riscv: Fix NULL pointer dereference caused by a missing clobber

Drew Fustini (1):
      MAINTAINERS: Update Drew Fustini's email address

Fangrui Song (1):
      riscv: vdso: Exclude .rodata from the PT_DYNAMIC segment

Han Gao (1):
      riscv: vector: Fix context save/restore with xtheadvector

Klara Modin (1):
      riscv: export boot_cpu_hartid

Nam Cao (2):
      Revert "riscv: misaligned: fix sleeping function called during misaligned access handling"
      Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"

Palmer Dabbelt (3):
      Merge tag 'riscv-fixes-6.16-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/alexghiti/linux into fixes
      Merge patch "Fix a segmentation fault also add raid6test for RISC-V support"
      RISC-V: uaccess: Wrap the get_user_8 uaccess macro

Xi Ruoyao (1):
      RISC-V: vDSO: Correct inline assembly constraints in the getrandom syscall wrapper

 .mailmap                                     |  1 +
 MAINTAINERS                                  |  2 +-
 arch/riscv/include/asm/pgtable.h             |  1 -
 arch/riscv/include/asm/runtime-const.h       |  2 +-
 arch/riscv/include/asm/uaccess.h             |  3 +-
 arch/riscv/include/asm/vdso/getrandom.h      |  2 +-
 arch/riscv/include/asm/vector.h              | 12 +++----
 arch/riscv/kernel/setup.c                    |  1 +
 arch/riscv/kernel/traps_misaligned.c         |  4 +--
 arch/riscv/kernel/vdso/vdso.lds.S            |  2 +-
 arch/riscv/kernel/vendor_extensions/sifive.c |  2 +-
 lib/raid6/rvv.c                              | 48 ++++++++++++++++------------
 12 files changed, 45 insertions(+), 35 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
