Return-Path: <SRS0=ovIN=HY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9ABFC433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 08:08:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 385CB64E67
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Feb 2021 08:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 385CB64E67
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p6nlFxtDX06TcoPTZaYZ7Kbf0ujci5qVQa6PptGnxBI=; b=jzt4upxbbeZIPsqKE9dhAVMztP
	UpaQ0x01YqxW0ZlWv2gvS8sowIvR/FxBF3TSLDUlA806mVhXrsSOYGBSCjijOkxAEbzOlnligrPf/
	v6iQV4D7GcrQIKqW9tsNaNldU7rArPgvykfOx+7oo3tl9uObCqFbSEKpbubGB/I+hM7l/l02HKqBw
	yk9N0Kr0IWGN+raU6oNWQuFMgBY4QB5cKaUY/gtYnk2mAscyza5H83rMqt1/e3auGdOeoO+bgnQHU
	MTP6pxBjQQtxZLnBTELsrhE8j1Ni5gC83EwLzX/OtHIzAywGJkM4zlXYVGn8lbxvOpoQs15xzkia1
	SgK/OY3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE6GG-0001mF-3O; Mon, 22 Feb 2021 08:08:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE6GD-0001lq-EM
 for linux-riscv@lists.infradead.org; Mon, 22 Feb 2021 08:08:06 +0000
X-Originating-IP: 81.185.166.122
Received: from localhost.localdomain (122.166.185.81.rev.sfr.net
 [81.185.166.122]) (Authenticated sender: alex@ghiti.fr)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 13306C0006;
 Mon, 22 Feb 2021 08:07:56 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Pass virtual addresses to kasan_mem_to_shadow
Date: Mon, 22 Feb 2021 03:07:34 -0500
Message-Id: <20210222080734.31631-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_030805_616614_9268469D 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

kasan_mem_to_shadow translates virtual addresses to kasan shadow
addresses whereas for_each_mem_range returns physical addresses: it is
then required to use __va on those addresses before passing them to
kasan_mem_to_shadow.

Fixes: b10d6bca8720 ("arch, drivers: replace for_each_membock() with for_each_mem_range()")
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/mm/kasan_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 4b9149f963d3..6d3b88f2c566 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -148,8 +148,8 @@ void __init kasan_init(void)
 			(void *)kasan_mem_to_shadow((void *)VMALLOC_END));
 
 	for_each_mem_range(i, &_start, &_end) {
-		void *start = (void *)_start;
-		void *end = (void *)_end;
+		void *start = (void *)__va(_start);
+		void *end = (void *)__va(_end);
 
 		if (start >= end)
 			break;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
