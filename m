Return-Path: <SRS0=OKTc=LX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E410C11F66
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 09:14:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E6E61DBC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jun 2021 09:14:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E6E61DBC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HOWjrtHeNbcVWqQ45HVONKk9MwgPrE3T17kayYZdi6E=; b=TrKjUAztwpPTlt
	ohCdhF67WEYXdCAvyDi59gnxAqpRBEiWB1N8KgwRDzVYmB7dtZ400Uu4YSj6fZm0CM3mTRulMM5JO
	IZf6d/n5enwTCu62Mg7e6gA5GFRyEA6+gHIb/kK3rkPC3+DtZIwlyTdJWqr3Cy2XkiFDWIYGxOzXR
	mXfDeTE3yHxmlK/s3Go+9Kb4js9Oybu/NF9Gp5wR7bEk4T2iQg7L/nnHaWYjZZ2qdQ93sV/Kll07E
	+TtTSbHlxYY6SIbLp3B8H/ZjkAcwzEVAxwjPhwObJIthM5AU46RhG/7C5ocUlO9ElyOyoof1OxSbQ
	xfF2NbBSirwjKhdov8YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly9om-00ALQx-JQ; Tue, 29 Jun 2021 09:14:08 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly9oh-00ALQD-RB
 for linux-riscv@lists.infradead.org; Tue, 29 Jun 2021 09:14:05 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id C57F724000F;
 Tue, 29 Jun 2021 09:13:56 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 1/3] riscv: Fix memory_limit for 64-bit kernel
Date: Tue, 29 Jun 2021 11:13:46 +0200
Message-Id: <20210629091349.3802690-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_021404_061093_B99BBD59 
X-CRM114-Status: GOOD (  11.51  )
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

As described in Documentation/riscv/vm-layout.rst, the end of the
virtual address space for 64-bit kernel is occupied by the modules/BPF/
kernel mappings so this actually reduces the amount of memory we are able
to map and then use in the linear mapping. So make sure this limit is
correctly set.

Fixes: c9811e379b21 ("riscv: Add mem kernel parameter support")
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/init.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 12f956b3a674..04a5db3a9788 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -124,10 +124,17 @@ void __init mem_init(void)
 }
 
 /*
- * The default maximal physical memory size is -PAGE_OFFSET,
- * limit the memory size via mem.
+ * The default maximal physical memory size is -PAGE_OFFSET for 32-bit kernel,
+ * whereas for 64-bit kernel, the end of the virtual address space is occupied
+ * by the modules/BPF/kernel mappings which reduces the available size of the
+ * linear mapping.
+ * Limit the memory size via mem.
  */
+#ifdef CONFIG_64BIT
+static phys_addr_t memory_limit = -PAGE_OFFSET - SZ_4G;
+#else
 static phys_addr_t memory_limit = -PAGE_OFFSET;
+#endif
 
 static int __init early_mem(char *p)
 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
