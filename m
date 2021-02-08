Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B7EFC433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:32:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17C8F64E85
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 19:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17C8F64E85
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EaO4GT0oPZp1ag+4uIQD7JAjvHUSp8hzuUyUn+6nhRg=; b=KbLdSFnup+WUQnIVhcgZKoGIG
	OP9mgdKFGcU30msI/w0xFWQhbDbqp77/x6AN/GuAED0Tk/lBlYtvETb2X1owEdoCt0Grl7B1bMp7q
	JnUUn4cf1Bre+Mlg/wLujf+CxwoS9gIb3uTr9e9ZlSei9glglCqtZOo2IrHVUIOP1p9Ncp4SLJZIw
	ldntNm1YZhc/wGOBMoeS/GZGnO4IIpkhzd9VOj9Hkpj8NCB32xqf+F/NmReUA4jneFNxifAS19om8
	1o6dT0yVdnpf/2074G/LN1LvcY5No7m7b1Y8F9bry6zmMwO5JOfyKllyK9SQM7DgUjoZJI18sC4qq
	AHZkSjewA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9CGw-0007GO-AA; Mon, 08 Feb 2021 19:32:34 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9CGu-0007FZ-5T
 for linux-riscv@lists.infradead.org; Mon, 08 Feb 2021 19:32:32 +0000
X-Originating-IP: 2.7.49.219
Received: from debian.home (lfbn-lyo-1-457-219.w2-7.abo.wanadoo.fr
 [2.7.49.219]) (Authenticated sender: alex@ghiti.fr)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 287DA20003;
 Mon,  8 Feb 2021 19:32:28 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] riscv: Use KASAN_SHADOW_INIT define for kasan memory
 initialization
Date: Mon,  8 Feb 2021 14:30:15 -0500
Message-Id: <20210208193017.30904-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210208193017.30904-1-alex@ghiti.fr>
References: <20210208193017.30904-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_143232_298908_429A8C02 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Instead of hardcoding memory initialization to 0, use KASAN_SHADOW_INIT.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/kasan_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index a8a2ffd9114a..7bbe09416a2e 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -80,7 +80,7 @@ static void __init populate(void *start, void *end)
 				__pgprot(_PAGE_TABLE)));
 
 	local_flush_tlb_all();
-	memset(start, 0, end - start);
+	memset(start, KASAN_SHADOW_INIT, end - start);
 }
 
 void __init kasan_init(void)
@@ -108,6 +108,6 @@ void __init kasan_init(void)
 			       __pgprot(_PAGE_PRESENT | _PAGE_READ |
 					_PAGE_ACCESSED)));
 
-	memset(kasan_early_shadow_page, 0, PAGE_SIZE);
+	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	init_task.kasan_depth = 0;
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
