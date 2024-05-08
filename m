Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD4BC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 19:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yz0w5jfuf4Zd9fOqTInOd9dhd4qdncMleBmzlR1YrLY=; b=K9eOexgwsL/gla
	yfUc9iYsWvXn9uG/B+Pgoxsuzv6QbWcsHSiRn7ViVdUpRDZL1jc+Fd8vsLiiHLFccPYPQCwA4X+gP
	jbBHOV0iKRKNDQLP+RlnbG9K5DmzK7stW37w375+TgCNFcSrQ8jqR2eKsHgQgpZuhtYyaagGIQ9z1
	he5J79gwO9T85hgrFYWroPEw72ZbPcoAjRG6DRBrAe2ie83UZtEBeFQBe/kWFwxDclhytjJUIQuuE
	sLppmQzWknBeJN5PORRzDnzHDEbw9q/rqVjDaPKX10XJq3upY53hf7tx/aIOfatC1IKiVRrOPIPUD
	tgzw9IU6My1L0USkn8Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mp3-0000000Ggmh-2dGp;
	Wed, 08 May 2024 19:19:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mox-0000000GglI-1MhD
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:19:23 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715195957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=srojUdq0elW15+CVwv4RHuTpXX7dRNIqURJ4CkMJfK8=;
	b=RdRsqh5t54KsP2O/M/jU5HwPIYVQgwv9Lrd1q7l+fUO/k/kOYFLD7edShEwYjVNq/tmZuR
	9U6BLoFBM4ik7aTRJY7D6wgRfzkYLLKRV6mJl18dIVgjzdM7uhbAFBCq2MB+b7G6sjD9Gx
	J0QEfG+I9+aDwZmY9bgqCbjOijKxxSJ8A8RDsb9hgBrV6MxMZy/OPdnaN2KcmFa3W8tGYm
	2lxSLDdpT+2YABzBdaOEBzpDGYD/nQGvNMUCBSHKMP03ensFCfb+G3qiei0U2HfyGyOi3d
	VhWGGiACW1TkjGM0YE5f0hkOTbHyuJrxyBSV8K7iIcG1+E0hC1aNygxXrMDvgw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715195957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=srojUdq0elW15+CVwv4RHuTpXX7dRNIqURJ4CkMJfK8=;
	b=YH3r0xnKW3fJM7laX2dVyK2t3LjsPZTX01UAP3Vp4CIn9yQvWI/UYsmmM0snI1K2U18uDZ
	TPsOZUNmGVOac4BA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: change XIP's kernel_map.size to be size of the entire kernel
Date: Wed,  8 May 2024 21:19:17 +0200
Message-Id: <20240508191917.2892064-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_121919_526726_1D2E715A 
X-CRM114-Status: GOOD (  12.53  )
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

With XIP kernel, kernel_map.size is set to be only the size of data part of
the kernel. This is inconsistent with "normal" kernel, who sets it to be
the size of the entire kernel.

More importantly, XIP kernel fails to boot if CONFIG_DEBUG_VIRTUAL is
enabled, because there are checks on virtual addresses with the assumption
that kernel_map.size is the size of the entire kernel (these checks are in
arch/riscv/mm/physaddr.c).

Change XIP's kernel_map.size to be the size of the entire kernel.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: <stable@vger.kernel.org> # v6.1+
---
I wouldn't consider this inconsistency to be a bug. It only became a
a problem after kernel_map.size is used to check virtual addresses in
5f763b3b5960 ("riscv: Fix DEBUG_VIRTUAL false warnings"). So I will only
backport this to stable versions that contain this commit: v6.1+

 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c081e7d349b1..0c0562839899 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -903,7 +903,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
 				   PMD_SIZE, PAGE_KERNEL_EXEC);
 
 	/* Map the data in RAM */
-	end_va = kernel_map.virt_addr + XIP_OFFSET + kernel_map.size;
+	end_va = kernel_map.virt_addr + kernel_map.size;
 	for (va = kernel_map.virt_addr + XIP_OFFSET; va < end_va; va += PMD_SIZE)
 		create_pgd_mapping(pgdir, va,
 				   kernel_map.phys_addr + (va - (kernel_map.virt_addr + XIP_OFFSET)),
@@ -1072,7 +1072,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 	phys_ram_base = CONFIG_PHYS_RAM_BASE;
 	kernel_map.phys_addr = (uintptr_t)CONFIG_PHYS_RAM_BASE;
-	kernel_map.size = (uintptr_t)(&_end) - (uintptr_t)(&_sdata);
+	kernel_map.size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
 
 	kernel_map.va_kernel_xip_pa_offset = kernel_map.virt_addr - kernel_map.xiprom;
 #else
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
