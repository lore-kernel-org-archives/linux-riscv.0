Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9476FC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:56:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65FA32073F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:56:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kH1JKeu7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65FA32073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoOzYkk/467w8gY4dCHBtPdeSmqGFc/HJZ8Ky6anvMA=; b=kH1JKeu7zXPOxS
	lwuW5me9jcbi9AuGDLwTtzId/6HJdUsvoM2z+fu3AdQ6gpY2EKwG+v+wEl0ld2H0t4+vPwGR5v7Du
	66HWIpv3m50UfMsYgG5xNFVH8gvSB3rKvpZzlJ5ZIyX92SjyLscXuEIlQcLP+b7zIVYu2UsIFuyA4
	2B2adZqrqIOIbgvV9z+7iT+c7XRshYp9cBW5wapfXiZ1Gh6ltCDlNswgq0O2utVBZNtunUQehc/7A
	9s3EOQzSRsJawMMlvs2h2KcxV461DBKOQrGDPWUjvO/UsLiZSP44kXS3g42n/+hW9xVzgyj9KnupX
	orLlW8US3L+i5IZQVyTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEYK5-0000wb-Kp; Thu, 11 Apr 2019 11:56:53 +0000
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEYK3-0000rf-LA; Thu, 11 Apr 2019 11:56:52 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 2/9] riscv: remove dead big endian code
Date: Thu, 11 Apr 2019 13:56:16 +0200
Message-Id: <20190411115623.5749-3-hch@lst.de>
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

RISC-V is always little endian.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/uaccess.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index cc5b253d4c57..5c50ed6f8c93 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -99,15 +99,8 @@ static inline int __access_ok(unsigned long addr, unsigned long size)
  * on our cache or tlb entries.
  */
 
-#if defined(__LITTLE_ENDIAN)
-#define __MSW	1
 #define __LSW	0
-#elif defined(__BIG_ENDIAN)
-#define __MSW	0
-#define	__LSW	1
-#else
-#error "Unknown endianness"
-#endif
+#define __MSW	1
 
 /*
  * The "__xxx" versions of the user access functions do not verify the address
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
