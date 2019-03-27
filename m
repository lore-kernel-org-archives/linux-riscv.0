Return-Path: <SRS0=wRFB=R6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6F9C10F00
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 696F621734
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2019 21:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QOwpRdSe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 696F621734
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=deltatee.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:MIME-Version:References:
	In-Reply-To:Message-Id:Date:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OjxdO5Oj/O3OgmVbrkyJuRojsNNTzH9+ijgVN1+Iaw=; b=QOwpRdSetaNshE
	e7YKghkCEaTQItJc/1o5lA94x7ch9UbF03rklAfQP/nhw86d1jLuknEo8Gf5ojf+koyeDXyI3Vxaq
	fxvvoqR1pfQq/HaERG6I5CT9FCVowQaibijcTE4ZQSjaA7f0xVM+InyiAlT7QoXpM3t6Q/TOgeGRd
	JHFjngqSVdVxl1Qs2ndhPtBNWXVMq8gECVTFbysesF9oLpALHFY5HE1r2JwY0YHMlA68SPapr4faJ
	mxTzTWyn36nu1blPqeEZO2Q6PVlP/stPzEAL8YiZiH+0dk6Al8cBs8/wN+yEKAjE5HghMufvYyVFb
	pM5eXe601PBxe8jm3djQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9GEL-0001MO-GG; Wed, 27 Mar 2019 21:37:05 +0000
Received: from ale.deltatee.com ([207.54.116.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9GEC-0001GR-OF
 for linux-riscv@lists.infradead.org; Wed, 27 Mar 2019 21:37:01 +0000
Received: from cgy1-donard.priv.deltatee.com ([172.16.1.31])
 by ale.deltatee.com with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE3-0006DJ-81; Wed, 27 Mar 2019 15:36:49 -0600
Received: from gunthorp by cgy1-donard.priv.deltatee.com with local (Exim 4.89)
 (envelope-from <gunthorp@deltatee.com>)
 id 1h9GE2-0006Ce-4j; Wed, 27 Mar 2019 15:36:46 -0600
From: Logan Gunthorpe <logang@deltatee.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Date: Wed, 27 Mar 2019 15:36:39 -0600
Message-Id: <20190327213643.23789-4-logang@deltatee.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327213643.23789-1-logang@deltatee.com>
References: <20190327213643.23789-1-logang@deltatee.com>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 172.16.1.31
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, sbates@raithlin.com, palmer@sifive.com,
 hch@lst.de, aou@eecs.berkeley.edu, logang@deltatee.com,
 antonynpavlov@gmail.com, sorear2@gmail.com, anup.patel@wdc.com
X-SA-Exim-Mail-From: gunthorp@deltatee.com
Subject: [PATCH 3/7] RISC-V: Rework kernel's virtual address space mapping
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190327_143657_383195_388FA0AF 
X-CRM114-Status: GOOD (  13.97  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Stefan O'Rear <sorear2@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Stephen Bates <sbates@raithlin.com>,
 Anup Patel <anup.patel@wdc.com>, Antony Pavlov <antonynpavlov@gmail.com>,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The motivation for this is to support P2P transactions. P2P requires
having struct pages for IO memory which means the linear mapping must
be able to cover all of the IO regions. Unfortunately with Sv39 we are
not able to cover all the IO regions available on existing hardware,
but we can do better than what we currently do (which only cover's
physical memory).

To this end, we restructure the kernel's virtual address space region.
We position the vmemmap at the beginning of the region (based on how
many virtual address bits we have) and the VMALLOC region comes
immediately after. The linear mapping then takes up the remaining space.
PAGE_OFFSET will need to be within the linear mapping but may not be
the start of the mapping seeing many machines don't have RAM at address
zero and we may still want to access lower addresses through the
linear mapping.

With these changes, on a 64-bit system the virtual memory map (with
sparsemem enabled) will be:

32-bit:

00000000 - 7fffffff   user space, different per mm (2G)
80000000 - 81ffffff   virtual memory map (32MB)
82000000 - bfffffff   vmalloc/ioremap space (1GB - 32MB)
c0000000 - ffffffff   direct mapping of all phys. memory (1GB)

64-bit, Sv39:

0000000000000000 - 0000003fffffffff  user space, different per mm (256GB)
hole caused by [38:63] sign extension
ffffffc000000000 - ffffffc0ffffffff  virtual memory map (4GB)
ffffffc100000000 - ffffffd0ffffffff  vmalloc/ioremap spac (64GB)
ffffffd100000000 - ffffffffffffffff  linear mapping of phys. space (188GB)

On the Sifive hardware this allows us to provide struct pages for
the lower I/O TileLink address ranges, the 32-bit and 34-bit DRAM areas
and 172GB of 240GB of the high I/O TileLink region. Once we progress to
Sv48 we should be able to cover all the available memory regions..

For the MAXPHYSMEM_2GB case, the physical memory must be in the highest
2GB of address space, so we cannot cover the any of the I/O regions
that are higher than it but we do cover the lower I/O TileLink range.

Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Antony Pavlov <antonynpavlov@gmail.com>
Cc: "Stefan O'Rear" <sorear2@gmail.com>
Cc: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/Kconfig               |  2 +-
 arch/riscv/include/asm/page.h    |  2 --
 arch/riscv/include/asm/pgtable.h | 27 ++++++++++++++++++---------
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 76fc340ae38e..d21e6a12e8b6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -71,7 +71,7 @@ config PAGE_OFFSET
 	hex
 	default 0xC0000000 if 32BIT && MAXPHYSMEM_2GB
 	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
-	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
+	default 0xffffffd200000000 if 64BIT && MAXPHYSMEM_128GB
 
 config ARCH_FLATMEM_ENABLE
 	def_bool y
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 2a546a52f02a..fa0b8058a246 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -31,8 +31,6 @@
  */
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 
-#define KERN_VIRT_SIZE (-PAGE_OFFSET)
-
 #ifndef __ASSEMBLY__
 
 #define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5a9fea00ba09..2a5070540996 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -89,22 +89,31 @@ extern pgd_t swapper_pg_dir[];
 #define __S110	PAGE_SHARED_EXEC
 #define __S111	PAGE_SHARED_EXEC
 
-#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
-#define VMALLOC_END      (PAGE_OFFSET - 1)
-#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
+#define KERN_SPACE_START	(-1UL << (CONFIG_VA_BITS - 1))
 
 /*
  * Roughly size the vmemmap space to be large enough to fit enough
  * struct pages to map half the virtual address space. Then
  * position vmemmap directly below the VMALLOC region.
  */
-#define VMEMMAP_SHIFT \
-	(CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
-#define VMEMMAP_SIZE	(1UL << VMEMMAP_SHIFT)
-#define VMEMMAP_END	(VMALLOC_START - 1)
-#define VMEMMAP_START	(VMALLOC_START - VMEMMAP_SIZE)
-
+#ifdef CONFIG_SPARSEMEM
+#define VMEMMAP_SIZE	(UL(1) << (CONFIG_VA_BITS - PAGE_SHIFT - 1 + \
+				   STRUCT_PAGE_MAX_SHIFT))
+#define VMEMMAP_START	(KERN_SPACE_START)
+#define VMEMMAP_END	(VMEMMAP_START + VMEMMAP_SIZE - 1)
 #define vmemmap		((struct page *)VMEMMAP_START)
+#else
+#define VMEMMAP_END	KERN_SPACE_START
+#endif
+
+#ifdef CONFIG_32BIT
+#define VMALLOC_SIZE	((1UL << 30) - VMEMMAP_SIZE)
+#else
+#define VMALLOC_SIZE	(64UL << 30)
+#endif
+
+#define VMALLOC_START	(VMEMMAP_END + 1)
+#define VMALLOC_END	(VMALLOC_START + VMALLOC_SIZE - 1)
 
 /*
  * ZERO_PAGE is a global shared page that is always zero,
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
