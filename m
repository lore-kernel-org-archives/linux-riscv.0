Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7855E77177
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ptaG+VnMnjTQeeyso1HzXfmIIfAzCjB888kqgUXwnw=; b=T2ISPciSAof3AM
	uMY7I/+zTniLtmzl/Wd7xlvzrOMbe0U8bi7xeBvY9zPK2XEaf5WHvL8yi4HvEVI8PLatm1JSJKSxR
	i9oFcgwrd88SsxNkaBSQp7HdIX16tjchz981pHC4uzpx3FFu7QKbbd1jQPNGV7YhL/6cCfKdZtlB9
	zkPGNWRuZ20637Hy5w2YymKD/8COxN1Lf/K758YZVRvLkMTFLieP4VERNOyWNYw87Cuuaszgl++m2
	a8rhjDYVTAwz0hI5lVvHFN5Gg9KXQ2uGY7xOQ2EhrVJN4jO4kzv18sfOeI0XcO6Tk0zS2ssGv1b52
	zsocioIeR/MeixSWfLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9Lp-0000000FaQ2-1gd9;
	Thu, 05 Dec 2024 10:44:53 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9FE-0000000FY6u-2Oa7
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 10:38:05 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-71d46ace74aso371755a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 02:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733395083; x=1733999883; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XbXb8+gIbpPc0seecsAjhzRbpNpiwhPRJnpv+Yg3m9U=;
        b=ZaDCvF2/vyrKnkBLdXgUd6iarWLH6eJYKG7yrjddEjYv3WxcMW7+15gNKRcsWogUBf
         +I8X+RMgT+kHpG2qOHfltNIBCnwgf+tcitr2Asa2eIHYYc0d2TO+mkxsx8ZMVKUOkQ+U
         bmO5rNwHb3J+7LLPOVTYfB4BNhVVYdKB6aSSayPsDkjpBEDugVKOmVj2+2fXLdrpgZ7N
         lsOhc+4Sy2xO/d5g94vtSi60qfvKDfSy6ekKIH84tb0JdzwQFb54JzTFLahTAvZ6s7EW
         PRUkr225XdBMFapI0Mgk9gkJ69kHumLqbG7W0po/xdE1kCSE77l+QjPD9xhCn3ycirHL
         Ozxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733395083; x=1733999883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XbXb8+gIbpPc0seecsAjhzRbpNpiwhPRJnpv+Yg3m9U=;
        b=GzUZ7BVVLIFgB8FOybcwTLdnbeOgWvlERce0MMDqMUijdnitCB7+dkx3EVU68LKDky
         +qdBomRiDdkxCpQtQeKBJSTEUXPvat6/1gbWLH9mBvViIKj4eyygiwcjmg5644mm+foB
         rnWC01wedWSbfPzcsfYg7OkQy10e37Vt27sG579PDcZ0M03rqMA0CXxnnyGsb4Ll5WPY
         orETLs14jlmD9TQ9S7Oe9XUpRZ++3PUEREMV35Pjb839la953ICiNs/i3LeXg8GJw2BB
         uxZRBSMnsbXAhQ9SZP7ouMKlMcDrezGN2ABsTa0bMY+eaEPo0iGeyHNFLLh2vxQxErBL
         Eing==
X-Forwarded-Encrypted: i=1; AJvYcCX9gxm7xvPrl6SPo56dbwS6YDILiu9hEbV00CoyZisfeZMKaZnKgIPe78k5TQYGINfZHZcKHiGhu7qy6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXm3KVyS8C8FF2oX+TuKtzV4h38VB03Eu3XM5418KvcIQeLo+I
	qwe7hYdQE/qdzcN/X+EqLvEg9hVsmDc9sOBftn7TRVN3rm6UTZiHb+a4p9G8WsE=
X-Gm-Gg: ASbGnctw8G0njrn1pVai3hsOv8lf46tE8Crd2A/jmXb1/N0PK9HPcB/f1JUelQNQSFO
	TAQjv2NPXP92IO7DeSteYHtd6uual1PanQgLzAuxTVP+mD8ZJO/O1fvDX2I35Ja+v6trisvPyJp
	2MZoZt1A1Om7oSC9EgcP3YNm+iBQAVsqs78LddesTi0BYkscTfjhAu0Xa2oM+F+XlevyN0qUB0f
	QhRO2u8ukftW04pYs+5b+dpvRWgPw2u0CmIzEbQY7+Nhuwz8rSvdDAy4RJyoLkhLrvxmwfaygtV
	qhJ+vFTeO1y+VNsGlZYll4NX+r3E9FEp
X-Google-Smtp-Source: AGHT+IEx3vS74gMj6raF1dIqh7j7ldd5iu4wb4DU/N4Y4QqLjAI1/NclGnjqcHYWmLe9eo91DygJAQ==
X-Received: by 2002:a05:6830:d1a:b0:71a:6c7a:e23b with SMTP id 46e09a7af769-71dad652d39mr12397021a34.16.1733395083206;
        Thu, 05 Dec 2024 02:38:03 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fd156f048csm886826a12.39.2024.12.05.02.37.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Dec 2024 02:38:02 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	punit.agrawal@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC PATCH v2 06/21] riscv: mm: Avoid pte constructor during pte conversion
Date: Thu,  5 Dec 2024 18:37:14 +0800
Message-Id: <20241205103729.14798-7-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241205103729.14798-1-luxu.kernel@bytedance.com>
References: <20241205103729.14798-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_023804_606582_44407173 
X-CRM114-Status: UNSURE (   9.65  )
X-CRM114-Notice: Please train this message.
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

This commit converts ptes at different level via directly converting pte
type instead of using pte constructor, as ptes from different levels has
different constructors.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/pgtable.h | 52 +++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index f7b51c52b815..d3da8aee213c 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -351,6 +351,26 @@ static inline pgd_t pte_pgd(pte_t pte)
 	return (pgd_t)pte;
 }
 
+static inline pte_t pte_set_flag(pte_t pte, unsigned long flag)
+{
+	unsigned int i;
+
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++)
+		pte.ptes[i] |= flag;
+
+	return pte;
+}
+
+static inline pte_t pte_clear_flag(pte_t pte, unsigned long flag)
+{
+	unsigned int i;
+
+	for (i = 0; i < HW_PAGES_PER_PAGE; i++)
+		pte.ptes[i] &= (~flag);
+
+	return pte;
+}
+
 #else /* CONFIG_RISCV_USE_SW_PAGE */
 
 static inline pte_t pmd_pte(pmd_t pmd)
@@ -393,6 +413,16 @@ static inline pgd_t pte_pgd(pte_t pte)
 	return __pgd(pte_val(pte));
 }
 
+static inline pte_t pte_set_flag(pte_t pte, unsigned long flag)
+{
+	return __pte(pte_val(pte) | flag);
+}
+
+static inline pte_t pte_clear_flag(pte_t pte, unsigned long flag)
+{
+	return __pte(pte_val(pte) & (~flag));
+}
+
 #endif /* CONFIG_RISCV_USE_SW_PAGE */
 
 #ifdef CONFIG_RISCV_ISA_SVNAPOT
@@ -537,46 +567,46 @@ static inline int pte_devmap(pte_t pte)
 
 static inline pte_t pte_wrprotect(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_WRITE));
+	return pte_clear_flag(pte, _PAGE_WRITE);
 }
 
 /* static inline pte_t pte_mkread(pte_t pte) */
 
 static inline pte_t pte_mkwrite_novma(pte_t pte)
 {
-	return __pte(pte_val(pte) | _PAGE_WRITE);
+	return pte_set_flag(pte, _PAGE_WRITE);
 }
 
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
 {
-	return __pte(pte_val(pte) | _PAGE_DIRTY);
+	return pte_set_flag(pte, _PAGE_DIRTY);
 }
 
 static inline pte_t pte_mkclean(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_DIRTY));
+	return pte_clear_flag(pte, _PAGE_DIRTY);
 }
 
 static inline pte_t pte_mkyoung(pte_t pte)
 {
-	return __pte(pte_val(pte) | _PAGE_ACCESSED);
+	return pte_set_flag(pte, _PAGE_ACCESSED);
 }
 
 static inline pte_t pte_mkold(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~(_PAGE_ACCESSED));
+	return pte_clear_flag(pte, _PAGE_ACCESSED);
 }
 
 static inline pte_t pte_mkspecial(pte_t pte)
 {
-	return __pte(pte_val(pte) | _PAGE_SPECIAL);
+	return pte_set_flag(pte, _PAGE_SPECIAL);
 }
 
 static inline pte_t pte_mkdevmap(pte_t pte)
 {
-	return __pte(pte_val(pte) | _PAGE_DEVMAP);
+	return pte_set_flag(pte, _PAGE_DEVMAP);
 }
 
 static inline pte_t pte_mkhuge(pte_t pte)
@@ -612,7 +642,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 
 	ALT_THEAD_PMA(newprot_val);
 
-	return __pte((pte_val(pte) & _PAGE_CHG_MASK) | newprot_val);
+	return pte_set_flag(pte_clear_flag(pte, ~_PAGE_CHG_MASK), newprot_val);
 }
 
 #define pgd_ERROR(e) \
@@ -1017,12 +1047,12 @@ static inline int pte_swp_exclusive(pte_t pte)
 
 static inline pte_t pte_swp_mkexclusive(pte_t pte)
 {
-	return __pte(pte_val(pte) | _PAGE_SWP_EXCLUSIVE);
+	return pte_set_flag(pte, _PAGE_SWP_EXCLUSIVE);
 }
 
 static inline pte_t pte_swp_clear_exclusive(pte_t pte)
 {
-	return __pte(pte_val(pte) & ~_PAGE_SWP_EXCLUSIVE);
+	return pte_clear_flag(pte, _PAGE_SWP_EXCLUSIVE);
 }
 
 #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
