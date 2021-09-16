Return-Path: <SRS0=Rh5D=OG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212C7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 13:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E37FC6124E
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Sep 2021 13:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E37FC6124E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/DCoC5/VYRHxxZNEQHa8XbTym1Cq2xR5c+Qob+/NDmQ=; b=IDZQhdObtRijLs
	fBJM4SMqgQP482ahy2y5hQmWtLdmDqPfEQMfpx+bVJXGj+JGWD/CO4mytfcvB9JPKPrgm0TR08kds
	KFW67HNsz9YHpvcBUjaw7T7XMDeQwyjMXkhuZ1a/9iJypOaSUwiQ27V5b9PzcqxaX/nrGqE9UCDYa
	huFeB0y6HREWSpPRMiaJlISsyvFuNzdW2D5GNsVGePrOZHyymwv9e2flNt8CRAWXdgiKEGHe5ich/
	csse5nZmmQoz2dSOLEMNyZLVQ7da0+J7qNnbGFQaPRLfZQMcj9TKzyI2HnweUVcLvPs/LBc7L6S3p
	l8b2+PKnrH11ZDqkoo3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQr0M-00BCDM-Rb; Thu, 16 Sep 2021 13:00:42 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQr02-00BCAz-GO
 for linux-riscv@lists.infradead.org; Thu, 16 Sep 2021 13:00:24 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4H9HH20R2jz8tC9;
 Thu, 16 Sep 2021 20:59:42 +0800 (CST)
Received: from dggema756-chm.china.huawei.com (10.1.198.198) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.8; Thu, 16 Sep 2021 21:00:20 +0800
Received: from localhost.localdomain (10.175.112.125) by
 dggema756-chm.china.huawei.com (10.1.198.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2308.8; Thu, 16 Sep 2021 21:00:19 +0800
From: Chen Huang <chenhuang5@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Chen Huang <chenhuang5@huawei.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>, Darius Rad <darius@bluespec.com>, Jisheng Zhang
 <jszhang3@mail.ustc.edu.cn>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 2/2] riscv: Support DCACHE_WORD_ACCESS
Date: Thu, 16 Sep 2021 13:08:55 +0000
Message-ID: <20210916130855.4054926-3-chenhuang5@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916130855.4054926-1-chenhuang5@huawei.com>
References: <20210916130855.4054926-1-chenhuang5@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema756-chm.china.huawei.com (10.1.198.198)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_060022_828592_97A35B7C 
X-CRM114-Status: GOOD (  11.49  )
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
 arch/riscv/include/asm/word-at-a-time.h | 37 +++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index cd0be39d4c08..4e98ff76977f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -44,6 +44,7 @@ config RISCV
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
+	select DCACHE_WORD_ACCESS if HAVE_EFFICIENT_UNALIGNED_ACCESS
 	select EDAC_SUPPORT
 	select GENERIC_ARCH_TOPOLOGY if SMP
 	select GENERIC_ATOMIC64 if !64BIT
diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 7c086ac6ecd4..8f4ad1ec39fb 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -45,4 +45,41 @@ static inline unsigned long find_zero(unsigned long mask)
 /* The mask we created is directly usable as a bytemask */
 #define zero_bytemask(mask) (mask)
 
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+#include <asm/asm.h>
+
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
+#endif	/* DCACHE_WORD_ACCESS */
 #endif /* _ASM_RISCV_WORD_AT_A_TIME_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
