Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A7EEC5B543
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuTwpWNZejRIY7f/rKmPFE1pJdywVNSmafn7ukHUtlw=; b=eR38dVkLlHoCuv
	ggXXRP9uyhBGkwewZmTeLZphhgt/Awq7+jrn+6DZAdEtk+7IOu79qTO0hhJlTM5OHur/bj/X5yyLQ
	Xk/Ijhc8kUy0fIJuY13qp2QbZ/5psANwRIYYDJGp9fG5UUFuhJRH1Q/ZA7hkDSY6jqWkeA0r/ZDYV
	5I6kiaHPvVJ5rorPEwuxXsjbrCYxfg0slTdNYX1mHWxzA4QlalCv+XFwuOm7cK0vk+xOAG0SiIKOE
	OraIU1LIIlUvBhJ4Dr+lYOiLx4tq/foKkp1EZctxPrFRUD6MRNhblZFJjx4l7EO8ErZr12v3wlMhy
	4Aw3FH3oYhZXSU0f4JSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3tF-0000000EpOM-0zp7;
	Thu, 05 Jun 2025 06:15:49 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3tA-0000000EpHc-2Xyc
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:47 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2349f096605so7052065ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104144; x=1749708944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZLXSy5dKdnrCLdxDNwluOSVBrj34xrZ5br2B7QUPFM=;
        b=mAXVlgQ5xc2RnotrDsVpOIVyt81a1eyWOAok/Ugsqo9VyEn2A38RzCcxBewVP9Pnui
         THtwkg7/GdK863rAopYm2aP7dfRgMqdpCDRsuSNTN83l+vgbsyYLoy96jkXZ6UG8LtX6
         tX+iWudLeMzrlaUX3BxymK2fskaNPKEM+VaJF52TGb6iv/Yp+rYig/NeRGsEmKuxcY0p
         sVnpEkqIhS9mXtH8SbqM+9T3e/I42VJsyqnih8J2rhoXooLCZpEQRF6MpN0L+B1xdHGg
         XMoqFN7OKStyoPpaklZo4UiylR7UcSV7bELGXKiLrH17Entw0aaMe0DM0SK1yNADLzQA
         sePg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104144; x=1749708944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZLXSy5dKdnrCLdxDNwluOSVBrj34xrZ5br2B7QUPFM=;
        b=POOL4juE8WHrZxigBuul4vmDnAkabimTFJV1k9R3cd0b1W5zlu7wzivErUjsdgJIj/
         hNimUGQUS8HFUv2iSWD58kmhQc6Yet4TP9XvCNHt1Czibkk4GkStTh2Iu3OG5pi6TzWq
         8OiOc9fuYFs6SV+IxF1c9p8xh0PLZNpZVsvwNyeTGUULO5BEdel4T4NKAn7SfkLyhPQ3
         tzW1XxQSEDfiLyeurAH+BuNvO00dQoJ/QFBfzVUiQu3EjaclfCBXdj8Ybz6ApnNs/SAb
         hZaWJVZ7pemd0qqQ4rhVZE+8iaS2fN3zU0qbvd37Bo3tuCbvh6ZjpEwJQHmEbVJJK4Og
         3XJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVevoZoTByRUZV+mAqoJroiqITey52V80yDXxMoygBT7+sm/vd7OafE7QxR9sqa3/6FVflYJDZ1EzBP7g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3E+w6qpZkuNf//xy3ypnJy/gHKWcgJI1CwOs+hDok3+I6jH9j
	vbdef6+TIV8Jmg6PA7z4xpSKH+oIiNj3p4x25jIARvJYZudEg3CxfyB8ykbko+vN4+4=
X-Gm-Gg: ASbGnctgwtb4nXUP9/9xBzJUr7Z4/jN3VNOT++IIAgdEbRmccqtuM/LwV0yO90k9X2d
	Y2PIZ7dwmPo8mVwFXbUVbsNX7PF1Pt8bcS90vuXXPAsL0UNicHd2vJVAKjAzJHOTBHJnzcNi9ac
	GrTYGCrYjjET7Qj7MYhkbGH/sib5A+Woat5uwjaZMxvrczKl987LPeQlcS6BtvUmrD/kIUxbTYr
	PSr8KpIFyEtKJqRpQbbqe6Tt2SWq/oQRCc04fQHuKbdVBpXpiwtsI+tJF3Eh/mHhd7rRRBtse+G
	PNxwsXWdSW+lyuB8moi/rp7nkBv4UEic2WFIlKlA5ENr1SYvADlmlgNr9Zmt+F9RnqEp4NChSah
	aE6WrzT7zSavHo6c0
X-Google-Smtp-Source: AGHT+IFO2epwN2LjtG31OoHm0egnGNF3it3sm9FcAWa7tNOhP+eBWwaD0IdyHqo/ELqbwOrF1xeE1A==
X-Received: by 2002:a17:903:230d:b0:234:8f5d:e3bd with SMTP id d9443c01a7336-235e11ebbaemr80514335ad.39.1749104143890;
        Wed, 04 Jun 2025 23:15:43 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:43 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 10/13] RISC-V: KVM: Introduce struct kvm_gstage_mapping
Date: Thu,  5 Jun 2025 11:44:55 +0530
Message-ID: <20250605061458.196003-11-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231544_652212_0A01B203 
X-CRM114-Status: GOOD (  16.96  )
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

Introduce struct kvm_gstage_mapping which represents a g-stage
mapping at a particular page table level of the g-stage. Also,
update the kvm_riscv_gstage_map() to return the g-stage mapping
upon success.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_mmu.h |  9 ++++-
 arch/riscv/kvm/mmu.c             | 58 ++++++++++++++++++--------------
 arch/riscv/kvm/vcpu_exit.c       |  3 +-
 3 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_mmu.h b/arch/riscv/include/asm/kvm_mmu.h
index 4e1654282ee4..91c11e692dc7 100644
--- a/arch/riscv/include/asm/kvm_mmu.h
+++ b/arch/riscv/include/asm/kvm_mmu.h
@@ -8,6 +8,12 @@
 
 #include <linux/kvm_types.h>
 
+struct kvm_gstage_mapping {
+	gpa_t addr;
+	pte_t pte;
+	u32 level;
+};
+
 int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 			     phys_addr_t hpa, unsigned long size,
 			     bool writable, bool in_atomic);
@@ -15,7 +21,8 @@ void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
 			      unsigned long size);
 int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write);
+			 gpa_t gpa, unsigned long hva, bool is_write,
+			 struct kvm_gstage_mapping *out_map);
 int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index c9d87e7472fb..934c97c21130 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -135,18 +135,18 @@ static void gstage_remote_tlb_flush(struct kvm *kvm, u32 level, gpa_t addr)
 	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0, addr, BIT(order), order);
 }
 
-static int gstage_set_pte(struct kvm *kvm, u32 level,
-			   struct kvm_mmu_memory_cache *pcache,
-			   gpa_t addr, const pte_t *new_pte)
+static int gstage_set_pte(struct kvm *kvm,
+			  struct kvm_mmu_memory_cache *pcache,
+			  const struct kvm_gstage_mapping *map)
 {
 	u32 current_level = gstage_pgd_levels - 1;
 	pte_t *next_ptep = (pte_t *)kvm->arch.pgd;
-	pte_t *ptep = &next_ptep[gstage_pte_index(addr, current_level)];
+	pte_t *ptep = &next_ptep[gstage_pte_index(map->addr, current_level)];
 
-	if (current_level < level)
+	if (current_level < map->level)
 		return -EINVAL;
 
-	while (current_level != level) {
+	while (current_level != map->level) {
 		if (gstage_pte_leaf(ptep))
 			return -EEXIST;
 
@@ -165,13 +165,13 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
 		}
 
 		current_level--;
-		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
+		ptep = &next_ptep[gstage_pte_index(map->addr, current_level)];
 	}
 
-	if (pte_val(*ptep) != pte_val(*new_pte)) {
-		set_pte(ptep, *new_pte);
+	if (pte_val(*ptep) != pte_val(map->pte)) {
+		set_pte(ptep, map->pte);
 		if (gstage_pte_leaf(ptep))
-			gstage_remote_tlb_flush(kvm, current_level, addr);
+			gstage_remote_tlb_flush(kvm, current_level, map->addr);
 	}
 
 	return 0;
@@ -181,14 +181,16 @@ static int gstage_map_page(struct kvm *kvm,
 			   struct kvm_mmu_memory_cache *pcache,
 			   gpa_t gpa, phys_addr_t hpa,
 			   unsigned long page_size,
-			   bool page_rdonly, bool page_exec)
+			   bool page_rdonly, bool page_exec,
+			   struct kvm_gstage_mapping *out_map)
 {
-	int ret;
-	u32 level = 0;
-	pte_t new_pte;
 	pgprot_t prot;
+	int ret;
 
-	ret = gstage_page_size_to_level(page_size, &level);
+	out_map->addr = gpa;
+	out_map->level = 0;
+
+	ret = gstage_page_size_to_level(page_size, &out_map->level);
 	if (ret)
 		return ret;
 
@@ -216,10 +218,10 @@ static int gstage_map_page(struct kvm *kvm,
 		else
 			prot = PAGE_WRITE;
 	}
-	new_pte = pfn_pte(PFN_DOWN(hpa), prot);
-	new_pte = pte_mkdirty(new_pte);
+	out_map->pte = pfn_pte(PFN_DOWN(hpa), prot);
+	out_map->pte = pte_mkdirty(out_map->pte);
 
-	return gstage_set_pte(kvm, level, pcache, gpa, &new_pte);
+	return gstage_set_pte(kvm, pcache, out_map);
 }
 
 enum gstage_op {
@@ -350,7 +352,6 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 			     phys_addr_t hpa, unsigned long size,
 			     bool writable, bool in_atomic)
 {
-	pte_t pte;
 	int ret = 0;
 	unsigned long pfn;
 	phys_addr_t addr, end;
@@ -358,22 +359,25 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 		.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0,
 		.gfp_zero = __GFP_ZERO,
 	};
+	struct kvm_gstage_mapping map;
 
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
 	pfn = __phys_to_pfn(hpa);
 
 	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
-		pte = pfn_pte(pfn, PAGE_KERNEL_IO);
+		map.addr = addr;
+		map.pte = pfn_pte(pfn, PAGE_KERNEL_IO);
+		map.level = 0;
 
 		if (!writable)
-			pte = pte_wrprotect(pte);
+			map.pte = pte_wrprotect(map.pte);
 
 		ret = kvm_mmu_topup_memory_cache(&pcache, gstage_pgd_levels);
 		if (ret)
 			goto out;
 
 		spin_lock(&kvm->mmu_lock);
-		ret = gstage_set_pte(kvm, 0, &pcache, addr, &pte);
+		ret = gstage_set_pte(kvm, &pcache, &map);
 		spin_unlock(&kvm->mmu_lock);
 		if (ret)
 			goto out;
@@ -591,7 +595,8 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 
 int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write)
+			 gpa_t gpa, unsigned long hva, bool is_write,
+			 struct kvm_gstage_mapping *out_map)
 {
 	int ret;
 	kvm_pfn_t hfn;
@@ -606,6 +611,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	unsigned long vma_pagesize, mmu_seq;
 	struct page *page;
 
+	/* Setup initial state of output mapping */
+	memset(out_map, 0, sizeof(*out_map));
+
 	/* We need minimum second+third level pages */
 	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
 	if (ret) {
@@ -675,10 +683,10 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	if (writable) {
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
-				      vma_pagesize, false, true);
+				      vma_pagesize, false, true, out_map);
 	} else {
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
-				      vma_pagesize, true, true);
+				      vma_pagesize, true, true, out_map);
 	}
 
 	if (ret)
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index cc82bbab0e24..4fadf2bcd070 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -14,6 +14,7 @@
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
 {
+	struct kvm_gstage_mapping host_map;
 	struct kvm_memory_slot *memslot;
 	unsigned long hva, fault_addr;
 	bool writable;
@@ -42,7 +43,7 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	}
 
 	ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
-		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
+		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false, &host_map);
 	if (ret < 0)
 		return ret;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
