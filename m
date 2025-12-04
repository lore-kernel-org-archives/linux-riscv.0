Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2686ED29FB4
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Dec 2025 19:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eI0Y/1HhBY676k7MpbGyQURnuBcqf96bigfAUJCom3s=; b=XxIaOjUlVargj4
	cILoarGM3cGnU3aB6ah7Fx8FYCyDz0qd9JqsYZoSXKjGV4nrsmTuOKVBF4/n0h9nqvsyiEh7s32K8
	yM5QtI5Ec8kn0dBUjVlX7lbFzt8lZsOl1nJiyWOy+p3rdRAsll+OrroRjCGaf0bm/7XL23fHGgPgf
	QN8KvK7I/zMt9p9k8hR/KXbD/rjXW3JvGlBAvRn3/AuVWvRaqhJrHm7YgKkxOKQ2ATNib8qdJhkmF
	+mGEH0yLet0dKG/J61KtUNhV8joAjDJN6gkZxB6n+zbqPDpCgr1H0UTQuB9hO+Nyo5jH3fB3+c56t
	rQ7GGs1bPnW0VrPN8tQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRErO-00000008UlA-2g49;
	Thu, 04 Dec 2025 19:19:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRErM-00000008Ukj-3dXQ
	for linux-riscv@lists.infradead.org;
	Thu, 04 Dec 2025 19:19:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7462D41A3F;
	Thu,  4 Dec 2025 19:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D10C4CEFB;
	Thu,  4 Dec 2025 19:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764875963;
	bh=aVQiG4laDMB+K0Hoprjq3w/pVCARzNmbtBauHoKvIHU=;
	h=Date:From:To:cc:Subject:From;
	b=PJBokKS+0ZPvFozQmq35DJxIpLVTbcdwqQobLBSy9ca9nzBR8ikxWEaVft6CvV53H
	 ObAfiNJfTKeGvW8cGp5DjLLyWpzmcsgucetVvTbWwAq431p2JK5JXFb2i7Uvok/pqh
	 Xcr+FZD4JYc7ZgGQUbp0RdK4EKPd6fIm1wlxAnA2glCwzhbJf1VK0nzvkJBxEZOGtJ
	 oZkR1hS52htMN5Kpon/83FZYQ8NsXO4HTQx4ca7wNryH9zRqjGDvgSl7icrgbNdgl1
	 ftGeTtkdYwWc0ahkxPsoDZV711FjLO3RLKB+iCC6bj/sQh1vdtsJ3MXPmxUbbU73+n
	 B/HA4QFEnE9cQ==
Date: Thu, 4 Dec 2025 12:19:20 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for the v6.19 merge window (part one)
Message-ID: <6b437742-e1c2-f6dd-61c8-fb3de45d3351@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_111924_947074_438C08A6 
X-CRM114-Status: GOOD (  13.81  )
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

Please pull this first set of RISC-V updates for the v6.19 merge window.  
The patches here should be uncontroversial.  They primarily involve 
probing support for recently-ratified RISC-V ISA extensions, kselftest 
additions, and cleanups.


- Paul

The following changes since commit 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8:

  Merge tag 'riscv-for-linus-6.18-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2025-11-10 15:35:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-mw1

for you to fetch changes up to a131fd60796dbfaa6297c0c8ca8e2a7610a64281:

  selftests/riscv: Add Zicbop prefetch test (2025-11-19 09:19:29 -0700)

----------------------------------------------------------------
First set of RISC-V updates for v6.19-rc1

- Enable parallel hotplug for RISC-V

- Optimize vector regset allocation for ptrace()

- Add a kernel selftest for the vector ptrace interface

- Enable the userspace RAID6 test to build and run using RISC-V
  vectors

- Add initial support for the Zalasr RISC-V ratified ISA extension

- For the Zicbop RISC-V ratified ISA extension to userspace, expose
  hardware and kernel support to userspace and add a kselftest for
  Zicbop

- Convert open-coded instances of 'asm goto's that are controlled by
  runtime ALTERNATIVEs to use riscv_has_extension_{un,}likely(),
  following arm64's alternative_has_cap_{un,}likely()

- Remove an unnecessary mask in the GFP flags used in some calls to
  pagetable_alloc()

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: Enable HOTPLUG_PARALLEL for secondary CPUs

Chunyan Zhang (3):
      raid6: riscv: Prevent compiler from breaking inline vector assembly code
      raid6: riscv: Allow code to be compiled in userspace
      raid6: test: Add support for RISC-V

Vishal Moola (Oracle) (1):
      riscv: Remove __GFP_HIGHMEM masking

Vivian Wang (5):
      riscv: pgtable: Use riscv_has_extension_unlikely
      riscv: checksum: Use riscv_has_extension_likely
      riscv: hweight: Use riscv_has_extension_likely
      riscv: bitops: Use riscv_has_extension_likely
      riscv: cmpxchg: Use riscv_has_extension_likely

Xu Lu (4):
      riscv: Add ISA extension parsing for Zalasr
      dt-bindings: riscv: Add Zalasr ISA extension description
      riscv: hwprobe: Export Zalasr extension
      riscv: Introduce Zalasr instructions

Yao Zihong (2):
      riscv: hwprobe: Expose Zicbop extension and its block size
      selftests/riscv: Add Zicbop prefetch test

Yong-Xuan Wang (2):
      riscv: ptrace: Optimize the allocation of vector regset
      selftests: riscv: Add test for the Vector ptrace interface

 Documentation/arch/riscv/hwprobe.rst               |  11 +-
 .../devicetree/bindings/riscv/extensions.yaml      |   5 +
 arch/riscv/Kconfig                                 |   2 +-
 arch/riscv/include/asm/arch_hweight.h              |  24 +-
 arch/riscv/include/asm/bitops.h                    |  32 +--
 arch/riscv/include/asm/checksum.h                  |  13 +-
 arch/riscv/include/asm/cmpxchg.h                   |  12 +-
 arch/riscv/include/asm/hwcap.h                     |   1 +
 arch/riscv/include/asm/hwprobe.h                   |   2 +-
 arch/riscv/include/asm/insn-def.h                  |  79 ++++++
 arch/riscv/include/asm/pgtable.h                   |  15 +-
 arch/riscv/include/asm/vector.h                    |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   3 +
 arch/riscv/kernel/cpufeature.c                     |   1 +
 arch/riscv/kernel/ptrace.c                         |  24 +-
 arch/riscv/kernel/smpboot.c                        |  15 ++
 arch/riscv/kernel/sys_hwprobe.c                    |   7 +
 arch/riscv/kernel/vector.c                         |   2 +
 arch/riscv/lib/csum.c                              |  53 +---
 arch/riscv/mm/init.c                               |   4 +-
 arch/riscv/mm/pgtable.c                            |  22 +-
 lib/raid6/recov_rvv.c                              |   7 +-
 lib/raid6/rvv.c                                    | 299 +++++++++++----------
 lib/raid6/rvv.h                                    |  17 ++
 lib/raid6/test/Makefile                            |   8 +
 tools/testing/selftests/riscv/hwprobe/cbo.c        | 165 ++++++++++--
 tools/testing/selftests/riscv/vector/Makefile      |   5 +-
 .../testing/selftests/riscv/vector/vstate_ptrace.c | 134 +++++++++
 28 files changed, 657 insertions(+), 306 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/vector/vstate_ptrace.c

vmlinux size differences in bytes (from 4427259cc7f7):
 text  data bss   dec   hex filename                             
 +772  +472   . +1244  +4dc vmlinux.defconfig.gcc-15             
  -28   +64   .   +36   +24 vmlinux.nosmp_defconfig.gcc-15       
 +904  +256   . +1160  +488 vmlinux.rv32_defconfig.gcc-15        
  +60   +32   .   +92   +5c vmlinux.rv32_nosmp_defconfig.gcc-15  
+1047 -4008   . -2961  -b91 vmlinux.nommu_virt_defconfig.gcc-15  
 +636  +504   . +1140  +474 vmlinux.defconfig.clang-20           
 +244   +64   .  +308  +134 vmlinux.nosmp_defconfig.clang-20     
 +204  +384   .  +588  +24c vmlinux.rv32_defconfig.clang-20      
 -192   +96   .   -96   -60 vmlinux.rv32_nosmp_defconfig.clang-20
 +931  +120   . +1051  +41b vmlinux.nommu_virt_defconfig.clang-20
 +600 -1128   .  -528  -210 vmlinux.defconfig.gcc-14             
 +200   +64   .  +264  +108 vmlinux.nosmp_defconfig.gcc-14       
 +892  +224   . +1116  +45c vmlinux.rv32_defconfig.gcc-14        
 +248   +96   .  +344  +158 vmlinux.rv32_nosmp_defconfig.gcc-14  
+1043   +88   . +1131  +46b vmlinux.nommu_virt_defconfig.gcc-14  
 +384  +472   .  +856  +358 vmlinux.defconfig.clang-19           
  +92   +64   .  +156   +9c vmlinux.nosmp_defconfig.clang-19     
  +96  +368   .  +464  +1d0 vmlinux.rv32_defconfig.clang-19      
 -456  +112   .  -344  -158 vmlinux.rv32_nosmp_defconfig.clang-19
 +875  +120   .  +995  +3e3 vmlinux.nommu_virt_defconfig.clang-19
 +584  +216   .  +800  +320 vmlinux.defconfig.gcc-13             
 +200   +32   .  +232   +e8 vmlinux.nosmp_defconfig.gcc-13       
 +928  +256   . +1184  +4a0 vmlinux.rv32_defconfig.gcc-13        
 +164   +96   .  +260  +104 vmlinux.rv32_nosmp_defconfig.gcc-13  
+1079 -4072   . -2993  -bb1 vmlinux.nommu_virt_defconfig.gcc-13  
 +276  +472   .  +748  +2ec vmlinux.defconfig.clang-18           
  +12   +64   .   +76   +4c vmlinux.nosmp_defconfig.clang-18     
 +116  +336   .  +452  +1c4 vmlinux.rv32_defconfig.clang-18      
 -480  +144   .  -336  -150 vmlinux.rv32_nosmp_defconfig.clang-18
 +731  +120   .  +851  +353 vmlinux.nommu_virt_defconfig.clang-18
 +660  +216   .  +876  +36c vmlinux.defconfig.gcc-12             
 +192   +32   .  +224   +e0 vmlinux.nosmp_defconfig.gcc-12       
 +928  +224   . +1152  +480 vmlinux.rv32_defconfig.gcc-12        
 +188   +96   .  +284  +11c vmlinux.rv32_nosmp_defconfig.gcc-12  
+1063   +88   . +1151  +47f vmlinux.nommu_virt_defconfig.gcc-12  
 +564  +536   . +1100  +44c vmlinux.defconfig.clang-17           
 +180   +64   .  +244   +f4 vmlinux.nosmp_defconfig.clang-17     
 +124  +336   .  +460  +1cc vmlinux.rv32_defconfig.clang-17      
 -432   +80   .  -352  -160 vmlinux.rv32_nosmp_defconfig.clang-17
 +875  +120   .  +995  +3e3 vmlinux.nommu_virt_defconfig.clang-17
 +644  +216   .  +860  +35c vmlinux.defconfig.gcc-11             
  +40   +32   .   +72   +48 vmlinux.nosmp_defconfig.gcc-11       
 +852  +224   . +1076  +434 vmlinux.rv32_defconfig.gcc-11        
  +44   +96   .  +140   +8c vmlinux.rv32_nosmp_defconfig.gcc-11  
+1079   +24   . +1103  +44f vmlinux.nommu_virt_defconfig.gcc-11  
 +144   +64   .  +208   +d0 vmlinux.allnoconfig.gcc-14           
+3507  +780   . +4287 +10bf vmlinux.allmodconfig.gcc-14          
 +108   +64   .  +172   +ac vmlinux.allnoconfig.clang-19         
    x     x   x     x     x vmlinux.allmodconfig.clang-19

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
