Return-Path: <SRS0=Pi2f=OD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 304FBC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 12:11:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31E460F9B
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Sep 2021 12:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F31E460F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sB1K5diNGel61aPtYf2ZNc9N9qIabFfjeS+Ay/D4sl8=; b=uaAJeQKSnLO0DF
	6KORgJHGNa7fqM1t6jtNYhB47Qp1sKNVaH47kwM7Hfa1vlKTQpj5aG09vBWNh26Xx5YaoFMVVKnDU
	ZxRFqOYyh+NeKjtLAXEJtiglRjow+7SRz1Dz67qPdhLiiV+n38awDnT6+Sw5JNryzAnhbWZIa8G6j
	XoWstrrs0dqE5B/YS5NlUhMOwLk9PDSpn9T71oLyc0TWcj1LPN/UXQ6kSvCteiArnKxeoCER+0K+9
	q2FP8KoiAWL/4Xc5KbWxAH/DTiP+2rx4qCFq0zj20MER81EcZrzaun47zdmPuGKM99ohZGuvDyQlh
	35Ulbs3bJQ97EotTEHiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPko6-001XxC-7j; Mon, 13 Sep 2021 12:11:30 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPknz-001Xu9-Ix
 for linux-riscv@lists.infradead.org; Mon, 13 Sep 2021 12:11:26 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4H7QKW52MHzW2Lq;
 Mon, 13 Sep 2021 20:10:23 +0800 (CST)
Received: from dggema756-chm.china.huawei.com (10.1.198.198) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Mon, 13 Sep 2021 20:11:22 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggema756-chm.china.huawei.com (10.1.198.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Mon, 13 Sep 2021 20:11:21 +0800
From: Chen Huang <chenhuang5@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Chen Huang <chenhuang5@huawei.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] riscv: Support DCACHE_WORD_ACCESS
Date: Mon, 13 Sep 2021 12:19:56 +0000
Message-ID: <20210913121956.1776656-3-chenhuang5@huawei.com>
X-Mailer: git-send-email 2.18.0.huawei.25
In-Reply-To: <20210913121956.1776656-1-chenhuang5@huawei.com>
References: <20210913121956.1776656-1-chenhuang5@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema756-chm.china.huawei.com (10.1.198.198)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_051123_837096_0DED570F 
X-CRM114-Status: GOOD (  12.30  )
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

This patch selects DCACHE_WORD_ACCESS on riscv and implements support
for load_unaligned_zeropad.

DCACHE_WORD_ACCESS uses the word-at-a-time API for optimised string
comparisons in the vfs layer.

Signed-off-by: Chen Huang <chenhuang5@huawei.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Kconfig                      |  1 +
 arch/riscv/include/asm/word-at-a-time.h | 36 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 6e70bf50b02a..f6f0da0f436b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
+	select DCACHE_WORD_ACCESS
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY if SMP
 	select GENERIC_ATOMIC64 if !64BIT
diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 7c086ac6ecd4..0b77ce654f56 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -11,6 +11,8 @@
 
 #include <linux/kernel.h>
 
+#include <asm/asm.h>
+
 struct word_at_a_time {
 	const unsigned long one_bits, high_bits;
 };
@@ -45,4 +47,38 @@ static inline unsigned long find_zero(unsigned long mask)
 /* The mask we created is directly usable as a bytemask */
 #define zero_bytemask(mask) (mask)
 
+/*
+ * Load an unaligned word from kernel space.
+ *
+ * In the (very unlikely) case of the word being a page-crosser
+ * and the next page not being mapped, take the exception and
+ * return zeroes in the non-existing part.
+ */
+static inline unsigned long load_unaligned_zeropad(const void *addr)
+{
+	unsigned long ret, tmp;
+
+	/* Load word from unaligned pointer addr */
+	asm(
+	"1:	" REG_L " %0, %3\n"
+	"2:\n"
+	"	.section .fixup,\"ax\"\n"
+	"	.balign 2\n"
+	"3:	andi	%1, %2, ~0x7\n"
+	"	" REG_L " %0, (%1)\n"
+	"	andi	%1, %2, 0x7\n"
+	"	slli	%1, %1, 0x3\n"
+	"	srl	%0, %0, %1\n"
+	"	jump	2b, %1\n"
+	"	.previous\n"
+	"	.section __ex_table,\"a\"\n"
+	"	.balign	" RISCV_SZPTR "\n"
+	"	" RISCV_PTR "	1b, 3b\n"
+	"	.previous"
+	: "=&r" (ret), "=&r" (tmp)
+	: "r" (addr), "m" (*(unsigned long *)addr));
+
+	return ret;
+}
+
 #endif /* _ASM_RISCV_WORD_AT_A_TIME_H */
-- 
2.18.0.huawei.25


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
