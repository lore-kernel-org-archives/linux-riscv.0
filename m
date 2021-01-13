Return-Path: <SRS0=HZsE=GQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA187C433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 02:25:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 251C5230FC
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jan 2021 02:25:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 251C5230FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=URbL3DLYKQrH03+yoQrVcK8kkTn2F84fv4nVkNJ7vvQ=; b=0hzcQH6F7ALphITAR7a7yVD1A7
	yWWeWp+S3bMPb0bQ9WQ6jLaXRee3QmT6ZRKaklU4ePXu1cUU1bd4QdXm+psBrUIh5XzWKKvE5PPWd
	TtmHEy54F2+FWp5go3S3ROIsNV33I8SSx8AYOwGtZjKUg9eAszoGeULF12mTGBci7Kg0oFdvI+CNg
	WMDaXSjhYuBxk3JNFjvrbquMQE1i4rVHf1TL9Ae1UTi2pyDBdc5wEdRY79qfEMYQH3N3p/yjTOMMg
	2YBp3noA0thENIFEB3SK2GsBnzTSZBoibeu8h5n0HzElLflHTmfLbMqXkx7Qk9+YBr7eFYZl4sN6V
	g48woTeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzVqE-0000eh-9H; Wed, 13 Jan 2021 02:24:58 +0000
Received: from atcsqr.andestech.com ([60.248.187.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzVqA-0000cN-Nv
 for linux-riscv@lists.infradead.org; Wed, 13 Jan 2021 02:24:56 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 10D2LWuX038877;
 Wed, 13 Jan 2021 10:21:32 +0800 (GMT-8)
 (envelope-from nylon7@andestech.com)
Received: from atcfdc88.andestech.com (10.0.15.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.487.0;
 Wed, 13 Jan 2021 10:24:12 +0800
From: Nylon Chen <nylon7@andestech.com>
To: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] riscv: Fix KASAN memory mapping.
Date: Wed, 13 Jan 2021 10:24:10 +0800
Message-ID: <20210113022410.9057-1-nylon7@andestech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 10D2LWuX038877
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_212455_182653_CCC54319 
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
Cc: aou@eecs.berkeley.edu, nickhu@andestech.com, alankao@andestech.com,
 kasan-dev@googlegroups.com, nylon7@andestech.com, aryabinin@virtuozzo.com,
 glider@google.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 dvyukov@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Nick Hu <nickhu@andestech.com>

Use virtual address instead of physical address when translating
the address to shadow memory by kasan_mem_to_shadow().

Signed-off-by: Nick Hu <nickhu@andestech.com>
Signed-off-by: Nylon Chen <nylon7@andestech.com>
---
 arch/riscv/mm/kasan_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 12ddd1f6bf70..a8a2ffd9114a 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -93,8 +93,8 @@ void __init kasan_init(void)
 								VMALLOC_END));
 
 	for_each_mem_range(i, &_start, &_end) {
-		void *start = (void *)_start;
-		void *end = (void *)_end;
+		void *start = (void *)__va(_start);
+		void *end = (void *)__va(_end);
 
 		if (start >= end)
 			break;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
