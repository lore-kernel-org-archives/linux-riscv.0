Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42238CCA471
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 09:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8KkpXiO2JRP1Yi+Ny6ILdANAqsbrGwrG6lOg9bD1GHk=; b=aXWn85Gygqh8xD
	5O2TK4h2dZeul7hLl5FvJpzE9SICAl6VV9OnRdiEWbaKLs0egmDyWaPAIHhkqdY13f4EM2x7Lnlqg
	TifjkyqD/kfF1AdfCbRmgl/zC76Hb93tKXccS/+GkOZCBsqRi1GpuydEtgZcMxscfUp6MChwhgtQW
	kvw1VErvBVX/rR5G3z5HffbETsb6nBr+yl/BvvQEv74netyVFMiOdifQtDW+y8LNVADRY4KGWiGG+
	fRt2AeOQJPPhGNF/b5uJfWG2NDfmYqQjQakKIqpo+8D16GS2Zfpoyk5Tr3LNgLbMgZnLU004le9zW
	0SSlPr4RtSDwsHeB0sPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hfc-0000000HFjS-2wDc;
	Mon, 06 Oct 2025 09:38:16 +0000
Received: from zulu.geekplace.eu ([5.45.100.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5hfZ-0000000HFis-2Gjt
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 09:38:15 +0000
Received: from neo-pc.sch (unknown [IPv6:2001:4091:a241:81e7:34fb:50ff:feac:591b])
	by zulu.geekplace.eu (Postfix) with ESMTPA id 6C1A44A00BC;
	Mon,  6 Oct 2025 11:38:05 +0200 (CEST)
From: Florian Schmaus <flo@geekplace.eu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Florian Schmaus <flo@geekplace.eu>
Subject: [PATCH] riscv: entry: fix typo in comment 'instruciton' -> 'instruction'
Date: Mon,  6 Oct 2025 11:37:42 +0200
Message-ID: <20251006093742.53925-1-flo@geekplace.eu>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_023813_718382_37A87D0E 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Florian Schmaus <flo@geekplace.eu>
---
 arch/riscv/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index d3d92a4becc7..9b9dec6893b8 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -455,7 +455,7 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_trap_ecall_s
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_trap_ecall_m
-	/* instruciton page fault */
+	/* instruction page fault */
 	ALT_PAGE_FAULT(RISCV_PTR do_page_fault)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
-- 
2.49.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
