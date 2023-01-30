Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F5DC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 07:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bxcd6Wi1Bss6dotr/YztA7uJnwEpAGNI8XykGzC58bI=; b=NqK/r0WAWADSYu
	J6YI37yFQ6N7o0Y738x6uXhLpbWOC61rRZigNtvHqbh/ymDYXnBdoWwAgRfI73oL9Z2sSKPop5Zll
	xGZPebjxc4RMSKzPAETR77eD4NSMYG3gGUfCC7YBIXPqznosHS3uNJnEfpfqvcrwOZXD36jGCo8cp
	oLnDKVGgA40QEsifzkecxawO3VHvIddDxoSTp07FzfI+kd0Qi0GXyjIalX5MX51gF1b11/q+Fr325
	NedukguJ07oVKCw4iD89T+i+HM7uHeTPSiAiphzxVRmUh0LB11vTyZ6pygpR8Xn3iXfzx6AoOBIiO
	H7h1/Oy2zHg8Z9/e8PSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOu7-002aVc-Cl; Mon, 30 Jan 2023 07:48:39 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMOu4-002aV4-2e
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 07:48:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id e8-20020a17090a9a8800b0022c387f0f93so9528020pjp.3
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 23:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+EE2RUnCxOFzhqQnZMEShMLcYqpIxKaJvAS8hO+IecU=;
        b=mlp+0yvseuCrgY5TiOG1w8PHsYUOOVo/GMFuAaxw7ajbOZRWvQe9Z3KE9yUQORAEQz
         xLOgFDf06Mu+DUtlsxwkMwgs7nz2QYBNCOGrIyIVBmgD5Uvagh/uuMoNskhq94SwbLIt
         u0aoDTcYxOnBRGy6bgX+FeaZ7WwHamUIYDHydoWOIQwzJs8+azSy1ib6bosDIUSQP0Q1
         UE/KG+9wjNw9fWtAUYkTYONH+iPdWfPoqyangRLoRQv4LWzyyF9g8WuHYnyc+Fx/6xhN
         zwcXnLFSBhb5derWpwkcFT4MsGB0PK0lqaXwE6Pad5reTVTPLWDcQH4uGyLgpmFhk4k0
         DetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EE2RUnCxOFzhqQnZMEShMLcYqpIxKaJvAS8hO+IecU=;
        b=CxUUWNiOTCJQlvrllKPsZHEO14iSx6fzrim7NDrTrRha32Be0L4qPwlPnnOipafyQg
         oo2llghNzizY5IgrQqZpP7E7DKxC9AcAJU9hdzeySaE1EBowYreW8882DsacEzc0jnwi
         51FG4KyncHfglp75z02UcLM71FIMXztvDUA2P57jOwUBVTNFhAECNmfTRpq9ZypHRYjD
         9KV6UzZcZ7MaJwScquh5ijjC6X2GZQHl5LRojKbf7NmiT4JmyXaErOFzp+nGRdRbgSx7
         YrMrO4iCQAjJgbM4pcsQPwf9Yohf7nG9bgyKRRCdWS1OsE8OI2bN5JTC5RF5IxQk9F1y
         aDaQ==
X-Gm-Message-State: AO0yUKV0j7AfNAzqOsrJFAlm94zcFMJSMG3s2Ux/2TkEjOVrqT3ebN40
	Ph225TPordGs5pg6q0KUWxenSQ==
X-Google-Smtp-Source: AK7set9kuo9MgxRnIvoLUZUm7OlM56WyT6wA/miOQzSgK8Mm1K6NgIuEzRc3UAWOcWfLf8GITWTOag==
X-Received: by 2002:a17:902:da92:b0:196:7df6:2d38 with SMTP id j18-20020a170902da9200b001967df62d38mr4344785plx.7.1675064914124;
        Sun, 29 Jan 2023 23:48:34 -0800 (PST)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id i6-20020a170902c94600b0019625428cefsm7046078pla.281.2023.01.29.23.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 23:48:33 -0800 (PST)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Nanyong Sun <sunnanyong@huawei.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2] riscv: mm: Implement pmdp_collapse_flush for THP
Date: Mon, 30 Jan 2023 13:18:15 +0530
Message-Id: <20230130074815.1694055-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_234836_137743_1634805A 
X-CRM114-Status: GOOD (  11.86  )
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

When THP is enabled, 4K pages are collapsed into a single huge
page using the generic pmdp_collapse_flush() which will further
use flush_tlb_range() to shoot-down stale TLB entries. Unfortunately,
the generic pmdp_collapse_flush() only invalidates cached leaf PTEs
using address specific SFENCEs which results in repetitive (or
unpredictable) page faults on RISC-V implementations which cache
non-leaf PTEs.

Provide a RISC-V specific pmdp_collapse_flush() which ensures both
cached leaf and non-leaf PTEs are invalidated by using non-address
specific SFENCEs as recommended by the RISC-V privileged specification.

Fixes: e88b333142e4 ("riscv: mm: add THP support on 64-bit")
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 arch/riscv/include/asm/pgtable.h |  4 ++++
 arch/riscv/mm/pgtable.c          | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4eba9a98d0e3..3e01f4f3ab08 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -721,6 +721,10 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 	page_table_check_pmd_set(vma->vm_mm, address, pmdp, pmd);
 	return __pmd(atomic_long_xchg((atomic_long_t *)pmdp, pmd_val(pmd)));
 }
+
+#define pmdp_collapse_flush pmdp_collapse_flush
+extern pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
+				 unsigned long address, pmd_t *pmdp);
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /*
diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
index 6645ead1a7c1..5da1916c231e 100644
--- a/arch/riscv/mm/pgtable.c
+++ b/arch/riscv/mm/pgtable.c
@@ -81,3 +81,29 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 }
 
 #endif /* CONFIG_HAVE_ARCH_HUGE_VMAP */
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
+					unsigned long address, pmd_t *pmdp)
+{
+	pmd_t pmd = pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
+
+	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
+	VM_BUG_ON(pmd_trans_huge(*pmdp));
+	/*
+	 * When leaf PTE enteries (regular pages) are collapsed into a leaf
+	 * PMD entry (huge page), a valid non-leaf PTE is converted into a
+	 * valid leaf PTE at the level 1 page table. The RISC-V privileged v1.12
+	 * specification allows implementations to cache valid non-leaf PTEs,
+	 * but the section "4.2.1 Supervisor Memory-Management Fence
+	 * Instruction" recommends the following:
+	 * "If software modifies a non-leaf PTE, it should execute SFENCE.VMA
+	 * with rs1=x0. If any PTE along the traversal path had its G bit set,
+	 * rs2 must be x0; otherwise, rs2 should be set to the ASID for which
+	 * the translation is being modified."
+	 * Based on the above recommendation, we should do full flush whenever
+	 * leaf PTE entries are collapsed into a leaf PMD entry.
+	 */
+	flush_tlb_mm(vma->vm_mm);
+	return pmd;
+}
+#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
