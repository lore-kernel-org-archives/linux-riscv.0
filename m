Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CA3C71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPCmFR9bbYbvA5tDwjYmXHjs6Uxe6ZiAGCPP54jppx4=; b=NHAsHhrpHVTiVA
	eRH0IDwsrHQwvhjURtruCHlTWHHtOHWUYUgs7yVtdGE/jaGGyXjEFlBwkRW4Yz5QD0iHn2ah9pawt
	6UZ4d8MVI67mp6gZNe1RAWGovMafAQJtM6TUOXmHAu8dwj/OQ/CJjVJpr+mROcnsuWLHnTfn6lPv0
	qXaBJ4lvinlcM7n3Lyj519YPo8lNHzps0EJm6Djzc5bt+LhFR7WEijgwT9pt3GfZ2paggQw3APujh
	nwGMeeDHsdsLUhb3hxPyLY5I8B+EElnTnGbq5a73QJEPYX3wJRDOhMuHCvZHELwnEhIS5sGtVD91j
	XiJNgi0RtmzLQDwccCIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyN7-0000000FXlK-0yZh;
	Fri, 13 Jun 2025 06:58:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyN6-0000000FXji-2a9J
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 06:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=FNP3ZhC9GNIj7dhp8mAGlOJO0IDx3wYw/8fnPqgsQ4A=; b=CzYjugayQfQioIhpnXiTsWk7ye
	mlKEwlyjB9B3bF8zDBjHZnDbB/SJnaBlaGxDCq2XNIH8ldo1kW89wg/jgIz+SAgi3vlE0aKGroIgd
	2XohZTKs48pJ8dDwGzp2pgTRYx5mwb5cROJhzCBMGeoHNa5/5Oy/Ya36gjYc6rLsmc/Y8r3fkh1Nv
	v+dudaai69eupaeLSaY04mf7DflkGHCQUuA+alDIvnlJvw8I+7sPDwiUXqninDUjx8lEL/N8gfRjh
	qgx8nCeACoEUyDYGGeLmjZp9avRoswl0BYFzOkdBmkp3IjIZeBpNMX1BtC9eYuAyglJ/KnJXm9AOw
	7X2BqrGQ==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyN4-00000002rxM-3GZ5
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:40 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3121aed2435so2172773a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797916; x=1750402716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNP3ZhC9GNIj7dhp8mAGlOJO0IDx3wYw/8fnPqgsQ4A=;
        b=ePUJmimPzmnTIf4jjrqQbFng32mNg+fKXnfR2VQC23Ci5O+UrKrXHYoZ9a5EIrcnGZ
         +amzAiDWFPzntD7VcNwbN7bAH21WtKi4Uepyu9XxqKDufn49uWR9RgoQWx+7CtIkuyAH
         7LtMCg8WwVViNqEF1o6Vri842BdPplcxjtj4ghSds4W6K/9AEnWYx0chGRo5sURqxT/y
         KJi6QTz+16PZKJ2q3ALpbmQizbwbM8wOA8XcMe6kmN/fd3e7cSncSfpCL/S9U69WFfPY
         7kGTNt4+otqmhpPALN9ruh+hfHf3OZDs8kb0ecABpfGs9PZapf04aXqzg5CyHt9ZVN71
         rXsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797916; x=1750402716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNP3ZhC9GNIj7dhp8mAGlOJO0IDx3wYw/8fnPqgsQ4A=;
        b=M0kPaJDjaBasSvjCYmJ+JOLYHjd/tQwmzqkU8M8948uxfMt00nvZSmNDW4UyxPo0qO
         /R9jRSKBY1MaeLDTgSH9OaVY1Ra0T1f9NXMaWqY0gqSs7vwmO2wZaYoROC0BB4IscAm/
         qzf0YBkfQKsNDEuV3lTflrn/X4Jy7kahQlUbJFmv2h7dmL7DoysZ2cY3cMNZ/DWTk/Tz
         7upHOqV9PiYUO5XzaL4ByaTHZKEC6aVS/eXXMwqz3TkTjGUMKZ5qg1sBgDiSc/g+azuP
         pl1nSbSe/TV1tuELzwJZVlYDQwqx30BtxogJ2jqIHeyVqA1mxcoMLPx5htukM93td0Ya
         cn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVJGHnYKomKa5419xTcZZJzCIeC3ZZ2PBAwWFXQ0ANOTdm0VdVVLdNJL7F2tYS9dnCcDMy8xuE2iEKuA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb1xa08+MNU/PthYfYr8hRTP/JTSE3/VR4sMd59kYwuVk6Mt92
	SYdNfrorHYb9WkjM4D8iZ3P3gAqFstjCJIsugZfdbz38SJo2sziXI2jNIh/g25klsiA=
X-Gm-Gg: ASbGncvac3EyVKiNMFvqRbTiFdihosoKLKklaqA6QGnzWgu7gicKrDQ59K3wBntVieb
	gwloSQrbwqUG+t3z93/K/2kqOU234jzHl9NJyTlTABuKZGenpYrsevHMdvx/M5a4Um0IXbO0y/x
	gZkZvf+1AZezp0oT0LVBD26rAddv5pnLbozvSlm84cat/9yfiIE93ZJeyqN1HwLnX2I4U0q7qDM
	3DyPUdKYDp9dkoHggjnu5U4iEVdLWVgRNSII0iKqjiuPWVmjy/HtUtiIyOMwpz5T/h6VGPQvgoo
	OiKEJLfy4owmGCkpM6bPaWSDNKvlPfNTf0dwFnuHgtpe9sChBjS2M8ho2UqvU1/matRPqWuftyq
	7qQmm08AUYgz77X6Vf60=
X-Google-Smtp-Source: AGHT+IGDqy2PQavEy6ds0UawCYjteSsSz2IcR4uhx43bZDMn/f28fdAHJhym8i2PaanGblD94psvdQ==
X-Received: by 2002:a17:90a:fc47:b0:311:fde5:e224 with SMTP id 98e67ed59e1d1-313d9bcea22mr2924713a91.6.1749797915759;
        Thu, 12 Jun 2025 23:58:35 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:35 -0700 (PDT)
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
Subject: [PATCH v2 09/12] RISC-V: KVM: Introduce struct kvm_gstage_mapping
Date: Fri, 13 Jun 2025 12:27:40 +0530
Message-ID: <20250613065743.737102-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075838_898884_09E783C1 
X-CRM114-Status: GOOD (  16.90  )
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
mapping at a particular g-stage page table level. Also, update
the kvm_riscv_gstage_map() to return the g-stage mapping upon
success.

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
index c1a3eb076df3..806614b3e46d 100644
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
@@ -352,7 +354,6 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 			     phys_addr_t hpa, unsigned long size,
 			     bool writable, bool in_atomic)
 {
-	pte_t pte;
 	int ret = 0;
 	unsigned long pfn;
 	phys_addr_t addr, end;
@@ -360,22 +361,25 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
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
@@ -593,7 +597,8 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 
 int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write)
+			 gpa_t gpa, unsigned long hva, bool is_write,
+			 struct kvm_gstage_mapping *out_map)
 {
 	int ret;
 	kvm_pfn_t hfn;
@@ -608,6 +613,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 	unsigned long vma_pagesize, mmu_seq;
 	struct page *page;
 
+	/* Setup initial state of output mapping */
+	memset(out_map, 0, sizeof(*out_map));
+
 	/* We need minimum second+third level pages */
 	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
 	if (ret) {
@@ -677,10 +685,10 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
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
index 965df528de90..6b4694bc07ea 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -15,6 +15,7 @@
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
 {
+	struct kvm_gstage_mapping host_map;
 	struct kvm_memory_slot *memslot;
 	unsigned long hva, fault_addr;
 	bool writable;
@@ -43,7 +44,7 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
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
