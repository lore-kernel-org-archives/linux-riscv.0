Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF05C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 15:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=91x7ZAahiEdCNcdHO5qBr5D/btJ/Bo3e3sPcqRxkqjo=; b=Psc/1mBZEcpt3Z
	a50oWyjgR6CF2xmTw+6/iEMsJRoUZ1+nSgAbBP5iYycUWeC7TQsM7RYZOne5NZgrrFvAmbzoL1Mza
	8VTKCXyBc+NXIzNUHBpMSLVRdphzkM/2THfdGcJ7/TICjsx122KDqZ9yczxsysw4NEbvB2jGp75H8
	BHHOEAzuDZZ2oIepvWuSovh6/TmxFgsRQ+FGEkFc6Ir14ro63duZIzP4FNTsl57DQQO2hrICc/h/r
	IihEzemeSNP49n5FsREorw3jfuIkYmoX6jIhEFNcupIwY3STaPisZFEDMXtWZI00MvvvsY+uQgopq
	X8LrdSSwGeT8CVoVChcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAZRd-00CAcE-NW; Thu, 20 Jan 2022 15:33:49 +0000
Received: from mail-108-mta2.mxroute.com ([136.175.108.2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAZRb-00CAax-7B
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 15:33:48 +0000
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta2.mxroute.com (ZoneMTA) with ESMTPSA id 17e781f48d9000bdf2.002
 for <linux-riscv@lists.infradead.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Thu, 20 Jan 2022 15:33:43 +0000
X-Zone-Loop: da9a5bdf11e6da5cbd9da3cf73ec378f9e4525a65506
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f5DSyw8Jktl2OVLrktO0AZ8z+S3qRtxlhEygciHsFM0=; b=vwaGUQdtU23VDN98+q07TkVvD6
 Xn85oBlpqKE6QsPksa1RTtD1jnxOZLJKpkkPFXw0cKyVly2WUOs5u5CvsQlXG8IGVJAx5dwgOBpXY
 ccFSGtMWfZqWvqDqe6ulPzihLeVzttDlZaEUuyeUTXenVjHh/99GOha1kiLJ06QWsuSiG+X/bp8O9
 c1+6Upspv6NquhPdZmjFfUE62qBrHKV8T9eiSak9iiYPyx/j/XpU6xXO28wHtI9I5HwG1Tjuurgok
 WCUYLLkS/tZqTELl3mMtZ3tjNC4LpdBXv58vejcOEfKKrygaR+nXGfz21R/hrX+qZP/u0k24tbAn1
 xPR+uqug==;
From: Myrtle Shah <gatecat@ds0.me>
To: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] riscv/mm: Add some missing XIP_FIXUPs
Date: Thu, 20 Jan 2022 15:33:38 +0000
Message-Id: <20220120153338.4093003-3-gatecat@ds0.me>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120153338.4093003-1-gatecat@ds0.me>
References: <20220120153338.4093003-1-gatecat@ds0.me>
MIME-Version: 1.0
X-AuthUser: dave@ds0.me
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=5, required=15, tests=[ARC_NA=0,
 MID_CONTAINS_FROM=1, FROM_HAS_DN=0, RCPT_COUNT_THREE=0,
 R_MISSING_CHARSET=2.5, RCVD_COUNT_ZERO=0, FROM_EQ_ENVFROM=0, MIME_TRACE=0,
 BROKEN_CONTENT_TYPE=1.5, TO_DN_NONE=0, NEURAL_SPAM=0]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_073347_406298_13B7060D 
X-CRM114-Status: UNSURE (   6.32  )
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

Signed-off-by: Myrtle Shah <gatecat@ds0.me>
---
 arch/riscv/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0624c68331d8..eeafefd1c2b3 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -41,6 +41,7 @@ phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
 #ifdef CONFIG_XIP_KERNEL
+#define phys_ram_base  (*(phys_addr_t *)XIP_FIXUP(&phys_ram_base))
 extern char _xiprom[], _exiprom[], __data_loc;
 #endif
 
@@ -248,6 +249,7 @@ pgd_t early_pg_dir[PTRS_PER_PGD] __initdata __aligned(PAGE_SIZE);
 static pmd_t __maybe_unused early_dtb_pmd[PTRS_PER_PMD] __initdata __aligned(PAGE_SIZE);
 
 #ifdef CONFIG_XIP_KERNEL
+#define riscv_pfn_base         (*(unsigned long  *)XIP_FIXUP(&riscv_pfn_base))
 #define trampoline_pg_dir      ((pgd_t *)XIP_FIXUP(trampoline_pg_dir))
 #define fixmap_pte             ((pte_t *)XIP_FIXUP(fixmap_pte))
 #define early_pg_dir           ((pgd_t *)XIP_FIXUP(early_pg_dir))
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
