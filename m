Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05444CCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SZM5lMEKhz4Bn3kniSEvEXncKpZhN+foZs4htCqi/lE=; b=nieyv+fNlKcpM8
	DV414y1KR7x6Zti5VVqUCmvWiOvnRpyH1zLxAEaEemFk7E+RA4ShVzyupbBZI6oj9sCiqjnz6nDCX
	SNrqIWx2PAC6cWwstC+3+6uZ37aDsEjdlJNCiCm1NV0Cppw7NYUrIHSj30rqIgepVmx5ibuRqOcuM
	v45HSsfE5YcGm+JuzDEqaB0LhK2TBlNmyPn24H/uGA5OIbmcfc090+jNTI5TIFLf+Pyz8MFx3JsU+
	2GpbaHfZCYBhQRyqivSNiBKdEtESpCsUhYg33SmHvM3N68+h4qpJAK1w7Ipbx+Avh5fuuV46H2g2A
	yW2rmQSsVkQdD+Gb8l5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzC-00000004kU5-16uV;
	Thu, 30 Oct 2025 20:11:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYye-00000004jmr-16Kr
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IvM7TjIntZ9FlQ6yPFIX7Pdb82bcYcGNbKTNQ5X1yLU=; b=HvMyZ7FmF0cDvvzdju1eVQagqR
	McNz94P9GVBsThTK7g9F6ZPQz+nIKDUL1fvjZtgo0SrdmHGXpMyC5pUv5rGXdcHXgNLdOm7dSh/Id
	6Mv32VrYzS4GX51X1TZp1/01qb5gWx/LXSsHiC1g8cUecIN5q3+xO1CcH2HjyphZCSD5C8kqsQtrx
	0OO4R3Gh/eKfNTN5aQrVyUjjNwN49GqR9rpTHhVhW69F3VycEwpnA5RT4Zy8p/DAp8gAghp+wjDKA
	gkLzPQgyR83p/4uB82rvLWOx5VCs776Ltpb3JxttiBXJPJULcxR+rvbu6s7MoYVjEidOyVe9yfRK4
	D70txHNg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY6p-00000009tf4-1drd
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 19:14:58 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-33dadf7c5beso1398495a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855024; x=1762459824; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IvM7TjIntZ9FlQ6yPFIX7Pdb82bcYcGNbKTNQ5X1yLU=;
        b=RdSiSKIyH6Tgg2mEzMJ/kdJYVuXt0Nmq5Eei9V8Uw8R0b33vkVBhVPDFy7Rs5/VmPA
         TtvSSHTo0tZKw4OZIyC56xvDS2pmbjyYI8eoB5zEMEq9T4mN6TXXSnjJwbw7RzGleXUz
         lW6JXU9Rnoa2pCPUxbcxijyeAKkzJ6C0V9mVgPk7nKH0J6K6T7vIXb2vc8JYB/cB1Odw
         uFBbUFJj5xPnVduLpc12xfc06PP+2+ztRlkgWEZDkZUMINtvtH2TGVR/JNprTUbHwTLb
         jA4onYpKhBvcch+uNYeCRnIfWrf1dtvXXoi7GXIf5KGlkO0wlDXCEOycyKzw/IVaq0F5
         +q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855024; x=1762459824;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvM7TjIntZ9FlQ6yPFIX7Pdb82bcYcGNbKTNQ5X1yLU=;
        b=wcIa/bAMvX9XTIKN7GmWZSnJK52tv2LRIbxzPP43mSo0loO3BI2xhhcg8diyyn3UVp
         EXD5GbVYKllr3gr+DvHYVBf3uUM+VpGV9tMKKh7Hpq1IXHIXwoq4INUOphHDT9fVcMcR
         FwlvIsVf1I86Q2MSbkDvf8EwrqEsYIfYOnOCGuGz7XVsIo1v+YE004/hyFvzmp4mHFH0
         Y6HPRyrx7iLJ+S5BU3OoWNErcntCw+5eb3axnIIF7xn4Wg5qW/hztmZWJVysEis/45q+
         tiB6wCn+iezgx3ZIVpanysYLfelUh+VfuIiGjydIcKlczTsF9G5piOA8/3q1SwijtpTc
         mWGA==
X-Forwarded-Encrypted: i=1; AJvYcCUE2KfowsF1BtpwNsjhvBCwnOmXc+XRPxTPG9/6H3kQkcuS38+ybDxwELG5Ha/cS7X0K7FhNKxbKs7Jgg==@lists.infradead.org
X-Gm-Message-State: AOJu0YygJv3qBSZ3vLRidXJ+2royeqmvMSUcVHb54k1Ip8cr2vlxH97p
	1Mg3R+NuxDcB8oSJxVDH/7Ar/ZRwYncwDdGUrNizkUrdZ3HFdLFhU+DOmPPVnNY7qlbSXIHjjUV
	4Rs0Keg==
X-Google-Smtp-Source: AGHT+IGgb27AO5v2WDGNnxGkmz0o+KOcj5EzJAo9YzbL1iR1u4hmGEpmIxfQoNCUxUiI3kNavEPI4qshnw4=
X-Received: from pjdr2.prod.google.com ([2002:a17:90a:2e82:b0:340:8a98:4706])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3947:b0:340:6fae:1a0c
 with SMTP id 98e67ed59e1d1-34083070e80mr1280206a91.21.1761855023579; Thu, 30
 Oct 2025 13:10:23 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:33 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-11-seanjc@google.com>
Subject: [PATCH v4 10/28] KVM: TDX: Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte()
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
X-CRM114-CacheID: sfid-20251030_191455_516118_0AA974B7 
X-CRM114-Status: GOOD (  13.24  )
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

Fold tdx_sept_drop_private_spte() into tdx_sept_remove_private_spte() as a
step towards having "remove" be the only and only function that deals with
removing/zapping/dropping a SPTE, e.g. to avoid having to differentiate
between "zap", "drop", and "remove".  Eliminating the "drop" helper also
gets rid of what is effectively dead code due to redundant checks, e.g. on
an HKID being assigned.

No functional change intended.

Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 90 +++++++++++++++++++-----------------------
 1 file changed, 40 insertions(+), 50 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c242d73b6a7b..abea9b3d08cf 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1648,55 +1648,6 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 	return tdx_mem_page_record_premap_cnt(kvm, gfn, level, pfn);
 }
 
-static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
-				      enum pg_level level, struct page *page)
-{
-	int tdx_level = pg_level_to_tdx_sept_level(level);
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	gpa_t gpa = gfn_to_gpa(gfn);
-	u64 err, entry, level_state;
-
-	/* TODO: handle large pages. */
-	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EIO;
-
-	if (KVM_BUG_ON(!is_hkid_assigned(kvm_tdx), kvm))
-		return -EIO;
-
-	/*
-	 * When zapping private page, write lock is held. So no race condition
-	 * with other vcpu sept operation.
-	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
-	 */
-	err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-				  &level_state);
-
-	if (unlikely(tdx_operand_busy(err))) {
-		/*
-		 * The second retry is expected to succeed after kicking off all
-		 * other vCPUs and prevent them from invoking TDH.VP.ENTER.
-		 */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-					  &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
-	if (KVM_BUG_ON(err, kvm)) {
-		pr_tdx_error_2(TDH_MEM_PAGE_REMOVE, err, entry, level_state);
-		return -EIO;
-	}
-
-	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, page);
-
-	if (KVM_BUG_ON(err, kvm)) {
-		pr_tdx_error(TDH_PHYMEM_PAGE_WBINVD, err);
-		return -EIO;
-	}
-	tdx_quirk_reset_page(page);
-	return 0;
-}
-
 static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 				     enum pg_level level, void *private_spt)
 {
@@ -1858,7 +1809,11 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 					enum pg_level level, kvm_pfn_t pfn)
 {
+	int tdx_level = pg_level_to_tdx_sept_level(level);
+	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	struct page *page = pfn_to_page(pfn);
+	gpa_t gpa = gfn_to_gpa(gfn);
+	u64 err, entry, level_state;
 	int ret;
 
 	/*
@@ -1869,6 +1824,10 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
 		return -EIO;
 
+	/* TODO: handle large pages. */
+	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
+		return -EIO;
+
 	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
 	if (ret <= 0)
 		return ret;
@@ -1879,7 +1838,38 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 */
 	tdx_track(kvm);
 
-	return tdx_sept_drop_private_spte(kvm, gfn, level, page);
+	/*
+	 * When zapping private page, write lock is held. So no race condition
+	 * with other vcpu sept operation.
+	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
+	 */
+	err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
+				  &level_state);
+
+	if (unlikely(tdx_operand_busy(err))) {
+		/*
+		 * The second retry is expected to succeed after kicking off all
+		 * other vCPUs and prevent them from invoking TDH.VP.ENTER.
+		 */
+		tdx_no_vcpus_enter_start(kvm);
+		err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
+					  &level_state);
+		tdx_no_vcpus_enter_stop(kvm);
+	}
+
+	if (KVM_BUG_ON(err, kvm)) {
+		pr_tdx_error_2(TDH_MEM_PAGE_REMOVE, err, entry, level_state);
+		return -EIO;
+	}
+
+	err = tdh_phymem_page_wbinvd_hkid((u16)kvm_tdx->hkid, page);
+	if (KVM_BUG_ON(err, kvm)) {
+		pr_tdx_error(TDH_PHYMEM_PAGE_WBINVD, err);
+		return -EIO;
+	}
+
+	tdx_quirk_reset_page(page);
+	return 0;
 }
 
 void tdx_deliver_interrupt(struct kvm_lapic *apic, int delivery_mode,
-- 
2.51.1.930.gacf6e81ea2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
