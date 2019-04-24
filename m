Return-Path: <SRS0=xoWQ=S2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 616E0C282E1
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 08:12:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 307E4206A3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 08:12:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hoLzweqe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCjQK8Oc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 307E4206A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pDZfD273ZVB/W2vQ6yHC8EoKXZxVa+N5LF3rNb1i0Mw=; b=hoL
	zweqeVQXQvXGa+VKkxmw7yeo4pTRmpSxpgcMa7e0zsuTsmrj6zRehj/QpHeGU2lCCRTQ3x6a3Uxxb
	+XSooVCQ7p5a44l2egLlfm0vYtT7+HbdVSKkIrisYIIow1f3v6DWDNIw/x80GW18IVm4h6kZA3D/G
	ccTyimAKOz9kxFaY9dNEiMBh1laxXJKOJeLhB/fwccWNlbxV8iMNBXQIAP3Ro73BSSj+nb68pzfaY
	oXWnp2A/kIN7ykfnTGEZqeClIxqsIfl9NxbAn45OWv6N1HABQ3/1qY+hLeXlF//H3Cg2gKwgisGE4
	i/UVnl/mCoxVvBXt4Ows4oxf1H14b2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJD0i-0008O0-MR; Wed, 24 Apr 2019 08:12:08 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJD0g-0008NR-7f
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 08:12:07 +0000
Received: by mail-pf1-x444.google.com with SMTP id 10so8898642pfo.5
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 01:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+Gec7FRhM0jPCKhXUciEsB2cjoFyID0e5GFvyWjnfN4=;
 b=dCjQK8OcVo/BGC+YpF5QV6FTDvl2SzV3/l2XEOsfYJgkMIars4bzVLJPHuJrW1DNXv
 11aWwm8hsIOAeorJ/EOJPZDjbKIiTkRXZaqjdhYDaC2UDTm9kX8eKEeDv1dWYiRyD/+k
 pdEQaj60j5DI8JWWbmjT/NDNFamuZEASVync54AttusmyaFBW+QuYqFHXmFUJXti1M6a
 H7PdQ9ghgGEGhl5bYH4HSNJhVn3oW3JOD6na/I+awwSrAPLMiRClIw/onShGLlRyzcyF
 0UAhU8e8nI64XoL6OCWahJIvJTLfu0czabityXv8MoYUZgxflnqWKwRKQh3AEBl9JOsZ
 fBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+Gec7FRhM0jPCKhXUciEsB2cjoFyID0e5GFvyWjnfN4=;
 b=sBT4swGRk2IqfnsK4bvLkmF+aIUz0mV2kVKpy3b6nAQwqdHurQGB6uOfUjKE1lBIQP
 TiEWsomj1tg9KerlfABcRvDBPu3p4+yc3DUFtV6OvBY4i6F+UGAI57AMOgvEou3ZdDJj
 nuJlnmgW6NezArfbM8zwqIFuMsvXwN+wCbzgA/WWprUH/x/Pq+PRmuL05On2eGu2LNhw
 zCNBKS3/Svcxn1sQCesbFaa9fOWMuagmR9Tc2pBPG1La9UC49v6QVKCqfLrsjAdxQwIi
 JTmraCspZLoqyPL2xOFxo0XcIV8gtqAWOmTSIBOLX9cGZdW2PsnXaK5etnRPo4H38n6Q
 0+9g==
X-Gm-Message-State: APjAAAU8ikJujY37yKUq7DwwmXQGla1huHON9eBV309F/SZ+1ISVwfuZ
 gbIUaPqXkdJllKPRi40Vx2U=
X-Google-Smtp-Source: APXvYqwsIxdzfP1eNqHUpfaavJFf5wQCyrZyT7TWrKfDB97alOnVEKBAZwYJr0a25tNYojn+R5vlmg==
X-Received: by 2002:a63:cc0c:: with SMTP id x12mr28384250pgf.336.1556093525519; 
 Wed, 24 Apr 2019 01:12:05 -0700 (PDT)
Received: from pcliush.allwinnertech.com ([223.197.233.48])
 by smtp.gmail.com with ESMTPSA id u6sm26930469pfm.10.2019.04.24.01.12.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 Apr 2019 01:12:05 -0700 (PDT)
From: damon <liush.damon@gmail.com>
To: palmer@sifive.com
Subject: [PATCH] RISC-V: redefine PTRS_PER_PGD/PTRS_PER_PMD/PTRS_PER_PTE
Date: Wed, 24 Apr 2019 16:11:52 +0800
Message-Id: <1556093512-5006-1-git-send-email-liush.damon@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_011206_295595_91C75EB7 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: sorear2@gmail.com, aou@eecs.berkeley.edu, anup.patel@wdc.com,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com, liush.damon@gmail.com,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Use the number of addresses to define the relevant macros.

Signed-off-by: damon <liush.damon@gmail.com>
---
 arch/riscv/include/asm/pgtable-32.h | 1 +
 arch/riscv/include/asm/pgtable-64.h | 3 ++-
 arch/riscv/include/asm/pgtable.h    | 8 ++++++--
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index d61974b7..c9c8ca8 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -17,6 +17,7 @@
 #include <asm-generic/pgtable-nopmd.h>
 #include <linux/const.h>
 
+#define MAX_USER_VA_BITS	32
 /* Size of region mapped by a page global directory */
 #define PGDIR_SHIFT     22
 #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 7aa0ea9..a56d4d0 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -16,6 +16,7 @@
 
 #include <linux/const.h>
 
+#define MAX_USER_VA_BITS	39
 #define PGDIR_SHIFT     30
 /* Size of region mapped by a page global directory */
 #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
@@ -34,7 +35,7 @@
 #define pmd_val(x)      ((x).pmd)
 #define __pmd(x)        ((pmd_t) { (x) })
 
-#define PTRS_PER_PMD    (PAGE_SIZE / sizeof(pmd_t))
+#define PTRS_PER_PMD    (1 << (PGDIR_SHIFT - PMD_SHIFT))
 
 static inline int pud_present(pud_t pud)
 {
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1141364..9148043 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -33,9 +33,13 @@
 #endif /* CONFIG_64BIT */
 
 /* Number of entries in the page global directory */
-#define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
+#define PTRS_PER_PGD (1 << (MAX_USER_VA_BITS - PGDIR_SHIFT))
 /* Number of entries in the page table */
-#define PTRS_PER_PTE    (PAGE_SIZE / sizeof(pte_t))
+#ifdef __PAGETABLE_PMD_FOLDED
+#define PTRS_PER_PTE   (1 << (PGDIR_SHIFT - PAGE_SHIFT))
+#else
+#define PTRS_PER_PTE   (1 << (PMD_SHIFT - PAGE_SHIFT))
+#endif
 
 /* Number of PGD entries that a user-mode program can use */
 #define USER_PTRS_PER_PGD   (TASK_SIZE / PGDIR_SIZE)
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
