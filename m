Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCEFCCD188
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nlmk/TqEyV3nTvkD7AHhtHc+3LDwTLq4848fQAbYwGs=; b=H2JNOvNHCGk/im
	+f3tXAiZc8udRoR8mlPmEwz8pKZ+mMJ6e8hinPVsWt7BHKWqlgqj52NiDiH0Ab2E69XZ+J4e9sPry
	nYdIAjwmDpB5nsS1i2ONonPa+ynqoCEihEyh/XKrXhbD5vobSBydjogG9uZJeqH8fEj14J1h6g9mF
	lNEJfRURMwyu2ARG5hCgdnMF84GIzvBOCt2Fsx1DpHzU2HRcS3xTM7iBoRlDg/riK5PArFGTM3ns3
	vd8qu4kG7bWiI5LIzYHF7Ma/3hRM4lADKE5aFhAG6YjbBF7/YgLDcoK0PRNIVHp7nrK7TgJ7n+l4l
	6dAxYEeZp/5X16X/94IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fve-00000004zAc-30GM;
	Thu, 09 Oct 2025 01:58:50 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvd-00000004z92-0b4y
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:50 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b550a522a49so326785a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975128; x=1760579928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Q8oT6hoS6cxQomKzX1vfx1V3ZAPioXY327lRhg5E1A=;
        b=SoHqBfHXUc7sc9dI4o14KnerNea9zkh4op37hGnwNkLIwmR/IHxAiRRqvKHcQLEI5N
         8ZU+DbNyOWyHPYDKaWxUdjDjYK8Yl2UWuTJ1MgV3jqBPhq7axoWUIkcR5rptRdZch2ag
         VyMIla818jBjHP5o/qplUlbrHXI59eiUDQjTyZ6lXg/o8G7t+bCUXbILbmvk1r/2t/jv
         axTqd+rA65jzejpDiBQ/XxQecbI4+hoNi7pmvf7YpAu7bYScy8eqEn+aMrLLWl5up8N6
         VjGRgYh3S/nJrHc7dRoRndtr+RT8jVEKm3WZkP39856zwcKHrXKNIXjCdQbY8+faTfjh
         zQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975128; x=1760579928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Q8oT6hoS6cxQomKzX1vfx1V3ZAPioXY327lRhg5E1A=;
        b=niLBkQfCF83RM9PoZ22N1RehQ6ANalt4wh1y9wmMJXX2sV1dPuM9Ae8L77zm5Kjnks
         L9sMTSSgPJLeIvet9iNn7FZ5CkiFV8TAxhcRni3gkeb0hUOTOnWQMMmBy66RSCHYX01L
         xjox/ABZu+5eCA5qpX+8oWeW2ncOomW5A73ps9h/fAOgBH0tIcMJEiSroxxMiryIEddh
         Ht1KwQ8s+RpkqEvv03F/OptMsLtxQaOoievSiEjd3MFVmcQVnFm4P0+1hsXwEtGwTzCS
         yNi0kFWpszV42QZmg1O5Y8ohnNOYst59wzEMx5BaCF4y1v7qpaCIKQxIlzCzl0Trc1FR
         4KJw==
X-Forwarded-Encrypted: i=1; AJvYcCU8N7JpSh/sxCbIdkHLJVleq4E+/qKvuaoExKp51SGOXBPR0heRVIo+MjeP20rWBDcf/98/XTsDzkvOng==@lists.infradead.org
X-Gm-Message-State: AOJu0YzdOvVdjbf6C1r1W1zT/5+2t8e3xl/9wWzXoR+zSsFQrf10za9I
	Whd6OwpRT5efsjOw/oxoIKyn1sLbaWrt7oIq7Gp9zpL4fY4oSK/xTOoz0RJQSoCsxak=
X-Gm-Gg: ASbGncvIulmFFIYVU60CoviRp067BSUi4Q0ImlOfSI6A8SXEquAUHx35lq5gJ/bs6na
	biLu9eQVbg6dMRKF5ycSjKnWgNv97AqwlAmrYhA86yrWMUE99wPoDQv/jxfpnbyPkxDcjR1UmVv
	Lgm/1fquzQU/KsozGKsOFaiS5vL/rhtXqlniUw126Ihez5n+8tAJ2acuoy4J8dI4Zv6B7UTGNQs
	3YJQr8SL68R8ZHWGzDy6R2KBvkKjZdYyiT9maqddKfAdpVCCR131h8CdMuPy1mxMGJNHI4GaF6d
	l620AOrXvDJUpfmKo3now6KmencaBmvZAoSmpLs2nKiMigEdpX5DteH24ryBz5zTHVOSZtvlHP4
	dX+wPtuncL/GSPKfE1c2vKjZrAUV8xMsQQLW48dSpdQDKuaSwJcOe4kuUpQNmQqlT4PTJgKesR1
	58Lg0=
X-Google-Smtp-Source: AGHT+IHLtMfpsASWG7S0cjFNRLXUMrAvJHuz2m4ALPRQp+i8q8lJn/YDkN/bQbSK1wXLrkajg3vnmg==
X-Received: by 2002:a17:903:11cf:b0:269:63ea:6d4e with SMTP id d9443c01a7336-290272c1aa5mr61891525ad.37.1759975128385;
        Wed, 08 Oct 2025 18:58:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:48 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 06/18] riscv: hibernate: Replace open-coded pXXp_get()
Date: Wed,  8 Oct 2025 18:57:42 -0700
Message-ID: <20251009015839.3460231-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185849_200354_7F95C598 
X-CRM114-Status: GOOD (  11.59  )
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

Changes in v2:
 - New patch for v2

 arch/riscv/kernel/hibernate.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/hibernate.c b/arch/riscv/kernel/hibernate.c
index 671b686c01587..2a9bc9d9e776e 100644
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
