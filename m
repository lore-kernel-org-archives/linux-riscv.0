Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157D5C25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 19:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90v7ClewkxjgYTXFIiJSmkhQi3a3uo/mesItPPlPfR8=; b=QqfjfYF7x7Nlo+
	z/GLCtZ3Ok8ihomqamntIOEAML1AvbYzySKq6u7FzP5o2jIu97WzvN6r9RPtYI7aCU3dthiFTMbRf
	eW2/6CIFgYLdE1ovpJ8TUAq969XhZo7k5bw8XtuIg1m5aeCj6vpjp9Xwh9uXa/8pgixrz9z/0n1s+
	YGfWofgIuBK4ebx2xhU0cbxFkIGOHv/mpoVZXsYzg5+whPLSc8hx+hXLqnhWRMZCJeE27r8JfIoH9
	RSFWGZbZC41RLOq61S4eS7aiYoK/7JLiy5F6cPOL33D0Ip3Cwt3aox+Dmp2TTe0Z400kh2ogj8vYu
	Nfe32245Iz5dbpBtD1aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mwC-0000000GjSj-0Vt4;
	Wed, 08 May 2024 19:26:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4mw9-0000000GjRL-1KAa
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 19:26:46 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-34f7d8bfaa0so42266f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 12:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715196404; x=1715801204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7NXxlYw1RM9+WdFNtDaqsh0kbg9AU8PQDaN/vzezo7A=;
        b=vjk3wQw6TBu7alB+EL4idt6qj88jT9SM/dj/g4vEueM7S5l5lAH/eAK+EvYnhzpVGD
         n268WIDOSCx7nwsmmv/aQe7auaDfoyBrDOwjbbebycdZcg5/m71YqxozH+HzNtGoupxK
         cmgvtTu1EnJllVmmoRCwnqIaMkqZB3I9qleB8mxI0ctSWcEZvU1OdjUCNjCTHJHgyfMS
         ysa2nVResSkMLjX9cNwnEERebQxpKmrf4CYbW+ZyGkCAl64iQhbLx9h/EqjBRFTunU4I
         STOg+ZkoVPr+Asngi+OK3uLKNvc8MYp1cajzoZ5QAMV9/93eQEPBEWhAIu/TaZWssts1
         izww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715196404; x=1715801204;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7NXxlYw1RM9+WdFNtDaqsh0kbg9AU8PQDaN/vzezo7A=;
        b=tlTy7NMjnyx8RQoUIU8vzh9gbPvFCC3ao3ttisZcWFH1oDIwUvOGKzDZNJSWRTDHbc
         A3KuI3jVD6jrlAVuQGzW4r/etAFy4JB/lrUoteAt5r3oKuy9QUBySwEjPOD7XZ587Ans
         8v8H23GUlzA991bk3rxwG2gnEbQ+0sz8qXXf7fmCFUqsIRRNSqkd7XDHIBvRg8H71HyI
         Aej/IV/LJzXR3x1nKQinJN9zaWJJjKRNy5ka59VWfBLFw1pYXlw4j7SA2L5b3M7WApmC
         ZUXHdodsZ0ZnRJ9DOXePglCVr7cj3k0zREjPnNQ/LjZOx1GlWHwN9n8RMncWqAB+DrHZ
         lUIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPmKWyq9PQ/uUyaF2muEEVOBixCDfpGPryhJ1MzCMAMfCxxgIiBUthEE/iijlsWIg6SBip9Sn3t9/unuo5wiVqVSvJZIL3SlIWhdDzznBO
X-Gm-Message-State: AOJu0YwX5RsokZ5qZPl1fRkODEFBbtyhClPCO+WFWUbYIeBR6RboBrnw
	FtxVp6Ti8zaiaHJbgToYrzahr25M1s4NUz6hMG2ehhnmD9guorxKwMUb/aAM0ao=
X-Google-Smtp-Source: AGHT+IGACzzezThLxVMxwcYVQ6pqU/BhrbSjplAZdXD5UPpMsvfoJ1LwcNLet4jFhPFrbMRRJqyyWw==
X-Received: by 2002:a5d:4522:0:b0:34c:bb79:452b with SMTP id ffacd0b85a97d-34fca62159dmr2733749f8f.52.1715196403826;
        Wed, 08 May 2024 12:26:43 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id o16-20020adfcf10000000b0034b1bd76d30sm15921429wrj.28.2024.05.08.12.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 12:26:43 -0700 (PDT)
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
Subject: [PATCH 07/12] mm, riscv, arm64: Use common ptep_get_and_clear() function
Date: Wed,  8 May 2024 21:19:26 +0200
Message-Id: <20240508191931.46060-8-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240508191931.46060-1-alexghiti@rivosinc.com>
References: <20240508191931.46060-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_122645_396500_AB9A2CBD 
X-CRM114-Status: GOOD (  10.47  )
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

Make riscv use the contpte aware ptep_get_and_clear() function from arm64.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/arm64/include/asm/pgtable.h | 8 ++------
 arch/riscv/include/asm/pgtable.h | 7 +++++--
 mm/contpte.c                     | 8 ++++++++
 3 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 74e582f2884f..ff7fe1d9cabe 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1473,12 +1473,8 @@ static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
 }
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
-				unsigned long addr, pte_t *ptep)
-{
-	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
-	return __ptep_get_and_clear(mm, addr, ptep);
-}
+extern pte_t ptep_get_and_clear(struct mm_struct *mm,
+				unsigned long addr, pte_t *ptep);
 
 #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 41534f4b8a6d..03cd640137ed 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -794,6 +794,9 @@ extern void set_pte(pte_t *ptep, pte_t pte);
 #define set_pte set_pte
 extern void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 #define pte_clear pte_clear
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+extern pte_t ptep_get_and_clear(struct mm_struct *mm,
+				unsigned long addr, pte_t *ptep);
 
 #else /* CONFIG_THP_CONTPTE */
 
@@ -801,11 +804,11 @@ extern void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep);
 #define set_ptes		__set_ptes
 #define set_pte			__set_pte
 #define pte_clear		__pte_clear
+#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
+#define ptep_get_and_clear	__ptep_get_and_clear
 
 #endif /* CONFIG_THP_CONTPTE */
 
-#define __HAVE_ARCH_PTEP_GET_AND_CLEAR
-#define ptep_get_and_clear	__ptep_get_and_clear
 #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
 #define ptep_set_access_flags	__ptep_set_access_flags
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/mm/contpte.c b/mm/contpte.c
index c9eff6426ca0..5bf939639233 100644
--- a/mm/contpte.c
+++ b/mm/contpte.c
@@ -46,6 +46,7 @@
  *   - ptep_get_lockless()
  *   - set_pte()
  *   - pte_clear()
+ *   - ptep_get_and_clear()
  */
 
 pte_t huge_ptep_get(pte_t *ptep)
@@ -682,4 +683,11 @@ void pte_clear(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
 	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
 	__pte_clear(mm, addr, ptep);
 }
+
+pte_t ptep_get_and_clear(struct mm_struct *mm,
+			 unsigned long addr, pte_t *ptep)
+{
+	contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
+	return __ptep_get_and_clear(mm, addr, ptep);
+}
 #endif /* CONFIG_THP_CONTPTE */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
