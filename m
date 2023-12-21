Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF3FC35274
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Dec 2023 15:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mA24xuCJ1Rtxc5D3+d1g0adORt3CtfyDGsmMpQJTlrg=; b=BWZheBfmV+QClB
	YMt0oRQEnUaGH0JBNlPKnZkKd1vfdkhyoQ+SYWgWsYrlEKi6Zi8uTYI5BpCDK6359dt57cMCLfBHM
	NxD6bIb+kb68P+zQpnVz6B9o8g8pVbFEIzI8p9YCKcMtouH+ileY3ZBqptfbHX0Wmczeg7mArxrTn
	5MCV9uLHO0KXD3DcdZ/wBDXPjXBeU7TFZxI4FOW04bt0AW6zBN4cPCYFXwaPEXy82gNr7ScT/VhWi
	KsZPR5FcSzVSwBouZsy+hA+nrOtmx35iqQIEH6hWtMVfaM3n/Z71/dVyGSdNhe8LbK33LrmZQ74Ci
	Z9Ig+sLY8hcD8dQFpAKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLGf-003PXL-0U;
	Thu, 21 Dec 2023 15:47:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGLGc-003PVK-1h
	for linux-riscv@lists.infradead.org;
	Thu, 21 Dec 2023 15:47:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 05DF3619C8;
	Thu, 21 Dec 2023 15:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98E87C433C9;
	Thu, 21 Dec 2023 15:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703173641;
	bh=6UdCU34QB2Jmf2RjW8+f6vf0kvi9jkFwVt1GuOPbhWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CgB0V+JgevKv68oSzprvvmES0zf5NYWiDKBW18gsxXShgft2Goop1S8a7mLFoT5l0
	 +rGKecm/9UuNuLwYdE7hr9fIyDiiecKjjmxLvtCUMUUZ6NT33DBHy3EuwYNty6beWu
	 m54WfYoNUMG6eVMDoljKnDRfTixV1RYzkpy6afJ26+1JDdBk2BLAXU5lRJ4vQ+IEXr
	 1vEwskikoDkcJ/KJDvRNqPxmSQO1F0g/laB/c+eybU+7+Wjt7Iq0Pqm8zUxoly/WQF
	 c0HI0oKrzX8K3Dzj8b/JUteTjfZwqBiqJXiIlLAXpJEatNQCozmCg9lNjo5H/zk85n
	 bazdYY014sD7g==
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
Subject: [PATCH V2 3/4] riscv: mm: Remove unused TASK_SIZE_MIN
Date: Thu, 21 Dec 2023 10:47:00 -0500
Message-Id: <20231221154702.2267684-4-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231221154702.2267684-1-guoren@kernel.org>
References: <20231221154702.2267684-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_074722_605025_71ACCEE8 
X-CRM114-Status: UNSURE (   6.67  )
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
