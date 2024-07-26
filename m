Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84940C3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 23:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gjiXZQXwhaDYC6UAZgUjAZLmxPSWAFOnHJTajizYws=; b=d4BPZuhLCWOrRW
	RN35TfcTsaa4RafqPzD8zOqLNoPh02ENTqTKKsS5xS99TDRoVXRqn1zEBCRg713W6gfQypXbo+gHX
	3v0eH5HiJC+htp0JEViM9/nGwxbbzb7z+dUUoMQGeUBVn2pkE8jMP+n1exZTN05FUi2UqQOu0fH5u
	cYcb7hovzO2bY5L2p/f5HQdBMQEu2gIwgHhif0pzPPF8Q6e5Jh9fqf2JUXH0/9Dquz3B/ClVoGXPZ
	vygceHZ9HGaY7pWanotBc3esbSVW0d3WMxd5V4oqTx7o4S14M4L/AzM4Jrgiq1pab+fET3jTkwV4c
	xn3nh3+Uh0dCN7QLejKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUnm-00000005SAw-0lNs;
	Fri, 26 Jul 2024 23:56:46 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXUk7-00000005PLg-0UxR
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 23:53:02 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b3c65c71dso452289276.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 16:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037978; x=1722642778; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=e1uaEfwlbucR9PkkwcUB/hlZrD43F2tYkTCYXf9cR5U=;
        b=eA52MVxC4pkGUKu9bK7pA+8ay9aAT0XMfj2BsQEg9d5EV3eGJwrmRVsHZ+teqvd8GB
         BD61VVKs07SQs9UBfP06zBwMwmJrOezttpVjaoEpcjRMV+9FLRUscmPpRiWj5Fkfyb50
         k637X3VzHGBXnfFHcsH2sBnZYopLGLxjAhbX+PXfbzW4gJVYqSmVZ3J01OwoTiiSOYCy
         K0SOcalE7K8+jKQVAbVbIim7LBtuJXmNb9p9IOGTVAqZCKhmWasYPq/HxAi7GGbEAeNi
         t5/8M1j5tknh3iSYMX0rfclBfyOmnQTwO1QhqzwkVb2jLsWNZHCZIYKerRyJoZ5ox2v7
         lGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037978; x=1722642778;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e1uaEfwlbucR9PkkwcUB/hlZrD43F2tYkTCYXf9cR5U=;
        b=lR+bnGALjihqJ9XGrqJyA/yxhMAFQX2Gj9L3uLcUTa5vESYnaFZVTwyLzvQ5mFp+d1
         /MNX1QL6TEP1hCp4O1xav4kIJ5nOIYsBKr6cv58+9OdMvTdcG+UUFHEBMpu3Qr1+C4+5
         dbMGGAbHRBYaUk/+HWOdzf3qSKBJeS5zJ3QBtmzoNFY/2IASk8waOJBX9OhgYXYx2Jd0
         07wJ85cPW4kmpx3radm8dfMXmBsmKQHN0zWxgKGCrO5yJ32JYFuOL1qS5rBoWaeAYNut
         OnBXT2+6vGFegeLlQzxeD32jwYXTVErUupug4NAEEImej+r5FaClPiKTwJHG24KaMFn0
         VWSw==
X-Forwarded-Encrypted: i=1; AJvYcCXIt+1Qg53rWxlcKwvpMNSOgUHGBUjrUcfxoHaNkThOUPGnC8qSzrVWU6uNoIXsfD9L22ZOr2BYsR1dFe8NMncid5v3Ak8nPocBb6ezQQGC
X-Gm-Message-State: AOJu0Yy8+mI33hntrOzrWkAxfqgYmtT+HmLhIG4mlb/ezemhN4RMCfXa
	CFKOMyQRVB+/SzDCnCxSRWPwul8WFC3v5rxQMRWA4BTRweUSNAyLHY1VSmePpbqGML0BnZy015K
	IEA==
X-Google-Smtp-Source: AGHT+IG4XdyN3FgjZWItv/Lgg5QEKJKUQifoplgps87wy/mf6q3lv4u9rcIn8zN490p0nZ8TWmWhP2C2xyU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1081:b0:e0b:1407:e357 with SMTP id
 3f1490d57ef6-e0b543f0dc9mr70203276.3.1722037977844; Fri, 26 Jul 2024 16:52:57
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:19 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-11-seanjc@google.com>
Subject: [PATCH v12 10/84] KVM: x86/mmu: Use gfn_to_page_many_atomic() when
 prefetching indirect PTEs
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
X-CRM114-CacheID: sfid-20240726_165259_215150_3B96B71D 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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

Use gfn_to_page_many_atomic() instead of gfn_to_pfn_memslot_atomic() when
prefetching indirect PTEs (direct_pte_prefetch_many() already uses the
"to page" APIS).  Functionally, the two are subtly equivalent, as the "to
pfn" API short-circuits hva_to_pfn() if hva_to_pfn_fast() fails, i.e. is
just a wrapper for get_user_page_fast_only()/get_user_pages_fast_only().

Switching to the "to page" API will allow dropping the @atomic parameter
from the entire hva_to_pfn() callchain.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index ef0b3b213e5b..6b215a932158 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -535,8 +535,8 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 {
 	struct kvm_memory_slot *slot;
 	unsigned pte_access;
+	struct page *page;
 	gfn_t gfn;
-	kvm_pfn_t pfn;
 
 	if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
 		return false;
@@ -549,12 +549,11 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp,
 	if (!slot)
 		return false;
 
-	pfn = gfn_to_pfn_memslot_atomic(slot, gfn);
-	if (is_error_pfn(pfn))
+	if (gfn_to_page_many_atomic(slot, gfn, &page, 1) != 1)
 		return false;
 
-	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, pfn, NULL);
-	kvm_release_pfn_clean(pfn);
+	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
+	kvm_release_page_clean(page);
 	return true;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
