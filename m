Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02362C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 17:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EMudir6g1+N2h+UB3xHkLMAr0LJQDvTm/OBcjLPveS8=; b=vJoaQjDYsKOObw
	SoKjh4KA+UI0fpUOMRPAee/wmkGDKPggctFPkIuZSvsmHgxdc7NdQ5c00abutgLQjuAzKJI6tQRhE
	cxbEFVFCjp+8SSuoz42QLddYD0OS15svk4s1G02twLkucJn6JEsWYvjeKHJxkkuR13QnATLzHobk1
	lKFoBTYuHbGSkxlhRIq7V4tzYaouTHp1IqFMJ2XCMhnG+oT59/2YgrAk26pZ6ncqGjuRnCyCgnEwC
	XN4/OdM13+vMIXHUXc8vh8kr9YfeghDm88OTLklfLwt7v8ypUmHdLK3pAmJ3rWB5Zi/mtZfJRw0UY
	mdYiUe3z4QkEJCfMjlng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4l8b-0000000GN3y-3VIc;
	Wed, 08 May 2024 17:31:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4l8T-0000000GMy2-0ro6
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 17:31:27 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1715189477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e0C2Sa+Ice2dYwvVccSs+oEF61GNXb4TH0cOy9XvlW8=;
	b=vVy8qvlNC9U0HL2SlYgzFblLB2M/X/P8pfzpzJ4LpdWDbp8//PosSd/F2PXXMRXrBe1Wzg
	1LzA3td9kat51Jc8GuvETVYD2+qoYYR+PWHAPKzK3s4NAm1kUhE8eaQmTwvcKm+YQNt1M4
	YX6O0ulNQL1LZ5ajog5ZCR+K02uUZXDo/+56v/oN87trdlC9iT6ns2LEymm83jybi9z5AT
	fBPwPZrZyey/9Kl228nQMrabMjg1xTTlKkACNpgUTtb+XMM7a7Q4yD7Iuji7oXzimqOH5I
	tligCfg9qTbOSK/tkQI06N50S60LiUjf+0UVhWvoZEfSUf8T+jCCiAB9FBVAeA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1715189477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=e0C2Sa+Ice2dYwvVccSs+oEF61GNXb4TH0cOy9XvlW8=;
	b=TsFzMXTanDnoOVXl77mMiaef1NFwhltDqMAasvptpJf/7jgoCJeeoEHVkKnclZxfZry7Yc
	pLz85r9eP42S+yDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Don't use hugepage mappings for vmemmap if it's not supported
Date: Wed,  8 May 2024 19:31:16 +0200
Message-Id: <20240508173116.2866192-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_103122_415513_5BEFCD9D 
X-CRM114-Status: UNSURE (   8.07  )
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

Commit ff172d4818ad ("riscv: Use hugepage mappings for vmemmap") broke XIP
kernel, because huge pages are not supported on XIP kernel.

Only use hugepage mapping if it is supported.

Fixes: ff172d4818ad ("riscv: Use hugepage mappings for vmemmap")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: <stable@vger.kernel.org>
---
 arch/riscv/mm/init.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 968761843203..c081e7d349b1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1414,6 +1414,8 @@ int __meminit vmemmap_check_pmd(pmd_t *pmdp, int node,
 int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 			       struct vmem_altmap *altmap)
 {
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return vmemmap_populate_basepages(start, end, node, NULL);
 	/*
 	 * Note that SPARSEMEM_VMEMMAP is only selected for rv64 and that we
 	 * can't use hugepage mappings for 2-level page table because in case of
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
