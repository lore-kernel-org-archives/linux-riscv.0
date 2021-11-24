Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46273C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Nov 2021 23:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hujoJ9EecCwTPjAx5tpVsC6ctjan6I7sojVLu+wc4Pc=; b=DyGewbsaZf3hJR
	U8OoO7kHpTOYaVtCjAmuEaGwXdLamgdVhZwzXQrk0xDrOD1B76Plf8KxO1tSVihRYYg53G0XbCgC4
	0kbDWTF7mVbM6vJlJyfPEsjOMDdDdnN1X6ICL82HKvL6uvOQ+ALwLPLdA8+v5rOrrSMIUP/KNXCbf
	+5B2NCZX7XKn+zjizNMQjR6GEkreqgamFZ7Tvk31akJRCMYPQB/EWQffnTFVTBSO02/K9cJMawdF3
	0Y4KWYsB/LCyaBrdVtcInYOSxuR6xQImibj01JKQNz7jt0lt3aPWbHdtYDcDtGeuxBpPhLgmONSyk
	S8aJd/RwGvFhe+jTjNNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq1hq-0064p0-3F; Wed, 24 Nov 2021 23:29:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq1hn-0064oQ-NZ
 for linux-riscv@lists.infradead.org; Wed, 24 Nov 2021 23:29:37 +0000
Received: from ip5f5b2004.dynamic.kabel-deutschland.de ([95.91.32.4]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1mq1ha-0000eP-BH; Thu, 25 Nov 2021 00:29:22 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@wdc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>, Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-efi@vger.kernel.org,
 linux-arch@vger.kernel.org, Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Subject: Re: [PATCH v2 00/10] Introduce sv48 support without relocatable kernel
Date: Thu, 25 Nov 2021 00:29:20 +0100
Message-ID: <2700575.YIZvDWadBg@diego>
In-Reply-To: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
References: <20210929145113.1935778-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_152935_828014_DF239F79 
X-CRM114-Status: GOOD (  24.04  )
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

Am Mittwoch, 29. September 2021, 16:51:03 CET schrieb Alexandre Ghiti:
> This patchset allows to have a single kernel for sv39 and sv48 without           
> being relocatable.                                                               
>                                                                                  
> The idea comes from Arnd Bergmann who suggested to do the same as x86,           
> that is mapping the kernel to the end of the address space, which allows         
> the kernel to be linked at the same address for both sv39 and sv48 and           
> then does not require to be relocated at runtime.                                
>                                                                                  
> This implements sv48 support at runtime. The kernel will try to                  
> boot with 4-level page table and will fallback to 3-level if the HW does not     
> support it. Folding the 4th level into a 3-level page table has almost no        
> cost at runtime.                                                                 
>                                                                                  
> Tested on:                                                                       
>   - qemu rv64 sv39: OK                                                           
>   - qemu rv64 sv48: OK                                                           
>   - qemu rv64 sv39 + kasan: OK                                                   
>   - qemu rv64 sv48 + kasan: OK                                                   
>   - qemu rv32: OK                                                                
>   - Unmatched: OK

On a beagleV (which supports only sv39) I've tested both the limit via
the mmu-type in the devicetree and also that the fallback works when
I disable the mmu-type in the dt, so

Tested-by: Heiko Stuebner <heiko@sntech.de>

>   
>                                                                                  
> Changes in v2:                                                                   
>   - Rebase onto for-next                                                         
>   - Fix KASAN                                                                    
>   - Fix stack canary                                                             
>   - Get completely rid of MAXPHYSMEM configs                                     
>   - Add documentation
> 
> Alexandre Ghiti (10):
>   riscv: Allow to dynamically define VA_BITS
>   riscv: Get rid of MAXPHYSMEM configs
>   asm-generic: Prepare for riscv use of pud_alloc_one and pud_free
>   riscv: Implement sv48 support
>   riscv: Use pgtable_l4_enabled to output mmu_type in cpuinfo
>   riscv: Explicit comment about user virtual address space size
>   riscv: Improve virtual kernel memory layout dump
>   Documentation: riscv: Add sv48 description to VM layout
>   riscv: Initialize thread pointer before calling C functions
>   riscv: Allow user to downgrade to sv39 when hw supports sv48
> 
>  Documentation/riscv/vm-layout.rst             |  36 ++
>  arch/riscv/Kconfig                            |  35 +-
>  arch/riscv/configs/nommu_k210_defconfig       |   1 -
>  .../riscv/configs/nommu_k210_sdcard_defconfig |   1 -
>  arch/riscv/configs/nommu_virt_defconfig       |   1 -
>  arch/riscv/include/asm/csr.h                  |   3 +-
>  arch/riscv/include/asm/fixmap.h               |   1 +
>  arch/riscv/include/asm/kasan.h                |   2 +-
>  arch/riscv/include/asm/page.h                 |  10 +
>  arch/riscv/include/asm/pgalloc.h              |  40 +++
>  arch/riscv/include/asm/pgtable-64.h           | 108 +++++-
>  arch/riscv/include/asm/pgtable.h              |  30 +-
>  arch/riscv/include/asm/sparsemem.h            |   6 +-
>  arch/riscv/kernel/cpu.c                       |  23 +-
>  arch/riscv/kernel/head.S                      |   4 +-
>  arch/riscv/mm/context.c                       |   4 +-
>  arch/riscv/mm/init.c                          | 323 +++++++++++++++---
>  arch/riscv/mm/kasan_init.c                    |  91 +++--
>  drivers/firmware/efi/libstub/efi-stub.c       |   2 +
>  include/asm-generic/pgalloc.h                 |  24 +-
>  include/linux/sizes.h                         |   1 +
>  21 files changed, 615 insertions(+), 131 deletions(-)
> 
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
