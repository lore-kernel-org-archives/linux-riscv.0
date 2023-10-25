Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA795C25B47
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 16:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AbXwGf9uoBx3ueSaUgjKNs0MBqxtHMmUfxFbyL3kPRU=; b=quftEu9ssjz1S7
	1xKJaw/SC8oiLmyr+5lbV2Q1aop5HA0dDXR26LyfLvLuEAIvDS0kmdjSdDrRkj/OZBeEwP26oRHBk
	WlAds+Wo1qBAcLE5DQyB5YNm1FLCmC8v7Fb2yze4NGwQ32YWfp6TKbnKssgvVARTB9b8H4l7qcmGZ
	ivQNGXyRXsQErCgNB8n8N+6NC+oauuBbHiEZox6p5SgtPTyjF9A31b7vmvr7poZptIvBjgiZSEWEv
	N/RGCdRHRR2KhQg5JWVYVG5gSXqfH+WGz4YNo8cffaLNa9XyNALtQcowGFpGCrsQLahbBMa63LYCP
	kQ4mPI5LbpwceEFrqvAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvgsa-00CiYx-1X;
	Wed, 25 Oct 2023 16:37:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvgsX-00CiYA-2A
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 16:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 312DE61DFA;
	Wed, 25 Oct 2023 16:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 348AEC433C8;
	Wed, 25 Oct 2023 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698251825;
	bh=VdyLXFY2COwTup0JeI2oLNyMXxJRLaNxrKR5990fVf4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QhcXYLyJu+qAgCZft4rhdjp6kWRAogyk6L1gQArj5SlwRLnY/3dF3Fs74RC2/21MO
	 FFcvCBgVDvZN+hPw7u+QX8Dq3+ffR8Qu18+YkC8a1N0ryDnnYQEXaK/z+IU5aP/CTT
	 5uswnuseVTehS6Sl3Z8n4JTAYynBvj+jZ8rBDJHMq/ze9uxNrYNF3iKWQTpp0wII+/
	 WAZxTB6dlWC7Is/7v7V3VRLKH9tOQrc/qDY8isY2PkIrge4cP0sshQ5PGciEP4sEXy
	 H9fJSuT8Tqakysg3S5O/ZGTMBpu7udKH+kIsQO2lYnDpqWZEP6ZfGYkvBB+6qBR6RT
	 D2xEkgLJf/KuA==
Date: Wed, 25 Oct 2023 09:37:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	Christoph Hellwig <hch@lst.de>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] mm: cma: report correct node id
Message-ID: <20231025163703.GA2440148@dev-arch.thelio-3990X>
References: <20231019013253.2792048-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231019013253.2792048-1-wangkefeng.wang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_093709_814912_2E0DE635 
X-CRM114-Status: GOOD (  21.45  )
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

Hi Kefeng,

On Thu, Oct 19, 2023 at 09:32:53AM +0800, Kefeng Wang wrote:
> Use early_pfn_to_nid() to get correct node id from base instead of
> the default NUMA_NO_NODE in cma_declare_contiguous_nid().
> 
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  mm/cma.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index 2b2494fd6b59..97c27e5fe1a2 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -375,6 +375,9 @@ int __init cma_declare_contiguous_nid(phys_addr_t base,
>  	if (ret)
>  		goto free_mem;
>  
> +	if (nid == NUMA_NO_NODE)
> +		nid = early_pfn_to_nid(PHYS_PFN(base));
> +
>  	pr_info("Reserved %ld MiB at %pa on node %d\n", (unsigned long)size / SZ_1M,
>  		&base, nid);
>  	return 0;
> -- 
> 2.27.0
> 

I bisected a RISC-V boot failure in QEMU to this change in -next. It
happens with OpenSUSE's RISC-V configuration [1], which I was able to
narrow down to the follow configurations on top of defconfig:

CONFIG_ACPI_SPCR_TABLE=y
CONFIG_CMA=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_DMA_CMA=y
CONFIG_NUMA=y

To easily reproduce:

$ echo 'CONFIG_ACPI_SPCR_TABLE=y
CONFIG_CMA=y
CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
CONFIG_DMA_CMA=y
CONFIG_NUMA=y' >kernel/configs/repro.config

$ make -skj"$(nproc)" ARCH=riscv CROSS_COMPILE=riscv64-linux- defconfig repro.config Image

$ qemu-system-riscv64 \
    -display none \
    -nodefaults \
    -bios default \
    -M virt \
    -append earlycon \
    -kernel arch/riscv/boot/Image \
    -initrd riscv-rootfs.cpio \
    -m 512m \
    -serial mon:stdio

OpenSBI v1.3.1
...

<hangs after OpenSBI output>

Without CONFIG_ACPI_SPCR_TABLE=y, there is a visible crash.

[    0.000000] Linux version 6.6.0-rc7-next-20231025 (nathan@dev-fedora.c3-large-arm64) (riscv64-linux-gcc (GCC) 13.2.0, GNU ld (GNU Binutils) 2.41) #1 SMP Wed Oct 25 16:14:59 UTC 2023
...
[    0.000000] mem auto-init: stack:all(zero), heap alloc:off, heap free:off
[    0.000000] page:ff1c000002200000 is uninitialized and poisoned
[    0.000000] page dumped because: VM_BUG_ON_PAGE(1 && PageCompound(page))
[    0.000000] ------------[ cut here ]------------
[    0.000000] kernel BUG at include/linux/page-flags.h:493!
[    0.000000] Kernel BUG [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.0-rc7-next-20231025 #1
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] epc : __free_pages_core+0x78/0x126
[    0.000000]  ra : __free_pages_core+0x78/0x126
[    0.000000] epc : ffffffff8018dd8e ra : ffffffff8018dd8e sp : ffffffff81403d40
[    0.000000]  gp : ffffffff815013a0 tp : ffffffff8140db00 t0 : 6d75642065676170
[    0.000000]  t1 : 0000000000000070 t2 : 706d756420656761 s0 : ffffffff81403d50
[    0.000000]  s1 : 0000000000000004 a0 : 000000000000003c a1 : ffffffff814866a8
[    0.000000]  a2 : 0000000000000000 a3 : 0000000000000001 a4 : 0000000000000000
[    0.000000]  a5 : 0000000000000000 a6 : 0000000000000008 a7 : 0000000000000038
[    0.000000]  s2 : 0000000000088000 s3 : ff1c000002200000 s4 : 0000000000000009
[    0.000000]  s5 : 00000000ffffffff s6 : 0000000000081800 s7 : 0000000000088200
[    0.000000]  s8 : 00000000000001c0 s9 : 0040000000000000 s10: ffffffff81500bdd
[    0.000000]  s11: ffffffff81500bdc t3 : ffffffff81515aa7 t4 : ffffffff81515aa7
[    0.000000]  t5 : ffffffff81515aa8 t6 : ffffffff81403b58
[    0.000000] status: 0000000200000100 badaddr: 0000000000000000 cause: 0000000000000003
[    0.000000] [<ffffffff8018dd8e>] __free_pages_core+0x78/0x126
[    0.000000] [<ffffffff80a12fee>] memblock_free_pages+0x52/0x62
[    0.000000] [<ffffffff80a15f02>] memblock_free_all+0x1fc/0x27e
[    0.000000] [<ffffffff80a061fa>] mem_init+0x34/0x22c
[    0.000000] [<ffffffff80a13114>] mm_core_init+0x116/0x2d0
[    0.000000] [<ffffffff80a00a6e>] start_kernel+0x3c6/0x742
[    0.000000] Code: 0405 8399 8b85 d7f1 9597 00e2 8593 2ae5 90ef e5dd (9002) 6597
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Fatal exception in interrupt

The rootfs is available at [2] if necessary. If there is any more
information I can provide or patches I can test, I am more than happy to
do so.

[1]: https://github.com/openSUSE/kernel-source/raw/master/config/riscv64/default
[2]: https://github.com/ClangBuiltLinux/boot-utils/releases

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
