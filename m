Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D72CFC515
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Nov 2025 01:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rf2YqKiRjBOomUy2kIUk40kjXEdnvyOqtrqy2dgpbjk=; b=GnoEEHGw7ORvsh
	TJUrtqdS3Hm8g0hLGhD7tSSorXgRlF58HZDUpZtZ7Rx4Sl3M6xKiXvwg2AXwtirvRKsZq6qClDGv6
	AnXpccVLXKxOT3OO7VChUa5jdlckaCc2iciwt1r+Y+b5G0PUXG5Mbi67lu0SObDjaho24/vQ5J23/
	Jo3GIHtoYxSHFJ+Prfn8L+t0qA19CfuwPpvk7WN1DnFu6w13/WTyztDqsMU2z+VGHDKl2+LRdeuSO
	e79IFoSoa2jRzR+wT6JfV0oxhNHrTCNpeXgCGbLngltGZo8SLRKfi/bfY3cuiIbQuRXAZcuUo3GZj
	SnSM4TDUIzg5Y3gQskRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcZR-000000099fc-0eft;
	Sat, 22 Nov 2025 01:37:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMcZO-000000099eg-3VnS
	for linux-riscv@lists.infradead.org;
	Sat, 22 Nov 2025 01:37:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F79640C3B;
	Sat, 22 Nov 2025 01:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FC10C4CEF1;
	Sat, 22 Nov 2025 01:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763775465;
	bh=0qf20BDdueHRq9OhUD6dgHzT+/U8yH5JNjQHTEWIlEE=;
	h=Date:From:To:cc:Subject:From;
	b=QOH8Tq1ENnqCLZxjIK3c99DgyIuJS+5Zx1HGgVTzvARtgxWvYZewl1e3DFLV7iqrM
	 GPZxGuCEwL06Y3Wxu2SPuBGBYoZZ6UhTNJG3U3gRNaFvBrPmDuYZw+kB9sT+J2Vxk/
	 vJDP2xefvAJzJTRBeFp1APnn5dTSD55r62RuM2DNVbuUI94vba1KtMJy2QhHbTlUHl
	 r+HipELnitI2qgqUFKsIgMnbdGwcf0c1TEx2jDJZiepXRd6lEMPffR1O5khLP81OhD
	 qCoJTM48Qrg6TdqxfA2k+jSaB57Oz5hAqhv4ZIy98apQ9rFpL6zQqA7norkw0SeNuw
	 ab1SXdH4vikcQ==
Date: Fri, 21 Nov 2025 18:37:44 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v6.18-rc7
Message-ID: <d51764f8-04af-8930-78bf-bb253b55b561@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_173746_913304_DEC8F281 
X-CRM114-Status: GOOD (  11.39  )
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

Please pull these RISC-V updates for v6.18-rc7.  v6.18 looks like it's 
settling down well for us.  Am currently expecting to have one additional 
fix with very limited scope coming in next week, after v6.18-rc7 is 
tagged.

To my eyes, the only notable patch in this PR is a patch to deal with MIPS 
getting their RISC-V/JEDEC vendor ID wrong.  Apparently this didn't affect 
their testing, because they've told us that their QEMU platform was also 
using the wrong vendor ID.  (They are fixing upstream QEMU.)  The patch 
that added the incorrect vendor ID only went in for the v6.18 merge 
window.  So the good news is that we can fix this before the final v6.18 
release is tagged.  Speaking with MIPS off-list, they've assured us that 
they will start testing on FPGA bitstreams now, so I hope this will be a 
closed issue going forward.


- Paul


The following changes since commit 4427259cc7f7571a157fbc9b5011e1ef6fe0a4a8:

  Merge tag 'riscv-for-linus-6.18-rc6' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2025-11-10 15:35:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc7

for you to fetch changes up to e2cb69263e797c0aa6676bcef23e9e27e44c83b0:

  tools: riscv: Fixed misalignment of CSR related definitions (2025-11-16 10:37:38 -0700)

----------------------------------------------------------------
RISC-V updates for v6.18-rc7

- Correct the MIPS RISC-V/JEDEC vendor ID.

- Fix the system shutdown behavior in the legacy case where
  CONFIG_RISCV_SBI_V01 is set, but the firmware implementation doesn't
  support the older v0.1 system shutdown method.

- Align some tools/ macro definitions with the corresponding kernel headers.

----------------------------------------------------------------
Chao-ying Fu (1):
      riscv: Update MIPS vendor id to 0x127

Chen Pei (1):
      tools: riscv: Fixed misalignment of CSR related definitions

Mayuresh Chitale (1):
      riscv: sbi: Prefer SRST shutdown over legacy

 arch/riscv/include/asm/vendorid_list.h | 2 +-
 arch/riscv/kernel/sbi.c                | 6 +++++-
 drivers/perf/riscv_pmu_sbi.c           | 2 +-
 tools/arch/riscv/include/asm/csr.h     | 5 +++--
 4 files changed, 10 insertions(+), 5 deletions(-)

vmlinux size differences in bytes (from 4427259cc7f7):
 text data bss   dec   hex filename                                     
    .    .   .     .     . vmlinux.defconfig.gcc-15                     
    .    .   .     .     . vmlinux.nosmp_defconfig.gcc-15               
    .    .   .     .     . vmlinux.rv32_defconfig.gcc-15                
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.gcc-15          
    .    .   .     .     . vmlinux.nommu_virt_defconfig.gcc-15          
    .    .   .     .     . vmlinux.defconfig.clang-20                   
    .    .   .     .     . vmlinux.nosmp_defconfig.clang-20             
    .    .   .     .     . vmlinux.rv32_defconfig.clang-20              
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.clang-20        
    .    .   .     .     . vmlinux.nommu_virt_defconfig.clang-20        
    .    .   .     .     . vmlinux.defconfig.gcc-14                     
    .    .   .     .     . vmlinux.nosmp_defconfig.gcc-14               
    .    .   .     .     . vmlinux.rv32_defconfig.gcc-14                
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.gcc-14          
    .    .   .     .     . vmlinux.nommu_virt_defconfig.gcc-14          
    .    .   .     .     . vmlinux.defconfig.clang-19                   
    .    .   .     .     . vmlinux.nosmp_defconfig.clang-19             
    .    .   .     .     . vmlinux.rv32_defconfig.clang-19              
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.clang-19        
    .    .   .     .     . vmlinux.nommu_virt_defconfig.clang-19        
    .    .   .     .     . vmlinux.defconfig.gcc-13                     
    .    .   .     .     . vmlinux.nosmp_defconfig.gcc-13               
    .    .   .     .     . vmlinux.rv32_defconfig.gcc-13                
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.gcc-13          
    .    .   .     .     . vmlinux.nommu_virt_defconfig.gcc-13          
    .    .   .     .     . vmlinux.defconfig.clang-18                   
    .    .   .     .     . vmlinux.nosmp_defconfig.clang-18             
    .    .   .     .     . vmlinux.rv32_defconfig.clang-18              
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.clang-18        
    .    .   .     .     . vmlinux.nommu_virt_defconfig.clang-18        
    .    .   .     .     . vmlinux.defconfig.gcc-12                     
    .    .   .     .     . vmlinux.nosmp_defconfig.gcc-12               
    .    .   .     .     . vmlinux.rv32_defconfig.gcc-12                
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.gcc-12          
    .    .   .     .     . vmlinux.nommu_virt_defconfig.gcc-12          
    .    .   .     .     . vmlinux.defconfig.clang-17                   
    .    .   .     .     . vmlinux.nosmp_defconfig.clang-17             
    .    .   .     .     . vmlinux.rv32_defconfig.clang-17              
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.clang-17        
    .    .   .     .     . vmlinux.nommu_virt_defconfig.clang-17        
    .    .   .     .     . vmlinux.defconfig.clang-15.patched           
    .    .   .     .     . vmlinux.nosmp_defconfig.clang-15.patched     
    .    .   .     .     . vmlinux.rv32_defconfig.clang-15.patched      
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.clang-15.patched
    .    .   .     .     . vmlinux.nommu_virt_defconfig.clang-15.patched
    .    .   .     .     . vmlinux.defconfig.gcc-11                     
    .    .   .     .     . vmlinux.nosmp_defconfig.gcc-11               
    .    .   .     .     . vmlinux.rv32_defconfig.gcc-11                
    .    .   .     .     . vmlinux.rv32_nosmp_defconfig.gcc-11          
    .    .   .     .     . vmlinux.nommu_virt_defconfig.gcc-11          
    .    .   .     .     . vmlinux.allnoconfig.gcc-14                   
    .    .   .     .     . vmlinux.allmodconfig.gcc-14                  
    .    .   .     .     . vmlinux.allnoconfig.clang-19                 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
