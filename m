Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7E6C3DA49
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2024 00:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hFMCHOaES5l+IKYV1HMmEbwWJqLfe5ynJD68BnhlFt8=; b=n+DQggfyMk9uQF
	/q1sGR9gU38mSPOqKPLKBonc2LvX0Qn2MFFj9Eeu6xo5fwKpF9cEzPJwWXdyvA4QCIoQ5ikS4G5Wl
	0+GQhOJPUp4agP97vqLWcxA+BdIg4u2Dv0aPmbSKVSGzc14QesS2NI4HoPbSN6ri/qmGqUfnta5LC
	rZuLja3RvSoapl8im0SZXKI10arBfaK7hvbqLP6e/OV+cnjThTC+DkOZEl7Z7tkDzcXLwMSgWwybD
	ONeKKldyDT1ORF4shGVcuXVMsCgw7benP4eeu6vSH74lpIA2ghVzkq6q5ZxmsiOKSOBjFje0HoR9T
	mTRHC1pBsAms4T/vi5UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXVML-00000005jub-13A9;
	Sat, 27 Jul 2024 00:32:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUma-00000005RX2-2TTB
	for linux-riscv@bombadil.infradead.org;
	Fri, 26 Jul 2024 23:55:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4pm2gWEOx5QJNc32HyFmIStymfHzlyUTPI/gy9LPzsU=; b=FvCqdptg6h4+SNkpZi7Ta7htfD
	d0F81n2s+WOHgKRpOp/QoX/445YCSExoX2u5OcJtSQIw5CScUApISfWHBJ6BI8Z6BJA/rKY1HQoFI
	qHqXDCRhZATsBVPY+OPNQKzVpGAQJHIp8JxwDGfaXC5/PcaLTfIaHslMMyzhr111JcV8cLxMvdP+w
	qEB1rlmKIxjA3IOYwniV0Tlnakdgquyr8SVOcnPF16gtDo2vO2E0jWDsypNigkZKiCKGDCeTV4FL5
	K7hFk5jLh/fgIniw2VJaMXfPt9rSqmDbjpeldw6U5ge6F4Y9ASmRESVQ9fbcvOoQwePeAlV17kGqx
	8W9n/B/g==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUmW-00000004K5H-4A4f
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:55:30 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0879957a99so418193276.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038126; x=1722642926; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4pm2gWEOx5QJNc32HyFmIStymfHzlyUTPI/gy9LPzsU=;
        b=Kb97cyn3ZSPd1Kme2ztN+oJnnKW9PTfV51qVVmubcKxsXEVk/aCxJGVCCeijYAJci1
         GIf4j1sGIh4t/D2ZK2r+amSALvGUoy5GiVgJJLFcOI3ZLDwBRfwBuJosYx82UUN8XHLb
         ETwHs8ZNmHHn1r9imNoku+g9muOrSjqGrPrqI39ZnXFAXq5qarJczhwrz4IZJZX7dMaM
         xXz4AzVdj1/pMm/WbTvIQerFErRbwOqzetGvjzygmFhGd/0ezXI8HEI0k9YiiLjCgady
         LedNf0PdwU2KhxFyyA3dSirN1+OhY4DE82IJ1AQ3s5QwqptP7pnoVKUaOE+NSmydRASO
         E9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038126; x=1722642926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4pm2gWEOx5QJNc32HyFmIStymfHzlyUTPI/gy9LPzsU=;
        b=K7scXPZ7AY7KVhgm1Iq+ofTFuXl1hw1/6iTaiOvuj6hOF/lfgqiOFAx+hy8Zdp1lAZ
         oltNOwjI9vKLkUOd1JO8WnDHnz7IU2OI30FxBntyvPN1AMopWXHhqkqMv6oc66LLrY4A
         x1HCx95cF9H1HDB6r9GiO6c8W1rNBOxgE7GdYOSaJ02o6MnZtGeRVSf0b0Y2QJa7iV79
         lJakkdcpUfw9PR6KTpBuk8Cd2qNsy4CYVA4gshmEgf28oKwDfUYjuvJNCd3LTPp20UvI
         yC33E6F6sMq3JlH+PtGDlkqkvAmmUyoL4E/cMlQpzZtNjJgJxZdzSl+seyo1lJd+gRiM
         AEYA==
X-Forwarded-Encrypted: i=1; AJvYcCXhKSDbejxQCQc6t0jmghgyC95HI1OHkPFbHJ3WdejjLwf3WM7EQreFTBDPgZLXPXfOVBrRZowKgEjf7QgXcac5gwNuI11NFrz6DNPFqXQN
X-Gm-Message-State: AOJu0YxH4YuMjziHjpCbeYBWQLwuBiE591PzUGc/aRPn1NsAu5HIe/Gd
	8flY1Tn8HVHFltiw0YJ7PhG8rNaecinqJVemrIOFZpqnxtXe5kpmi47h7it4x1Rjw6KGOTcb3Rh
	RLA==
X-Google-Smtp-Source: AGHT+IGgyahrOCg0Ix+MrKo8QCm20LiC8Zd9dP6asKSX3o/8So/b0NT46HfwZKTclpC/RfFjW09NkNDMj3A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1029:b0:e0b:9b5:8647 with SMTP id
 3f1490d57ef6-e0b544ec4ddmr2334276.8.1722038125883; Fri, 26 Jul 2024 16:55:25
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:30 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-82-seanjc@google.com>
Subject: [PATCH v12 81/84] KVM: x86/mmu: Don't mark "struct page" accessed
 when zapping SPTEs
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
X-CRM114-CacheID: sfid-20240727_005529_178908_A7497B23 
X-CRM114-Status: GOOD (  13.47  )
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

Don't mark pages/folios as accessed in the primary MMU when zapping SPTEs,
as doing so relies on kvm_pfn_to_refcounted_page(), and generally speaking
is unnecessary and wasteful.  KVM participates in page aging via
mmu_notifiers, so there's no need to push "accessed" updates to the
primary MMU.

And if KVM zaps a SPTe in response to an mmu_notifier, marking it accessed
_after_ the primary MMU has decided to zap the page is likely to go
unnoticed, i.e. odds are good that, if the page is being zapped for
reclaim, the page will be swapped out regardless of whether or not KVM
marks the page accessed.

Dropping x86's use of kvm_set_pfn_accessed() also paves the way for
removing kvm_pfn_to_refcounted_page() and all its users.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 17 -----------------
 arch/x86/kvm/mmu/tdp_mmu.c |  3 ---
 2 files changed, 20 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 2a0cfa225c8d..5979eeb916cd 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -546,10 +546,8 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
  */
 static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
 {
-	kvm_pfn_t pfn;
 	u64 old_spte = *sptep;
 	int level = sptep_to_sp(sptep)->role.level;
-	struct page *page;
 
 	if (!is_shadow_present_pte(old_spte) ||
 	    !spte_has_volatile_bits(old_spte))
@@ -561,21 +559,6 @@ static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
 		return old_spte;
 
 	kvm_update_page_stats(kvm, level, -1);
-
-	pfn = spte_to_pfn(old_spte);
-
-	/*
-	 * KVM doesn't hold a reference to any pages mapped into the guest, and
-	 * instead uses the mmu_notifier to ensure that KVM unmaps any pages
-	 * before they are reclaimed.  Sanity check that, if the pfn is backed
-	 * by a refcounted page, the refcount is elevated.
-	 */
-	page = kvm_pfn_to_refcounted_page(pfn);
-	WARN_ON_ONCE(page && !page_count(page));
-
-	if (is_accessed_spte(old_spte))
-		kvm_set_pfn_accessed(pfn);
-
 	return old_spte;
 }
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index d1de5f28c445..dc153cf92a40 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -861,9 +861,6 @@ static bool tdp_mmu_zap_leafs(struct kvm *kvm, struct kvm_mmu_page *root,
 
 		tdp_mmu_iter_set_spte(kvm, &iter, SHADOW_NONPRESENT_VALUE);
 
-		if (is_accessed_spte(iter.old_spte))
-			kvm_set_pfn_accessed(spte_to_pfn(iter.old_spte));
-
 		/*
 		 * Zappings SPTEs in invalid roots doesn't require a TLB flush,
 		 * see kvm_tdp_mmu_zap_invalidated_roots() for details.
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
