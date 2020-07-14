Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5391C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:01:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7566C21D79
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tlRo/PNg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Kz01khxc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7566C21D79
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8eazZ9IlByl/wlZHAVD2+bz5/EDsHc3pbpVL59MH5Os=; b=tlRo/PNgcNcbFAWfgjRqbIV1F
	8A7l4k9dwPj7POqSQ4Hg3B6QwPzIvC96Nf+7GNSYg45nnL0uTTIAf9rA08QDr0RdQi+QnfVQIzRSg
	vzVCSTHhUet6aX5IhXxEDYUE2+qNWGV1Ym32ZkvIJvYkOq74/AS73J/zzoOErkWc6mkg5/712j/qM
	EvL1D2IDT60KN0QkaFrwkKBv115A6yH1kmh/GMD5HCNamlXoP4B++SZIzBPpSPJJityuOIogFuTiM
	R8S84Kcj9EGD/dMcqFgEPWyLk0oJIM9brIFVGbPNAn8i6WMOHxRnZ5wJCkGOHeM8Yd74wVOXqqgtI
	tfrl0dmAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvIgw-0001Mh-OB; Tue, 14 Jul 2020 11:01:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvIgu-0001MD-Vs
 for linux-riscv@merlin.infradead.org; Tue, 14 Jul 2020 11:01:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=dLJ+rswlwOb9VgarkBahNyYojmAUY/xiMFDZ6ppJYq8=; b=Kz01khxc0JwwuZnVk8sIru0ipf
 o0d8wJyabxrEX2NNseTwAW9ee/TD6/cNvWILaL6Jyr1x1fwztZHD9HGX1/nF+lhj0I6J+4Zy/pBs5
 zy3/VlfHrn2a9R29W3rU/ZDeSZekvc+Jc2XJi/KpH4Zq2CqAwUQSXrvalLeS33yo5y1ufgkkEV6gj
 iiCgi4O4JciPs8Kxjg6z5bGsJx8WVKqosaMuX36dAliAyMFuCTSFZ4mAy0FK+MZHBJH1Iti6GRTlu
 7G+lR2TYNLx5MMBH58KjINfHWfuicHp3DvETkmodt5HAUCdYFiM51FXMNYNUGiXUsO6AVoEhOxoM6
 bzBJcIdA==;
Received: from 089144201169.atnat0010.highway.a1.net ([89.144.201.169]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvIgt-00065C-BH; Tue, 14 Jul 2020 11:01:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 2/6] nds32: use uaccess_kernel in show_regs
Date: Tue, 14 Jul 2020 12:55:01 +0200
Message-Id: <20200714105505.935079-3-hch@lst.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200714105505.935079-1-hch@lst.de>
References: <20200714105505.935079-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Use the uaccess_kernel helper instead of duplicating it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Greentime Hu <green.hu@gmail.com>
---
 arch/nds32/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
index 9712fd474f2ca3..f06265949ec28b 100644
--- a/arch/nds32/kernel/process.c
+++ b/arch/nds32/kernel/process.c
@@ -121,7 +121,7 @@ void show_regs(struct pt_regs *regs)
 		regs->uregs[3], regs->uregs[2], regs->uregs[1], regs->uregs[0]);
 	pr_info("  IRQs o%s  Segment %s\n",
 		interrupts_enabled(regs) ? "n" : "ff",
-		segment_eq(get_fs(), KERNEL_DS)? "kernel" : "user");
+		uaccess_kernel() ? "kernel" : "user");
 }
 
 EXPORT_SYMBOL(show_regs);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
