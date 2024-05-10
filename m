Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFC3C25B4F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 06:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l5TfneRAVofcXKiDFrKf8BK4HL6M768tk6c0e90bsHE=; b=OLEz3fVF1JZMnE
	bcar/n2LrSy42ih5xPSX2v3vicR80gTW4KaQtLrWcM/MBZQEnQ57Q2ZFwRMzth5gNMdjHJ6Z/Vijm
	Zna9WdOEGNuUFuXHfUd/EdU09nNof8+TviwdPqfGCVTZsc7XiEmdg8B428if4Ob7aHwFJbLbCkbiG
	YSRDlvq5KwWR1qiAK9WD9yueZRR8weHpz6o8b3iWXwNjvjlygyOhgdzMuQ6XJ5SaSVNk4VUZ7DTf/
	CII6olGne4Vq/qTZ9WdxAJvKGculfeicY39CYBQCWuH/OoObex1zG/OkJK+mabFVp0HWckIJMLLK9
	P+8ODX1iW0y/6LmT/7wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5JlG-00000004DUS-2iQg;
	Fri, 10 May 2024 06:29:44 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Jkc-00000004DHR-2SNc
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 06:29:39 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klI6/ArsoUUqM1dHkfkXFimVv/Utnrzo9cziv0cncTY=;
	b=vUci3mxsVRkrS+PdrHpT4mSD+AuQXFTlpS/Cp66iSbOTbRw1Yc14DiTxc5OFSYWwCzZS9v
	xu3+PRzERyR5CVCZVS97bHq9ZPKUbTyU9xpMg1yVKEhJtw+3h5Nhs8kj73NIQ6JwpSEh6I
	TtEXrdkkrfSdVyylXSe8LrANkF3XeXG9jBtWvxAzIJI5Ohh7QWivHZTl1G/bVwF6d1tKAP
	gO3wacbTFb7dfqy9/vi/ogfBDWwywW3dFX8C7bG91S5Ggh8pE0G/kPcKwIH9OfyY3WIbrJ
	3KZLb0qX+Dw1l01Qh7jxAQSGB3j9qxyEVlwWEkhCNjQiG9cXTQr0FhAaXQ8hYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715322531;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=klI6/ArsoUUqM1dHkfkXFimVv/Utnrzo9cziv0cncTY=;
	b=E9NLekMt7HVvwSbWb2yg+E0ZsWU/PWXTBilGU3G5C04v2aon3LtmJ9VbZOToLP9+yDAYLF
	W0uNWoYSrn3DaqAA==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 6/7] riscv: drop the use of XIP_OFFSET in create_kernel_page_table()
Date: Fri, 10 May 2024 08:28:44 +0200
Message-Id: <8748eab99d76e466a44a0bb81d836ff1c9ad9879.1715286093.git.namcao@linutronix.de>
In-Reply-To: <cover.1715286093.git.namcao@linutronix.de>
References: <cover.1715286093.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_232912_144036_F3791398 
X-CRM114-Status: GOOD (  10.89  )
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
---
 arch/riscv/mm/init.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9846c6924509..62ff4aa2be96 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -907,7 +907,7 @@ static void __init relocate_kernel(void)
 static void __init create_kernel_page_table(pgd_t *pgdir,
 					    __always_unused bool early)
 {
-	uintptr_t va, end_va;
+	uintptr_t va, start_va, end_va;
 
 	/* Map the flash resident part */
 	end_va = kernel_map.virt_addr + kernel_map.xiprom_sz;
@@ -917,10 +917,11 @@ static void __init create_kernel_page_table(pgd_t *pgdir,
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
