Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BECC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 19:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IZrD0emdQumCvA6DUTZBHpeOSxHj2H5qkTt3Vw2yFXo=; b=Z8V6ZwS4iwh7VJ
	Ob0eb9Mllhsx6qCcUet3x9j1x+DRKNrN5A3mNjM7km3k9/KyPf/c+I8M2zBSMjnHKj8j72tqRx+KO
	yatCmVZqPaollmnQXBUdOIDsJdyEZJRE724ANu3vSKensIYDFnMvQwGJSWrsNpewxRIEyEK5QlTSz
	W5YqKInb0B3DnTnnRBmTJuxkks2EEnEEveoLyrES1a7hlSmByKiR62CTtOWcU6tpo+75Va8NjrcQP
	m5RB0cxOlG8GGT/XEQ7FTGWZbebkGOKaTmfHhkfi65yDKxU7RToW3e8wiiO44VPmyGeqvFdwDAUXK
	6FDYLULCXfER61hc2QOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nksVL-00EzPH-10; Sat, 30 Apr 2022 19:11:43 +0000
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nksVI-00EzOO-7q
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 19:11:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IlwtJiGEzRBQNkXB4OYUXQhdmFsNAW7ggPHGnYRYMHQ=;
 b=eTRqWaybQCkDBQ4k7O03aG2w1jVL+sqyc88IA8KkGo65A9hpT59X1S13
 gYhLceNMvnNGnmgLw5uktM4CmW3DbBozI3/Je27DpfjD4IMO04MeGunZa
 YACpRm7rkaFEPiVnvhJFqBLTADNmqpcAElqZwOztYw+eRPfPNS0HtDLh6 M=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,188,1647298800"; d="scan'208";a="34084616"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2022 21:11:32 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>
Cc: kernel-janitors@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: fix typos in comments
Date: Sat, 30 Apr 2022 21:11:17 +0200
Message-Id: <20220430191122.8667-3-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_121140_587984_505C25CD 
X-CRM114-Status: GOOD (  13.50  )
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

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/riscv/kernel/module-sections.c |    2 +-
 arch/riscv/mm/context.c             |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index e264e59e596e..00e0700601b3 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -119,7 +119,7 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		return -ENOEXEC;
 	}
 
-	/* Calculate the maxinum number of entries */
+	/* Calculate the maximum number of entries */
 	for (i = 0; i < ehdr->e_shnum; i++) {
 		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
 		int num_rela = sechdrs[i].sh_size / sizeof(Elf_Rela);
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 7acbfbd14557..bc676b7a62e9 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -159,7 +159,7 @@ static void set_mm_asid(struct mm_struct *mm, unsigned int cpu)
 	 *
 	 * - We get a zero back from the cmpxchg and end up waiting on the
 	 *   lock. Taking the lock synchronises with the rollover and so
-	 *   we are forced to see the updated verion.
+	 *   we are forced to see the updated version.
 	 *
 	 * - We get a valid context back from the cmpxchg then we continue
 	 *   using old ASID because __flush_context() would have marked ASID
@@ -228,7 +228,7 @@ static int __init asids_init(void)
 	/*
 	 * In the process of determining number of ASID bits (above)
 	 * we polluted the TLB of current HART so let's do TLB flushed
-	 * to remove unwanted TLB enteries.
+	 * to remove unwanted TLB entries.
 	 */
 	local_flush_tlb_all();
 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
