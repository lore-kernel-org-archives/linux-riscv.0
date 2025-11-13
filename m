Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F225CD4F35
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 01:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yaDdeewyYpwvpnNeZ0PyU528QozNP2K/4nBzgkPqAjk=; b=cr/fJ72/Pk32PN
	NiBt8XS4yeQkGcmRrUP0qJmi/A3sGWEqIBKQ4Lkh56oIGLMrpoXBfd14fXXugiTPHhYbDfvv8OAn/
	PwpjB0sRwtN5VY1Wt2UyXD/1AIklOI2y+tM05W3nO7GFhWdK1uLO/aZn/giyx21960jBebDHqF6Sp
	UP6NDh2011KhPfLhjU+OyITt94a61ODLSyaoL+KeDyPX1JdY7M/BzAwpTjncBrJFDKcj1FXHt8RlT
	AnKItcPM6isP5eLhl6eljD0n58ep5iFzC8Dsa/Z4FHDoUmsPwDyibP04zEyZqsIomQNj6ZsZTXjDT
	SfrCZdHUFtTIEmcAD8vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQw-00000009k3W-0srA;
	Thu, 13 Nov 2025 01:47:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJMQs-00000009jzJ-3KoD
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Nov 2025 01:47:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fpe1iExYP0zyH90A/cjYKaPPTKIVrHTbjuAaN9Ted2E=; b=mKQ/IAWNiOm37Hk6TJUbkbiuIe
	FShylAZDvK81+SbgdqrFZPLOLY1xa3PpE7WTQS01T6vR/tUpZLzf7VbUfhWVfVARcf0qRHFAmEW9i
	bgJLd4JrCWvwo3jjDbzBGNHWDS5Qf+VMcT02oMMB7Vo7zI2eqho/L1+1p5ZZdlukFM9Xg7fX21PWh
	f0m1H+SEeDu6DoZLLTVUKWR1RgYNQcXSihpgIdRdMrGGb5aaLHSJM2XvsD2UjK+W0vtHxd5H9U4/d
	xfsK7Mne7/0k7J8psvvt8VHUItC01Yix0yYsfD5NCgdK0TsV4ZfuyuG5Z0yUo1vJrgfoOVf1hboh1
	2NFKYhdg==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJLYw-0000000Gmsd-1DQm
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 00:51:59 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-297ef378069so2423855ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Nov 2025 17:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1762998431; x=1763603231; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fpe1iExYP0zyH90A/cjYKaPPTKIVrHTbjuAaN9Ted2E=;
        b=kKVX30GL3iJEXjIeviQ5WF92Owuyx7rBTehjWbfeUg4IULiVLwjBLsy95SRJIi/hal
         V+Wij/Jq+3JLHt+NFRM+hIHAvZsP4y6FP+h+iI7z1m76D3rh4kXQRoAS9vzbHGuO4HgS
         XkUZwosEjWtFHaVhJY5Pqy36O8zrzwldCor8M59FTdh8zwLsKtnBQxeTIEn5UrmjJR/G
         sxzUPdmJr3T6XgQ5EopMTNZvhPHYcXurWmsWde7faDKBuWc7JHb7UddPAMppKxSoTzxk
         9o7HyRj3sHxw9oSPNJiT3hdHvWo2xZCKVeDErtR64++PELcwzIYUiQ6H0C28/t5phqzM
         c8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762998431; x=1763603231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fpe1iExYP0zyH90A/cjYKaPPTKIVrHTbjuAaN9Ted2E=;
        b=ApmQmOQJi5ISPzuJBn/VK+zDvFqgeZn2xOvG8dj1eayvnbtCPzo8/0rD65/5ziodo5
         gLGJBMZfR/MiLY2qEQwUyBoZH/Mamz61jvcNCsUJvxpkybsYI3d01hMeip6eYIfG0/hA
         gO5G7atXKnQ5bg0c+Px+/RV3mJHNNmFz6r5GrFQnEkEMV6umytx++HIQ6fUg8mruuJtP
         aNVHQ3UxSwe+MRl7C8dMw/agFeQySneEHPIZzvPhHIbn6MaLFPwp7O4oXHs3mqMlal7q
         wUxkVBlwbRsho5zMEhPSHEFXWBjsTKwz+VcCg9zGlqB9wf6p/2JmWnCwGWKejq4T7YJ4
         n/3g==
X-Forwarded-Encrypted: i=1; AJvYcCVvtlNXZ4GSmuhwzaM++bLzd8ezWwP3mXvfu34qT4Lndf0qc63GW2v3SBuxn85Ccl3VCeYP5BlT2JeT+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbIfDSsBz3LcoZqdUR2c4ymCfgiwNT8qLBhNmm/CeaaDPKLNtF
	oOPakJ7rwS7Ke7WxGdBrsSWMfBW5nl8DL06WTX9nWEnliTvRPfCGiOEXQdNvQHCCRqM=
X-Gm-Gg: ASbGncvdkMo6bpxrwq7OCiBhxJEUjhsKDeYiwgEKYcL/nUeOpdd2sIZX1NhA9TcNKEG
	AwmbxHxwl/7iGd6QYGi5PZEuIcsIZCv8vqeFwOlRu80Oy6hwn2AwjmcRBE5fQKHrYjlyUddi2Vp
	ABVU/VHtzD3K+3/S+3tt/eC9xdY9BGXbYA1tAT4PW2KAOxidU6S1WUiE++G0NrSxsl26QYC13q4
	/EIQRMWgrYerYCUQGWLjSqwQkOeJeST5QanpbT93DAYh9pmgt69/D9PAED1GLENxhpmMP9gHmly
	lL8GzZkyFzTdb7y50PsAAZ7vBX69PKTrp0PFt2L4P9DC66PyPHJhnM1L8gbqfA8PUsgwYckX5U6
	H0czDdVRJid266ZnP1TNlSzj1qfFYnF1Zj6ep0B8ZhR7BvbY79H6JDychKodl0j1IgJ9PJ/G0pz
	fCXu6xuzS1XvsRTI9BWugxMg==
X-Google-Smtp-Source: AGHT+IHfQlkxOaBsnfDtOhaN9Eg9wG5LhwHH/6CgE2hK5xO5V/1h7VmoyWUWgcNESoHw3XrIzaUDgw==
X-Received: by 2002:a17:902:ebc7:b0:298:481c:cbd4 with SMTP id d9443c01a7336-2984eda4101mr66654135ad.26.1762998431452;
        Wed, 12 Nov 2025 17:47:11 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccae8sm4986485ad.98.2025.11.12.17.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 17:47:11 -0800 (PST)
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
Subject: [PATCH v3 08/22] mm: Allow page table accessors to be non-idempotent
Date: Wed, 12 Nov 2025 17:45:21 -0800
Message-ID: <20251113014656.2605447-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251113014656.2605447-1-samuel.holland@sifive.com>
References: <20251113014656.2605447-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_005156_317081_7AE521F8 
X-CRM114-Status: GOOD (  16.85  )
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

Currently, some functions such as pte_offset_map() are passed both
pointers to hardware page tables, and pointers to previously-read PMD
entries on the stack. To ensure correctness in the first case, these
functions must use the page table accessor function (pmdp_get()) to
dereference the supplied pointer. However, this means pmdp_get() is
called twice in the second case. This double call must be avoided if
pmdp_get() applies some non-idempotent transformation to the value.

Avoid the double transformation by calling set_pmd() on the stack
variables where necessary to keep set_pmd()/pmdp_get() calls balanced.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - New patch for v2

 kernel/events/core.c  | 2 ++
 mm/gup.c              | 3 +++
 mm/khugepaged.c       | 6 ++++--
 mm/page_table_check.c | 3 +++
 mm/pgtable-generic.c  | 2 ++
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index fa4f9165bd94..7969b060bf2d 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -8154,6 +8154,8 @@ static u64 perf_get_pgtable_size(struct mm_struct *mm, unsigned long addr)
 	if (pmd_leaf(pmd))
 		return pmd_leaf_size(pmd);
 
+	/* transform pmd as if &pmd pointed to a hardware page table */
+	set_pmd(&pmd, pmd);
 	ptep = pte_offset_map(&pmd, addr);
 	if (!ptep)
 		goto again;
diff --git a/mm/gup.c b/mm/gup.c
index 549f9e868311..aba61704049e 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -2844,7 +2844,10 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
 	int ret = 0;
 	pte_t *ptep, *ptem;
 
+	/* transform pmd as if &pmd pointed to a hardware page table */
+	set_pmd(&pmd, pmd);
 	ptem = ptep = pte_offset_map(&pmd, addr);
+	pmd = pmdp_get(&pmd);
 	if (!ptep)
 		return 0;
 	do {
diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 1bff8ade751a..ab1f68a7bc83 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1724,7 +1724,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 		struct mmu_notifier_range range;
 		struct mm_struct *mm;
 		unsigned long addr;
-		pmd_t *pmd, pgt_pmd;
+		pmd_t *pmd, pgt_pmd, pmdval;
 		spinlock_t *pml;
 		spinlock_t *ptl;
 		bool success = false;
@@ -1777,7 +1777,9 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 		 */
 		if (check_pmd_state(pmd) != SCAN_SUCCEED)
 			goto drop_pml;
-		ptl = pte_lockptr(mm, pmd);
+		/* pte_lockptr() needs a value, not a pointer to a page table */
+		pmdval = pmdp_get(pmd);
+		ptl = pte_lockptr(mm, &pmdval);
 		if (ptl != pml)
 			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 31f4c39d20ef..77d6688db0de 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -260,7 +260,10 @@ void __page_table_check_pte_clear_range(struct mm_struct *mm,
 		return;
 
 	if (!pmd_bad(pmd) && !pmd_leaf(pmd)) {
+		/* transform pmd as if &pmd pointed to a hardware page table */
+		set_pmd(&pmd, pmd);
 		pte_t *ptep = pte_offset_map(&pmd, addr);
+		pmd = pmdp_get(&pmd);
 		unsigned long i;
 
 		if (WARN_ON(!ptep))
diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
index 63a573306bfa..6602deb002f1 100644
--- a/mm/pgtable-generic.c
+++ b/mm/pgtable-generic.c
@@ -299,6 +299,8 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
 		pmd_clear_bad(pmd);
 		goto nomap;
 	}
+	/* transform pmdval as if &pmdval pointed to a hardware page table */
+	set_pmd(&pmdval, pmdval);
 	return __pte_map(&pmdval, addr);
 nomap:
 	rcu_read_unlock();
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
