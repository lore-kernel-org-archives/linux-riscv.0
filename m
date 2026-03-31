Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01B3FF60DC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 07:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oOXTJizXaabFhJjzT0ljLM9kDRZGQ8Vf8DCXvnSRXvg=; b=lUeHmxgboWOfAh
	Ok1YaQtPMAvoINkECjlmxzCDWKwu5WXsApwdwqyYZ/n7Gnw2jCLegjUHPzUrX6taNkfuPvjl4S1ry
	u4OvtVPP+qftir0kIhQwMvSBSEx3WiuUsgrLForUKMqDM1CXSrXFCdtzcgJnpQS7X70hdYj7th7mD
	6fctFC4UiB878U5A2FYZ9IbUF4d9pBn/4G0enJQKRA3hNSRzWwojP3oNBCGZR2E+X/fTPXqAaAdsb
	c38KVKGlF8CHaFQu1FF4xO+IDhaQUvIYhvZ1n8s2JugR3CQep91I0H1PJxai/sp7Tce8+7fi+JSw1
	oo5OqjFkEjlFQMCs+GNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TgP-0000000CVfP-3YQy;
	Tue, 31 Mar 2026 07:38:41 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TgN-0000000CVb5-1tDW
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 07:38:41 +0000
X-QQ-mid: esmtpsz19t1774942646t6e163ae8
X-QQ-Originating-IP: Q/Na89Q0HHt78pSa6TqRPYIT8cZiPlVHrbHuOCa5Tic=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 15:37:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3642038880629496060
X-QQ-CSender: troy.mitchell@linux.spacemit.com
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Tue, 31 Mar 2026 15:37:22 +0800
Subject: [PATCH] riscv: mm: fix SWIOTLB initialization for systems with
 DRAM above 4GB
MIME-Version: 1.0
Message-Id: <20260331-fix-riscv-swiotlb-v1-1-74dd5e6be0f1@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAMAwEvyI5G2haUPAr4kFr1ICoNKJC8e8Gj
 8POTgblJKzQFBkSX6KybwZUFhCXfpsZZTQG73zlQiCc5MEkGi/UW/ZzHbCaKHpbaxoJ7HckNul
 vtt37fjvhsa1jAAAA
X-Change-ID: 20260331-fix-riscv-swiotlb-6f1c226071d1
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774942643; l=3258;
 i=troy.mitchell@linux.dev; s=20250710; h=from:subject:message-id;
 bh=6ZuTX0f3YV6I8YAyiul4MVicwk235H4X2B8dhvRPRwc=;
 b=4suTSPTBaFvbcZu+3/I6gopG6qkefydOjKtIoIvJ6gjVVXZgLsYXsF0jJphNtowj/N7zAW36l
 AJW/r02TwgiBPivNt2Oc1UpRBFGADWYH5mW7VDNBEoFl5wp2rh+X4mp
X-Developer-Key: i=troy.mitchell@linux.dev; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OcmVq9lZacab4O7UhSx3XAFvz2/B53ShmucFf6cD8pyDSk4Ij/iazmNz
	8NqiVNJ1LQU0dX1sVKHVEdloC19C8J7sXBF9Xl4PH6R4Qg9gN9sjnw9iJBHQkmiQyVpRhaY
	cvljdIcjI1gtv5MCxOIPuzQcu5bOfTIFYg6udYGCtnTEzv/lVCyfN+DgsfE17t6adtYYIN/
	Opee9hNy53TLtMs+TUQATGXET0W8ong5QIsWDgcpQl+8Yoefp/Ja5pg9+ijXjgQ9duSUiJw
	dTIsUy4P/CehIDCx+3M92XnC3Ljhl4GjFPECHPOm0V3mBIqEeWYbo+f5a2p4Uoi3eE8BVsj
	LvowW/cqS8TRPqFJN8ze995jI/SvoeLYvfppdJJCS8mLVDWYOa0k2JD12PrBNo4TNLhZ7e6
	kw+ShjqLIZ70/dlLzBIGvL8uTIZ16mc8qAVt21mhVECvIZaQrWyjxDGojafwA5wgPLWAY9r
	HjX0/uj7hP7oTFaJaa52iYUfdp08+Xy7s1n8Dz1QDlzmw8mNJib3uNm+H90RdgNa0ppJ8bl
	sEi8gyK5TVZmUagaXG1eZ1Kr/48qHfqUCXvkc9azQPcaG4S7feq2IXHw7P/d1T/0fbBkpuf
	JEWQxeEHyQR+xdXKtZP3fp1uKfcfawh+OXl4tNz3uRnsS9SDexCwn8P0TJa8c/EQOTYeXQ0
	Q3GHIB6UdTHY4th8E7zXVCIdVr/8fGetClh2KyOEvmc4pD+mEo6vkvY1W1gFmswFMvW9WPI
	XNxgSaeeH9Gyi3PH4Yqc0SI80+uEX40/6WwNrJDu1k+5KsHVK35jDi2n7zV+JP+YI2Md0RO
	QtK94W73b+tFuX280VrxkK1VXLB6M/7FXhU2mX1tJ4JoIIx7kiQGOr23rIjb6oTU/qApKSo
	vBcMCuhFNNTVwcx2d+eoDe7ctuEhbJAkN94IbZQ5VJUO6TkYT8ITd9MmdpThRkk0oTi45sz
	ztBaCd45h1ZR82dw5MJZ/Zky1wRRWGxNBoLp7fYLgYZGp9cKSbGmkDN2UhuTdk1n8mNiOzt
	gNVsvxS4JEstW3iVClXY/r/YOwzwPYdqtNp03l2+MsM9H7AbAXSUFgmGL6HD9I3WyxAplTZ
	nEHb2AhPKTD
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_003839_780874_929E318A 
X-CRM114-Status: GOOD (  13.24  )
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

On RISC-V platforms where the entire physical memory (DRAM) resides
above the 32-bit address space (i.e., above dma32_phys_limit), the
current SWIOTLB initialization logic fails.

This patch addresses two interconnected issues on such platforms:

1. Incorrect 32-bit DMA bounce assumption:
The existing condition `max_pfn > PFN_DOWN(dma32_phys_limit)` assumes
that a 32-bit DMA bounce buffer is required simply because the maximum
PFN exceeds the 32-bit limit. However, if all DRAM starts above 4GB,
no memory exists below the limit to satisfy this allocation. Fix
this by adding a check to ensure `memblock_start_of_DRAM()` is actually
below the 32-bit limit before enforcing 32-bit SWIOTLB.

2. kmalloc() bounce buffer allocation failure on non-coherent systems:
For non-coherent hardware, a bounce buffer is still mandatory for
cache-line-aligned kmalloc(), even if 32-bit DMA bouncing is skipped.
Without the `SWIOTLB_ANY` flag, swiotlb_init() defaults to allocating
from low memory, which fails completely when DRAM only exists in high
memory. By appending `SWIOTLB_ANY` to swiotlb_flags, the allocator is
permitted to allocate this alignment buffer from high memory.

With this patch, systems with non-coherent DMA and DRAM entirely above
4GB can successfully map the software IO TLB in high memory and boot
normally.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 arch/riscv/mm/init.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 811e03786c56..3244e4fba89c 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -168,7 +168,9 @@ static void print_vm_layout(void) { }
 
 void __init arch_mm_preinit(void)
 {
-	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit);
+	bool swiotlb = max_pfn > PFN_DOWN(dma32_phys_limit) &&
+		       memblock_start_of_DRAM() < dma32_phys_limit;
+	unsigned int swiotlb_flags = SWIOTLB_VERBOSE;
 #ifdef CONFIG_FLATMEM
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
@@ -176,17 +178,21 @@ void __init arch_mm_preinit(void)
 	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb &&
 	    dma_cache_alignment != 1) {
 		/*
-		 * If no bouncing needed for ZONE_DMA, allocate 1MB swiotlb
-		 * buffer per 1GB of RAM for kmalloc() bouncing on
-		 * non-coherent platforms.
+		 * No 32-bit DMA bouncing needed (either all DRAM is within
+		 * the 32-bit limit, or it all starts above it), but
+		 * non-coherent hardware still requires cache-line-aligned
+		 * bounce buffers for kmalloc().  Use SWIOTLB_ANY so that the
+		 * buffer can be allocated from high memory when DRAM starts
+		 * above dma32_phys_limit.  Allocate ~1 MB per 1 GB of RAM.
 		 */
 		unsigned long size =
 			DIV_ROUND_UP(memblock_phys_mem_size(), 1024);
 		swiotlb_adjust_size(min(swiotlb_size_or_default(), size));
 		swiotlb = true;
+		swiotlb_flags |= SWIOTLB_ANY;
 	}
 
-	swiotlb_init(swiotlb, SWIOTLB_VERBOSE);
+	swiotlb_init(swiotlb, swiotlb_flags);
 
 	print_vm_layout();
 }

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260331-fix-riscv-swiotlb-6f1c226071d1

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
