Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EA8EEE272
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dzTCsHmkrpcLwwGq2zwuzDbngd1s65AIrzp2uQ2oa4c=; b=oyKaR65EcPf4nm
	DVN1V1fCKYNeCC7jAb3dupbHUyleKm9ncCv+DJ15jcIaPtRovX7YtWhNiIsZ8agpDnbV0VbOUK9nh
	RLJaBsQfFCPTTJqGYrTWJVoiid4MuA+BclMw7pcTbJY2AegHHUPXLJ8vfKxB2gfQ0ii++/lS6POzM
	yZvW1i94E+5zeNt2qVPkoEW6N0E1oBtsevoxAPxeevjJ8OT/cNic0gDPOOU55PqUeFdhN9DxvNg6g
	BttHVly46qWF++IyoKos9eniIQh9T6Lb5mjpywWYc9BI2ex8KBp3Ng7wgRchABw1ftXzftAbatl41
	SPO/+UNZCEoTz7mtwCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot3n-0000000EQqT-1mGy;
	Thu, 12 Sep 2024 23:17:11 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sot3j-0000000EQpD-18mM
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:17:08 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2da4ea59658so337282a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726183026; x=1726787826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=riewyPvOkd6+yywyzaWDXE1UC6COJKG1le8303PRl2M=;
        b=fIkvtyxi/XnEoeYzRSfOLDWyVfueLVRGa17bmeCfB2z3CBmbSsgKKvgZmfjSXFjMYC
         idap5CfEofViuX92CwejQyce9Ww8KvXzn/TIGKfyb7tzR8LvM0+EVjZYOW4xH3DWZad8
         ktjaEOAvot1YGvYycE6FhUW8Ph1qdKksAk8bAJdnk2Ry+WUjFFvxfJa1POR1AYqTuIQG
         XQuCJpCwgB/OnM1GmV1jevZX4n5CMw9CiY7H8f18TgWjilcxTXHJ8XVo+kCuXPl+CQcY
         L1UypbWc5C55l9YWKFiHlUuYxurthPXhDfR/eJ7Hxw01u2DBu8RqPfK32wtSEukCLal/
         dFNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726183026; x=1726787826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=riewyPvOkd6+yywyzaWDXE1UC6COJKG1le8303PRl2M=;
        b=wsuBtsJP2RngYkhLOtDgd/gCGV0rohbMnNHFyA4ofxmWzpRk0LJtHDlrk88HhJv7z+
         45id8Oz650xlMeHwraUI2WzuwimFAgA5aMnvx5fPRPxMFpRdHh//v3p+vzSfgtFutMPf
         XV1ogU0MJkMavJwfJVXCyv7/dWwh9IkhMMPi0Jfnfm6uZCCI0ro+qyUk2JC01iey385a
         qXNRYrqAOcpgZO3jiCJUAA3DTlsLsbN0YlV9qtRV2147gLyOsvGfv5FcJmOY4viuAyU9
         tseuUs6wPTvn/jPbDfCRjnS8tGpjU6Fi+detyfQccPnRpJzYSMh575TDdBH9s6keF+qo
         N5oQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAjt8UgINjFMNHHnOORrZFoxs7bf8yC8CdcqYBRb5UKjjtB1B+24PY8FmcLnGu96bgoANWEzHMHDXmOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbqjyAF9KUX+X0gezRyh7psUvQbe89O+Fe3FjVEgvCe9XXlUU2
	LZdeEuKjv5RebutTZxgfzJ/AcPs7FzXxRkhqQEXy/v4ABSfHGOHFxypTuluUvuo=
X-Google-Smtp-Source: AGHT+IG3UlKSJNA+0+xwU2A+yWN3j878ej9hqq8AW6JPwgouwb7JofjBAbMeGmJ3FwYyI2jaMifNow==
X-Received: by 2002:a17:90b:4f91:b0:2d3:cd27:c480 with SMTP id 98e67ed59e1d1-2dbb9f7d558mr1060297a91.33.1726183025514;
        Thu, 12 Sep 2024 16:17:05 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db6c1ac69asm3157591a91.0.2024.09.12.16.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:17:05 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
To: paul.walmsley@sifive.com,
	palmer@sifive.com,
	conor@kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 00/30] riscv control-flow integrity for usermode
Date: Thu, 12 Sep 2024 16:16:19 -0700
Message-ID: <20240912231650.3740732-1-debug@rivosinc.com>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_161707_345902_D4F0E556 
X-CRM114-Status: GOOD (  18.98  )
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
Cc: quic_zhonhan@quicinc.com, zong.li@sifive.com, zev@bewilderbeest.net, david@redhat.com, peterz@infradead.org, catalin.marinas@arm.com, broonie@kernel.org, dave.hansen@linux.intel.com, atishp@rivosinc.com, bjorn@rivosinc.com, namcaov@gmail.com, usama.anjum@collabora.com, guoren@kernel.org, alx@kernel.org, jszhang@kernel.org, hpa@zytor.com, puranjay@kernel.org, shuah@kernel.org, sorear@fastmail.com, costa.shul@redhat.com, robh@kernel.org, antonb@tenstorrent.com, quic_bjorande@quicinc.com, lorenzo.stoakes@oracle.com, corbet@lwn.net, dawei.li@shingroup.cn, anup@brainfault.org, deller@gmx.de, x86@kernel.org, andrii@kernel.org, willy@infradead.org, kees@kernel.org, mingo@redhat.com, libang.li@antgroup.com, samitolvanen@google.com, greentime.hu@sifive.com, osalvador@suse.de, ajones@ventanamicro.com, revest@chromium.org, ancientmodern4@gmail.com, aou@eecs.berkeley.edu, jerry.shih@sifive.com, alexghiti@rivosinc.com, arnd@arndb.de, yang.lee@linux.alibaba.com, charlie@rivosinc.com, bgray@linux.ibm.com, Liam.Howlett@oracle.com, leobras@redhat.com, songshuaishuai@tinylab.org, xiao.w.wang@intel.com, bp@alien8.de, cuiyunhui@bytedance.com, mchitale@ventanamicro.com, cleger@rivosinc.com, tglx@linutronix.de, krzk+dt@kernel.org, vbabka@suse.cz, debug@rivosinc.com, brauner@kernel.org, bhe@redhat.com, ke.zhao@shingroup.cn, oleg@redhat.com, samuel.holland@sifive.com, ben.dooks@codethink.co.uk, evan@rivosinc.com, palmer@dabbelt.com, ebiederm@xmission.com, andy.chiu@sifive.com, schwab@suse.de, akpm@linux-foundation.org, sameo@rivosinc.com, tanzhasanwork@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

v4 for cpu assisted riscv user mode control flow integrity.
zicfiss and zicfilp [1] are ratified riscv CPU extensions.

v3 [2] was sent in April this year for riscv usermode control
flow integrity enabling.

To get more information on zicfilp and zicfiss riscv CPU extensions,
patch series adds documentation for `zicfilp` and `zicfiss`
Documentation/arch/riscv/zicfiss.rst
Documentation/arch/riscv/zicfilp.rst

Additionally, spec can be obtained from [1].

How to test this series
=======================

Toolchain
---------
$ git clone git@github.com:sifive/riscv-gnu-toolchain.git -b cfi-dev
$ riscv-gnu-toolchain/configure --prefix=<path-to-where-to-build> --with-arch=rv64gc_zicfilp_zicfiss --enable-linux --disable-gdb  --with-extra-multilib-test="rv64gc_zicfilp_zicfiss-lp64d:-static"
$ make -j$(nproc)

Qemu
----
$ git clone git@github.com:deepak0414/qemu.git -b zicfilp_zicfiss_ratified_master_july11
$ cd qemu
$ mkdir build
$ cd build
$ ../configure --target-list=riscv64-softmmu
$ make -j$(nproc)

Opensbi
-------
$ git clone git@github.com:deepak0414/opensbi.git -b cfi_spec_split_opensbi
$ make CROSS_COMPILE=<your riscv toolchain> -j$(nproc) PLATFORM=generic

Linux
-----
Running defconfig is fine. CFI is enabled by default if the toolchain
supports it.

$ make ARCH=riscv CROSS_COMPILE=<path-to-cfi-riscv-gnu-toolchain>/build/bin/riscv64-unknown-linux-gnu- -j$(nproc) defconfig
$ make ARCH=riscv CROSS_COMPILE=<path-to-cfi-riscv-gnu-toolchain>/build/bin/riscv64-unknown-linux-gnu- -j$(nproc)

Running
-------

Modify your qemu command to have:
-bios <path-to-cfi-opensbi>/build/platform/generic/firmware/fw_dynamic.bin
-cpu rv64,zicfilp=true,zicfiss=true,zimop=true,zcmop=true


vDSO related Opens (in the flux)
=================================

I am listing these opens for laying out plan and what to expect in future
patch sets. And of course for the sake of discussion.

Shadow stack and landing pad enabling in vDSO
----------------------------------------------
vDSO must have shadow stack and landing pad support compiled in for task
to have shadow stack and landing pad support. This patch series doesn't
enable that (yet). Enabling shadow stack support in vDSO should be
straight forward (intend to do that in next versions of patch set). Enabling
landing pad support in vDSO requires some collaboration with toolchain folks
to follow a single label scheme for all object binaries. This is necessary to
ensure that all indirect call-sites are setting correct label and target landing
pads are decorated with same label scheme.


How many vDSOs
---------------
Shadow stack instructions are carved out of zimop (may be operations) and if CPU
doesn't implement zimop, they're illegal instructions. Kernel could be running on
a CPU which may or may not implement zimop. And thus kernel will have to carry 2
different vDSOs and expose the appropriate one depending on whether CPU implements
zimop or not.

[1] - https://github.com/riscv/riscv-cfi
[2] - https://lore.kernel.org/lkml/20240403234054.2020347-1-debug@rivosinc.com/

---
changelog
---------

v4
--
- rebased on 6.11-rc6
- envcfg: Converged with Samuel Holland's patches for envcfg management on per-
thread basis.
- vma_is_shadow_stack is renamed to is_vma_shadow_stack
- picked up Mark Brown's `ARCH_HAS_USER_SHADOW_STACK` patch
- signal context: using extended context management to maintain compatibility.
- fixed `-Wmissing-prototypes` compiler warnings for prctl functions
- Documentation fixes and amending typos.

v3
--
envcfg:
logic to pick up base envcfg had a bug where `ENVCFG_CBZE` could have been
picked on per task basis, even though CPU didn't implement it. Fixed in
this series.

dt-bindings:
As suggested, split into separate commit. fixed the messaging that spec is
in public review

arch_is_shadow_stack change:
arch_is_shadow_stack changed to vma_is_shadow_stack

hwprobe:
zicfiss / zicfilp if present will get enumerated in hwprobe

selftests:
As suggested, added object and binary filenames to .gitignore
Selftest binary anyways need to be compiled with cfi enabled compiler which
will make sure that landing pad and shadow stack are enabled. Thus removed
separate enable/disable tests. Cleaned up tests a bit.

v2
--

- Using config `CONFIG_RISCV_USER_CFI`, kernel support for riscv control flow
integrity for user mode programs can be compiled in the kernel.

- Enabling of control flow integrity for user programs is left to user runtime

- This patch series introduces arch agnostic `prctls` to enable shadow stack
and indirect branch tracking. And implements them on riscv.

Deepak Gupta (25):
  mm: helper `is_shadow_stack_vma` to check shadow stack vma
  riscv/Kconfig: enable HAVE_EXIT_THREAD for riscv
  riscv: zicfilp / zicfiss in dt-bindings (extensions.yaml)
  riscv: zicfiss / zicfilp enumeration
  riscv: zicfiss / zicfilp extension csr and bit definitions
  riscv: usercfi state for task and save/restore of CSR_SSP on trap
    entry/exit
  riscv/mm : ensure PROT_WRITE leads to VM_READ | VM_WRITE
  riscv mm: manufacture shadow stack pte
  riscv mmu: teach pte_mkwrite to manufacture shadow stack PTEs
  riscv mmu: write protect and shadow stack
  riscv/mm: Implement map_shadow_stack() syscall
  riscv/shstk: If needed allocate a new shadow stack on clone
  prctl: arch-agnostic prctl for indirect branch tracking
  riscv: Implements arch agnostic shadow stack prctls
  riscv: Implements arch agnostic indirect branch tracking prctls
  riscv/traps: Introduce software check exception
  riscv sigcontext: cfi state struct definition for sigcontext
  riscv signal: save and restore of shadow stack for signal
  riscv/kernel: update __show_regs to print shadow stack register
  riscv/ptrace: riscv cfi status and state via ptrace and in core files
  riscv/hwprobe: zicfilp / zicfiss enumeration in hwprobe
  riscv: create a config for shadow stack and landing pad instr support
  riscv: Documentation for landing pad / indirect branch tracking
  riscv: Documentation for shadow stack on riscv
  kselftest/riscv: kselftest for user mode cfi

Mark Brown (2):
  mm: Introduce ARCH_HAS_USER_SHADOW_STACK
  prctl: arch-agnostic prctl for shadow stack

Samuel Holland (3):
  riscv: Enable cbo.zero only when all harts support Zicboz
  riscv: Add support for per-thread envcfg CSR values
  riscv: Call riscv_user_isa_enable() only on the boot hart

 Documentation/arch/riscv/zicfilp.rst          | 104 ++++
 Documentation/arch/riscv/zicfiss.rst          | 169 ++++++
 .../devicetree/bindings/riscv/extensions.yaml |  12 +
 arch/riscv/Kconfig                            |  20 +
 arch/riscv/include/asm/asm-prototypes.h       |   1 +
 arch/riscv/include/asm/cpufeature.h           |  15 +-
 arch/riscv/include/asm/csr.h                  |  16 +
 arch/riscv/include/asm/entry-common.h         |   2 +
 arch/riscv/include/asm/hwcap.h                |   2 +
 arch/riscv/include/asm/mman.h                 |  24 +
 arch/riscv/include/asm/pgtable.h              |  30 +-
 arch/riscv/include/asm/processor.h            |   2 +
 arch/riscv/include/asm/switch_to.h            |   8 +
 arch/riscv/include/asm/thread_info.h          |   4 +
 arch/riscv/include/asm/usercfi.h              | 142 +++++
 arch/riscv/include/uapi/asm/hwprobe.h         |   2 +
 arch/riscv/include/uapi/asm/ptrace.h          |  18 +
 arch/riscv/include/uapi/asm/sigcontext.h      |   3 +
 arch/riscv/kernel/Makefile                    |   2 +
 arch/riscv/kernel/asm-offsets.c               |   4 +
 arch/riscv/kernel/cpufeature.c                |  13 +-
 arch/riscv/kernel/entry.S                     |  29 +
 arch/riscv/kernel/process.c                   |  32 +-
 arch/riscv/kernel/ptrace.c                    |  83 +++
 arch/riscv/kernel/signal.c                    |  62 ++-
 arch/riscv/kernel/smpboot.c                   |   2 -
 arch/riscv/kernel/suspend.c                   |   4 +-
 arch/riscv/kernel/sys_hwprobe.c               |   2 +
 arch/riscv/kernel/sys_riscv.c                 |  10 +
 arch/riscv/kernel/traps.c                     |  38 ++
 arch/riscv/kernel/usercfi.c                   | 506 ++++++++++++++++++
 arch/riscv/mm/init.c                          |   2 +-
 arch/riscv/mm/pgtable.c                       |  17 +
 arch/x86/Kconfig                              |   1 +
 fs/proc/task_mmu.c                            |   2 +-
 include/linux/cpu.h                           |   4 +
 include/linux/mm.h                            |  12 +-
 include/uapi/asm-generic/mman.h               |   1 +
 include/uapi/linux/elf.h                      |   1 +
 include/uapi/linux/prctl.h                    |  48 ++
 kernel/sys.c                                  |  60 +++
 mm/Kconfig                                    |   6 +
 mm/gup.c                                      |   2 +-
 mm/internal.h                                 |   2 +-
 mm/mmap.c                                     |   1 +
 tools/testing/selftests/riscv/Makefile        |   2 +-
 tools/testing/selftests/riscv/cfi/.gitignore  |   3 +
 tools/testing/selftests/riscv/cfi/Makefile    |  10 +
 .../testing/selftests/riscv/cfi/cfi_rv_test.h |  83 +++
 .../selftests/riscv/cfi/riscv_cfi_test.c      |  82 +++
 .../testing/selftests/riscv/cfi/shadowstack.c | 362 +++++++++++++
 .../testing/selftests/riscv/cfi/shadowstack.h |  37 ++
 52 files changed, 2079 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/arch/riscv/zicfilp.rst
 create mode 100644 Documentation/arch/riscv/zicfiss.rst
 create mode 100644 arch/riscv/include/asm/mman.h
 create mode 100644 arch/riscv/include/asm/usercfi.h
 create mode 100644 arch/riscv/kernel/usercfi.c
 create mode 100644 tools/testing/selftests/riscv/cfi/.gitignore
 create mode 100644 tools/testing/selftests/riscv/cfi/Makefile
 create mode 100644 tools/testing/selftests/riscv/cfi/cfi_rv_test.h
 create mode 100644 tools/testing/selftests/riscv/cfi/riscv_cfi_test.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shadowstack.c
 create mode 100644 tools/testing/selftests/riscv/cfi/shadowstack.h

-- 
2.45.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
