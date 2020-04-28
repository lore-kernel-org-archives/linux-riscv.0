Return-Path: <SRS0=EOV2=6M=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3485BC83000
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2020 06:34:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05FDE2051A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 28 Apr 2020 06:34:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AhXNFU70"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05FDE2051A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N+uJ2FZ6nPBurFnYei9Yzh6v3SRVhgG13ryHveEeuao=; b=AhXNFU70atGcANIWbaE/dY6ZCZ
	BPNjV68coXsl1vA0fIaB4mgU9kK7HodJIO2ePhLQetq2tKGj+r/XP2/ta7sW0EyK1B3M56ksdR9W6
	VJoa1wDMSuOfDHWKKrlrfsa6qCC6T/tOqVReIF2jWAS9oxfWbQOMQ7nblbvOlqP2N8gi4TQnkf3wl
	wSLbXaaywpxTe02TnenE7WZv8ofgNUo1Wr3MhITU3jUZh7Wt9RrI6CED5tHlcna7SybMD9UMmFGa0
	snDad1JRwNc7NzD4PPH8sEvb8ZA0KBCz9MxV9D1ABggC0mYY2bXovzEWhi5+oyNtiJUCcdc1dRX36
	mu8DmGqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTJon-0005zp-IG; Tue, 28 Apr 2020 06:34:09 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTJol-0005ye-43
 for linux-riscv@lists.infradead.org; Tue, 28 Apr 2020 06:34:08 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BC3706C49FD3CD5A717C;
 Tue, 28 Apr 2020 14:34:02 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Tue, 28 Apr 2020
 14:33:53 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <aryabinin@virtuozzo.com>, <glider@google.com>, <dvyukov@google.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <nickhu@andestech.com>, <zong.li@sifive.com>, <kasan-dev@googlegroups.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] riscv: remove unneeded semicolon in kasan_init.c
Date: Tue, 28 Apr 2020 14:33:19 +0800
Message-ID: <20200428063319.44539-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_233407_328553_F0F113B6 
X-CRM114-Status: UNSURE (   7.79  )
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
Cc: Jason Yan <yanaijie@huawei.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Fix the following coccicheck warning:

arch/riscv/mm/kasan_init.c:103:2-3: Unneeded semicolon

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 arch/riscv/mm/kasan_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index ec0ca90dd900..dfe988dd0ceb 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -100,7 +100,7 @@ void __init kasan_init(void)
 			break;
 
 		populate(kasan_mem_to_shadow(start), kasan_mem_to_shadow(end));
-	};
+	}
 
 	for (i = 0; i < PTRS_PER_PTE; i++)
 		set_pte(&kasan_early_shadow_pte[i],
-- 
2.21.1


