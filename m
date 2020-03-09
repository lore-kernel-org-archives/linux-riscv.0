Return-Path: <SRS0=yxlK=42=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E489FC10F29
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 08:22:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAEDD20848
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 08:22:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tzY11MCp";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="awPv9oW3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAEDD20848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44ohgZ8deiXiTIWwACgPHy8hMdjRJxnancDlAiZcvyo=; b=tzY11MCpsYjj2F
	nnonihzrsmEvloi/2evVhXujOQDRmhtZyquf8u49DeNS+d5cNtKD4eqI9fm37EC5YT9ytvIf5fjes
	4+x26j4LSt/mI99SIyjDeRzW7KQcC0Q0Uz5k/7Qndcwq4ycvX64fArPqwErV9tA5zjfOos7qaWsW8
	+Jk3hDaF9v30NHol3HGXlJsKC/y/R0L7n3E/XlhXdOW4Qh4YMQkt8BfFI7KoEkc+XTxzg/LFL9bGY
	2cG8QwLQ4V/1U83w26qhjBaAjb6KleukKRun4w6reExzEYDlLiukf0eVnv0cma7cCDclPRfTOsC/L
	vXK6U2XJ31VsiaIHtIuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBDgc-00067z-VG; Mon, 09 Mar 2020 08:22:54 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBDgW-0005y3-0o
 for linux-riscv@lists.infradead.org; Mon, 09 Mar 2020 08:22:49 +0000
Received: by mail-pf1-x441.google.com with SMTP id i13so4497663pfe.3
 for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2020 01:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=44ohgZ8deiXiTIWwACgPHy8hMdjRJxnancDlAiZcvyo=;
 b=awPv9oW3EDFrhC3b4wM/bLCaObQLwOZcmR0v3cSNMbRubNZydG4GBRmw2qgyDfscSV
 3Da8e+Kvt0g9MmNe51rnNWHxdbfGfqfJAMCOBqjzLWnwogCLPHk9Tyus3c7GaE4sSV9M
 EI5bwBc6VD4DcMCAn+2O9vCfIMv8duwyf6+OUtGTL3iC10/ZvECvsWmp131n3nqNJcKp
 K1agHyJswK88v5mgWvRofyoIY3aW5JB9LXSTux6LcZgxwXnVOorb2aLXmQ3EYhU6OPwd
 GV+5gwz1cpF96eUpXy9ck6Hh8y5RUvJ4AfOWRwM44o83zJMda12rMhfGDKjr7GHTf5oe
 nxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=44ohgZ8deiXiTIWwACgPHy8hMdjRJxnancDlAiZcvyo=;
 b=MlFm8BskrabHKEGENOZlf04akVqBPgIkYFi0ePt3ym6B3UdLvu7bAe1GGSIwZnYNpz
 4MbZP4sOazfljiTnKuJjwpQRGkoEO8676QpICEWY148lUpNssentxlJEgZX7uBmu/a/T
 IDNaPoLgqRmcD/BHhcSmvEdzxxhy999iyqpZm4pP2V2E+6ECEylm7WF6l7R4YEWc7Ujq
 R0k0kne+GDHErBIGK375AJ7tPtO9QG+suA9J53xl4YnjRH5aUphbjp4XwgOrYQ/UtPS+
 p/BRcfvAFaZEjoGgLM6WumgFyVVg9h38JTWobKoPSRoPQqUZa/MCbBLqEhYXilyNL+0z
 4u4w==
X-Gm-Message-State: ANhLgQ11Mzq9f8Ql6zXzGGXVDLJOWggaz/hcMmUx3BD5RgMSRyW6E7P8
 LV68knfQpa/pY5KFzYSKLSmoug==
X-Google-Smtp-Source: ADFU+vtQuVeRfU0FUd3mIl1FEf4n9oKe/9HwnFdEtQ1z449xsA5qMr8VjoM1AtqtwOJNIq/dL7exOg==
X-Received: by 2002:a63:161e:: with SMTP id w30mr15126334pgl.110.1583742167548; 
 Mon, 09 Mar 2020 01:22:47 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id v5sm18364779pfn.64.2020.03.09.01.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 01:22:47 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] riscv: add alignment for text, rodata and data sections
Date: Mon,  9 Mar 2020 16:22:25 +0800
Message-Id: <dc6082fd444e6999d9fe965f05d798a71258e800.1583741997.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1583741997.git.zong.li@sifive.com>
References: <cover.1583741997.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_012248_101156_29EF5DDB 
X-CRM114-Status: GOOD (  11.65  )
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
Cc: Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The kernel mapping will tried to optimize its mapping by using bigger
size. In rv64, it tries to use PMD_SIZE, and tryies to use PGDIR_SIZE in
rv32. To ensure that the start address of these sections could fit the
mapping entry size, make them align to the biggest alignment.

Define a macro SECTION_ALIGN because the HPAGE_SIZE or PMD_SIZE, etc.,
are invisible in linker script.

This patch is prepared for STRICT_KERNEL_RWX support.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/include/asm/set_memory.h | 13 +++++++++++++
 arch/riscv/kernel/vmlinux.lds.S     |  5 ++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index a9783a878dca..a91f192063c2 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -6,6 +6,7 @@
 #ifndef _ASM_RISCV_SET_MEMORY_H
 #define _ASM_RISCV_SET_MEMORY_H
 
+#ifndef __ASSEMBLY__
 /*
  * Functions to change memory attributes.
  */
@@ -17,4 +18,16 @@ int set_memory_nx(unsigned long addr, int numpages);
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 
+#endif /* __ASSEMBLY__ */
+
+#ifdef CONFIG_ARCH_HAS_STRICT_KERNEL_RWX
+#ifdef CONFIG_64BIT
+#define SECTION_ALIGN (1 << 21)
+#else
+#define SECTION_ALIGN (1 << 22)
+#endif
+#else /* !CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
+#define SECTION_ALIGN L1_CACHE_BYTES
+#endif /* CONFIG_ARCH_HAS_STRICT_KERNEL_RWX */
+
 #endif /* _ASM_RISCV_SET_MEMORY_H */
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 02e948b620af..ef87deea0350 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -9,6 +9,7 @@
 #include <asm/page.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
+#include <asm/set_memory.h>
 
 OUTPUT_ARCH(riscv)
 ENTRY(_start)
@@ -36,6 +37,7 @@ SECTIONS
 	PERCPU_SECTION(L1_CACHE_BYTES)
 	__init_end = .;
 
+	. = ALIGN(SECTION_ALIGN);
 	.text : {
 		_text = .;
 		_stext = .;
@@ -53,13 +55,14 @@ SECTIONS
 
 	/* Start of data section */
 	_sdata = .;
-	RO_DATA(L1_CACHE_BYTES)
+	RO_DATA(SECTION_ALIGN)
 	.srodata : {
 		*(.srodata*)
 	}
 
 	EXCEPTION_TABLE(0x10)
 
+	. = ALIGN(SECTION_ALIGN);
 	_data = .;
 
 	RW_DATA(L1_CACHE_BYTES, PAGE_SIZE, THREAD_SIZE)
-- 
2.25.1


