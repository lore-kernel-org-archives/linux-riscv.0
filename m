Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD086C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 03:49:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 932BB61417
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 03:49:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 932BB61417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XKUn+JHWkiYfFg25+RphnLZpO9zfe7nJ0OkL3zcq/3E=; b=B8OgiNSnaBbRK8
	E54MVgs/mDqT0JHOj95Ap1YvAol4LRf+x3vPjm4S+aGU/VOnbttchi0Y0Ir2Wep0/I14BL5qr5Uu6
	aP3nVv/P459A0NKiq+unAg2e2zkC+0GtUoHzWB/A5Z7REaYd01iCguRbtrquo3pQRAUujySUkVdI9
	tJn+aSY8TPlWLgldEc4f4IgnolLRT+q46xuC9MAqwHijDQF61MIRlFoZ/mkoD9V5cZe9aynNwGDNQ
	DKIa+N94enZFKo+VT+qvjkObxudwL0yA7IsHmlPJkJyVWlVeDHOTM3oFDXaMSIxqdg+Apq4UPvDW0
	/enbku2MsCx+b+mSRMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llO3n-003Czo-IM; Tue, 25 May 2021 03:48:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llN6K-002zGc-O5
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 02:47:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B91D613F5;
 Tue, 25 May 2021 02:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621910844;
 bh=AVRcXtmLCIJi5XnfF9tb6jrsuH0Q2wdP15ACb5u8w4k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AyyT73HbHY0cm5IyO2xEVdvH1M8nQXF7qK5A/fdEkoXO2swvy6PSID+TwxhDJtELF
 l9V0V2lQZzFWQEEpoOF07KLLvGQud4M1cficgvUXueJNfBpI6h9c9PNq3WaxJrsGTY
 5frmBpssWcFnZizsl+BrAsRXvXEeen+78LHvNFfD1FhvLo0LaUBLxm6VY6AOlqmNNt
 TFvvh8jiO2UcOY5Ya/zs/usVa+LDn0c3YNLVLn19tVTdVMjFAFh/VDxDBGv2eiqXrv
 46AeKsghCK4x7J+0oTlLr2+JsSwoMmLjTR3tAQMCQCoW/85sm9hZAxaK00d3l5kx4G
 nD+W/MV7yYdEQ==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 1/2] riscv: Fixup _PAGE_GLOBAL in _PAGE_KERNEL
Date: Tue, 25 May 2021 02:46:26 +0000
Message-Id: <1621910787-34598-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621910787-34598-1-git-send-email-guoren@kernel.org>
References: <1621910787-34598-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_194724_856395_25BFEAA4 
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
