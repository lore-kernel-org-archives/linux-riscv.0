Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 175D5C10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D75F32084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nkt8gJgZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D75F32084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JelxpZ+qJx1X8sBlrUb3UyAntyHJMuzQpKZa3FIuVpw=; b=nkt8gJgZSWHUAv
	QFo14YMIUtbjkUoSIdWjSXKRIsdfI1tzlIrjkjgOdZ4FiqS9ej5mvmftFZtOsEObM81T3pqtfO00G
	sSlhNwwhTMdVPOKT8bedwQ5nqd/MckFZ2nPg/Q4ww45YKe9L53A1odBfI6PZWPBI/d3gF0iiGUVbD
	mECgEV4KKAwaAGKvsRo3e/U5xg79X7Sbq4+b8HM63ZKYVW1q1XkWEC69H2VRXWeN4xRAUwSf5cIks
	G9l/rirLwEsnmJUb42mtUFumMgiy06Y3EzlbMUH2hWUMrmV0rYaHl2/uEVypV5uCGDNHCbDWq9rdr
	toOPbKY1NM1x/mrexc8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExLy-0001Go-EY; Fri, 12 Apr 2019 14:40:30 +0000
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExLu-0001BQ-EL; Fri, 12 Apr 2019 14:40:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 05/12] riscv: clear all pending interrupts when booting
Date: Fri, 12 Apr 2019 16:39:41 +0200
Message-Id: <20190412143948.12478-6-hch@lst.de>
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

Just in case an old interrupt is pending make sure we clear everything
asserted before this kernel started.  Based on similar M-mode code in
opensbi.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Nick Kossifidis <mick@ics.forth.gr>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/head.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fe884cd69abd..9e3840d84d3e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -22,8 +22,9 @@
 
 __INIT
 ENTRY(_start)
-	/* Mask all interrupts */
+	/* Mask and clear all interrupts */
 	csrw sie, zero
+	csrw sip, zero
 
 	/* Load the global pointer */
 .option push
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
