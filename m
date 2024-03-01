Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB66C5475B
	for <linux-riscv@archiver.kernel.org>; Fri,  1 Mar 2024 09:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=caPrnnTaZxADxMqnhfHkia15P/QlApRxaqQ5lnkRkHY=; b=U+yC3blbeYviAW
	QK9cJM28SgAZ8eHdwkpFPi3lKCgbmxcK+PUqamRWjIhtwf198TM2q70jHVaJ4E26yP6B04KoitrLO
	ONA2QcsCy+uqXL08+9wntP7YLItecU32tzxld95xx6b7+e7xhgQr9FvEfHVaZV09xv8eodaMQTWg3
	WqTqoSkJACMwuxZSp8CPfx3H33lm1AVP5/eAYNoSIyvYZZvQ8fnF/kVBSD11lI8syDdVwMa9ZI1HO
	aqeBg4ERzXDMAgB18GkYdtUHYCyQvFV5BNL6I6MAU96CSSR2yE5pJvEqDtT7fKgfuAAaLx02E5yvS
	0UxQeWXoaEv16f9I55LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz4B-0000000H78d-1PDq;
	Fri, 01 Mar 2024 09:20:31 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz40-0000000H6xU-3GUu
	for linux-riscv@lists.infradead.org;
	Fri, 01 Mar 2024 09:20:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33ddd1624beso1173031f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 01 Mar 2024 01:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709284817; x=1709889617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdWlfuEJdB5bVZdrcri04Zmq/yhRfMcRDdftEw7qNFA=;
        b=zHgGYirN0xvMYJmkxwArVxKkMXXRfxx74Pgp5W9NM3GUNkTkyt5DI4h6AZ3USv+ZGa
         EbyzEsCH5/kjWHqtuwKQpYLbCWRZ+xotegyhHhBHviihaXTahk3mf4zkdep3St71d4KU
         f9rUKU56qmIpaKBFmsdAJQzAUeqVAIE3d2oXTNV2jIQTt0jVGuTenEfEj5PHmthPDQBW
         I4Cz81GjdTWm9pVs9XNrTg5c2mAesln0OJauGN1OA3IRjNPLThjDRlXqR6o0yyJOodjc
         V5wHk9GfTP+KfqjJkMKvOr7FpDupZE2SRi8gXuncUf3QHv6zmuwqtAXQCm7VQUKY8dHT
         o4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709284817; x=1709889617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdWlfuEJdB5bVZdrcri04Zmq/yhRfMcRDdftEw7qNFA=;
        b=Sf6B6+li8/9QVmW5JAULwEhfIL8u5lWV0ZP1ihWwlh3p1uH6DVNzg4HV0oukfhGWiV
         aDWwxaRZVxArTgBNznZowUPVyuQZtQbMQF6AJOS0NWkuIoujmnS7qUUb526DehNtG+qU
         kMV2klermY3DdcH8LccuCSJpXRY+fdU+3FpuZWXVqeU7xGkI567WhIMnNwn1cfxtBBn9
         e7x2ghG6gyIjqnfzrNIsQJAdde2DP3SzGvgWu4ccclt+d/Je4Y4TiFbVXKfj9pe3nmi7
         tb5AYqou4EF3h4/1rla5rNIXjKyRtiQH3LS30TeSbhXQgA9JHqPOfrQvd4MZuZbtT2cW
         RqYg==
X-Forwarded-Encrypted: i=1; AJvYcCVDKfXAOOct0jpa0uXrTdZPnjs5nebUFmcdCPGefwGbVTh9rEaxsn4kObHxGFRSJ8Ly6jUZgTDprJkGsx/6Msfb7keu+rxoyHkFrxvv9tXz
X-Gm-Message-State: AOJu0YzW0xct/yfA2HGFsw1VCZU5aD0nP2xlOmeiAxopg7N3xDc7oNm8
	gy4PSde6IPN43HRW+W+5Jq6GG4/RvhfmcOZSh8Z67XJ67qB7UDR4dlkU0G7xHNM=
X-Google-Smtp-Source: AGHT+IHirYUWWAQ3EzQ3D3sM4w5kbNmWdiMfyHww76VDivA5fk7+UlmhKkRo6vORNs4FOsSe8ylbjw==
X-Received: by 2002:adf:a3c9:0:b0:33e:21bc:bc6f with SMTP id m9-20020adfa3c9000000b0033e21bcbc6fmr809159wrb.11.1709284817327;
        Fri, 01 Mar 2024 01:20:17 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id l9-20020a056000022900b0033cf2063052sm3994161wrz.111.2024.03.01.01.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:20:17 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 5/9] mm: Use common huge_pte_clear() function for riscv/arm64
Date: Fri,  1 Mar 2024 10:14:51 +0100
Message-Id: <20240301091455.246686-6-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240301091455.246686-1-alexghiti@rivosinc.com>
References: <20240301091455.246686-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_012021_070123_B5D03129 
X-CRM114-Status: GOOD (  11.96  )
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

Both architectures have the same implementation so move it to generic code.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/mm/hugetlbpage.c | 12 ------------
 arch/riscv/mm/hugetlbpage.c | 19 -------------------
 mm/contpte.c                | 13 +++++++++++++
 3 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 4da951e81bde..09b55bac8c7c 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -284,18 +284,6 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
 	return entry;
 }
 
-void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
-		    pte_t *ptep, unsigned long sz)
-{
-	int i, ncontig;
-	size_t pgsize;
-
-	ncontig = arch_contpte_get_num_contig(NULL, sz, &pgsize);
-
-	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
-		pte_clear(mm, addr, ptep);
-}
-
 pte_t huge_ptep_get_and_clear(struct mm_struct *mm,
 			      unsigned long addr, pte_t *ptep)
 {
diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
index ebc735f5d325..01b1403dd4cb 100644
--- a/arch/riscv/mm/hugetlbpage.c
+++ b/arch/riscv/mm/hugetlbpage.c
@@ -254,25 +254,6 @@ pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
 	return get_clear_contig_flush(vma->vm_mm, addr, ptep, pte_num);
 }
 
-void huge_pte_clear(struct mm_struct *mm,
-		    unsigned long addr,
-		    pte_t *ptep,
-		    unsigned long sz)
-{
-	size_t pgsize;
-	pte_t pte = ptep_get(ptep);
-	int i, pte_num;
-
-	if (!pte_napot(pte)) {
-		pte_clear(mm, addr, ptep);
-		return;
-	}
-
-	pte_num = arch_contpte_get_num_contig(ptep, 0, &pgsize);
-	for (i = 0; i < pte_num; i++, addr += pgsize, ptep++)
-		pte_clear(mm, addr, ptep);
-}
-
 static bool is_napot_size(unsigned long size)
 {
 	unsigned long order;
diff --git a/mm/contpte.c b/mm/contpte.c
index f7bfa861c6a1..5200c234404d 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -19,6 +19,7 @@
  * This file implements the following contpte aware API:
  * huge_ptep_get()
  * set_huge_pte_at()
+ * huge_pte_clear()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -101,3 +102,15 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr,
 
 	set_contptes(mm, addr, ptep, pte, ncontig, pgsize);
 }
+
+void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+		    pte_t *ptep, unsigned long sz)
+{
+	int i, ncontig;
+	size_t pgsize;
+
+	ncontig = arch_contpte_get_num_contig(ptep, sz, &pgsize);
+
+	for (i = 0; i < ncontig; i++, addr += pgsize, ptep++)
+		pte_clear(mm, addr, ptep);
+}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
