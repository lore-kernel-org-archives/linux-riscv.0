Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4020C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:56:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C397D2073F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aAc70arK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C397D2073F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zuASv/3HE/+/840W7lITryFTsdlQX03J4jk0uwkSas=; b=aAc70arKgDRMDq
	r0mX+ij8UUXiNMGCOUK0+j8KeVYNkIcbC4O9KOwrIVlkEmTfX41CJ3zq0vlY+2rujtwa3nGK0CIuo
	dFGIk3PQZQgtAKNKGjC/s5hNWMT1B3REpO/kB1SxRRd/7SxMhXDIVotc5Zr7LHE7AfL8JHAHC2mV3
	nzwFvS1GRFP2o7k4QFHb6wZga//PIeCyARXTF7lQ9BXF0uFgkCRmOfGlMBuHN0xR6lRgHZB4t7IpT
	9aV6Oyjlx93cbMIqsDlv+JN+g5zCCb9IgojGH2tFHgU3JrAllXJRQKIzcoPejzwwLEV0NBTZXxKLt
	KOd17hDDZd8HoADPe7EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEYK1-0000rV-TQ; Thu, 11 Apr 2019 11:56:49 +0000
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEYK1-0000q5-2v; Thu, 11 Apr 2019 11:56:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 1/9] riscv: use asm-generic/extable.h
Date: Thu, 11 Apr 2019 13:56:15 +0200
Message-Id: <20190411115623.5749-2-hch@lst.de>
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

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/Kbuild    | 1 +
 arch/riscv/include/asm/uaccess.h | 7 +------
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
index cccd12cf27d4..5a7a19d9aa7f 100644
--- a/arch/riscv/include/asm/Kbuild
+++ b/arch/riscv/include/asm/Kbuild
@@ -4,6 +4,7 @@ generic-y += compat.h
 generic-y += cputime.h
 generic-y += device.h
 generic-y += div64.h
+generic-y += extable.h
 generic-y += dma.h
 generic-y += dma-contiguous.h
 generic-y += dma-mapping.h
diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index fb53a8089e76..cc5b253d4c57 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -23,6 +23,7 @@
 #include <linux/compiler.h>
 #include <linux/thread_info.h>
 #include <asm/byteorder.h>
+#include <asm/extable.h>
 #include <asm/asm.h>
 
 #define __enable_user_access()							\
@@ -98,12 +99,6 @@ static inline int __access_ok(unsigned long addr, unsigned long size)
  * on our cache or tlb entries.
  */
 
-struct exception_table_entry {
-	unsigned long insn, fixup;
-};
-
-extern int fixup_exception(struct pt_regs *state);
-
 #if defined(__LITTLE_ENDIAN)
 #define __MSW	1
 #define __LSW	0
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
