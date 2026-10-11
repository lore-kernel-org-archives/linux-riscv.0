Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB9ACA9EBD
	for <linux-riscv@archiver.kernel.org>; Sun, 11 Oct 2026 06:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ifXvMTxKzViZ3eZUgNAhVF7HZR/vqCZyaywWZ5vLNxQ=; b=e2dLzGdv5TD52c
	CEMowN95SFeL7/Py7VhDZYB6UDMA8WL24dD9sFS6Bz8Qjb+aiKObzCrj10LT3Xmslsg3AeQTXrta7
	rExanc5RjDS/5p8d7F3912QxUiGHMjXF1QNAAZ4Pb2pyFNEiK/dESkd8ehlI4p7YrJgj0vF8czWAB
	zUqNM2EkR4pvN1xySqCNXaeYxfSm5PJvZnmsob7ecHe/Aaq8fa8O+BpzPj8g3rkaNigad1Rgz/42P
	RHdzTKZmqDTlQ1Dz73HrRtIEwAeE2qWcYwRfRGYt6p5/b/qn6w94k7RK9tjrUUyNvj8OOAlDFu8lo
	KcPF6sFe9aSnvt7/rtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmgS-00000008kNe-0P4F;
	Sun, 11 Oct 2026 06:05:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFmgQ-00000008kNY-3wm2
	for linux-riscv@lists.infradead.org;
	Sun, 11 Oct 2026 06:05:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90697600AA;
	Sun, 11 Oct 2026 06:05:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EF8E1F0089B;
	Sun, 11 Oct 2026 06:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791698717;
	bh=rDi96VlYOBvhIvekYeLkyKZiPeCsSa9Uoat3T+Sn7TY=;
	h=Date:From:To:Subject;
	b=oUZxwpYQoZK2/YHdgNIlZBtjCVALsfz0Us4TWBhvCpqfLpxjefeofWfPA39wcZN7s
	 W0i6AnT9C6eI0ibZLGvOyPsv2eEzgRW74jdiZYTmzFNUljqmxhDSXPVeiTZ633rcis
	 fKbaHXMM1X+A48/tKaTHcntTc47ZpwHFWfkUjkEU02f///ZI9X4prZCw+2YbgbtQWo
	 lXi+NjeBdCcM6wJQgch7i4BeuvrFCZ4gIw4YLp9ODoqhj8mGrbRl2CYEGV45xJRJmU
	 TLGUS4W659qXe6qoMAuJqu5dXDVdBKpZhWLQ6/MmQGx13chSov/lsZNViKe4E5PNTc
	 ZxUP/XHrCs11Q==
Date: Sun, 11 Oct 2026 00:05:14 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V updates for v7.3-rc7
Message-ID: <b31764b3-32cd-644e-4e07-52c3d1f24265@kernel.org>
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

Please pull these RISC-V updates for v7.3-rc7.  There are several security 
fixes, a significant strnlen() regression fix, and several other 
miscellaneous fixes.  My intention was to send these earlier, but LPC got 
in the way.


thanks,

- Paul


The following changes since commit a90ee4305c4a5df72c11b31dacfdc76e00fcf78a:

  Linux 7.3-rc6 (2026-10-04 13:45:25 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.3-rc7

for you to fetch changes up to d4f25b097e46d82718bb737d4540c99b7ab0a408:

  riscv: fix load_unaligned_zeropad() fixup for RV32 (2026-10-07 20:25:09 -0600)

----------------------------------------------------------------
RISC-V updates for v7.3-rc7

- Fix a regression in the Zbb-enabled strnlen() implementation when
  huge counts are specified

- When userspace pointer masking is enabled, strip the tag from
  user-specified pointers in two spots in the RISC-V futex code where
  this was missing

- When CONFIG_SHADOW_CALL_STACK=y, use a supervisor mode-only CSR bit
  to determine whether the trap came from userspace or not, rather
  than a userspace-writable register

- Reset the HSTATUS.HU bit during CPU initialization to avoid
  unexpected behavior, as the RISC-V specification does not require
  this bit to be hardware-reset

- Fix the T-Head GhostWrite probing code when !CONFIG_ERRATA_THEAD_MAE

- Fix RV32 boots using 32-bit.config by constraining NR_CPUS

- Implement a workaround for SiFive MAL-9092, which requires fences
  around hypervisor load/store instructions

- Fix the RISC-V patch_map() code to work properly for EXECMEM
  addresses when !CONFIG_STRICT_MODULE_RWX

- Fix ptrace register set access reporting when CFI landing pad or
  shadow stack support is enabled

- Avoid copying garbage into the target's vstate when PTRACE_SETREGSET
  is called with a short iov_len

- Fix load_unaligned_zeropad() on RV32 kernels with
  CONFIG_RISCV_EFFICIENT_UNALIGNED_ACCESS=y

- Fix build breakage for any userspace program that includes
  uapi/asm/vendor/mips.h

- Fix a build warning for 32-bit allmodconfig builds related to SiFive
  errata

- Fix misspecified inline assembly constraints in the vector context
  save/restore code

----------------------------------------------------------------
Arnd Bergmann (1):
      riscv: limit sifive errata to CONFIG_64BIT

Aurelien Jarno (1):
      riscv: vector: Fix output operands in context save

Chen Pei (1):
      riscv: ptrace: reject CFI regset access when extensions are absent

Karl Mehltretter (1):
      riscv: fix load_unaligned_zeropad() fixup for RV32

Leo Yu-Chi Liang (1):
      riscv: fix NR_CPUS range leaking 64-bit default onto 32-bit builds

Shao Mingyin (1):
      riscv: lib: Fix ZBB strnlen wrap-around regression on huge counts

Troy Mitchell (1):
      riscv: vector: Fix data pointer constraints in context save/restore

Wei-Jie Hung (1):
      riscv: patch: fix handling of bpf-jit execmem addresses

Yong-Xuan Wang (2):
      RISC-V: errata: Add SiFive MAL-9092 workaround
      RISC-V: Clear HSTATUS.HU on CPU initialization

Ziyi Guo (2):
      riscv: futex: untag the user pointer before the atomic access
      riscv: entry: gate shadow call stack reload on sstatus.SPP, not tp

Zongmin Zhou (3):
      riscv: hwprobe: use _BITULL() rather than BIT() in MIPS vendor uapi header
      riscv: errata: select RISCV_ALTERNATIVE_EARLY for THEAD GHOSTWRITE
      riscv: ptrace: Zero-initialize regset buffers before copyin

 arch/riscv/Kconfig                           |  5 +++--
 arch/riscv/Kconfig.errata                    | 17 ++++++++++++++++-
 arch/riscv/Kconfig.socs                      |  1 +
 arch/riscv/errata/sifive/errata.c            | 20 ++++++++++++++++++++
 arch/riscv/include/asm/cpufeature.h          |  2 ++
 arch/riscv/include/asm/errata_list_vendors.h |  3 ++-
 arch/riscv/include/asm/futex.h               |  2 ++
 arch/riscv/include/asm/insn-def.h            | 16 +++++++++++++---
 arch/riscv/include/asm/scs.h                 | 17 +++++++++++++----
 arch/riscv/include/asm/vector.h              |  8 ++++----
 arch/riscv/include/uapi/asm/vendor/mips.h    |  4 +++-
 arch/riscv/kernel/cpufeature.c               | 12 ++++++++++++
 arch/riscv/kernel/entry.S                    |  2 +-
 arch/riscv/kernel/patch.c                    |  2 +-
 arch/riscv/kernel/ptrace.c                   |  8 ++++++++
 arch/riscv/kernel/setup.c                    |  2 ++
 arch/riscv/kernel/smpboot.c                  |  2 ++
 arch/riscv/kernel/suspend.c                  |  2 ++
 arch/riscv/lib/strnlen.S                     | 20 ++++++++++++++++++--
 arch/riscv/mm/extable.c                      |  4 ++--
 20 files changed, 127 insertions(+), 22 deletions(-)

vmlinux size differences in bytes (from a90ee4305c4a):
  text    data     bss     dec    hex  filename                             
  +424    +128       .    +552   +228  vmlinux.defconfig.gcc-16             
  +408    +128       .    +536   +218  vmlinux.nosmp_defconfig.gcc-16       
 -9710  -15080  -32720  -57510  -e0a6  vmlinux.rv32_defconfig.gcc-16        
 -4342   -4728       .   -9070  -236e  vmlinux.rv32_nosmp_defconfig.gcc-16  
  +315       .       .    +315   +13b  vmlinux.nommu_virt_defconfig.gcc-16  
  +216    +128       .    +344   +158  vmlinux.defconfig.clang-20           
  +180    +128       .    +308   +134  vmlinux.nosmp_defconfig.clang-20     
 -9366  -14936  -32848  -57150  -df3e  vmlinux.rv32_defconfig.clang-20      
 -4418   -5000       .   -9418  -24ca  vmlinux.rv32_nosmp_defconfig.clang-20
  +367     +64       .    +431   +1af  vmlinux.nommu_virt_defconfig.clang-20
  +404    +128       .    +532   +214  vmlinux.defconfig.gcc-15             
  +400    +128       .    +528   +210  vmlinux.nosmp_defconfig.gcc-15       
 -9626  -15080  -32720  -57426  -e052  vmlinux.rv32_defconfig.gcc-15        
 -4846   -4696       .   -9542  -2546  vmlinux.rv32_nosmp_defconfig.gcc-15  
  +291       .       .    +291   +123  vmlinux.nommu_virt_defconfig.gcc-15  
  +324    +128       .    +452   +1c4  vmlinux.defconfig.gcc-14             
  +332    +128       .    +460   +1cc  vmlinux.nosmp_defconfig.gcc-14       
 -9654  -15144  -32720  -57518  -e0ae  vmlinux.rv32_defconfig.gcc-14        
 -4370   -4696       .   -9066  -236a  vmlinux.rv32_nosmp_defconfig.gcc-14  
  +335     +64       .    +399   +18f  vmlinux.nommu_virt_defconfig.gcc-14  
  +212    +128       .    +340   +154  vmlinux.defconfig.clang-19           
  +176    +128       .    +304   +130  vmlinux.nosmp_defconfig.clang-19     
 -9182  -14936  -32784  -56902  -de46  vmlinux.rv32_defconfig.clang-19      
 -4410   -4488       .   -8898  -22c2  vmlinux.rv32_nosmp_defconfig.clang-19
  +367     +64       .    +431   +1af  vmlinux.nommu_virt_defconfig.clang-19
  +292    +128       .    +420   +1a4  vmlinux.defconfig.gcc-13             
  +304   +4256       .   +4560  +11d0  vmlinux.nosmp_defconfig.gcc-13       
 -9590  -15080  -32720  -57390  -e02e  vmlinux.rv32_defconfig.gcc-13        
 -4314   -4728       .   -9042  -2352  vmlinux.rv32_nosmp_defconfig.gcc-13  
  +239     +64       .    +303   +12f  vmlinux.nommu_virt_defconfig.gcc-13  
  +216    +128       .    +344   +158  vmlinux.defconfig.clang-18           
  +204    +128       .    +332   +14c  vmlinux.nosmp_defconfig.clang-18     
 -9074  -14936  -32784  -56794  -ddda  vmlinux.rv32_defconfig.clang-18      
 -4402   -4488       .   -8890  -22ba  vmlinux.rv32_nosmp_defconfig.clang-18
  +343       .       .    +343   +157  vmlinux.nommu_virt_defconfig.clang-18
  +288    +128       .    +416   +1a0  vmlinux.defconfig.gcc-12             
  +280    +128       .    +408   +198  vmlinux.nosmp_defconfig.gcc-12       
 -9646  -15080  -32720  -57446  -e066  vmlinux.rv32_defconfig.gcc-12        
 -4314   -4696       .   -9010  -2332  vmlinux.rv32_nosmp_defconfig.gcc-12  
  +239       .       .    +239    +ef  vmlinux.nommu_virt_defconfig.gcc-12  
  +192    +128       .    +320   +140  vmlinux.defconfig.clang-17           
  +188    +128       .    +316   +13c  vmlinux.nosmp_defconfig.clang-17     
 -8822  -14936  -32784  -56542  -dcde  vmlinux.rv32_defconfig.clang-17      
 -4442   -4488       .   -8930  -22e2  vmlinux.rv32_nosmp_defconfig.clang-17
  +343       .       .    +343   +157  vmlinux.nommu_virt_defconfig.clang-17
  +336    +128       .    +464   +1d0  vmlinux.defconfig.gcc-11             
  +352    +160       .    +512   +200  vmlinux.nosmp_defconfig.gcc-11       
 -8186  -15112  -32720  -56018  -dad2  vmlinux.rv32_defconfig.gcc-11        
 -4130   -4696       .   -8826  -227a  vmlinux.rv32_nosmp_defconfig.gcc-11  
  +239       .       .    +239    +ef  vmlinux.nommu_virt_defconfig.gcc-11  
   +40     +32       .     +72    +48  vmlinux.allnoconfig.gcc-15           
+14383    +400    +320  +15103  +3aff  vmlinux.allmodconfig.gcc-15          
   +42     +32       .     +74    +4a  vmlinux.allnoconfig.clang-19         
  +643    +128       .    +771   +303  vmlinux.allmodconfig.clang-19        

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
