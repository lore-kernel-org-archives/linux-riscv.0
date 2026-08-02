Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 947E5C55162
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Aug 2026 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e5Pm3xGvmtCOdpSwhXM8URjkUeh1jTHwrEWhh0/o6jA=; b=RUq75sKm4E4h2nCoyS63JFJIBX
	/qtj1ZoNxjWMNoaw98u5jBI9oKSGGTff8kCgiOGpEN3MZtIOAIwdqQ6Zs9Bv58gchtM8D7ONGAIcZ
	XbpiiIAleai8Y79nTKrWeOqKVzGNgRG3WGVOT1fccN7GoLSj02EENBWnuw3WQT/+dfIcDpmdo8HXN
	oLVqehRa+zUexpDy8b2x/7cAxHMsT2Y9d/Qfk5bTDIAXdvfsAP7XrUTljo7Jawv7DJDwsKP91qlV7
	2vtZWX17rD1+8VHfpN3poS/AB8WI3+OpJwfThXlideMgraO2AHmNpEIM8c8r5ZfN7rilGgVo7Ek0I
	lrctiKQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqae0-0000000FvIM-1gIy;
	Sun, 02 Aug 2026 18:10:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqady-0000000FvIG-1WLv
	for linux-riscv@lists.infradead.org;
	Sun, 02 Aug 2026 18:10:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77E926001A;
	Sun,  2 Aug 2026 18:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAF9E1F000E9;
	Sun,  2 Aug 2026 18:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785694235;
	bh=LEv8zTr8ycTvKLlHsYiobmVdm6o4CbXpmccKK3Z8nRA=;
	h=Date:From:To:cc:Subject;
	b=F1ly47ke2nSiXvx7ro3RTlE5/ISr0fdUq5d2JJrU/8Wbt0SkfPwsWaOHuzx/fvMgB
	 qKpPMOFvzq4j24uk8vB/Z1BFSD2YLTbFNlW0kybxrAyZR/VuORXMfjZffVbARwaRYc
	 Rdb7yGV1vcAb8Acp+jhK6lkPKgJzW2wTgkTsoQ5T+J82eo3G7FpQKzU8Y2VMXSRy+s
	 2sMdISklgdq2e5lToSHILiYQxcO5YflLYTp3awILTI0XCls9roLMXkcH//E3RazSa6
	 vwse/FpW7wHZj2Si4gCQ6i/+f5xC3aCUE6Z3Tj5VDBDENzKEyrn/pHKqdd3kWrzcbb
	 3wFrr12MowF1g==
Date: Sun, 2 Aug 2026 12:10:31 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V updates for v7.2-rc6
Message-ID: <d1ade3aa-5231-988b-b0cf-d2ebe43eeb52@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-193420016-1785694235=:1296450"
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-193420016-1785694235=:1296450
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Linus,

Please pull the following RISC-V updates for v7.2-rc6.  Nothing too
notable here, I think.  Most likely we'll send one more fixes PR
before the v7.3 merge window opens.


- Paul

The following changes since commit f5098b6bae761e346ebcd9da7f95622c04733cff:

  Linux 7.2-rc5 (2026-07-26 14:45:48 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.2-rc6

for you to fetch changes up to c052927905710de1ab7364bf1925efbd12517ea3:

  riscv: vdso: Only try to install vDSO when present (2026-07-29 17:55:17 -0600)

----------------------------------------------------------------
RISC-V updates for v7.2-rc6

- Fix swiotlb initialization on systems where DRAM is located above
  4GiB (such as the Tenstorrent Blackhole cards)

- Fix an out-of-bounds access in the memory hot-remove code that can
  occur on Sv39 and Sv48 systems

- Avoid oopsing during boot if the SBI component of the unaligned
  access performance checking code loses a race against __init
  function freeing

- Avoid attempting to install the debug-enabled vDSO when it shouldn't
  be built due to !CONFIG_MMU

- Avoid some sparse warnings by adding missing __iomem notations
  in get_cycles{,_hi}()

- Drop an unnecessary runtime warning in the SiFive errata handler

----------------------------------------------------------------
Anirudh Srinivasan (1):
      riscv: drop __init from vec_check_unaligned_access_speed_all_cpus

Karl Mehltretter (1):
      riscv: mm: Fix out-of-bounds page-table walk during memory hot-remove

Nam Cao (1):
      riscv: time: Add missing __iomem in get_cycles() and get_cycles_hi()

Thomas Weiﬂschuh (1):
      riscv: vdso: Only try to install vDSO when present

Troy Mitchell (1):
      riscv: mm: fix SWIOTLB initialization for systems with DRAM above 4GB

Yong-Xuan Wang (1):
      riscv/sifive: remove warning in errata

 arch/riscv/Makefile                        |  2 +-
 arch/riscv/errata/sifive/errata.c          |  4 +---
 arch/riscv/include/asm/timex.h             |  4 ++--
 arch/riscv/kernel/unaligned_access_speed.c |  4 ++--
 arch/riscv/mm/init.c                       | 21 ++++++++++++++-------
 5 files changed, 20 insertions(+), 15 deletions(-)

vmlinux size differences in bytes (from f5098b6bae76):
 text   data   bss    dec    hex  filename                             
  +16    -44     .    -28    -1c  vmlinux.defconfig.gcc-16             
  +28    -12     .    +16    +10  vmlinux.nosmp_defconfig.gcc-16       
  +16    -12     .     +4     +4  vmlinux.rv32_defconfig.gcc-16        
    .    -12     .    -12     -c  vmlinux.rv32_nosmp_defconfig.gcc-16  
  +24    +64     .    +88    +58  vmlinux.nommu_virt_defconfig.gcc-16  
   -4     -4     .     -8     -8  vmlinux.defconfig.clang-20           
  -16    +28     .    +12     +c  vmlinux.nosmp_defconfig.clang-20     
    .      .     .      .      .  vmlinux.rv32_defconfig.clang-20      
    .      .     .      .      .  vmlinux.rv32_nosmp_defconfig.clang-20
  +16      .     .    +16    +10  vmlinux.nommu_virt_defconfig.clang-20
  +20    -12     .     +8     +8  vmlinux.defconfig.gcc-15             
  +12    -12     .      .      .  vmlinux.nosmp_defconfig.gcc-15       
  +28    -12     .    +16    +10  vmlinux.rv32_defconfig.gcc-15        
   +8    -12     .     -4     -4  vmlinux.rv32_nosmp_defconfig.gcc-15  
  +16      .     .    +16    +10  vmlinux.nommu_virt_defconfig.gcc-15  
   +4    -12     .     -8     -8  vmlinux.defconfig.gcc-14             
  +12    -12     .      .      .  vmlinux.nosmp_defconfig.gcc-14       
  +20    -12     .     +8     +8  vmlinux.rv32_defconfig.gcc-14        
   +8    -12     .     -4     -4  vmlinux.rv32_nosmp_defconfig.gcc-14  
  +24      .     .    +24    +18  vmlinux.nommu_virt_defconfig.gcc-14  
   -8     -4     .    -12     -c  vmlinux.defconfig.clang-19           
  -12     +4     .     -8     -8  vmlinux.nosmp_defconfig.clang-19     
   -4     +4     .      .      .  vmlinux.rv32_defconfig.clang-19      
    .     +4     .     +4     +4  vmlinux.rv32_nosmp_defconfig.clang-19
  +24    +64     .    +88    +58  vmlinux.nommu_virt_defconfig.clang-19
    .    -12     .    -12     -c  vmlinux.defconfig.gcc-13             
   +8    -12     .     -4     -4  vmlinux.nosmp_defconfig.gcc-13       
  +12    -12     .      .      .  vmlinux.rv32_defconfig.gcc-13        
   +4    -12     .     -8     -8  vmlinux.rv32_nosmp_defconfig.gcc-13  
  +28    +64     .    +92    +5c  vmlinux.nommu_virt_defconfig.gcc-13  
   -4     -4     .     -8     -8  vmlinux.defconfig.clang-18           
  -16     -4     .    -20    -14  vmlinux.nosmp_defconfig.clang-18     
    .     +4     .     +4     +4  vmlinux.rv32_defconfig.clang-18      
    .     +4     .     +4     +4  vmlinux.rv32_nosmp_defconfig.clang-18
  +24      .     .    +24    +18  vmlinux.nommu_virt_defconfig.clang-18
   +8    -12     .     -4     -4  vmlinux.defconfig.gcc-12             
    .    -12     .    -12     -c  vmlinux.nosmp_defconfig.gcc-12       
  +12    -12     .      .      .  vmlinux.rv32_defconfig.gcc-12        
  +12    -12     .      .      .  vmlinux.rv32_nosmp_defconfig.gcc-12  
  +28    +64     .    +92    +5c  vmlinux.nommu_virt_defconfig.gcc-12  
   -8     -4     .    -12     -c  vmlinux.defconfig.clang-17           
  -12     +4     .     -8     -8  vmlinux.nosmp_defconfig.clang-17     
   -8     +4     .     -4     -4  vmlinux.rv32_defconfig.clang-17      
    .     -4     .     -4     -4  vmlinux.rv32_nosmp_defconfig.clang-17
  +24    +64     .    +88    +58  vmlinux.nommu_virt_defconfig.clang-17
   -4    -12     .    -16    -10  vmlinux.defconfig.gcc-11             
   -4    -12     .    -16    -10  vmlinux.nosmp_defconfig.gcc-11       
  +12    -12     .      .      .  vmlinux.rv32_defconfig.gcc-11        
  +12    -12     .      .      .  vmlinux.rv32_nosmp_defconfig.gcc-11  
  +28      .     .    +28    +1c  vmlinux.nommu_virt_defconfig.gcc-11  
  +26    +32     .    +58    +3a  vmlinux.allnoconfig.gcc-15           
-1136  -4272  -192  -5600  -15e0  vmlinux.allmodconfig.gcc-15          
  +28      .     .    +28    +1c  vmlinux.allnoconfig.clang-19         
 -812    -76   +64   -824   -338  vmlinux.allmodconfig.clang-19        
--8323329-193420016-1785694235=:1296450
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-193420016-1785694235=:1296450--

