Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98020C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68A6B2073F
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E9S/naKh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68A6B2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22ctWyvFQxIPizdVNbF/iog6++HAnUgWUsg/gmsxVUk=; b=E9S/naKh+cefy1
	Ov9rqvAJQZlDHX2vb6l53PEggWZLK9Rpd3y/BgSpjl0eKfiEmuWzhLmtVh2AynIFduhOzwLXiBgQY
	Qy5S90DsKRCL6+1IltMRyiIBm9VGs4+E4og45EtW/8al9zCr2QRxrbRgg2iRF8ezrOrUQc+WIqpIj
	miAUqb06aMsL5DJseqBcFsD6mxY9+t22hCW/5qi8rOIbeiGyo+Ug7gnqiZrl38SotKthLbszEgmuO
	H7fmoS4FeBoyGU2x3Lfg//rDxl3kLLwRxfCvPwOrjy9RnfDiLszy8mLFeArPgeO+SJsE+La4xpP3A
	IfLSXNUyZL6wx8QuJB0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxi5-0006cT-FE; Mon, 15 Apr 2019 09:15:29 +0000
Received: from 213-225-15-255.nat.highway.a1.net ([213.225.15.255]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxi3-0006ZQ-KD; Mon, 15 Apr 2019 09:15:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 07/11] riscv: cleanup the parse_dtb calling conventions
Date: Mon, 15 Apr 2019 11:14:38 +0200
Message-Id: <20190415091442.19945-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190415091442.19945-1-hch@lst.de>
References: <20190415091442.19945-1-hch@lst.de>
MIME-Version: 1.0
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

No need to pass the hartid, and the dtb address passed is a physical
address, so don't pretend it is a kernel pointer.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/head.S  | 3 +--
 arch/riscv/kernel/setup.c | 6 ++++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 62d2c9c85433..478821d31bb3 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -72,8 +72,7 @@ clear_bss_done:
 	la sp, init_thread_union + THREAD_SIZE
 
 	/* Start the kernel */
-	mv a0, s0
-	mv a1, s1
+	mv a0, s1
 	call parse_dtb
 	tail start_kernel
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 540a331d1376..d93bcce004e3 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -52,9 +52,11 @@ struct screen_info screen_info = {
 atomic_t hart_lottery;
 unsigned long boot_cpu_hartid;
 
-void __init parse_dtb(unsigned int hartid, void *dtb)
+void __init parse_dtb(phys_addr_t dtb_phys)
 {
-	if (early_init_dt_scan(__va(dtb)))
+	void *dtb = __va(dtb_phys);
+
+	if (early_init_dt_scan(dtb))
 		return;
 
 	pr_err("No DTB passed to the kernel\n");
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
