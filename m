Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C66ECCDB47E
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Oct 2023 14:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6vXunRpdm4ugUupIegIm5r+KSK18CTc+qibxqWABjs=; b=dQLOgk3WcncplP
	3OVbVuX9HwrIJ+usSB9sgAv5BMROwoM0005uG4NePvZP8KXEZuEoodYVXn3OLyjbQRBwpTp/S+qa6
	rQd2smdpJF4MACWypt/QTCKmlXZfVCx1MQAMOYcwZ6jC5FElFbbHAf7S50zQEZFWxV74VzNRBlkPx
	TdIFm8GriHkJBo3eWrzRL6MLJK4WRCRyyRSItgJHHp7526FKK2H9V/5ru1mByMd09Isy2ZFDcDsw6
	BiszKbTZ91yo0oac1P9Enobo0A1VcrZdjBy4tkOeOwk7B2QRbM2MsIo2a4SQAkHSIEpDj89BmXgYM
	qAphtR6ttkEnX5UaVl6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqwes-001BBZ-35;
	Thu, 12 Oct 2023 14:27:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqweq-001BAJ-01
	for linux-riscv@lists.infradead.org;
	Thu, 12 Oct 2023 14:27:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33D0461E64;
	Thu, 12 Oct 2023 14:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A04DC433C9;
	Thu, 12 Oct 2023 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697120842;
	bh=qzR32gMwqLa17IpLtlTXacrXoBXks+o3rMWn8BtgPT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KxEzD4Hb45irhwRrR6hmVCp9cRJNfnq1J8JUzLAk6c0ZrW5q+mVClsOlJX3lIlK9Y
	 d/ZwrOqNaJn8hH7/jCQ1lzfXy42fMEYNWxcU1f1BEF9lSEqEICRP87lWmjP1CXS4Ys
	 LisBPismY1a2v66e+o79sXzTudUIMUUHdp0Z4SZ2kPZlngpuER0y9SWZC4UDLhtwIA
	 w/ikdXlLY3iKZEhZO1RKv7eIxs1XKQ666mlm8jJEcqPuPRGNvJ9vtq1nw3Ii1bbRVm
	 S89Hh34WiBgf1M5OZ6NSJT3JNotxrWOfhmSJrL3MgLQyhP+dT5JjIrn9tmdb8BkfT0
	 0M5i2RnPY0zPQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] riscv: errata: thead: use pa based instructions for CMO
Date: Thu, 12 Oct 2023 22:14:56 +0800
Message-Id: <20231012141456.4078-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231012141456.4078-1-jszhang@kernel.org>
References: <20231012141456.4078-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_072724_110425_297C79CC 
X-CRM114-Status: UNSURE (   7.58  )
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
