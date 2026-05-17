Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E51A8CD4F3C
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 00:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MWteUGAFoc1uGvoefz6AVbo8XEak3lOuy20tbtH5in4=; b=SJFNpsqXlS5ljG
	T29ChaRgmL6NhHHJHHSHffoTQRlWu6qqGbJGXO+6CaTVCVI7WDJdGQzlfakt7Ta6ewImoffsC9Twm
	KlzpRSEUP3Qm9uAxUYOCRjZoQx054J3YlpYio1Ajxyj3dZuUZMOsXDd79sqkigwvXffPLvnPflwTi
	F5WebitR+3mzTUEEhvGoZ0STgRO/UX159EeCWyelj6W/+MCN3oCr3j29I5MA421FHytgt83JZ1x3O
	6T2x3Agq1DgI8hBNqAxi95u4GVnPIw1M22JlbpK6xXxIUS8+396qwYtN6zplt0zwciQKR7K7gWLk3
	2jHqud1w5yYobIpIJNBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOPpv-0000000Boa3-3gCh;
	Sun, 17 May 2026 00:58:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOPpt-0000000BoZX-1U0T
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 00:58:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FBC941A11;
	Sun, 17 May 2026 00:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF91C19425;
	Sun, 17 May 2026 00:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778979506;
	bh=zrRNJA6C8IKLGDuoz2/3Q5VZdwYtdBqQqMC0HQ2fRWQ=;
	h=Date:From:To:cc:Subject:From;
	b=gQYFHw3mW0g+0qFC0d17o90aC/hRi6im+88+BXdhJRShxhuokTsG09ehynvxUPoxs
	 htbZ2JBlpH9Ru3nzD/pL+ITUUytU0BQPJd4IdM2pXKhfMj2SvY21A7PVO76ZWmFvAy
	 lBUG7wpUyV1CMfw4vbtKa6+FuYioPRXoTgWoZW7cmb6tAWmHTMGf66wUk5qvMDGMw6
	 NzfQcYREzS7SWf8X//bCNRQ22M8cmqhFE/WrL6YoFZ6007uUICbZMPiCk+R0OR4H8u
	 onFJuLFHn0/kE6AmR5FfbNe6w7Gkv7z/riactx48WoYu7aLjpgqS0SZrGi2PJAnYBM
	 ZUHYDffnprm/g==
Date: Sat, 16 May 2026 18:58:23 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.1-rc4
Message-ID: <95613c06-fa15-c5ae-cf7e-92fd91563e74@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_175829_437752_76A6B9E7 
X-CRM114-Status: GOOD (  15.55  )
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

Please pull these fixes for v7.1-rc4.  These are relatively low-impact 
fixes.  Probably the most notable one is that we no longer ask the 
monitor-mode firmware to delegate misaligned access handling to the kernel 
by default, since the kernel code needs significant improvement to match 
the functionality of the firmware.  This change avoids functional problems 
at some cost in performance, but shouldn't affect any system with 
misaligned access handling in hardware.


thanks,

- Paul

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.1-rc4

for you to fetch changes up to b69bcb13ed7024a84d6cd8ad330f1e32782fcf28:

  riscv: misaligned: Make enabling delegation depend on NONPORTABLE (2026-05-13 22:26:32 -0600)

----------------------------------------------------------------
RISC-V updates for v7.1-rc4

- Disable satp register probing when no5lvl is specified on the kernel
  command line

- Fix a CFI-related issue with the misaligned access speed measurement
  code

- Reduce the CFI shadow stack size limit from 4GB to 2GB (following
  ARM64 GCS)

- Prevent the kernel from requesting delegation of misaligned access
  faults unless a new Kconfig option,
  CONFIG_RISCV_SBI_FWFT_DELEGATE_MISALIGNED, is enabled.  This will
  depend on CONFIG_NONPORTABLE until the deficiencies of the kernel
  misaligned access fixup code are fixed

- Fix some potential uninitialized memory accesses in error paths in
  compat_riscv_gpr_set() and compat_restore_sigcontext()

- Fix a bug in the RISC-V MIPS vendor errata patching code where a
  logical-and was used in place of a bitwise-and

- Drop some unnecessary code in riscv_fill_hwcap_from_isa_string()

- Use macros for isa2hwcap indices in riscv_fill_hwcap(), rather than
  open-coding them

- Fix some documentation typos (one affecting "make htmldocs")

----------------------------------------------------------------
Avi Radinsky (1):
      Documentation: riscv: cmodx: fix typos

Guo Ren (Alibaba DAMO Academy) (1):
      riscv: mm: Fixup no5lvl failure when vaddr is invalid

Hui Wang (2):
      riscv: cpufeature: Drop this_hwcap clear in T-Head vector workaround
      riscv: cpufeature: Use pre-defined ISA ext macros to index isa2hwcap

Michael Neuling (2):
      riscv: errata: Fix bitwise vs logical AND in MIPS errata patching
      riscv: Fix register corruption from uninitialized cregs on error

Nathan Chancellor (1):
      riscv: Define __riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START

Randy Dunlap (1):
      riscv: Docs: fix unmatched quote warning

Vivian Wang (1):
      riscv: misaligned: Make enabling delegation depend on NONPORTABLE

Zong Li (1):
      riscv: cfi: reduce shadow stack size limit from 4GB to 2GB

 Documentation/arch/riscv/cmodx.rst     |  8 ++++----
 Documentation/arch/riscv/zicfilp.rst   |  2 +-
 arch/riscv/Kconfig                     | 22 ++++++++++++++++++++++
 arch/riscv/errata/mips/errata.c        |  2 +-
 arch/riscv/kernel/compat_signal.c      |  2 ++
 arch/riscv/kernel/copy-unaligned.S     |  5 +++--
 arch/riscv/kernel/cpufeature.c         | 20 +++++++++-----------
 arch/riscv/kernel/ptrace.c             |  4 ++--
 arch/riscv/kernel/traps_misaligned.c   |  2 +-
 arch/riscv/kernel/usercfi.c            |  7 ++++---
 arch/riscv/kernel/vec-copy-unaligned.S |  5 +++--
 arch/riscv/mm/init.c                   | 25 +++++++++++++++++++++++++
 12 files changed, 77 insertions(+), 27 deletions(-)

vmlinux size differences in bytes (from 254f49634ee1):
 text  data  bss    dec   hex  filename                             
 -112   +32    .    -80   -50  vmlinux.defconfig.gcc-15             
 -100   +32    .    -68   -44  vmlinux.nosmp_defconfig.gcc-15       
 -124   -32    .   -156   -9c  vmlinux.rv32_defconfig.gcc-15        
 -116     .    .   -116   -74  vmlinux.rv32_nosmp_defconfig.gcc-15  
  -20   +64    .    +44   +2c  vmlinux.nommu_virt_defconfig.gcc-15  
  -44   -64    .   -108   -6c  vmlinux.defconfig.clang-20           
  -36   -32    .    -68   -44  vmlinux.nosmp_defconfig.clang-20     
 -108   +32    .    -76   -4c  vmlinux.rv32_defconfig.clang-20      
 -108   -32    .   -140   -8c  vmlinux.rv32_nosmp_defconfig.clang-20
   -4     .    .     -4    -4  vmlinux.nommu_virt_defconfig.clang-20
  -64   -32    .    -96   -60  vmlinux.defconfig.gcc-14             
  -72   -32    .   -104   -68  vmlinux.nosmp_defconfig.gcc-14       
 -120   +32    .    -88   -58  vmlinux.rv32_defconfig.gcc-14        
 -116   +32    .    -84   -54  vmlinux.rv32_nosmp_defconfig.gcc-14  
  -20  +256    .   +236   +ec  vmlinux.nommu_virt_defconfig.gcc-14  
  -32   -32    .    -64   -40  vmlinux.defconfig.clang-19           
  -32   +32    .      .     .  vmlinux.nosmp_defconfig.clang-19     
 -108   +32    .    -76   -4c  vmlinux.rv32_defconfig.clang-19      
 -108   +32    .    -76   -4c  vmlinux.rv32_nosmp_defconfig.clang-19
   -4   +64    .    +60   +3c  vmlinux.nommu_virt_defconfig.clang-19
  -68   +32    .    -36   -24  vmlinux.defconfig.gcc-13             
  -60   +32    .    -28   -1c  vmlinux.nosmp_defconfig.gcc-13       
 -132   +32    .   -100   -64  vmlinux.rv32_defconfig.gcc-13        
 -124   +32    .    -92   -5c  vmlinux.rv32_nosmp_defconfig.gcc-13  
  -20  +256    .   +236   +ec  vmlinux.nommu_virt_defconfig.gcc-13  
  -32   -32    .    -64   -40  vmlinux.defconfig.clang-18           
  -28   +32    .     +4    +4  vmlinux.nosmp_defconfig.clang-18     
 -108   +32    .    -76   -4c  vmlinux.rv32_defconfig.clang-18      
 -108   -32    .   -140   -8c  vmlinux.rv32_nosmp_defconfig.clang-18
   -4   +64    .    +60   +3c  vmlinux.nommu_virt_defconfig.clang-18
  -88   -32    .   -120   -78  vmlinux.defconfig.gcc-12             
  -72   -32    .   -104   -68  vmlinux.nosmp_defconfig.gcc-12       
 -136   +32    .   -104   -68  vmlinux.rv32_defconfig.gcc-12        
 -112   +32    .    -80   -50  vmlinux.rv32_nosmp_defconfig.gcc-12  
  -16  +320    .   +304  +130  vmlinux.nommu_virt_defconfig.gcc-12  
  +16   -32    .    -16   -10  vmlinux.defconfig.clang-17           
  +16   +32    .    +48   +30  vmlinux.nosmp_defconfig.clang-17     
 -104   +32    .    -72   -48  vmlinux.rv32_defconfig.clang-17      
 -108   +32    .    -76   -4c  vmlinux.rv32_nosmp_defconfig.clang-17
   -4   +64    .    +60   +3c  vmlinux.nommu_virt_defconfig.clang-17
  -56   -32    .    -88   -58  vmlinux.defconfig.gcc-11             
  -48   -64    .   -112   -70  vmlinux.nosmp_defconfig.gcc-11       
 -136   +32    .   -104   -68  vmlinux.rv32_defconfig.gcc-11        
 -112   +32    .    -80   -50  vmlinux.rv32_nosmp_defconfig.gcc-11  
  -16  +256    .   +240   +f0  vmlinux.nommu_virt_defconfig.gcc-11  
  -48   -96    .   -144   -90  vmlinux.allnoconfig.gcc-14           
  +64     .    .    +64   +40  vmlinux.allmodconfig.gcc-14          
  -48   -96    .   -144   -90  vmlinux.allnoconfig.clang-19         
-1200     .   -8  -1208  -4b8  vmlinux.allmodconfig.clang-19        

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
