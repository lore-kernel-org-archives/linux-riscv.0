Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF5BE9D80D
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 21:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nXDuY0A/T+6UozyZy9CzIAsWMDTMVCUKOD87i0S9fqo=; b=Zp7OnL2ag+J+1w
	wMdVVs66DYEAaQiaB/qptQTuk1WZqg7ESveGZd1ftkVDbB+ZtG+7YTu9OEnWnkd2m6YVn8ge/T0rW
	U3uvGgHp7i0mYbuDi4+JarFyNrcT1o6bLCxY9sItaIKAtZn2wgnBbEHfXr8gaMogg0dsgcv0RIC5f
	j9BGdNuGuaBHDMm3AheqQm9Wo6MeGn4RarUXtNKnIrSYL9T2m0jxHZ2wMgPFjygDYDGAYbmM4Pc9B
	4ZdSxUijHxE7aYoMb0Ygk4TTSqWhD3eJB/QKrolcDbAbZWt5vO4Lr2t6gX58ZrYVBmvqV6FOAnwdN
	2R4UFX30GvTKf0JapShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9VCy-00000004UzA-2Czl;
	Sun, 05 Apr 2026 21:40:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9VCw-00000004Uz4-3u09
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 21:40:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7D9B600AC;
	Sun,  5 Apr 2026 21:40:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A25C116C6;
	Sun,  5 Apr 2026 21:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775425237;
	bh=cklvwaQ6lc0AJHRPVzr+AtP1DOc8DZ+C3JnQgWKYojw=;
	h=Date:From:To:cc:Subject:From;
	b=l51ITGIp6j2HBL/yUKJIS74heJ5HKtdnUOdO0tV3UPJto6LdBZ4rO0oRZiY4SMBnK
	 44vLrdfI/I2d3QUwGWUO1rWQD6iQnhfYr2iOt9bkfJM/CqGT+onnJGzJxZ1fcrUMHc
	 02fBqK20HZYZN9O64Sn7XNOutO1DtcbBws9WueyH7ELj/Idi/kkUM4iNKVS7prUCub
	 xXUP5hPPKpgvI+ElJgeEgyN/uSZIfXpMU2pdqyUc6BE1a+fuyUwhS3Ardrk/zSTXcf
	 BG2qrS9RSsAfIgL/R7C9S6hvOEzVRW9v1BQh6Qjr9BuSbP4mgraqPLOeXjdoJIOUok
	 +z1MSEUPTBLsg==
Date: Sun, 5 Apr 2026 15:40:30 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.0-rc7
Message-ID: <4e071ea0-3571-467b-4626-5d4eb9c50435@kernel.org>
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

Please pull these RISC-V updates for v7.0-rc7.  These are all
relatively minor functional fixes.  The branch was recently rebuilt, but
only to remove fixes that aren't critical at this point in the release
cycle.


thanks,

- Paul


The following changes since commit c369299895a591d96745d6492d4888259b004a9e:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-7.0-rc7

for you to fetch changes up to 9156585280f161fc1c3552cf1860559edb2bb7e3:

  ACPI: RIMT: Add dependency between iommu and devices (2026-04-04 18:38:03 -0600)

----------------------------------------------------------------
RISC-V updates for v7.0-rc7

- Fix a CONFIG_SPARSEMEM crash on RV32 by avoiding early phys_to_page()

- Prevent runtime const infrastructure from being used by modules, similar
  to what was done for x86

- Avoid problems when shutting down ACPI systems with IOMMUs by adding
  a device dependency between IOMMU and devices that use it

- Fix a bug where the CPU pointer masking state isn't properly reset
  when tagged addresses aren't enabled for a task

- Fix some incorrect register assignments, and add some missing ones,
  in kgdb support code

- Fix compilation of non-kernel code that uses the ptrace uapi header
  by replacing BIT() with _BITUL()

- Fix compilation of the validate_v_ptrace kselftest by working around
  kselftest macro expansion issues

----------------------------------------------------------------
Charlie Jenkins (1):
      selftests: riscv: Add braces around EXPECT_EQ()

Jisheng Zhang (1):
      riscv: make runtime const not usable by modules

Paul Walmsley (2):
      riscv: kgdb: fix several debug register assignment bugs
      riscv: use _BITUL macro rather than BIT() in ptrace uapi and kselftests

Sunil V L (1):
      ACPI: RIMT: Add dependency between iommu and devices

Vivian Wang (1):
      riscv: patch: Avoid early phys_to_page()

Zishun Yi (1):
      riscv: Reset pmm when PR_TAGGED_ADDR_ENABLE is not set

 arch/riscv/include/asm/runtime-const.h              |  4 ++++
 arch/riscv/include/uapi/asm/ptrace.h                | 13 +++++++------
 arch/riscv/kernel/kgdb.c                            |  7 ++++---
 arch/riscv/kernel/patch.c                           | 21 +++++++++++----------
 arch/riscv/kernel/process.c                         |  4 +++-
 drivers/acpi/riscv/rimt.c                           |  7 +++++++
 .../selftests/riscv/vector/validate_v_ptrace.c      | 19 +++++++++++--------
 7 files changed, 47 insertions(+), 28 deletions(-)

vmlinux size differences in bytes (from c369299895a5)
text  data  bss   dec   hex  filename                             
-304  +160    .  -144   -90  vmlinux.defconfig.gcc-15             
-304  +160    .  -144   -90  vmlinux.nosmp_defconfig.gcc-15       
-160  +128    .   -32   -20  vmlinux.rv32_defconfig.gcc-15        
-176   +64    .  -112   -70  vmlinux.rv32_nosmp_defconfig.gcc-15  
  +8     .    .    +8    +8  vmlinux.nommu_virt_defconfig.gcc-15  
-240  +160    .   -80   -50  vmlinux.defconfig.clang-20           
-224   +96    .  -128   -80  vmlinux.nosmp_defconfig.clang-20     
-144   +96    .   -48   -30  vmlinux.rv32_defconfig.clang-20      
-136  +160    .   +24   +18  vmlinux.rv32_nosmp_defconfig.clang-20
   .     .    .     .     .  vmlinux.nommu_virt_defconfig.clang-20
-384   +64    .  -320  -140  vmlinux.defconfig.clang-17           
-372   +64    .  -308  -134  vmlinux.nosmp_defconfig.clang-17     
-120   +64    .   -56   -38  vmlinux.rv32_defconfig.clang-17      
-112  +128    .   +16   +10  vmlinux.rv32_nosmp_defconfig.clang-17
  +8   +64    .   +72   +48  vmlinux.nommu_virt_defconfig.clang-17
-288  +160    .  -128   -80  vmlinux.defconfig.gcc-11             
-296   +96    .  -200   -c8  vmlinux.nosmp_defconfig.gcc-11       
-176   +64    .  -112   -70  vmlinux.rv32_defconfig.gcc-11        
-192   +96    .   -96   -60  vmlinux.rv32_nosmp_defconfig.gcc-11  
   .  +256    .  +256  +100  vmlinux.nommu_virt_defconfig.gcc-11  

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
