Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F20ECDB483
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXTXNELM2hS+HT1j0gIQwOBLlLMreNO+7iz6WE54tzo=; b=q6rM+Z/dud7LRC
	5qmHkxJ0zv2DMXLMlWyIXvwQ5C3jmm5hBHVaxrFlBay8nywP303Egnrna3GAzh5bvNYEqF+6nK39y
	JAXCepDmlhpZ8NRoI5qwJG+CK4hJG338VsDwzZnJiyN6ZbWe9kEfBhLBgkx0N6o8rxQWRAcW8qkIO
	3VPi1j1IqJAZZ5YnMs/dThHztG/3yOGFc5GZkIKRyYRFbNqxumyF9ZdBTmeRU17Wu3OnyT3QPMi3d
	nL67zMalG7BH15xtkMvZFYOJ1VD4epJuk7vLLfJBiSwGidcmSdYk8SoX58X+tggIPIMKgfVzRJqDt
	20HyG8lnMH+gDAdzsdQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx0q-001DWG-2z;
	Thu, 12 Oct 2023 14:50:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqx0k-001DUK-2P
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:50:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 602D2B82425;
	Thu, 12 Oct 2023 14:50:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1533C433C8;
	Thu, 12 Oct 2023 14:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697122200;
	bh=z1ZRpKN4zGKXq55T5I704tUYnbOmVfb3YTkG0G86C4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UvtwTxwHfDM2Xg+q/s9dvFpSAWc0Wgzy/sITutGQnDGMP0vF1cNiQgLiilNaam2bD
	 xxiqNQgnivwSW3pVxziO6J1mUqKQazgCMwj+mcW/nT9IfgNPORGd1LTrvZ0m5kOS41
	 vK4veMnWeZzu1ppbl7hP8/nopAQokhP/c51TgyyPIenQrc2V/3Jr6dJAFehs4QsSYS
	 N4V6FW5VfBOCaWfUCbFwux76xuSDd8OZScojUOxMJEc40W9ktyscHL0FxnJG4LmmXV
	 3QkZaG9+vd9HF+gkUXxfMgSdiwTG9aYdvfJ9BP61nDaeFBwNEQgfSuUflH0tB6dg+9
	 4HTuBPXTyVl7Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] riscv: errata: thead: use pa based instructions for CMO
Date: Thu, 12 Oct 2023 22:37:46 +0800
Message-Id: <20231012143746.454-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231012143746.454-1-jszhang@kernel.org>
References: <20231012143746.454-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_075003_016419_8A8281FF 
X-CRM114-Status: UNSURE (   7.37  )
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

T-HEAD CPUs such as C906/C910/C920 support phy address based CMO, use
them so that we don't need to convert to virt address.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/errata/thead/errata.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 3fefeb1b456e..632557f36b19 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -58,9 +58,9 @@ static bool errata_probe_pbmt(unsigned int stage,
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000000    11001     00000      000      00000  0001011
  */
-#define THEAD_inval_A0	".long 0x0265000b"
-#define THEAD_clean_A0	".long 0x0255000b"
-#define THEAD_flush_A0	".long 0x0275000b"
+#define THEAD_inval_A0	".long 0x02a5000b"
+#define THEAD_clean_A0	".long 0x0295000b"
+#define THEAD_flush_A0	".long 0x02b5000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
 #define THEAD_CMO_OP(_op, _start, _size, _cachesize)			\
@@ -79,23 +79,17 @@ asm volatile("mv a0, %1\n\t"						\
 
 static void thead_errata_cache_inv(phys_addr_t paddr, size_t size)
 {
-	void *vaddr = phys_to_virt(paddr);
-
-	THEAD_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
+	THEAD_CMO_OP(inval, paddr, size, riscv_cbom_block_size);
 }
 
 static void thead_errata_cache_wback(phys_addr_t paddr, size_t size)
 {
-	void *vaddr = phys_to_virt(paddr);
-
-	THEAD_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+	THEAD_CMO_OP(clean, paddr, size, riscv_cbom_block_size);
 }
 
 static void thead_errata_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
-	void *vaddr = phys_to_virt(paddr);
-
-	THEAD_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+	THEAD_CMO_OP(flush, paddr, size, riscv_cbom_block_size);
 }
 
 static const struct riscv_nonstd_cache_ops thead_errata_cmo_ops = {
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
