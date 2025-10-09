Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F9DCCD187
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RWuVnie71iRSSL4Lec9gCGQ81CEDIFsAqOq/Yv4yD4Q=; b=bRZBgTKId+u2J9
	tyE+qbGOlPbRturqsBSsYwQ5PZyKLwwXEyWn/XXlFF925qg5WinM/ViQvFjmWpTCsLimYI/qBtOik
	qZ0aSNxsbqr6X9S8cELesqcaAyOf6fZTGp3JsVWOVjtzQ/wvOkg2BmtfmRA8pkslaFiOmkVtFNoe0
	Wyv5QO16BQTU27UfLOtZ/zpofzlO+xswqvKfO9N+/FssdhdoQiU6KhbOGr7jZjjhlEUwNr299N8nW
	W9DO2DVfo5cW/y9JxGYCu0OR9pmtTBGM2oF9y/KBrz6sH8kdhpJ6eF+ymXnwvPTZ91luO6HN1Oahd
	fJPK7N4xFB0Zn9AGjixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvb-00000004z6t-0A3o;
	Thu, 09 Oct 2025 01:58:47 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvZ-00000004z5P-173g
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:46 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b62fcddfa21so267415a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975124; x=1760579924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MuPyEQssKNBDDveegAkkBylsREkSVusKsPA4YXKPGPk=;
        b=EUlSnko5IhQzCLaK8aPyfTD+fgh2yFI9Kwq5cXyC9nlcR18yyev81C+1m6pgq8ThJh
         hxtmRGR6Am2NUI9bPVIUqV1COXOvVoQW+/Yh8WTIXoLS65bSZrzS8+FAh8AUQGfak7As
         MN8A5nw46E/4LqlqjDdUFWqePfaqBjoc36zctbTiVSLoMLxnakWUzHD2iZKtmW335xs4
         7F8XAHk5vtBXRd9r2LEz94iLKz1jmFNkDg/+tIE7Std4UXjjx7EsO+0mn7Y3c0L6b2U1
         I3V/vVId6KhXBhOyGYWQDX6MnjYwbCJeuZPzwzlNUemEE8dlknr8B4WokO3Pts3YbOE/
         yebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975124; x=1760579924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MuPyEQssKNBDDveegAkkBylsREkSVusKsPA4YXKPGPk=;
        b=MpM5VkpJkHGrr0nJRyRuI2vpOg0UllFbX5LY7uQKviYoNHazn0oOibPIvoo2+Z5cB3
         g6T0pYnddOEPpnYnnEs025BAhRxEISqTx02NVGH+5BZnCVdQOhS4gDwv1+gTonLT31LY
         ROTlCkhqXo03rgBof29KsLTNoT5ZWEwSLsOWe2/H8zbMS0LGd+YFCmEwZAx62PtrXIau
         mVHdAHSs65SuL/vnNUY0wSeIh8cEwr0pjWlLOFjbBziTy6GJnlHs9GXXbLuqnoyu3tR5
         uc29utb0xx+iJi650TKJO71k50ZmL8tOjpoO1/BTA5OUPx9TVI8pqTIpadJDvki+/NiE
         VRnA==
X-Forwarded-Encrypted: i=1; AJvYcCW4OYkFqMYQhYhf4Q5IlIVXPcombP4v6shFWq5kYQX5J7IZYlm4oO4+TYfxf0xVt1EZcgX4u5w3AwqMow==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQV5gU20Vtc0aVioBxXTsLFCWQgj2/AQDO9ZQM4RmpVfP1RAZd
	Xbk+edhbgJe76SHMPOfjrHzzuRIJhSITFfsBcvmyjo/oeHPgR0NNs61idy1eiOkVxcM=
X-Gm-Gg: ASbGncsOXwlnm+yNy/QOYvJOEHn3rrX8sPcdMF+nEyS7+FX9hTN7XSvup3unI0P2nzr
	VoVnflBoDF3kaQQUfmIPiQfvjO+qqMGkc1hhHeUGkFnQThflJgSivNQmKmKz23RrM6e1c3vF2bg
	pxvaDASB5pHsXxfA8RUHrF0QWM18sQpVkZBNB225hLNKDlfnAApndLWrt4iu9X/jLf7oni10Ivc
	bnxJpFEe2SitGHmrZL5fSnSGBB+NAaG5PpOj0d4LCmpRqdGKHLQ/wW1q5mbRA1Mb2nV+mnV8oHn
	8HNWxrIiCf1hG+z2wi0y7GUSxhQxltKUGFBfT/UwDwY6l/RZpQcrY3IrwawA2QtwEZ+NuUhgd20
	WCwbq7k4liXwhJ93wOL6txcMhHJbQb0a3S6SlauPTGvxpjBbeIno1kNDaT9+Z6AWv0zVx
X-Google-Smtp-Source: AGHT+IGRcheU2fSpI6wPrIrcXh76/ZT2qeR3VE5CvtyhdddJOl/Ib5LW5D+YkzJh3O0sYVd9k5LTng==
X-Received: by 2002:a17:903:4b2f:b0:24c:cc32:788b with SMTP id d9443c01a7336-29027216103mr72693895ad.3.1759975124530;
        Wed, 08 Oct 2025 18:58:44 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:44 -0700 (PDT)
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
Subject: [PATCH v2 03/18] mm: Move the fallback definitions of pXXp_get()
Date: Wed,  8 Oct 2025 18:57:39 -0700
Message-ID: <20251009015839.3460231-4-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185845_308837_0B5ACB83 
X-CRM114-Status: GOOD (  11.16  )
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

Some platforms need to fix up the values when reading or writing page
tables. Because of this, the accessors must always be used; it is not
valid to simply dereference a pXX_t pointer.

Move these definitions up by a few lines, so they will be in scope
everywhere that currently dereferences a pXX_t pointer.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2

 include/linux/pgtable.h | 70 ++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 25a7257052ff9..50286763b652f 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -90,6 +90,41 @@ static inline unsigned long pud_index(unsigned long address)
 #define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
 #endif
 
+#ifndef ptep_get
+static inline pte_t ptep_get(pte_t *ptep)
+{
+	return READ_ONCE(*ptep);
+}
+#endif
+
+#ifndef pmdp_get
+static inline pmd_t pmdp_get(pmd_t *pmdp)
+{
+	return READ_ONCE(*pmdp);
+}
+#endif
+
+#ifndef pudp_get
+static inline pud_t pudp_get(pud_t *pudp)
+{
+	return READ_ONCE(*pudp);
+}
+#endif
+
+#ifndef p4dp_get
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	return READ_ONCE(*p4dp);
+}
+#endif
+
+#ifndef pgdp_get
+static inline pgd_t pgdp_get(pgd_t *pgdp)
+{
+	return READ_ONCE(*pgdp);
+}
+#endif
+
 #ifndef kernel_pte_init
 static inline void kernel_pte_init(void *addr)
 {
@@ -334,41 +369,6 @@ static inline int pudp_set_access_flags(struct vm_area_struct *vma,
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif
 
-#ifndef ptep_get
-static inline pte_t ptep_get(pte_t *ptep)
-{
-	return READ_ONCE(*ptep);
-}
-#endif
-
-#ifndef pmdp_get
-static inline pmd_t pmdp_get(pmd_t *pmdp)
-{
-	return READ_ONCE(*pmdp);
-}
-#endif
-
-#ifndef pudp_get
-static inline pud_t pudp_get(pud_t *pudp)
-{
-	return READ_ONCE(*pudp);
-}
-#endif
-
-#ifndef p4dp_get
-static inline p4d_t p4dp_get(p4d_t *p4dp)
-{
-	return READ_ONCE(*p4dp);
-}
-#endif
-
-#ifndef pgdp_get
-static inline pgd_t pgdp_get(pgd_t *pgdp)
-{
-	return READ_ONCE(*pgdp);
-}
-#endif
-
 #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
 static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
 					    unsigned long address,
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
