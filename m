Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F167D6ACEB
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 15:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pNkFgjayxSl6aaoGlx4ayArFiE1U0ix7z9N7Jjck1gM=; b=ztv8iZFMw4Jj1s
	63/jl+tcB92UWkgONShKhA3KPChAYBzdO7lzARRIMXQXe9+TYHC7oHY8+PE+7jCiFICZ7rVLHlXS9
	V0k0a2yrKpJdAKHts5Imbs8+68irQJLksU3sxGXZEGq9zLmIh8a90kpsrBEYwlrTz5Zd0eSv1Z02O
	heEQAt8EDrKTztRjZV+H8RdZOmhu570YEZnpRSkwbaQS68YusSgXaQ8XRx/xkxK3KMQU3UQ62Qr/i
	KiqIEzj+mu4EjJRsU1zY+n+KMNwbsy2byvbS/sCsWu+l723YRv4rUQRXFgzQ+ncRgiXsJ5r7CFoJl
	JB97t9OL/DVbU/VpfXDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGK0R-0000000DVyj-40tm;
	Wed, 27 Nov 2024 15:31:07 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGK0G-0000000DVvy-0d7O
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 15:30:57 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21290973bcbso66404515ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Nov 2024 07:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1732721454; x=1733326254; darn=lists.infradead.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbxIRZel9T5dkqcntCDk2OqqDHeP3vTzFbFWVMrRR0k=;
        b=W3poiIvr7mrEdqQAjKRsuWKCoI80YT+4GgaiZYDX/Pxn17xtXyJomOby+814nRmPkR
         ihmjRGH+lYP1/4H4qu2NDIFkgl4eAU9jpO+oDY+oVmr3miVMT5tLLr4169v6VrGqYTQ2
         7dsm0ewslj5c02+Ie63q+AlRmGuSVkYEwetZatF1iTxVUkYyDSMj/QhewN4fnwKqRFF6
         fKncls0mxQTWoqvfVVSK4Ih+8YPFR5QKg/WmV21L0CLDqIFvucB/gk2y7Yh+mgMElBEQ
         OT4F7Q+pEWDKkTDTIbiwGUo93ztPWIApm4WIjkk2o81l5WrD8UhBzAimDG845NuPpGYc
         7nLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732721454; x=1733326254;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cbxIRZel9T5dkqcntCDk2OqqDHeP3vTzFbFWVMrRR0k=;
        b=eEyUgNeUH+QaUH3T+O6GGCW0Agw+qodzBgf+fz22p8dxcgml4Nt5GZEA4mv3eFpRYG
         +/pCdiZZ2HZdcsAnpZQaw3DSMrzElayMJSwot+8xzurfzZCRghuVa7gifk0kmL1PEvfh
         8lE33vl4QHdEARsU6Hf6iXXWEzNxgviyZkP8eqQhm8LfTojX2+VbTZftzxFoNCgIpBm1
         DYXjGRWBrPgQD3CSO1n0Or64dy+U1Z5OtFoiY/sQ5U+X3t1EmQGIPHEasaIMxFeG19JZ
         iijN1TdZ1xOopcvO54E2J6bo7r32AXlUALy/unQwwlMUqgVHCzVItxWeBwKx0FVSEX1d
         37VA==
X-Gm-Message-State: AOJu0Ywm9moBtCErbnpxuXaIFKfa6K003eKQwFWTvEFqRH6W7dfD+HrS
	bOcR5xeROy+Hp/09YPFpTNSbHDQF1/X3BrKfBvZHzkON1sShU7dNYSUYdFAEDXL9RD7dKDyOhwH
	P
X-Gm-Gg: ASbGncsXK6MtkM8gDHN9yPHQQNM4lqbHqpSeJ/ek+0ccMWUybt8BwnIL+ULGNCTwMgx
	kMgsURNZFm5OKIZi+pPS2QBk5Unr0DQ56Lzf267yhJEypN3qIMVaYR+XFQKBiIUlc6dfuynWVK3
	h8bB9TSXVqlV9iXJoC3kUmwcG/qRQr9FXpDUpj+3syHJjiCFNkfSnV3SB/vVteIU/pj4UI0ZZk8
	JU02QwSg3Dl/VZFvd0bj4e2pme/joERMxh5LXwWdoYRYfR9
X-Google-Smtp-Source: AGHT+IEKS5ruBNsykjv4PxtNLKybCyk+nwPxsnSoJG0AQq9IJovlSaXdZw4IhgtETh8O+QYsxFfo1w==
X-Received: by 2002:a17:903:22c2:b0:211:f335:ac8 with SMTP id d9443c01a7336-21501385201mr36815565ad.29.1732721454111;
        Wed, 27 Nov 2024 07:30:54 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db8c7aesm104109355ad.55.2024.11.27.07.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Nov 2024 07:30:53 -0800 (PST)
Date: Wed, 27 Nov 2024 07:30:53 -0800 (PST)
X-Google-Original-Date: Wed, 27 Nov 2024 07:21:06 PST (-0800)
Subject: [GIT PULL] RISC-V Paches for the 6.13 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5c0ea89d-908b-4009-ba23-e4fac45618b4@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_073056_393726_34F17F98 
X-CRM114-Status: GOOD (  15.13  )
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

The following changes since commit 81983758430957d9a5cb3333fe324fd70cf63e7e:

  Linux 6.12-rc5 (2024-10-27 12:52:02 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.13-mw1

for you to fetch changes up to 8d4f1e05ff821a5d59116ab8c3a30fcae81d8597:

  RISC-V: Remove unnecessary include from compat.h (2024-11-26 11:48:53 -0800)

----------------------------------------------------------------
RISC-V Paches for the 6.13 Merge Window, Part 1

* Support for pointer masking in userspace,
* Support for probing vector misaligned access performance.
* Support for qspinlock on systems with Zacas and Zabha.

----------------------------------------------------------------
There's a handful of fixes working through other trees (the wait/wound lockdep
failures and a tools build fix), but aside from those everything is clean on my
end.  I don't plan on having a part 2, unless there's something else in flight
that blows up.

----------------------------------------------------------------
Alexandre Ghiti (12):
      riscv: Check that vdso does not contain any dynamic relocations
      riscv: Move cpufeature.h macros into their own header
      riscv: Do not fail to build on byte/halfword operations with Zawrs
      riscv: Implement cmpxchg32/64() using Zacas
      dt-bindings: riscv: Add Zabha ISA extension description
      riscv: Implement cmpxchg8/16() using Zabha
      riscv: Improve zacas fully-ordered cmpxchg()
      riscv: Implement arch_cmpxchg128() using Zacas
      riscv: Implement xchg8/16() using Zabha
      riscv: Add ISA extension parsing for Ziccrse
      dt-bindings: riscv: Add Ziccrse ISA extension description
      riscv: Add qspinlock support

Charlie Jenkins (1):
      riscv: Fix default misaligned access trap

Drew Fustini (1):
      riscv: defconfig: enable gpio support for TH1520

Guo Ren (2):
      asm-generic: ticket-lock: Reuse arch_spinlock_t of qspinlock
      asm-generic: ticket-lock: Add separate ticket-lock.h

Jesse Taube (6):
      RISC-V: Check scalar unaligned access on all CPUs
      RISC-V: Scalar unaligned access emulated on hotplug CPUs
      RISC-V: Replace RISCV_MISALIGNED with RISCV_SCALAR_MISALIGNED
      RISC-V: Detect unaligned vector accesses supported
      RISC-V: Report vector unaligned access speed hwprobe
      RISC-V: hwprobe: Document unaligned vector perf key

Nick Hu (2):
      cpuidle: riscv-sbi: Move sbi_cpuidle_init to arch_initcall
      cpuidle: riscv-sbi: Add cpuidle_disabled() check

Palmer Dabbelt (7):
      Merge patch series "riscv: Per-thread envcfg CSR support"
      Merge patch series "cpuidle: riscv-sbi: Allow cpuidle pd used by other devices"
      Merge patch series "RISC-V: Detect and report speed of unaligned vector accesses"
      Merge patch series "Prevent dynamic relocations in vDSO"
      Merge patch series "riscv: Userspace pointer masking and tagged address ABI"
      Merge patch series "Zacas/Zabha support and qspinlocks"
      RISC-V: Remove unnecessary include from compat.h

Samuel Holland (13):
      riscv: Enable cbo.zero only when all harts support Zicboz
      riscv: Add support for per-thread envcfg CSR values
      riscv: Call riscv_user_isa_enable() only on the boot hart
      dt-bindings: riscv: Add pointer masking ISA extensions
      riscv: Add ISA extension parsing for pointer masking
      riscv: Add CSR definitions for pointer masking
      riscv: Add support for userspace pointer masking
      riscv: Add support for the tagged address ABI
      riscv: Allow ptrace control of the tagged address ABI
      riscv: selftests: Add a pointer masking test
      riscv: hwprobe: Export the Supm ISA extension
      RISC-V: KVM: Allow Smnpm and Ssnpm extensions for guests
      KVM: riscv: selftests: Add Smnpm and Ssnpm to get-reg-list test

 Documentation/arch/riscv/hwprobe.rst               |  19 ++
 Documentation/arch/riscv/uabi.rst                  |  16 +
 .../devicetree/bindings/riscv/extensions.yaml      |  30 ++
 .../locking/queued-spinlocks/arch-support.txt      |   2 +-
 arch/riscv/Kconfig                                 | 138 ++++++++-
 arch/riscv/Makefile                                |   6 +
 arch/riscv/configs/defconfig                       |   1 +
 arch/riscv/include/asm/Kbuild                      |   4 +-
 arch/riscv/include/asm/cmpxchg.h                   | 286 +++++++++++++-----
 arch/riscv/include/asm/compat.h                    |   1 -
 arch/riscv/include/asm/cpufeature-macros.h         |  66 ++++
 arch/riscv/include/asm/cpufeature.h                |  73 +----
 arch/riscv/include/asm/csr.h                       |  16 +
 arch/riscv/include/asm/entry-common.h              |   1 +
 arch/riscv/include/asm/hwcap.h                     |   7 +
 arch/riscv/include/asm/hwprobe.h                   |   2 +-
 arch/riscv/include/asm/mmu.h                       |   7 +
 arch/riscv/include/asm/mmu_context.h               |  13 +
 arch/riscv/include/asm/processor.h                 |   9 +
 arch/riscv/include/asm/spinlock.h                  |  47 +++
 arch/riscv/include/asm/switch_to.h                 |  19 ++
 arch/riscv/include/asm/uaccess.h                   |  43 ++-
 arch/riscv/include/asm/vector.h                    |   2 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   6 +
 arch/riscv/include/uapi/asm/kvm.h                  |   2 +
 arch/riscv/kernel/Makefile                         |   3 +-
 arch/riscv/kernel/copy-unaligned.h                 |   5 +
 arch/riscv/kernel/cpufeature.c                     |  16 +-
 arch/riscv/kernel/fpu.S                            |   4 +-
 arch/riscv/kernel/process.c                        | 154 ++++++++++
 arch/riscv/kernel/ptrace.c                         |  42 +++
 arch/riscv/kernel/setup.c                          |  37 +++
 arch/riscv/kernel/smpboot.c                        |   2 -
 arch/riscv/kernel/suspend.c                        |   4 +-
 arch/riscv/kernel/sys_hwprobe.c                    |  44 +++
 arch/riscv/kernel/traps_misaligned.c               | 139 ++++++++-
 arch/riscv/kernel/unaligned_access_speed.c         | 156 +++++++++-
 arch/riscv/kernel/vdso/Makefile                    |  10 +-
 arch/riscv/kernel/vec-copy-unaligned.S             |  58 ++++
 arch/riscv/kernel/vector.c                         |   2 +-
 arch/riscv/kvm/vcpu_onereg.c                       |   4 +
 drivers/cpuidle/cpuidle-riscv-sbi.c                |  11 +-
 include/asm-generic/qspinlock.h                    |   2 +
 include/asm-generic/spinlock.h                     |  87 +-----
 include/asm-generic/spinlock_types.h               |  12 +-
 include/asm-generic/ticket_spinlock.h              | 105 +++++++
 include/uapi/linux/elf.h                           |   1 +
 include/uapi/linux/prctl.h                         |   5 +-
 tools/testing/selftests/kvm/riscv/get-reg-list.c   |   8 +
 tools/testing/selftests/riscv/Makefile             |   2 +-
 tools/testing/selftests/riscv/abi/.gitignore       |   1 +
 tools/testing/selftests/riscv/abi/Makefile         |  10 +
 .../testing/selftests/riscv/abi/pointer_masking.c  | 332 +++++++++++++++++++++
 53 files changed, 1790 insertions(+), 282 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpufeature-macros.h
 create mode 100644 arch/riscv/include/asm/spinlock.h
 create mode 100644 arch/riscv/kernel/vec-copy-unaligned.S
 create mode 100644 include/asm-generic/ticket_spinlock.h
 create mode 100644 tools/testing/selftests/riscv/abi/.gitignore
 create mode 100644 tools/testing/selftests/riscv/abi/Makefile
 create mode 100644 tools/testing/selftests/riscv/abi/pointer_masking.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
