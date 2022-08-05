Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581CDC00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 23:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rpfuWmvBbkJVMAREjrCR90kkc0yk4PMLuMMQN+thOCQ=; b=KbvZaVUdsMCNcF
	KL7ZCvL6cW7xaFnwiWSWZ1ou+ra5d9hWT1Xzz8fbsSs+T8TaGW8jI1miRlmAmvrxdqysMi9CKC3Nu
	rZ8SI0kK0S9A27Bmiitf/aZCgnYpAm7/CkKzYGafQzBR8RVyOT4HSzvIN33cgAhPTPr8HWz9TvDKq
	mKfBWO4ktksOFblp+ze8Tggxszp3HSOSFJ5ysoF4uebQj18piX8inx+qJt6VD/fIVl+I0nKDW34dy
	MhfTmXmzKjY/Ji8hbqsBhbPNGsUV13f5PC2h+zUOypUnvjAKj63a1Yo1m0U5sp+wLaVElOn4pzuqv
	5q4eVniSEKsa+r10F89w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK6s4-001i4S-LS; Fri, 05 Aug 2022 23:36:48 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK6ry-001i0g-V9
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 23:36:47 +0000
Received: by mail-pj1-x102c.google.com with SMTP id c19-20020a17090ae11300b001f2f94ed5c6so8377249pjz.1
        for <linux-riscv@lists.infradead.org>; Fri, 05 Aug 2022 16:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:to:from:cc:subject:date:from:to:cc;
        bh=cOwlb6expcLd4UHhO8G6tDy9VjkKqVWVaG/fYduE5to=;
        b=7x8+1bd5bGyIEZJ5N3ge9bNBt5KvNoTan2VvVJ+5v3GcaBRUtd3jDc5duxjcfSG1M9
         tD5R3bCC4DoDfdbIDU4jgOO3GWlbR4r2Di39guRzMpZCRwtix6HvvdSN93R+FxUc8/vF
         DhkLtycenIekFlnjKSgY+uIJzOPOg/fEvRPnlbY0xfxd6nhmhCg+UgFhVeled02C6Khp
         utzvtNCgBIGT49dbBd9Nefs0/Ss58e2ZSF4injmXneF0fwmNsNkyXpUgpbhdz+PjY4KE
         JhJVen0vELFeJBn4Qmq6x/zxES/Q7wwEm+fLFMTEWIHooIHTazRoQIzj17cRGPnuA0f8
         p+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc;
        bh=cOwlb6expcLd4UHhO8G6tDy9VjkKqVWVaG/fYduE5to=;
        b=3JLOFVwKgouyUCmR+/YD2KV5KeVfFkJ24ZFa8GIqCafDRXQaDSlrUPfXzBBLJj5X3x
         iWCdG3TAK4CI5CebMCJNhcT+WcuHLYSBk6qbLl0eUn4EbxBk42wpa/Od5v0DZOLCk0iG
         GhWXAvLdQM67Jq7CJxG+mJYdf1c0Y1PaE75ZjAZ/s3k8nWffGHMUkTbZf11T1sFiqq62
         LzeCIxLH6Sw//WCt7+F5KxZg15kbUUwz3qc7G7+Fz8moXJNbX4MIn8bqbmyQ5/UlIt2D
         PAduRGZkO58IqSRFwLEEtbLzLDsUr49oUfePJnc3vXljHGoWBEgr97VB9WwJNuqI6LC1
         +h3w==
X-Gm-Message-State: ACgBeo1RtaqasjjPgv/9JOqOeeFePv0HKRE2973wQtb9hEDgVpftSRWV
	evkDUF7WA5c+fqtNmPhGtMjkc/KwSwGEOw==
X-Google-Smtp-Source: AA6agR4Qy/sMvyvrxwGBMHJjqNJnqoeqiwUtEM0T6/4Mh4aiv0GFZlOi7tH+fbr+NNfSuZ3zfPUaug==
X-Received: by 2002:a17:902:d50c:b0:16f:736:33a0 with SMTP id b12-20020a170902d50c00b0016f073633a0mr9279339plg.137.1659742599039;
        Fri, 05 Aug 2022 16:36:39 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id m3-20020a17090a34c300b001f50e4c43c4sm6090633pjf.22.2022.08.05.16.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 16:36:38 -0700 (PDT)
Date: Fri, 05 Aug 2022 16:36:38 -0700 (PDT)
X-Google-Original-Date: Fri, 05 Aug 2022 16:36:27 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.20 Merge Window, Part 1
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-1cbba637-6dd2-456a-859b-9d3f8be6bab7@palmer-mbp2014>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_163643_265536_D4D19DF4 
X-CRM114-Status: GOOD (  22.81  )
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

The following changes since commit 924cbb8cbe3460ea192e6243017ceb0ceb255b1b:

  riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol (2022-06-16 15:47:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.20-mw0

for you to fetch changes up to ba6cfef057e1c594c456627aad81c2343fdb5d13:

  riscv: enable Docker requirements in defconfig (2022-07-22 13:43:28 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.20 Merge Window, Part 1

* Enabling the FPU is now a static_key.
* Improvements to the Svpbmt support.
* CPU topology bindings for a handful of systems.
* Support for systems with 64-bit hart IDs.
* Many settings have been enabled in the defconfig, including both
  support for the StarFive systems and many of the Docker requirements.

There are also a handful of cleanups and improvements, like usual.

----------------------------------------------------------------
This all passes my standard tests, with the old caveat that I'm still seeing
some weirdness with QEMU-7.0 and a new issue where GCC-11 is tripping up on
some fortify string checks in lm90.c on rv32 (GCC-12 works).  I don't really
like to send stuff when there's some outstanding issues like this, but after
poking around for a bit it doesn't look like either is related to this pull
request so it seems worse to hold off any longer.

I'm also not 100% sure why it's calling out a patch in the middle as the base,
I see v5.19-rc1 in the history.  Sorry if something went off the rails there.

I have one merge conflict, these defines were set to non-zero in arch/riscv at
the same time the refactoring to make them generic went in.  I'd considered
merging that PR locally and making the fix in my tree, but that looked uglier
than just passing the merge conflict on.  Let me know if I should have done
this the other way around, though.

diff --cc arch/riscv/include/asm/pci.h
index 830ac621dbbc,6ef4a1426194..cc2a184cfc2e
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@@ -12,31 -12,7 +12,10 @@@

  #include <asm/io.h>

 +#define PCIBIOS_MIN_IO                4
 +#define PCIBIOS_MIN_MEM               16
 +
- /* RISC-V shim does not initialize PCI bus */
- #define pcibios_assign_all_busses() 1
-
- #define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
-
- extern int isa_dma_bridge_buggy;
-
- #ifdef CONFIG_PCI
- static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
- {
-       /* no legacy IRQ on risc-v */
-       return -ENODEV;
- }
-
- static inline int pci_proc_domain(struct pci_bus *bus)
- {
-       /* always show the domain in /proc */
-       return 1;
- }
-
- #ifdef        CONFIG_NUMA
-
+ #if defined(CONFIG_PCI) && defined(CONFIG_NUMA)
  static inline int pcibus_to_node(struct pci_bus *bus)
  {
        return dev_to_node(&bus->dev);

----------------------------------------------------------------
Celeste Liu (1):
      riscv: mmap with PROT_WRITE but no PROT_READ is invalid

Conor Dooley (7):
      riscv: dts: microchip: remove spi-max-frequency property
      riscv: dts: microchip: Add mpfs' topology information
      riscv: config: enable SOC_STARFIVE in defconfig
      riscv: dts: sifive: Add fu540 topology information
      riscv: dts: sifive: Add fu740 topology information
      riscv: dts: canaan: Add k210 topology information
      riscv: dts: sifive: "fix" pmic watchdog node name

Heiko Stuebner (4):
      riscv: make patch-function pointer more generic in cpu_manufacturer_info struct
      riscv: remove usage of function-pointers from cpufeatures and t-head errata
      riscv: introduce nops and __nops macros for NOP sequences
      riscv: convert the t-head pbmt errata to use the __nops macro

Heinrich Schuchardt (1):
      riscv: enable Docker requirements in defconfig

Jisheng Zhang (2):
      riscv: introduce unified static key mechanism for ISA extensions
      riscv: switch has_fpu() to the unified static key mechanism

Jonas Hahnfeld (1):
      riscv: dts: starfive: Add JH7100 CPU topology

Juerg Haefliger (3):
      riscv: Kconfig: Fix indentation and add comments
      riscv: Kconfig.erratas: Add comments
      riscv: Kconfig.socs: Add comments

Maciej W. Rozycki (1):
      RISC-V: PCI: Avoid handing out address 0 to devices

Nagasuresh Relli (1):
      riscv: dts: microchip: remove spi-max-frequency property

Palmer Dabbelt (8):
      RISC-V: Use the extension probing code to enable the FPU
      RISC-V: Some Svpbmt fixes and cleanups
      riscv: Kconfig: Style cleanups
      RISC-V: Add CONFIG_{NON,}PORTABLE
      Merge tag 'dt-for-palmer-v5.20-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git into for-next
      Merge branch 'riscv-cpu_map_topo' of git://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git into for-next
      RISC-V: Support for 64bit hartid on RV64 platforms
      riscv: Add macro for multiple nop instructions

Sunil V L (5):
      riscv: cpu_ops_sbi: Add 64bit hartid support on RV64
      riscv: spinwait: Fix hartid variable type
      riscv: smp: Add 64bit hartid support on RV64
      riscv: cpu: Add 64bit hartid support on RV64
      riscv/efi_stub: Add 64bit boot-hartid support on RV64

Xianting Tian (1):
      RISC-V: Add fast call path of crash_kexec()

 arch/riscv/Kconfig                                 | 47 ++++++++++++----
 arch/riscv/Kconfig.erratas                         |  2 +-
 arch/riscv/Kconfig.socs                            |  4 +-
 arch/riscv/boot/dts/canaan/k210.dtsi               | 12 ++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi            | 27 ++++++++-
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi         | 24 ++++++++
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi         | 24 ++++++++
 .../riscv/boot/dts/sifive/hifive-unmatched-a00.dts |  2 +-
 arch/riscv/boot/dts/starfive/jh7100.dtsi           | 16 +++++-
 arch/riscv/configs/32-bit.config                   |  2 +
 arch/riscv/configs/defconfig                       | 65 +++++++++++++++++++++-
 arch/riscv/configs/nommu_k210_defconfig            |  1 +
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |  1 +
 arch/riscv/configs/nommu_virt_defconfig            |  1 +
 arch/riscv/configs/rv32_defconfig                  |  1 +
 arch/riscv/errata/thead/errata.c                   | 38 ++++---------
 arch/riscv/include/asm/asm.h                       | 15 +++++
 arch/riscv/include/asm/barrier.h                   |  2 +
 arch/riscv/include/asm/errata_list.h               |  8 +--
 arch/riscv/include/asm/hwcap.h                     | 25 +++++++++
 arch/riscv/include/asm/pci.h                       |  4 +-
 arch/riscv/include/asm/processor.h                 |  4 +-
 arch/riscv/include/asm/smp.h                       |  4 +-
 arch/riscv/include/asm/switch_to.h                 |  4 +-
 arch/riscv/kernel/alternative.c                    | 18 +++---
 arch/riscv/kernel/cpu.c                            | 26 +++++----
 arch/riscv/kernel/cpu_ops_sbi.c                    |  4 +-
 arch/riscv/kernel/cpu_ops_spinwait.c               |  4 +-
 arch/riscv/kernel/cpufeature.c                     | 52 +++++++----------
 arch/riscv/kernel/smp.c                            |  4 +-
 arch/riscv/kernel/smpboot.c                        |  9 +--
 arch/riscv/kernel/sys_riscv.c                      |  5 +-
 arch/riscv/kernel/traps.c                          |  4 ++
 drivers/clocksource/timer-riscv.c                  | 15 ++---
 drivers/firmware/efi/libstub/riscv-stub.c          | 13 ++++-
 drivers/irqchip/irq-riscv-intc.c                   |  7 ++-
 drivers/irqchip/irq-sifive-plic.c                  |  7 ++-
 37 files changed, 358 insertions(+), 143 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
