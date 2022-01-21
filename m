Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DCCC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 17:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ADMWeKyWWCDtwxb8x/HklC6LxESb11JQhG/DUdlopCA=; b=OWfLZRN+rNVtXg
	Z7gf/zj9nRHFOlHlZFMfIN/55J573ASuYSoe34IX9bQCP/iS64AFKTrYFxcmvUunz6m0HvdyeYDsH
	ItO5mcDjQkHx1rUYBnGH23pEm9prBBOVzgMm0ktrBNqnOBKMlVTJqncfwiDdRIw3zSsM1Fyy2d6kV
	gAWMDJJVX22M1+Wl3ze6bbtTvF597AG5B9WmCmS5BOrCEGKLyAZop5bxEbQr61qZvavz+bEHeCnxA
	6nRoldVH5ftZ9SZZmFxQA9qaDqpfuzJQlJ/IXpa5jVg2tIPEp7RJ12WsWvQ/AhS4r72PIfOP40kf0
	ankwWa7SRS7V4g4GwJmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAxRX-00FfBp-EG; Fri, 21 Jan 2022 17:11:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAxRU-00FfAz-AJ
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 17:11:18 +0000
Received: by mail-pg1-x533.google.com with SMTP id f8so8651436pgf.8
 for <linux-riscv@lists.infradead.org>; Fri, 21 Jan 2022 09:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:cc:from:to:message-id;
 bh=EkBKAb+fz4ftZ/Li4vejfF8DFA5HVNha2levh2DSsDE=;
 b=E1B3yU2XhsTV6T3+2v/yBaqbIOP/h99KnFXDbNiZn6f6tAjHj+mlUK203rl81TCNtB
 9ESbgnl0nsvJ9+JZvgjeTosy/oCAnu42nip2nzjcn5MuayggY1BEvXy8e3TBW60ZBWlW
 Uk89fFDNDPzyXtVMqbL7funftDCghihHlBeA2nuL/hNmp27ulGYEDAScHZGzq5FqI5/X
 9/bZl7vaQU9bf+kKxd9OLfbPksdtcYx2TB48qRHh5/NvtgQI9HP5XtL5CESgmn+J1rdp
 lhuBfxcxSD3ifAn381JyY9nv69Oq8GjgZc9ez9xyQjQdUMrvpHSCegd3/gKFBN89Bdil
 fVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=EkBKAb+fz4ftZ/Li4vejfF8DFA5HVNha2levh2DSsDE=;
 b=zeD2nFtylKj/RkZRg8+mCq24OvHc+RcyhSCfgzxOYR96OJeJRd0NjBSFu8MEKVc7ab
 r13KVBDpn2hJWrs3DWrf0+gXWSFwcEBIDofFHzRG63JCcvzA8vQrykRAcVz83zesQXCt
 SCCLc68+7d9npmzpBbyRBCKmHveUSxe1wNyOdCWRa7p1al7VFyx75lCYeHUfoUNu+2D1
 CCwHvD27ycqN4la1apcoGYSx7c3UoaEZ7ODC9RqdyPIH7HSlLUHYzW6H/4kfVYJSgypD
 WCxiUGXdgvWqKv4QyCazJeXZPhgp+OhlvoAhW+Eb7BSSmpB4y3pMe0wimMn2S1eSljYL
 ukOA==
X-Gm-Message-State: AOAM531vK5zMUBV8vEvcybOeWRQAZpMi7U8oEsU7FVN/nmfHleOkIV/V
 /vQti8NnmCDqyKMwnJP/W6UTzQxNWZoZVA==
X-Google-Smtp-Source: ABdhPJwpZ89rbtvTV6MDhqBZj7XeB4HRo7yT0fbPqjK4J91buwa3Ffy5Ygz5lM3HQGuKSK8+8qLAYg==
X-Received: by 2002:a05:6a00:2487:b0:4bc:315d:21f4 with SMTP id
 c7-20020a056a00248700b004bc315d21f4mr4360065pfv.55.1642785075000; 
 Fri, 21 Jan 2022 09:11:15 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id v36sm5330804pgk.81.2022.01.21.09.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 09:11:14 -0800 (PST)
Date: Fri, 21 Jan 2022 09:11:14 -0800 (PST)
X-Google-Original-Date: Fri, 21 Jan 2022 09:10:29 PST (-0800)
Subject: [GIT PULL] RISC-V Patches for the 5.17 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c8a6625a-625b-420a-9399-f69d027a43ea@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_091116_430537_09DD7085 
X-CRM114-Status: GOOD (  16.94  )
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

The following changes since commit f1b744f65e2f9682347c5faf6377e61e2ab19a67:

  Merge tag 'riscv-for-linus-5.17-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-01-19 11:38:21 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.17-mw1

for you to fetch changes up to c59cd507fb640c2acc6b07cb60d7f765839e18c7:

  RISC-V: nommu_virt: Drop unused SLAB_MERGE_DEFAULT (2022-01-20 12:48:14 -0800)

----------------------------------------------------------------
RISC-V Patches for the 5.17 Merge Window, Part 2

* Support for sv48 paging.
* Hart ID mappings are now sparse, which enables more CPUs to come up on
  systems with sparse hart IDs.
* A handful of cleanups and fixes.

---
The sv48 patch set is a bit intrusive for something this late, but given that
it's being shown to fix some hangs it's seems better to take it now rather than
waiting.

I had no merge conflicts.

I'm not planning on submitting another PR for the merge window.

----------------------------------------------------------------
Alexandre Ghiti (9):
      riscv: Get rid of MAXPHYSMEM configs
      riscv: Move KASAN mapping next to the kernel mapping
      riscv: Split early kasan mapping to prepare sv48 introduction
      riscv: Introduce functions to switch pt_ops
      riscv: Allow to dynamically define VA_BITS
      asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
      riscv: Implement sv48 support
      riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
      riscv: Explicit comment about user virtual address space size

Atish Patra (6):
      RISC-V: Avoid using per cpu array for ordered booting
      RISC-V: Do not print the SBI version during HSM extension boot print
      RISC-V: Use __cpu_up_stack/task_pointer only for spinwait method
      RISC-V: Move the entire hart selection via lottery to SMP
      RISC-V: Move spinwait booting method to its own config
      RISC-V: Do not use cpumask data structure for hartid bitmap

Heinrich Schuchardt (1):
      riscv: default to CONFIG_RISCV_SBI_V01=n

Jisheng Zhang (6):
      riscv: mm: init: remove unnecessary "#ifdef CONFIG_CRASH_DUMP"
      riscv: mm: init: try best to use IS_ENABLED(CONFIG_64BIT) instead of #ifdef
      riscv: mm: init: remove _pt_ops and use pt_ops directly
      riscv: mm: init: try IS_ENABLED(CONFIG_XIP_KERNEL) instead of #ifdef
      riscv: mm: init: try best to remove #ifdef CONFIG_XIP_KERNEL usage
      riscv: bpf: Fix eBPF's exception tables

Lukas Bulwahn (1):
      riscv: canaan: remove useless select of non-existing config SYSCON

Minghao Chi (1):
      RISC-V: Remove redundant err variable

Palmer Dabbelt (2):
      RISC-V: Introduce sv48 support without relocatable kernel
      RISC-V: nommu_virt: Drop unused SLAB_MERGE_DEFAULT

Ron Economos (1):
      riscv: dts: sifive unmatched: Add gpio poweroff

kernel test robot (1):
      riscv: fix boolconv.cocci warnings

 Documentation/riscv/vm-layout.rst                  |  12 +-
 arch/riscv/Kconfig                                 |  52 +--
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts |   5 +
 arch/riscv/configs/nommu_k210_defconfig            |   1 -
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |   1 -
 arch/riscv/configs/nommu_virt_defconfig            |   2 -
 arch/riscv/include/asm/cpu_ops.h                   |   2 -
 arch/riscv/include/asm/cpu_ops_sbi.h               |  25 ++
 arch/riscv/include/asm/csr.h                       |   3 +-
 arch/riscv/include/asm/fixmap.h                    |   1 +
 arch/riscv/include/asm/kasan.h                     |  11 +-
 arch/riscv/include/asm/page.h                      |  16 +-
 arch/riscv/include/asm/pgalloc.h                   |  40 +++
 arch/riscv/include/asm/pgtable-64.h                | 108 +++++-
 arch/riscv/include/asm/pgtable.h                   |  65 +++-
 arch/riscv/include/asm/sbi.h                       |  19 +-
 arch/riscv/include/asm/smp.h                       |   2 -
 arch/riscv/include/asm/sparsemem.h                 |   6 +-
 arch/riscv/kernel/Makefile                         |   3 +-
 arch/riscv/kernel/asm-offsets.c                    |   3 +
 arch/riscv/kernel/cpu.c                            |  23 +-
 arch/riscv/kernel/cpu_ops.c                        |  26 +-
 arch/riscv/kernel/cpu_ops_sbi.c                    |  26 +-
 arch/riscv/kernel/cpu_ops_spinwait.c               |  27 +-
 arch/riscv/kernel/head.S                           |  38 ++-
 arch/riscv/kernel/head.h                           |   6 +-
 arch/riscv/kernel/ptrace.c                         |   4 +-
 arch/riscv/kernel/sbi.c                            | 189 ++++++-----
 arch/riscv/kernel/setup.c                          |  10 -
 arch/riscv/kernel/smpboot.c                        |   2 +-
 arch/riscv/kvm/mmu.c                               |   4 +-
 arch/riscv/kvm/vcpu_sbi_replace.c                  |  11 +-
 arch/riscv/kvm/vcpu_sbi_v01.c                      |  11 +-
 arch/riscv/kvm/vmid.c                              |   4 +-
 arch/riscv/mm/cacheflush.c                         |   5 +-
 arch/riscv/mm/context.c                            |   4 +-
 arch/riscv/mm/init.c                               | 378 +++++++++++++++------
 arch/riscv/mm/kasan_init.c                         | 248 ++++++++++----
 arch/riscv/mm/tlbflush.c                           |   9 +-
 arch/riscv/net/bpf_jit_comp64.c                    |   2 +-
 drivers/firmware/efi/libstub/efi-stub.c            |   2 +
 drivers/soc/canaan/Kconfig                         |   1 -
 include/asm-generic/pgalloc.h                      |  24 +-
 43 files changed, 1006 insertions(+), 425 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
