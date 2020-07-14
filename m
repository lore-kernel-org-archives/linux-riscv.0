Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7305EC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:04:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43CA7207CD
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 11:04:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h6bMOGt4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OSM7z2Fk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43CA7207CD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4d+GTx0senHuExBGDUD5kzKfMZ+H539lpQ3yQayfC6M=; b=h6bMOGt4aP2oNy21gm4nQFV56
	KfD39nElREvJwkWUkbTnX9EiEIwsLOhjjZMny2UvIMJeYlioLXSxXx4Byna6p9MUZCSkpUs6brl/0
	Z8LPg0qeIizG51UqEiJuV1i0pICatRQ9iOAlGt3LSf9RGENdHoRRAKx7+0+SM14gDLG3mptbyJaya
	rlD7OXOeH5HkMO+Nt31SHNs8spnnLJY/7NTDbOj5VdxRYkMzUaLQtOjD8OEjyayuxVsvBSbUOiEmZ
	SIWNF1KABkj0UWwJM3p/30ruTdG90RQ6+gp1YfhCvLc9L1ecMJ2S+NInfA509UV2cHcRcDSLHU7nh
	uqm/OHYCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvIj5-0001a2-7W; Tue, 14 Jul 2020 11:03:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvIj2-0001Zm-Lo
 for linux-riscv@merlin.infradead.org; Tue, 14 Jul 2020 11:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=wO7HFuaPN2PyMlA7RlKTUtBx6uiRejKmUIauiPOSfj0=; b=OSM7z2FkP6QewfE+zQd32Z1KZs
 BFOZmnnBZ7z/1DApnT2fqXZYMia6JVDaAPU57gBg3Z7JSAYi7AOSp62k8IiTrOlQhKLE5qBjJBpjO
 CuHkmT3M/idtb1smuV+rFuSdAAjHnMPtR1FF2l1JlPxF3MbxJOlIRldz+CiHJ7y0nbhFw6489mFqo
 9y+HuQwsBQ53C6cHfxDiG+VK1XSoLo1b4EM5BtkFBoq6yt+wCdYAg4NVmknaO4zsyrZPliZpLbmyR
 7i/+PTU+mu9c7dK5zBZZQJX7gnicSDG/QxuBvnO7FUGoR/sc9rNgbA7kaMaw0vjuiF2w+aV+dDcVg
 l8d0oSQA==;
Received: from 089144201169.atnat0010.highway.a1.net ([89.144.201.169]
 helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvIj0-0006Al-CC; Tue, 14 Jul 2020 11:03:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH 3/6] riscv: include <asm/pgtable.h> in <asm/uaccess.h>
Date: Tue, 14 Jul 2020 12:55:02 +0200
Message-Id: <20200714105505.935079-4-hch@lst.de>
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

To ensure TASK_SIZE is defined for USER_DS.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/uaccess.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 8ce9d607b53dce..22de922d6ecb2f 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -8,6 +8,8 @@
 #ifndef _ASM_RISCV_UACCESS_H
 #define _ASM_RISCV_UACCESS_H
 
+#include <asm/pgtable.h>		/* for TASK_SIZE */
+
 /*
  * User space memory access functions
  */
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
