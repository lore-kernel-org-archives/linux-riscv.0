Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DCDC282C2
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:40:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE4A72175B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 17:40:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FSxPQb+J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE4A72175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xylgc93YQNTAE57LQ9MpCZb8O/aNReFpiwF8DX6uaU=; b=FSxPQb+JuAjcx1
	3gMlnIiGJLf2LmQVX9EGOGD7qNP0D0mqXD79wWMOmuQhXVDARZ+bijP9pE8wfrZb1uBucjWZK6YWB
	8ZxOgfxXsByFVmyLWCP09z3SQM34AjE9IA2BGC/F4BFiniAuzNttWZZbcFmaviyek/7jB538WbKi1
	hCmvYUVoMC+lnrYfrACNjQge+VQTrpgY4KkYYZRO4Dqn7931uBR49TFRjnZ3OgZ2kkpEgQaym6yxU
	agVxCCOJqAb8VJlzCgseNA3RFMApBLCgfsmDEU3Ppi+hoSIKm/CqVvy7xGqnWIJb2PkQBnWmAIva1
	lNdx3T0NHhn5RTqPx1jA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtyWC-0008A7-3a; Wed, 13 Feb 2019 17:40:20 +0000
Received: from 089144210182.atnat0019.highway.a1.net ([89.144.210.182]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtyWA-00087z-1M; Wed, 13 Feb 2019 17:40:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 01/11] powerpc: remove dead ifdefs in <asm/checksum.h>
Date: Wed, 13 Feb 2019 18:39:55 +0100
Message-Id: <20190213174005.28785-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190213174005.28785-1-hch@lst.de>
References: <20190213174005.28785-1-hch@lst.de>
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
Cc: linux-xtensa@linux-xtensa.org, linux-s390@vger.kernel.org,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

__KERNEL__ is never not defined for non-uapi headers, and GENERIC_CSUM
isn't ever set for powerpc either.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/powerpc/include/asm/checksum.h | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/checksum.h b/arch/powerpc/include/asm/checksum.h
index a78a57e5058d..37c309500260 100644
--- a/arch/powerpc/include/asm/checksum.h
+++ b/arch/powerpc/include/asm/checksum.h
@@ -1,6 +1,5 @@
 #ifndef _ASM_POWERPC_CHECKSUM_H
 #define _ASM_POWERPC_CHECKSUM_H
-#ifdef __KERNEL__
 
 /*
  * This program is free software; you can redistribute it and/or
@@ -9,9 +8,6 @@
  * 2 of the License, or (at your option) any later version.
  */
 
-#ifdef CONFIG_GENERIC_CSUM
-#include <asm-generic/checksum.h>
-#else
 #include <linux/bitops.h>
 #include <linux/in6.h>
 /*
@@ -217,6 +213,4 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 			const struct in6_addr *daddr,
 			__u32 len, __u8 proto, __wsum sum);
 
-#endif
-#endif /* __KERNEL__ */
-#endif
+#endif /* _ASM_POWERPC_CHECKSUM_H */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
