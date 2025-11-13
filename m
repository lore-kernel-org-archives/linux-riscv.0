Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 064BECD4F3F
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+CICJc//Np4AxaU08B0WZkk32AGqQjl9xl4dT5mpQI=; b=EN6ElrlYzFtidD
	K0sVWFUqtuQzBWdQgnxeSVv6lufq3e3/Lwo1Zk6b0v5JvrpMG4QyKh5YpmVhXAJpmr/Jdpg6gVWs8
	KO+ErileAYEIc+O8Rf7zznEdOtzAt09omrdqi8uyDPxa35oijNfzpZ2tHfvfq5Ax/uOg7ZvXFvGtN
	htHXQfbApU2sCPexm0Yt2DHi6SA2OUNLuE4UZB2ZExK0I8HcJeh0asCgfcy28eSwlab3Ltp3R69qp
	gQOZESdH+noBkfaWt1OT/E5opFwRmLdxH+M3sHA52rH5S8w2apDXQ8Agqvv91nlxg50RHcissxAT4
	9W2vYbe6IEZOD3JfDp0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQf-00000009jn2-18jL;
	Thu, 13 Nov 2025 01:47:17 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQb-00000009jk2-34xu
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 01:47:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2984dfae0acso3102405ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998433; x=1763603233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4ZA59qppRNlQ/gH4ZwlxZVtJjkZuT0TezTthNgG0I08=;
        b=KRe0fMgwU6W2vOrcEUH0MiGBAdjNrb9j9GWCbgUnN9GoTgxy56s0Smx0mQTWwCsEPr
         7Aqpazk7C3EDzGfMjERHN123LeAj3OkXDpx/z0yfIFhC4zZBQnq2e12Ma4YKobEn0dmT
         u0TwE9DCl2c7fYIA+FRyxhIocRmG5GXRL1aIQnFSkhCbutHL54tGuYkBrmXOKr31KZrQ
         HuO+Mt5U9TTamP25FKnG9NXgV4l3DIjhSvKlLxwxrC8/pwrFQSZW0T57HGtxXKQ9m6VA
         ET0wT2GlVoHk4xZvE5gV2/TYt+5kk4qU/5FgWSG59RwoHmAhBvWGL+pgbcnCRSFXQgxA
         vtsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998433; x=1763603233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4ZA59qppRNlQ/gH4ZwlxZVtJjkZuT0TezTthNgG0I08=;
        b=qiCKhbko+ue+AFQVTWVpllGTb1JHimnUMQnxj8Y5QJLrYJFJECCm2UEX+3Mbr8LUXL
         ODUGmhBe5eJ3W6I5f246Jf5F6BC+HJz6Ah3/dgrIsFGslq9K0aquvq+I9aM/8J0et6QF
         9R4Zdovty3Bl+SCF+wDz/5JgiPTIo5rwlzou7opHXZPGCBtEXuDifMbCXdCdhLRXv/8J
         DOX8kFrMGD5IlkYh1GjuzzYHA79Sq5BPEVsrYUGpN6qbd8FAZzxboUzIdEUvvCP/8tvm
         xnGfyF/E3fSf6R75D4myWewApEOUb2zkgT+uQfzs96MHvslcKwIiqNfkWGOAQKywd0FR
         Vgkg==
X-Forwarded-Encrypted: i=1; AJvYcCX6pkTXEaudq270HLb8azEe3syxx0FidaWnD/tRfJ5hG+tv0ZhHG6JB+JjJNAa4HgtHMlyP8tEBs21xlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIy5YTTD26sbe3fIE08+xWtAPjNCb7EHsALIuhVUuDGccoX22k
	NgNtZ4qwRQdBkIW8dFVJAzIsS3edsDGDySOf3wrdLKlvbWWhd8WEnDGJu18voGI7cpE=
X-Gm-Gg: ASbGnctKtpaz/av1S0b9aPu+wzMYvbgYNsQUfnSybYqRzeWQmHnnhqG2ZGhKFg4UYky
	6+AY9rWjvwHASAqtiQyB3xz1U3AXY959PxMf/6et36vzB23Am6mw7p8C3ZPOnXuOULTMuAJyf+z
	3oS9e4Up0OPN0pFXJznYL1v4PPj1PwTjPxDrTqFxS19/o2M3+rqpH9qde+UujesOhZQjk529ykG
	g+juTQo4W8ibtIenPO3+Gj4vQIZWxZeaCAhc6lNGAzfjXhuYQEDtxqZcMr5eYKj+j4DzmCg0Erj
	km1s9b+K6FHA4q9r6jCbpCd8LEShBqfH+8N9FOGgc5AwMNb3DjwLQ1eTtcJuv89Ew/YdXp4xbtI
	p6Q21xjVmy2hCeeLuBmGWiAM5J1O9wJ43eQGf60eTkAGErbNZR+eQcqpng5JRKgxwRArJdhEIAr
	ds0wDD+gyuJaQWPZQM0QJNAQpzoM58iMMG
X-Google-Smtp-Source: AGHT+IEls7n+vPL3afsY1HaiLuKxeTZ1hxOSzGPwxU5ZDyX/ao4U4NfMKSzGsMG6BjM8vErLRKhy9g==
X-Received: by 2002:a17:902:ccd1:b0:295:7806:1d7b with SMTP id d9443c01a7336-2984eddee65mr65789335ad.45.1762998432890;
        Wed, 12 Nov 2025 17:47:12 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:12 -0800 (PST)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 09/22] riscv: hibernate: Replace open-coded pXXp_get()
Date: Wed, 12 Nov 2025 17:45:22 -0800
Message-ID: <20251113014656.2605447-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_174714_304444_3B31B942 
X-CRM114-Status: GOOD (  10.96  )
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

Use the semantically appropriate accessor function instead of open
coding the implementation. This will become important once these
functions start transforming the PTE value on some platforms.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 arch/riscv/kernel/hibernate.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
index 671b686c0158..2a9bc9d9e776 100644
--- a/arch/riscv/kernel/hibernate.c
+++ b/arch/riscv/kernel/hibernate.c
@@ -171,7 +171,7 @@ static int temp_pgtable_map_pte(pmd_t *dst_pmdp, pmd_t *src_pmdp, unsigned long
 	pte_t *src_ptep;
 	pte_t *dst_ptep;
 
-	if (pmd_none(READ_ONCE(*dst_pmdp))) {
+	if (pmd_none(pmdp_get(dst_pmdp))) {
 		dst_ptep = (pte_t *)get_safe_page(GFP_ATOMIC);
 		if (!dst_ptep)
 			return -ENOMEM;
@@ -183,7 +183,7 @@ static int temp_pgtable_map_pte(pmd_t *dst_pmdp, pmd_t *src_pmdp, unsigned long
 	src_ptep = pte_offset_kernel(src_pmdp, start);
 
 	do {
-		pte_t pte = READ_ONCE(*src_ptep);
+		pte_t pte = ptep_get(src_ptep);
 
 		if (pte_present(pte))
 			set_pte(dst_ptep, __pte(pte_val(pte) | pgprot_val(prot)));
@@ -200,7 +200,7 @@ static int temp_pgtable_map_pmd(pud_t *dst_pudp, pud_t *src_pudp, unsigned long
 	pmd_t *src_pmdp;
 	pmd_t *dst_pmdp;
 
-	if (pud_none(READ_ONCE(*dst_pudp))) {
+	if (pud_none(pudp_get(dst_pudp))) {
 		dst_pmdp = (pmd_t *)get_safe_page(GFP_ATOMIC);
 		if (!dst_pmdp)
 			return -ENOMEM;
@@ -212,7 +212,7 @@ static int temp_pgtable_map_pmd(pud_t *dst_pudp, pud_t *src_pudp, unsigned long
 	src_pmdp = pmd_offset(src_pudp, start);
 
 	do {
-		pmd_t pmd = READ_ONCE(*src_pmdp);
+		pmd_t pmd = pmdp_get(src_pmdp);
 
 		next = pmd_addr_end(start, end);
 
@@ -239,7 +239,7 @@ static int temp_pgtable_map_pud(p4d_t *dst_p4dp, p4d_t *src_p4dp, unsigned long
 	pud_t *dst_pudp;
 	pud_t *src_pudp;
 
-	if (p4d_none(READ_ONCE(*dst_p4dp))) {
+	if (p4d_none(p4dp_get(dst_p4dp))) {
 		dst_pudp = (pud_t *)get_safe_page(GFP_ATOMIC);
 		if (!dst_pudp)
 			return -ENOMEM;
@@ -251,7 +251,7 @@ static int temp_pgtable_map_pud(p4d_t *dst_p4dp, p4d_t *src_p4dp, unsigned long
 	src_pudp = pud_offset(src_p4dp, start);
 
 	do {
-		pud_t pud = READ_ONCE(*src_pudp);
+		pud_t pud = pudp_get(src_pudp);
 
 		next = pud_addr_end(start, end);
 
@@ -278,7 +278,7 @@ static int temp_pgtable_map_p4d(pgd_t *dst_pgdp, pgd_t *src_pgdp, unsigned long
 	p4d_t *dst_p4dp;
 	p4d_t *src_p4dp;
 
-	if (pgd_none(READ_ONCE(*dst_pgdp))) {
+	if (pgd_none(pgdp_get(dst_pgdp))) {
 		dst_p4dp = (p4d_t *)get_safe_page(GFP_ATOMIC);
 		if (!dst_p4dp)
 			return -ENOMEM;
@@ -290,7 +290,7 @@ static int temp_pgtable_map_p4d(pgd_t *dst_pgdp, pgd_t *src_pgdp, unsigned long
 	src_p4dp = p4d_offset(src_pgdp, start);
 
 	do {
-		p4d_t p4d = READ_ONCE(*src_p4dp);
+		p4d_t p4d = p4dp_get(src_p4dp);
 
 		next = p4d_addr_end(start, end);
 
@@ -317,7 +317,7 @@ static int temp_pgtable_mapping(pgd_t *pgdp, unsigned long start, unsigned long
 	unsigned long ret;
 
 	do {
-		pgd_t pgd = READ_ONCE(*src_pgdp);
+		pgd_t pgd = pgdp_get(src_pgdp);
 
 		next = pgd_addr_end(start, end);
 
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
