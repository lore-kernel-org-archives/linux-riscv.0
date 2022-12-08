Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82185C001B2
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pcrx/EmqR5Z0kONuHXOKt0fDV//IUWmnIVZNwQ/GKGQ=; b=GHWa9V1eL8HD0HUMGwbZYADBmY
	E9RhljcqerTQySuWI6vz+bapR+B8tDMNyU+J3VaVqic7KsydkFsPbjv0SWeGILe/SODAjeR+qa/i4
	RePKX59v7sxBNabhcCy4PlNK/yLX19I7cxSZ8KyHcvopX4VAQjGFO7aeh9a8Iz5389C68s2dt91LM
	gVVTNBuYEcOz0d97adeh83RCe8SxtCI4cETqJaxOioZiwRw5zW1PFkOjhtPgDwAcI98d94vCjxa+O
	FcJkSmL26450t3Wse1K/pCyq0D6h+304VWM7k1oo4/uzHRPZvDdgJ9xSwSR2Y7uKi7F+x6gJKg6Em
	3j/0eiQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MqB-00A0xG-Ul; Thu, 08 Dec 2022 19:45:56 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mq5-00A0pg-PU
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:45:51 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id i19-20020a253b13000000b0070358cca7f7so2523250yba.9
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PeJRMD1iiEfAcW0wse8YvMRXDysx/LxLCpDqGqOGbOE=;
        b=it3ha/1H2vQVcMvrwLK2XI6kFW9SfZwdQ0HxxUSc3Ag107nHhiqTSUqlouPQ69hlpA
         gVlMznc/cXRCFulmlBil4kKdWgDSAUCR93SntgLaDJWCpUTB7FzwaETswPW9lX1yNG07
         0tWWOwYFihDwyLqkpiOMrsIryZ3SjYTTI8b4R1X9oFZnj7/UyRLh3XP6ECDzERPz2C+i
         B3prUkRr3KEH0wVuRrtyBo09IY2F7MxhaUoLo7LOK5D3eYUuVBFYj36vL7P7ZiNQEA7c
         1QUJk9A2erTf8dkQPtJhbcBzs55NBkUNAK3ruLZHLQeHsz23ls2YGKCDBr5v8J7edZjj
         uhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PeJRMD1iiEfAcW0wse8YvMRXDysx/LxLCpDqGqOGbOE=;
        b=1/OkZMyKr3cjRtLvKeL7IXDA2ROupAFAnq7UbUN6R3V0ZtiT2CD4jKY6lYLxYXCzNN
         98gvL+OAm7GZfrStlVkBlK+jr85I0xc2bHLgndInZ42nGaeL9HW6b15k4QueQ+YutFGu
         m7lXO7lskhsGMO7o67pIR+eLbov2cCk3aU6apZ6J5wfZPxJ7RxfE4WBx9GJGdre8E4yv
         uIiHTHnqCN1ab0pjb9kHcYQmfKOQXBJ24NdqlyDm+EayiA32q/EnalhkVG9bYr1ZYZ0h
         tKUWBq5LTU2sw6lrqsvvN8RsJvXJhKuYB2ztcq7KCHkJjLPXr2za2bU/sPMj+ZKUYeyi
         K/Ag==
X-Gm-Message-State: ANoB5pl38bBuovzIvp0eDYMP949nMb18B3T8lXfCzJQJf23su7JV/17m
	Bc17PRcqTz+GCWUX6YmhOjtyLPlgDmS27A==
X-Google-Smtp-Source: AA0mqf42i4HuA7nX3hyDm6T4qhjEe3EzuwVfCeNTiMqXBDpZ0EVA3TMnNfFvR5iVyImke8GmCkOtSd5OsKu+oA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:6602:0:b0:6f9:890c:6468 with SMTP id
 a2-20020a256602000000b006f9890c6468mr39021311ybc.610.1670528389040; Thu, 08
 Dec 2022 11:39:49 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:45 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-26-dmatlack@google.com>
Subject: [RFC PATCH 25/37] KVM: x86/mmu: Pass root role to kvm_tdp_mmu_get_vcpu_root_hpa()
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Matlack <dmatlack@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Nadav Amit <namit@vmware.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Vlastimil Babka <vbabka@suse.cz>, 
	"Liam R. Howlett" <Liam.Howlett@Oracle.com>, Suren Baghdasaryan <surenb@google.com>, 
	Peter Xu <peterx@redhat.com>, xu xin <cgel.zte@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Yu Zhao <yuzhao@google.com>, Colin Cross <ccross@google.com>, Hugh Dickins <hughd@google.com>, 
	Ben Gardon <bgardon@google.com>, Mingwei Zhang <mizhang@google.com>, 
	Krish Sadhukhan <krish.sadhukhan@oracle.com>, Ricardo Koller <ricarkol@google.com>, 
	Jing Zhang <jingzhangos@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_114549_857613_8946EED3 
X-CRM114-Status: GOOD (  12.19  )
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

Pass the root role from the caller rather than grabbing it from
vcpu->arch.mmu. This will enable the TDP MMU to be moved to common code
in a future commit by removing a dependency on vcpu->arch.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.c | 4 ++--
 arch/x86/kvm/mmu/tdp_mmu.h | 3 ++-
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 9307608ae975..aea7df3c2dcb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3612,7 +3612,7 @@ static int mmu_alloc_direct_roots(struct kvm_vcpu *vcpu)
 		goto out_unlock;
 
 	if (tdp_mmu_enabled) {
-		root = kvm_tdp_mmu_get_vcpu_root_hpa(vcpu);
+		root = kvm_tdp_mmu_get_vcpu_root_hpa(vcpu, mmu->root_role);
 		mmu->root.hpa = root;
 	} else if (shadow_root_level >= PT64_ROOT_4LEVEL) {
 		root = mmu_alloc_root(vcpu, 0, 0, shadow_root_level);
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index e6708829714c..c5d1c9010d21 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -301,9 +301,9 @@ static void tdp_mmu_init_child_sp(struct kvm_mmu_page *child_sp,
 	tdp_mmu_init_sp(child_sp, iter->sptep, iter->gfn, role);
 }
 
-hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu)
+hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu,
+				    union kvm_mmu_page_role role)
 {
-	union kvm_mmu_page_role role = vcpu->arch.mmu->root_role;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_mmu_page *root;
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index e6a929089715..897608be7f75 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -10,7 +10,8 @@
 int kvm_mmu_init_tdp_mmu(struct kvm *kvm);
 void kvm_mmu_uninit_tdp_mmu(struct kvm *kvm);
 
-hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu);
+hpa_t kvm_tdp_mmu_get_vcpu_root_hpa(struct kvm_vcpu *vcpu,
+				    union kvm_mmu_page_role role);
 
 __must_check static inline bool kvm_tdp_mmu_get_root(struct kvm_mmu_page *root)
 {
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
