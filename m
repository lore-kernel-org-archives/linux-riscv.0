Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363A9D25032
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Jan 2026 01:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ngx9uk4medhmIIndmjGBMhdjeZ7oWBmVmBb/eSo+44Q=; b=qPayRVMTxQnAoB
	h7hDPI4PJC8RAOJa3afc6QvpgejUj2eGv27jweRVsrJiHqmZb5pwYsmervKf8Sge2cNJTtx8B2umy
	ktIk1+TxmpntHzqbnxaBd8u+4srOsqDRsy5ExxO/eC2N+qs0lAxWQTaeqASlwhhmBr29shGUVusyo
	elUAylIP7RhcrWmaTFkl0fW3BbGlMsmaaDqXAah1iH0XJ+ix8H/ITJy7DtCeW+3mvMg1pzp70L2nR
	Z13rrE7Rqv4CkAdSaS+rD/FIj+LEv4GklRRSuF4q937A5GKyoIjOiTDKll76MhE2uOnS0JqH9wkMV
	oKtlBuR9YoTFo2hhdBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vekb3-00000003osm-0FII;
	Sun, 11 Jan 2026 01:50:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vekaz-00000003osR-44F3
	for linux-riscv@lists.infradead.org;
	Sun, 11 Jan 2026 01:50:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 47660405B3;
	Sun, 11 Jan 2026 01:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F05C4CEF1;
	Sun, 11 Jan 2026 01:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768096220;
	bh=gbLRuD/XttFXAx0oretzFcowIx7NCA+g/TUGnvMErIc=;
	h=Date:From:To:cc:Subject:From;
	b=jt5B2wiXs56sVy49lKK27NVu3ezjdSoA3CAsE0o3O7A2FDuqNIxdey1B1qJ4IZVj6
	 DbHKAF6aq6UHjl3Wzu3ghLXTGdZ2aI/ozKwrypXi5peBL5nQlUoBqlTnii016xAv7T
	 xqUzT6WCZwObDsLQQa2YUIzZchM/OU1dg2eQgWz5tBE53GJo8KaWD04EJHV9oBvu/b
	 khNk1M4GT4q6aDEW6GxirARLLsG1/07dCUFELVHuEsxcf9hkbx9A3VtTAHxeZXvO1/
	 HhwRkbWuS7sFFZByxbff6gfA/0jk1j/PZEk8bNa53khvobLMEwgL+mjbnf2K2PqkPf
	 TnJGrCl2yYyRw==
Date: Sat, 10 Jan 2026 18:50:16 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V updates for v6.19-rc5
Message-ID: <f8bfedcd-751c-8270-df86-e49426b3a701@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_175022_129222_F73DB64F 
X-CRM114-Status: GOOD (  13.33  )
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

Please pull these RISC-V updates for v6.19-rc5.  Notable changes
include a fix to close one common microarchitectural attack vector for
out-of-order cores.  Another patch exposed an omission in my boot test
coverage, which is currently missing relocatable kernels.  Otherwise,
the fixes seem to be settling down for us.

The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc5

for you to fetch changes up to b0d7f5f0c9f05f1b6d4ee7110f15bef9c11f9df0:

  riscv: trace: fix snapshot deadlock with sbi ecall (2026-01-07 13:25:56 -0700)


- Paul

----------------------------------------------------------------
RISC-V updates for v6.19-rc5

- Fix CONFIG_RELOCATABLE=y boots by building Image files from vmlinux,
  rather than vmlinux.unstripped, now that the .modinfo section is
  included in vmlinux.unstripped.

- Prevent branch predictor poisoning microarchitectural attacks that
  use the syscall index as a vector by using array_index_nospec() to
  clamp the index after the bounds check (as x86 and ARM64 already
  do).

- Fix a crash in test_kprobes when building with Clang.

- Fix a deadlock possible when tracing is enabled for SBI ecalls.

- Fix the definition of the Zk standard RISC-V ISA extension bundle,
  which was missing the Zknh extension.

- A few other miscellaneous non-functional cleanups, removing unused
  macros, fixing an out-of-date path in code comments, resolving a
  compile-time warning for a type mismatch in a pr_crit(), and removing
  an unnecessary header file inclusion.

----------------------------------------------------------------
Ben Dooks (1):
      riscv: cpu_ops_sbi: smp_processor_id() returns int, not unsigned int

Guo Ren (Alibaba DAMO Academy) (1):
      riscv: pgtable: Cleanup useless VA_USER_XXX definitions

Guodong Xu (1):
      riscv: cpufeature: Fix Zk bundled extension missing Zknh

Jiakai Xu (1):
      riscv: fix KUnit test_kprobes crash when building with Clang

Lukas Bulwahn (1):
      riscv: configs: Clean up references to non-existing configs

Lukas Gerlach (1):
      riscv: Sanitize syscall table indexing under speculation

Martin Kaiser (1):
      riscv: trace: fix snapshot deadlock with sbi ecall

Soham Metha (1):
      riscv: kexec_image: Fix dead link to boot-image-header.rst

Vivian Wang (1):
      riscv: boot: Always make Image from vmlinux, not vmlinux.unstripped

Yunhui Cui (1):
      riscv: remove irqflags.h inclusion in asm/bitops.h

 arch/riscv/boot/Makefile                           |  4 ----
 arch/riscv/configs/nommu_k210_defconfig            |  2 --
 arch/riscv/configs/nommu_k210_sdcard_defconfig     |  1 -
 arch/riscv/configs/nommu_virt_defconfig            |  1 -
 arch/riscv/include/asm/bitops.h                    |  1 -
 arch/riscv/include/asm/pgtable.h                   |  4 ----
 arch/riscv/kernel/Makefile                         | 15 +++++++-------
 arch/riscv/kernel/cpu_ops_sbi.c                    |  2 +-
 arch/riscv/kernel/cpufeature.c                     | 23 +++++++++++-----------
 arch/riscv/kernel/kexec_image.c                    |  2 +-
 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S |  2 ++
 arch/riscv/kernel/traps.c                          |  4 +++-
 12 files changed, 26 insertions(+), 35 deletions(-)

vmlinux size differences in bytes (from f8f9c1f4d0c7):
text data bss   dec   hex filename                             
  +12 +128   .  +140   +8c vmlinux.defconfig.gcc-15             
  +20  +64   .   +84   +54 vmlinux.nosmp_defconfig.gcc-15       
  +20 +128   .  +148   +94 vmlinux.rv32_defconfig.gcc-15        
  +16 +160   .  +176   +b0 vmlinux.rv32_nosmp_defconfig.gcc-15  
  +16  +64   .   +80   +50 vmlinux.nommu_virt_defconfig.gcc-15  
  +44  +96   .  +140   +8c vmlinux.defconfig.clang-20           
  +44 +160   .  +204   +cc vmlinux.nosmp_defconfig.clang-20     
  +44 +192   .  +236   +ec vmlinux.rv32_defconfig.clang-20      
  +44  +96   .  +140   +8c vmlinux.rv32_nosmp_defconfig.clang-20
  +44  +64   .  +108   +6c vmlinux.nommu_virt_defconfig.clang-20
  +20 +160   .  +180   +b4 vmlinux.defconfig.gcc-14             
  +16  +64   .   +80   +50 vmlinux.nosmp_defconfig.gcc-14       
  +12  +64   .   +76   +4c vmlinux.rv32_defconfig.gcc-14        
  +16 +160   .  +176   +b0 vmlinux.rv32_nosmp_defconfig.gcc-14  
  +16  +64   .   +80   +50 vmlinux.nommu_virt_defconfig.gcc-14  
  +44 +160   .  +204   +cc vmlinux.defconfig.clang-19           
  +44 +160   .  +204   +cc vmlinux.nosmp_defconfig.clang-19     
  +44 +160   .  +204   +cc vmlinux.rv32_defconfig.clang-19      
  +44 +128   .  +172   +ac vmlinux.rv32_nosmp_defconfig.clang-19
  +44    .   .   +44   +2c vmlinux.nommu_virt_defconfig.clang-19
  +12  +64   .   +76   +4c vmlinux.defconfig.gcc-13             
  +12  +64   .   +76   +4c vmlinux.nosmp_defconfig.gcc-13       
  +20 +128   .  +148   +94 vmlinux.rv32_defconfig.gcc-13        
  +16 +128   .  +144   +90 vmlinux.rv32_nosmp_defconfig.gcc-13  
  +16  +64   .   +80   +50 vmlinux.nommu_virt_defconfig.gcc-13  
  +44 +192   .  +236   +ec vmlinux.defconfig.clang-18           
  +44  +96   .  +140   +8c vmlinux.nosmp_defconfig.clang-18     
  +44 +160   .  +204   +cc vmlinux.rv32_defconfig.clang-18      
  +44 +160   .  +204   +cc vmlinux.rv32_nosmp_defconfig.clang-18
  +44  +64   .  +108   +6c vmlinux.nommu_virt_defconfig.clang-18
  +12  +64   .   +76   +4c vmlinux.defconfig.gcc-12             
  +12  +64   .   +76   +4c vmlinux.nosmp_defconfig.gcc-12       
  +12 +128   .  +140   +8c vmlinux.rv32_defconfig.gcc-12        
  +12 +160   .  +172   +ac vmlinux.rv32_nosmp_defconfig.gcc-12  
  +16    .   .   +16   +10 vmlinux.nommu_virt_defconfig.gcc-12  
  +44 +160   .  +204   +cc vmlinux.defconfig.clang-17           
  +56  +96   .  +152   +98 vmlinux.nosmp_defconfig.clang-17     
  +44  +96   .  +140   +8c vmlinux.rv32_defconfig.clang-17      
  +44  +96   .  +140   +8c vmlinux.rv32_nosmp_defconfig.clang-17
  +36    .   .   +36   +24 vmlinux.nommu_virt_defconfig.clang-17
   +8  +64   .   +72   +48 vmlinux.defconfig.gcc-11             
  +16  +64   .   +80   +50 vmlinux.nosmp_defconfig.gcc-11       
  +12  +96   .  +108   +6c vmlinux.rv32_defconfig.gcc-11        
  +16 +160   .  +176   +b0 vmlinux.rv32_nosmp_defconfig.gcc-11  
  +16  +64   .   +80   +50 vmlinux.nommu_virt_defconfig.gcc-11  
  +16    .   .   +16   +10 vmlinux.allnoconfig.gcc-14           
 +128  +64   .  +192   +c0 vmlinux.allmodconfig.gcc-14          
  +28  +32   .   +60   +3c vmlinux.allnoconfig.clang-19         
+8208 +408 +64 +8680 +21e8 vmlinux.allmodconfig.clang-19        

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
