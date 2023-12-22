Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF83C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TUzqemxzayH6LN4FYip8N2OlNeLBto+XrmGKC7/uKk=; b=bVinzBChiejucP
	i03mmOufmcJUoOm0OTb4BASdOfTUrPdYGGo9UPU0/pxE9GUYJ24ohfLSM3rq5jq1tH4MeDrMBZYod
	EtGZAYpeAhR4KtMLb3kVIKi6QPsWG4Zy1oI7XZIHNb7oV6kLZ+e6DL1xtS68f7JPcr7SktfbTmADs
	mkhf5rfno6URNSo2a3cegutBY3mpbUbSC2O3IveDavPKB5qvviKgbppYG6z6zzofvNW1U0wFdGKWt
	tqEnWU8KGxngdLE/zesUCnFDTvDCks6bl8PiyquIxt4rt5Db97aic+IbqzUzslGwTxUGMdi5lXxJk
	wqkyLSROJS3VmaA0JN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9p-005sKj-03;
	Fri, 22 Dec 2023 11:57:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9m-005sJA-04
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 11:57:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86B5F61BFA;
	Fri, 22 Dec 2023 11:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13664C433CB;
	Fri, 22 Dec 2023 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246253;
	bh=vzAUwHIH1r+/fUC34Yyxdlm+3Xgnktg3iqTJcmMW334=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rjHR5MVAmrvSXQrnh46hTtmqK2B9Ui39aUg7OorT2cb7T849p32wzZw9EYsyX9q9N
	 pBB+OF3PIATNO4q1fk4nJjhiCj7Vtir85aXm+msta1pHfJBBUi49qgN+24XqFg/cnh
	 9AODp2lyUyp/yMu1DkyVIuZ4hjS0Sf0kwkbyy9vhPiti2WZ3KGKEGRdbvBIVFQPLOB
	 CJpuzMqlx2Hnk8FPva7wkN7HUj0wizLUI2a9WJF/1iztEH6nb2GGSkVLDXBX465EEr
	 nWpko0+T3CgqYkOaQAKDzZOBFMmlxTXV6KLQD9pxMD0PyvN/24cCIFzUJT3KCkdHs3
	 CN27UjUDwUs4Q==
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
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 3/4] riscv: mm: Remove unused TASK_SIZE_MIN
Date: Fri, 22 Dec 2023 06:57:02 -0500
Message-Id: <20231222115703.2404036-4-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231222115703.2404036-1-guoren@kernel.org>
References: <20231222115703.2404036-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_035734_110513_BCBCFC7D 
X-CRM114-Status: UNSURE (   6.92  )
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

Remove TASK_SIZE_MIN because it's not used anymore.

Reviewed-by: Leonardo Bras <leobras@redhat.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/pgtable.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 74ffb2178f54..e415582276ec 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -878,7 +878,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
  */
 #ifdef CONFIG_64BIT
 #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
-#define TASK_SIZE_MIN	(PGDIR_SIZE_L3 * PTRS_PER_PGD / 2)
 
 #ifdef CONFIG_COMPAT
 #define TASK_SIZE_32	(_AC(0x80000000, UL))
@@ -890,7 +889,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 
 #else
 #define TASK_SIZE	FIXADDR_START
-#define TASK_SIZE_MIN	TASK_SIZE
 #endif
 
 #else /* CONFIG_MMU */
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
