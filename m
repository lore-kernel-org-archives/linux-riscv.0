Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BF1E77180
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 12:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z7S3mxazbm1wYoj4NEB4TlpC8vwu/Jhd1t+vAw5UvoA=; b=UepEqNwxt3NEv4
	4ubGgsyB4kTwYSBhnh/LPq+GDF4TyX+fg0WPEQdt+/1YvpoPApFjPkcGWGJx34k1x9nyJZ+qAgnvF
	ebeeIiGOOl2+tDnWE7BqoKPmGSTKb4Nm+5YuXuVFEvPtLfMeagCZ58vxiUIbybUvkwHNnxa/23MED
	Z3HtOC1IvHtX1oZBL7J5/tK3e5mtk43x8xwchCK7wxnQVVLCWZPWjmsMxRI139K77GC+SLuTihFf5
	5Pz4hZk+1OPwj9/XDemaRKW07ZmC9A/AfRVc9aPrNnZ696W513HGIPbNCOwgtrYk6WMBd9RLxfmzU
	lsaux+wW77eFQcjyArcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcql-00000007fuR-3ME9;
	Mon, 09 Dec 2024 12:26:55 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcqH-00000007fo8-1aUH
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 12:26:26 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-215ac560292so41752885ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 04:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733747184; x=1734351984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=adtW4yhwyBOkoWat2M6vNhXJayXsjhP2L4IIfgg3CNM=;
        b=kSMWoy/lHKlr48T8JDIiOc/+N5//qd2E6dRpXXYNiSXTTpwlnPf+6Kj1DNsSX3Sjpf
         ZzgpEzsV/5qPYPeglNk7ocdyQ83+2apEvs21xZ7ouTzOCRX0PaLVydGi+VPGLXiGDXei
         XO87u741pl2qZMv4nLK/u7q0Kdsxipu8H9OaJ4pTBczB+ifNEMDje1RYCif3YD8Db0sc
         TvsYMTKtH3e9P1xDwQMc1XdbR86UBvIm2uwhmxwRbazcv422ZjLkKwr5h/LL9VSeEnCr
         QkVFS7FCYBU4LY1OCvksaCLfo7o0gV0VGL4PjbdlPIxb5T+s06LDYVvl3ELVccCz4f5r
         o9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733747184; x=1734351984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adtW4yhwyBOkoWat2M6vNhXJayXsjhP2L4IIfgg3CNM=;
        b=qJJ+ybL40IqNgw21SDtvcTAOThqgkUQF/Pd/YVU1cBsRhLpt20EGHcpal/cgZqqAlH
         Th0WUTx99kdOR6EEkqGbHHu2MQJ6GHt6IWDJCllmSXQKP980/YO9M05a1C7XGeL0DTyp
         1qf9kIeWaBr98GzjU5oD1Q7pa4OiafsD6BpV9RRYtAhNTrOHDe8omrOZ06wwDmKq0s45
         fklx7qbojHqbYQezW5nQfpcU9x0KqjYqC/XoAYHVUG0e+HlxBqXCM8JxhJNce+Q0QxEN
         Sdci5iZznhxgzhZRB0z9Zp9RsUYcDZGWac7Y6EsADbRYII5bNvB5c+djMayzJ1YmVuuo
         aoZw==
X-Forwarded-Encrypted: i=1; AJvYcCUSPW/YZCEXh2e1+iKz0YOnjrH2Rdd/VrRrVnJzM9RjE9r//xjpJB04T+LPIYOiPPsVSxdWz1zOGM/GoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0lHOzNcN1Om5jNTdQzRj4dgOH4W+7XfT1iTO4L4JooKXTMNlQ
	dqZMeEyxO0BZN0R2yMCtExut8U1TklkrPgUDh0Vq7BtZzjhF7FTPeUw5oygV1o8=
X-Gm-Gg: ASbGncuW+nsEt8IhcA4a/sXz5jpWaEG0g52EUQ+VVeylYYylnqDjuT0nLliPhtJmra0
	jC6nZHoxR1VSLuo92D6ZVcjxNpbH2TglYmw5ZXO6x4T2R6iUW8SFr1TL7r1rixPuNY1gNMeNXMl
	/58x09kjSjDuqZRjC7RB+GdtTYDHc/++zm81ODTdKb21NURmpUE0khRpf6thucy27cmt9hJQDnT
	QDe37ma/+GWprE7UhKG7lRkE4J/D+67mMKQvLGPS8Nwn3cVLr+GgLBmFS2nV+wgFR7zs6a3p1hE
	/OBHH06mxu44zPsxXbNKCc/mG2GOmjCD
X-Google-Smtp-Source: AGHT+IEkfqOSMeyV1p1/Cuhjrl7T8ZPCluyO93B+ezN3zdW8K/wnCYdgb3FXmHnAi6yiGokVDtfhww==
X-Received: by 2002:a17:902:ccc1:b0:216:4e8d:4803 with SMTP id d9443c01a7336-2166a03c862mr3381875ad.42.1733747183831;
        Mon, 09 Dec 2024 04:26:23 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21638d87ca1sm28386325ad.171.2024.12.09.04.26.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Dec 2024 04:26:23 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	bjorn@rivosinc.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4] riscv: mm: Fix the out of bound issue of vmemmap address
Date: Mon,  9 Dec 2024 20:26:17 +0800
Message-Id: <20241209122617.53341-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_042625_418239_3DDF9AB5 
X-CRM114-Status: GOOD (  17.36  )
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

In sparse vmemmap model, the virtual address of vmemmap is calculated as:
((struct page *)VMEMMAP_START - (phys_ram_base >> PAGE_SHIFT)).
And the struct page's va can be calculated with an offset:
(vmemmap + (pfn)).

However, when initializing struct pages, kernel actually starts from the
first page from the same section that phys_ram_base belongs to. If the
first page's physical address is not (phys_ram_base >> PAGE_SHIFT), then
we get an va below VMEMMAP_START when calculating va for it's struct page.

For example, if phys_ram_base starts from 0x82000000 with pfn 0x82000, the
first page in the same section is actually pfn 0x80000. During
init_unavailable_range(), we will initialize struct page for pfn 0x80000
with virtual address ((struct page *)VMEMMAP_START - 0x2000), which is
below VMEMMAP_START as well as PCI_IO_END.

This commit fixes this bug by introducing a new variable
'vmemmap_start_pfn' which is aligned with memory section size and using
it to calculate vmemmap address instead of phys_ram_base.

Fixes: a11dd49dcb93 ("riscv: Sparse-Memory/vmemmap out-of-bounds fix")
Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/page.h    |  1 +
 arch/riscv/include/asm/pgtable.h |  2 +-
 arch/riscv/mm/init.c             | 17 ++++++++++++++++-
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 71aabc5c6713..125f5ecd9565 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -122,6 +122,7 @@ struct kernel_mapping {
 
 extern struct kernel_mapping kernel_map;
 extern phys_addr_t phys_ram_base;
+extern unsigned long vmemmap_start_pfn;
 
 #define is_kernel_mapping(x)	\
 	((x) >= kernel_map.virt_addr && (x) < (kernel_map.virt_addr + kernel_map.size))
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d4e99eef90ac..050fdc49b5ad 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -87,7 +87,7 @@
  * Define vmemmap for pfn_to_page & page_to_pfn calls. Needed if kernel
  * is configured with CONFIG_SPARSEMEM_VMEMMAP enabled.
  */
-#define vmemmap		((struct page *)VMEMMAP_START - (phys_ram_base >> PAGE_SHIFT))
+#define vmemmap		((struct page *)VMEMMAP_START - vmemmap_start_pfn)
 
 #define PCI_IO_SIZE      SZ_16M
 #define PCI_IO_END       VMEMMAP_START
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0e8c20adcd98..d93271cb97b1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -33,6 +33,7 @@
 #include <asm/pgtable.h>
 #include <asm/sections.h>
 #include <asm/soc.h>
+#include <asm/sparsemem.h>
 #include <asm/tlbflush.h>
 
 #include "../kernel/head.h"
@@ -62,6 +63,13 @@ EXPORT_SYMBOL(pgtable_l5_enabled);
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+#define VMEMMAP_ADDR_ALIGN	(1ULL << SECTION_SIZE_BITS)
+
+unsigned long vmemmap_start_pfn __ro_after_init;
+EXPORT_SYMBOL(vmemmap_start_pfn);
+#endif
+
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
 							__page_aligned_bss;
 EXPORT_SYMBOL(empty_zero_page);
@@ -240,8 +248,12 @@ static void __init setup_bootmem(void)
 	 * Make sure we align the start of the memory on a PMD boundary so that
 	 * at worst, we map the linear mapping with PMD mappings.
 	 */
-	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
+	if (!IS_ENABLED(CONFIG_XIP_KERNEL)) {
 		phys_ram_base = memblock_start_of_DRAM() & PMD_MASK;
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+		vmemmap_start_pfn = round_down(phys_ram_base, VMEMMAP_ADDR_ALIGN) >> PAGE_SHIFT;
+#endif
+	}
 
 	/*
 	 * In 64-bit, any use of __va/__pa before this point is wrong as we
@@ -1101,6 +1113,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.xiprom_sz = (uintptr_t)(&_exiprom) - (uintptr_t)(&_xiprom);
 
 	phys_ram_base = CONFIG_PHYS_RAM_BASE;
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	vmemmap_start_pfn = round_down(phys_ram_base, VMEMMAP_ADDR_ALIGN) >> PAGE_SHIFT;
+#endif
 	kernel_map.phys_addr = (uintptr_t)CONFIG_PHYS_RAM_BASE;
 	kernel_map.size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
