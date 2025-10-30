Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F061CCF9F0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6Z3MUG+P0WIFPsCq+rLql6wF9RbtHEgyEHwjDglA4M=; b=d83LCHnJMH8qSk
	P88TyJgNloKvKhZK/GDyGGyjkc3rRM10lBk8S8d4fbxhCFfrvC542DoJS6V0hdi43ppz94Ieab/NO
	MMusXciI/bkInyrZX/o6GM217e8RYWNwuLQBLhwtS3pRaph0RBnpcvqda8UuwTp4Q/mKXift0Rx4z
	rLEGJQzn+0QsXT4W+ZvWH98A2e0sevNtQuWwOvM12LL7Li0VNdLGpPSQgIQg1K6gRYrWoq4S9pTHW
	BO3TeZx+/xCcnseKFctDg47SoVfMcMnpjnL7N6zYbR61VAVk3+768al4Ua2swxuiNPvdLKt80+CdS
	afgYh3LN/YQU0Ja5/wXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzV-00000004krS-3tbl;
	Thu, 30 Oct 2025 20:11:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyg-00000004jpL-2uvl
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8nIvTvBCdsBevoBG1DvySQLnzbDN6yPR9QB+VA8aXbA=; b=GiCmNiUARF9zDp4GUAvjZ0h+ba
	1HZF8CYrIzYNuMCOmnf7Omzh/MqNeiEG+n/rtJCFuLXR7LrHRK8UHNL91bosBnkFSGSPp/fIJ/UQ8
	mTYQrtHYCsT8K0xBSUcUtAfdq5/D4snVbD7unDy2F3TdBFOuW18OSIy9sTOObxHLTwtkkUZJg1bL4
	PYpdg1AWJdjQmsMHsKISGtJ3WxGUZ4gjh+dMuj0Y2Bh4reHPhlZbb157dT7It8xewEOdRk8cDvIeo
	aRop+U/Fva5IxrjBC2lM07ZaPtcQDVppiJx/F1xjwvTfoV66QqU//vplOBB6n/6dcf8B4cEIjsw88
	Uscq68jw==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY6r-00000009tgu-1aMo
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:01 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-34082c48b2bso423027a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855026; x=1762459826; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8nIvTvBCdsBevoBG1DvySQLnzbDN6yPR9QB+VA8aXbA=;
        b=diGIx4kSXVuZbL3uq72wT0N8oeQgDda9/xYNUojTw6PLXyJ9ySvdsiyb2MyuLtazKl
         WtEJy4PXc/RqjlT1m9QyCfaCV4QKQNEPw3AFjSSLXjHRkEBBRV46AOArQMWvfqGFV8Jl
         yWDYkMmW5o7vTSoEa8eUOciJQW1flOm7j5jhjaAs0W5mOteIU+6cFHcNT/JqPOrTkEKI
         t7Ksu2al3dHbO5c3dyESyPLLwy1vMRpvIhy0qDqNDxKPqGQBfshQtlyqHUJqvI074eEQ
         SolAxcLbrZEJ9QNvWSxz7ZSotAI907Mlt7Z77bCnR3qHvFDH2qSMKTknwdfXc5rHGUgN
         VD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855026; x=1762459826;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nIvTvBCdsBevoBG1DvySQLnzbDN6yPR9QB+VA8aXbA=;
        b=DHN0Zc3Z3qBHE+Z8stLhcBLM0y2EldHACVlS/clfxZY85MwycxVA7sv8F6Tcu4HHpT
         zup2awGg9h5qW2nHqp8MQeDIEum0RXZ+ShygqADS9CODf2G8Enkvs/NFOmoUmzqoZtLv
         xTzzDkYNLxBisaj89H/z3ajJCtk+zHCFY6CEg/tmlLUkmiZfbBix92DRZJEUjWFHM0tL
         z7CRngUnoj2vEhAZmvh5NQBVuZdNyK1FEYdgPoXZJkvkqxSp62EcyN8p0eqa/PxsvH5l
         zDbq/O5tKZIZrDWoYfNtq/sHgyNCN8iB1GFRKjhlX52LgIB9jlku+R5rfOOIzv9GAd8J
         sjaw==
X-Forwarded-Encrypted: i=1; AJvYcCVmoj26gtpGIsceIcuExHOtRT+jARMA0SvSvqHLzSNhNE/a73Q7x5hPSPae708dBQKh2yyJ150W0jEbZg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7aWDiuyLILeHlTN11S/7CU08HOX8hUqt3WDKifbswxgiHDmIA
	S0OPN2fV/SkUHBOyBgzwPvElgB0zxfCgAz91+hmM2ifM2YZHJariL1GeB6vSakZtCzaAqBFxPvA
	2JUA43A==
X-Google-Smtp-Source: AGHT+IEhw8LtT9p+iuh4rLr+K1Dp7djyQDWKY2Obpi49t8AGu0qQZAphBfIqivSEmnTrnJBooynMyMjyxqM=
X-Received: from pjbcf6.prod.google.com ([2002:a17:90a:ebc6:b0:33f:e888:4aad])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c8b:b0:32e:3552:8c79
 with SMTP id 98e67ed59e1d1-34083088fb8mr1238454a91.29.1761855025815; Thu, 30
 Oct 2025 13:10:25 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:34 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-12-seanjc@google.com>
Subject: [PATCH v4 11/28] KVM: x86/mmu: Drop the return code from kvm_x86_ops.remove_external_spte()
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_191457_474016_BC88D707 
X-CRM114-Status: GOOD (  12.51  )
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
index 48598d017d6f..b5867f8fe6ce 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1855,8 +1855,8 @@ struct kvm_x86_ops {
 				 void *external_spt);
 
 	/* Update external page table from spte getting removed, and flush TLB. */
-	int (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
-				    kvm_pfn_t pfn_for_gfn);
+	void (*remove_external_spte)(struct kvm *kvm, gfn_t gfn, enum pg_level level,
+				     u64 mirror_spte);
 
 	bool (*has_wbinvd_exit)(void);
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index e735d2f8367b..e1a96e9ea1bb 100644
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
index abea9b3d08cf..7ab67ad83677 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1806,12 +1806,12 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 	return tdx_reclaim_page(virt_to_page(private_spt));
 }
 
-static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
-					enum pg_level level, kvm_pfn_t pfn)
+static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
+					 enum pg_level level, u64 mirror_spte)
 {
+	struct page *page = pfn_to_page(spte_to_pfn(mirror_spte));
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
2.51.1.930.gacf6e81ea2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
