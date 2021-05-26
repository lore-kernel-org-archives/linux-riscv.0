Return-Path: <SRS0=lIhr=KV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D66C47082
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:50:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BD71610FA
	for <linux-riscv@archiver.kernel.org>; Wed, 26 May 2021 05:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BD71610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OZKFIGUQewZwYVrof+nHD0ug7GjeW3MJ5pa71UuG96g=; b=5GOIelG92AuyiK
	KzlKoK0v5heaxN8rxeUa3EbwkB11T4B7HXndjTxwgy4G6iOG1Oy4M/bBIj7A1KtVUzed6XEOQ9i+x
	onH9xO19lGktU6J2Xo+R2WIZOlwhbadvT4prbzKPkpMjw+pbmH0BFARgWCHek/i+SOOqVLbK5/mYF
	/byvX4F2Upwouq1XjEvJm6O63U8n7VW3aUUSdO7S2xUEKmvQhLMlSiOPrH7VHhW4lZzcBBNPDLHe8
	z+IYN2TVFOWsHG6gSC89X7aRAGyXxH6twMaaq5+M0cLXdhRt2BdbQs8yYXjTh44fssvBEn9cf7gu0
	Ai5mEK6YazX06c6We4zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llmQn-00BJUG-VK; Wed, 26 May 2021 05:50:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llmQk-00BJSC-1h
 for linux-riscv@lists.infradead.org; Wed, 26 May 2021 05:50:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 93CA1613F6;
 Wed, 26 May 2021 05:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622008209;
 bh=inTZKABnBrUQ84H4gADlk73DnbiHL4nyjoNWVqTyW0U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DQvJYjozsY+wiG56YStah9peEx+ppXBeI/guU6j0EpYckdBAU0TPLT2PxyKsMAsV5
 5jH49GETghaDZhrwJAFsLSlSMK7TNWJYYKlOweCbKjkBMgBOW2gpgSYTxwv208pTH0
 9vwSp3oPFMPWyeEr/fAcesWRZF5TwmhWJmpFBWSFOBtD0MWaSgPZnVZN+HdWV6UoQK
 PzKxKC4L3umMW1z4nxyTk/o7SkvijnO5RJKn1fZRj6cQF2txPlvgFWysJYq/T4gOKs
 6aupWYLToU7ljMwYgEARhnviMx1EX6DUfyNPH0Lgt4K7WpCBxgkZH7NcDkmg1/PtjI
 TWOOwcbx1zu6w==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de, hch@lst.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 1/2] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
Date: Wed, 26 May 2021 05:49:20 +0000
Message-Id: <1622008161-41451-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1622008161-41451-1-git-send-email-guoren@kernel.org>
References: <1622008161-41451-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_225010_132223_301E339C 
X-CRM114-Status: UNSURE (   9.50  )
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

Kernel virtual address translation should avoid to use ASIDs or it'll
cause more TLB-miss and TLB-refill. Because the current ASID in satp
belongs to the current process, but the target kernel va TLB entry's
ASID still belongs to the previous process.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
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
