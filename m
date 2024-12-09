Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F8DE7717D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2024 10:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gvuTZSn9Cdyph9XmogKxk8baztEST1MbpNuwtYU8nxE=; b=d2TURzkezXhPKp
	kb597TV7kuDgX2nvGXDmBM7F+NMRxZVwI8WHtzlFwv/PNwhWbko4lN3bXB1k02qknp4RzHDFZLb6M
	7g4IQ9J7j9TUgBFv086b2M+nKm0RXED84OziO7bQSioWWzik/CJbnoIARX7s+/tI9AQZSKc04iP73
	nSpGKshN6Q6eydwl4ySW4XPJdGx6+05TkbOeR3uRpCUj3oGbvXQA+fpt+mF8vSikBxhfETuwMFgPE
	pYzv5h3RsMOkn0JRe2uyOXyOXDmxpq0/1RAmzjOxjJdqo3d2MMLC121Y4DPBsUYNkvH5ShLo/FV+R
	D3LrfBvhgktdGnniX5ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKajn-00000007EAh-1UAD;
	Mon, 09 Dec 2024 10:11:35 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaQE-000000079f5-36p3
	for linux-riscv@lists.infradead.org;
	Mon, 09 Dec 2024 09:51:24 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ef8c012913so1133205a91.3
        for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2024 01:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733737881; x=1734342681; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lcckKnBkxwonex0rN05fDWZ2YY8G15nPOBI5Ow04occ=;
        b=btaQrJCUm+BBSrP48++e3K0n238DiEgj7uP5KUqWsL3BXmDfrUe/npneAwRGeJLdlg
         k9alSMEoGPKijsRYm4z/9J6Tfcay6jnl1hkIGB45GhGYMB5h3CsLhlhCYphhmbk3qXt5
         z8Y2OOKLrhInYav9Adtvo57uUO2Mj0ABEklf8VVli84gMO3ozdWmYalycTHvu9+aao6C
         bQ8UaRZV1aSWXxkEPH5ubRXPZfRIpcs8uWzXDrC7FLJOREuavWGBQWHCmJDO4C3IOve3
         r8SikCu0OByVwxuCsSF1bvweqV7PLVbKKWZw9Q46TBsxumEduMDevrnJ568FB5HffmM5
         Anxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733737881; x=1734342681;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcckKnBkxwonex0rN05fDWZ2YY8G15nPOBI5Ow04occ=;
        b=p+ItDBp//iRFXYN3eN5ZDknNNYLvuCXial0gGCFv/Zl5ITdlKj87yQ2JYuYUPs7+4R
         9A6VP5I3WZVZmb/yfKGkePlVfpzboIiE0ARNxzqRq/SG0+Gwuu2AsDOGmb+AiGa+ile7
         MwPlhmRzkXXiBQcYLvJwikq9zvMzH8v9SZ6461kUp7od2YwXri6IAIKxDB4p8ZkWTvxm
         JuTOjn/BdmPKjY3rYCwZc9+JKFsVzAHAaFVp8oiZvTohBecsICqO1P/XcZI1fJm/DAcm
         C+cTtEVix6e2YTJop24odKsesuH8QPvktJaY6XVcktsDyjOx+z4Xn6U2q/bDp8ZT9YQM
         /Ckg==
X-Forwarded-Encrypted: i=1; AJvYcCXqTOHG5/dnkydfjEyGp1MX5sdy8VJfmADztJI3Do/HVP2rLI1m1NlXqdbKqP0aaSn7SHvvpCJkUZ5JZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6lVnf8kj3dWBXr8T12kIfG5Qh+5fGHdaNUDO8a7p57c+nqeV+
	qAZy8L2a7bXLtTkEQZ661kmpCsDHLlMkqAuZqSRQP3uGEiQC71OE36P4Zf16XjE=
X-Gm-Gg: ASbGncsr16xQUA6gSIqXvN8/kFlZl9cgYLUO7+RVB3xn9JrYX42t4U/zgOIj1F3/Wfk
	x/q/KiymxZyzK+jz4HRNJuN4KVfiw52p+/tMrX0KOuLl/pM/juer6Qhv7i/jMxXeGkkoQwEj+fn
	wv3CTk00XIsm01Qgym7nR7mufr6PVab2MjyW+MbPhgM03W077qPvg4vf/+cKpLCGE68O9yahvOW
	dONoQMZUJbhqGrnjwi6zD87OdJ5zRbBb+ZxqRj66AzRYsTS9EommyX4yX35/0Otbv8aPTe8tFRG
	mAhQbEG8bqmqYl6Fh6rhLfLXeGlSN+ID
X-Google-Smtp-Source: AGHT+IHkfKdV7X6NFJu77/MTZMkJs3GSnr3friviyGuaSw/bQdYdXWzPFIgBffs3GwqK80qVdk+nPA==
X-Received: by 2002:a17:90a:c88f:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-2ef69f0b077mr20057976a91.12.1733737880950;
        Mon, 09 Dec 2024 01:51:20 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef2708cf3csm9459051a91.53.2024.12.09.01.51.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Dec 2024 01:51:20 -0800 (PST)
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
Subject: [PATCH v3] riscv: mm: Fix the out of bound issue of vmemmap address
Date: Mon,  9 Dec 2024 17:51:13 +0800
Message-Id: <20241209095113.41154-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_015122_936302_456B39CA 
X-CRM114-Status: GOOD (  14.84  )
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
 arch/riscv/include/asm/page.h    |  4 ++++
 arch/riscv/include/asm/pgtable.h |  4 +++-
 arch/riscv/mm/init.c             | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 71aabc5c6713..a1be1adcfb85 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -123,6 +123,10 @@ struct kernel_mapping {
 extern struct kernel_mapping kernel_map;
 extern phys_addr_t phys_ram_base;
 
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+extern unsigned long vmemmap_start_pfn;
+#endif
+
 #define is_kernel_mapping(x)	\
 	((x) >= kernel_map.virt_addr && (x) < (kernel_map.virt_addr + kernel_map.size))
 
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index d4e99eef90ac..e2dbd4b9a686 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -87,7 +87,9 @@
  * Define vmemmap for pfn_to_page & page_to_pfn calls. Needed if kernel
  * is configured with CONFIG_SPARSEMEM_VMEMMAP enabled.
  */
-#define vmemmap		((struct page *)VMEMMAP_START - (phys_ram_base >> PAGE_SHIFT))
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+#define vmemmap		((struct page *)VMEMMAP_START - vmemmap_start_pfn)
+#endif
 
 #define PCI_IO_SIZE      SZ_16M
 #define PCI_IO_END       VMEMMAP_START
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0e8c20adcd98..e7c52d647f50 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -32,6 +32,9 @@
 #include <asm/numa.h>
 #include <asm/pgtable.h>
 #include <asm/sections.h>
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+#include <asm/sparsemem.h>
+#endif
 #include <asm/soc.h>
 #include <asm/tlbflush.h>
 
@@ -62,6 +65,13 @@ EXPORT_SYMBOL(pgtable_l5_enabled);
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
@@ -243,6 +253,11 @@ static void __init setup_bootmem(void)
 	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
 		phys_ram_base = memblock_start_of_DRAM() & PMD_MASK;
 
+#ifdef CONFIG_SPARSEMEM_VMEMMAP
+	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
+		vmemmap_start_pfn = round_down(phys_ram_base, VMEMMAP_ADDR_ALIGN) >> PAGE_SHIFT;
+#endif
+
 	/*
 	 * In 64-bit, any use of __va/__pa before this point is wrong as we
 	 * did not know the start of DRAM before.
@@ -1101,6 +1116,9 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
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
