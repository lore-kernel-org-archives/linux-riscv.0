Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A064C10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF8D02186A
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rrK30vJy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF8D02186A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22ctWyvFQxIPizdVNbF/iog6++HAnUgWUsg/gmsxVUk=; b=rrK30vJyx2aGx+
	r/d8OoLiubzzFZqveNblQraYCO3LIvyA3HHXlA7gsn8C/CkoedH1FSFyuYaTSGJHCPleKAh3p5D0q
	eBfLR4A7KoXAJ/fVgf14WTXCmlkxwTii5RQQ8h9aJMxC9mbVuXilbi8XcdpIinSOCksxsdjCEPHcS
	FczQazYu46pFsZxj0c50cDWVMH06Ao0uVsY20P4LKzT6HvI48SvDDBED+DAC78LfQj5Rc3Ph++GHb
	dt5XqZ2c0KyHce7Gesmv0nJfOGfk9DdSbnZc7GXLmusjI568ih+cExjCB4jYYboFZhN4Fh5PTGv4i
	rctJzDQk95Bl/gcdhzYw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExM4-0001MY-5s; Fri, 12 Apr 2019 14:40:36 +0000
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExLz-0001Gl-W2; Fri, 12 Apr 2019 14:40:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 07/12] riscv: cleanup the parse_dtb calling conventions
Date: Fri, 12 Apr 2019 16:39:43 +0200
Message-Id: <20190412143948.12478-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412143948.12478-1-hch@lst.de>
References: <20190412143948.12478-1-hch@lst.de>
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
