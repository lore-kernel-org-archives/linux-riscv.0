Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A605BCD4F3B
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M0vvO/PrEKwI2y+XJNdWkRmjYqAaBRjn652ReII0LmY=; b=scDgYk54b8uJjk
	+Y/aozQD7srnlaPHW7pZC4ZlzIV7Rdbi4Rtjm7rqS+eLZZJK4tHWfpeCfI4moIGomPRD8IFAAixI7
	/2pzL/Y2Ub52OEcF6CGBLSDdP7s17ZD2rWzArHdDenwFKvoE6e674UJE1oyqkBfuFhrTUwDhDHCFO
	XbMFlpEU074p9V4KJS3zm3TvImpVWnPgACNS6s790knlYmaXdMstbfM1VlNEu5lyTRep7rvIpWmPP
	QDIWUbZg+RE+QRclFNsPQ+cTxf4mO8cIy24NQLA6ztV3n8xduWUZM9Zyc70LJt4JKChxMyQEdLrGx
	GxOpEKdYkPGfhAsH0EzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQX-00000009jhm-1uKZ;
	Thu, 13 Nov 2025 01:47:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQU-00000009jg9-2nK7
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Nov 2025 01:47:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YdtMIGVZlv4MisNDb9tnVG+/irsKPLGgILycxKzmm5k=; b=Mhr6WEoHXlGB9t77CIcZgXSa5s
	orN1kNeDsySuKtoXfgW3nFY3KM0SDeQQcpKEF7HdOpHwrwmMGc9qOr4q5KxpBftXsnwKhoF5M8H4L
	gn/n3l5+DAnrfLkfCgkqGvE6ABw4xdq0mh5850ixlSuTqZ9rWFH84fwysrE/4etKVvCMRJ1fi4EH3
	gZc1UGSPzRVXPWjotzwnE7Ky5VBkEE/ZEsFyDbom0lTkHYM/zgAIWR0mFVxWKAFE2AspCJnSE6bdj
	3LF5Gaouq6+8M1dcwcJI6WLsud03DIDEWZDSRJ9UA96pU4/A0LiBH3n3X21VR7PfsjN+r81d5mxLe
	c9FFk0Lw==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLYm-0000000Gmo9-0G9H
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 00:51:38 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-297dc3e299bso2684095ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998420; x=1763603220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YdtMIGVZlv4MisNDb9tnVG+/irsKPLGgILycxKzmm5k=;
        b=Ht2i315Muw/vg9qYDB72vvnjhiu9UsELhN9CkXTJxRMVC86FgBcnn77TlVwA3yfJWa
         fz5Y7C/K/VeA+DB9qHL29PPW+/hJDFsnpDo7byb+4HDOZ9Vm4n+yxop9QaurtzInA/d2
         DICFAfEAUzssGCZp8SzCOMA16X8kOR9F/mUjWgAgF4xlhHApH4PNW1RivdI4E8THVUjy
         eU2XuyzLtISmr/AoVtaaAKoSxcbGbT2HU+o9Mi6Hy166OYrSou/74hkwLTD7PnqhwYsj
         Yu7GjpO0PHNCnoQegs7kDaKsclLxmEGgtu+NINArJrzSnGj6n+1BWwHNYVHRg8hO6NlA
         sidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998420; x=1763603220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YdtMIGVZlv4MisNDb9tnVG+/irsKPLGgILycxKzmm5k=;
        b=kQXdE+Ee3CPjYAK17w7IhCVv93H7q3l9LiEnhlBRYYpurUEmnr+ofhRtkFHblWu/y8
         xIHtePIPVBw+JXxqxkLvDVrjthjnYb2TMZFH/CKGdvKzJiEtpgK0DeNmrM8bGiTnLKkX
         jFunHhkC+BQFLyPnfokpCiALKO57/BuTU+c5c8zT66UTj63H61UunwJKFOQQYjI60LQA
         5gh01/QmOH+GzNGl/F1Js/YiNxRB3Vta7snG13mignlTIdHq7Tz6zE6GmpNWf4A18WL3
         oulAcs14+MejBizA3VjYq7LazftcG9xe9a0omtPfTg5/pj7okSle8xva87yTJvzwuuaO
         Fo1w==
X-Forwarded-Encrypted: i=1; AJvYcCVaS2yPZ5BxIJ6ma/Inp1woeNZasq6O7joeL4mRb1nTCEzrRsdKv1WVI6bGGJYwoiKsbulLDI9j7OobAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzPP4ZyHfvQ93AH8lTYSrRx5yzmWgH+evznmxWpRlUjucmOp9R
	LnnBk/XOjSq9D+lMGgutFheEHUfoeL6rsnsg/c8naQhNXf/ht8oBq2i7SOWzB3tTEkxxD2dDjGs
	sCMnC
X-Gm-Gg: ASbGnctOF+4k3JcSKEKvXQN8DOpSf0oxqkgACq+jNYtaGITtnsSbQHS4xvfvTRjHbv8
	21yI6wKKbTh5d9N66zSyZqsfwupKHVJitK6eSZ5GVc7Ot8jE4KF6xv+FjZ4qw23zHByD/oArt4C
	tPszqgNo1sR5s6V7G005vBt4CZFXS5msrmwsMhHBawLct002xSe+mQG0My5ZaMUSfUpk7+tfdhA
	8mjOQdsgRXY0b5jy70oDUoUO1khOfTM2L34CzfewJ0H8qGYl2BowZ4ySjIqk5LXcDfledsUPtiC
	pux2QgfcgeDI1qnc/DX7Wuve7/vc/QfV9iDpd+1iM0Nzugbb2ZzLslmeiY69GXtPgzwyCRFk7r2
	EH7rcDwz2pxVqUkAVV/7lWDAyGptNFkt9QFHC8kBJ12DifeSC0qRxbZe9VEm3DW6v0IasrYj7yX
	fmCqH0QiqOLfgiIqf0shUYVA==
X-Google-Smtp-Source: AGHT+IFYjWF2Je2zdGG5G71XUhLWD4KFs37feNtxzRSLtVmw8LZxUlSD+Pjrpw1Q7n3dWJ2wHP2y9w==
X-Received: by 2002:a17:903:3c64:b0:295:3e80:9aa4 with SMTP id d9443c01a7336-2984ed46fcamr62445305ad.22.1762998420290;
        Wed, 12 Nov 2025 17:47:00 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:00 -0800 (PST)
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
	Dev Jain <dev.jain@arm.com>,
	Lance Yang <lance.yang@linux.dev>,
	SeongJae Park <sj@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 01/22] mm/ptdump: replace READ_ONCE() with standard page table accessors
Date: Wed, 12 Nov 2025 17:45:14 -0800
Message-ID: <20251113014656.2605447-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_005136_280832_1E070386 
X-CRM114-Status: GOOD (  11.99  )
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

Replace READ_ONCE() with standard page table accessors i.e pxdp_get()
which anyways default into READ_ONCE() in cases where platform does not
override.  Also convert ptep_get_lockless() into ptep_get() as well.

Link: https://lkml.kernel.org/r/20251001042502.1400726-1-anshuman.khandual@arm.com
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Acked-by: Lance Yang <lance.yang@linux.dev>
Acked-by: SeongJae Park <sj@kernel.org>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Replace patch with cherry-pick from linux-next

Changes in v2:
 - New patch for v2 (taken from LKML)

 mm/ptdump.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/mm/ptdump.c b/mm/ptdump.c
index b600c7f864b8..973020000096 100644
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
