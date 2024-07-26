Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA01C3DA4A
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjY2NTLJTAi3RBxb37qCi5+YB7+3WkeEDzVbb7sjakE=; b=kEEKGuOsh9gale
	HkPjvM1EY57Nuf97Qvmr/gL/inz2VCcRj8+SdBQfeSTM8iBBKf/nGqAaBjxLLK08h8njNGfWonq6i
	6WIpZ7DDQZJEoSOh+8DObSjHiqMp8eOZ1plI6z0nSVuLyuNq/nVjJ54Gj9CSeqz6mEHnXYWuDAIGL
	/iD2IptFCHMY5r5AOTFcRhyNLdWT9yZK1BRVuivqMZVhfouckXfEKImW00ZXOTzDF4hph/ixYr8oC
	e/hpjmxspmzESvNd4yssEQMuBeu5xUQTPnZ6nTp1lZG9FRM+GhmgnWKW1MzN8je89yUvNnCXk7PA4
	0o0CsqoUQZVDGrAxA8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUww-00000005X4A-0BFC;
	Sat, 27 Jul 2024 00:06:14 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUkq-00000005Pzn-206z
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:48 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e035f7b5976so758111276.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038022; x=1722642822; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=XPLhffmLB4ZFWgxHZuTKpVpsLNVQ+RH00jdWHKAirBA=;
        b=oLzS03F1aLggBVp3loR2zFGp1J1AeN4JV+4XlD3sk4s/g+U85d4i1D40+B/h2VZFmt
         YJpnR9HexVXb5KBFZEgwfSLKWwGc17qQG+NabFuwebSA07Ga8sqXBcRIhJbxJaGUKCFH
         HQscrJdqsS+/dSyUm67gb2AdztJDqmhjkmQIgroIuX2pSRyPPoAqiUkuDD2+rH5qIXGe
         q1MAAyTPInWs5QYVfCG1yl1AqM94rBQwPRFhuoPF/nZxT5MYF2CnoR3xbMgnVIKcQg32
         D3A8gq/7SK9RkvqhVaOjMQH8Ov0yEn8kSXMxlcNU9OCzfO780EKhbUTaD8+tQtq6bcG1
         rMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038022; x=1722642822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XPLhffmLB4ZFWgxHZuTKpVpsLNVQ+RH00jdWHKAirBA=;
        b=PEEvyd1GQJ6qNtkDVqpTBw89//Kvq3CJDUFzRmihJbNQEWeJJJFZcThOsKZAmKJawS
         OW5ACaET+Pkf1kcSTKRpWriBqRaJnro6G30rAK52/oLyQb2wCXp06U71cwziAzO5Aw8k
         CYhpDTUhetYXttg9CGlw+21Fr9jIaAZ1LOuzJxomZsi/CeOJej9V3QfQq9yG49eYc01M
         /Zic7+BtD8YbhKD5TM1jnuUKChsG/b6oGWRmdm+8GXyzHDAvToTsRI/YJC+ESdglTXbB
         O+96h8vvrmGG+qaUtJzsgV+0V1B3hZAm2is4yOJRCurE1QAkvbImJBq+2C4zWwOc97ei
         7isw==
X-Forwarded-Encrypted: i=1; AJvYcCWCSXlCZIb2tbE2omsQBbyuTh28xaXpZrNA1tfbFH91Ux4LiDA992jNGr1TIv6fgONEet9rbWNUhDYHpeS1ldAGdEl1N/MN9KuKYjpJYMSE
X-Gm-Message-State: AOJu0YwHbJ8mdMMlcKtQAGAyKvyTI7nvSlz3kqimrO9Wjble24YGS9J8
	7T5oOUShnSBQzX9GrwJSRI4ASCuo2c7fYf7qUvEaXK4LJKTLUQRSyq3sEexcfJnQyRMiyNEzCT3
	fSg==
X-Google-Smtp-Source: AGHT+IGBhzeuzUiyouvcvFTiXgb/HBxmg2MAS0wOhJT2px7pnvcCfHG92BiTIsAz4jQy3aPwc+Eekl1Ce9c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:6844:0:b0:e0b:3432:73d4 with SMTP id
 3f1490d57ef6-e0b5560e6b3mr22860276.1.1722038021685; Fri, 26 Jul 2024 16:53:41
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:40 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-32-seanjc@google.com>
Subject: [PATCH v12 31/84] KVM: Pass in write/dirty to kvm_vcpu_map(), not kvm_vcpu_unmap()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_165345_026589_C3F7A4E0 
X-CRM114-Status: GOOD (  16.58  )
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

Now that all kvm_vcpu_{,un}map() users pass "true" for @dirty, have them
pass "true" as a @writable param to kvm_vcpu_map(), and thus create a
read-only mapping when possible.

Note, creating read-only mappings can be theoretically slower, as they
don't play nice with fast GUP due to the need to break CoW before mapping
the underlying PFN.  But practically speaking, creating a mapping isn't
a super hot path, and getting a writable mapping for reading is weird and
confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/nested.c |  4 ++--
 arch/x86/kvm/svm/sev.c    |  2 +-
 arch/x86/kvm/svm/svm.c    |  8 ++++----
 arch/x86/kvm/vmx/nested.c | 16 ++++++++--------
 include/linux/kvm_host.h  | 20 ++++++++++++++++++--
 virt/kvm/kvm_main.c       | 12 +++++++-----
 6 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 6f704c1037e5..23b3a228cd0a 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -922,7 +922,7 @@ int nested_svm_vmrun(struct kvm_vcpu *vcpu)
 	nested_svm_vmexit(svm);
 
 out:
-	kvm_vcpu_unmap(vcpu, &map, true);
+	kvm_vcpu_unmap(vcpu, &map);
 
 	return ret;
 }
@@ -1126,7 +1126,7 @@ int nested_svm_vmexit(struct vcpu_svm *svm)
 				       vmcb12->control.exit_int_info_err,
 				       KVM_ISA_SVM);
 
-	kvm_vcpu_unmap(vcpu, &map, true);
+	kvm_vcpu_unmap(vcpu, &map);
 
 	nested_svm_transition_tlb_flush(vcpu);
 
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a16c873b3232..62f63fd714df 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -3466,7 +3466,7 @@ void sev_es_unmap_ghcb(struct vcpu_svm *svm)
 
 	sev_es_sync_to_ghcb(svm);
 
-	kvm_vcpu_unmap(&svm->vcpu, &svm->sev_es.ghcb_map, true);
+	kvm_vcpu_unmap(&svm->vcpu, &svm->sev_es.ghcb_map);
 	svm->sev_es.ghcb = NULL;
 }
 
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index c115d26844f7..742a2cec04ce 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -2299,7 +2299,7 @@ static int vmload_vmsave_interception(struct kvm_vcpu *vcpu, bool vmload)
 		svm_copy_vmloadsave_state(vmcb12, svm->vmcb);
 	}
 
-	kvm_vcpu_unmap(vcpu, &map, true);
+	kvm_vcpu_unmap(vcpu, &map);
 
 	return ret;
 }
@@ -4690,7 +4690,7 @@ static int svm_enter_smm(struct kvm_vcpu *vcpu, union kvm_smram *smram)
 	svm_copy_vmrun_state(map_save.hva + 0x400,
 			     &svm->vmcb01.ptr->save);
 
-	kvm_vcpu_unmap(vcpu, &map_save, true);
+	kvm_vcpu_unmap(vcpu, &map_save);
 	return 0;
 }
 
@@ -4750,9 +4750,9 @@ static int svm_leave_smm(struct kvm_vcpu *vcpu, const union kvm_smram *smram)
 	svm->nested.nested_run_pending = 1;
 
 unmap_save:
-	kvm_vcpu_unmap(vcpu, &map_save, true);
+	kvm_vcpu_unmap(vcpu, &map_save);
 unmap_map:
-	kvm_vcpu_unmap(vcpu, &map, true);
+	kvm_vcpu_unmap(vcpu, &map);
 	return ret;
 }
 
diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 3096f6f5ecdb..f7dde74ff565 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -231,7 +231,7 @@ static inline void nested_release_evmcs(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_hv *hv_vcpu = to_hv_vcpu(vcpu);
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
-	kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map, true);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.hv_evmcs_map);
 	vmx->nested.hv_evmcs = NULL;
 	vmx->nested.hv_evmcs_vmptr = EVMPTR_INVALID;
 
@@ -318,9 +318,9 @@ static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_vmx *vmx = to_vmx(vcpu);
 
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map);
 	vmx->nested.pi_desc = NULL;
 }
 
@@ -624,7 +624,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	int msr;
 	unsigned long *msr_bitmap_l1;
 	unsigned long *msr_bitmap_l0 = vmx->nested.vmcs02.msr_bitmap;
-	struct kvm_host_map msr_bitmap_map;
+	struct kvm_host_map map;
 
 	/* Nothing to do if the MSR bitmap is not in use.  */
 	if (!cpu_has_vmx_msr_bitmap() ||
@@ -647,10 +647,10 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 			return true;
 	}
 
-	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), &msr_bitmap_map))
+	if (kvm_vcpu_map_readonly(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), &map))
 		return false;
 
-	msr_bitmap_l1 = (unsigned long *)msr_bitmap_map.hva;
+	msr_bitmap_l1 = (unsigned long *)map.hva;
 
 	/*
 	 * To keep the control flow simple, pay eight 8-byte writes (sixteen
@@ -714,7 +714,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
 
-	kvm_vcpu_unmap(vcpu, &msr_bitmap_map, false);
+	kvm_vcpu_unmap(vcpu, &map);
 
 	vmx->nested.force_msr_bitmap_recalc = false;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3d4094ece479..82ca0971c156 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -285,6 +285,7 @@ struct kvm_host_map {
 	void *hva;
 	kvm_pfn_t pfn;
 	kvm_pfn_t gfn;
+	bool writable;
 };
 
 /*
@@ -1297,8 +1298,23 @@ void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
 struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
-int kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *map);
-void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty);
+
+int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *map,
+		   bool writable);
+void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map);
+
+static inline int kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa,
+			       struct kvm_host_map *map)
+{
+	return __kvm_vcpu_map(vcpu, gpa, map, true);
+}
+
+static inline int kvm_vcpu_map_readonly(struct kvm_vcpu *vcpu, gpa_t gpa,
+					struct kvm_host_map *map)
+{
+	return __kvm_vcpu_map(vcpu, gpa, map, false);
+}
+
 unsigned long kvm_vcpu_gfn_to_hva(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *writable);
 int kvm_vcpu_read_guest_page(struct kvm_vcpu *vcpu, gfn_t gfn, void *data, int offset,
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 4a9b99c11355..a46c7bf1f902 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3136,7 +3136,8 @@ struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(gfn_to_page);
 
-int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
+int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
+		   bool writable)
 {
 	struct kvm_follow_pfn kfp = {
 		.slot = gfn_to_memslot(vcpu->kvm, gfn),
@@ -3150,6 +3151,7 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 	map->page = NULL;
 	map->hva = NULL;
 	map->gfn = gfn;
+	map->writable = writable;
 
 	map->pfn = kvm_follow_pfn(&kfp);
 	if (is_error_noslot_pfn(map->pfn))
@@ -3166,9 +3168,9 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 
 	return map->hva ? 0 : -EFAULT;
 }
-EXPORT_SYMBOL_GPL(kvm_vcpu_map);
+EXPORT_SYMBOL_GPL(__kvm_vcpu_map);
 
-void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
+void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map)
 {
 	if (!map->hva)
 		return;
@@ -3180,11 +3182,11 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 		memunmap(map->hva);
 #endif
 
-	if (dirty)
+	if (map->writable)
 		kvm_vcpu_mark_page_dirty(vcpu, map->gfn);
 
 	if (map->pinned_page) {
-		if (dirty)
+		if (map->writable)
 			kvm_set_page_dirty(map->pinned_page);
 		kvm_set_page_accessed(map->pinned_page);
 		unpin_user_page(map->pinned_page);
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
