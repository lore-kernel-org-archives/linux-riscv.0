Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EDACCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=at4GfXtqbvpU3a8XK1Lad+B26DUJHfxLAQ3ze/bcPQ8=; b=tBr6XKhSpF/JiM
	jTpssSffz2hMIgkMM5SAVr7hS99zG+mPRxIaku1qbguL8JdwTr7CMIXdjzrFqy1AQK/vpuFZVTHxc
	rgJNtOy2DWpLk5mGM8O14hjmdH7FRYQXjmcyZBZUKJhcrzkAWoHv+zJ42hXxpyRnpXi0cXuYsXXcs
	dRsL0zIHq5HU19Nl7HEG9dNkwhmbfvNkkFJ3n3Gao/TWyij+OjxV7drWb/qmDlbwnxlDt6Rl/UG2n
	ZwR/TFJkfqhR+DqCOKaP8VFW3DGLrG3CdUu8MqfA0Ib9PwyoyOK2f4HsnrVSHi2btggQMMZ9LYkWX
	Nx21C3hmTHBb55rm9I0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvZ-00000004z5s-1r0E;
	Thu, 09 Oct 2025 01:58:45 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6fvW-00000004z3i-3jEZ
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:58:44 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b551350adfaso335689a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 18:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759975122; x=1760579922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAFzin3ivjrQZj/QpZ54jF9jkkD8Fld75BEMN783hL8=;
        b=WFyQy/besGSqJ764cJVHgTtR078bQ2BOcWS0IQh9XPk43sa9f8PV/4HCqXRcCwizMO
         oG6boOgUAty8SyLK+EIitUlmLkeIZbEHr2fqhEnkKcLYYGyBlDT6WMk89T19YQw9BKRq
         GLqpQ4eypcC2wtXa1YT7N0k0LJUMJ+624wP7dMncJyWTVqyvujFOe/0HKo1UTnKzIypI
         CDdkGQjXkFzTHHw9qBB3MRidGrWukb6zeWUYBWTx+XXCZuUdfAQKXmXC/ii5eZ8axONu
         D67/koVmw17NW3Mf3cOAqGyAliHt4PM3Z/9DFA+Yes5w0m++Y1p3YcxRCIfRw4VIpE5i
         iaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759975122; x=1760579922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAFzin3ivjrQZj/QpZ54jF9jkkD8Fld75BEMN783hL8=;
        b=uLvuM3HFsDMHk9tKcUbNF27XezolJMCfJ2E8VlGQTv9eYEGwC60roNpelb2yCQ0wfe
         LGKREbaeenEbl0HmbhU217HJS9Z+BNl8hiaIFUwpCyyq7Z4T158b7LiqDEgVO9mu06U8
         2q/GNi0lMZCgtPtkE5e5IoaXia/SyYHkRgMqaDTKlmkcqL7I6LFLilt5DwxgWQUL0HCn
         huEnEAX57nQyc7Hl8GuYkKuTkjh70G/T7iEN+buOGW8wlauhlfaUzB0zpYUWdLb+GT11
         NYGbJtDLUdN8p49UmqMTPg+wh5Zt0bf7LWQxFNztsDbRWI86V7I54IgftonnO2qdeadh
         1rHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSsYf4AWqRCE5DRiGAnuOXm8zA4n5HFnGBi3trMX6i+yxBZxo2AWrviHp9pG8pmc1UqkkoK/CGYbl6dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YybEHj4m7HZApTBeAvO6irBSSGPf8e6/qVtmfkDnKKQhvN3B1rg
	jSRKTuuVZHkewOiCoJmsjJmnTaKOfszBfmu7bhVZK46HrPPhfJsXoa8csvqKZJaNJws=
X-Gm-Gg: ASbGncuC5kujzINEUGaoFi9fQHsI6mZaINDGqjtElvUpZnPqebtJyZCRsFwH5ngw+wv
	qW2S8Nq2vgV1amEluYrbOVyI6bSXjbm2wg7dzVdPCTl1xCNG+b2wJKqppDmwbpaIcXPc8PtcWR/
	i8eGQKghwhDB9l/xKWW1A1MQGyebBtQ7TpMIm5n5MYT+ySom7TySpHxHbiIsWpyXbszvYJNT6xX
	AudpSX1SWUmXFilpjyPFn20Wzu+yI3i8VVUNwKeJRaCeCkbzf8ixkJXKEhs1EAnOP0hG+CR67Im
	wCuN1RGeSqZDHfYu3TUOS3+AS/fi3nqaj9zyw3QCEBw1hcYnojFX3IQTV+lK0T4rT1SarfmSeGU
	BuKDYsL+iFIWtCSGFGb5JdVVyRkL904FlxmK/VxPDBT1Ox/3F3ZSHMiVasixyCl8XQhkoxfWVyY
	55z+Q=
X-Google-Smtp-Source: AGHT+IG2D+B4sYEjYqHTfYtptXhLnt1g1J3431Y1pnRWZqcWdGLQKwHj4/A4KlwSUJg/qQlrRp74lA==
X-Received: by 2002:a17:902:d58d:b0:28a:2e51:9272 with SMTP id d9443c01a7336-290273ffcd2mr61826225ad.48.1759975122096;
        Wed, 08 Oct 2025 18:58:42 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de53f9sm11033585ad.14.2025.10.08.18.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 18:58:41 -0700 (PDT)
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
	Anshuman Khandual <anshuman.khandual@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 01/18] mm/ptdump: Replace READ_ONCE() with standard page table accessors
Date: Wed,  8 Oct 2025 18:57:37 -0700
Message-ID: <20251009015839.3460231-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251009015839.3460231-1-samuel.holland@sifive.com>
References: <20251009015839.3460231-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_185842_933656_E59CCA28 
X-CRM114-Status: GOOD (  12.92  )
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

Replace READ_ONCE() with standard page table accessors i.e pxdp_get() which
anyways default into READ_ONCE() in cases where platform does not override.
Also convert ptep_get_lockless() into ptep_get() as well.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Reviewed-by: Dev Jain <dev.jain@arm.com>
Acked-by: Lance Yang <lance.yang@linux.dev>
Acked-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Acked-by: David Hildenbrand <david@redhat.com>
Link: https://lore.kernel.org/r/20251001042502.1400726-1-anshuman.khandual@arm.com/
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - New patch for v2 (taken from LKML)

 mm/ptdump.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/ptdump.c b/mm/ptdump.c
index b600c7f864b8b..973020000096c 100644
--- a/mm/ptdump.c
+++ b/mm/ptdump.c
@@ -31,7 +31,7 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	pgd_t val = READ_ONCE(*pgd);
+	pgd_t val = pgdp_get(pgd);
 
 #if CONFIG_PGTABLE_LEVELS > 4 && \
 		(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
@@ -54,7 +54,7 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	p4d_t val = READ_ONCE(*p4d);
+	p4d_t val = p4dp_get(p4d);
 
 #if CONFIG_PGTABLE_LEVELS > 3 && \
 		(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
@@ -77,7 +77,7 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	pud_t val = READ_ONCE(*pud);
+	pud_t val = pudp_get(pud);
 
 #if CONFIG_PGTABLE_LEVELS > 2 && \
 		(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
@@ -100,7 +100,7 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	pmd_t val = READ_ONCE(*pmd);
+	pmd_t val = pmdp_get(pmd);
 
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 	if (pmd_page(val) == virt_to_page(lm_alias(kasan_early_shadow_pte)))
@@ -121,7 +121,7 @@ static int ptdump_pte_entry(pte_t *pte, unsigned long addr,
 			    unsigned long next, struct mm_walk *walk)
 {
 	struct ptdump_state *st = walk->private;
-	pte_t val = ptep_get_lockless(pte);
+	pte_t val = ptep_get(pte);
 
 	if (st->effective_prot_pte)
 		st->effective_prot_pte(st, val);
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
