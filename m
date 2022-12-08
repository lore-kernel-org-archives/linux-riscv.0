Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F6FC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=wC1xCIM2E9RHD7kCYUD24YnmMkQI2WZLWRXqwFwtI2A=; b=UCd33+bJGbIirAD4iXxMGUJjKX
	GG7qgryS+A9Z4XG1kYsi8a0LSY12N5rsxeqUc9qcbSTwHpP4XCsqXmzETmwtr6f5beQRO5e8ICbpK
	DGf/h7SuyfsP3ZxID/acyk3vkBj9V4NXdi5FcFfiI1cVuuJmT+n/2u6Ybpg9ZAaOcFj+hYbj9/l4l
	XZDRYV3BoDWs9aV5Qsc2AlxzkHypzypMW2OMiQaEPxmdRvN71BLeGwsW989jqLy61zepqdhhtOPO3
	oPGFxDoWhQvBuUjWdPDfs09aLuRFuCQ76Ih/l5tQ9rtG/L7YEnbsjjAAEkk31Tu4c03Ct7z6ZPNid
	Bghu5Cxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mzf-00A85n-A0; Thu, 08 Dec 2022 19:55:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Myx-00A7bR-4i
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 19:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tkNWRrDgNwNzqtgNwpxgN/DTrlBNLFki8K4gCSCF3lo=; b=ah4D4/58xsd3LC1yw+s1ddjtMH
	P+v6TX40aJ8xBWpyw5swhZkdh5Kxj67rsWmboZ7Qy3J12yc8oIMPebFjkXRie5La80ZdkH8caOkC+
	y3AsbbKEz8ZY61oHktUkZ1J0esFBY5dGfJO8k8P+mGXLAfzFLa1pxbuVSj/7siHNVmKecyhTMWryT
	6NY5n4wCxFjJLJTweoqJ1fcqx00ppaYORUg9sGhmV3n8OzDo6SeiaqcVH5zWKHXMXdf0Uc4/K2/wi
	jBrSZoH7VmLlt12FJt7qNlm+SF0s4z7JGq9SZsd+Av96whpjf9JbmWMOHfSPO8d/K+x+wR7aCdweG
	1geUhlzw==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mkj-007G94-Nt
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:40:19 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id i10-20020a25f20a000000b006ea4f43c0ddso2549282ybe.21
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tkNWRrDgNwNzqtgNwpxgN/DTrlBNLFki8K4gCSCF3lo=;
        b=Jeo44smHjnYpe2uFwUmmqKcQe01M1Ze9ea9B4uMIU5ntQkPkvB3Zc4thQ3NAsyCsM6
         njB6ARB2/jwqICHZjLWARLgqlROkOE8dE/Nlmg+cddGuhCUdBUCre+Ape5y9bEn1AH0m
         QTNzlGiRNxTFT7VabJhOsxdhwjPofjbAJZ1PCWCHwTDUYPBouSQgwVrjYVu7xNslHehx
         1YNfAbWUQ8IDhGJBMwkGg2u+vzD4HHd3ftPyCOz4Y9YrRbPnwANRWTtpcXIgRmYN6yTS
         OWchh5FCUZ+isGuwUpxCxPxLXQApiy8OtxlS5CtERREsPneeyxTaL8RKmGDzc7PdZpGa
         /plg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tkNWRrDgNwNzqtgNwpxgN/DTrlBNLFki8K4gCSCF3lo=;
        b=i5VSzKDEOsZKQRITYagmBlZqdE7zyJe1LqTrMzEywpdMzWtGKXpuOzx6wsJLKPnG+v
         VogEe99lf5Fu/rvr2+EWeZwy3UFw8MkQCDYr3ocKYOWXjo+FZCTyfteO+xbZYDlo1Hhn
         KcjsMlw6RoL+d5k7UP34zvzJdFYo7KvQ8zj7hHVQLX3g3w2pkEeCkTBWktMaieQWLlbn
         Y5vj+UOSX1yQp/4+3+xk7Ql3XFww4Mgvr/KuZU2/gg+/lIh/hdzTMfQiLCoBpEuh5qIj
         Kfz1rn5nXkBBtzLgF/YlIFEkoxQmGxhwR3pZJZrQYEQzccIMtQV9bo8KalkBTPtYLvGc
         cnwg==
X-Gm-Message-State: ANoB5plosYYGm+G46jk37zBot4UWB572ncnuUIBpueUryM9/LIZCg/bq
	QOp1pfbWKgvYIpBBcn9kRRHN9YeWryQkEg==
X-Google-Smtp-Source: AA0mqf6e/93WEAJhtz+5cgWWhhHXPdHpxdnhitMPWlmfhQ9qhBNIB9WsoIo+5YOGLZdc8lSlrXS+3/eouLkxig==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:818d:0:b0:70e:58c:1c8b with SMTP id
 p13-20020a25818d000000b0070e058c1c8bmr2474845ybk.229.1670528408086; Thu, 08
 Dec 2022 11:40:08 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:56 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-37-dmatlack@google.com>
Subject: [RFC PATCH 36/37] KVM: x86/mmu: Move is_tdp_mmu_page() to mmu_internal.h
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
X-CRM114-CacheID: sfid-20221208_194017_788604_9AA8BD6C 
X-CRM114-Status: UNSURE (   8.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Move is_tdp_mmu_page(), which is x86-specific, into mmu_internal.h. This
prepares for moving tdp_mmu.h into common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu_internal.h | 9 +++++++++
 arch/x86/kvm/mmu/tdp_mmu.h      | 9 ---------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index df815cb84bd2..51aef9624521 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -147,4 +147,13 @@ void *mmu_memory_cache_alloc(struct kvm_mmu_memory_cache *mc);
 void track_possible_nx_huge_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 void untrack_possible_nx_huge_page(struct kvm *kvm, struct kvm_mmu_page *sp);
 
+#ifdef CONFIG_X86_64
+static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp)
+{
+	return !sp->arch.shadow_mmu_page;
+}
+#else
+static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
+#endif
+
 #endif /* __KVM_X86_MMU_INTERNAL_H */
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 897608be7f75..607c1417abd1 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -71,13 +71,4 @@ int kvm_tdp_mmu_get_walk(struct kvm_vcpu *vcpu, u64 addr, u64 *sptes,
 u64 *kvm_tdp_mmu_fast_pf_get_last_sptep(struct kvm_vcpu *vcpu, u64 addr,
 					u64 *spte);
 
-#ifdef CONFIG_X86_64
-static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp)
-{
-	return !sp->arch.shadow_mmu_page;
-}
-#else
-static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
-#endif
-
 #endif /* __KVM_X86_MMU_TDP_MMU_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
