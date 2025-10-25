Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A8ACCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 07:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6NrJQJG7BG1jUhPLghLErQG5YOfaxpYN2/cqLrYWrqA=; b=wcxQ/ZFVZJzDsP
	+ZeyRJDxyD5wdtzg9KN3wS5a3f5GnJS21I8DGsw2PjObooRQYK0lHlkvBrqorFMpmCHpB0n3EkWve
	vFTVCQOaw00U1OLaxT+Qi3Z6I7aF92Ns9XubkBMRM53Pbu3EVhuu1Gi+9y5oTMg/tuwos55oiSTRb
	cMFogKGQPgeaFxIlYwHCpWerKY+ejghP0KXcqPb/YIsb+TYLsaa4Cf8KtxWLw766qUwl4PED04Zu0
	Oe17kVJw84+l3w6a/gw9Vio5xqNprGz0q6My3AbIvodkg4IMuH7Zq2unKj4cSlcV0g2Uuu3ZqWVHL
	aJPr4lcwPGpTgCZaLWlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYKD-0000000B2wz-1ZH0;
	Sat, 25 Oct 2025 07:04:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCYKB-0000000B2wT-2csB
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 07:04:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD50260194;
	Sat, 25 Oct 2025 07:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 328A2C4CEF5;
	Sat, 25 Oct 2025 07:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761375866;
	bh=xXZGzgAFhPqm4rFWZKlguHzsT8Q2QsAf9zp9FqHsRdM=;
	h=Date:From:To:cc:Subject:From;
	b=demwg70VrcRhtgYzj5IQuvqEn79ZY+bb14OkpTv4N8M0U0JlbD+SGbzlRx1XgE+Je
	 DrbJOVo3zIosbYSF+IXqOb9/LXoCvN/zlYZYaACBtHkML8ULgds9d2L3K6SVfZakBg
	 6wavHzCZAs3Irva2Oy/bZ0b7ZD5NDdQHfPRfiESwnNNLKCh0KpPD2HPMhV6E46p/DQ
	 zOlUUuwjfYR4ZZ8GRSYuAA6AtxDUsDIP590D/Mju8EY8vcxTLyaWs6HkuH85RDNBwJ
	 v+B2127zi4JRSRkmF/uD6TfrQiCwb9LaOGRTe3L8MnFHBQF/qMlqngOffHW/MRXZL9
	 C9b+haSyEr1vQ==
Date: Sat, 25 Oct 2025 01:04:21 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v6.18-rc3
Message-ID: <27fed8ce-11d7-cd8c-b0e2-b89b11fa3c5a@kernel.org>
MIME-Version: 1.0
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

Linus,

The following changes since commit fe69107ec7d8b946ab413cfe118984dac8f1a0d8:

  Merge tag 'riscv-for-linux-6.18-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2025-10-17 12:59:31 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc3

for you to fetch changes up to b7776a802f2f80139f96530a489dd00fd7089eda:

  riscv: hwprobe: avoid uninitialized variable use in hwprobe_arch_id() (2025-10-18 09:36:36 -0600)


- Paul

----------------------------------------------------------------
RISC-V updates for v6.18-rc3

Several RISC-V fixes for v6.18-rc3:

- Close a race during boot between userspace vDSO usage and some
  late-initialized vDSO data

- Improve performance on systems with non-CPU-cache-coherent
  DMA-capable peripherals by enabling write combining on
  pgprot_dmacoherent() allocations

- Add human-readable detail for RISC-V IPI tracing

- Provide more information to zsmalloc on 64-bit RISC-V to improve
  allocation

- Silence useless boot messages about CPUs that have been disabled in
  DT

- Resolve some compiler and smatch warnings and remove a redundant macro

----------------------------------------------------------------
Anup Patel (2):
      RISC-V: Define pgprot_dmacoherent() for non-coherent devices
      RISC-V: Don't print details of CPUs disabled in DT

Jingwei Wang (1):
      riscv: hwprobe: Fix stale vDSO data for late-initialized keys at boot

Paul Walmsley (3):
      riscv: add a forward declaration for cpuinfo_op
      riscv: cpufeature: avoid uninitialized variable in has_thead_homogeneous_vlenb()
      riscv: hwprobe: avoid uninitialized variable use in hwprobe_arch_id()

Samuel Holland (3):
      riscv: Register IPI IRQs with unique names
      riscv: mm: Define MAX_POSSIBLE_PHYSMEM_BITS for zsmalloc
      riscv: Remove the PER_CPU_OFFSET_SHIFT macro

Sunil V L (1):
      ACPI: RIMT: Fix unused function warnings when CONFIG_IOMMU_API is disabled

 arch/riscv/include/asm/asm.h               |   8 +-
 arch/riscv/include/asm/cpufeature.h        |   2 +
 arch/riscv/include/asm/hwprobe.h           |   7 ++
 arch/riscv/include/asm/pgtable-64.h        |   2 +
 arch/riscv/include/asm/pgtable.h           |   2 +
 arch/riscv/include/asm/vdso/arch_data.h    |   6 ++
 arch/riscv/kernel/cpu.c                    |   4 +-
 arch/riscv/kernel/cpufeature.c             |   4 +-
 arch/riscv/kernel/smp.c                    |  24 +++---
 arch/riscv/kernel/sys_hwprobe.c            |  76 +++++++++++++++---
 arch/riscv/kernel/unaligned_access_speed.c |   9 ++-
 arch/riscv/kernel/vdso/hwprobe.c           |   2 +-
 drivers/acpi/riscv/rimt.c                  | 122 ++++++++++++++---------------
 13 files changed, 168 insertions(+), 100 deletions(-)


vmlinux size differences (from 6f3b6e91f720):

text  data  bss   dec   hex  filename                             
+140  +152    .  +292  +124  vmlinux.defconfig.gcc-15             
+144  +120    .  +264  +108  vmlinux.nosmp_defconfig.gcc-15       
 +76  +160    .  +236   +ec  vmlinux.rv32_defconfig.gcc-15        
+168   +88    .  +256  +100  vmlinux.rv32_nosmp_defconfig.gcc-15  
 +76   +16    .   +92   +5c  vmlinux.nommu_virt_defconfig.gcc-15  
+140  +152    .  +292  +124  vmlinux.defconfig.gcc-14             
+144  +120    .  +264  +108  vmlinux.nosmp_defconfig.gcc-14       
 +76  +160    .  +236   +ec  vmlinux.rv32_defconfig.gcc-14        
+168   +88    .  +256  +100  vmlinux.rv32_nosmp_defconfig.gcc-14  
 +76   +16    .   +92   +5c  vmlinux.nommu_virt_defconfig.gcc-14  
+356   +84    .  +440  +1b8  vmlinux.defconfig.clang-20           
+340  +116    .  +456  +1c8  vmlinux.nosmp_defconfig.clang-20     
+400   +80    .  +480  +1e0  vmlinux.rv32_defconfig.clang-20      
+376  +112    .  +488  +1e8  vmlinux.rv32_nosmp_defconfig.clang-20
 +48   +80    .  +128   +80  vmlinux.nommu_virt_defconfig.clang-20
+328  +116    .  +444  +1bc  vmlinux.defconfig.clang-19           
+344   +76    .  +420  +1a4  vmlinux.nosmp_defconfig.clang-19     
+424   +84    .  +508  +1fc  vmlinux.rv32_defconfig.clang-19      
+396   +76    .  +472  +1d8  vmlinux.rv32_nosmp_defconfig.clang-19
 +60   +16    .   +76   +4c  vmlinux.nommu_virt_defconfig.clang-19
-100   +80    .   -20   -14  vmlinux.allnoconfig.gcc-14           
   x     x    x     x     x  vmlinux.allmodconfig.gcc-14

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
