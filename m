Return-Path: <SRS0=yxlK=42=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 234DFC18E7A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 16:56:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEFB520828
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2020 16:56:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SBUnfxOG";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="gqj0dx0+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEFB520828
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xY84tDONTtbk2uTeIT3VIK8abrA7sFeiX9nBiqOTOno=; b=SBUnfxOGp0Yh4q
	PuoHql/3yh9MO6qh4ygsqXDggzYs1LUERJdVbOBcoA+UmrfhN5MmEHqYtHu1w5B5tyWMw/lviG9Zn
	DpGYKgLAd2yQeyVx29uQoFbFDBqrzRc1eUIMnKHW5ZDH/mNsbLUs7zibCdvXXMdzfwGnmWsFhH815
	d4UmmKOtx5cdD0NH+7gj8kbE/Ys5jaHjGkTozBs6Jr+G2ix6M7hYaQjjHXKhCuIxSzhzKvCmCHNQK
	Tf0wVk/dQjYgg36HRVOIoZFN45whnt0H4253LqPuVqdlLUUf5LtBhd90pTzNIs9mlsUK5Xib9p9wH
	FoWxi9XbjP1awmYE1H7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBLhL-00027w-FB; Mon, 09 Mar 2020 16:56:11 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBLhD-0001xs-CF
 for linux-riscv@lists.infradead.org; Mon, 09 Mar 2020 16:56:05 +0000
Received: by mail-pl1-x644.google.com with SMTP id f16so2072905plj.4
 for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2020 09:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xY84tDONTtbk2uTeIT3VIK8abrA7sFeiX9nBiqOTOno=;
 b=gqj0dx0+9O/PE/Ao8bweu2u+birAb0nGJCfIkBAwDQSn/SGLUmrx94rqv39Lde9Fc3
 ntUMyFTVnMqHoFeFW5qwD50st2uFwzUJXqQAbZbY/jse5cNOYHMJN0LCpkZoAVByBh9v
 SZC4iABowHXDDyqOJ5l3JvAIH1edUm/DlDyp0WwQVN368zus1Uw4JLje87iTo7XRKaCV
 FFohQ2MkOYbqUq6wRtCvVT2tOLIIHkUzuT6i9JdHf/idhJgvq1gZuSxKfgy3s9xov6hR
 BRk5kz8cfTWGPL0KdhkR8QK3myFA5Di4/mfF+eZmFJUENKcLqYo05qJ1n0Zt9LsRRDoQ
 GCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xY84tDONTtbk2uTeIT3VIK8abrA7sFeiX9nBiqOTOno=;
 b=a5Qh0JbyIk2vu6TLuwFhIMmxhTLXcF8ulaNR2dPWw8N/rpaJv+RnUO91pAui60kywn
 YIG+Z2vBxYSTa0U8CZ5XOLNmtfP6B2zr80il3RxV58vXap7jpMGMhp2UuupTyShzDyLt
 h384fcLMwxQYHCKDhcE0nduZ93NaAgBLUKtQ86YniKHiihDCplIHLgkWxSEcrxFLIFzN
 Kjftt3GSd/hz3PMi7DqyvDOdsuD3T/8bSP8eUyD4nqpHPeaf6CpW0PbEm54S2n6zDVtX
 CbQvCre4/z4nXoGCt440Oz3io/dccHikr8m8rdjnhkRC8gXZnKRgFQ39AwZoijSCfxhQ
 dVfw==
X-Gm-Message-State: ANhLgQ2JWaJcP2QITJaUOWWtrhAEkO3GNCDE4SnUlfzo64adCYC91hlU
 iKFqU0C4yLWDmGxXEetEWcMj4Q==
X-Google-Smtp-Source: ADFU+vsDlsfwouc5MSdCv5eUC+2v+e5BTgSZmKhRcQcTRWEMxZs/7La1lI5QlKBgCq+kLHOHvA9gpA==
X-Received: by 2002:a17:90a:9af:: with SMTP id 44mr260267pjo.160.1583772962532; 
 Mon, 09 Mar 2020 09:56:02 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id cm2sm104013pjb.23.2020.03.09.09.56.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2020 09:56:02 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] riscv: add STRICT_KERNEL_RWX support
Date: Tue, 10 Mar 2020 00:55:41 +0800
Message-Id: <8359c2289e12d54a34b69e95842f8fc219343460.1583772574.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1583772574.git.zong.li@sifive.com>
References: <cover.1583772574.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_095603_446826_ACEB4996 
X-CRM114-Status: GOOD (  10.69  )
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

The commit contains that make text section as non-writable, rodata
section as read-only, and data section as non-executable.

The init section should be changed to non-executable.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/Kconfig                  |  1 +
 arch/riscv/include/asm/set_memory.h |  8 ++++++
 arch/riscv/mm/init.c                | 44 +++++++++++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 54437d7662a5..5fbae6380b32 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -62,6 +62,7 @@ config RISCV
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_SET_DIRECT_MAP
 	select ARCH_HAS_SET_MEMORY
+	select ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select SPARSEMEM_STATIC if 32BIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index 4c5bae7ca01c..c38df4771c09 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -22,6 +22,14 @@ static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
 static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
 #endif
 
+#ifdef CONFIG_STRICT_KERNEL_RWX
+void set_kernel_text_ro(void);
+void set_kernel_text_rw(void);
+#else
+static inline void set_kernel_text_ro(void) { }
+static inline void set_kernel_text_rw(void) { }
+#endif
+
 int set_direct_map_invalid_noflush(struct page *page);
 int set_direct_map_default_noflush(struct page *page);
 
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fab855963c73..b55be44ff9bd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -12,6 +12,7 @@
 #include <linux/sizes.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/set_memory.h>
 
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
@@ -477,6 +478,17 @@ static void __init setup_vm_final(void)
 	csr_write(CSR_SATP, PFN_DOWN(__pa_symbol(swapper_pg_dir)) | SATP_MODE);
 	local_flush_tlb_all();
 }
+
+void free_initmem(void)
+{
+	unsigned long init_begin = (unsigned long)__init_begin;
+	unsigned long init_end = (unsigned long)__init_end;
+
+	/* Make the region as non-execuatble. */
+	set_memory_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
+	free_initmem_default(POISON_FREE_INITMEM);
+}
+
 #else
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
@@ -488,6 +500,38 @@ static inline void setup_vm_final(void)
 }
 #endif /* CONFIG_MMU */
 
+#ifdef CONFIG_STRICT_KERNEL_RWX
+void set_kernel_text_rw(void)
+{
+	unsigned long text_start = (unsigned long)_text;
+	unsigned long text_end = (unsigned long)_etext;
+
+	set_memory_rw(text_start, (text_end - text_start) >> PAGE_SHIFT);
+}
+
+void set_kernel_text_ro(void)
+{
+	unsigned long text_start = (unsigned long)_text;
+	unsigned long text_end = (unsigned long)_etext;
+
+	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
+}
+
+void mark_rodata_ro(void)
+{
+	unsigned long text_start = (unsigned long)_text;
+	unsigned long text_end = (unsigned long)_etext;
+	unsigned long rodata_start = (unsigned long)__start_rodata;
+	unsigned long data_start = (unsigned long)_data;
+	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
+
+	set_memory_ro(text_start, (text_end - text_start) >> PAGE_SHIFT);
+	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
+	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
+	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
+}
+#endif
+
 void __init paging_init(void)
 {
 	setup_vm_final();
-- 
2.25.1


