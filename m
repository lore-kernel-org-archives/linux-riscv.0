Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E908AF45A0F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 22:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AeKTwk4tjMg5EmF1DTU1TlFAJyBcL7SocktV+bMXK1c=; b=Gm0KjZS004Ntai
	t6Vyjt6aitrBpA7TmRqN9KC1Iqmiv/c4GCYyyfeNA8rE5hvRlyPOkSD9VowgZwi4Q1HYePBWf0wVt
	5DNh+0ElhTTxTDtX1b18EoWZCeUJ26QABCcbvwE573HU/NkmIEibHDKHHWLcId4NdG4llo2U2YoTO
	kN0nW87mYU0SBvl7/CWvqy2FLOhPgJP/BpoUXayial3GtxY1AuvkUf5Xs7kjtPFcmmsy0rdWo3FkC
	Bvq3Jmjgbby3ZeZ01FDMHWz1QEd+ZeTEeoKXMJOyxgm0Uv3zkJU/wDFIplv0gZbnL8uf2vxp2KQx+
	kVJC27A0WEufsIa6gDAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBK9X-0000000Cs3T-3mIC;
	Fri, 10 Apr 2026 22:16:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBK9V-0000000Cs37-1MdO
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 22:16:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1CA040918;
	Fri, 10 Apr 2026 22:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CD8CC19421;
	Fri, 10 Apr 2026 22:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775859395;
	bh=u+9QUJNrBl3AFYYOFBEgBa6qPbeFBhnS1CnFwPmJjHo=;
	h=Date:From:To:cc:Subject:From;
	b=EP1v/+Eo4DCH0/Zj4NUdOuzi/vX5F4e4LYlxUTSH5OjVLuY2M42sju1nZFG/5oOAj
	 1VljwKDpzJ+Sa9u0V/J4pBTLDRNjx9UcbzjKcjaKOdtkDPHP4cQPvRXlDUeTU+JhQg
	 zu1lZUACmuqLv140wJoWpWcqOELCtgYD3hXBzN2HK8186el7p4q3DBuUOU06bsijRV
	 PnLWu22qUzQVh5NZkostiQt3diAyR8aI1ucjYJHbxUCCASsEEeKBmCS164zrAmEz2+
	 yRqfcnjqq6UwsfOhWd62uy8blwEWKlxz1i8nyuZPXoTreWyICL1ZZuAzr8Rf7NK6Bv
	 rvVe5pcOUmveQ==
Date: Fri, 10 Apr 2026 16:16:33 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.0-rc8
Message-ID: <46ab01fb-e1db-1cd8-4d85-3ac68c7dddf5@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_151637_429033_87DF09B5 
X-CRM114-Status: GOOD (  12.12  )
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

The changes in this pull request expand abbreviations in the per-task
CFI prctl() and ptrace interfaces.  They also restructure the indirect
branch tracking prctl() interface to follow the style of the
speculation control interface, rather than the shadow stack control
interface.  While here, we fix a few other embarrassing bugs that we
should have caught earlier, and clean up the naming of the
kernel-internal architecture-common prctl() function names to expand
out the abbreviations.

The hope is that these fixes can be pulled before the v7.0 release.
That should clean up these userspace interfaces before upstream C
libraries start using them.


thanks,

- Paul

The following changes since commit 9156585280f161fc1c3552cf1860559edb2bb7e3:

  ACPI: RIMT: Add dependency between iommu and devices (2026-04-04 18:38:03 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-v7.0-rc8

for you to fetch changes up to 08ee1559052be302f1d3752f48360b89517d9f8d:

  prctl: cfi: change the branch landing pad prctl()s to be more descriptive (2026-04-04 18:40:58 -0600)

----------------------------------------------------------------
RISC-V updates for v7.0-rc8

Before v7.0 is released, fix a few issues with the CFI patchset,
merged earlier in v7.0-rc, that primarily affect interfaces to
non-kernel code:

- Improve the prctl() interface for per-task indirect branch landing
  pad control to expand abbreviations and to resemble the speculation
  control prctl() interface

- Expand the "LP" and "SS" abbreviations in the ptrace uapi header
  file to "branch landing pad" and "shadow stack", to improve
  readability

- Fix a typo in a CFI-related macro name in the ptrace uapi header
  file

- Ensure that the indirect branch tracking state and shadow stack
  state are unlocked immediately after an exec() on the new task so
  that libc subsequently can control it

- While working in this area, clean up the kernel-internal,
  cross-architecture prctl() function names by expanding the
  abbreviations mentioned above

----------------------------------------------------------------
Paul Walmsley (5):
      riscv: ptrace: cfi: fix "PRACE" typo in uapi header
      riscv: ptrace: expand "LP" references to "branch landing pads" in uapi headers
      prctl: rename branch landing pad implementation functions to be more explicit
      riscv: ptrace: cfi: expand "SS" references to "shadow stack" in uapi headers
      prctl: cfi: change the branch landing pad prctl()s to be more descriptive

Zong Li (1):
      riscv: cfi: clear CFI lock status in start_thread()

 Documentation/arch/riscv/zicfilp.rst               | 63 +++++++++++++---------
 arch/riscv/include/asm/usercfi.h                   |  8 +--
 arch/riscv/include/uapi/asm/ptrace.h               | 42 ++++++++-------
 arch/riscv/kernel/process.c                        |  2 +
 arch/riscv/kernel/ptrace.c                         | 22 ++++----
 arch/riscv/kernel/usercfi.c                        | 39 +++++++-------
 include/linux/cpu.h                                |  6 +--
 include/uapi/linux/prctl.h                         | 37 ++++++-------
 kernel/sys.c                                       | 30 ++++++-----
 tools/perf/trace/beauty/include/uapi/linux/prctl.h | 36 ++++++-------
 tools/testing/selftests/riscv/cfi/cfitests.c       | 13 ++---
 11 files changed, 154 insertions(+), 144 deletions(-)

vmlinux size differences in bytes (from 9156585280f1):
 text  data  bss    dec    hex  filename                             
  +72     .    .    +72    +48  vmlinux.defconfig.gcc-15             
  +64   -64    .      .      .  vmlinux.nosmp_defconfig.gcc-15       
   +8   +32    .    +40    +28  vmlinux.rv32_defconfig.gcc-15        
   -8   +32    .    +24    +18  vmlinux.rv32_nosmp_defconfig.gcc-15  
  +28     .    .    +28    +1c  vmlinux.nommu_virt_defconfig.gcc-15  
   -8     .    .     -8     -8  vmlinux.defconfig.clang-20           
   -8     .    .     -8     -8  vmlinux.nosmp_defconfig.clang-20     
   -8     .    .     -8     -8  vmlinux.rv32_defconfig.clang-20      
   -8     .    .     -8     -8  vmlinux.rv32_nosmp_defconfig.clang-20
  +36     .    .    +36    +24  vmlinux.nommu_virt_defconfig.clang-20
    .   +32    .    +32    +20  vmlinux.defconfig.gcc-14             
    .     .    .      .      .  vmlinux.nosmp_defconfig.gcc-14       
    .     .    .      .      .  vmlinux.rv32_defconfig.gcc-14        
    .   +32    .    +32    +20  vmlinux.rv32_nosmp_defconfig.gcc-14  
  +44     .    .    +44    +2c  vmlinux.nommu_virt_defconfig.gcc-14  
   -8   -64    .    -72    -48  vmlinux.defconfig.clang-19           
    .     .    .      .      .  vmlinux.nosmp_defconfig.clang-19     
   -8     .    .     -8     -8  vmlinux.rv32_defconfig.clang-19      
  -16   +32    .    +16    +10  vmlinux.rv32_nosmp_defconfig.clang-19
  +28     .    .    +28    +1c  vmlinux.nommu_virt_defconfig.clang-19
   -8     .    .     -8     -8  vmlinux.defconfig.gcc-13             
   -8     .    .     -8     -8  vmlinux.nosmp_defconfig.gcc-13       
   -8   +32    .    +24    +18  vmlinux.rv32_defconfig.gcc-13        
    .     .    .      .      .  vmlinux.rv32_nosmp_defconfig.gcc-13  
  +52     .    .    +52    +34  vmlinux.nommu_virt_defconfig.gcc-13  
   -8     .    .     -8     -8  vmlinux.defconfig.clang-18           
    .     .    .      .      .  vmlinux.nosmp_defconfig.clang-18     
  -16     .    .    -16    -10  vmlinux.rv32_defconfig.clang-18      
  -16   +32    .    +16    +10  vmlinux.rv32_nosmp_defconfig.clang-18
  +28     .    .    +28    +1c  vmlinux.nommu_virt_defconfig.clang-18
  -16     .    .    -16    -10  vmlinux.defconfig.gcc-12             
   -8     .    .     -8     -8  vmlinux.nosmp_defconfig.gcc-12       
    .   +32    .    +32    +20  vmlinux.rv32_defconfig.gcc-12        
   +8     .    .     +8     +8  vmlinux.rv32_nosmp_defconfig.gcc-12  
  +28     .    .    +28    +1c  vmlinux.nommu_virt_defconfig.gcc-12  
   -8   +32    .    +24    +18  vmlinux.defconfig.clang-17           
    .   +32    .    +32    +20  vmlinux.nosmp_defconfig.clang-17     
    .   +32    .    +32    +20  vmlinux.rv32_defconfig.clang-17      
    .   +32    .    +32    +20  vmlinux.rv32_nosmp_defconfig.clang-17
  +28     .    .    +28    +1c  vmlinux.nommu_virt_defconfig.clang-17
    .   -64    .    -64    -40  vmlinux.defconfig.gcc-11             
  -16     .    .    -16    -10  vmlinux.nosmp_defconfig.gcc-11       
    .   +32    .    +32    +20  vmlinux.rv32_defconfig.gcc-11        
    .   +32    .    +32    +20  vmlinux.rv32_nosmp_defconfig.gcc-11  
  +52     .    .    +52    +34  vmlinux.nommu_virt_defconfig.gcc-11  
  +16     .    .    +16    +10  vmlinux.allnoconfig.gcc-14           
   +4     .    .     +4     +4  vmlinux.allmodconfig.gcc-14          
   -4     .    .     -4     -4  vmlinux.allnoconfig.clang-19         
+5440     .    .  +5440  +1540  vmlinux.allmodconfig.clang-19        

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
