Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412E1CCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZvVaSB3POdL1fS19Cvaa7UzuP7ajgOrB76i3h2Ok180=; b=sOACEyPh74ZfO0
	tHRVUy0Vf26q8NFRcGiEE+6U0nSljnaWPaotjmgBYK8Wuu1o8KxsqYDVAssAHAmpJmPtarPTWLN3C
	UTcse5FEujfLlIAsBr6Pa9kvM7+Ft7AAg3+H0VCTkrGppuBdg7JHeut6fuu51581DQBkhZLSx48Cy
	AwG3Ei/Rlh/l1vkk0+vaGHdUCIru5jzjBx2hAPCSLADvnvZHSNuYC29srazCYv+MsMzrxNWJv2tcG
	iydJfDe36oGEsZxN8oVMfUX21sCzS2SB43atobAgAfnoqIIzTz5R/VXx6+H1JJpW05UIwrSp7Pykx
	BVlyAtXEGB/8l3xMBoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ0W-00000004m3k-3ubo;
	Thu, 30 Oct 2025 20:12:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYyv-00000004k8G-3ivK
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:10:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NXaPi3MoPrN4063cnb5uQMVDinJuo4gq6tPJoc7Otx0=; b=k61QvNlK9g1VLj6xHCjCVk95zY
	seKOuIe3i9/jiZ0NjOsWaJIjwITPJ+V7wtQiU5gu2Dlk0SW1vd8rHkusBL2bUn8uEFErTS+AkY2dl
	aS10JBvf1OQEbw/CMAj1XJt88XJ5T4ARUjdbwqRBuktFNeHkKg8mfqBwpH2+p6shpyG1STImlPl3W
	u8ebG/LU0mk3u8VEnUkyzNhf/ZeK4VOMM2xeE2vKwqFDr17gDcRB1/FFadcDUDscUqZxWxm/zuJRZ
	dYWwWzCXidYdmpI5Jn44e6gmcpPiREOIlMslCA0zNzDEfc24FggJc7P0KMAvZNuZqgqUkNVJoaAua
	JwlrZp6w==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY79-00000009tpo-3VmD
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:17 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b6ceeea4addso1508962a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855043; x=1762459843; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=NXaPi3MoPrN4063cnb5uQMVDinJuo4gq6tPJoc7Otx0=;
        b=eHeU/aJgJDH4gbnTOZueLLfjiBIaF63jsXfsU0vqIq+0NYaRy4S+0TwChqxAcsdvGf
         g21CmI1Ofk44irTeuoZs7jRNsB4BqsZCifrQiEKnaaE1Okce4CclJzjSZTlL1BERvc/q
         5pUY+fl+qzsqgT0nHZDzfiL4qKJfEpirtqnSs3K/cuTfJBTZvMAlf4OxKhfmWBF/DGRH
         I5rk1ifVt9QyRC80TJTCGJ6M69IEOEbWJtBiaUdQpycNUtxp6MDjICrkHUEiM/WzgRoL
         iMOiMIJJ1i8dDFsAxDEqHDhjFygy396fMKJtxeS5c6ZpgmlbDxv02Tt1ij4oY3KZm38i
         B4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855043; x=1762459843;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXaPi3MoPrN4063cnb5uQMVDinJuo4gq6tPJoc7Otx0=;
        b=ToUQxgipyG3rvqsVqGTFX28heC+0fzaKtEbV6tvBf9VhrhuuUVIlV5/PUJZb7XzQ9f
         Bavr4dMDMtngkw/vJDDppOp5afW6QtvjcAgrL64xc6pvjOCEA6fhw+iyH0OvzLu9V8vh
         aBXdcD21kALrP1Q2Us/MXREwQcrHA+NoiprbsC4ONCXm0qsJC6DwIJDTwiJwSsbTDCM9
         SVWB50NMyPNy6ZcuW/K4nNU3CqPYC/uYp6Q71Kz6thj2KhM4ft5hJcDhgAEmdxrekmkf
         vh3glWMh88W1FAf3Fmrj8jyc+Hflyhk8CdcuOt0lv121CregRA2VzvJXSlkna2XmIPIb
         +/Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVU9GaRUm4IpBdhb9bwTBfx1++oj42N3RFVSMIOBN/yjMmICRuzXAVRapncYSCKtQLHAwKu+NlwwYNSTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzH8cfBPwrrmOWfnZp0kw0zXE2CDAbh+Pcs3viyFXwOLbc4IhSQ
	3AJYIvdwESk8y4FJIdvpUOeNglvUvjQCKPvn04b7NhkIi6UC0G7Mj6H3wbkC1ONs5M2QlxrsGT6
	vpfVTHQ==
X-Google-Smtp-Source: AGHT+IEb/219Cf+wyRyoeh6pXELuzrJXroky0oVjoU6kkNSExiZe/MRoYQlDKXB9iGMeGWIkzSQ16EMgROI=
X-Received: from plrs24.prod.google.com ([2002:a17:902:b198:b0:269:b6ad:8899])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e5cf:b0:293:b97:c30b
 with SMTP id d9443c01a7336-2951a3a6519mr12248475ad.9.1761855043356; Thu, 30
 Oct 2025 13:10:43 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:40 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-18-seanjc@google.com>
Subject: [PATCH v4 17/28] KVM: TDX: Fold tdx_sept_zap_private_spte() into tdx_sept_remove_private_spte()
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
X-CRM114-CacheID: sfid-20251030_191515_894069_439B1C7F 
X-CRM114-Status: GOOD (  11.54  )
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

Do TDH_MEM_RANGE_BLOCK directly in tdx_sept_remove_private_spte() instead
of using a one-off helper now that the nr_premapped tracking is gone.

Opportunistically drop the WARN on hugepages, which was dead code (see the
KVM_BUG_ON() in tdx_sept_remove_private_spte()).

No functional change intended.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 41 +++++++++++------------------------------
 1 file changed, 11 insertions(+), 30 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index cfdf8d262756..260b569309cf 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1683,33 +1683,6 @@ static int tdx_sept_link_private_spt(struct kvm *kvm, gfn_t gfn,
 	return 0;
 }
 
-static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
-				     enum pg_level level, struct page *page)
-{
-	int tdx_level = pg_level_to_tdx_sept_level(level);
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-	gpa_t gpa = gfn_to_gpa(gfn) & KVM_HPAGE_MASK(level);
-	u64 err, entry, level_state;
-
-	/* For now large page isn't supported yet. */
-	WARN_ON_ONCE(level != PG_LEVEL_4K);
-
-	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
-	if (KVM_BUG_ON(err, kvm)) {
-		pr_tdx_error_2(TDH_MEM_RANGE_BLOCK, err, entry, level_state);
-		return -EIO;
-	}
-	return 1;
-}
-
 /*
  * Ensure shared and private EPTs to be flushed on all vCPUs.
  * tdh_mem_track() is the only caller that increases TD epoch. An increase in
@@ -1790,7 +1763,6 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 	gpa_t gpa = gfn_to_gpa(gfn);
 	u64 err, entry, level_state;
-	int ret;
 
 	/*
 	 * HKID is released after all private pages have been removed, and set
@@ -1804,9 +1776,18 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return;
 
-	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
-	if (ret <= 0)
+	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
+	if (unlikely(tdx_operand_busy(err))) {
+		/* After no vCPUs enter, the second retry is expected to succeed */
+		tdx_no_vcpus_enter_start(kvm);
+		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
+		tdx_no_vcpus_enter_stop(kvm);
+	}
+
+	if (KVM_BUG_ON(err, kvm)) {
+		pr_tdx_error_2(TDH_MEM_RANGE_BLOCK, err, entry, level_state);
 		return;
+	}
 
 	/*
 	 * TDX requires TLB tracking before dropping private page.  Do
-- 
2.51.1.930.gacf6e81ea2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
