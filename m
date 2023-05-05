Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B837C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 May 2023 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4HE/8QD1lK7dmqrPMcQVhPFTP9v3jr1e9B4QK6sv+LY=; b=2UP+BDz7cKOG8g
	YyDbvuf6OuXutrXC20OKYlSbJ8f5N3LfAs+ZDLBPagcY/kZB+U0x/GgbHp5QAFviwEtmoc7N7GDyl
	RhGNeU4piW2CCK3MNg45Cn5lF8ghLkiRG2Ln8aDVPybTV+gQ97OEXyK6jJt29/WjBrBVLG09V3wse
	2909MoYt+Q86dXFlLYQOXbgbsKGFAo5vEOSC3H8yAAcmKBxg6V/59AUlCTyPZssJMMqm1mBsuO9ph
	bz9kBRzaUtyQbepb5As1iWs0je3/U+i6HQf5Iug+PklKUikfnHF9Oc7JxExunOhlPpe/jvLte5NzX
	2W2JOAtWXGvNVlQMhh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puxBX-00BAaP-1I;
	Fri, 05 May 2023 15:17:27 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puxBU-00BAXS-0C
	for linux-riscv@lists.infradead.org;
	Fri, 05 May 2023 15:17:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1ab14cb3aaeso13533385ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 05 May 2023 08:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683299818; x=1685891818;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi8+DAICG+vLed8EX1L1dnfC/iwc4xCORjv2QSx+NJA=;
        b=kO1JPibf9QW516FD2BzxOrngO/w7aYSfXQt7QmWzO2apTEQFSz+MhWyeVOl0qbLlfa
         9p5jKCNOx4amvNI97/HGFQWuM6iiINeEKVg2Micw3fd/Hs5aXiHBCCnsJuyvYt70CNxa
         jgsGmPGt4SFbpeBQWXeCq9X2l55T+Vx+/PXbUdayC4OQPeS49xJjtE3s56QMjb3umRCc
         d1wSsLqIc8DZFgmS4ptdiB+ShTF9RgjvfnrwBCLLhaV6x9GCzO8KjoV2HE4QteY4BaHY
         OkXYnZQb8c0QRoFFHOEoaAAQ2OW0Pve8u69/ROTsyNnsC1qMKVMly+yfW9YegKa1T19g
         vANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683299818; x=1685891818;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qi8+DAICG+vLed8EX1L1dnfC/iwc4xCORjv2QSx+NJA=;
        b=CHaib9HA171RQFl9UE/sAeZf+pxuSLgksnWIUz0vNunt7Xtd8sH3z8GZCVeXU3Jm+E
         edbm5rKTMW7uHoQG5xF/rymuup4vpA1jBIfTidC7Nq382U8N7ClvFGxXR67ggKZvkX+h
         +donV30W10rthfW9xZ9FtlYYzmmjbqx2jsBRMGpU/jjIdscCd86ha63/MLQNmYlOfp6o
         jkfHzZoB+PKxiXNkKZBS/yvL7piaWK+190k2VgGsEhiaOAA4RJyzZ3ek3+Kigdmskfgf
         iP3liBCwmk+NysXO9p8cG7qyfeFDL5Kkpt1qrq2WKaeG3A8C80v1hqwj4HLW94TydL+d
         6g5Q==
X-Gm-Message-State: AC+VfDybeBZJ4O2vxJYy3TAZ64aicNgcPu2Cry1Kgra95MJkARjEJx/8
	UoCNWULn9cIl0Cjmm6nBODwGcYdJetPUumj9xWg=
X-Google-Smtp-Source: ACHHUZ4OI5DVZy+77TbEw9EWcc14OKqfvOF/eStREFMp4pPfbvAZTIU+QvE9KAYe7uHT7Re3OVPLOQ==
X-Received: by 2002:a17:903:1c8:b0:1a6:f5d5:b809 with SMTP id e8-20020a17090301c800b001a6f5d5b809mr2314752plh.1.1683299818395;
        Fri, 05 May 2023 08:16:58 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id f2-20020a17090a8e8200b0025043a8185dsm27pjo.23.2023.05.05.08.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:16:58 -0700 (PDT)
Date: Fri, 05 May 2023 08:16:58 -0700 (PDT)
X-Google-Original-Date: Fri, 05 May 2023 08:15:15 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.4 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-b783c0bb-3d23-4767-9c69-a39f805a8544@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_081724_096277_E924C439 
X-CRM114-Status: GOOD (  12.83  )
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

merged tag 'riscv-for-linus-6.4-mw1'
The following changes since commit 89d77f71f493a3663b10fa812d17f472935d24be:

  Merge tag 'riscv-for-linus-6.4-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2023-04-28 16:55:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.4-mw2

for you to fetch changes up to c2d3c8441e3ddbfe41fea9282ddc6ee372e154cd:

  RISC-V: include cpufeature.h in cpufeature.c (2023-05-01 17:19:27 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.4 Merge Window, Part 2

* Support for hibernation.
* .rela.dyn has been moved to init.
* A fix for the SBI probing to allow for implementation-defined
  behavior.
* Various other fixes and cleanups throughout the tree.

----------------------------------------------------------------
There are still a few minor build issues with drivers, but patches are on the
lists.  Aside from that things look good with a merge from Linus' master as of
last night, I've got another test running now but I don't see anything scary.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Move .rela.dyn to the init sections

Andrew Jones (1):
      RISC-V: Align SBI probe implementation with spec

Conor Dooley (3):
      RISC-V: fixup in-flight collision with ARCH_WANT_OPTIMIZE_VMEMMAP rename
      dt-bindings: riscv: explicitly mention assumption of Zicsr & Zifencei support
      RISC-V: include cpufeature.h in cpufeature.c

Guo Ren (1):
      riscv: compat_syscall_table: Fixup compile warning

Nathan Chancellor (1):
      riscv: Adjust dependencies of HAVE_DYNAMIC_FTRACE selection

Palmer Dabbelt (1):
      Merge patch series "RISC-V Hibernation Support"

Randy Dunlap (1):
      RISC-V: fix sifive and thead section mismatches in errata

Sia Jee Heng (4):
      RISC-V: Change suspend_save_csrs and suspend_restore_csrs to public function
      RISC-V: Factor out common code of __cpu_resume_enter()
      RISC-V: mm: Enable huge page support to kernel_page_present() function
      RISC-V: Add arch functions to support hibernation/suspend-to-disk

Song Shuai (1):
      riscv: mm: remove redundant parameter of create_fdt_early_page_table

 Documentation/devicetree/bindings/riscv/cpus.yaml |   6 +
 arch/riscv/Kconfig                                |  23 +-
 arch/riscv/errata/sifive/errata.c                 |   8 +-
 arch/riscv/errata/thead/errata.c                  |   6 +-
 arch/riscv/include/asm/assembler.h                |  82 +++++
 arch/riscv/include/asm/sbi.h                      |   2 +-
 arch/riscv/include/asm/suspend.h                  |  22 ++
 arch/riscv/kernel/Makefile                        |   2 +
 arch/riscv/kernel/asm-offsets.c                   |   5 +
 arch/riscv/kernel/cpu_ops.c                       |   2 +-
 arch/riscv/kernel/cpufeature.c                    |   1 +
 arch/riscv/kernel/hibernate-asm.S                 |  77 ++++
 arch/riscv/kernel/hibernate.c                     | 427 ++++++++++++++++++++++
 arch/riscv/kernel/sbi.c                           |  17 +-
 arch/riscv/kernel/suspend.c                       |   4 +-
 arch/riscv/kernel/suspend_entry.S                 |  34 +-
 arch/riscv/kernel/vmlinux.lds.S                   |  12 +-
 arch/riscv/kvm/main.c                             |   2 +-
 arch/riscv/mm/init.c                              |   6 +-
 arch/riscv/mm/pageattr.c                          |   8 +
 drivers/cpuidle/cpuidle-riscv-sbi.c               |   2 +-
 drivers/perf/riscv_pmu_sbi.c                      |   2 +-
 22 files changed, 682 insertions(+), 68 deletions(-)
 create mode 100644 arch/riscv/include/asm/assembler.h
 create mode 100644 arch/riscv/kernel/hibernate-asm.S
 create mode 100644 arch/riscv/kernel/hibernate.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
