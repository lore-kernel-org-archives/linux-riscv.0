Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15CDD3B7E5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Dec 2025 08:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EpCCp2Cdp8AtN6uxXAIfbpvtc4zczz6HFLV4mfKGbeI=; b=eEtgTYdOo0FyfS
	jo9HI019560Fjfi34SH3gGcVCEc6jbU0F5/j4E1S4ZFWEwQBuGBLrcSRJWOEZgfruE5OJ2r4QCQg/
	1NuaCsPv401J99gp4HsPKyVoQp41dv/V+MH/Na5AutlWPYrAPXVguCQALbgjJihf4TxlAgzeIIUQz
	Smwc4TWg4/Han7ROgsh3ASmCXA5fVLvJgs3jMDK0qSoDN3gJFrRyqYKncwJokv0cbB30ya/eLublO
	JJ+gxH/uFOE+/zrrcMi+hx/WlUtRB6Grm/voQaFvt/UwB0StieLO3SDZopOIkfu+VRE5WFNW8FVQZ
	957nwjRV/CLn8c8vPiwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZlzG-00000002auY-0npx;
	Sun, 28 Dec 2025 08:18:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZlzD-00000002au9-0NiV
	for linux-riscv@lists.infradead.org;
	Sun, 28 Dec 2025 08:18:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5418243B89;
	Sun, 28 Dec 2025 08:18:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF04AC4CEFB;
	Sun, 28 Dec 2025 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766909922;
	bh=k39l4e/zjSbWQcdwT32FZK/RCqW5lWzsUM7UgFuJHzU=;
	h=Date:From:To:cc:Subject:From;
	b=RlQj0i/vo+sOELfWJTx4lSpJZRoLD/ooe4ZX+rivmozGnj1MBuzYdMIc2BS2P3s2X
	 uQYJevaJY6/u6bKDYcuyrmduMIPjaST9hCYrDU3tqjMu2FQvbjKnujz0P2Hc/yJcg6
	 hoTUy2ZblLGdYgutyYcJiMHhw4JbnuLKinQO+hT2eWTie4zzpjt/xKrRlXaMKkPJgr
	 aFIKttJbv+MYkO21tk+FEAIGF3oO0gsN+ZQHIuCNTYgvYxkGA9h/DfEEM0JkEDx7N1
	 4hYTkfgx9euBn/qLIAjH9C2iKEy9W1hJXbevfLTa5JIKe/rzGp3qXQ7FuMg29Kk2do
	 XwjQAgdKRFaiw==
Date: Sun, 28 Dec 2025 01:18:38 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v6.19-rc3
Message-ID: <fc36548c-baa4-821d-24cd-2f645f7d9cec@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_001847_175519_7E399522 
X-CRM114-Status: GOOD (  10.66  )
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

Please pull these RISC-V updates for v6.20-rc3.  Nothing exotic here;
these are the cleanup and new ISA extension probing patches (not
including CFI) that were originally part of the second pull request in
the last merge window.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.19-rc3

for you to fetch changes up to 5efaf92da4365cb8d1ae6dd7a2d1245c69e09ff5:

  riscv: Add SBI debug trigger extension and function ids (2025-12-19 00:22:30 -0700)


Happy holidays,

- Paul

----------------------------------------------------------------
RISC-V updates for v6.19-rc3

- Add probing and userspace reporting support for the standard RISC-V
  ISA extensions Zilsd and Zclsd, which implement load/store dual
  instructions on RV32

- Abstract the register saving code in setup_sigcontext() so it can be
  used for stateful RISC-V ISA extensions beyond the vector extension

- Add the SBI extension ID and some initial data structure definitions
  for the RISC-V standard SBI debug trigger extension

- Clean up some code slightly: change some page table functions to
  avoid atomic operations oinn !SMP and to avoid unnecessary casts to
  atomic_long_t; and use the existing RISCV_FULL_BARRIER macro in
  place of some open-coded "fence rw,rw" instructions

----------------------------------------------------------------
Andy Chiu (1):
      riscv: signal: abstract header saving for setup_sigcontext

Himanshu Chauhan (1):
      riscv: Add SBI debug trigger extension and function ids

Paul Walmsley (3):
      riscv: mm: pmdp_huge_get_and_clear(): avoid atomic ops when !CONFIG_SMP
      riscv: mm: ptep_get_and_clear(): avoid atomic ops when !CONFIG_SMP
      riscv: mm: use xchg() on non-atomic_long_t variables, not atomic_long_xchg()

Pincheng Wang (3):
      dt-bindings: riscv: add Zilsd and Zclsd extension descriptions
      riscv: add ISA extension parsing for Zilsd and Zclsd
      riscv: hwprobe: export Zilsd and Zclsd ISA extensions

Zongmin Zhou (1):
      riscv/atomic.h: use RISCV_FULL_BARRIER in _arch_atomic* function.

 Documentation/arch/riscv/hwprobe.rst               |  8 +++
 .../devicetree/bindings/riscv/extensions.yaml      | 36 +++++++++++++
 arch/riscv/include/asm/atomic.h                    |  8 +--
 arch/riscv/include/asm/hwcap.h                     |  2 +
 arch/riscv/include/asm/pgtable.h                   | 16 +++++-
 arch/riscv/include/asm/sbi.h                       | 29 ++++++++++
 arch/riscv/include/asm/vector.h                    |  3 ++
 arch/riscv/include/uapi/asm/hwprobe.h              |  3 ++
 arch/riscv/kernel/cpufeature.c                     | 24 +++++++++
 arch/riscv/kernel/signal.c                         | 62 ++++++++++++++--------
 arch/riscv/kernel/sys_hwprobe.c                    |  2 +
 11 files changed, 166 insertions(+), 27 deletions(-)

vmlinux size differences in bytes (from 8f0b4cce4481):
 text   data  bss    dec   hex filename                             
  -40   +224    .   +184   +b8 vmlinux.defconfig.gcc-15             
 -576    +64    .   -512  -200 vmlinux.nosmp_defconfig.gcc-15       
 +192   +276    .   +468  +1d4 vmlinux.rv32_defconfig.gcc-15        
 -392   +212    .   -180   -b4 vmlinux.rv32_nosmp_defconfig.gcc-15  
 +411   +192    .   +603  +25b vmlinux.nommu_virt_defconfig.gcc-15  
 +184   +160    .   +344  +158 vmlinux.defconfig.clang-20           
-1092   +480    .   -612  -264 vmlinux.nosmp_defconfig.clang-20     
 +200   +288    .   +488  +1e8 vmlinux.rv32_defconfig.clang-20      
-1100   +224    .   -876  -36c vmlinux.rv32_nosmp_defconfig.clang-20
 +443   +128    .   +571  +23b vmlinux.nommu_virt_defconfig.clang-20
 +240   +480    .   +720  +2d0 vmlinux.defconfig.gcc-14             
 -696   +320    .   -376  -178 vmlinux.nosmp_defconfig.gcc-14       
 +216   +340    .   +556  +22c vmlinux.rv32_defconfig.gcc-14        
 -592   +244    .   -348  -15c vmlinux.rv32_nosmp_defconfig.gcc-14  
 +403   +192    .   +595  +253 vmlinux.nommu_virt_defconfig.gcc-14  
 +192   +224    .   +416  +1a0 vmlinux.defconfig.clang-19           
-1124   +480    .   -644  -284 vmlinux.nosmp_defconfig.clang-19     
 +216   +224    .   +440  +1b8 vmlinux.rv32_defconfig.clang-19      
-1076   +224    .   -852  -354 vmlinux.rv32_nosmp_defconfig.clang-19
 +455   +128    .   +583  +247 vmlinux.nommu_virt_defconfig.clang-19
 +232   +384    .   +616  +268 vmlinux.defconfig.gcc-13             
 -824   +384    .   -440  -1b8 vmlinux.nosmp_defconfig.gcc-13       
 +192   +276    .   +468  +1d4 vmlinux.rv32_defconfig.gcc-13        
 -680   +276    .   -404  -194 vmlinux.rv32_nosmp_defconfig.gcc-13  
 +411   +256    .   +667  +29b vmlinux.nommu_virt_defconfig.gcc-13  
 +196   +224    .   +420  +1a4 vmlinux.defconfig.clang-18           
-1012   +416    .   -596  -254 vmlinux.nosmp_defconfig.clang-18     
 +224   +288    .   +512  +200 vmlinux.rv32_defconfig.clang-18      
-1068   +256    .   -812  -32c vmlinux.rv32_nosmp_defconfig.clang-18
 +451   +192    .   +643  +283 vmlinux.nommu_virt_defconfig.clang-18
 +168   +384    .   +552  +228 vmlinux.defconfig.gcc-12             
 -800   +352    .   -448  -1c0 vmlinux.nosmp_defconfig.gcc-12       
 +104   +340    .   +444  +1bc vmlinux.rv32_defconfig.gcc-12        
 -720   +244    .   -476  -1dc vmlinux.rv32_nosmp_defconfig.gcc-12  
 +395   +192    .   +587  +24b vmlinux.nommu_virt_defconfig.gcc-12  
 +208   +224    .   +432  +1b0 vmlinux.defconfig.clang-17           
-1076   +416    .   -660  -294 vmlinux.nosmp_defconfig.clang-17     
 +224   +256    .   +480  +1e0 vmlinux.rv32_defconfig.clang-17      
-1068   +224    .   -844  -34c vmlinux.rv32_nosmp_defconfig.clang-17
 +447   +128    .   +575  +23f vmlinux.nommu_virt_defconfig.clang-17
 +176   +416    .   +592  +250 vmlinux.defconfig.gcc-11             
 -880   +352    .   -528  -210 vmlinux.nosmp_defconfig.gcc-11       
   -8   +244    .   +236   +ec vmlinux.rv32_defconfig.gcc-11        
 -824   +276    .   -548  -224 vmlinux.rv32_nosmp_defconfig.gcc-11  
 +411 +12544    . +12955 +329b vmlinux.nommu_virt_defconfig.gcc-11  
  +32  -3840    .  -3808  -ee0 vmlinux.allnoconfig.gcc-14           
 +603   +320    .   +923  +39b vmlinux.allmodconfig.gcc-14          
  -40    +64    .    +24   +18 vmlinux.allnoconfig.clang-19         
+5935   +832 -120  +6647 +19f7 vmlinux.allmodconfig.clang-19        


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
