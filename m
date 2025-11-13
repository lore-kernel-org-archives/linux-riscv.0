Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1809CD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yIwWlOamfi2Co+9LiJ4UcOyxFL9li51xdUJZjPRWK38=; b=UTMF2seTpdBuKE
	uT2RLwusBPmHEIqq43il+MRJbx7HFqZYBhEOmcH7vLNr5DBNZQQCxqiYoNp5R6nMpFsoz5tuWo57Q
	cSGVZVnoZhpngfI4f2ZdbCiS7o1vvo9iBd7UBSjHXLg8QIVkpdkUlhLdB/Lu0nAb5/wW0bDVmJDTS
	x8eL3/kahqxJWglfcHfHJHd8JeHmfGMMDIUl7fsTEuvyrSTnspJcHMjgZfd3/lb4P+0DI22KA0AuZ
	AKUz8uISG4i+WmRpo/RQHjQakqAwFgCcGMdTOadZMSbNhsIelijmLrNdbcNTkU9D92YxLaMcS22SA
	JMKS9MwfkJwFzwEMB09Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQT-00000009jg7-3WxY;
	Thu, 13 Nov 2025 01:47:05 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQQ-00000009jep-39Ta
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:04 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-bbbc58451a3so167108a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998422; x=1763603222; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XK0WcjEaQwvPVjRkMLc2/R9gHzLJpbaLIGkWXKqwGcI=;
        b=kcZiDDj5ROI64cF8QyN+O7iRrizJASt2hcOSuiunYIAC6rJAlbfPR3eR80F7I/P9uL
         oC4e38UAd42u/MEMfnRPz2KbymoFs+zDS2HW5Ki8b+yUbQ5DSco1Pmqhw1D8C29zlpCe
         V/3rK/Etrvf2gJa36jJvDcBGhFmuvLMupSnuJTmnnGjy5UwJCJR5uFFAPxpf6AAbXldw
         AZ0waAbCIcapWABsGo4y3iSCDuF9k15PFlluA5Xo5ATkmK3gB/I7LE0WmzBj+3LsHU+E
         CQdiOB80o5whC28Pv3O+hMhCwnlSapb+THvtE2o6U7EAGQ8kvA2jdp+lb4r4TynVHWo0
         h8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998422; x=1763603222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XK0WcjEaQwvPVjRkMLc2/R9gHzLJpbaLIGkWXKqwGcI=;
        b=XwHoh/MDNt2tDRpBCPI7IVAJEctBWNpM6sqWcFde/2Nc848EZZ7n8uGFdCKyNiykRR
         1wvCCgbZrhQ8I2iWd1kKEsCS3H+1nktLnuwcIk/4P1Da9bqFdY8hkqbbzjdXmrWLlpYm
         2iPblf4joTlr/6HjZYlFyfwa0p+DaPNEXG/3rtDPHXqu8vaF7/fvb7+W5TcIFvuaDbxJ
         XaTh2wtJ2FhRgDHFSZNOQQNWBMrK3ek6W8Kzs7B7Tu8Y6TcDEN5mRq3INXTfoXaJ/y1C
         X6jdsLTNplsQfJNuXlRbaOeHGP/zWH2If1Lk4bXtDVgSLM4Cy841lNLaPuZHB+3hNcgI
         8ixw==
X-Forwarded-Encrypted: i=1; AJvYcCVYxFrarANFRcmDLcrJachkjnv4MKkSrBMwvJGBk97KlMFh1WZt+L+gzm9CdNjlKk1lEcjRU1JzLAL2iQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDOfAxdBvmkC4vo9LfrsGRgq4zDWaL2JTgxl6Wjy7G/mTiFsl7
	p1xVP571Q22aEJSuBy5GsbcZK63453zQ692+9FJwgxuDi+sa+h7J34vNS828aaKgyQE=
X-Gm-Gg: ASbGncvPL/QIBkfUSaLlU+agXFeLF+C3br5fTeopNUUG9gDJF6nKkUfIElIcrkm9xko
	nYKE233RDqjPY2+LsjY8JmiA4kQTPVwygIpD6DmaNXaRtrTGcAs/j/B+Q8+mzELNSICpxhuaH1b
	Fzzdo6WCKp6ooFht/tbF+iLdVVSVt2VhzUX1hwv4x+3UImsw3EgUcPhwKnHM8n9Pe6eXH0rl2Yp
	kInny3XvevklAXMNxoCoTxBnahjKE/HBUVCOHJrjgQdrFdMOBeUcHjRl0j5/y74ZCU7+hIXRqpb
	b0uL2lm5KOPctAq3jhOk3i0HeAu4NjnSYBV5dKZBzHeA78VqumweirGmTIByoBJ2zsPA0YcnohF
	RG/2J3sMZyy6VUQPzii0WKl/9YO4FMyCNGs3GLURNS2VxUOTXhymLoA6p2cakq6LHaagBIqPTwf
	3zmR/XmSGyXSIwrCsUyShQeA==
X-Google-Smtp-Source: AGHT+IGdLwQpJ+C02LpNGU1KZK8FopHeRZPwq9hf7+jq0mst5qCQq34alBPH74+bRQy7F+ajxgP+5A==
X-Received: by 2002:a17:902:dac3:b0:27e:ec72:f67 with SMTP id d9443c01a7336-2984ed27ec5mr64198655ad.6.1762998421878;
        Wed, 12 Nov 2025 17:47:01 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:01 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-mm@kvack.org
Cc: devicetree@vger.kernel.org,
	Suren Baghdasaryan <surenb@google.com>,
	linux-kernel@vger.kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Conor Dooley <conor@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	Wei Yang <richard.weiyang@gmail.com>,
	Dev Jain <dev.jain@arm.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 02/22] mm: replace READ_ONCE() with standard page table accessors
Date: Wed, 12 Nov 2025 17:45:15 -0800
Message-ID: <20251113014656.2605447-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174702_798988_A1C6A716 
X-CRM114-Status: GOOD (  16.09  )
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

From: Anshuman Khandual <anshuman.khandual@arm.com>

Replace all READ_ONCE() with a standard page table accessors i.e
pxdp_get() that defaults into READ_ONCE() in cases where platform does not
override.

Link: https://lkml.kernel.org/r/20251007063100.2396936-1-anshuman.khandual@arm.com
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Lance Yang <lance.yang@linux.dev>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Cc: Dev Jain <dev.jain@arm.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - New patch for v3 (cherry-picked from linux-next)

 mm/gup.c            | 10 +++++-----
 mm/hmm.c            |  2 +-
 mm/memory.c         |  4 ++--
 mm/mprotect.c       |  2 +-
 mm/sparse-vmemmap.c |  2 +-
 mm/vmscan.c         |  2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/mm/gup.c b/mm/gup.c
index a8ba5112e4d0..b46112d36f7e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -950,7 +950,7 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
 	struct mm_struct *mm = vma->vm_mm;
 
 	pudp = pud_offset(p4dp, address);
-	pud = READ_ONCE(*pudp);
+	pud = pudp_get(pudp);
 	if (!pud_present(pud))
 		return no_page_table(vma, flags, address);
 	if (pud_leaf(pud)) {
@@ -975,7 +975,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
 	p4d_t *p4dp, p4d;
 
 	p4dp = p4d_offset(pgdp, address);
-	p4d = READ_ONCE(*p4dp);
+	p4d = p4dp_get(p4dp);
 	BUILD_BUG_ON(p4d_leaf(p4d));
 
 	if (!p4d_present(p4d) || p4d_bad(p4d))
@@ -3060,7 +3060,7 @@ static int gup_fast_pud_range(p4d_t *p4dp, p4d_t p4d, unsigned long addr,
 
 	pudp = pud_offset_lockless(p4dp, p4d, addr);
 	do {
-		pud_t pud = READ_ONCE(*pudp);
+		pud_t pud = pudp_get(pudp);
 
 		next = pud_addr_end(addr, end);
 		if (unlikely(!pud_present(pud)))
@@ -3086,7 +3086,7 @@ static int gup_fast_p4d_range(pgd_t *pgdp, pgd_t pgd, unsigned long addr,
 
 	p4dp = p4d_offset_lockless(pgdp, pgd, addr);
 	do {
-		p4d_t p4d = READ_ONCE(*p4dp);
+		p4d_t p4d = p4dp_get(p4dp);
 
 		next = p4d_addr_end(addr, end);
 		if (!p4d_present(p4d))
@@ -3108,7 +3108,7 @@ static void gup_fast_pgd_range(unsigned long addr, unsigned long end,
 
 	pgdp = pgd_offset(current->mm, addr);
 	do {
-		pgd_t pgd = READ_ONCE(*pgdp);
+		pgd_t pgd = pgdp_get(pgdp);
 
 		next = pgd_addr_end(addr, end);
 		if (pgd_none(pgd))
diff --git a/mm/hmm.c b/mm/hmm.c
index 87562914670a..a56081d67ad6 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -491,7 +491,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
 	/* Normally we don't want to split the huge page */
 	walk->action = ACTION_CONTINUE;
 
-	pud = READ_ONCE(*pudp);
+	pud = pudp_get(pudp);
 	if (!pud_present(pud)) {
 		spin_unlock(ptl);
 		return hmm_vma_walk_hole(start, end, -1, walk);
diff --git a/mm/memory.c b/mm/memory.c
index b59ae7ce42eb..0c295e2fe8e8 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6690,12 +6690,12 @@ int follow_pfnmap_start(struct follow_pfnmap_args *args)
 		goto out;
 
 	p4dp = p4d_offset(pgdp, address);
-	p4d = READ_ONCE(*p4dp);
+	p4d = p4dp_get(p4dp);
 	if (p4d_none(p4d) || unlikely(p4d_bad(p4d)))
 		goto out;
 
 	pudp = pud_offset(p4dp, address);
-	pud = READ_ONCE(*pudp);
+	pud = pudp_get(pudp);
 	if (pud_none(pud))
 		goto out;
 	if (pud_leaf(pud)) {
diff --git a/mm/mprotect.c b/mm/mprotect.c
index 113b48985834..988c366137d5 100644
--- a/mm/mprotect.c
+++ b/mm/mprotect.c
@@ -599,7 +599,7 @@ static inline long change_pud_range(struct mmu_gather *tlb,
 			break;
 		}
 
-		pud = READ_ONCE(*pudp);
+		pud = pudp_get(pudp);
 		if (pud_none(pud))
 			continue;
 
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index dbd8daccade2..37522d6cb398 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -439,7 +439,7 @@ int __meminit vmemmap_populate_hugepages(unsigned long start, unsigned long end,
 			return -ENOMEM;
 
 		pmd = pmd_offset(pud, addr);
-		if (pmd_none(READ_ONCE(*pmd))) {
+		if (pmd_none(pmdp_get(pmd))) {
 			void *p;
 
 			p = vmemmap_alloc_block_buf(PMD_SIZE, node, altmap);
diff --git a/mm/vmscan.c b/mm/vmscan.c
index b2fc8b626d3d..2239de111fa6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3773,7 +3773,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
 	pud = pud_offset(p4d, start & P4D_MASK);
 restart:
 	for (i = pud_index(start), addr = start; addr != end; i++, addr = next) {
-		pud_t val = READ_ONCE(pud[i]);
+		pud_t val = pudp_get(pud + i);
 
 		next = pud_addr_end(addr, end);
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
