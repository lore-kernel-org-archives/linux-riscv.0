Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C9B1C47082
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 08:30:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144DB6024A
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 08:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 144DB6024A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k0kyLfVRYtedzEYDuhRIpi5b2GRH/g4MrszZ9el3vjU=; b=LBIS6zKiW9BlPv
	KNnPKhBCNX05L8OvZBGFAo8wMlyVU3p4C2zmDMzShRWo75YOCfCc+2CqXzzPShLhHlfqf5yGiwcGd
	mlAevrM8IzwrGkBueaeNl+Kuc6Y3/2hpWPpmCwzaYqq43A69lzIU2Ith8AlfyaasuH0NkE9IQgdmD
	tzOkHAs0ArOYbLCqULBzNKjuBbWemXKeuYG6vckoM0HO+LMyrEurbyY3ZnDdVv73ZfknorNWNyCka
	KfJjIXluyD+RMpiu0eFoc0qQMTZfb/6GmUSJtShqmOT7lJ5Veefic/559iyhTGA6+iWaQGJz7YuN8
	OHyX0aqJrf5VB8Xwc1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loik3-007hQ9-LJ; Thu, 03 Jun 2021 08:30:15 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loik0-007hLI-1M
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 08:30:13 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 1FD3710000D;
 Thu,  3 Jun 2021 08:30:02 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Christoph Hellwig <hch@infradead.org>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH v3 2/3] riscv: Introduce set_kernel_memory helper
Date: Thu,  3 Jun 2021 10:27:48 +0200
Message-Id: <20210603082749.1256129-3-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210603082749.1256129-1-alex@ghiti.fr>
References: <20210603082749.1256129-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_013012_251573_5793F71F 
X-CRM114-Status: UNSURE (   9.85  )
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

This helper should be used for setting permissions to the kernel
mapping as it takes pointers as arguments and then avoids explicit cast
to unsigned long needed for the set_memory_* API.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/include/asm/set_memory.h |  5 +++++
 arch/riscv/mm/pageattr.c            | 10 ++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 086f757e8ba3..7a411fed9e0e 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -16,6 +16,7 @@ int set_memory_rw(unsigned long addr, int numpages);
 int set_memory_x(unsigned long addr, int numpages);
 int set_memory_nx(unsigned long addr, int numpages);
 int set_memory_rw_nx(unsigned long addr, int numpages);
+int set_kernel_memory(char *start, char *end, int (*set_memory)(unsigned long, int));
 void protect_kernel_text_data(void);
 #else
 static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
@@ -24,6 +25,10 @@ static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
 static inline void protect_kernel_text_data(void) {}
 static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
+static inline int set_kernel_memory(char *start, char *end, int (*set_memory)(unsigned long, int))
+{
+	return 0;
+}
 #endif
 
 #if defined(CONFIG_64BIT) && defined(CONFIG_STRICT_KERNEL_RWX)
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 5e49e4b4a4cc..c47ac6a432ac 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -156,6 +156,16 @@ int set_memory_nx(unsigned long addr, int numpages)
 	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_EXEC));
 }
 
+int set_kernel_memory(char *startp, char *endp,
+		      int (*set_memory)(unsigned long start, int num_pages))
+{
+	unsigned long start = (unsigned long)startp;
+	unsigned long end = (unsigned long)endp;
+	int num_pages = PAGE_ALIGN(end - start) >> PAGE_SHIFT;
+
+	return set_memory(start, num_pages);
+}
+
 int set_direct_map_invalid_noflush(struct page *page)
 {
 	int ret;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
