Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BC5C43458
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 17:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zdPhTieR4i2Lqq91tMR2ANShLNabU+Xr18Nj1moZ/PQ=; b=IdipDz469owvNT
	NMmi0sn4/iDfBwdviXGf6MS893bdUqhk5CWaLMqxX4ONdwe0ME5DFvjATNSJorB70qTaPll0Az7WD
	s4A5fNeqPLdZ2LO4xA36t4vDXtsxvFVJQxlu+OKeihLJm34ylwNtMjNZnqh/DcEn32YindyKtUGO7
	4tq4d6FefQqg+UzaCW/827RXXfZBGvoCOKgzqmIFrL2Cr476aJOEL27APl2gdzfW9qnneV2BMtaY5
	7qNriMsDMkS4cTKbrJdyYy3Tk8jDhImlMbMz62sKqy3u5VQohDpc4nNAmr8c//zNrICwQocOW9Zdi
	nKzF3qUaNQOAyQDQ/2aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiy5b-00000007e73-3Oz4;
	Sun, 12 Jul 2026 17:35:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiy5a-00000007e6v-1Rjr
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 17:35:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4ED1C6004E;
	Sun, 12 Jul 2026 17:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF0911F000E9;
	Sun, 12 Jul 2026 17:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783877737;
	bh=9ld8Q0WR1/5u597ChW8JvxRAobXsFbg3Kdic282Vsmw=;
	h=Date:From:To:cc:Subject;
	b=Itrl5f7r/OpDGuI6yZpMJt58RBWAQRO2KK/4MCapjdmXT/H6r3NblnGiCJcdJgg6I
	 p+FhbhUOADyAy7mAuuw/cWaWKsXhIaMpV/fJ405xQFggGT8/n2qOsq5ZmOh2VbHhQB
	 tgylz6tGTazqsbPz9srxtB6xKehY0xh8pO1EX9pWyjMCuekGe4J/Mn+awLKm49mZ8h
	 yG/GgxrPa1hNgx+xeBqLycM6Ec/zqLmYIKC7HR/pWn8ULj0MEO8jFvebXECli3GMJH
	 1vAqFAuf9QD8lWGTb+9NJEVQGdufQEJhTVCPBilvIUX8urQLZsGy31EIXGtSj7vDh3
	 E0iDPQepkLy8g==
Date: Sun, 12 Jul 2026 11:35:34 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.2-rc3
Message-ID: <3eee4a66-e241-8779-e99d-2403abe88433@kernel.org>
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

Please pull these RISC-V updates for v7.2-rc3.  From a maintenance point 
of view, the most notable change involves the rseq kselftest common 
Makefile (as it is not RISC-V-specific).  The basic approach in the patch 
appears similar to one used in the KVM and S390 selftests (grep for 
LINUX_TOOL_ARCH_INCLUDE and SUBARCH), and the rseq kselftests pass a quick 
build test on x86 after this patch is applied.

thanks,

- Paul

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc3

for you to fetch changes up to 58a37e7317b06665e21609a2f867a9962e9e2919:

  selftests/riscv: ptrace: Fix memory leak of regset_data in vector tests (2026-07-10 09:32:35 -0600)

----------------------------------------------------------------
RISC-V updates for v7.2-rc3

- Avoid a null pointer deference in machine_kexec_prepare() that the
  IMA subsystem can trigger

- Bypass libc in part of the ptrace_v_not_enabled kselftest to avoid
  noise from child atfork handlers that libc might run

- Include Kconfig support for UltraRISC SoCs, already referenced by
  some device drivers; and enable it in our defconfig

- Fix the build of the rseq kselftest for RISC-V by borrowing a
  technique from the KVM and S390 kselftests that includes
  arch-specific header files from tools/arch/<arch>/include

- Fix some memory leaks in the RISC-V vector ptrace kselftests

- Clean up some DT bindings and hwprobe documentation

----------------------------------------------------------------
Andrew Jones (2):
      selftests: riscv: Bypass libc in inactive vector ptrace test
      riscv: hwprobe.rst: Make indentation consistent

Guodong Xu (2):
      dt-bindings: riscv: sort multi-letter Z extensions alphanumerically
      riscv: hwprobe.rst: Document EXT_ZICFISS and EXT_ZICFILP

Hui Wang (1):
      selftests/rseq: Fix a building error for riscv arch

Jia Wang (2):
      riscv: add UltraRISC SoC family Kconfig support
      riscv: defconfig: enable ARCH_ULTRARISC

Tao Liu (1):
      riscv: Prevent NULL pointer dereference in machine_kexec_prepare()

Wang Yan (1):
      selftests/riscv: ptrace: Fix memory leak of regset_data in vector tests

 Documentation/arch/riscv/hwprobe.rst               | 204 +++++++++++----------
 .../devicetree/bindings/riscv/extensions.yaml      | 184 +++++++++----------
 arch/riscv/Kconfig.socs                            |   6 +
 arch/riscv/configs/defconfig                       |   1 +
 arch/riscv/kernel/machine_kexec.c                  |   3 +
 .../selftests/riscv/vector/validate_v_ptrace.c     |  15 +-
 tools/testing/selftests/rseq/Makefile              |   6 +-
 7 files changed, 222 insertions(+), 197 deletions(-)

vmlinux size differences in bytes (from 8cdeaa50eae8):
  text   data   bss     dec    hex  filename                             
 +3054  +4604     .   +7658  +1dea  vmlinux.defconfig.gcc-16             
     .  +4160     .   +4160  +1040  vmlinux.nosmp_defconfig.gcc-16       
 +3154  +3316     .   +6470  +1946  vmlinux.rv32_defconfig.gcc-16        
     .    +96     .     +96    +60  vmlinux.rv32_nosmp_defconfig.gcc-16  
     .    +64     .     +64    +40  vmlinux.nommu_virt_defconfig.gcc-16  
 +2930  +4620     .   +7550  +1d7e  vmlinux.defconfig.clang-20           
     .    +64     .     +64    +40  vmlinux.nosmp_defconfig.clang-20     
 +3014  +2952     .   +5966  +174e  vmlinux.rv32_defconfig.clang-20      
     .    +64     .     +64    +40  vmlinux.rv32_nosmp_defconfig.clang-20
     .      .     .       .      .  vmlinux.nommu_virt_defconfig.clang-20
 +3086  +4604     .   +7690  +1e0a  vmlinux.defconfig.gcc-15             
     .    +96     .     +96    +60  vmlinux.nosmp_defconfig.gcc-15       
 +2674  +3284     .   +5958  +1746  vmlinux.rv32_defconfig.gcc-15        
     .    +96     .     +96    +60  vmlinux.rv32_nosmp_defconfig.gcc-15  
     .      .     .       .      .  vmlinux.nommu_virt_defconfig.gcc-15  
 +3070  +4604     .   +7674  +1dfa  vmlinux.defconfig.gcc-14             
     .    +64     .     +64    +40  vmlinux.nosmp_defconfig.gcc-14       
 +2682  +3316     .   +5998  +176e  vmlinux.rv32_defconfig.gcc-14        
     .    +64     .     +64    +40  vmlinux.rv32_nosmp_defconfig.gcc-14  
     .      .     .       .      .  vmlinux.nommu_virt_defconfig.gcc-14  
 +2962  +4588     .   +7550  +1d7e  vmlinux.defconfig.clang-19           
     .    +64     .     +64    +40  vmlinux.nosmp_defconfig.clang-19     
 +3018  +2956     .   +5974  +1756  vmlinux.rv32_defconfig.clang-19      
     .    +64     .     +64    +40  vmlinux.rv32_nosmp_defconfig.clang-19
     .    +64     .     +64    +40  vmlinux.nommu_virt_defconfig.clang-19
 +3070  +4604     .   +7674  +1dfa  vmlinux.defconfig.gcc-13             
     .    +96     .     +96    +60  vmlinux.nosmp_defconfig.gcc-13       
 +2674  +3316     .   +5990  +1766  vmlinux.rv32_defconfig.gcc-13        
     .    +64     .     +64    +40  vmlinux.rv32_nosmp_defconfig.gcc-13  
     .    +64     .     +64    +40  vmlinux.nommu_virt_defconfig.gcc-13  
 +2954  +8684     .  +11638  +2d76  vmlinux.defconfig.clang-18           
     .    +96     .     +96    +60  vmlinux.nosmp_defconfig.clang-18     
 +3074  +3500     .   +6574  +19ae  vmlinux.rv32_defconfig.clang-18      
     .    +96     .     +96    +60  vmlinux.rv32_nosmp_defconfig.clang-18
     .      .     .       .      .  vmlinux.nommu_virt_defconfig.clang-18
 +3046  +4668     .   +7714  +1e22  vmlinux.defconfig.gcc-12             
     .    +64     .     +64    +40  vmlinux.nosmp_defconfig.gcc-12       
 +3114  +3380     .   +6494  +195e  vmlinux.rv32_defconfig.gcc-12        
     .    +64     .     +64    +40  vmlinux.rv32_nosmp_defconfig.gcc-12  
     .    +64     .     +64    +40  vmlinux.nommu_virt_defconfig.gcc-12  
 +2970  +4556     .   +7526  +1d66  vmlinux.defconfig.clang-17           
     .  +4160     .   +4160  +1040  vmlinux.nosmp_defconfig.clang-17     
 +3054  +2956     .   +6010  +177a  vmlinux.rv32_defconfig.clang-17      
     .    +96     .     +96    +60  vmlinux.rv32_nosmp_defconfig.clang-17
     .    +64     .     +64    +40  vmlinux.nommu_virt_defconfig.clang-17
 +3062  +4636     .   +7698  +1e12  vmlinux.defconfig.gcc-11             
     .    +64     .     +64    +40  vmlinux.nosmp_defconfig.gcc-11       
 +3114  +3316     .   +6430  +191e  vmlinux.rv32_defconfig.gcc-11        
     .    +96     .     +96    +60  vmlinux.rv32_nosmp_defconfig.gcc-11  
     .      .     .       .      .  vmlinux.nommu_virt_defconfig.gcc-11  
     .    +32     .     +32    +20  vmlinux.allnoconfig.gcc-15           
-12848  +4460  +320   -8068  -1f84  vmlinux.allmodconfig.gcc-15          
     .      .     .       .      .  vmlinux.allnoconfig.clang-19         
-10608   +204   -64  -10468  -28e4  vmlinux.allmodconfig.clang-19        

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
