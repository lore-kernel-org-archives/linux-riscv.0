Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D598CA1009
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 19:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wuttm6CBvxew7HIIyFJnMalFEAHUUWamFKXcNQ5FUBo=; b=01pvoaGJ5LGWQA
	AMXRL2tJhCFBeBQoTLMdv8ZRt29hjogAYBnoXHuv+Hk/guQ5dlZ1XoyC+dJ4yuK3CVUOxWQUsTSl5
	tawRF54AiodJ1JC0/7iVJzo4RuYDBCuvrnfko2dxi0UZdVApge2olDxJJ8mCs7h813Y64pQMHclEa
	VOUjIfh6BYdj7ExoA8vLOonKZ1TfzYQhbswpw/wXwKRHnWsb1g95fO4+5j88K5zyWU2h1f5pqOSXD
	YQfRbG68VsqGB5WNgZGZyKokMioabqOhHhZHoU/1pTT2aLMkpxqh97hc6XuRlhP70VajZJuhbaA01
	tj2MOpJfddmSHpXV3Mdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utt0R-00000007Qvb-22GO;
	Wed, 03 Sep 2025 19:18:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utohA-00000006kiY-1dOR
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 14:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EDFE60238;
	Wed,  3 Sep 2025 14:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B4DC4CEE7;
	Wed,  3 Sep 2025 14:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756910563;
	bh=nKe5S8ycLOzlLVAPStN7aGZhiVpT24J1UIRxuEv2Yw8=;
	h=From:To:Cc:Subject:Date:From;
	b=Isyln6YfCyS8lm/je/aRbzCGEX8RBC3azcY6te/H1QmmZAwAdGXWCTYnHlTC1eHq9
	 C1XVkfEcGL9Rr4eHPtMzTxvUDtfRWDjRVB6+K4mTcOnjO44uzThp9//DsH/2G6r038
	 kdRYOPACCuVc8SDT5Bt8nF+3wsUxQ+zEcN9t4dH0E00hU7hXsAa0qZ4c4aEbXC6qkT
	 l2KH8vKj+amv2MqoXJJqRpuFi8beSwLULEbV6E+vJxaS1DG2DIduUlx2pY3Qw22yZg
	 4/HHOZHGfBfwprvr+7DJisicJ1e5i5DMdUuqGah88a7BMldfHemnL7b0q0b4SbydkN
	 szirxuc1qpmQw==
From: guoren@kernel.org
To: tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com
Cc: guoren@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	palmer@dabbelt.com,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] iommu/riscv: Use two individual 4-byte accesses for 8-byte register
Date: Wed,  3 Sep 2025 10:42:17 -0400
Message-Id: <20250903144217.837448-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

The RISC-V IOMMU memory-mapped register interface define:

The 8-byte IOMMU registers are defined in such a way that
software can perform two individual 4-byte accesses.

Therefore, use two individual 4-byte accesses for an 8-byte
register to make the driver compatible with a 32-bit-wide
interconnect.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 drivers/iommu/riscv/iommu.c |  7 +++++--
 drivers/iommu/riscv/iommu.h | 27 ++++++++++++++++++++-------
 2 files changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 0eae2f4bdc5e..9a80464ed7be 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -662,9 +662,12 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu)
 
 #define riscv_iommu_read_ddtp(iommu) ({ \
 	u64 ddtp; \
-	riscv_iommu_readq_timeout((iommu), RISCV_IOMMU_REG_DDTP, ddtp, \
-				  !(ddtp & RISCV_IOMMU_DDTP_BUSY), 10, \
+	u32 ddtp_lo, ddtp_hi; \
+	riscv_iommu_readl_timeout((iommu), RISCV_IOMMU_REG_DDTP, ddtp_lo, \
+				  !(ddtp_lo & RISCV_IOMMU_DDTP_BUSY), 10, \
 				  RISCV_IOMMU_DDTP_TIMEOUT); \
+	ddtp_hi = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_DDTP + 4); \
+	ddtp = ((u64)ddtp_hi << 32) | ddtp_lo; \
 	ddtp; })
 
 static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..698acffff298 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -69,18 +69,31 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
 #define riscv_iommu_readl(iommu, addr) \
 	readl_relaxed((iommu)->reg + (addr))
 
-#define riscv_iommu_readq(iommu, addr) \
-	readq_relaxed((iommu)->reg + (addr))
+static inline u64 riscv_iommu_readq(struct riscv_iommu_device *iommu,
+				      u16 addr)
+{
+	u32 val_lo, val_hi;
+
+	val_lo = readl_relaxed((iommu)->reg + (addr));
+	val_hi = readl_relaxed((iommu)->reg + (addr) + 4);
+
+	return (u64) val_lo | ((u64) val_hi << 32);
+}
 
 #define riscv_iommu_writel(iommu, addr, val) \
 	writel_relaxed((val), (iommu)->reg + (addr))
 
-#define riscv_iommu_writeq(iommu, addr, val) \
-	writeq_relaxed((val), (iommu)->reg + (addr))
+static inline void riscv_iommu_writeq(struct riscv_iommu_device *iommu,
+				      u16 addr, u64 val)
+{
+	u32 val_lo, val_hi;
 
-#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
-	readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, cond, \
-			   delay_us, timeout_us)
+	val_hi = (u32) (val >> 32);
+	val_lo = (u32) val;
+
+	writel_relaxed((val_hi), (iommu)->reg + (addr) + 4);
+	writel_relaxed((val_lo), (iommu)->reg + (addr));
+}
 
 #define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
 	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
