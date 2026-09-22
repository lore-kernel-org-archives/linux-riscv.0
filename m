Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1747C982FF
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Sep 2026 08:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3ixbk/ZY6xNnSEihheNBBjD/BCYj2hRqkXf8PEotmw=; b=Uht3s1MBK0Z+b8
	4VKVUSsMcW7S6MipFilaqwBbaDsiiaYvO4+U9mCDwTwcjME0Z7cZQZlrgGrRXcMLA1RRdpkVJRmg6
	fzHQrx+jUPMtOLo51Wa4Kj7B+yAaM4XkJrRVpMbhDqvBD69IidQW4Ru+X6T3CYnyo9GXGNmmlZ2SH
	z91UkVGyFu/+UvhnnO/+dJl3BtSJ0qCK6si5FcMUfhU/twtITe1v/RVB+fxVZ+68hRPxN8MWm12lO
	fFpwQDKTFkrCtO8+aKTtCIzd3es74Nk6609jNjfTiUgv0lrn8TZm4dppl3ZAOojQ1XzhnEfKeKeZv
	CrUhNlss62+V1Ep51Fdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7K-00000004jgR-02I8;
	Tue, 22 Sep 2026 08:44:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8w7H-00000004jb9-2sTs
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Sep 2026 08:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JU/OT6l28quZrPrYfN7XUOSpOrASPsDzS2PQ3ztfmsA=; b=psKyF6Vt+UhBzV3lYLOwiWN+QA
	Wl9Zi8gkpN8/TROA0TJcj1BHaVrTNiiXNVbc+CEgaU/+8yOyHInukhhCpE7Ugx/POUqAfT6lrnL7N
	vQOfuToeii9kj3Lmg56pi3+iAw9SfK3UsecfxpWpZ6w8NdLcmruYGwsfAG9VBuYeii4kA9ETdslth
	mswpj+v4LLe2EayuOsjgHZ75alYLS5aijNeVqCkPjnYMdApPTiSBFZifOdPVNVMY6hGoJ+QWPHLxJ
	Dv0F8OZGhJqZ6ANFGlDg/K2QVFV6r37Vb9qFjQwFTbOyH6ozGq4QtN4NFXQskRnHQOAzmOuU27F00
	64v22cNA==;
Received: from mail-pj2-x01.google.com ([2607:f8b0:4864:39::1])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8w7C-0000000DHnI-0V6t
	for linux-riscv@lists.infradead.org;
	Tue, 22 Sep 2026 08:44:42 +0000
Received: by mail-pj2-x01.google.com with SMTP id 98e67ed59e1d1-39e0e245eadso1692497a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 01:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790066676; x=1790671476; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JU/OT6l28quZrPrYfN7XUOSpOrASPsDzS2PQ3ztfmsA=;
        b=ImX/9cmIbPL16ZAQxdQV/uH6ZRi33XZ6MjFYymvGyNtM08xpLe+sGYfclz1S69/Ub7
         SC0GKIkq5Owu0Lky+GhBUPMlJ3kvlGJL9tjnltTRWkltZe/FIzx/bp3PTt18VsAndhDf
         PxaRExNtYR/oxvpJNgsS/xsKHw6U7z1iro+tw6C1E9irY3RrMQ7hLAcsdQGy1ptELDw+
         90xSViA/1g4lsKV58pNLICq4iYYDLfSmiSttjoP6OO4AjBJFapG6jNkz36SsZWlBFd4K
         GNCtb9HaYYQ9v4P2hponU3ZdkGd89hCZV40FedWSPCiCzz+8zh95Y4vGu7s7uynmua7N
         6XJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790066676; x=1790671476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JU/OT6l28quZrPrYfN7XUOSpOrASPsDzS2PQ3ztfmsA=;
        b=OoLniYMRPrg3F0R8nwn1CE8gVjfWD7GI/Bk6GtChNhopf49cB0rxHH3TIWd94vQY5F
         2BdWw+n3L/ThO6aNGa3G+54Z+t40ldSNVNmmd/Ng20COb9GFp7w74JGFpGptD8KOeb4/
         KyJrCeMJ3oY0BI3olGKvtlgTsEbWWqhzNj7RLzd/owdNSqBLhyPNhMMxlbWutzZOT+A1
         hNuM370OeHGJNVCTkoySDybesgVJB+EiLjeMxNyUZGUwmEAFKF6gfN2MXkIZHNBqhCEJ
         S6XMgRwTF4J02OskYiQ0SDKwT/Cr9wLGYsYte2t7Z3O/9fZKJK5EW2k7fkJDJTG2jn/T
         6xfQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu1tCgxAI2IwLjWogEAiVHT2Spxt32nqKtSXvfrmSIvtk7eIaJq870GDsuwsFi4qx0qrNvQ7tUcmFtjw==@lists.infradead.org
X-Gm-Message-State: AFuF++nVYLVF4D3Wc0DR3/I8KznR877hcNMpkrWnZ8pBWSls0B4t+p2S
	Vpnqb8Z0kEweTGBex+FiB4glhfGRMaQGfQDgLAl4zMoIwIZN16gGeRmG
X-Gm-Gg: AYBFou2JXIE1BSzqfwfq0F7BJbF4kb8p7AJYH3yuLwChzYuluxlBU/KbNPoT5iDAce1
	RXHR89OEeZzNU6CtjQLDEez4SRsMv2fdowxk9ErZaYPf0VjUtlz+5qVqoAGBcYxGacUab+SZWtu
	ldSokcnqXm6aGW0ul31ksRGATcnHb8YxDK4ZF1/XPCFq/vEsv4iJdU7ZHWe/ngJ5pVSysUyUX+K
	1MbWn+uO4LZj+fivAJBgijXotFeT5zCKSgENnAuIQBkFIuI/MYpoT4RYzPaIQk0yuPOjnL24k7x
	Rfwe4n4/R7oEpGyKLdqKngUi1r6aX0ffzuAhQ7R5JwzpHzJXoPaRMUUp3TfnD6Zukpg9+Xi7Rcz
	/4B4vzaSU0dZk8ZmaEJEczebGoVE/ShrtFtOQwCMXlbKT/9bkaO8inNWcaB0XEv1Kkl+apZqU3U
	pnlTxBxnu1QlKUmesyHocVAqY0eHSYZEvZrlCd0dIkzWythaC0V+Sl62YZ+BDJvdOAVtBDQaR0H
	NBAtgTh+lw=
X-Received: by 2002:a17:90b:5408:b0:39e:6a81:f34d with SMTP id 98e67ed59e1d1-3a07320077dmr483552a91.39.1790066676289;
        Tue, 22 Sep 2026 01:44:36 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0674a5ae4sm3670016a91.12.2026.09.22.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 01:44:34 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v7 7/9] of: reserved_mem: mark /reserved-memory entries with MEMBLOCK_NODUMP
Date: Tue, 22 Sep 2026 16:42:54 +0800
Message-ID: <20260922084256.1515554-8-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260922084256.1515554-1-chenwandun1@gmail.com>
References: <20260922084256.1515554-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_094440_719402_F74A2A88 
X-CRM114-Status: GOOD (  13.00  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Mark non-dumpable reserved-memory regions with MEMBLOCK_NODUMP so
kdump can omit them from the vmcore.

The marking is guarded by CONFIG_CRASH_DUMP so non-kdump kernels do not
pay the cost of splitting memblock.memory entries at NODUMP boundaries.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/fdt.c             |  1 +
 drivers/of/of_private.h      |  1 +
 drivers/of/of_reserved_mem.c | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
index a64afc3ded3d..286fd4db6312 100644
--- a/drivers/of/fdt.c
+++ b/drivers/of/fdt.c
@@ -1285,6 +1285,7 @@ void __init unflatten_device_tree(void)
 
 	/* Save the statically-placed regions in the reserved_mem array */
 	fdt_scan_reserved_mem_late();
+	fdt_mark_reserve_mem_nodump();
 
 	/* Populate an empty root node when bootloader doesn't provide one */
 	if (!fdt) {
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index 0ae16da066e2..505735732c13 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -187,6 +187,7 @@ static inline struct device_node *__of_get_dma_parent(const struct device_node *
 
 int fdt_scan_reserved_mem(void);
 void __init fdt_scan_reserved_mem_late(void);
+void __init fdt_mark_reserve_mem_nodump(void);
 
 bool of_fdt_device_is_available(const void *blob, unsigned long node);
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8c9d6395d6a3..f29a07e8fb23 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -677,6 +677,21 @@ static void __init fdt_init_reserved_mem_node(unsigned long node, const char *un
 	reserved_mem_count++;
 }
 
+void __init fdt_mark_reserve_mem_nodump(void)
+{
+	struct reserved_mem *rmem;
+	int i;
+
+	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
+		return;
+
+	for (i = 0; i < reserved_mem_count; i++) {
+		rmem = &reserved_mem[i];
+		if (rmem->size && !rmem->dumpable)
+			memblock_mark_nodump(rmem->base, rmem->size);
+	}
+}
+
 struct rmem_assigned_device {
 	struct device *dev;
 	struct reserved_mem *rmem;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
