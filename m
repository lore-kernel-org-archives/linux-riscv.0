Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6086CC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 16:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sofZ1DWRZWDmrfn6ebIEEd64efqK5UJiJV72VGxm1PY=; b=lXnGV6JVRm2mnO
	3NIVTYwVIRHTN/e1j/f9jsf2lkX/2Z2cJAexvnTLKDwHqCB8ACm7srm4EvB4IOl46A3ocBYGSE92j
	J7llDwepyZ6zwVwPbjXEHtF/usSFYInpouFLB/nbZH7/02UBBFGPxrtY0zH3NC1IQrpWXXfYDohSN
	WPPdM6W4Npgr2jJwhTNIJLwMlE8MZM3sGiQxCY5e+ST0YPXo6zevUOu3AfA15bRy2msRrRuRkAppZ
	iZ7kGNCF7W2VnfV30J/r9eCSyatALu13iJnEiV5sPXRpPJhhmhXd92r8WYZhxK/dELIG8mm8I/Wc7
	NjTDSvKOgbMrJkWHGYew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNg0-00FO3Y-Ai; Fri, 14 Oct 2022 16:36:48 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNf1-00FNWK-E3
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 16:35:49 +0000
Received: by mail-pj1-x1031.google.com with SMTP id p3-20020a17090a284300b0020a85fa3ffcso8387950pjf.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Oct 2022 09:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FtNNlXIYPSXjux0nsb6BrW6Ap/y15OPYKh7ad1Ei0iY=;
        b=y1GEA5glgSmw7Knc4lyosZI8DK/GpwKkRnfTvqWTVxA5z8EEmlXE2oILkB5pRd2oAU
         AbIbegTyzoO4q5ab60BEvnfxXwfZasMb9cIER0JY1EoH0PpEefqBItQVNEZlj1zjHh5m
         OmoFlCI+tmyWJFeMoJYw984IwDezCFtjPYkRQ1b9xeZ5fnN+uNivuJhXjNxThV05TeiN
         UaIB0QCFnPgSyGLVKhE+uDouljTcX3tJoly0nsk0kVIqS/7Rn1Uz0SWWPcVlKah+YFyD
         fJDn9c6A+yar88l1JtvRFZqBsL0HmY8xx2Lb2uew6vNxgimkVIdOHnAYEaBgeM6kfPAn
         H1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FtNNlXIYPSXjux0nsb6BrW6Ap/y15OPYKh7ad1Ei0iY=;
        b=F4G77Hr24bG7LEmoX8eIfGfTdIjO/lgQfZ5KqXytiDhrzzhQ3/S+cm03t2OVcWIrVm
         wHAchSm0oV56Gkq+xlpbcaH5SViJYAXAcHvLb4PFSq/9izT6WBp9AWwWh2kexfw7bRqA
         1+xqhbgTKnwQSL/M+fd+zECp5ozZDXOOmPqXjU+nIWtqQqwqD7UirU1Qayx0IUGzDqhV
         KyY5qlRc71TT45NhlcZ9CrLWiz2LALJ1R9oB54RDCDPdjp+6QzWzjcDvFwUJ7AAlOQEm
         OxxL27SYXvr3N3Eeqxb63KCp5sik+rID+Zo8OF3ZiP5oorNyyDBeH9JPh04bMvahfwhT
         JGWA==
X-Gm-Message-State: ACrzQf3FNikuh0eAGBB6EP0+N0Vvk68cp3M5ZBjDfUm9wp8AU4nQprma
	JlxcbGGEntI9y9liEMrGrrIxxQG5qY6btH1R
X-Google-Smtp-Source: AMsMyM7FBw8mwa8fq17nDE+rgVfpgfRNd4OS38L7ss+G07KE4qRD6dXuSxcHedQWYdGBYqYL9KimFQ==
X-Received: by 2002:a17:902:ced1:b0:184:ba6e:8c3b with SMTP id d17-20020a170902ced100b00184ba6e8c3bmr6174984plg.160.1665765344118;
        Fri, 14 Oct 2022 09:35:44 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id z15-20020a170903018f00b0017e64da44c5sm1964522plg.203.2022.10.14.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 09:35:43 -0700 (PDT)
Date: Fri, 14 Oct 2022 09:35:43 -0700 (PDT)
X-Google-Original-Date: Fri, 14 Oct 2022 09:35:42 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 6.1 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-569ea3ca-5e4e-4339-b3fa-84723ba9ca77@palmer-ri-x1c9a>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_093547_742924_90B7C175 
X-CRM114-Status: GOOD (  21.37  )
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

merged tag 'riscv-for-linus-6.1-mw1'
The following changes since commit 2e64066dab157ffcd0e9ec2ff631862e6e222876:

  Merge tag 'riscv-for-linus-6.1-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-10-09 13:24:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.1-mw2

for you to fetch changes up to ab0c23b535f3f9d8345d8ad4c18c0a8594459d55:

  MAINTAINERS: add RISC-V's patchwork (2022-10-13 16:35:25 -0700)

----------------------------------------------------------------
RISC-V Patches for the 6.1 Merge Window, Part 2

* A handful of DT updates for the PolarFire SOC.
* A fix to correct the handling of write-only mappings.
* m{vetndor,arcd,imp}id is now in /proc/cpuinfo
* The SiFive L2 cache controller support has been refactored to also
  support L3 caches.

There's also a handful of fixes, cleanups and improvements throughout
the tree.

----------------------------------------------------------------
We still have these kasan/pcpu_alloc panics, but by all appearances the bug has
been around for a while so it's not the fault of any of these (even if it just
started manifesting very often for me in the middle of the merge window).  I've
got that and a build fix for drm/amd/display in my test trees, but otherwise
things seem clean on my end.

I've got one merge conflict with a master from last night, just a pair of
cleanups that happened to run into each other.  Here's my resolution if it
helps any:

diff --cc arch/riscv/kernel/vdso.c
index 4abc9aebdfae,692e7ae3dcb8..123d05255fcf
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@@ -119,18 -114,16 +119,19 @@@ int vdso_join_timens(struct task_struc
  {
        struct mm_struct *mm = task->mm;
        struct vm_area_struct *vma;
+       VMA_ITERATOR(vmi, mm, 0);
 -      struct __vdso_info *vdso_info = mm->context.vdso_info;

        mmap_read_lock(mm);

-       for (vma = mm->mmap; vma; vma = vma->vm_next) {
+       for_each_vma(vmi, vma) {
                unsigned long size = vma->vm_end - vma->vm_start;

 -              if (vma_is_special_mapping(vma, vdso_info->dm))
 +              if (vma_is_special_mapping(vma, vdso_info.dm))
                        zap_page_range(vma, vma->vm_start, size);
 +#ifdef CONFIG_COMPAT
 +              if (vma_is_special_mapping(vma, compat_vdso_info.dm))
 +                      zap_page_range(vma, vma->vm_start, size);
 +#endif
        }

        mmap_read_unlock(mm);

Sorry it's another big one late in the merge window, I'm trying to not do that
but things keep slipping.

----------------------------------------------------------------
Andrew Bresticker (2):
      riscv: Make VM_WRITE imply VM_READ
      riscv: Allow PROT_WRITE-only mmap()

Anup Patel (1):
      RISC-V: Add mvendorid, marchid, and mimpid to /proc/cpuinfo output

Ben Dooks (2):
      soc: sifive: ccache: reduce printing on init
      soc: sifive: ccache: use pr_fmt() to remove CCACHE: prefixes

Conor Dooley (18):
      riscv: dts: microchip: add qspi compatible fallback
      dt-bindings: riscv: microchip: document icicle reference design
      dt-bindings: riscv: microchip: document the aries m100pfsevp
      riscv: dts: microchip: add pci dma ranges for the icicle kit
      riscv: dts: microchip: move the mpfs' pci node to -fabric.dtsi
      riscv: dts: microchip: icicle: update pci address properties
      riscv: dts: microchip: icicle: re-jig fabric peripheral addresses
      riscv: dts: microchip: reduce the fic3 clock rate
      riscv: dts: microchip: add a devicetree for aries' m100pfsevp
      riscv: dts: microchip: update memory configuration for v2022.10
      riscv: dts: microchip: fix fabric i2c reg size
      MAINTAINERS: update polarfire soc clock binding
      dt-bindings: riscv: update microchip.yaml's maintainership
      dt-bindings: timer: sifive,clint: add legacy riscv compatible
      dt-bindings: interrupt-controller: sifive,plic: add legacy riscv compatible
      dt-bindings: riscv: add new riscv,isa strings for emulators
      riscv: enable software resend of irqs
      MAINTAINERS: add RISC-V's patchwork

Fangrui Song (1):
      riscv: Pass -mno-relax only on lld < 15.0.0

Greentime Hu (2):
      soc: sifive: ccache: Rename SiFive L2 cache to Composable cache.
      riscv: Add cache information in AUX vector

Heiko Stuebner (5):
      riscv: cleanup svpbmt cpufeature probing
      riscv: drop some idefs from CMO initialization
      riscv: use BIT() macros in t-head errata init
      riscv: use BIT() marco for cpufeature probing
      riscv: check for kernel config option in t-head memory types errata

Jisheng Zhang (1):
      riscv: vdso: fix NULL deference in vdso_join_timens() when vfork

Maciej W. Rozycki (1):
      RISC-V: Make port I/O string accessors actually work

Palmer Dabbelt (9):
      doc: RISC-V: Document that misaligned accesses are supported
      Merge tag 'dt-for-palmer-v6.1-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux into for-next
      Merge patch series "Fix dt-validate issues on qemu dtbdumps due to dt-bindings"
      RISC-V: Avoid dereferening NULL regs in die()
      Merge patch series "Some style cleanups for recent extension additions"
      Merge patch series "Use composable cache instead of L2 cache"
      RISC-V: Re-enable counter access from userspace
      RISC-V: Make mmap() with PROT_WRITE imply PROT_READ
      RISC-V: Add mvendorid, marchid, and mimpid to /proc/cpuinfo output

Shravan Chippa (1):
      dt-bindings: riscv: microchip: document the sev kit

Vattipalli Praveen (1):
      riscv: dts: microchip: add sevkit device tree

Wenting Zhang (1):
      riscv: always honor the CONFIG_CMDLINE_FORCE when parsing dtb

Zong Li (3):
      dt-bindings: sifive-ccache: change Sifive L2 cache to Composable cache
      soc: sifive: ccache: determine the cache level from dts
      soc: sifive: ccache: define the macro for the register shifts

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   5 +
 Documentation/devicetree/bindings/riscv/cpus.yaml  |   5 +-
 .../devicetree/bindings/riscv/microchip.yaml       |  24 +-
 .../{sifive-l2-cache.yaml => sifive,ccache0.yaml}  |  28 ++-
 .../devicetree/bindings/timer/sifive,clint.yaml    |  18 +-
 Documentation/riscv/index.rst                      |   1 +
 Documentation/riscv/uabi.rst                       |   6 +
 MAINTAINERS                                        |   4 +-
 arch/riscv/Kconfig                                 |   1 +
 arch/riscv/Makefile                                |   2 +
 arch/riscv/boot/dts/microchip/Makefile             |   2 +
 .../boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi |  43 +++-
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts  |  18 +-
 .../boot/dts/microchip/mpfs-m100pfs-fabric.dtsi    |  45 ++++
 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts  | 179 +++++++++++++++
 .../boot/dts/microchip/mpfs-polarberry-fabric.dtsi |  29 +++
 .../boot/dts/microchip/mpfs-sev-kit-fabric.dtsi    |  45 ++++
 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts     | 145 ++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi            |  31 +--
 arch/riscv/errata/thead/errata.c                   |  14 +-
 arch/riscv/include/asm/cacheflush.h                |   2 +
 arch/riscv/include/asm/elf.h                       |   4 +
 arch/riscv/include/asm/io.h                        |  16 +-
 arch/riscv/include/asm/mmu.h                       |   1 -
 arch/riscv/include/uapi/asm/auxvec.h               |   4 +-
 arch/riscv/kernel/cpu.c                            |  51 +++++
 arch/riscv/kernel/cpufeature.c                     |  39 ++--
 arch/riscv/kernel/setup.c                          |   4 +-
 arch/riscv/kernel/sys_riscv.c                      |   3 -
 arch/riscv/kernel/traps.c                          |   9 +-
 arch/riscv/kernel/vdso.c                           |  13 +-
 arch/riscv/mm/fault.c                              |   3 +-
 drivers/edac/Kconfig                               |   2 +-
 drivers/edac/sifive_edac.c                         |  12 +-
 drivers/perf/riscv_pmu_sbi.c                       |   7 +-
 drivers/soc/sifive/Kconfig                         |   6 +-
 drivers/soc/sifive/Makefile                        |   2 +-
 drivers/soc/sifive/sifive_ccache.c                 | 255 +++++++++++++++++++++
 drivers/soc/sifive/sifive_l2_cache.c               | 237 -------------------
 include/soc/sifive/sifive_ccache.h                 |  16 ++
 include/soc/sifive/sifive_l2_cache.h               |  16 --
 41 files changed, 968 insertions(+), 379 deletions(-)
 rename Documentation/devicetree/bindings/riscv/{sifive-l2-cache.yaml => sifive,ccache0.yaml} (83%)
 create mode 100644 Documentation/riscv/uabi.rst
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
 create mode 100644 drivers/soc/sifive/sifive_ccache.c
 delete mode 100644 drivers/soc/sifive/sifive_l2_cache.c
 create mode 100644 include/soc/sifive/sifive_ccache.h
 delete mode 100644 include/soc/sifive/sifive_l2_cache.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
