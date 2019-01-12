Return-Path: <SRS0=bvH1=PU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B590CC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 08:16:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 858C92086C
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 12 Jan 2019 08:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i3dU0l/S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="tCGRExQm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 858C92086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hxZxmgj7d4jbzPvwOHIoVBFA6fGAJPatOkYlner08VM=; b=i3d
	U0l/SC5CFxpIIdZ0AgbVPMy9DkTDT3SH8QYlA9K8oMW8yyl7xdApqzwlHTpnJ23J8BJ++ERY0AB6o
	S0EzDlya3BuOlBR0RchojHsjsB7LOVGgjHoFGqAWqcvGy5T1iZHOmY/cF7/h2VugbxjupSWAOTrWV
	MghcjdCFSPqdzSNqgOfdm5iKovxsn1KS19DzmWTtj57KMWKEPeyHRKmDkNfilfnvRh1Y7EKg8PMMc
	MGXkFtr5G3XBOIKiadSRsW1eg6KXVmXY3E2StOU7wV9NNbp3fKwbkwgwtbS5uGM0KWiIxruhGlfXu
	KhuLU6AC63Y56sqpjw7TS+OyP4iD0Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1giETD-0007cO-9e; Sat, 12 Jan 2019 08:16:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1giET8-0007bW-Dw
 for linux-riscv@lists.infradead.org; Sat, 12 Jan 2019 08:16:41 +0000
Received: from localhost.localdomain (unknown [115.192.188.222])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D21D2086C;
 Sat, 12 Jan 2019 08:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547280996;
 bh=MRJzkrosj38Z55pRXmQuVWQuvmzgOFyBj+f0xMV3Vec=;
 h=From:To:Cc:Subject:Date:From;
 b=tCGRExQmfamGllgyCc1SAGCamRmHe22wWhdsCZt/FgWjaaUgSLdN9VHDb1ed61ORP
 myMLwUaKOoqBCr1oCPlbG2UOwk6uJOmoZP9/dujsQtMEVrxgBgR8qE5RgjagaqJDzI
 5cmza9VaWY3/6AW5OgmtebN+wWC+7782jDLDSDAA=
From: guoren@kernel.org
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH] riscv: fixup max_low_pfn with PFN_DOWN.
Date: Sat, 12 Jan 2019 16:16:27 +0800
Message-Id: <1547280987-7630-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190112_001638_487957_1E80B92C 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guo Ren <ren_guo@c-sky.com>,
 Mao Han <mao_han@c-sky.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

max_low_pfn should be pfn_size not byte_size.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Mao Han <mao_han@c-sky.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 arch/riscv/kernel/setup.c | 2 +-
 arch/riscv/mm/init.c      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index fc8006a..5463e67 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -174,7 +174,7 @@ static void __init setup_bootmem(void)
 	BUG_ON(mem_size == 0);
 
 	set_max_mapnr(PFN_DOWN(mem_size));
-	max_low_pfn = memblock_end_of_DRAM();
+	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	setup_initrd();
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 1d9bfaf..658ebf6 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -28,7 +28,8 @@ static void __init zone_sizes_init(void)
 	unsigned long max_zone_pfns[MAX_NR_ZONES] = { 0, };
 
 #ifdef CONFIG_ZONE_DMA32
-	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G, max_low_pfn));
+	max_zone_pfns[ZONE_DMA32] = PFN_DOWN(min(4UL * SZ_1G,
+			(unsigned long) PFN_PHYS(max_low_pfn)));
 #endif
 	max_zone_pfns[ZONE_NORMAL] = max_low_pfn;
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
