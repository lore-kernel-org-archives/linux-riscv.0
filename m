Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A84D3C282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A60D20874
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Eiud3F4r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A60D20874
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6zuASv/3HE/+/840W7lITryFTsdlQX03J4jk0uwkSas=; b=Eiud3F4rO9aXpG
	qzfMQgQqgizXTzXf8t6wCBxVGFQTtudliEuZ1u9NTa5mLaX0MI/MsY8eGsMvrku+7FYtHRT+TOzoF
	tCqX8jMdKlrw/yiCIIUKkg8tnqE6n27HNjXPjkPu7AyxVJZl8C/j1gLv+gfUB/44ksWh0PeJnTWGu
	I7ATi2WHoEWDGKFBUK6rShZN+iJEDB3lE3Ds2RCQTwLZjmAIqvQKEeyt1gxZ6Vge9JuVkZMZ2RGsk
	ua6rTwarISRoO11tNjcYvF0B7tPax9d1loFqjnw4lbyAePpVI5itftJ52O/u9lp1Qw9kYWm7GjI8m
	7F2ML+4ZxBx69dRcf9FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxho-0006ME-NS; Mon, 15 Apr 2019 09:15:12 +0000
Received: from 213-225-15-255.nat.highway.a1.net ([213.225.15.255]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxhm-0006K7-Nu; Mon, 15 Apr 2019 09:15:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 01/11] riscv: use asm-generic/extable.h
Date: Mon, 15 Apr 2019 11:14:32 +0200
Message-Id: <20190415091442.19945-2-hch@lst.de>
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
