Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BCBD32D81
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 18:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OL6Qhj2xFFcqEBFnv1ChgW9Mw2dZ4quwCRfzIJxyXc4=; b=C4tDkPV9gUwdMH
	yL3c3wrkVpC7BqA5jVKW62NnfSvYIfIWBAgHqgit2JNv+9848QrfqPDpXzwTvtotXsuGMH7cHIuzG
	xGXl/4R/jx4bZEJgz2i24CYJ3xb7KrHz/2SiEZsZ/6pz+bKx7yxsZsAU99ByMcsLa9d+uyS+6jzCY
	EeABiljAWNOqFgrkKRfIyvMA/a2Zsm50WI1rlQfY/jU7KJgIjdu30clBYVj8SA6nggAACYBLi4Zv0
	Bil2zp5TQnK/Ashefdpd7XHQLzT+GkZhnNOhd2den2pZpbL7bhfzJtRPLNjHzlvDGEecfIvnGvUTc
	1dDjqN9Rdm7Oj93Fihxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAw5E-00000004dK7-0Rih;
	Tue, 12 Nov 2024 18:57:48 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAw19-00000004cmO-04Gq
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 18:53:36 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:78de:3cf6:79c5:d375])
	by laurent.telenet-ops.be with cmsmtp
	id butW2D00D4mJWgD01utWax; Tue, 12 Nov 2024 19:53:31 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAw0i-006uOe-Tm;
	Tue, 12 Nov 2024 19:53:30 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tAw14-001tcq-Bf;
	Tue, 12 Nov 2024 19:53:30 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dma-mapping: Save base/size instead of pointer to shared DMA pool
Date: Tue, 12 Nov 2024 19:53:22 +0100
Message-ID: <f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_105335_204431_0519880D 
X-CRM114-Status: GOOD (  12.97  )
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
Message-ID: <20241112185322.WVsxmWgB_qPRaX35dDqc32psx0XG7CyEEetfBY0XnKI@z>

On RZ/Five, which is non-coherent, and uses CONFIG_DMA_GLOBAL_POOL=y:

    Oops - store (or AMO) access fault [#1]
    CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.12.0-rc1-00015-g8a6e02d0c00e #201
    Hardware name: Renesas SMARC EVK based on r9a07g043f01 (DT)
    epc : __memset+0x60/0x100
     ra : __dma_alloc_from_coherent+0x150/0x17a
    epc : ffffffff8062d2bc ra : ffffffff80053a94 sp : ffffffc60000ba20
     gp : ffffffff812e9938 tp : ffffffd601920000 t0 : ffffffc6000d0000
     t1 : 0000000000000000 t2 : ffffffffe9600000 s0 : ffffffc60000baa0
     s1 : ffffffc6000d0000 a0 : ffffffc6000d0000 a1 : 0000000000000000
     a2 : 0000000000001000 a3 : ffffffc6000d1000 a4 : 0000000000000000
     a5 : 0000000000000000 a6 : ffffffd601adacc0 a7 : ffffffd601a841a8
     s2 : ffffffd6018573c0 s3 : 0000000000001000 s4 : ffffffd6019541e0
     s5 : 0000000200000022 s6 : ffffffd6018f8410 s7 : ffffffd6018573e8
     s8 : 0000000000000001 s9 : 0000000000000001 s10: 0000000000000010
     s11: 0000000000000000 t3 : 0000000000000000 t4 : ffffffffdefe62d1
     t5 : 000000001cd6a3a9 t6 : ffffffd601b2aad6
    status: 0000000200000120 badaddr: ffffffc6000d0000 cause: 0000000000000007
    [<ffffffff8062d2bc>] __memset+0x60/0x100
    [<ffffffff80053e1a>] dma_alloc_from_global_coherent+0x1c/0x28
    [<ffffffff80053056>] dma_direct_alloc+0x98/0x112
    [<ffffffff8005238c>] dma_alloc_attrs+0x78/0x86
    [<ffffffff8035fdb4>] rz_dmac_probe+0x3f6/0x50a
    [<ffffffff803a0694>] platform_probe+0x4c/0x8a

If CONFIG_DMA_GLOBAL_POOL=y, the reserved_mem structure passed to
rmem_dma_setup() is saved for later use, by saving the passed pointer.
However, when dma_init_reserved_memory() is called later, the pointer
has become stale, causing a crash.

E.g. in the RZ/Five case, the referenced memory now contains the
reserved_mem structure for the "mmode_resv0@30000" node (with base
0x30000 and size 0x10000), instead of the correct "pma_resv0@58000000"
node (with base 0x58000000 and size 0x8000000).

Fix this by saving the needed reserved_mem structure's contents instead.

Fixes: 8a6e02d0c00e7b62 ("of: reserved_mem: Restructure how the reserved memory regions are processed")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 kernel/dma/coherent.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index ff5683a57f77126d..3b2bdca9f1d4b027 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -330,7 +330,8 @@ int dma_init_global_coherent(phys_addr_t phys_addr, size_t size)
 #include <linux/of_reserved_mem.h>
 
 #ifdef CONFIG_DMA_GLOBAL_POOL
-static struct reserved_mem *dma_reserved_default_memory __initdata;
+static phys_addr_t dma_reserved_default_memory_base __initdata;
+static phys_addr_t dma_reserved_default_memory_size __initdata;
 #endif
 
 static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
@@ -376,9 +377,10 @@ static int __init rmem_dma_setup(struct reserved_mem *rmem)
 
 #ifdef CONFIG_DMA_GLOBAL_POOL
 	if (of_get_flat_dt_prop(node, "linux,dma-default", NULL)) {
-		WARN(dma_reserved_default_memory,
+		WARN(dma_reserved_default_memory_size,
 		     "Reserved memory: region for default DMA coherent area is redefined\n");
-		dma_reserved_default_memory = rmem;
+		dma_reserved_default_memory_base = rmem->base;
+		dma_reserved_default_memory_size = rmem->size;
 	}
 #endif
 
@@ -391,10 +393,10 @@ static int __init rmem_dma_setup(struct reserved_mem *rmem)
 #ifdef CONFIG_DMA_GLOBAL_POOL
 static int __init dma_init_reserved_memory(void)
 {
-	if (!dma_reserved_default_memory)
+	if (!dma_reserved_default_memory_size)
 		return -ENOMEM;
-	return dma_init_global_coherent(dma_reserved_default_memory->base,
-					dma_reserved_default_memory->size);
+	return dma_init_global_coherent(dma_reserved_default_memory_base,
+					dma_reserved_default_memory_size);
 }
 core_initcall(dma_init_reserved_memory);
 #endif /* CONFIG_DMA_GLOBAL_POOL */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
