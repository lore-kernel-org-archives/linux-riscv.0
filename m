Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA31C4167D
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6hyMHzT7FtKuhHszecOO9hSC24PgDhm0tJg4MexjuCg=; b=bacqKxVKCM+Wjc
	luA9Z2CBwWZJV0l3pH6hBe/qq/UGnUCfJEgC/qHos4FLUVRPfazw1VcNgjDbAG1QIYSIhqCXmBmZv
	DPK6yd01tKKYT3edh+yndx5KDjW9vHi/NxSSDqRCU4lMQXztJAMGfe1ikYhN7Rhsr/UOT1pIA6K26
	N2GXKoSN5ny4sK4lc5ksHnSZJYSDAclwG1lEDzEU8NrqJG6P0/NRRvRNkJ9xNiQLUuuhz5MaQ36Nm
	TnjK8GXP/PRHt848dz/J3OTTSK9l2Cotk0fWsXPjg6Txp0pkTxydRFJY5JIFDwc5hQ2Rg1yk7Y4yO
	hVW5bTHybWl7o8zcGW1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ug6-00GFCi-0M;
	Tue, 14 Nov 2023 14:46:10 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2ug3-00GFBX-2C
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 14:46:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 38D0FCE192D;
	Tue, 14 Nov 2023 14:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B89EC433C8;
	Tue, 14 Nov 2023 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699973162;
	bh=gyx5uorL/T7u5Zf3KBdw6WSx5NX44qtilXB2fUrTgbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gjqpJeHCXZ2By7PxAYSg55SsIlNJlNzU9mTWAl8lkKPDNV4TmtfnPIzka8II3wW3I
	 4QYJzqQRpNCG/ijoRB37V1pJLQ5adJDbDmBcucoZFL7KHHGjxG/A/A5jaxpSS4lWE0
	 82duHi2SF1WnJJHu1EmSKuzJVxOtibxn0yck4MaWywpKLYq3IeIpNyRsyk2u5POLc+
	 qxbQlkFfcR5qwuukM3ZDoo6ISfJCD9sdHQ8C57NJ/owoId9oImZPVe+jCScd5FuVMB
	 Xv4k/LoEVTCvPACYT77Xl+j6reIEpATg8duKYCNv6YDSiSpa5rlfzOmZx+u6XgFpQX
	 F2VeBbPMOg6Iw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH RESEND v4 2/2] riscv: errata: thead: use pa based instructions for CMO
Date: Tue, 14 Nov 2023 22:33:38 +0800
Message-Id: <20231114143338.2406-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231114143338.2406-1-jszhang@kernel.org>
References: <20231114143338.2406-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_064607_898764_0F68A964 
X-CRM114-Status: UNSURE (   7.52  )
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
index c07d957b1468..b1c410bbc1ae 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -58,9 +58,9 @@ static bool errata_probe_pbmt(unsigned int stage,
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000000    11001     00000      000      00000  0001011
  */
-#define THEAD_INVAL_A0	".long 0x0265000b"
-#define THEAD_CLEAN_A0	".long 0x0255000b"
-#define THEAD_FLUSH_A0	".long 0x0275000b"
+#define THEAD_INVAL_A0	".long 0x02a5000b"
+#define THEAD_CLEAN_A0	".long 0x0295000b"
+#define THEAD_FLUSH_A0	".long 0x02b5000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
 #define THEAD_CMO_OP(_op, _start, _size, _cachesize)			\
@@ -79,23 +79,17 @@ asm volatile("mv a0, %1\n\t"						\
 
 static void thead_errata_cache_inv(phys_addr_t paddr, size_t size)
 {
-	void *vaddr = phys_to_virt(paddr);
-
-	THEAD_CMO_OP(INVAL, vaddr, size, riscv_cbom_block_size);
+	THEAD_CMO_OP(INVAL, paddr, size, riscv_cbom_block_size);
 }
 
 static void thead_errata_cache_wback(phys_addr_t paddr, size_t size)
 {
-	void *vaddr = phys_to_virt(paddr);
-
-	THEAD_CMO_OP(CLEAN, vaddr, size, riscv_cbom_block_size);
+	THEAD_CMO_OP(CLEAN, paddr, size, riscv_cbom_block_size);
 }
 
 static void thead_errata_cache_wback_inv(phys_addr_t paddr, size_t size)
 {
-	void *vaddr = phys_to_virt(paddr);
-
-	THEAD_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
+	THEAD_CMO_OP(FLUSH, paddr, size, riscv_cbom_block_size);
 }
 
 static const struct riscv_nonstd_cache_ops thead_errata_cmo_ops = {
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
