Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DCEE784BB
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 15:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V953EPIeuegCobf6kYwhTrVJLA1M1ZvfvjNa/AZ1Xn8=; b=Eujhxz64NnjDeh
	Qx7tFEnABC63DsW5sgGlw46bJw3HT9CiijRy3Vh2QlrUs6JMSzrMUXIG2ZinHcT9HQmMfLlL1OWh4
	SYVn6XEaio6EtSI0KRkGAdAPt+gMdP5GGZaZTHwdaJmBzRr053kae7+C5kcnoqC/nWzwcdo7YtGhk
	B0dncYQyhqaKBgQOT3J+YTvprkC919odbNLU4AzmOEpGCNPu+rrif110O/oBRhZIgVvhD/qgRSMPf
	68GWngP9asCVNj7o5Hgvs/fVTPvk0ezu3p2SQd4FRtwDwNLS8a/E1X7tV7ZQ1FO060Mfj0OMM0jb5
	yPtrxlpmY0ARI6ZIPi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKaD-00CxB1-1n;
	Mon, 02 Oct 2023 15:11:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKaB-00Cx9o-14
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 15:11:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-405524e6769so19682515e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 08:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696259497; x=1696864297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH5x2RpAAFVf+XEG+0f6TamSE9fPT169LwjSjxAPY4U=;
        b=NlNNeIfoGhhm9lFQs2sxSqZnMUq981am8V6DkQF9GtPKy3DH34xgVs+pmXgyIIbTs2
         ZCxsyqdU7Le+5188hn0xOQNSD9wDtM5JPCFv+moSQh46Rnbi0tR9dSJqF/H+O1bytL1F
         PrhP7ou9hsgYcitG9CMjTohNrKCZE86SF5InBBdSCsokSYpWK1NSH+yMiZMP4N/HpK1U
         4UrKy0VTwO255oSCEjQ9ZC8ig5/yekwnASJb1EWftRzoyE1wWzIWa1fAf7d02p7p4cjH
         P6VOsWdcPQd/db6oO/XZIrZCfb99JG/WwuGNyxeG4uIoqXv0jvoKHFB4Rv8lvls3UOfp
         J3tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696259497; x=1696864297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CH5x2RpAAFVf+XEG+0f6TamSE9fPT169LwjSjxAPY4U=;
        b=Y/qaWsaXScD1eaNecbbFHgEgi1Qc44IwnLTVkeh0M5yLTcQQ0xHxR3A2UkBh2SrTIJ
         80vWfhPQ4LmEUEUd8YP5TD88WbiWAOz+q53U/5X3byqV7xdhqqQao5s2geLz094JshZr
         2zUo7neqI611SuqRP9DI7uWl84KhVBAO6xNQ1hmso4wuIsdIrD7zSgvcYvHNg7YsP6gX
         1MMxO242y5/WhXpE0W9SviAyIvI0nPQ/+HCvgpG5N5h3ZJ7a7SMvYwzcVd742gUwuYch
         vK2+kpxx7ubWw7H4+MSHWDxslJEUUl8i3ZqBIQGyceJwlrDdt7rCOoKhFNqFkWxqpT1e
         LiaA==
X-Gm-Message-State: AOJu0YyXOTCInR+jGDpo96l5lpawvZ8jCcnEk4XLdv5ajanp/oo404nw
	adDzsf/xyk7+JpLBgcDe8OhkXw==
X-Google-Smtp-Source: AGHT+IE3cvPQyM2FMWspPhPjMKub5vjeWt6/Vb1fFmHzwxugTPglcumTh9TgVZ+QYgvakVdrqaJiiQ==
X-Received: by 2002:a05:600c:1c9d:b0:401:609f:7f9a with SMTP id k29-20020a05600c1c9d00b00401609f7f9amr10681875wms.8.1696259497220;
        Mon, 02 Oct 2023 08:11:37 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id o14-20020a05600c4fce00b004065d67c3c9sm7473193wmq.8.2023.10.02.08.11.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 08:11:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 1/5] riscv: Use WRITE_ONCE() when setting page table entries
Date: Mon,  2 Oct 2023 17:10:27 +0200
Message-Id: <20231002151031.110551-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231002151031.110551-1-alexghiti@rivosinc.com>
References: <20231002151031.110551-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_081139_367645_3E2FEC21 
X-CRM114-Status: GOOD (  10.36  )
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

To avoid any compiler "weirdness" when accessing page table entries which
are concurrently modified by the HW, let's use WRITE_ONCE() macro
(commit 20a004e7b017 ("arm64: mm: Use READ_ONCE/WRITE_ONCE when accessing
page tables") gives a great explanation with more details).

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable-64.h | 6 +++---
 arch/riscv/include/asm/pgtable.h    | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 7a5097202e15..a65a352dcfbf 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -198,7 +198,7 @@ static inline int pud_user(pud_t pud)
 
 static inline void set_pud(pud_t *pudp, pud_t pud)
 {
-	*pudp = pud;
+	WRITE_ONCE(*pudp, pud);
 }
 
 static inline void pud_clear(pud_t *pudp)
@@ -274,7 +274,7 @@ static inline unsigned long _pmd_pfn(pmd_t pmd)
 static inline void set_p4d(p4d_t *p4dp, p4d_t p4d)
 {
 	if (pgtable_l4_enabled)
-		*p4dp = p4d;
+		WRITE_ONCE(*p4dp, p4d);
 	else
 		set_pud((pud_t *)p4dp, (pud_t){ p4d_val(p4d) });
 }
@@ -347,7 +347,7 @@ static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
 static inline void set_pgd(pgd_t *pgdp, pgd_t pgd)
 {
 	if (pgtable_l5_enabled)
-		*pgdp = pgd;
+		WRITE_ONCE(*pgdp, pgd);
 	else
 		set_p4d((p4d_t *)pgdp, (p4d_t){ pgd_val(pgd) });
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index b2ba3f79cfe9..b820775f4973 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -248,7 +248,7 @@ static inline int pmd_leaf(pmd_t pmd)
 
 static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
 {
-	*pmdp = pmd;
+	WRITE_ONCE(*pmdp, pmd);
 }
 
 static inline void pmd_clear(pmd_t *pmdp)
@@ -509,7 +509,7 @@ static inline int pte_same(pte_t pte_a, pte_t pte_b)
  */
 static inline void set_pte(pte_t *ptep, pte_t pteval)
 {
-	*ptep = pteval;
+	WRITE_ONCE(*ptep, pteval);
 }
 
 void flush_icache_pte(pte_t pte);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
