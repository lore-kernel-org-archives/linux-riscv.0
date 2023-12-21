Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258DDC46CCD
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQbQYSmJ9XWWhwcozXqjbQOvtRK8Hr9NPtOK/VnQh6Y=; b=aKf6GZdb2AkEHT
	UndA7t2S1SFhXpGIAIbSTsuCyp8A1zYLGm7h6Rc27vjRWfw6vpl7Q9ZHyFguU1c1hf0QpJr2VFWlI
	uPQYnkcPrXG/ro7Nfh4Muzp8As2cRsl4Gj8l7lL8gmvrN36vvfTi6N6L+QXRwNYXj+ggxVfEClISS
	eawNoWff2RVvPxXjtPDg9owLi2exwLL8M0BlfQ1HjeKnbrsnvDELCwJNv8Lszxh89vb6omtw2g7km
	2GGLcnO/3OaRDmx11Tt0VJyX9hRYWJpn0EmsIGynCqfqz+lFgnLM/qvB5n4R/mQvyBEIx7pnFM36I
	zU3Gl39BkUNmNSURR7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLGb-003PUp-1M;
	Thu, 21 Dec 2023 15:47:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLGZ-003PTZ-05
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 15:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8910A619C4;
	Thu, 21 Dec 2023 15:47:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8972C433C8;
	Thu, 21 Dec 2023 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703173638;
	bh=dOGyrLopRgWASgaIZLAx6CNRKKRLi1o/fzWOzw5hikY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cDlxg7WA1eBIwKV7bwZmyHXskjpiO8H0zm7M2Ghzhr/xJdhhL6Xl5kRI6BWyYA5lD
	 VBxAhJBQbB+9gO3Ag/gZJDFb+yKcYSbIwQNpD0ma517/zmjRtZImkNo7sEdHNxRaMo
	 1gXtByNw8LvPKTENtE7Eyo0fI2WALLGGdtPJwJF36c/Jju3NFsv75uhnr92pS3Mkxz
	 9QYAV4nD600gK2ZN6ikxvxtty6vjKnY3kXSgadf2i6U5AbJDy8ZsKxPN1iBVipFQBV
	 fplnF8mxIeIWVezxJQwQjGSA/khdXnqsTghUjHSyjZpLYbroFFW3LkjSldkXwKqcCY
	 8N6jkGpF6/EHQ==
From: guoren@kernel.org
To: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	guoren@kernel.org,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	leobras@redhat.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: [PATCH V2 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Date: Thu, 21 Dec 2023 10:46:59 -0500
Message-Id: <20231221154702.2267684-3-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221154702.2267684-1-guoren@kernel.org>
References: <20231221154702.2267684-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_074719_106632_133DE09F 
X-CRM114-Status: UNSURE (   8.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

When the task is in COMPAT mode, the arch_get_mmap_end should be 2GB,
not TASK_SIZE_64. The TASK_SIZE has contained is_compat_mode()
detection, so change the definition of STACK_TOP_MAX to TASK_SIZE
directly.

Cc: stable@vger.kernel.org
Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/processor.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..1f538fc4448d 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -16,15 +16,13 @@
 
 #ifdef CONFIG_64BIT
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
-#define STACK_TOP_MAX		TASK_SIZE_64
+#define STACK_TOP_MAX		TASK_SIZE
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
-		mmap_end = STACK_TOP_MAX;			\
-	else if ((_addr) >= VA_USER_SV57)			\
+	if ((_addr) == 0 || (_addr) >= VA_USER_SV57)		\
 		mmap_end = STACK_TOP_MAX;			\
 	else if ((((_addr) >= VA_USER_SV48)) && (VA_BITS >= VA_BITS_SV48)) \
 		mmap_end = VA_USER_SV48;			\
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
