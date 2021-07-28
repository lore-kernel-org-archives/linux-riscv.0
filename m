Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2793C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 06:43:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A571360EB2
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 06:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A571360EB2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lt7vNzvFTCWQe193EV3h5rMBEj1Yyk/WS6ZkDoyRIeM=; b=ODUvvlqTqhRp+0
	1pO8P3hD7Rq2MLuC9Wj7dlVJ8eNwZXjCkIJoJ0NpGI7BkvhNFoy7CbnIIo9JMMyYY31vHPxnjMOlA
	PmcOOp7MmS+7BP1sDjRUNYUcoT+QB+R30S+gygo/38RlAx32kMsSnArcijF1YC1Mpv84VMIuzzlDs
	vSFN3O3n0mzh2hCDx9bd+4F3Eu0BQFDSiTcAqTDOJKJ/YkJN4EmfCbMDUshCuVZpbhqMJj3NzyBWI
	lkIHWg73BTmPjCh5yHytRvbLAjOKjTjXPdGMnbh+vCs1qYEGq88r0GDYzj6HFakoziCB5rOHERCd4
	R3s7sP1nHEPCygw3xT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8dI7-00HHi6-99; Wed, 28 Jul 2021 06:43:43 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8dI4-00HHhL-2D
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 06:43:41 +0000
Received: by mail-pj1-x1029.google.com with SMTP id j1so3672697pjv.3
 for <linux-riscv@lists.infradead.org>; Tue, 27 Jul 2021 23:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXtLcU7ZZXSLfEipJ8pAe0QEMbslZL2rwJBJ8YIF008=;
 b=g5gbqDNWJZ5bkczxky3WiMyckf/lVdH6GlS3KSYFICuEPW2stf7K310+7qoTubMV3D
 PX5N309Va0Nx9sql53M1KxOSlKQelL9v75jYgLQDnqw+OV7B8gFG2rbTxccrMxGDd210
 jYDNuoJKHdsP8KYf17LSmZRh3/X73ALtJWBDXDSx3Ggod41mDM6/sGMXziYe/1yEddXh
 lIINH9ZdOf+ek+zxYTSU3p6HlTWGh+RNaO5zvp3r3K0ahoP1otsrY3QifDmA1NpCVYCq
 pXA+BNJQaYW7VAPcJEO1CT8ffrqdaStAhtsDj0QCJ0NK0nvtHREbO6pSZPj0CjzJBBds
 ktXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iXtLcU7ZZXSLfEipJ8pAe0QEMbslZL2rwJBJ8YIF008=;
 b=F8VZA1VvsiS3k62LSvfKFNRfB0XdEXH1Zn8cB7agkSy6ctlxCwBoCfGpc09nFVIzZE
 Wc4yXu5KIMvcbpZHnTEcTotkg4F5xoTNJKTQpssqk5ivrdL/KxLHe7SlTKhFoQTIVf3z
 DboxExjlRMsbI7mUHVJxwCu9G7eBCTyibLaBZpEuA7x+GmjP3Lc+D05sJMN0ep0uSaOz
 e6tDMGIxHkhvRo+rRGbIt9yS7zjUj2qfXGXQgjFxb4txWO7ak+lB+m7lZ1uMWMVtEFMU
 wmcfQduq1sLlc/kYkjGEpMRj2lKefs5hJM2Z5s6qzCJ9l2fL8sIe4YeLV7zCFDw/el4y
 6/1g==
X-Gm-Message-State: AOAM530lmPjW/lpew099+DRz1RuE5OEfuVVuscaWjFrCvEQaVebysCAK
 8LuB2FyVyqgMO/v/ehMbo6U=
X-Google-Smtp-Source: ABdhPJxXOQhIGJO08AI11C7dx+vcyYR925UbeiKGQJ3EO+wsrkg6qxSqrxrlhcivHuIrIiFT/COixQ==
X-Received: by 2002:aa7:948c:0:b029:328:8e56:aefd with SMTP id
 z12-20020aa7948c0000b02903288e56aefdmr26899199pfk.19.1627454618717; 
 Tue, 27 Jul 2021 23:43:38 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.50])
 by smtp.gmail.com with ESMTPSA id x9sm6088034pfd.100.2021.07.27.23.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 23:43:38 -0700 (PDT)
From: Kenneth Lee <nek.in.cn@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@wdc.com>, Kenneth Lee <liguozhu@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Guo Ren <guoren@linux.alibaba.com>,
 Jisheng Zhang <jszhang@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: guohanjun@huawei.com,
	wangzhou1@hisilicon.com
Subject: [PATCH] riscv: fix the global name pfn_base confliction error
Date: Wed, 28 Jul 2021 14:43:18 +0800
Message-Id: <20210728064318.375747-1-nek.in.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_234340_154663_34FB485B 
X-CRM114-Status: GOOD (  13.39  )
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

From: Kenneth Lee <liguozhu@hisilicon.com>

RISCV use a global variable pfn_base for page/pfn translation. But this
is a common name and will be used elsewhere. In those case,
the page-pfn macro which refer this name will refer to the local/input
variable of those function (such as in vfio_pin_pages_remote). This make
everything wrong.

This patch change the name from pfn_base to riscv_global_pfn_base to fix
this problem

Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
---
 arch/riscv/include/asm/page.h | 4 ++--
 arch/riscv/mm/init.c          | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index cca8764aed83..8711e415f37c 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -79,8 +79,8 @@ typedef struct page *pgtable_t;
 #endif
 
 #ifdef CONFIG_MMU
-extern unsigned long pfn_base;
-#define ARCH_PFN_OFFSET		(pfn_base)
+extern unsigned long riscv_global_pfn_base;
+#define ARCH_PFN_OFFSET		(riscv_global_pfn_base)
 #else
 #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
 #endif /* CONFIG_MMU */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index a14bf3910eec..2ce4e9a46ca0 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -228,8 +228,8 @@ static struct pt_alloc_ops _pt_ops __initdata;
 #define pt_ops _pt_ops
 #endif
 
-unsigned long pfn_base __ro_after_init;
-EXPORT_SYMBOL(pfn_base);
+unsigned long riscv_global_pfn_base __ro_after_init;
+EXPORT_SYMBOL(riscv_global_pfn_base);
 
 pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
 pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
@@ -572,7 +572,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
 #endif
 
-	pfn_base = PFN_DOWN(kernel_map.phys_addr);
+	riscv_global_pfn_base = PFN_DOWN(kernel_map.phys_addr);
 
 	/*
 	 * Enforce boot alignment requirements of RV32 and
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
