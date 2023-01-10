Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D10C46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JxWn+A0rOAsoA8RMazBVH1ikVFOXBurXvkpyIsRbZFk=; b=jgWzBHxQ6PJJ0X
	enukmDakqRqkY2nLrRUDZeUL5OD0/dnOH8AW4PKGWzlJ9mx4zWn3cLYE+tHJDIO74hbt1WoiFyr64
	V8ZEYBdwp7M7Gsgs83KRqOrZI2epjaLDsP0KQg/Ij5ZzyC0OHAZgosMb9gLSV5bJa99Be43HVbA+3
	PcdfFVSd03fxbbzC/mlnRy7yqFOUDLtMnvO331UsqSRhHDjDbc0t0tNeC7TkZ+XZAKCSvmmFueuxa
	jbMHuLwbSI/xnLzE06HXnfFrGgmvIuag2XxER8TTPaNHO/uWFwuU8UB8ifZhe7ZpQjf8zYnblkqON
	seYg1kBVop9MojMyhdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9cp-005h7o-1L; Tue, 10 Jan 2023 08:04:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9cl-005h6Q-PP
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 08:04:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9FCA2B81106;
	Tue, 10 Jan 2023 08:04:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43B47C433D2;
	Tue, 10 Jan 2023 08:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673337883;
	bh=5Wa/I8iPWXYq4EtfoTuN8CIETGpW0mcYV16o+ZIQb0s=;
	h=From:To:Cc:Subject:Date:From;
	b=o0n5lmbCHXUilcZgN67fSb0kHZhmYurEURBnz2aANtb7fEmon6LfscWTpyk2UaIId
	 7SdowYfjZAQUMsGeSDAG8ozCKW/cqyHZuGuYiZ9XsA3muhdizIP+G1mr94x84TsK5v
	 xmWA1EbB2kF0ZnVV8o3m9HnLOytW7kjoK0OxEP1jq8au8NpB3lJstse3KEGW90BFbV
	 sS3zptGl4hoe3cFNE60EHZOqKWkRyGdu1ebf2j5oZX4CLyXlAGCAgIaDQatjKEB3Zv
	 RLWO++k7/Cjhva2Tc+xJooe556duXejs+KH5mikbkbZRKUEO/gG/+voMMpBF4qbLY/
	 5u+rbIEiHIU6g==
From: guoren@kernel.org
To: guoren@kernel.org,
	alexandre.ghiti@canonical.com,
	palmer@dabbelt.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: pgtable: Fixup comment for KERN_VIRT_SIZE
Date: Tue, 10 Jan 2023 03:04:19 -0500
Message-Id: <20230110080419.931185-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_000448_005218_F80DBEB9 
X-CRM114-Status: GOOD (  11.82  )
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

KERN_VIRT_SIZE is 1/4 of the entries of the page global directory,
not half.

Fixes: f7ae02333d13 ("riscv: Move KASAN mapping next to the kernel mapping")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 arch/riscv/include/asm/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4eba9a98d0e3..2a88362dffa5 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -31,7 +31,7 @@
 #define PTRS_PER_PTE    (PAGE_SIZE / sizeof(pte_t))
 
 /*
- * Half of the kernel address space (half of the entries of the page global
+ * Half of the kernel address space (1/4 of the entries of the page global
  * directory) is for the direct mapping.
  */
 #define KERN_VIRT_SIZE          ((PTRS_PER_PGD / 2 * PGDIR_SIZE) / 2)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
