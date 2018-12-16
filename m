Return-Path: <SRS0=9k1K=OZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A1FC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 16 Dec 2018 18:04:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 637862086C
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 16 Dec 2018 18:04:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ua7Cef8g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FZlBPxOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 637862086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hmfAEm4Qj+StCVmljQ9Qoc3hAwbB7ukJhA54V/BVdJU=; b=ua7
	Cef8gGC8BckpbE5mwBlp4CutKmS1HaRhflTsneCwcjj+rEn8JelFTkVGVjaOhK8aEKCnc4wDhfi8h
	qPmYdzqHbv5+NoKNWMNHwlvJTCnxlgdmFwGCtreQd1glq1AEhpOu/TMfNiWn9whG/zt/vpz+f0a3s
	hHXqbRCGA+7CQEniVW6nWNWZDe9GXnwzTUEyg0gh8NLSab89EtRSyL6szDzmPwxnK3UMPpsdLtsbj
	KdozuayxwW7CMmi27xTKMFnaKyOXI2rFuxn4j5uY0Wq985Z3wfkaVSALebAVHPQd2XoC+HeCdgJsJ
	KDZcoUGkNgLGauXB3DWGPHgk7nqkE+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gYalq-000109-2G; Sun, 16 Dec 2018 18:04:06 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gYaln-0000zM-Qo
 for linux-riscv@lists.infradead.org; Sun, 16 Dec 2018 18:04:05 +0000
Received: by mail-qt1-x844.google.com with SMTP id l12so9842838qtf.8
 for <linux-riscv@lists.infradead.org>; Sun, 16 Dec 2018 10:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rvHpJWfTTMCUcKv/KWTyQrS0/obJwwOc6wfC71e9TRo=;
 b=FZlBPxOhYvFB7XR2jf9HJAkOIHl5MxrCzu2JHC4wuvEaxkIixPr6Ay7gLRCBnRTBfw
 ijRXLHJydkiipgRNQV1hkx+6KkqQct0ID8MXxEw1JhD3QCETZYY2XUTALN56dR4FcYaA
 GLY+ZFoFwrEjRnrWmjlmxs36pyN92LBo2KYsHCvjraYv5njoC1rba1vlw21w01Ysmbd5
 h9udfifhgBj6n9F3n9PAwTKijTjONRIugHimR9XExIZq3dXnJ7rcgMNR+eSFduUUtXwf
 uYRBfY41TM5xhs1ZyAQZSZs4XsUGxwYJff2NmoKMwac8yQ4FGoqS1M8dNcYJ5Li0xCO7
 2QDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rvHpJWfTTMCUcKv/KWTyQrS0/obJwwOc6wfC71e9TRo=;
 b=Uw9W41rpcmpg7ZYSXAoxD6j1dR4f8IpEq74RIUVf1tRdlH2sWiXzvXqJ6Oiia/n6ZB
 Mx3dYFJUDend8PMr7iHLCVO8O7NmzqMjPX6mKoi2SVpSTtXdW2XtQlqJIbEmdM0xOamS
 KCHRUL5MaoCgiXJoaN4nzZHLL/zD+ENDv9wVzp2RrzKQaEE1x89CsoPMBXnzWn6mp5zp
 lzchLCMQ7JIUfEJrKCcaKSmyhoDUAU6TdgcuPqUA09nu+8lPAaSrjr9SzmRjEPQM8HrR
 OR/Y0N77x0+cVKqKUK267tsOwZmQBqeHh50lkgN1edaeoEVzB72IzPkIjGxlpcMMpgvc
 uXrw==
X-Gm-Message-State: AA+aEWZmyOXFE1lUEyGCjSsMEgEDoyhTjGyb28/kt2FiDzhcCyTVekW8
 cw0gtM8uQA9V7Rn8r01G9Ck=
X-Google-Smtp-Source: AFSGD/XvHmdONLsSBUOpQxhBcwTmP+agc7ahq1vxJeXf5Ypkyv7i7hN3zu4fcitaecfZa9uUvhgjOQ==
X-Received: by 2002:a0c:fb4c:: with SMTP id b12mr10303083qvq.177.1544983432299; 
 Sun, 16 Dec 2018 10:03:52 -0800 (PST)
Received: from localhost.localdomain
 (209-6-78-127.s3965.c3-0.abr-cbr1.sbo-abr.ma.cable.rcncustomer.com.
 [209.6.78.127])
 by smtp.gmail.com with ESMTPSA id 94sm10370728qks.8.2018.12.16.10.03.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 16 Dec 2018 10:03:51 -0800 (PST)
From: Stefan O'Rear <sorear2@gmail.com>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Add pte bit to distinguish swap from invalid
Date: Sun, 16 Dec 2018 13:03:36 -0500
Message-Id: <1544983416-32532-1-git-send-email-sorear2@gmail.com>
X-Mailer: git-send-email 2.8.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181216_100403_866347_268467B3 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: Stefan O'Rear <sorear2@gmail.com>, schwab@suse.de
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Previously, invalid PTEs and swap PTEs had the same binary
representation, causing errors when attempting to unmap PROT_NONE
mappings, including implicit unmap on exit.

Typical error:

swap_info_get: Bad swap file entry 40000000007a9879
BUG: Bad page map in process a.out  pte:3d4c3cc0 pmd:3e521401

Cc: stable@vger.kernel.org
Signed-off-by: Stefan O'Rear <sorear2@gmail.com>
---
 arch/riscv/include/asm/pgtable-bits.h | 6 ++++++
 arch/riscv/include/asm/pgtable.h      | 8 ++++----
 2 files changed, 10 insertions(+), 4 deletions(-)

Reproducer:

#include <sys/mman.h>

int
main (void)
{
  char *a = mmap (0, 4096, PROT_READ | PROT_WRITE,
                  MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
  ++*a;
  mprotect (a, 4096, PROT_NONE);
}

diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index 2fa2942..470755c 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -35,6 +35,12 @@
 #define _PAGE_SPECIAL   _PAGE_SOFT
 #define _PAGE_TABLE     _PAGE_PRESENT
 
+/*
+ * _PAGE_PROT_NONE is set on not-present pages (and ignored by the hardware) to
+ * distinguish them from swapped out pages
+ */
+#define _PAGE_PROT_NONE _PAGE_READ
+
 #define _PAGE_PFN_SHIFT 10
 
 /* Set of bits to preserve across pte_modify() */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1630196..a8179a8 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -44,7 +44,7 @@
 /* Page protection bits */
 #define _PAGE_BASE	(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER)
 
-#define PAGE_NONE		__pgprot(0)
+#define PAGE_NONE		__pgprot(_PAGE_PROT_NONE)
 #define PAGE_READ		__pgprot(_PAGE_BASE | _PAGE_READ)
 #define PAGE_WRITE		__pgprot(_PAGE_BASE | _PAGE_READ | _PAGE_WRITE)
 #define PAGE_EXEC		__pgprot(_PAGE_BASE | _PAGE_EXEC)
@@ -98,7 +98,7 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 
 static inline int pmd_present(pmd_t pmd)
 {
-	return (pmd_val(pmd) & _PAGE_PRESENT);
+	return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
 }
 
 static inline int pmd_none(pmd_t pmd)
@@ -178,7 +178,7 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long addr)
 
 static inline int pte_present(pte_t pte)
 {
-	return (pte_val(pte) & _PAGE_PRESENT);
+	return (pte_val(pte) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
 }
 
 static inline int pte_none(pte_t pte)
@@ -380,7 +380,7 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
  *
  * Format of swap PTE:
  *	bit            0:	_PAGE_PRESENT (zero)
- *	bit            1:	reserved for future use (zero)
+ *	bit            1:	_PAGE_PROT_NONE (zero)
  *	bits      2 to 6:	swap type
  *	bits 7 to XLEN-1:	swap offset
  */
-- 
2.8.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
