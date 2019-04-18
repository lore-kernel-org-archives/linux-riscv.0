Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF206C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 00:56:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 917812183E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 00:56:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gMB36FOC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lyvDfTTa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 917812183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=51y+FbkiUySs+Yypk+FarDMQHBx/UFsGe5eNJS/U8EM=; b=gMB
	36FOCo6Ha7xna4HVqBW2iTliBAh+25WxkSTUdwxzq0TOumUN1J43UvO2+019RQ2jQKTDERE52P04w
	UnoJPZtigp1uxq2M76K35MrxeDBZ1Zovx5P5uIfzyH97yypcbb1L3O+6bhEYSgXKcC9PGlbijnOVp
	5rbiXEAcj91YRc//hNkkJLOVYLwoq0/DWEQE8lyJO3jV1l0MPfIRKDns6atl5Wn2l69VNlGnyvmN2
	0+d4Du/6PaNErn2dbdZeu3fdyFqJG+z/85E/1UvM31kssbCJXnHnvJd/GuBqdwV+nKKOgW61ep1hi
	mv1N3DZ9bdLbB6dwCAaHSX+jXw2DnqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGvLu-0002z2-K1; Thu, 18 Apr 2019 00:56:34 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGvLs-0002yI-9N
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 00:56:33 +0000
Received: by mail-pf1-x442.google.com with SMTP id c207so271161pfc.7
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 17:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NCTHDha1xM/aVhgZQjb426tHN47IE4D29YS6s+8P+hI=;
 b=lyvDfTTaK38CqH1AhVyLFO5T4uwMdNwEKxMXlLK6Lpa3f85mFo4McQeMf8zqhAOhXR
 bzNV3fMbnmQTCPuPsop6W2MbELV/HdTm6TOmNhicM5OpKt617ir9uMXZrm/aeE6mqS5L
 oklQjol5CW+xUvNOci0gOlMPa9X3RKaSzvTkVFmkzQY2lWFnqOHn7FxqyQ4Oj0HuraTQ
 48vTGo0JB5aRwV8wjJ5WwkcKvyQZo37HI+uoUGXoZC5IMnUw4yLuM3/v1Buyc4F0Eh3a
 1Y12KICsKkRC1RIdvDEd91/cvpPoYk6CmhGJol4zWVvuRNpJbKCSRXH/I9FAtZxQkgki
 GyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NCTHDha1xM/aVhgZQjb426tHN47IE4D29YS6s+8P+hI=;
 b=sZ0f4pgEoP/emY/YKxt7mvIRgY77QQmwJ3VXnkOC3AHFD5hUkMGuI8okW7uESumKiL
 N6RY90S+ZkKLN17eZ+V107upVH2UWsKpSTu6EnkvYVPhxUSGwmRb1CHT9N3da8Zg1vOk
 bzedztGBoXdYw3rJhUtScMp4jkEpMo09aQcgiRZlbvOpffol9eSZRrQovIY2lwJ0YhWd
 0/DLwDUZaZBeL4qo6QaMZsqYre7FxGi7trE6PCaJq0AucXdRNRvx7a36LgkztN2YmFs8
 On+U3ZV0zIFnyEkLmDK4usLIjNc1G3TWb10LwpytTRtAAIk5vez3HeSAkYd/ZOdt0960
 mDQg==
X-Gm-Message-State: APjAAAUvQjMC+kvxban9lxDE6swsagj43O9BlN5Fjd1WDcPLLbLC5kLH
 Velz8GzkvNnsLMB4eIsBo10=
X-Google-Smtp-Source: APXvYqwzKcJWAZA8gk9S1Rf9zj2fXvswUwesJyaWKSO+DGtnzhnROt1yEAC+FUIf//a2bzMHhUBTCA==
X-Received: by 2002:a63:4e10:: with SMTP id c16mr85610316pgb.302.1555548989107; 
 Wed, 17 Apr 2019 17:56:29 -0700 (PDT)
Received: from pcliush.allwinnertech.com ([223.197.233.48])
 by smtp.gmail.com with ESMTPSA id p14sm535622pfa.26.2019.04.17.17.56.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 17 Apr 2019 17:56:28 -0700 (PDT)
From: damon <liush.damon@gmail.com>
To: palmer@sifive.com
Subject: [PATCH] RISC-V: redefine PTRS_PER_PGD/PTRS_PER_PMD/PTRS_PER_PTE
Date: Thu, 18 Apr 2019 08:56:15 +0800
Message-Id: <1555548975-7011-1-git-send-email-liush.damon@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_175632_330775_1186254A 
X-CRM114-Status: UNSURE (   9.65  )
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
 arch/riscv/include/asm/pgtable-32.h | 2 ++
 arch/riscv/include/asm/pgtable-64.h | 3 ++-
 arch/riscv/include/asm/pgtable.h    | 4 ++--
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index d61974b7..93607f6 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -17,8 +17,10 @@
 #include <asm-generic/pgtable-nopmd.h>
 #include <linux/const.h>
 
+#define MAX_USER_VA_BITS	32
 /* Size of region mapped by a page global directory */
 #define PGDIR_SHIFT     22
+#define PMD_SHIFT       PGDIR_SHIFT
 #define PGDIR_SIZE      (_AC(1, UL) << PGDIR_SHIFT)
 #define PGDIR_MASK      (~(PGDIR_SIZE - 1))
 
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
index 1141364..d9cb3c8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -33,9 +33,9 @@
 #endif /* CONFIG_64BIT */
 
 /* Number of entries in the page global directory */
-#define PTRS_PER_PGD    (PAGE_SIZE / sizeof(pgd_t))
+#define PTRS_PER_PGD (1 << (MAX_USER_VA_BITS - PGDIR_SHIFT))
 /* Number of entries in the page table */
-#define PTRS_PER_PTE    (PAGE_SIZE / sizeof(pte_t))
+#define PTRS_PER_PTE   (1 << (PMD_SHIFT - PAGE_SHIFT))
 
 /* Number of PGD entries that a user-mode program can use */
 #define USER_PTRS_PER_PGD   (TASK_SIZE / PGDIR_SIZE)
-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
