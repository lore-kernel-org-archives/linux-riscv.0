Return-Path: <SRS0=syY9=G4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFA1C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 10:57:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3479723102
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Jan 2021 10:57:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3479723102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MLrL1f7KoQuAVbHxhj2ZXIrIJb0ubNKCO9ruBB0TjV0=; b=KVSQ4Wb9nHYthKAYH/UNh7UBWU
	Q11cZqhJ5LAlM7QD+Vr+5pBvS2OqJ/jo6oaR6ev3ATruOaq46jI9HpQL4TTXnUYqNFkPJlj/WZO1e
	NBn2FZ3MTWJd7B8m/oQgEBuv7sDQ3YY//pg1JXw60TekAfiRj1jm8dxsgJQZOun6iEv0XzweQJSZL
	5GUQu9Ji9fWdDUrwqhh+PgxDpsUmpaf90xqAHEHk7s9RuwlakBX+nNX/HqOPgWP0WgSPPpAf2fz/c
	lqxrS2sw/RmJnUdSwyrn1gDRxc6txJHZi7p1PGOBZic45wChWq3X827PZWy5iIgeMAc1AQ/yinR9m
	lJHSBasA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3zYQ-0003Tq-5f; Mon, 25 Jan 2021 10:57:06 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3zY1-0003F0-G5
 for linux-riscv@lists.infradead.org; Mon, 25 Jan 2021 10:56:42 +0000
Received: from dggeme703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4DPRbm2xQKzR7Hr;
 Mon, 25 Jan 2021 18:55:32 +0800 (CST)
Received: from huawei.com (10.175.113.32) by dggeme703-chm.china.huawei.com
 (10.1.199.99) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2106.2; Mon, 25
 Jan 2021 18:56:36 +0800
From: Chengyang Fan <cy.fan@huawei.com>
To: <palmer@dabbelt.com>
Subject: [PATCH] RISC-V: remove unneeded semicolon
Date: Mon, 25 Jan 2021 19:23:47 +0800
Message-ID: <20210125112347.1740981-1-cy.fan@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggeme703-chm.china.huawei.com (10.1.199.99)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_055641_808385_CD846FB5 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: joe@perches.com, linux-riscv@lists.infradead.org, cy.fan@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Remove a superfluous semicolon after function definition.

Signed-off-by: Chengyang Fan <cy.fan@huawei.com>
---
 arch/riscv/include/asm/set_memory.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 211eb8244a45..9fa510707012 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -22,7 +22,7 @@ static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
-static inline void protect_kernel_text_data(void) {};
+static inline void protect_kernel_text_data(void) {}
 static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
 #endif
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
