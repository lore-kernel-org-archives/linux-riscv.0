Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535A9C0218F
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 20:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i/pNgyGkiQ8nBPKFThZroLhWXPblQ6EaC0uywkX93+8=; b=ZnEfnvNGfnek66
	IUiJqUxTCTbFhhc54vKYSyuSf7posoIqs1f2W39/cRmC5cHykiT710AIw4MYp9gm+ISKNt+xVdWiv
	V6QbUEe7eGvKwZUJd6b8ZBVJFSiRPYoHIn92ovr4fnn+QVLmdN+g0NJSOwu9euvnhS2LGtNEVKmXv
	rXAu6qw5tsjdGfVoudhjv4s5QaNXBgEhI7gG65WhePbg4hK+ILAMMFxoDgX4UHzaExOEsN1YQg/+O
	/74+kTUZ4qBPBXIn/tiWcOj1Oy9dtfVHu4qDYnl4dQ5U2M/YOF5RH1r4uQhTiv0qu2yKaPB1gzkYP
	biokOZUW+le1G2cXL3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxKU-0000000BLvc-45Pi;
	Fri, 31 Jan 2025 20:09:30 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdxJi-0000000BLrH-2Rt7
	for linux-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 20:08:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2166360285dso41557345ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 31 Jan 2025 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738354121; x=1738958921; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBul5ysGPZTyDg4qnqAU/ekNzSdW9pjkuURf85NPIBY=;
        b=DirF+UO9ohfwcicxOnujUt1qMxV3usAP+QwcaQLGR4S93lja4n2QsujeRsEoOU151i
         xQeRGpsnM4dcWtKKT4ujTOKvOOdbncHbCCSGTZ0cJEGB0EJZKn8D4CV4r5rnXpalIEiT
         YSZd5/VXjcHDYFRAg/m3Sj0jZb8ol7qrovOkFGAubJV+EyTC6zBk2FgUr3iwWO9Ot+de
         Q38SssAtBbYr02+bd4uZKbi8MrzbXkwaYLuHUOU6AVDELauJoFMIZK+/4wLzZ4Vb1uWD
         ErnfovY88CWSUc8dLbEJLErGXCcDJ0lsp6FekBlI6FRqlbyV9Q/i5RcH1zNTSHo+QJ3X
         Fq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354121; x=1738958921;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cBul5ysGPZTyDg4qnqAU/ekNzSdW9pjkuURf85NPIBY=;
        b=qaJXHM8tAVdLsBVehu12llUxxk1OerhZ+uDTDQ7HEBLe0Z5tlst7qXbesGQIYfIGD1
         Dpz11AXubRGaGqyP+NSlR/Fui/fuseeTvLLEaBZjfj/iJwcuP7hmJuYM5At6E5UVoGwJ
         awdEvjx9FoE0va0iSMp+vreSBkd6J3efenatyHLIGB/8FUyVtRbmKtyLo7sbitzFN0Rl
         wxZCWSyHLBiMST+PxRwbKH01e1zl1oCIY3Na9aooigYoA6hfHRXD2c4gNPTDpPXDICHP
         fPV8v5a7IbEKa+iqm47dUiPv9se9XkDNEIyPqHYGRrV7R1VM5mRO58/BSyYyXdiURGc2
         NeHQ==
X-Gm-Message-State: AOJu0YyjooRgVkmMu8CHdT1wMHMRLLJ++L2dRQzM6r+bWBkyqay47gq9
	TFjEta2DKTyONXCKf689xVA1j+FC/9eOxgN8stzEfTQ7rK+aU767KnxhlwsT2drzb5KeCJ2NZlE
	g
X-Gm-Gg: ASbGnctUBD6gruvxIYUNAScsex7lGe5FbiVEJOnugh008j36zt+6bn63qReTHXp+fcK
	RmQEho5V8qs/rBqCJ8i3rGLfp9c5/r5POcf3KGk8GlOx04cagJqQznOetAlkfxctzTNN5fezjnj
	o4/+IXUPEz982yEejBe8WEcz68RPvfOJ9nWhh/Sy7LcRHbc2NUUnK2Hy6ZysOZHmJLrI7u829yb
	0AyCw46VJ22Ath7ZP8gId6OovWYobwLues/OEp+GP9z9Y3FUO+wJwPBOuuOhyuFbeA7KbmaobTx
	GDt2ur1OUoImwA==
X-Google-Smtp-Source: AGHT+IGrMDfDUwByc0j7gn0ck3Oam/oLJvP4Nzd1Pw9CtpK5Ytij8uVVdjOi9PeMkBtoMSrpkyzWMQ==
X-Received: by 2002:a17:902:db02:b0:216:69ca:7714 with SMTP id d9443c01a7336-21dd7c46297mr184198085ad.11.1738354121173;
        Fri, 31 Jan 2025 12:08:41 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31fcdd0sm34501885ad.103.2025.01.31.12.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 12:08:40 -0800 (PST)
Date: Fri, 31 Jan 2025 12:08:40 -0800 (PST)
X-Google-Original-Date: Fri, 31 Jan 2025 12:08:28 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 6.14 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5051a418-807c-4539-91b2-255492eae79f@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_120842_888799_B1DBA5F2 
X-CRM114-Status: GOOD (  20.60  )
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

The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.14-mw1

for you to fetch changes up to 101971298be2aa4706c8602bd81066a0f6f2ced5:

  riscv: add a warning when physical memory address overflows (2025-01-29 18:36:09 -0800)

----------------------------------------------------------------
RISC-V Patches for the 6.14 Merge Window, Part 1

* The PH1520 pinctrl and dwmac drivers are enabeled in defconfig.
* A redundant AQRL barrier has been removed from the futex cmpxchg
  implementation.
* Support for the T-Head vector extensions, which includes exposing
  these extensions to userspace on systems that implement them.
* Some more page table information is now printed on die() and systems
  that cause PA overflows.

----------------------------------------------------------------
I don't have a second PR planned, I've been pretty sick lately so every if
something does blow up I'm probably going to be too out of it to notice this
weekend.  That means this also hasn't gotten as much love as usual, but
hopefully that's just resulted in this being small and not buggy.

There's a pair of conflicts.  The v_initval_nolibc.c changes also landed in the
new v_exec_initval_nolibc.c, so just removing it looks good to me.  The
vstate_prctl test had an in-flight fixup/rewrite.  Not sure if I'm just slow
today, but I'm having trouble trying to get a pre-merge `git diff` to show me
anything so here's my `git show --diff-merges=remerge`, hopefully that helps

diff --git a/tools/testing/selftests/riscv/vector/vstate_prctl.c b/tools/testing/selftests/riscv/vector/vstate_prctl.c
remerge CONFLICT (content): Merge conflict in tools/testing/selftests/riscv/vector/vstate_prctl.c
index 340ca64ccc2b..62fbb17a0556 100644
--- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
+++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
@@ -36,19 +36,8 @@ TEST(get_control_no_v)
 {
        long rc;

-<<<<<<< 101971298be2 (riscv: add a warning when physical memory address overflows)
        if (is_vector_supported() || is_xtheadvector_supported())
                SKIP(return, "Test expects vector to be not supported");
-=======
-       ksft_set_plan(1);
-
-       pair.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
-       rc = riscv_hwprobe(&pair, 1, 0, NULL, 0);
-       if (rc < 0) {
-               ksft_test_result_fail("hwprobe() failed with %ld\n", rc);
-               return -1;
-       }
->>>>>>> 69b8923f5003 (Merge tag 'for-linus-6.14-ofs4' of git://git.kernel.org/pub/scm/linux/kernel/git/hubcap/linux)

        rc = prctl(PR_RISCV_V_GET_CONTROL);
        EXPECT_EQ(-1, rc)

----------------------------------------------------------------
Celeste Liu (1):
      riscv: defconfig: drop RT_GROUP_SCHED=y

Charlie Jenkins (13):
      dt-bindings: riscv: Add xtheadvector ISA extension description
      dt-bindings: cpus: add a thead vlen register length property
      riscv: dts: allwinner: Add xtheadvector to the D1/D1s devicetree
      riscv: Add thead and xtheadvector as a vendor extension
      riscv: vector: Use vlenb from DT for thead
      riscv: csr: Add CSR encodings for CSR_VXRM/CSR_VXSAT
      riscv: Add xtheadvector instruction definitions
      riscv: vector: Support xtheadvector save/restore
      riscv: hwprobe: Add thead vendor extension probing
      riscv: hwprobe: Document thead vendor extensions and xtheadvector extension
      selftests: riscv: Fix vector tests
      selftests: riscv: Support xtheadvector in vector tests
      riscv: Add ghostwrite vulnerability

Davidlohr Bueso (1):
      riscv/futex: Optimize atomic cmpxchg

Drew Fustini (1):
      riscv: defconfig: enable pinctrl and dwmac support for TH1520

Heiko Stuebner (1):
      RISC-V: define the elements of the VCSR vector CSR

Palmer Dabbelt (2):
      RISC-V: Mark riscv_v_init() as __init
      Merge patch series "riscv: Add support for xtheadvector"

Yunhui Cui (2):
      riscv/mm/fault: add show_pte() before die()
      riscv: add a warning when physical memory address overflows

 Documentation/arch/riscv/hwprobe.rst               |  10 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |  19 ++
 .../devicetree/bindings/riscv/extensions.yaml      |  10 +
 arch/riscv/Kconfig.errata                          |  11 +
 arch/riscv/Kconfig.vendor                          |  26 ++
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi      |   3 +-
 arch/riscv/configs/defconfig                       |   3 +-
 arch/riscv/errata/thead/errata.c                   |  28 ++
 arch/riscv/include/asm/bugs.h                      |  22 ++
 arch/riscv/include/asm/cpufeature.h                |   2 +
 arch/riscv/include/asm/csr.h                       |  15 +
 arch/riscv/include/asm/errata_list.h               |   3 +-
 arch/riscv/include/asm/futex.h                     |   2 +-
 arch/riscv/include/asm/hwprobe.h                   |   5 +-
 arch/riscv/include/asm/switch_to.h                 |   2 +-
 arch/riscv/include/asm/vector.h                    | 222 +++++++++++----
 arch/riscv/include/asm/vendor_extensions/thead.h   |  47 ++++
 .../include/asm/vendor_extensions/thead_hwprobe.h  |  19 ++
 .../include/asm/vendor_extensions/vendor_hwprobe.h |  37 +++
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +-
 arch/riscv/include/uapi/asm/vendor/thead.h         |   3 +
 arch/riscv/kernel/Makefile                         |   2 +
 arch/riscv/kernel/bugs.c                           |  60 ++++
 arch/riscv/kernel/cpufeature.c                     |  59 +++-
 arch/riscv/kernel/kernel_mode_vector.c             |   8 +-
 arch/riscv/kernel/process.c                        |   4 +-
 arch/riscv/kernel/signal.c                         |   6 +-
 arch/riscv/kernel/sys_hwprobe.c                    |   5 +
 arch/riscv/kernel/vector.c                         |  26 +-
 arch/riscv/kernel/vendor_extensions.c              |  10 +
 arch/riscv/kernel/vendor_extensions/Makefile       |   2 +
 arch/riscv/kernel/vendor_extensions/thead.c        |  29 ++
 .../riscv/kernel/vendor_extensions/thead_hwprobe.c |  19 ++
 arch/riscv/mm/fault.c                              |  52 ++++
 arch/riscv/mm/init.c                               |   8 +-
 drivers/base/cpu.c                                 |   3 +
 include/linux/cpu.h                                |   1 +
 scripts/selinux/genheaders/genheaders              | Bin 0 -> 90112 bytes
 tools/testing/selftests/riscv/vector/.gitignore    |   3 +-
 tools/testing/selftests/riscv/vector/Makefile      |  17 +-
 .../selftests/riscv/vector/v_exec_initval_nolibc.c |  94 +++++++
 tools/testing/selftests/riscv/vector/v_helpers.c   |  68 +++++
 tools/testing/selftests/riscv/vector/v_helpers.h   |   8 +
 tools/testing/selftests/riscv/vector/v_initval.c   |  22 ++
 .../selftests/riscv/vector/v_initval_nolibc.c      |  68 -----
 .../selftests/riscv/vector/vstate_exec_nolibc.c    |  20 +-
 .../testing/selftests/riscv/vector/vstate_prctl.c  | 305 +++++++++++++--------
 47 files changed, 1114 insertions(+), 277 deletions(-)
 create mode 100644 arch/riscv/include/asm/bugs.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/thead.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/thead_hwprobe.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/vendor_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/thead.h
 create mode 100644 arch/riscv/kernel/bugs.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/thead.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/thead_hwprobe.c
 create mode 100755 scripts/selinux/genheaders/genheaders
 create mode 100644 tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
 create mode 100644 tools/testing/selftests/riscv/vector/v_helpers.c
 create mode 100644 tools/testing/selftests/riscv/vector/v_helpers.h
 create mode 100644 tools/testing/selftests/riscv/vector/v_initval.c
 delete mode 100644 tools/testing/selftests/riscv/vector/v_initval_nolibc.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
