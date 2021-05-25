Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D9EFC2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:26:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDE0E613F5
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 12:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDE0E613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKUn+JHWkiYfFg25+RphnLZpO9zfe7nJ0OkL3zcq/3E=; b=wTuHTcWJEclPHo
	zCn9YF5DTLsVEcmp3gel62QZ6mAVBvN3Z4mzWuI4walwG1JrCPUJ+Xhd2zGWWuI5mpz+btRxhb2vP
	bE3FYHvEVD2QxSLRWwGq77hNhLtJ9a6/fpNyA6J7i57iOwNbG9dUsUh6Xb4zoNdK3/0ujFQqhShkl
	3Z1ks5jEhOK4WW4Vu3l1L8SELjivu8ZrPECbtpQBq02bXa9PksqEDb3LVc6oEPWQNh9YYIhgPjKBt
	BOOarn7qv/0U6TJ1NRmLrMh32RpoEXAR2KF6VFme5UBX9FVxerPUNfzCWaXhQxLiZYLRKLWqt/ZTp
	2IAudVpXBo6jpiCGNTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llW8W-0051Ct-CQ; Tue, 25 May 2021 12:26:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llW7G-0050fr-GC
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 12:24:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2CD1A6141B;
 Tue, 25 May 2021 12:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621945498;
 bh=AVRcXtmLCIJi5XnfF9tb6jrsuH0Q2wdP15ACb5u8w4k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FNVZJPsAfA0x+sFfdIgWJpH5zJUF9ZI3f8G+JqF8Clw0aTgpe7lfMii+hnfCs380m
 vBVhYRR2d92eAYpPpdArfOTXlsVdVKiEVdR7XlJQs1EuxuVLZKDsNRWu2V9Ar8wfmo
 VcYLVAynxBlirnakLIu8NoIMbWevMeXZt/nSHIWlTVlytka5JXQjPuhQJ+xg7HorA/
 jOdex5EFDmLXlY315GRXyRYmZOwcYjqt0oRuqblQ/5W39yxx67Kww35MqXJPMBDE4Z
 LxhWiWxSYRKpGAwgbznwFvKVreBJrIcW6KNvKhW/hrLOT61v/Yae4TniFfYAvqXbXk
 T7KmuY3i0Nrxg==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, hch@lst.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 1/2] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
Date: Tue, 25 May 2021 12:24:06 +0000
Message-Id: <1621945447-38820-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621945447-38820-1-git-send-email-guoren@kernel.org>
References: <1621945447-38820-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_052458_599351_66968A07 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Kernel virtual address translation should avoid care asid or it'll
cause more TLB-miss and TLB-refill. Because the current asid in satp
belongs to the current process, but the target kernel va TLB entry's
asid still belongs to the previous process.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/pgtable.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9469f46..346a3c6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -134,7 +134,8 @@
 				| _PAGE_WRITE \
 				| _PAGE_PRESENT \
 				| _PAGE_ACCESSED \
-				| _PAGE_DIRTY)
+				| _PAGE_DIRTY \
+				| _PAGE_GLOBAL)
 
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
 #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
