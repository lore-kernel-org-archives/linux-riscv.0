Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20982C5AC67
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 20:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TEiIip+VYQfHT1KhbvzVANV22EnLWvxVTQBsm8H0Nd4=; b=Hdo6k7gvSI8ncP
	so0Gy3+nX2vhRLYfaG/QxzBvcycjOom9pZ3HT4F6OfLJfFIIjt5YVCb6Ats/ccBWIeJjCb2rwegDc
	p87t2h1BN6JpZ8gvlYQk/YY0Lmg1X8VMq7RADTnUdPc/2Ye0Wvjrci9mD8kkg8xYvA5kSejmDU+z/
	8LRCR1HY3OwqaIpCqSKbjpMcVSSoo/DAlF3/wf2f3U1pzp7lC13XP0k6fnVhrCf8e32uCntpkKuzs
	/Nr6cJGAQmBLwUAI+7FE5dDSXyp3P+OxmEJm0uEqjJ8Bd/kNZPjdPFixMzpNyc1zTUQNtaDPyS7n2
	78//hHLR5L9sSXKwNEbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttGO-0000000EwOe-3MSG;
	Tue, 11 Aug 2026 20:39:56 +0000
Received: from mail02.kasm.eu ([2001:678:a5c:1380:5054:ff:fe32:b8fe])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wttGM-0000000EwOB-0S5J
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 20:39:55 +0000
Received: from localhost (soda.int.kasm.eu [IPv6:2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
	by mail02.kasm.eu (Postfix) with ESMTPSA id DF9712548DE;
	Tue, 11 Aug 2026 22:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kasm.eu; s=default;
	t=1786480779; bh=HzCsdjXOl07TBdcf1JVpgBjz4KRdhAtdc0V5Bj5044U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vVUawmidp9WCzBxaGy2k/Fm3REpQfFT8mjY23q/otlXT2L26nY+HkTvPPOiE/wK5H
	 94y/+qgNGsDMiYHhLuQOkgtTDQL1yDzLDJlBexCvNz3S9Cycuv1IyLJLf8PcRCHxJ2
	 rhDXN4Z2P4H1PgjMyd1e2q9yYl0hoNjcock6QCbc=
Date: Tue, 11 Aug 2026 22:39:38 +0200
From: Klara Modin <klara@kasm.eu>
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] riscv: patch: skip fixmap mapping when kernel
 text is already writable
Message-ID: <ant_8TaBbov_GS4i@soda.int.kasm.eu>
References: <20260720032258.5188-1-xiaofengmian@163.com>
 <20260720032258.5188-3-xiaofengmian@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260720032258.5188-3-xiaofengmian@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_133954_294417_7CB79B3D 
X-CRM114-Status: GOOD (  20.05  )
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

Hi,

On 2026-07-20 03:22:57 +0000, Xiaofeng Yuan wrote:
> Currently patch_map() always creates a temporary writable mapping via
> fixmap for kernel text addresses, even when CONFIG_STRICT_MODULE_RWX
> is disabled and the kernel text is already mapped with _PAGE_WRITE.
> 
> This is unnecessary overhead at best, and on minimal configurations
> it can cause page faults.
> 
> Skip the fixmap path for kernel text when CONFIG_STRICT_MODULE_RWX
> is not enabled, since the text pages are already writable in this case.
> 
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
> ---
> v2: add commit description
> v3: early return when !CONFIG_STRICT_MODULE_RWX (per Nam Cao's suggestion)
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 16b243376f..caef41d5ef 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -44,15 +44,16 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
>  	uintptr_t uintaddr = (uintptr_t) addr;
>  	phys_addr_t phys;
>  
> +	if (!IS_ENABLED(CONFIG_STRICT_MODULE_RWX))
> +		return addr;

Is this correct when STRICT_KERNEL_RWX is set and not STRICT_MODULE_RWX
(e.g. when modules are not enabled)?

> +
>  	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
>  		phys = __pa_symbol(addr);
> -	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
> +	} else {
>  		struct page *page = vmalloc_to_page(addr);
>  
>  		BUG_ON(!page);
>  		phys = page_to_phys(page) + offset_in_page(addr);
> -	} else {
> -		return addr;
>  	}
>  
>  	return (void *)set_fixmap_offset(fixmap, phys);
> -- 
> 2.43.0
> 

This patch causes the following oops on my BPI-F3:

 Unable to handle kernel paging request at virtual address 0000006789abce0b
 Current swapper/0 pgtable: 4K pagesize, 39-bit VAs, pgdp=0x000000000269d000
 [0000006789abce0b] pgd=0000000040031c01, p4d=0000000040031c01, pud=0000000040031c01, pmd=0000000000000000
 Oops [#1]
 Tainted: [W]=WARN
 Hardware name: Banana Pi BPI-F3 (DT)
 epc : kmem_cache_alloc_lru_noprof (/home/klara/git/linux/trees/bisect/mm/slub.c:4941)
  ra : __d_alloc (/home/klara/git/linux/trees/bisect/fs/dcache.c:1902)
 epc : ffffffff8038379e ra : ffffffff804053b2 sp : ffffffff82203ab0
  gp : ffffffff8248da18 tp : ffffffff822200c0 t0 : ffffffd7010660e8
  t1 : ffffffff921904d0 t2 : 000000005d6ccc9e s0 : ffffffff82203b30
  s1 : 0000000000000000 a0 : 0123456789abcdef a1 : ffffffd700b3f510
  a2 : 0000000000000cc0 a3 : 0000000000000002 a4 : 0000000000000000
  a5 : 0123456700000000 a6 : 00ffffffff899275 a7 : ffffffff82203918
  s2 : 0000000000000000 s3 : ffffffd700b3f000 s4 : ffffffff81a0d848
  s5 : ffffffff82492018 s6 : 0000000000000000 s7 : 00000000000003e8
  s8 : ffffffff814010e0 s9 : 0000000000000000 s10: 0000000000200000
  s11: 00000000024910d8 t3 : 0000000000000014 t4 : 0000000000000026
  t5 : 000000003137ae71 t6 : ffffffff82203b18 ssp : 0000000000000000
 status: 0000000200000120 badaddr: 0000006789abce0b cause: 000000000000000d
 kmem_cache_alloc_lru_noprof (/home/klara/git/linux/trees/bisect/mm/slub.c:4941)
 __d_alloc (/home/klara/git/linux/trees/bisect/fs/dcache.c:1902)
 d_make_root (/home/klara/git/linux/trees/bisect/fs/dcache.c:1999 /home/klara/git/linux/trees/bisect/fs/dcache.c:2213)
 shmem_fill_super (/home/klara/git/linux/trees/bisect/mm/shmem.c:5050)
 get_tree_nodev (/home/klara/git/linux/trees/bisect/fs/super.c:1273 /home/klara/git/linux/trees/bisect/fs/super.c:1292)
 shmem_get_tree (/home/klara/git/linux/trees/bisect/mm/shmem.c:5062)
 vfs_get_tree (/home/klara/git/linux/trees/bisect/fs/super.c:1700)
 fc_mount (/home/klara/git/linux/trees/bisect/fs/namespace.c:1198)
 vfs_kern_mount.part.0 (/home/klara/git/linux/trees/bisect/fs/namespace.c:1236)
 kern_mount (/home/klara/git/linux/trees/bisect/fs/namespace.c:6290 /home/klara/git/linux/trees/bisect/fs/namespace.c:6292)
 shmem_init (/home/klara/git/linux/trees/bisect/mm/shmem.c:5367)
 mnt_init (/home/klara/git/linux/trees/bisect/fs/namespace.c:6274)
 vfs_caches_init (/home/klara/git/linux/trees/bisect/fs/dcache.c:3517)
 start_kernel (/home/klara/git/linux/trees/bisect/init/main.c:1157)
 Code: 0001 0001 0001 7119 f8a2 f4a6 0100 f0ca ecce fc86 (6703) 01c5
 All code
 ========
    0:	0001                	.insn	2, 0x0001
    2:	0001                	.insn	2, 0x0001
    4:	0001                	.insn	2, 0x0001
    6:	7119                	.insn	2, 0x7119
    8:	f8a2                	.insn	2, 0xf8a2
    a:	f4a6                	.insn	2, 0xf4a6
    c:	0100                	.insn	2, 0x0100
    e:	f0ca                	.insn	2, 0xf0ca
   10:	ecce                	.insn	2, 0xecce
   12:	fc86                	.insn	2, 0xfc86
   14:*	01c56703          	lwu	a4,28(a0)		<-- trapping instruction
 
 Code starting with the faulting instruction
 ===========================================
    0:	01c56703          	lwu	a4,28(a0)
 ---[ end trace 0000000000000000 ]---
 Kernel panic - not syncing: Attempted to kill the idle task!

I have MODULES disabled and thus also STRICT_MODULE_RWX disabled, but
still STRICT_KERNEL_RWX enabled. I saw that an earlier version of this
patch[1] instead gated the first branch behind STRICT_KERNEL_RWX. That
version works fine for me.

Regards,
Klara Modin

Link: https://lore.kernel.org/lkml/20260719081037.5749-3-xiaofengmian@163.com [1]

 # bad: [66566bdc5a42d707d4c3f54587333db00e955268] Merge branch 'unstable/spacemit-k1-wdt' into unstable/next-local
 git bisect start 'HEAD'
 # status: waiting for 'good' commit(s), 'bad' commit known
 # good: [f5bbbfec59b4e2fb7520a91de3df8a6174325d6a] Merge tag 'probes-fixes-v7.2-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
 git bisect good f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
 # bad: [9eba0000697167ff6960428f7401e9f65f7abba3] Merge branch 'libcrypto-next' of https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git
 git bisect bad 9eba0000697167ff6960428f7401e9f65f7abba3
 # bad: [6a66dbb2b9b0a0a5b1225052267c0eaedf34492d] Merge branch 'xtensa-for-next' of https://github.com/jcmvbkbc/linux-xtensa.git
 git bisect bad 6a66dbb2b9b0a0a5b1225052267c0eaedf34492d
 # good: [3787df98a48a0e699f6a06d4a42fc20597368db1] Merge branch 'for-next/core' of https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux
 git bisect good 3787df98a48a0e699f6a06d4a42fc20597368db1
 # good: [aeba6e4f8ace1a3f016feb64c0a417c7ddcbcf6b] Merge tag 'qcom-arm64-for-7.3-2' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into soc/dt
 git bisect good aeba6e4f8ace1a3f016feb64c0a417c7ddcbcf6b
 # good: [15213090630d0a4417dbcdef0de776cd2fac0fac] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git
 git bisect good 15213090630d0a4417dbcdef0de776cd2fac0fac
 # good: [e347a696fd95bc9b47e23e3d8ac7f6263ee502b2] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git
 git bisect good e347a696fd95bc9b47e23e3d8ac7f6263ee502b2
 # good: [b7307ccce8238c792fb3a6412ca5cac9ba8784bc] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git
 git bisect good b7307ccce8238c792fb3a6412ca5cac9ba8784bc
 # good: [b5d4268affa543793ccaf838a10915c2c9f0db1c] Merge branch 'features' into for-next
 git bisect good b5d4268affa543793ccaf838a10915c2c9f0db1c
 # good: [ebdec8d2c156b8e662cb350ce05b0f92275f6ffd] RISC-V: Add Ssccfg/Smcdeleg ISA extension definition and parsing
 git bisect good ebdec8d2c156b8e662cb350ce05b0f92275f6ffd
 # good: [f61959a3a8b5522eb43cf71f293e091417bbf11c] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
 git bisect good f61959a3a8b5522eb43cf71f293e091417bbf11c
 # bad: [54fefa110db4a407d96625b66a76d874713ddae2] riscv: patch: skip fixmap mapping when kernel text is already writable
 git bisect bad 54fefa110db4a407d96625b66a76d874713ddae2
 # good: [42cd1e1fc8995ec7ed5cc61957fc503eb065e0eb] riscv: alternative: Also patch the compat vDSO
 git bisect good 42cd1e1fc8995ec7ed5cc61957fc503eb065e0eb
 # good: [83ba459c9b5893590fd47177363b08b453a86168] riscv: mm: make EXECMEM_KPROBES writable without CONFIG_STRICT_MODULE_RWX
 git bisect good 83ba459c9b5893590fd47177363b08b453a86168
 # first 'bad' commit: [54fefa110db4a407d96625b66a76d874713ddae2] riscv: patch: skip fixmap mapping when kernel text is already writable
 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
