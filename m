Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26A32CCD19A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvUThInJP5zGgwfmUD7vvixcS+JMGbfxhrbQDDFvKas=; b=Vqvcoi70lEvIpV
	NkVD9Y2wPdNpzQFApvbAaQVp/oqJAUCgmfFho1d3GC4YYNDwwdEiaZ8wRUm1jlXBlulSzpdXXcLhr
	hfginGqo73Pm2AQWDZLb4787bPHg6DU677Agg7dx3xf1U9QCiYWiBytzDY6mhQfVxSlXVh8F98lRC
	xT4WVGOu1bQ/+IjyqqRJwnOTEeOSPALROEzT5kJ7LCCUyEmD63XQ/pA/jSgG7j9HLsmK0CCw0GWte
	Ut6azTMrhPW/WrHXTlgAVcABfnDyEF7f+0C+B1zH8E0Ou3UqLEUfcjsrVG9677hr2Az5VzMz0kv20
	a5FmC0hXmx6CrM9aTKVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPw-00000006E32-0hgv;
	Fri, 17 Oct 2025 00:34:00 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YP5-00000006CrE-3hW1
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:10 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-269880a7bd9so17294865ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661186; x=1761265986; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=VqN6FPJY384bIppIse52Rb5Kgtgq051USSGGCGlx7fA=;
        b=I3lqnC2ZO+L2gj5CE4rN4YMjnFFDW7+X+tcvIWv1KnVn5nHbsrR8sPWv8jpGgiN177
         5c4fCoLlnro7gSyyjsYGGPliCjQ8FN7e2fgqoT2nd3G/miXoZ0yopl+t+uBCf1s1nyXC
         4QK0+oRCfVhyUzCAHmAVded7IT60GSHdI14r5kEkuk9iL9tk1uIpxnIRBodh4nZNfJJA
         Nq4dDRS8fRVad5L39Cy3QNRdtbduhM0CI0DRPgMkxfAPdG2Xv31EAAhfC3Nr1PiAWlWK
         NkcYUQbZw7r/dzBpnJa348ukHYkEmXvTuHieTDD5nux1v8+eaDtrKTkX7lTkCvbSziVs
         hGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661186; x=1761265986;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqN6FPJY384bIppIse52Rb5Kgtgq051USSGGCGlx7fA=;
        b=WOgReAN2NiWMl+jQc//XvaC1El2YqxKFFO+2Ep8yy1kX3hZyH1Lj+tVehHMTHPGjKi
         aE1HmL7pc5GG3t4Np4/2TtuLov+papa9bhxWVX+fV+krkNX+XZdsMbF09Y5putUBBQIm
         IWNsKjuCVin6+4vl2d3h0bF2ren4V8rRanw1FTraQzLSOJVuITglssRMiHR8jqM7NDCI
         341VeRXufyZA9ERgQKFBA72HZp45NVXBgxqfOCJxfGuG8e6ynT3MLuy62yKVun0iaviw
         KdTsccUqtdvqIU2vuR2Z+GpMqZYycHZEYqM1JiBFjjBJ1DeCWiuLta2gbqUaI1Dh3n/B
         W0jw==
X-Forwarded-Encrypted: i=1; AJvYcCUjp+HoSZ0rpzutmKcAgEROmcRKc29bTDNg+k+8DdJVBDI+fcUIImaiGq5E0wJbTIn08Jv26kRWikldqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV1LrgtY5d74Xyit1xBArvngEIAZ+G+AcBJ3fVSRzbiRo/t/uD
	5JYMPdW/FTmFfN4TcH2Is5o0HoW6Vjlky6ff56ksIpFz/37nO81e4k2QNGJvDqsswBj1B/B3V5T
	MQ/QyDg==
X-Google-Smtp-Source: AGHT+IECAB7Q2xyCVxo4b5IYRWMRhmsnO9Lb3GIfoRWMBXN6TTKJmV4zclbiOdup5YJYV9LbxCAcEbMCp+c=
X-Received: from pjzg1.prod.google.com ([2002:a17:90a:e581:b0:33b:51fe:1a78])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d2d0:b0:254:70cb:5b36
 with SMTP id d9443c01a7336-290c9cf37b2mr17571675ad.8.1760661186063; Thu, 16
 Oct 2025 17:33:06 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:28 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-11-seanjc@google.com>
Subject: [PATCH v3 10/25] KVM: x86/mmu: Drop the return code from kvm_x86_ops.remove_external_spte()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_173308_049518_DC3C08E9 
X-CRM114-Status: GOOD (  12.59  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Drop the return code from kvm_x86_ops.remove_external_spte(), a.k.a.
tdx_sept_remove_private_spte(), as KVM simply does a KVM_BUG_ON() failure,
and that KVM_BUG_ON() is redundant since all error paths in TDX also do a
KVM_BUG_ON().

Opportunistically pass the spte instead of the pfn, as the API is clearly
about removing an spte.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h |  4 ++--
 arch/x86/kvm/mmu/tdp_mmu.c      |  8 ++------
 arch/x86/kvm/vmx/tdx.c          | 17 ++++++++---------
 3 files changed, 12 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 48598d017d6f..7e92aebd07e8 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1855,8 +1855,8 @@ struct kvm_x86_ops {
 				 void *external_spt);
 
 	/* Update external page table from spte getting removed, and flush TLB. */
-	int (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
-				    kvm_pfn_t pfn_for_gfn);
+	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
+				     u64 spte);
 
 	bool (*has_wbinvd_exit)(void);
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 9b4006c2120e..c09c25f3f93b 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -362,9 +362,6 @@ static void tdp_mmu_unlink_sp(struct kvm *kvm, struct kvm_mmu_page *sp)
 static void remove_external_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 				 int level)
 {
-	kvm_pfn_t old_pfn = spte_to_pfn(old_spte);
-	int ret;
-
 	/*
 	 * External (TDX) SPTEs are limited to PG_LEVEL_4K, and external
 	 * PTs are removed in a special order, involving free_external_spt().
@@ -377,9 +374,8 @@ static void remove_external_spte(struct kvm *kvm, gfn_t gfn, u64 old_spte,
 
 	/* Zapping leaf spte is allowed only when write lock is held. */
 	lockdep_assert_held_write(&kvm->mmu_lock);
-	/* Because write lock is held, operation should success. */
-	ret = kvm_x86_call(remove_external_spte)(kvm, gfn, level, old_pfn);
-	KVM_BUG_ON(ret, kvm);
+
+	kvm_x86_call(remove_external_spte)(kvm, gfn, level, old_spte);
 }
 
 /**
diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index abea9b3d08cf..f5cbcbf4e663 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1806,12 +1806,12 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 	return tdx_reclaim_page(virt_to_page(private_spt));
 }
 
-static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
-					enum pg_level level, kvm_pfn_t pfn)
+static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
+					 enum pg_level level, u64 spte)
 {
+	struct page *page = pfn_to_page(spte_to_pfn(spte));
 	int tdx_level = pg_level_to_tdx_sept_level(level);
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	struct page *page = pfn_to_page(pfn);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
 	int ret;
@@ -1822,15 +1822,15 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * there can't be anything populated in the private EPT.
 	 */
 	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
-		return -EIO;
+		return;
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EIO;
+		return;
 
 	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
 	if (ret <= 0)
-		return ret;
+		return;
 
 	/*
 	 * TDX requires TLB tracking before dropping private page.  Do
@@ -1859,17 +1859,16 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	if (KVM_BUG_ON(err, kvm)) {
 		pr_tdx_error_2(TDH_MEM_PAGE_REMOVE, err, entry, level_state);
-		return -EIO;
+		return;
 	}
 
 	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, page);
 	if (KVM_BUG_ON(err, kvm)) {
 		pr_tdx_error(TDH_PHYMEM_PAGE_WBINVD, err);
-		return -EIO;
+		return;
 	}
 
 	tdx_quirk_reset_page(page);
-	return 0;
 }
 
 void tdx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
-- 
2.51.0.858.gf9c4a03a3a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
