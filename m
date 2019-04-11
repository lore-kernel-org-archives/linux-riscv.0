Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56599C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25AC52073F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fs/VkvoO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25AC52073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QFlPu2AdsGCv2a/K/DpV0IeZ1CuZrHp2OF+PT1A2EBQ=; b=Fs/VkvoOewt8bY
	PnCVhWwOJ8jNaAz6leGfkvuuGG4M5zbZBC8zNJE/0zBbIopmNlKS4xhgpj6T0BPasonqq+Tixq95J
	O/D6bmxAzdWjDw3Y79AM0qD/Y9elhHXbxShJBndEug/1A2upZX60STeg0OFM/vFUhbiCSRtpL98Z/
	O19Fvt1UQerE+BR4aem9T54xTrLpStHyV3BLyJlM3wczkkQC4jg63DUlHlwLL9b5NB1GV9BBIuE7T
	bTLYt4p2px4o4f7O7zvL0UHcfbfkLDEh1G7w4troXuVVxIB2vBFaTfNu1soF4TRSgEUcFmtZ8MrbW
	xZ63lwwQi6z8kJ8GZc7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEYKF-000165-4L; Thu, 11 Apr 2019 11:57:03 +0000
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEYKE-00013j-2w; Thu, 11 Apr 2019 11:57:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 6/9] riscv: also clear all pending interrupts when booting
Date: Thu, 11 Apr 2019 13:56:20 +0200
Message-Id: <20190411115623.5749-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411115623.5749-1-hch@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
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
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Just in case an old interrupt is pending make sure we clear everything
asserted before this kernel started.  Based on similar M-mode code in
opensbi.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/head.S | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 9344d9ceda24..62d2c9c85433 100644
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
