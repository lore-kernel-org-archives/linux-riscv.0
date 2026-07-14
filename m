Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF791C4450A
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 18:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a22sAEFI0mSP7GhJWxhxGTFrm66GHVRzR1mW9/gwrBk=; b=brW2IO/aYw98LR
	iOj7+HH9GMdEcs0WGuBF5tFPUaUnHcBHQw//cJoZs9vjYFut8uh28Xs3EPJHlHneE+ZmytBChxQLy
	47bL0p6TEgPL2DR0lzUFITO1/6dDRBmNOsIeIYRaK0vefsXaBaX+OytP5riEiAFpm/hcAKPQt7Uze
	PsO1k80NR6f3osjuBRDPUDd/9sO4lyJgGFTbTza1hvorQi6VwOWWhqZ+kwQEqIw2ua3i47jux7WIr
	X3ERTI+zsgoeHGBZncuMrNWp3UcTGcLGhZqz6JOrHka9HwQD/RKuJh/rsJyLQBu8WnHnSQPBlPSxj
	ITxU+a2xWEBEgoEuKsMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiL0-0000000Cwy6-3vm4;
	Tue, 14 Jul 2026 18:58:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjiKx-0000000CwwD-2XQ4
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 18:58:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784055513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RfsI6HLQGXe6K3Z7dJ8d5kqjISwd3J2Qdz2e+YoCrRA=;
	b=fNTBL+S1a6/fqlOYfcoJug5MaRyA/us/XjGmie7s7Edw1PXI9D3Hrl7QjVraULFv7iBK3X
	bcliHW2GI91dVa0V1NRqdmfAzlUIGmHKU6SfmA9NjkP118X8mX8q7BczEpchOxTZk53XXG
	lmGgqLzUNEycUlECvxcb0eiOxdUIiAg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198--3G9Xf4oMe2KES4EIy5AxA-1; Tue,
 14 Jul 2026 14:57:04 -0400
X-MC-Unique: -3G9Xf4oMe2KES4EIy5AxA-1
X-Mimecast-MFC-AGG-ID: -3G9Xf4oMe2KES4EIy5AxA_1784055423
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D72E6195606E;
	Tue, 14 Jul 2026 18:57:02 +0000 (UTC)
Received: from ezulian-p1gen7.rmtde.csb (unknown [10.44.48.131])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2D4DD30002DD;
	Tue, 14 Jul 2026 18:56:59 +0000 (UTC)
From: Eder Zulian <ezulian@redhat.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Eder Zulian <ezulian@redhat.com>
Subject: [PATCH] riscv: mm: Move dma_contiguous_reserve() after NUMA initialization
Date: Tue, 14 Jul 2026 20:56:48 +0200
Message-ID: <20260714185648.1082483-1-ezulian@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: ejerNNVQKIIFycG5vMCTagD8y1W4HgZxY5CPPQ5kibE_1784055423
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_115835_716935_EBD5141B 
X-CRM114-Status: GOOD (  10.05  )
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

Move the dma_contiguous_reserve() call from setup_bootmem() to
misc_mem_init(), placing it after arch_numa_init(). This ensures that
NUMA topology is initialized when reserving contiguous memory for DMA.

Tested with CMA_SIZE_PERNUMA enabled and two NUMA nodes on QEMU:

qemu-system-riscv64 \
	-machine virt \
	-nographic \
	-smp 2 -m 512M \
	-numa node,nodeid=0,cpus=0,memdev=m0 \
	-numa node,nodeid=1,cpus=1,memdev=m1 \
	-object memory-backend-ram,id=m0,size=256M \
	-object memory-backend-ram,id=m1,size=256M \
	-kernel arch/riscv/boot/Image \
	-append "console=ttyS0 earlycon loglevel=7 cma=16M"

Unpatched kernel's log (one global CMA pool and no per-nodepools, 16 MiB
cma-reserved):

	[    0.000000] cma: Reserved 16 MiB at 0x000000009ee00000
	...
	[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000008fffffff]
	[    0.000000] Initmem setup node 1 [mem 0x0000000090000000-0x000000009fffffff]
	...
	[    0.056397] smp: Brought up 2 nodes, 2 CPUs
	[    0.066135] Memory: 449288K/524288K available (12279K kernel code, 5980K rwdata, 6144K rodata, 2467K init, 482K bss, 54504K reserved, 16384K cma-reserved)

Patched kernel's log (three CMA pools are created, 48 MiB total),

	[    0.000000] cma: Reserved 16 MiB at 0x000000009ee00000
	[    0.000000] cma: Reserved 16 MiB at 0x000000008ee00000
	[    0.000000] cma: Reserved 16 MiB at 0x000000009de00000
	...
	[    0.054251] smp: Brought up 2 nodes, 2 CPUs
	[    0.064082] Memory: 416520K/524288K available (12279K kernel code, 5980K rwdata, 6144K rodata, 2467K init, 482K bss, 54504K reserved, 49152K cma-reserved)

Signed-off-by: Eder Zulian <ezulian@redhat.com>
---
 arch/riscv/mm/init.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 85bdcce63a3e..79a658ebe74d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -295,8 +295,6 @@ static void __init setup_bootmem(void)
 	 */
 	if (!IS_ENABLED(CONFIG_BUILTIN_DTB))
 		memblock_reserve(dtb_early_pa, fdt_totalsize(dtb_early_va));
-
-	dma_contiguous_reserve(dma32_phys_limit);
 }
 
 #ifdef CONFIG_RELOCATABLE
@@ -1349,6 +1347,7 @@ void __init misc_mem_init(void)
 {
 	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
 	arch_numa_init();
+	dma_contiguous_reserve(dma32_phys_limit);
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 	/* The entire VMEMMAP region has been populated. Flush TLB for this region */
 	local_flush_tlb_kernel_range(VMEMMAP_START, VMEMMAP_END);
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
