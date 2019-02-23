Return-Path: <SRS0=x6/5=Q6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1CD1C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Feb 2019 21:04:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0C2120675
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Feb 2019 21:04:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iv205pj9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KW9CJLIf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0C2120675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gq7V0iJMRiolNuli6xZnBX8Vp6+ADsUH0e89eHX7Ms8=; b=iv205pj9gz/ojO
	ScorYxhCowT4k6iawAG0PoYShmqaUoOuuZsZ0Ywd0gjtXg5HMFq6KJnNd8uL5lGMt8kzdbTymYKNM
	y8rG3WOMhD4nVw+W+xWJrN4jbg97CkGC3phusmtWN+U3TqdZBYAUIRycamPr4lFTlwQZBn4uibbtl
	T75PQAqaCI7VYha5kzLbYhm9RRUeu50mMQeC84ALtBeMSf/yqbQ20inSwCa1lekPhJJBuRW8qLKqx
	ySv89T3MZPI1pAUhCllVI7DE3WCEkkCjEfEpFyUnjJt4eJS3y8/sed3xr8B+0a2VycGKgGPklwuDV
	LMcaxaJw0yjBAyOmhykg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxeTd-0006m7-GC; Sat, 23 Feb 2019 21:04:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxeTa-0006lA-6a
 for linux-riscv@lists.infradead.org; Sat, 23 Feb 2019 21:04:51 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97AA620657;
 Sat, 23 Feb 2019 21:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1550955889;
 bh=ZyVpxJRUQVxsfZiAbexvAJe043y+xlvy5OCw+IHPibk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KW9CJLIfmIVV9cbtwDwrS5SLdUJjCjsQ1sDIioHVNT2rUCQAhDcg+1DpCdf+CCOZV
 sGtScaQKp09l5P7h2dkiAXXIzvFiHhyesm0fnkbETwAhWo1Wz4wlZVRlLLUesS2ZA9
 bRC1xEUZ8FDYdlu9AZFlga0uann8R1YeX0lpZu4k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 16/72] riscv: fixup max_low_pfn with PFN_DOWN.
Date: Sat, 23 Feb 2019 16:03:26 -0500
Message-Id: <20190223210422.199966-16-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190223210422.199966-1-sashal@kernel.org>
References: <20190223210422.199966-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190223_130450_255180_083C522F 
X-CRM114-Status: UNSURE (   9.29  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>, Mao Han <mao_han@c-sky.com>,
 Guo Ren <ren_guo@c-sky.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <ren_guo@c-sky.com>

[ Upstream commit 28198c4639b39899a728ac89aea29d2a7a72562f ]

max_low_pfn should be pfn_size not byte_size.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Signed-off-by: Mao Han <mao_han@c-sky.com>
Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/setup.c | 2 +-
 arch/riscv/mm/init.c      | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 2c290e6aaa6e4..6d652826b5cbd 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -196,7 +196,7 @@ static void __init setup_bootmem(void)
 	BUG_ON(mem_size == 0);
 
 	set_max_mapnr(PFN_DOWN(mem_size));
-	max_low_pfn = memblock_end_of_DRAM();
+	max_low_pfn = PFN_DOWN(memblock_end_of_DRAM());
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	setup_initrd();
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 1d9bfaff60bca..658ebf645f420 100644
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
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
