Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2F7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jan 2022 16:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aY7VxQTnhM11D7gOl1wY+gAqr7zseVqNLMx9Wu6QaC0=; b=Rc54w60UX2SVea
	APRxkdYibxybQQnheBMgiS96lS1vTM3bdj0YhsO30siM3j3JZowEhKv0V6KnZNGNhALeXDXyHeAdE
	O3FUgCVLUMyOrP5VSSWNYYBykf5vS4EJ2AaZtsldmKS3JZeVRx+J54yI83utVanI3c6Cjo8BqEYBM
	hWSt1acaQNwAgDRuYbLPn2Edb3h5xp2rsTl0iyKhLwe7H/wP7XqJakBYqe7emF5r10pOzMVvnDCti
	T6x2LcMJloCCl4JTKgLDqrsC1PYkASSlGdxDyFBLWKh3oj3ZtE2LOXeeUctZ0vN6QiDuJkTTpuEHz
	5k63JeR9eMdwWrToBojw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAwuX-00FZWg-Bf; Fri, 21 Jan 2022 16:37:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAwuV-00FZTo-24
 for linux-riscv@lists.infradead.org; Fri, 21 Jan 2022 16:37:12 +0000
Received: from p508fcef5.dip0.t-ipconnect.de ([80.143.206.245]
 helo=phil.fritz.box)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nAwuF-0008GA-I7; Fri, 21 Jan 2022 17:36:55 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, wefu@redhat.com,
 liush@allwinnertech.com, guoren@kernel.org, atishp@atishpatra.org,
 anup@brainfault.org, drew@beagleboard.org, hch@lst.de, arnd@arndb.de,
 wens@csie.org, maxime@cerno.tech, dlustig@nvidia.com,
 gfavor@ventanamicro.com, andrea.mondelli@huawei.com, behrensj@mit.edu,
 xinhaoqu@huawei.com, huffman@cadence.com, mick@ics.forth.gr,
 allen.baum@esperantotech.com, jscheid@ventanamicro.com, rtrauben@gmail.com,
 samuel@sholland.org, cmuellner@linux.com, philipp.tomsich@vrull.eu,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 01/14] riscv: only use IPIs to handle cache-flushes on
 remote cpus
Date: Fri, 21 Jan 2022 17:36:05 +0100
Message-Id: <20220121163618.351934-2-heiko@sntech.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220121163618.351934-1-heiko@sntech.de>
References: <20220121163618.351934-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_083711_137102_4C0A2738 
X-CRM114-Status: GOOD (  14.91  )
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

Right now, the flush_icache functions always use the SBI remote-fence
when SBI is available, leaving using IPIs as a fallback mechanism.

IPIs on the other hand are more flexible, as the ipi_ops are initially
set to go through SBI but later will be overwritten to go through the
ACLINT/CLINT.

In a discussion we had, Nick was of the opinion that "In general we
should prefer doing IPIs on S-mode through CLINT instead of going
through SBI/M-mode, so IMHO we should only be using
on_each_cpu_mask(ipi_remote_fence_i) on flush_icache_all()/
flush_icache_mm() and remove any explicit calls to sbi_remote_fence_i(),
because this way we continue using SBI for doing remote fences even after
CLINT/ACLINT driver is registered, instead of using direct IPIs through
CLINT/ACLINT."

So follow this suggestion and just do ipi calls to have the proper kernel
parts do them,

This also fixes the null-ptr dereference happening when flush_icache_all()
is called before sbi_init().

Suggested-by: Nick Kossifidis <mick@ics.forth.gr>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/mm/cacheflush.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..c35375cd52ec 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -17,11 +17,7 @@ static void ipi_remote_fence_i(void *info)
 void flush_icache_all(void)
 {
 	local_flush_icache_all();
-
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
-		sbi_remote_fence_i(NULL);
-	else
-		on_each_cpu(ipi_remote_fence_i, NULL, 1);
+	on_each_cpu(ipi_remote_fence_i, NULL, 1);
 }
 EXPORT_SYMBOL(flush_icache_all);
 
@@ -66,8 +62,6 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
-		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
 	}
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
