Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 219FDE64AB7
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 14:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RRBCo2tyQMKnmViiixuYGDGSY2WHeNhiosONJUri9FU=; b=0zT3pPcWlRVCwx
	nTUr7zowY0aKWhe61UIuVmF/7pWU3qXw32j0xbPyyyMm9TamTpjEXWBFH3M9PP4vBqRQtaiTl1Wac
	XjhQXDIKK2KvlxVPrpBt9Fp688g6KkoJSCU+IUvjLrfXt7qNC3fb35bIzLeqiCUCZ7S9i7/LqX77F
	KWCK5PGLec4qO8raFu48CusRWNHrHT0mgVNRn9+sW3RHcRDdpjX16VWBnQFfPdc+sB+fhjd+S2Gu5
	/wsxZ8OU2k993YFEc7kN8U7bbsUv2H4P7KgTBlVStlcUe2TFZ/G+14jUPPqRK+U7chGAS1Zi/vy5U
	xXjW2JRiQKJdhstWjApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUE3-00000009pSC-2dAC;
	Tue, 03 Dec 2024 14:50:07 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIUE0-00000009pQO-3dwg
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 14:50:06 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7251d20e7f2so5595760b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Dec 2024 06:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733237404; x=1733842204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrAO0BF6tefsoE4f/cw6SIDUzZ1JJZKOB2UgvpR12pQ=;
        b=SqX2GVbsyx2lMbcrioBygZxIX8062KSgbsBKXC6h2N2sjII0O+3R8uA+XWKC9o2tlN
         VRe78Rh5yeJAx650iGAkfSLOBaRpZkRpwsQwXUfnm25UDfGDYnZ6JOvtPr3MAZyov0i5
         IpZqkENPLWlrd3apMl3VVjXJQd4XdRUwwZK2V4oDP2FfMKyUhqsR4NmSiWoyUTpmkI8K
         UvT3DeHPRKiskQwrBAkICojLkxDplwA8imLxCmIZKz3+cQjPVJlaCiuS6bKRDMKCha+L
         wLUrWRE9KVWceH87jhHtrhfUcoIftD/BHCqlZyi52Poh+EnJAiGTf83QnEMG+NnB4n6E
         8xpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733237404; x=1733842204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrAO0BF6tefsoE4f/cw6SIDUzZ1JJZKOB2UgvpR12pQ=;
        b=O0IwQB3ORiOannJUxCF1NpN1bkkZzqPDBmFOBCCL6FsW+80dL5AYXQEAo8dKqsAO86
         /5xobvHyUijK6IicwWKUUnA/cnQgTBzSZpMnOoubZF3CZ34PRFsUZeou+jqgpmRnTf6z
         Qo+gCSxZynEauLiOJw8StIl7DGCr/S6crMW1QbB9GoYRwmq5xlFKpdq9kY700Fq/B4bQ
         Y3f7ZU8F4Tm+lXFe05kbh294sH+p2wPiFuo45yHrhurhiFbHEc61CElNd65xZ0blKR8s
         zxapIePZvR/Y4eaaID7sbeB1fXguIXaDFaczlE3QcQ5SYr8LoD1hlr1z+6M2tQzBBjFk
         2Dww==
X-Forwarded-Encrypted: i=1; AJvYcCVRug7x8DGyUsbRMNUoh+CmWxuUasFnLHFD43mpxDc/NLxlSLPGKuPNWwVP1l4Ji30QPxWVzHxFmnxifA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqbz8rXnWxMmfDoSeq7kWMo8c3lDL30KeNv03LNd6VqJmb0WOF
	eKlczWnPPQ3i52UOOIpqurpY+dlHGDglPJgeyx/BXlyslCGqQFJr2vhwckQuykc=
X-Gm-Gg: ASbGncsyzsdXNj1w99XdFGFY+HJ7d4C/IP7O/IwOV7Ul2s6nsNqFXBxnQHHL+4JwhIe
	zAC1pj84zlXAPfDf8A5KIs9aIDRoyQ8UJpJd4o0spBVf+ivcaKGfGLvy02jcybF2QIFbPDzxocb
	/76zp9mPj9jE64gOGtx4rZWwAaQnh+3RAbWCpYkdapq5o9R2xPoBIECZhJs1Vh1N/xWUYqD2t+6
	hy/UEn7mvHso7LkwP1XoBEWB/yIPaqbJvdgv996Qc1P/WoycAe+YhqrsRqcKbULQ618/LWzgv9C
	Mpp9a/Xb9nR+1gMom+8bEXJuo4jJtoMH
X-Google-Smtp-Source: AGHT+IF7MZvAtBKuz4c9P8nwmOub3Lo2otH53DBxGmOt+Qd2HkzMuMi190KpoHVTrOk3oGsiOOV+qg==
X-Received: by 2002:a05:6a00:14d5:b0:71e:68ae:aaed with SMTP id d2e1a72fcca58-7257fa3a687mr2971544b3a.1.1733237403820;
        Tue, 03 Dec 2024 06:50:03 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7254176fd6fsm10926946b3a.62.2024.12.03.06.49.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Dec 2024 06:50:02 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	bjorn@rivosinc.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v2] riscv: mm: Fix alignment of phys_ram_base
Date: Tue,  3 Dec 2024 22:49:54 +0800
Message-Id: <20241203144954.91731-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_065004_907860_C690462F 
X-CRM114-Status: GOOD (  14.93  )
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

This commit fixes the alignment of phys_ram_base in RISC-V.

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

This commit fixes this bug by aligning phys_ram_base with SECTION_SIZE.

Fixes: c3bcc65d4d2e ("riscv: Start of DRAM should at least be aligned on PMD size for the direct mapping")
Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/mm/init.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 0e8c20adcd98..974cafa7c85e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -33,6 +33,9 @@
 #include <asm/pgtable.h>
 #include <asm/sections.h>
 #include <asm/soc.h>
+#ifdef CONFIG_SPARSEMEM
+#include <asm/sparsemem.h>
+#endif
 #include <asm/tlbflush.h>
 
 #include "../kernel/head.h"
@@ -59,6 +62,12 @@ EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
 #endif
 
+#ifdef CONFIG_SPARSEMEM
+#define RISCV_MEMSTART_ALIGN	(1UL << SECTION_SIZE_BITS)
+#else
+#define RISCV_MEMSTART_ALIGN	PMD_SIZE
+#endif
+
 phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
@@ -239,9 +248,13 @@ static void __init setup_bootmem(void)
 	/*
 	 * Make sure we align the start of the memory on a PMD boundary so that
 	 * at worst, we map the linear mapping with PMD mappings.
+	 *
+	 * Also, make sure we align the start of the memory on a SECTION boundary
+	 * when CONFIG_SPARSEMEM_VMEMMAP is enabled to ensure the correctness of
+	 * pfn_to_page().
 	 */
 	if (!IS_ENABLED(CONFIG_XIP_KERNEL))
-		phys_ram_base = memblock_start_of_DRAM() & PMD_MASK;
+		phys_ram_base = round_down(memblock_start_of_DRAM(), RISCV_MEMSTART_ALIGN);
 
 	/*
 	 * In 64-bit, any use of __va/__pa before this point is wrong as we
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
