Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2745BC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 18:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o13+kBtOahz0HF/n83Qn7M9lfhT+sg9cHVwEih0r3v4=; b=OamjDB75CoW2MW
	jjh9CLnJRHpZR5mzrr14Hy4wVJYMWFFSNuN1Cv5yfsNRLzooXs0ZHl8B1WvkhhiiyUhg51XOUZ7Ty
	+xEVSB+T0PZOSFnIusNNG5v1VdsN6dVfu8mBTlbaFiBPD5H4B759U/8eOZS6nr54GD6oHZXPEh/7y
	sxxaGtalcPiBYlqWFmEcVuhlkr2G25KoMQ2THv2BetmZWhCh2oQX6LQY0KDKXbm0Iupb7ejgL5H6a
	w1DClzcrdIdHzGvLiMlyIxQg4aZzL8AdZ2FmPbnxOB9PgSfz+XNdkB2rMjKjChfTk+mnkP+7E4iU+
	OSffCOJBwVvtUCCK8oFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiIb-00000007dNe-2bsg;
	Fri, 03 Jul 2026 18:07:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfiIa-00000007dNJ-1Sia
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 18:07:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F8BE600B0;
	Fri,  3 Jul 2026 18:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A0A1F000E9;
	Fri,  3 Jul 2026 18:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783102055;
	bh=nfq9dRTmBphxoh5eGcZE2hsuYy5SKVL/7yX7BtQZa/I=;
	h=Date:From:To:cc:Subject;
	b=aK493ubAbGt4vsgPvAUSaUKE+U0RmhQX3ByIZEbI4S1Wrwg3Jlsh98WHzKwFTAX77
	 WXIz6MFP14qGBdJzlLUtSSiEZ3iKbVBEZgZNFFHmzhBbpLN+r5q7Uy68zl5al/TZw6
	 93qY8M7+7rRIy4vIcNBEuzcb4jC2v8rZDmgsP/KVU8wigdHM9DyCzDM6wuUHDaEk3u
	 mwP32kH7vJFq/Eed5enIdheVOyB0qAHMOyIl/4FBumtf2Ac/xh17sQjBEk5zhwXHjN
	 E7Kj40UBRZlrscnH1sfdrpdtlnhJKjZ2sDrPsaVf5j1HqBXeHqE+IPBLWCwQH0EW43
	 Qs6+2RpZyHhzQ==
Date: Fri, 3 Jul 2026 12:07:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.2-rc2
Message-ID: <98c1a609-5ce9-5703-77d4-bdb2d92d7338@kernel.org>
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

Please pull these RISC-V updates for v7.2-rc2.  Nothing too
remarkable, I think.  The signficant kernel size changes on
SMP-capable configs are due to increasing the default NR_CPUS.

thanks,

- Paul


The following changes since commit c75597caada080effbfbc0a7fb10dc2a3bb543ad:

  Merge tag 'for-linus' of git://git.kernel.org/pub/scm/virt/kvm/kvm (2026-06-25 10:21:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc2

for you to fetch changes up to bc7b086a45521a986a49045907f017e3e46c763e:

  riscv: probes: save original sp in rethook trampoline (2026-06-30 18:46:54 -0600)

----------------------------------------------------------------
RISC-V updates for v7.2-rc2

- Fix a crash when a kretprobe reads from the stack

- Fix an issue with the build-time mcount sorter that broke ftrace

- Fix the rv32 IRQ stack frame padding to match the ABI

- Only defer IOMMU configuration during initialization.  This avoids
  an issue where IOMMU configuration could be indefinitely deferred

- Add the missing build salt to the vDSO

- Now that RISC-V systems with higher numbers of cores are starting to
  become available, raise NR_CPUS for RISC-V to 256

- Clean up some warnings from sparse caused by the RISC-V-optimized
  RAID6 code

- Clean up our __cpu_up() code with a few minor fixes

----------------------------------------------------------------
Bastian Blank (1):
      riscv: Add build salt to the vDSO

Ben Dooks (2):
      raid6: fix riscv symbol undeclared warnigns
      raid6: fix raid6_recov_rvv symbol undeclared warning

Martin Kaiser (1):
      riscv: probes: save original sp in rethook trampoline

Samuel Holland (1):
      riscv: Fix 32-bit call_on_irq_stack() frame pointer ABI

Thorsten Blum (1):
      riscv: smp: use secs_to_jiffies in __cpu_up

Vivian Wang (1):
      riscv: Raise default NR_CPUS for 64BIT to 256

Wang Han (1):
      scripts/sorttable: Handle RISC-V patchable ftrace entries

Yicong Yang (1):
      ACPI: RIMT: Only defer the IOMMU configuration in init stage

 arch/riscv/Kconfig                            |  3 ++-
 arch/riscv/kernel/asm-offsets.c               |  4 ++--
 arch/riscv/kernel/entry.S                     |  8 ++++----
 arch/riscv/kernel/probes/rethook_trampoline.S |  3 +++
 arch/riscv/kernel/smpboot.c                   |  5 ++---
 arch/riscv/kernel/vdso/note.S                 |  3 +++
 drivers/acpi/riscv/rimt.c                     |  7 ++++---
 lib/raid/raid6/riscv/recov_rvv.c              |  1 +
 lib/raid/raid6/riscv/rvv.c                    |  1 +
 scripts/sorttable.c                           | 11 ++++++++---
 10 files changed, 30 insertions(+), 16 deletions(-)

vmlinux size differences in bytes (from c75597caada0):
   text    data     bss     dec    hex  filename                             
 -73892  +26028  +52160   +4296  +10c8  vmlinux.defconfig.gcc-16             
      .       .       .       .      .  vmlinux.nosmp_defconfig.gcc-16       
  +1540  +13408  +42904  +57852  +e1fc  vmlinux.rv32_defconfig.gcc-16        
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.gcc-16  
 -29730  +17120  +41624  +29014  +7156  vmlinux.nommu_virt_defconfig.gcc-16  
 -74788  +21268  +52120   -1400   -578  vmlinux.defconfig.clang-20           
   -172       .       .    -172    -ac  vmlinux.nosmp_defconfig.clang-20     
  +8052  +13344  +42904  +64300  +fb2c  vmlinux.rv32_defconfig.clang-20      
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.clang-20
 -47664  +33600  +41632  +27568  +6bb0  vmlinux.nommu_virt_defconfig.clang-20
 -75892  +21900  +52160   -1832   -728  vmlinux.defconfig.gcc-15             
      .       .       .       .      .  vmlinux.nosmp_defconfig.gcc-15       
  +1744  +13376  +42904  +58024  +e2a8  vmlinux.rv32_defconfig.gcc-15        
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.gcc-15  
 -30352  +13024  +41624  +24296  +5ee8  vmlinux.nommu_virt_defconfig.gcc-15  
 -72280  +21904  +52160   +1784   +6f8  vmlinux.defconfig.gcc-14             
      .       .       .       .      .  vmlinux.nosmp_defconfig.gcc-14       
  +1664  +13408  +42904  +57976  +e278  vmlinux.rv32_defconfig.gcc-14        
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.gcc-14  
 -30814  +33504  +41624  +44314  +ad1a  vmlinux.nommu_virt_defconfig.gcc-14  
 -72900  +21300  +52040    +440   +1b8  vmlinux.defconfig.clang-19           
   -172     +32       .    -140    -8c  vmlinux.nosmp_defconfig.clang-19     
  +7748  +13344  +42792  +63884  +f98c  vmlinux.rv32_defconfig.clang-19      
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.clang-19
 -44302  +17296  +41608  +14602  +390a  vmlinux.nommu_virt_defconfig.clang-19
 -65824  +21904  +52160   +8240  +2030  vmlinux.defconfig.gcc-13             
      .       .       .       .      .  vmlinux.nosmp_defconfig.gcc-13       
  +1436  +13408  +42904  +57748  +e194  vmlinux.rv32_defconfig.gcc-13        
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.gcc-13  
 -33186  +17120  +41624  +25558  +63d6  vmlinux.nommu_virt_defconfig.gcc-13  
 -78660  +20820  +52040   -5800  -16a8  vmlinux.defconfig.clang-18           
   -180       .       .    -180    -b4  vmlinux.nosmp_defconfig.clang-18     
  +7588  +13312  +42792  +63692  +f8cc  vmlinux.rv32_defconfig.clang-18      
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.clang-18
 -45364  +13200  +41608   +9444  +24e4  vmlinux.nommu_virt_defconfig.clang-18
 -67314  +21824  +52160   +6670  +1a0e  vmlinux.defconfig.gcc-12             
     +8       .       .      +8     +8  vmlinux.nosmp_defconfig.gcc-12       
  +1732  +13408  +42904  +58044  +e2bc  vmlinux.rv32_defconfig.gcc-12        
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.gcc-12  
 -35232  +21216  +41624  +27608  +6bd8  vmlinux.nommu_virt_defconfig.gcc-12  
-100792  +24916  +52040  -23836  -5d1c  vmlinux.defconfig.clang-17           
   -176     +32       .    -144    -90  vmlinux.nosmp_defconfig.clang-17     
  +7228  +13344  +42792  +63364  +f784  vmlinux.rv32_defconfig.clang-17      
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.clang-17
 -49254  +29584  +41608  +21938  +55b2  vmlinux.nommu_virt_defconfig.clang-17
 -67502  +25904  +52160  +10562  +2942  vmlinux.defconfig.gcc-11             
    +16       .       .     +16    +10  vmlinux.nosmp_defconfig.gcc-11       
   +200  +17184  +42904  +60288  +eb80  vmlinux.rv32_defconfig.gcc-11        
      .       .       .       .      .  vmlinux.rv32_nosmp_defconfig.gcc-11  
 -35826  +21216  +41624  +27014  +6986  vmlinux.nommu_virt_defconfig.gcc-11  
      .       .       .       .      .  vmlinux.allnoconfig.gcc-15           
 +12824     -68     +64  +12820  +3214  vmlinux.allmodconfig.gcc-15          
      .       .       .       .      .  vmlinux.allnoconfig.clang-19         
  +3848    -184     +64   +3728   +e90  vmlinux.allmodconfig.clang-19        

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
