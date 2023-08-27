Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E54C83F10
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LmPBnFh6nvWPcMSYUZddHr+dNSlTQBHutrDzCuCy6yY=; b=u99Q/l5dCnfvP/
	1SnIcpnocuwjywLJRAMOC5nHwA148h72+f59/FEuiTOdSquG7HkXNtq4V0uIIHIUj64V6OEJlfKgR
	AUQVMCRqNj/dPVq6yTFQih2RdZ3yJLNG1tPQCwECYO+HFVejWYcpXYjt7LhPWmUxmVxCIwgFxCfnw
	8CuFnx2kZDXtl/HnkYK3aB+4qkuydRQKc2CZZasxqe9fzBxbRzxMxb0+4hVxGG9tV4XVno/gB9b8h
	VHrcGybmsuZaFwhpyNBhIJKEH/sXluDaKDDZXej8P97DtYHcb7Pu2HnSBk18u7nLd/qJ54EQLCb5N
	kYDdCF7/sADPcjZyJKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBuu-007iWG-1V;
	Sun, 27 Aug 2023 09:18:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaBun-007iVj-0C
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 09:18:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B85AF61337;
	Sun, 27 Aug 2023 09:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92D2C433C8;
	Sun, 27 Aug 2023 09:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693127914;
	bh=Tsf6e5Pg927isx5zwcv/xL0jKM1+YyRgn6zbNLSS1+4=;
	h=From:To:Cc:Subject:Date:From;
	b=W/EzN40VCzy7Rc8zno7ucaZFINYPX8zWE9ayA96yjuse9VlM8G8rHaoYXGIuI/SJN
	 onBOUmyLlkEHfT5AYNMfOO2CFU5v2tsFUuB2RnAqMRbR55qyC1Y9EpZBKWhuXD/R07
	 zg8iTsX8k5zZYT4D+nsp1E4+GIBCM6Cjntui3KKwC22Iw4ZPx5OyOMZNnJdBSe+gks
	 0SqpMGTjIvGndD9v7ezFdi5pbZ3K1jKtBiChGjHaUhDM7jbdxhLVul8v2ewqql+Kvv
	 0KdQdcIzuezTzOfRHmkx2z5uHJX265CVKKgs4pW7jZM90es9RhlmNFRtXbT2BjeSym
	 w3k5Roqwh/wlw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: update T-Head memory type definitions
Date: Sun, 27 Aug 2023 17:06:44 +0800
Message-Id: <20230827090644.1318-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_021840_251948_0A9D2B05 
X-CRM114-Status: UNSURE (   8.05  )
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

Update T-Head memory type definitions according to C910 doc [1]
For NC and IO, SH property isn't configurable, hardcoded as SH,
so set SH for NOCACHE and IO.

And also set bit[61](Bufferable) for NOCACHE according to the
table 6.1 in the doc [1].

Link: https://github.com/T-head-Semi/openc910 [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/pgtable-64.h | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 7a5097202e15..9a2c780a11e9 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -126,14 +126,18 @@ enum napot_cont_order {
 
 /*
  * [63:59] T-Head Memory Type definitions:
- *
- * 00000 - NC   Weakly-ordered, Non-cacheable, Non-bufferable, Non-shareable, Non-trustable
+ * bit[63] SO - Strong Order
+ * bit[62] C - Cacheable
+ * bit[61] B - Bufferable
+ * bit[60] SH - Shareable
+ * bit[59] Sec - Trustable
+ * 00110 - NC   Weakly-ordered, Non-cacheable, Bufferable, Shareable, Non-trustable
  * 01110 - PMA  Weakly-ordered, Cacheable, Bufferable, Shareable, Non-trustable
- * 10000 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Non-shareable, Non-trustable
+ * 10010 - IO   Strongly-ordered, Non-cacheable, Non-bufferable, Shareable, Non-trustable
  */
 #define _PAGE_PMA_THEAD		((1UL << 62) | (1UL << 61) | (1UL << 60))
-#define _PAGE_NOCACHE_THEAD	0UL
-#define _PAGE_IO_THEAD		(1UL << 63)
+#define _PAGE_NOCACHE_THEAD	((1UL < 61) | (1UL << 60))
+#define _PAGE_IO_THEAD		((1UL << 63) | (1UL << 60))
 #define _PAGE_MTMASK_THEAD	(_PAGE_PMA_THEAD | _PAGE_IO_THEAD | (1UL << 59))
 
 static inline u64 riscv_page_mtmask(void)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
