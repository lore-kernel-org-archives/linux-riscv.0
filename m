Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14F6ECA0EC3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PuVZoGrR2AESJ0077zi1M1G/ibGYr0dZo2Zsf3qZ4qQ=; b=xaurh1jVMHD4tH
	j1IcBKnjP434G7BKVy5ycwV+Qb4LMJCZMJl29I9hxiPrQD1Xn9I65EN6cQ2VDK2Z/qG54YB4rfwbC
	nZlU2/VwJ6iXGMqiB3bWbuU+76ur921ThbRa+yCFHufnK6Mg3bTliQuuFxMjj8ueC45NAa1TCxVq+
	+uWFLnEvlbHSYxJ/0NBjbJuH8GQZJVtIox2InojWOdUEqHQiVdclS4T+F0EizN13TCCbVMsI3F92/
	gxcOk43O136OPDKfGojMtld5JKivQgVElcVjPqGoBEhKOoGeD2yFwCexqOX8n6BrxNKlpWjFnAyR3
	e8lzRnUbEEsnhpapYJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxxV-002QE5-0m;
	Tue, 12 Sep 2023 07:37:17 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxxS-002QCC-0j
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:37:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B94E6B81B2C;
	Tue, 12 Sep 2023 07:37:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED340C433C7;
	Tue, 12 Sep 2023 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694504231;
	bh=E+RlzXrhxC9sJ+1xCsa1js9BLmbDx0kmE855Vv+kmoU=;
	h=From:To:Cc:Subject:Date:From;
	b=rh64MUnCsOxItgPHmycfAF99QqwrG5YZvkmo5UIvlDpZ9PGj0V/H7jL3fToAoaDCF
	 N7vppkH/RE4oc6W6ik7pFu0LThkmq5gbtPIS1XtXF1Tb00S//F6qiTfjHqKsXOvZ4J
	 u7Cs1vy2JiPKY+PsX3mIa7wfDjl1f7eftvxUBzx+ginILHllH7cr9IrLlvmi2c/gM1
	 ihP+fSM7vkHF4QR33ViLUYNBR1YaB1EwXrxy+5vCguw24tkx2mD90HJyTKBv4LHlFT
	 Npx6x/9+qjTm/w8NnH2UizDFZLr+OBV6C1ZRqUsOIe6rwA5ZfhnwtGZwwkuET7aOVB
	 cV4LX0jvcsvdA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>,
	Drew Fustini <dfustini@baylibre.com>
Subject: [PATCH v2] riscv: mm: update T-Head memory type definitions
Date: Tue, 12 Sep 2023 15:25:10 +0800
Message-Id: <20230912072510.2510-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_003714_402960_81C1F6F4 
X-CRM114-Status: UNSURE (   8.27  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
Tested-by: Drew Fustini <dfustini@baylibre.com>
---

Since v1:
 - collect Reviewed-by and Tested-by tag
 - rebase on linux 6.6-rc1

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
