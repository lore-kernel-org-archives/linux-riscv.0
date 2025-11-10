Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E54FCCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 20:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UMlL9AfyEmMZ9EeqbLZ3m1rNZ1UwvNOAgn+qHXuLlHM=; b=ZigIuu9wtbbo6j
	JdxF8L6ZZy6e7gVVwJUP56bkgCFBYBJPx4Uhi2d6X8j/KZS9QMsXbHSj1xxiHIe0m77LJ164fS8nB
	2pD60f5jSERt9muuQ5O413zcueTE6XEYMzJsj7KojoQmSsThR0sGxudaROqReXQJj+yXgAiVxL60G
	aEEF1Y6tmooQLX/1lIHgxPCRAB9/jAKVMCnbuDW00zooVVbEzNbneGG9sJfpykCGaMnBXjC8XvIi/
	5iV6ONCdTDJK5vivvghuFp7v4O3PN5JCII0Clc/tSxHe8vBn8DIUZDW/CLvRZrCwcA3GSGhrlfyQj
	OzWYcZhDa8KQ3zMqlu8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYhq-0000000678A-1dWj;
	Mon, 10 Nov 2025 20:41:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIYhn-0000000677G-3bd3
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 20:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4851643839;
	Mon, 10 Nov 2025 20:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF22C4CEFB;
	Mon, 10 Nov 2025 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762807298;
	bh=W2NlGSaN/DO6Yj79YN5GVEnS2mME/PCSM9o39rbQi1g=;
	h=Date:From:To:cc:Subject:From;
	b=BSaSLsrLmr8NwXa28hPOAXE0zfYmiVMc3mAF7XO8kbQQemm9evXDGdERfrDAoJmwz
	 KqVI5M0ZJvpzosPdJlhMKRDcTMqcwnOKhS6kv1CUwEyDaKijhiyWTi5/ShQ0DBCSm7
	 eN9hmGrI7hrI3XfK6POZK0xMw1npSCuzatUkRQ63IFRlT4UbHKQ87o1IjHbSeTVOIc
	 wB/cZKbRR4XDd27H4DxLzj8oNDclgRNAq9SBtmlQ3zGLmRaF3qGvXL1gI6dj5Dl/bI
	 KPr/6JUKtOKAbzd9bzIQac7XVbIbXfmt3+VUqTU94mAB5nnjM30RpntN49MSvbSVvr
	 LGRLjkv/ud+fA==
Date: Mon, 10 Nov 2025 13:41:32 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v6.18-rc6
Message-ID: <a7d159e4-8e75-e4be-4405-f10fee270664@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_124139_936592_A41B97FE 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 225a97d6d45456a7627633da09cb842a43ef1b85:

  Merge tag 'riscv-for-linus-6.18-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2025-11-06 15:44:18 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-6.18-rc6

for you to fetch changes up to dc20452e6caf962f04ede7f364267b0c37784ab4:

  riscv: Fix CONFIG_AS_HAS_INSN for new .insn usage (2025-11-07 17:39:07 -0700)


- Paul
----------------------------------------------------------------
RISC-V updates for v6.18-rc6

RISC-V updates for v6.18-rc6, including:

- A fix for a commit in v6.18-rc5 that broke the build on clang
  versions earlier than 19 and binutils versions earlier than 2.38.
  (This exposed that we're not properly testing earlier toolchain
  versions in our linux-next builds and PR submissions.  This was
  fixed for this PR, and is being addressed more generally for -next
  builds.)

- A fix to remove some redundant Makefile code

- A fix to avoid building Canaan Kendryte K210-specific code on targets
  that don't build for the K210

----------------------------------------------------------------
Feng Jiang (2):
      riscv: Build loader.bin exclusively for Canaan K210
      riscv: Remove redundant judgment for the default build target

Nathan Chancellor (1):
      riscv: Fix CONFIG_AS_HAS_INSN for new .insn usage

 arch/riscv/Kconfig  |  2 +-
 arch/riscv/Makefile | 17 +----------------
 2 files changed, 2 insertions(+), 17 deletions(-)


vmlinux size differences in bytes (from 225a97d6d454):
     text     data     bss       dec      hex filename                             
        .        .       .         .        . vmlinux.defconfig.gcc-15             
        .        .       .         .        . vmlinux.nosmp_defconfig.gcc-15       
        .        .       .         .        . vmlinux.rv32_defconfig.gcc-15        
        .        .       .         .        . vmlinux.rv32_nosmp_defconfig.gcc-15  
        .        .       .         .        . vmlinux.nommu_virt_defconfig.gcc-15  
        .        .       .         .        . vmlinux.defconfig.clang-20           
        .        .       .         .        . vmlinux.nosmp_defconfig.clang-20     
        .        .       .         .        . vmlinux.rv32_defconfig.clang-20      
        .        .       .         .        . vmlinux.rv32_nosmp_defconfig.clang-20
        .        .       .         .        . vmlinux.nommu_virt_defconfig.clang-20
        .        .       .         .        . vmlinux.defconfig.gcc-14             
        .        .       .         .        . vmlinux.nosmp_defconfig.gcc-14       
        .      -32       .       -32      -20 vmlinux.rv32_defconfig.gcc-14        
        .        .       .         .        . vmlinux.rv32_nosmp_defconfig.gcc-14  
        .        .       .         .        . vmlinux.nommu_virt_defconfig.gcc-14  
        .        .       .         .        . vmlinux.defconfig.clang-19           
        .        .       .         .        . vmlinux.nosmp_defconfig.clang-19     
        .        .       .         .        . vmlinux.rv32_defconfig.clang-19      
        .        .       .         .        . vmlinux.rv32_nosmp_defconfig.clang-19
        .        .       .         .        . vmlinux.nommu_virt_defconfig.clang-19
        .        .       .         .        . vmlinux.defconfig.gcc-13             
        .        .       .         .        . vmlinux.nosmp_defconfig.gcc-13       
        .        .       .         .        . vmlinux.rv32_defconfig.gcc-13        
        .        .       .         .        . vmlinux.rv32_nosmp_defconfig.gcc-13  
        .        .       .         .        . vmlinux.nommu_virt_defconfig.gcc-13  
+13049482 +6347237 +424189 +19820908 +12e716c vmlinux.defconfig.clang-18 [*]          
+12001864 +6160481 +409589 +18571934 +11b629e vmlinux.nosmp_defconfig.clang-18 [*]    
+12120907 +4807041 +312865 +17240813 +10712ed vmlinux.rv32_defconfig.clang-18 [*]     
+11098066 +4628736 +300841 +16027643  +f48ffb vmlinux.rv32_nosmp_defconfig.clang-18 [*]
 +2775790  +760720 +123053  +3659563  +37d72b vmlinux.nommu_virt_defconfig.clang-18 [*]
        .        .       .         .        . vmlinux.defconfig.gcc-12             
        .        .       .         .        . vmlinux.nosmp_defconfig.gcc-12       
        .        .       .         .        . vmlinux.rv32_defconfig.gcc-12        
        .        .       .         .        . vmlinux.rv32_nosmp_defconfig.gcc-12  
        .        .       .         .        . vmlinux.nommu_virt_defconfig.gcc-12  
+13213594 +6340137 +424189 +19977920 +130d6c0 vmlinux.defconfig.clang-17 [*]          
+12131260 +6153709 +409589 +18694558 +11d419e vmlinux.nosmp_defconfig.clang-17 [*]     
+12252639 +4800965 +312865 +17366469 +108fdc5 vmlinux.rv32_defconfig.clang-17 [*]     
+11211650 +4621836 +300841 +16134327  +f630b7 vmlinux.rv32_nosmp_defconfig.clang-17 [*]
 +2797158  +770580 +123053  +3690791  +385127 vmlinux.nommu_virt_defconfig.clang-17 [*]
        .        .       .         .        . vmlinux.defconfig.gcc-11             
        .        .       .         .        . vmlinux.nosmp_defconfig.gcc-11       
        .      -32       .       -32      -20 vmlinux.rv32_defconfig.gcc-11        
        .      -32       .       -32      -20 vmlinux.rv32_nosmp_defconfig.gcc-11  
        .        .       .         .        . vmlinux.nommu_virt_defconfig.gcc-11  
        .        .       .         .        . vmlinux.allnoconfig.gcc-14           
        .        .       .         .        . vmlinux.allmodconfig.gcc-14          
        .        .       .         .        . vmlinux.allnoconfig.clang-19         
        .        .       .         .        . vmlinux.allmodconfig.clang-19

[*] Build was broken before this patch series


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
