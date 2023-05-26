Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C67C7EE23
	for <linux-riscv@archiver.kernel.org>; Fri, 26 May 2023 17:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/l3a+ePya7BhtbfrXboFUVD6rZD9hk/3qeLSq13K1ks=; b=LxOgM2Z6G2DLpf
	XHYOtXRMFhL9oVOd/pvBY4RM+1+17wRfb4dUI/RbqjHPWc843zKD5JbKGTZd7ky6NU35fYcPFQGvW
	ibYwEB13j1qrN1z6NVuYAEClFRn5yZYHXKC7wqZ5zKcNvibq6Voc818c1gpFY8ffn63u9enrWh5MK
	HQG+eZ1x9qpiAospcZmvw8g6XOI+xszqc8yKgxFgwqtp7yhjYcplbnUodVHzey94nnkjRnG3EGELT
	31ccD4ru1zZT4vkRbsh/khnEMAWmzvyX7uzOtHXuBf64jnL+h48BPi1S7xkZuyA3n7miz9PtpqAk/
	oZyE+Q/aUfS/tzQH76Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayG-003Fei-0t;
	Fri, 26 May 2023 17:11:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ayB-003Fcf-1r
	for linux-riscv@lists.infradead.org;
	Fri, 26 May 2023 17:11:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 29AD0651BE;
	Fri, 26 May 2023 17:11:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374DBC433D2;
	Fri, 26 May 2023 17:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685121074;
	bh=xGXWKrOp0g9viGaeP46hlIuMnd4eCZ7qokxGpnJ/fzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=inb6fwAeTMyK2wSbEr0nuGmmPotGctpAFAas68FOu4FXw2az1r0gk6rZbi+5aV0h5
	 m4OTi/vkC0xVo5GTCgTkRkG73mXt852HxHcds0NLIr1prkeDvnwR35p44PQEvIl6cy
	 yiSGbH8nOzCslfwRqUU068U0GxfMvlzcryYaJZugLD0oW6QzFdR4E6aOzmTF8JuRDS
	 2E4BuuxBKV+OGh4lFzfjSK7OfQQmJG6g09pKeZsR9d5KkR2MBKUakQsKttJ8oqYShU
	 j0wk75Exd01x45Uaxs8towiqvb/su72IxbpAqoT33JD5OogB3dtjS4/aCddv+IDty7
	 ib60VxxrBdFdw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH 2/6] riscv: mm: mark CBO relate initialization funcs as __init
Date: Sat, 27 May 2023 00:59:54 +0800
Message-Id: <20230526165958.908-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230526165958.908-1-jszhang@kernel.org>
References: <20230526165958.908-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_101115_647534_8D1A73BC 
X-CRM114-Status: UNSURE (   9.75  )
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

The two functions cbo_get_block_size() and riscv_init_cbo_blocksizes()
are only called during booting, mark them as __init.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/mm/cacheflush.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index fca532ddf3ec..fbc59b3f69f2 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -104,9 +104,9 @@ EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
 unsigned int riscv_cboz_block_size;
 EXPORT_SYMBOL_GPL(riscv_cboz_block_size);
 
-static void cbo_get_block_size(struct device_node *node,
-			       const char *name, u32 *block_size,
-			       unsigned long *first_hartid)
+static void __init cbo_get_block_size(struct device_node *node,
+				      const char *name, u32 *block_size,
+				      unsigned long *first_hartid)
 {
 	unsigned long hartid;
 	u32 val;
@@ -126,7 +126,7 @@ static void cbo_get_block_size(struct device_node *node,
 	}
 }
 
-void riscv_init_cbo_blocksizes(void)
+void __init riscv_init_cbo_blocksizes(void)
 {
 	unsigned long cbom_hartid, cboz_hartid;
 	u32 cbom_block_size = 0, cboz_block_size = 0;
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
