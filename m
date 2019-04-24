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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F06FC10F11
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 07:51:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E267E2148D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Apr 2019 07:51:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pY1RSQoz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSYYeM2z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E267E2148D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=256G9vhHq/U8MVlSS9aqiulgPFqnkpA2I1AfYTiQpMs=; b=pY1
	RSQoz5HUTrnJSsFUK5PbZEBz6H8bnp/C27WhMnKERlMy9eqpHqTp4+3L9nSAsIrQCbBclsGwRGfUW
	D2NLtKam6hEyu/IATMMjaKdvnJ93mIsKJ5U4UzVihf0T0/Dqm6LnjJgbEe6onayX+O8nl8k+uQmuz
	E9Pf7UUoGPNCfZFLnQ71gEh5ty9jVIQn41AT6esM0gVU1KNkQDqI/W7cPmKNWy3Rhu9+wtp3LkDEd
	lksO77oY7cC/CYanTwhdkX4vmES55yJk18g8yp3AqxHm8N1EhNQWTBZHxYlHvEbk/UAMXwsHwUCPo
	e70UAk38BYW5G7FsB06ktJjevkO9Pqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJCgj-0002WK-Dt; Wed, 24 Apr 2019 07:51:29 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJCgg-0002Vz-Rp
 for linux-riscv@lists.infradead.org; Wed, 24 Apr 2019 07:51:28 +0000
Received: by mail-pf1-x442.google.com with SMTP id c207so8864068pfc.7
 for <linux-riscv@lists.infradead.org>; Wed, 24 Apr 2019 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MUzBcZSYyjNmVAln4pH9+hDa+BhI195V73WdadLwrkU=;
 b=WSYYeM2z+eSgl8RJu1kf4xsUmWL7TbV5E6Ksim/kAqfLPjA9PZ2Ruuvb75pEEBqmaO
 hmWO8ZJfjNoZbzzYPXrRpUjgt+lJD3bGSmVjVYN2/NEqvqoD8j0iKTDs2o+VhkFoWGds
 2h1UGZnLo647Fkru6r8zZyfQfjZNFXTKr9jQeyHFnKf7ysfUwJ7XjFtutT1KGrKFfwRs
 +1WMMPH3DzHK5klPDLqH4FpXyp+8fnxG4KLx4sguNKZYUyYmi4AeFPShJ9wO/0d1Aky0
 sdobm3ERFskuhlTX5kM4GeTCYdI9x1W8Jb5znHsCNaQYZE9DWOvN6IULgWk6dDXp8VfP
 Tagw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MUzBcZSYyjNmVAln4pH9+hDa+BhI195V73WdadLwrkU=;
 b=W5FTutL4T9lB4JAiStIzG7Pap5g5dgpoPiQlHmNNnUgbgwHBi6m5Hd8wc1iMLlhIEa
 XB8kmV/PvCD1SxpCxYQqkHDzplhKuSRkj2vwxBDqOBDVKOVi49IskSzN0PLb1tjGKf0Y
 Vo4H/SKu4ZSwaET6qbDHnlVreuUSfALwqA+q5ef91yp2zmr0d9uhbbGlC6zkvxdw60A6
 ROxf0qaGyHV8/Ffxabre3KdA64tVcp58Y7xs5CFb1PpiTpOcDp0S0YqJg30TF/ziGsXC
 VrxuZSt0PGx0kRhUaSkOet/Ez1rQ3O+6SIT7vuDu3b7AUbOV/k7GBYNMaBh+rFMJJI6h
 N/tA==
X-Gm-Message-State: APjAAAW2np7FXxkWCdlZ+fLYhip+tX11prPq72gv1MvHzwKOFYbeHap7
 vbYip7873apuQNe5Gx8y2bY=
X-Google-Smtp-Source: APXvYqxujmGRGHIEdw7D/0pkEzjunqAgdRRM4DDeb4gBYviMbCW/tf7YM7mgvUfEu4nd/i+ZrtWk2g==
X-Received: by 2002:a63:6e88:: with SMTP id j130mr6603072pgc.452.1556092285074; 
 Wed, 24 Apr 2019 00:51:25 -0700 (PDT)
Received: from pcliush.allwinnertech.com ([223.197.233.48])
 by smtp.gmail.com with ESMTPSA id y23sm26230823pfn.25.2019.04.24.00.51.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 24 Apr 2019 00:51:24 -0700 (PDT)
From: damon <liush.damon@gmail.com>
To: palmer@sifive.com
Subject: [PATCH] RISC-V: redefine PTRS_PER_PGD/PTRS_PER_PMD/PTRS_PER_PTE
Date: Wed, 24 Apr 2019 15:51:08 +0800
Message-Id: <1556092268-4646-1-git-send-email-liush.damon@gmail.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_005126_923693_F5A3A9FD 
X-CRM114-Status: UNSURE (   9.32  )
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
 arch/riscv/include/asm/pgtable.h    | 8 ++++++--
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-32.h b/arch/riscv/include/asm/pgtable-32.h
index d61974b7..433886b 100644
--- a/arch/riscv/include/asm/pgtable-32.h
+++ b/arch/riscv/include/asm/pgtable-32.h
@@ -17,6 +17,8 @@
 #include <asm-generic/pgtable-nopmd.h>
 #include <linux/const.h>
 
+#define __PAGETABLE_PMD_FOLDED    1
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
