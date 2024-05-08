Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C1CC04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 19:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98FhuY0h2aRCvtyGey5tXfXNWWEWWmGTSmoEunmJ7Jg=; b=Pbr9pOeUdjPPHH
	48gY/uvRmHQzVvCzJpY/Ojb2Yn4H1ICxWDYXuF1eEj3wmMV6LHCEqMkfWjEoF+3ezpua9qnlRBuvz
	6H2JQdrgjixlVj9LrAC8rMfERr9E/qt8GEzN0wusNPsw5wKJHNcuToweDfgxTV+QfilNH80VUgl/V
	zjrf3dnD+wNIVFqg+mE5NoVG/7c9U5FoZiKnCz7w8KZY8WQm/kUmMi1iC0mQTpFkzICPP+/IzbLXI
	Po8mauxV3JJrXiLJKRZefRQ+yCbzFi6lq3PVaSeBHAztIyLy/oOsnSRWa4ubaP5Ckt9hgE05DMTCW
	EB/o5zatDRRRfJW5VDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mvE-0000000Gj6A-09bH;
	Wed, 08 May 2024 19:25:48 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mvA-0000000Gj4R-0Yi6
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:25:46 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-41ba1ba55ebso508905e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 12:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715196343; x=1715801143; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nb289X82Pwy2psbtYSkuOYlUdcLMn+kmFJiTkQU5Z+c=;
        b=YrcPVxU+LPzZiUkNNM6fu0m6FTOQSJwDMXWX4JJ6UykoVzy+Zc/Flra/QiMcSJ5uTJ
         YprDNtkOrJNabA4OPYHK3OaMWqXNlvjKaSw4K1pw0AtmUBOLhVy2WZvMRsQaFkXUA45J
         juEEq9iG7Oi3HZE6/VcNc7uAOCAr6i3JPafyI/xBVcQCqFrrnWxl6Bb5GNLc8cvB0/Mc
         rA61xTFTtNAOBnvItXZrLg6kcpjS4NpBvy1H8hHHk/fbP4O0ljKsvRTm+FJU8Rlr4jDY
         QNOIvRkHF7vXSHqjEyDmrRdWtfOD+/m2qTs3BqFpxmEmyTm63QXhxCP1A0tYqxY8qGuB
         WnOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715196343; x=1715801143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nb289X82Pwy2psbtYSkuOYlUdcLMn+kmFJiTkQU5Z+c=;
        b=YkboLWwMnDFdhb78z8SIObBedg9LJGoFpouHm/cwVQ9Z64ecM40sVb+TWmNHt6MMn9
         AAjGmAtXewNtMlVHYKs6KQa3bSrxgv0752RSQJnBQZ6hwYcMcDCL+AgOOY7GpFreGbE1
         veaUvZQoAnZKF2VuSaZ0NjNylEUdiyEtlZOKRkKDVkulmWGmQTgybB6AEjtbHwEQ6HAs
         wTo5RitOyW6sqGtvNqLEhX0Z136yP1jzAthftJeC9VQAksVxKb9EP6XDMZz6U+aKGIoW
         /+sFwW+zL0yvCbAOcsC/knurgHislEM4TXBta/FGqgrOVKqlfccVZcQ7+RdjZzF6EcVA
         Tj9w==
X-Forwarded-Encrypted: i=1; AJvYcCWObflvla4iAxYC15ck5tBG865wu1/IM8JMimqcU2yfIBtG7vnajSQS6F2K+YyVso2JPgXrMGd0BlCkRTQEqC1BB3TCRyhLQjlLsv7DfSxH
X-Gm-Message-State: AOJu0YzG7v3LiequRj2z+qf7rBZRKkB933tWZxgx2W/ieRRI79HRn6NY
	ofrZKphxkI1eHB/4pFuQHdLS26pMgTXawVpiGYC4aNfoSawEVhAagLZ1dYrv3Dk=
X-Google-Smtp-Source: AGHT+IFUGL9dDH2gwgI9tPWACeaOFPW71lxlPF9m81I7+sLroC1dBTrL+wbzR1KIUMB3+0Tz7vFgZA==
X-Received: by 2002:adf:a492:0:b0:343:a368:f792 with SMTP id ffacd0b85a97d-34fca621315mr2849241f8f.52.1715196342717;
        Wed, 08 May 2024 12:25:42 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id b12-20020a5d4d8c000000b0034e65b8b43fsm14038517wru.8.2024.05.08.12.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:25:42 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Ryan Roberts <ryan.roberts@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-efi@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH 06/12] mm, riscv, arm64: Use common pte_clear() function
Date: Wed,  8 May 2024 21:19:25 +0200
Message-Id: <20240508191931.46060-7-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_122544_195841_F101DBC2 
X-CRM114-Status: GOOD (  11.28  )
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

Make riscv use the contpte aware pte_clear() function from arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 9 +++------
 arch/riscv/include/asm/pgtable.h | 4 +++-
 arch/riscv/mm/init.c             | 2 +-
 mm/contpte.c                     | 6 ++++++
 4 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index bb6210fb72c8..74e582f2884f 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1439,12 +1439,9 @@ extern void set_ptes(struct mm_struct *mm, unsigned long addr,
 		     pte_t *ptep, pte_t pte, unsigned int nr);
 #define set_ptes set_ptes
 
-static inline void pte_clear(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep)
-{
-	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
-	__pte_clear(mm, addr, ptep);
-}
+extern void pte_clear(struct mm_struct *mm,
+		      unsigned long addr, pte_t *ptep);
+#define pte_clear pte_clear
 
 #define clear_full_ptes clear_full_ptes
 static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4f8f673787e7..41534f4b8a6d 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -792,18 +792,20 @@ extern void set_ptes(struct mm_struct *mm, unsigned long addr,
 #define set_ptes set_ptes
 extern void set_pte(pte_t *ptep, pte_t pte);
 #define set_pte set_pte
+extern void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
+#define pte_clear pte_clear
 
 #else /* CONFIG_THP_CONTPTE */
 
 #define ptep_get		__ptep_get
 #define set_ptes		__set_ptes
 #define set_pte			__set_pte
+#define pte_clear		__pte_clear
 
 #endif /* CONFIG_THP_CONTPTE */
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
 #define ptep_get_and_clear	__ptep_get_and_clear
-#define pte_clear		__pte_clear
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bb5c6578204c..c82f17b3060b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -327,7 +327,7 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
 	if (pgprot_val(prot))
 		__set_pte(ptep, pfn_pte(phys >> PAGE_SHIFT, prot));
 	else
-		pte_clear(&init_mm, addr, ptep);
+		__pte_clear(&init_mm, addr, ptep);
 	local_flush_tlb_page(addr);
 }
 
diff --git a/mm/contpte.c b/mm/contpte.c
index 543ae5b5a863..c9eff6426ca0 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -45,6 +45,7 @@
  *   - set_ptes()
  *   - ptep_get_lockless()
  *   - set_pte()
+ *   - pte_clear()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -676,4 +677,9 @@ void set_pte(pte_t *ptep, pte_t pte)
 	__set_pte(ptep, pte_mknoncont(pte));
 }
 
+void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
+{
+	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+	__pte_clear(mm, addr, ptep);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
