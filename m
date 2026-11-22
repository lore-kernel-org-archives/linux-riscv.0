Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A32B606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 20:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gnD24Uiv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bauQ4KpO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9c1pcYcJmd89HECtFZtbZ3Q3AJDk4mdj5nNB3L9qXIA=; b=gnD24Uiv5O9u2nvQOcNirEs5sQ
	8i+fB90hZ7FlNpJKOl7U0XJ0GzlGErUsUsv4d1YJLt6WU1BlqLWSRR8RN3sOVmELtzkow2odrWtXM
	6U62yVVPPugRZMU8z5fBWeDN7/iVRISSOmRc2eDTCWQ4iva4/lE5r09JzKc0izMQJedVd/nL6EjSx
	b3I4ZpCZ+CbITwzjV9iAY69gjM8Yq3dNGOwjZwX4w44e/MbQXtBhEgW9KrNk53JUarSGYHYQkyO2+
	7vBysX2URoMS0XLrErLk86gOgIMy78+3grEGdJKp2T0+Tt/FaFIB37IfP8gV36psRP9W/F2wqXk4V
	bCfAqOIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDuu-00000001hGr-06SQ;
	Sun, 22 Nov 2026 20:12:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVDus-00000001hGl-22nB
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 20:12:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D829F41A21;
	Sun, 22 Nov 2026 20:12:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D92D1F000C0;
	Sun, 22 Nov 2026 20:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795378321;
	bh=0YiM6djptQgn4EoVdjkfY4phLj3O+eimQq1jNyeXtv4=;
	h=Date:From:To:cc:Subject;
	b=bauQ4KpOmHGiu27NL6CqIlssJ8Kk95HPTvdVpCoFLwo+YaZ75wonqNi1S0uv+wnIT
	 FueDb5NpDM6HZOrkQCCg9rYgQii8R11molw4TmCl+kv8BehgG+F2NmMLByNMimKU6q
	 zMlmOBhWgrXDheJD1jFOwflmiYqJssH9U4EpFWd+VNLNFueBiZs8MQwFlId76Ed63Z
	 33Y2pgtoyc4Gqbqd1I3WUtguNTPi5EPXM8B/RNpA75AXM3F/c95rRZXrEgvr/UKTGk
	 XXxWUdcFbPHnja/lAxkSYhyMLQix34D4QY92DUGf/tyxxZ3o5vvtIPEGt69mLVTklt
	 imq50jOsnbVQg==
Date: Sun, 22 Nov 2026 13:11:58 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: torvalds@linux-foundation.org
cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] RISC-V updates for v7.4-rc4
Message-ID: <1a74c335-ead7-bf62-b35b-d2afd06599ca@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1527400424-1795378321=:2266450"
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1527400424-1795378321=:2266450
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 8BIT

Linus,

Please pull these RISC-V updates for v7.4-rc4.  There's nothing
controversial here from a maintenance point of view, I think.
Details are in the PR message.

thanks,


- Paul


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux tags/riscv-for-linus-7.4-rc4

for you to fetch changes up to fc91dacd0c2b4f9ca7e0ce30016f5aee6256cba5:

  riscv: mm: reserve the DTB before scanning reserved memory (2026-11-21 12:27:09 -0700)

----------------------------------------------------------------
RISC-V updates for v7.4-rc4

- Fix a bug in the context switch code that can allow the switched-to
  task to inadvertently inherit the supervisor user memory access
  privilege from the switched-from task

- Protect the regs->status RMW sequences in the vector register
  context switch code, to fix a potential floating point state
  corruption bug

- Fix the return values from the early boot unaligned access speed
  detection functions called by __setup() to return 0 on failure,
  rather than an error code, as 0 is what __setup() expects to receive
  upon an error

- Prevent the DTB from being potentially overwritten early in boot by
  reserving it in memblock before scanning the /reserved-memory
  section of the DTB

- Fix hugetlb vmemmap optimization and a few other code paths that map
  kernel pages as read-only by defining PAGE_KERNEL_RO

- Fix an error path in kgdb_riscv_notify() to add a missing
  local_irq_restore()

- Fix the RISC-V defconfig to enable heap randomization by default by
  removing CONFIG_COMPAT_BRK, which shouldn't have been there in the
  first place; and to enable building onboard USB hub support as a
  module to better support the SpacemiT K1

- Fix CONFIG_RISCV_ISA_SV{48,57} to depend on CONFIG_MMU, since they
  are virtual memory configuration options that by definition require
  MMU support

- Fix a missing space in the SpacemiT K1 DTS file

----------------------------------------------------------------
Clément Léger (1):
      riscv: kgdb: Fix potential missing local_irq_restore() call

Frédéric Mahé (1):
      riscv: defconfig: enable onboard USB hub support

Geert Uytterhoeven (1):
      riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend on MMU

Guobin Zhang (1):
      riscv: signal: protect regs->status RMW from concurrent preemption

Krzysztof Kozlowski (1):
      riscv: dts: spacemit: k1: Correct missing space

Marek Szyprowski (1):
      riscv: mm: reserve the DTB before scanning reserved memory

Michael Ellerman (1):
      riscv: defconfig: Disable COMPAT_BRK

Nickolai Zeldovich (1):
      riscv: mm: Define PAGE_KERNEL_RO

Vladimir Kondratiev (1):
      riscv: unaligned: fix __setup handlers

Yunhui Cui (1):
      riscv: Fix SR_SUM leakage across context switches

 arch/riscv/Kconfig                         |  4 ++--
 arch/riscv/boot/dts/spacemit/k1.dtsi       |  2 +-
 arch/riscv/configs/defconfig               |  2 ++
 arch/riscv/include/asm/pgtable.h           |  1 +
 arch/riscv/include/asm/switch_to.h         | 30 ++++++++++++++++++++++++------
 arch/riscv/include/asm/vector.h            |  2 ++
 arch/riscv/kernel/entry.S                  |  6 +++---
 arch/riscv/kernel/kernel_mode_fpu.c        |  4 ++--
 arch/riscv/kernel/kgdb.c                   | 28 ++++++++++++++++++----------
 arch/riscv/kernel/signal.c                 |  2 ++
 arch/riscv/kernel/unaligned_access_speed.c |  4 ++--
 arch/riscv/mm/init.c                       | 14 +++++++-------
 12 files changed, 66 insertions(+), 33 deletions(-)

vmlinux size differences in bytes (from 6628e7d4c6b2):
  text    data   bss     dec     hex  filename                             
 +1877   +8356     .  +10233   +27f9  vmlinux.defconfig.gcc-16             
  +576    +164     .    +740    +2e4  vmlinux.nosmp_defconfig.gcc-16       
 +1117   +7812     .   +8929   +22e1  vmlinux.rv32_defconfig.gcc-16        
  +456    +132     .    +588    +24c  vmlinux.rv32_nosmp_defconfig.gcc-16  
  +360    +100     .    +460    +1cc  vmlinux.nommu_virt_defconfig.gcc-16  
 +1693   +8388     .  +10081   +2761  vmlinux.defconfig.gcc-15             
  +536    +164     .    +700    +2bc  vmlinux.nosmp_defconfig.gcc-15       
 +1133   +7780     .   +8913   +22d1  vmlinux.rv32_defconfig.gcc-15        
  +448    +164     .    +612    +264  vmlinux.rv32_nosmp_defconfig.gcc-15  
  +360    +100     .    +460    +1cc  vmlinux.nommu_virt_defconfig.gcc-15  
 +1293   +8356     .   +9649   +25b1  vmlinux.defconfig.gcc-14             
  +464    +132     .    +596    +254  vmlinux.nosmp_defconfig.gcc-14       
  +981   +7748     .   +8729   +2219  vmlinux.rv32_defconfig.gcc-14        
  +360    +132     .    +492    +1ec  vmlinux.rv32_nosmp_defconfig.gcc-14  
  +360    +100     .    +460    +1cc  vmlinux.nommu_virt_defconfig.gcc-14  
 +1325   +8292     .   +9617   +2591  vmlinux.defconfig.clang-20           
  +448    +604     .   +1052    +41c  vmlinux.nosmp_defconfig.clang-20     
  +941   +8288     .   +9229   +240d  vmlinux.rv32_defconfig.clang-20      
  +360    +160     .    +520    +208  vmlinux.rv32_nosmp_defconfig.clang-20
  +360   -3996     .   -3636    -e34  vmlinux.nommu_virt_defconfig.clang-20
 +1225   +8252     .   +9477   +2505  vmlinux.defconfig.clang-19           
  +448    +132     .    +580    +244  vmlinux.nosmp_defconfig.clang-19     
  +957   +7748     .   +8705   +2201  vmlinux.rv32_defconfig.clang-19      
  +360    +164     .    +524    +20c  vmlinux.rv32_nosmp_defconfig.clang-19
  +360     +36     .    +396    +18c  vmlinux.nommu_virt_defconfig.clang-19
 +1657   +8356     .  +10013   +271d  vmlinux.defconfig.gcc-13             
  +628    +164     .    +792    +318  vmlinux.nosmp_defconfig.gcc-13       
 +1161   +7780     .   +8941   +22ed  vmlinux.rv32_defconfig.gcc-13        
  +576    +132     .    +708    +2c4  vmlinux.rv32_nosmp_defconfig.gcc-13  
  +368     +36     .    +404    +194  vmlinux.nommu_virt_defconfig.gcc-13  
 +1253   +8260     .   +9513   +2529  vmlinux.defconfig.clang-18           
  +448     +92     .    +540    +21c  vmlinux.nosmp_defconfig.clang-18     
  +965   +8316     .   +9281   +2441  vmlinux.rv32_defconfig.clang-18      
  +352    +124     .    +476    +1dc  vmlinux.rv32_nosmp_defconfig.clang-18
  +360     +36     .    +396    +18c  vmlinux.nommu_virt_defconfig.clang-18
 +1581   +8356     .   +9937   +26d1  vmlinux.defconfig.gcc-12             
  +624    +196     .    +820    +334  vmlinux.nosmp_defconfig.gcc-12       
 +1153   +7812     .   +8965   +2305  vmlinux.rv32_defconfig.gcc-12        
  +592    +164     .    +756    +2f4  vmlinux.rv32_nosmp_defconfig.gcc-12  
  +368     +36     .    +404    +194  vmlinux.nommu_virt_defconfig.gcc-12  
 +1469   +8288     .   +9757   +261d  vmlinux.defconfig.clang-17           
  +652    +640     .   +1292    +50c  vmlinux.nosmp_defconfig.clang-17     
 +1153   +7776     .   +8929   +22e1  vmlinux.rv32_defconfig.clang-17      
  +552    +128     .    +680    +2a8  vmlinux.rv32_nosmp_defconfig.clang-17
  +608    +192     .    +800    +320  vmlinux.nommu_virt_defconfig.clang-17
 +1333   +8356     .   +9689   +25d9  vmlinux.defconfig.gcc-11             
  +484    +196     .    +680    +2a8  vmlinux.nosmp_defconfig.gcc-11       
 +1033   +7748     .   +8781   +224d  vmlinux.rv32_defconfig.gcc-11        
  +456    +164     .    +620    +26c  vmlinux.rv32_nosmp_defconfig.gcc-11  
  +352  +12324     .  +12676   +3184  vmlinux.nommu_virt_defconfig.gcc-11  
   +30     +32     .     +62     +3e  vmlinux.allnoconfig.gcc-15           
+92776    +172  -192  +92756  +16a54  vmlinux.allmodconfig.gcc-15          
     .       .     .       .       .  vmlinux.allnoconfig.clang-19         
 +1840    +228     .   +2068    +814  vmlinux.allmodconfig.clang-19        
--8323329-1527400424-1795378321=:2266450
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--8323329-1527400424-1795378321=:2266450--

