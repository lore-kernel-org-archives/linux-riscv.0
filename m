Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3C4CCFA05
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 22:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LuziIDFQ608MlGwWQwFelskjGiH1wge/scDbKJZ3j0M=; b=PfYx9butKRSStM
	vL0qtcKb1C0FQkPyx39FI9eqB5ecg65SoTwARUdiqtFG+z6s3quVhYItPGphgrgE4pVq2mAqPQiOE
	NI3pq3KaxOJT8eXplxnVOqs8i27fgKUqnYr3IT8KLPoZ63VAZ397s2H8JA1pH5sXXQK17hhGNKyVU
	rnJH0dqrmxa88oM/Cyxg/Fqzc1hgbw21U0DYbU5H4Lbr1ubqhOPz+P4GHyk68v/FgL5FhDZ39oNH+
	jPW3XoEMdm/OaeMOPgnDwdMtNt9vc3w8j3OFPslYk8Qh1IYgpD+yYdRd0ayFX96+5nz1l0X6gH+ML
	dEtTFWmayS1DrVdhDEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8qA-0000000GKVl-2xTH;
	Thu, 06 Nov 2025 22:52:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH8q8-0000000GKVI-0lFi
	for linux-riscv@lists.infradead.org;
	Thu, 06 Nov 2025 22:52:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BBDF4454C;
	Thu,  6 Nov 2025 22:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB47C4CEFB;
	Thu,  6 Nov 2025 22:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762469543;
	bh=IRSfT8Qcf/blTDsXUTYbvaNw0dJP4wdg2wtqcoH4yR4=;
	h=Date:From:To:cc:Subject:From;
	b=EunqhHxgmUSdhXFTenfnXxc0Emrh3LEc4uoA6tGgiY5NJC02JnZpkeK4rQkDOuv0y
	 ROjoeFLWeEXSTiUKLWZct/fsWRfl1VtXEMTdj/YTZSPPns0S3/I3/qQTc5P2/qTtFs
	 +tg9PxCiZWGUDhAH7Idie5DNQ50oEHyrlwYHzW9xMoPGBDxqSIxQWUzRoBzmNcM3/5
	 RTqzEifevewgnrVcz3iCpFrg18tRK2ZA+deESaPngDpDVgaOrZUr5jM7GKpyLi7vyW
	 nM/s6ilnEaO+CjG3VCVSlF4vV/X82aR8HitsdrqI3i2/Quf5k11Cd1DAszSajDDzSO
	 QlbCDysn0YH8Q==
Date: Thu, 6 Nov 2025 15:52:22 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v6.18-rc5
Message-ID: <50a5b4a5-18ae-6dda-bdbd-db67e112bc1b@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_145224_258553_94CD045A 
X-CRM114-Status: GOOD (  11.43  )
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

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc5

for you to fetch changes up to 2e448567839c65768486d56612c88cb327d26050:

  cpuidle: riscv-sbi: Replace deprecated strcpy in sbi_cpuidle_init_cpu (2025-10-27 23:38:13 -0600)


- Paul
----------------------------------------------------------------
RISC-V updates for v6.18-rc5

Some RISC-V updates for v6.18-rc5, including:

- A fix to disable KASAN checks while walking a non-current task's
  stackframe (following x86)

- A fix for a kvrealloc()-related memory leak in
  module_frob_arch_sections()

- Two replacements of strcpy() with strscpy()

- A change to use the RISC-V .insn assembler directive when possible
  to assemble instructions from hex opcodes

- Some low-impact fixes in the ptdump code and kprobes test code

----------------------------------------------------------------
Ben Dooks (1):
      riscv: asm: use .insn for making custom instructions

Chunyan Zhang (1):
      riscv: stacktrace: Disable KASAN checks for non-current tasks

Josephine Pfeiffer (1):
      riscv: ptdump: use seq_puts() in pt_dump_seq_puts() macro

Miaoqian Lin (1):
      riscv: Fix memory leak in module_frob_arch_sections()

Thorsten Blum (2):
      riscv: KGDB: Replace deprecated strcpy in kgdb_arch_handle_qxfer_pkt
      cpuidle: riscv-sbi: Replace deprecated strcpy in sbi_cpuidle_init_cpu

Vivian Wang (2):
      riscv: tests: Rename kprobes_test_riscv to kprobes_riscv
      riscv: tests: Make RISCV_KPROBES_KUNIT tristate

 arch/riscv/include/asm/asm.h                    |  6 ++++++
 arch/riscv/include/asm/insn-def.h               |  8 ++++----
 arch/riscv/include/asm/vendor_extensions/mips.h |  6 +++---
 arch/riscv/kernel/kgdb.c                        |  4 ++--
 arch/riscv/kernel/module-sections.c             |  8 ++++++--
 arch/riscv/kernel/stacktrace.c                  | 21 +++++++++++++++++++--
 arch/riscv/kernel/tests/Kconfig.debug           |  2 +-
 arch/riscv/kernel/tests/kprobes/Makefile        |  4 +++-
 arch/riscv/kernel/tests/kprobes/test-kprobes.c  |  5 ++++-
 arch/riscv/mm/ptdump.c                          |  2 +-
 drivers/cpuidle/cpuidle-riscv-sbi.c             |  5 +++--
 11 files changed, 52 insertions(+), 19 deletions(-)

vmlinux size differences in bytes (from v6.18-rc3):
 text  data bss    dec   hex filename                             
 -112   +64   .    -48   -30 vmlinux.defconfig.gcc-15             
 -104   +64   .    -40   -28 vmlinux.nosmp_defconfig.gcc-15       
 -112  +160   .    +48   +30 vmlinux.rv32_defconfig.gcc-15        
  +32   +96   .   +128   +80 vmlinux.rv32_nosmp_defconfig.gcc-15  
  +24   +64   .    +88   +58 vmlinux.nommu_virt_defconfig.gcc-15  
  +32   +96   .   +128   +80 vmlinux.defconfig.clang-20           
  +24   +96   .   +120   +78 vmlinux.nosmp_defconfig.clang-20     
  +40   +96   .   +136   +88 vmlinux.rv32_defconfig.clang-20      
  +32  +160   .   +192   +c0 vmlinux.rv32_nosmp_defconfig.clang-20
   +8   +64   .    +72   +48 vmlinux.nommu_virt_defconfig.clang-20
 -112  +128   .    +16   +10 vmlinux.defconfig.gcc-14             
 -104   +64   .    -40   -28 vmlinux.nosmp_defconfig.gcc-14       
 -104   +96   .     -8    -8 vmlinux.rv32_defconfig.gcc-14        
  +24  +160   .   +184   +b8 vmlinux.rv32_nosmp_defconfig.gcc-14  
  +24   +64   .    +88   +58 vmlinux.nommu_virt_defconfig.gcc-14  
  +36  +128   .   +164   +a4 vmlinux.defconfig.clang-19           
  +40   +96   .   +136   +88 vmlinux.nosmp_defconfig.clang-19     
  +40   +96   .   +136   +88 vmlinux.rv32_defconfig.clang-19      
  +48  +128   .   +176   +b0 vmlinux.rv32_nosmp_defconfig.clang-19
  +16     .   .    +16   +10 vmlinux.nommu_virt_defconfig.clang-19
    .     .   .      .     . vmlinux.allnoconfig.gcc-14           
-5937 -4656   . -10593 -2961 vmlinux.allmodconfig.gcc-14          

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
