Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6084DC27C53
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 20:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9YLO5Q0AAtYjhgI8SB6olIUTtSgAMq1ffq5qZYbbJM=; b=BAZ+5TbyQDmyEI
	JnWc2GLPx/EenpMA+wDfMuC1CQRspXFBxUTvTlDiZz1rNSiRVUDyZIPaZ2Sj2Vm8DV6csmq8LzI9j
	cV/n4+cLrvBst1zBNgXMLYqtWX80T74GNA6jhBobsp3jpBn26ZX5QZ7tEUadIk8smfiKlDLpvpp09
	2lA9E0uOxHboS5FE8dtduOVrzoBC9O3KJv2a4FoCIvyZnWNa/gyNAm6FpiIgJoyreTKyFkh8iZ7/s
	Je/wxeXVNvaby/hzbaw7mD1spTQcp9i/bEz7sC2DL2hHiFlLDDvpzBkFcCjA22veqf2EVaCg9aGZJ
	JWPz8pMyQe56Y0WJ7ZEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6d-0000000FVXh-0BOS;
	Fri, 07 Jun 2024 20:22:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6Q-0000000FVRq-1amR
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:22:33 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4FmsaK4U8owu4NlSDzmS6G8DVihDPJxkQgSL8xnqno=;
	b=jV4r27iONhJVERHB641eznAaftrwZ3nE682uV9gC1aGX3evxbgEtI3+I/GGIFZOgjpwiHX
	jrivhNjIULLbcTEF1ebUWj0KfocGBOpUnJ089SgjLwdKHrT3YqY/Eg0SXgoahKrD73OQPD
	GIPo3UKx7rqQ8OQfdvFUdf7X8OHayoEhJvPcmX6BDOlSxCWNVz6CkE8p3Fk92DtWshTiPF
	dt03h8kY0i0/VeSoJX638ThLxRh0Z3R5ck0NRVVs8N5T4i5pkp03gk2RhX4GYCP2ODf4pk
	b/rBf/p5UzcV/U6PLxXYHL0ZFnOUVb7oknY6vFnqE2fmMzHNT9Mjn98ZwcXy8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y4FmsaK4U8owu4NlSDzmS6G8DVihDPJxkQgSL8xnqno=;
	b=qenheITowqvS4kQkmh3FtMet7WUSPFv4Sdzt965PbpQbng2mrMAKUNPxeXEZyrFEa0dnT6
	byAMvr7yCjRM4vBg==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] riscv: drop the use of XIP_OFFSET in create_kernel_page_table()
Date: Fri,  7 Jun 2024 22:22:12 +0200
Message-Id: <4ea3f222a7eb9f91c04b155ff2e4d3ef19158acc.1717789719.git.namcao@linutronix.de>
In-Reply-To: <cover.1717789719.git.namcao@linutronix.de>
References: <cover.1717789719.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_132222_779928_0F90F99F 
X-CRM114-Status: GOOD (  10.66  )
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

XIP_OFFSET is the hard-coded offset of writable data section within the
kernel.

By hard-coding this value, the read-only section of the kernel (which is
placed before the writable data section) is restricted in size.

As a preparation to remove this hard-coded value entirely, stop using
XIP_OFFSET in create_kernel_page_table(). Instead use _sdata and _start to
do the same thing.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 313459329d16..b7b6affd4b79 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -911,7 +911,7 @@ static void __init relocate_kernel(void)
 static void __init create_kernel_page_table(pgd_t *pgdir,
 					    __always_unused bool early)
 {
-	uintptr_t va, end_va;
+	uintptr_t va, start_va, end_va;
 
 	/* Map the flash resident part */
 	end_va = kernel_map.virt_addr + kernel_map.xiprom_sz;
@@ -921,10 +921,11 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
 				   PMD_SIZE, PAGE_KERNEL_EXEC);
 
 	/* Map the data in RAM */
+	start_va = kernel_map.virt_addr + (uintptr_t)&_sdata - (uintptr_t)&_start;
 	end_va = kernel_map.virt_addr + kernel_map.size;
-	for (va = kernel_map.virt_addr + XIP_OFFSET; va < end_va; va += PMD_SIZE)
+	for (va = start_va; va < end_va; va += PMD_SIZE)
 		create_pgd_mapping(pgdir, va,
-				   kernel_map.phys_addr + (va - (kernel_map.virt_addr + XIP_OFFSET)),
+				   kernel_map.phys_addr + (va - start_va),
 				   PMD_SIZE, PAGE_KERNEL);
 }
 #else
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
