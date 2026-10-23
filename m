Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C0F606A322
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 06:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yKYi2x5B;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=E06AKQUc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=VNSTt3POHijVoxjduPgaLA2nqbKxdFo+OoWzK6DEOlc=; b=yKYi2x5BPE4clrOqDHHzQQgEPc
	FGkVI/IpEFnWf62nvF7LNWs2riMgKEEGB6QWfB/qi0jzTauFHBfubtEfcDgDVZAg8M0Qyt119eqgX
	JYGCPwrHGR0oPHzpLWW9Zs/EPzh8IbuJBnKcv4xR2w9IhL/WaolJ1rUyc0eq6kWWs9oCHjx/HslUl
	B5znXvaEGhl5+uT7SXe3DNbQLgxvy+NRGpP8NHXAxNC7RLbFnuQYqpDvY24BZgrK+zMwEpooaE0so
	yGqJYIpy216zWX79IXyzKyN6AMEbDrH8ekTywtwPVgQaS6VGGg2ui8/mcerRoGhrCytT9WqZQ42vj
	qEv4O4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rb-0000000FZuo-2Zg6;
	Fri, 23 Oct 2026 06:34:51 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8rV-0000000FZrU-0WGe
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 06:34:46 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso360339a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Oct 2026 23:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1792737284; x=1793342084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rturI3iC2rqsVMr8++V5T0eWydBVkbRvFCJtmlAqnJE=;
        b=E06AKQUc49bHnqwDL+Cug1MfPd3mSvF4vKygMYvrxbqLmlgLv7V4mB3ve8XZu5PY8/
         CvrGgtz0oE/DdeLFPlgc48EsKiGMw88l3OZ3MaqNSXOnDFoyIgkoDjxsSOfM7gvkXTwq
         YkbRhjMNGW7mZOsfJ7MBhfJ9/MKaE/5C7f2U6r3xEKWbicAyMtCn0b3H5xLR33/XsG+D
         DbvvvV6TVyvn8OOp5XyHnG5x/HoZg4XcGX+uKBPtbOVyezfbcYxS5WVX16xR6ginHvEf
         wDdpVaei1dEVCaoHgRXBmJf4X/jhSDy4aHKTkC05pWpoBfo+6Op/MzhKnvGbWyew5R4J
         F9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737284; x=1793342084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rturI3iC2rqsVMr8++V5T0eWydBVkbRvFCJtmlAqnJE=;
        b=gMmi0ssWhKsPWgAvMGbYXVsYtKbjxSpjsyRPUfLiDHtTFEf64/sT5zHP8YE0n/QOg7
         qcdKhlJCYgHuPgG/NZLMWgDHlUkG4fAIHUW6RWGD0VJqy05ixPHugkIWzCYsPxL9eSIg
         IUeTCNnIBYyOhvZS4uV8I9nUi58iOZhtECi9kolgiDtsA7/a2dtfN9qstQ5dizQ/nN1u
         jlMVPyGjhMMMmZ6bCaT9WPPUCANxnmZEko+fYt5WDuVVrvgJQ++Z7H3HQH8kmPftT6Ra
         3Oc7z+LNEs/jWpJ0vLj6XCcghBHNXW0eVqzke4REaIFKXgQYVYJUfAu06JbigZF37pt4
         qjBg==
X-Forwarded-Encrypted: i=1; AKwUvBwy1z9aya63HEwHAYLsuAwjHLwHIyIfSCdGhrkdKtpOrny20DhcNlaAtzfeCpT+YIvgoBVEDqcHt98qwg==@lists.infradead.org
X-Gm-Message-State: AFq9FYL5bSsoX6ziRrBeBsU1VwNanyK9djRjAvXSszagjQYklUTbaPoh
	eGyvOk9KzjNol92m3M0a2JPStcwyyNItjoZacFmotN9ypkjHkZlbtsf2dC6PZzkseuw=
X-Gm-Gg: AYBFou30Y94qHvRoxwiZw4uWZLhAN5ES9+XYg5BLe/RMEezSEfTfIN0zfLBGIaP6JBV
	mzC4Q/zH8I58QzGCJusaGFjUAIVEwtlbjc+3KQelXnHyqI8kxnVIzNJ77rn7iXQ/l07vnJYNCK7
	YO54SsjfGcSaoEB5fKsYfOPxH7E4WFQZ/raFWxe08nsLEhQhniDcUlV6JACiYPyfx8pctUkN2c6
	NS0G3yV4MD7QMHfp7MScGzVk8haE4VfzLM3I0FPLSAVkbDFPc+8TIQ41C9EcqvMnSyQLH6v+3F+
	m3feqWKYCXKXJqYQgZrYWcSCvEB+317T9a5U6MQsudMj9kNR6mN0VLBVf+pnWdaEeKEreyVGyw9
	3FC4EOqJOfvym7Jf7ARFzx4RO6bugQq+JK+OVjA+9OoTe+jR358ZQCsBrIC8Po3+aw/3La2d81X
	meAKeUffk0TzX80qHX3C8Wi0TnfwTdr9eyFHv+TG5TZvmce0XxgctlRz1XvLGS16/suIITY9v/X
	Ue2llc9N0h7ODVg9brrsRP7sRa4AVzDKNewUkybkZWmAaFbQsBi3Dl1bT+dY6islGXDImqnhvpp
	1Q==
X-Received: by 2002:a17:90a:f945:b0:3ab:4f1:4f76 with SMTP id 98e67ed59e1d1-3adce7dd585mr1009938a91.24.1792737283991;
        Thu, 22 Oct 2026 23:34:43 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3add246f308sm575202a91.0.2026.10.22.23.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:34:43 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 1/4] mm: fix missing page-table destructor in pagetable_free()
Date: Fri, 23 Oct 2026 14:34:25 +0800
Message-ID: <20261023063428.3658761-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023063428.3658761-1-songmuchun@bytedance.com>
References: <20261023063428.3658761-1-songmuchun@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_233445_161579_F2E64E65 
X-CRM114-Status: GOOD (  15.67  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since commit 49f599666420 ("mm: call ctor/dtor for kernel PTEs"),
pte_alloc_one_kernel() runs the page-table constructor for kernel PTE
tables.

HVO (HugeTLB Vmemmap Optimization) uses pte_alloc_one_kernel() when
splitting a PMD. Restoring the vmemmap backing pages does not collapse
the PTE table, so a later memory hot-remove eventually frees it through
pagetable_free() on x86-64. That releases the page without running the
matching destructor and leaves NR_PAGETABLE elevated.

Make pagetable_free() the common free-side primitive for page-table
pages. It checks PageTable() and runs the destructor only when the
constructor state is still present. Callers that explicitly ran
pagetable_dtor() have already cleared PageTable(), so they are not
destructed twice; pages that never ran a constructor are freed directly.

Fixes: 49f599666420 ("mm: call ctor/dtor for kernel PTEs")
Cc: stable@vger.kernel.org # bf9e4e30f353: x86/mm: use pagetable_free()
Cc: stable@vger.kernel.org # 39406c05f8f1: x86/mm: Fix freeing of PMD-sized vmemmap pages
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Acked-by: Dave Hansen <dave.hansen@intel.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v3:
- Explain why pagetable_free() does not run the destructor twice
  (requested by Kevin Brodsky)
- Add x86 stable prerequisites (suggested by
  Jose A. Perez de Azpillaga)
- Collect Acked-by from Dave Hansen and David Hildenbrand
- Collect Reviewed-by from Jose A. Perez de Azpillaga and Kevin
  Brodsky

v2:
- Move destructor handling from x86 into pagetable_free() (suggested by
  David Hildenbrand)
- Trim and update the commit message (requested by Dave Hansen)
---
 include/linux/mm.h | 37 ++++++++++++++++++++-----------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index dd09c438fa23..466875c5908b 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3812,23 +3812,6 @@ static inline void pagetable_free_kernel(struct ptdesc *pt)
 	__pagetable_free(pt);
 }
 #endif
-/**
- * pagetable_free - Free pagetables
- * @pt:	The page table descriptor
- *
- * pagetable_free frees the memory of all page tables described by a page
- * table descriptor and the memory for the descriptor itself.
- */
-static inline void pagetable_free(struct ptdesc *pt)
-{
-	if (ptdesc_test_kernel(pt)) {
-		ptdesc_clear_kernel(pt);
-		pagetable_free_kernel(pt);
-	} else {
-		__pagetable_free(pt);
-	}
-}
-
 #if defined(CONFIG_SPLIT_PTE_PTLOCKS)
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
@@ -3921,6 +3904,26 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+/**
+ * pagetable_free - Free pagetables
+ * @pt:	The page table descriptor
+ *
+ * pagetable_free frees the memory of all page tables described by a page
+ * table descriptor and the memory for the descriptor itself.
+ */
+static inline void pagetable_free(struct ptdesc *pt)
+{
+	if (PageTable(ptdesc_page(pt)))
+		pagetable_dtor(pt);
+
+	if (ptdesc_test_kernel(pt)) {
+		ptdesc_clear_kernel(pt);
+		pagetable_free_kernel(pt);
+	} else {
+		__pagetable_free(pt);
+	}
+}
+
 static inline void pagetable_dtor_free(struct ptdesc *ptdesc)
 {
 	pagetable_dtor(ptdesc);
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
