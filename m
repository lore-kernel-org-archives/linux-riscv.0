Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE484C001B2
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 20:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VfxX1F0zYBlu2y2eL+/A9CYBcKhAFHiwUxJzAwRO39A=; b=qNYQpzALUrPsRDn8XmMd1xGShf
	YQbM5TocIhh7PjnEiiVWf8KEDM4CIEpKM/rTzf7qfeHSt7+TNzJ5UFDkSDFO0VwNf5VfuQOjcZznF
	56HNN7vCuQ7xHtl3uc54yPNJiFW3KaA4trC5vnFEjnFeY3+ff3Zz2hm5BI+NIPftuxD+CxF6hDQD3
	yiJgYZhpubqSuNjD2KcthXcC7z/qEDyII9Fl6QNXS7v5OmnqGz5cb0JebpFaJE7emQyJXyJAmyful
	mnzFM1F28nQBp9rz1nMu8MrW6YLmx3op27gXLctC2fkgj0wN3XnHyfnGWu8wvrZE+FIdITmUl00HM
	ZwNnPgpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Nf6-00ApVD-Fs; Thu, 08 Dec 2022 20:38:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3NV7-00AgYd-Dy
	for linux-riscv@bombadil.infradead.org; Thu, 08 Dec 2022 20:28:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HLrD3t5bH+2UVRBzeB4pMLD/le/gTmNW425ksyvCqFk=; b=lmk2QjAudRlwK6zgKYVKxHoCFe
	PuWB+pcY/E7Ije223Hh6YgO4dRQxsQ3IkME+FmWC6mrKeP3NbU+EcVkT7zO876TO2qantELQrZt3E
	1ufid9Ea0HBeUC9fNsU374K6GQ2/7M6BqAyjQlUk3/pjYHDQhODRafiG1xK8gj7VtCx4jFo5tWmUJ
	yiEV/ZfCVMyEUFFPAULPxIzMga0ujuAbMCZMDxVCmWukN1DloG7qTc9Qc/bzeRnBJZBq1GMWA7mA1
	p7c9RAg8++q3TXMlBLknxazeBlbnFx0nLWi7AAllMJ/mRJr+bj6k+M4J8D91aLfKcWzy8FiF7wOPY
	ej+rzFxw==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mjl-008Zlv-RO
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:39:21 +0000
Received: by mail-yb1-xb49.google.com with SMTP id k7-20020a256f07000000b006cbcc030bc8so2527084ybc.18
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HLrD3t5bH+2UVRBzeB4pMLD/le/gTmNW425ksyvCqFk=;
        b=Gz2UiZJQ4DZMvEnArLUIALIGxYLRWiZ17+uUATC7JW/9U1+U3CD+XxyUp4xTCXYyqm
         DDneOFTbuWB1kx+t4q0UHmlcS5n+bBhngCf182KgN6PPTjRQsSMq1oAQexRSMgVG39ZD
         WhmvaX0yvy8NFr4Zie7hieP7Qf0Cd9sbZbC0FQq7beeBSoCGOAI0ayUDbpD1ZJxACp3Y
         RsidsgionOp80YxgC6DQ4znzyHHQNpvrHQge9fW5yLMBKr5BHx+VLpdd/WsaXsD3cms0
         3Ph9MeTQfZs+riAoOSxWCz4/93fX3jbybIXAJwuXHBDPPpC+reEQ9lxn1c7vmVVnZgpl
         TQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HLrD3t5bH+2UVRBzeB4pMLD/le/gTmNW425ksyvCqFk=;
        b=Dww0lsAZh74C9Ym0gg9ETcVVuIs5aWeB7WUptFn8sF/c2LiqCHeXmiqOjVn/9TzBne
         V5VxLFKr197UDquf5TPD5/JpkV3goheJVUMspsDj7Fh+Qhk5NrRzEn/Qg+S//TMrLL7f
         9mIfa0yZz3rtNS2qTsfnVLSDaLvaLoQ3rpkTf3oo5a+sofqwLRtz378t8PMDRBK+6VIP
         l2o4JEuzfQGCxxpfwan7+pyMOl3lrw3giSaXQIeG0IiooU0dnJNkFGMQ1Hz+A8IEgVwl
         GfPkbPd0iqy/WANWoD6sWjwBAvpbDYX1pgx85PyqBc5H5yuV3KH3j0S0w7g283ibqLpr
         Q2FA==
X-Gm-Message-State: ANoB5pmATrC00qur075xuq6w5e0sjtOoaQrCB+hpzprm1cUIcQOfxEO+
	OGS2G2pK9VQ/iEGZ1N2Cz0XZTpu04De/bA==
X-Google-Smtp-Source: AA0mqf7CjJBroe1GU5lusLDR6DJkiCylX/dWdqQ1e2UjuKyXk5ZPZTZv3qlpbJO/f2YNw2OZIgu/a4kIbkSpkQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:2184:0:b0:6ea:e952:4d4a with SMTP id
 h126-20020a252184000000b006eae9524d4amr80656342ybh.120.1670528354217; Thu, 08
 Dec 2022 11:39:14 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:24 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-5-dmatlack@google.com>
Subject: [RFC PATCH 04/37] KVM: x86/mmu: Invert sp->tdp_mmu_page to sp->shadow_mmu_page
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
X-CRM114-CacheID: sfid-20221208_193917_966803_122EA4B5 
X-CRM114-Status: GOOD (  13.91  )
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

Invert the meaning of sp->tdp_mmu_page and rename it accordingly. This
allows the TDP MMU code to not care about this field, which will be used
in a subsequent commit to move the TDP MMU to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 1 +
 arch/x86/kvm/mmu/mmu_internal.h | 2 +-
 arch/x86/kvm/mmu/tdp_mmu.c      | 3 ---
 arch/x86/kvm/mmu/tdp_mmu.h      | 5 ++++-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 355548603960..f7668a32721d 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2180,6 +2180,7 @@ static struct kvm_mmu_page *kvm_mmu_alloc_shadow_page(struct kvm *kvm,
 
 	sp->gfn = gfn;
 	sp->role = role;
+	sp->shadow_mmu_page = true;
 	hlist_add_head(&sp->hash_link, sp_list);
 	if (sp_has_gptes(sp))
 		account_shadowed(kvm, sp);
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index e32379c5b1ad..c1a379fba24d 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -52,7 +52,7 @@ struct kvm_mmu_page {
 	struct list_head link;
 	struct hlist_node hash_link;
 
-	bool tdp_mmu_page;
+	bool shadow_mmu_page;
 	bool unsync;
 	u8 mmu_valid_gen;
 
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index 7ccac1aa8df6..fc0b87ceb1ea 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -133,8 +133,6 @@ void kvm_tdp_mmu_put_root(struct kvm *kvm, struct kvm_mmu_page *root,
 	if (!refcount_dec_and_test(&root->tdp_mmu_root_count))
 		return;
 
-	WARN_ON(!is_tdp_mmu_page(root));
-
 	/*
 	 * The root now has refcount=0.  It is valid, but readers already
 	 * cannot acquire a reference to it because kvm_tdp_mmu_get_root()
@@ -279,7 +277,6 @@ static void tdp_mmu_init_sp(struct kvm_mmu_page *sp, tdp_ptep_t sptep,
 	sp->role = role;
 	sp->gfn = gfn;
 	sp->ptep = sptep;
-	sp->tdp_mmu_page = true;
 
 	trace_kvm_mmu_get_page(sp, true);
 }
diff --git a/arch/x86/kvm/mmu/tdp_mmu.h b/arch/x86/kvm/mmu/tdp_mmu.h
index 0a63b1afabd3..18d3719f14ea 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.h
+++ b/arch/x86/kvm/mmu/tdp_mmu.h
@@ -71,7 +71,10 @@ u64 *kvm_tdp_mmu_fast_pf_get_last_sptep(struct kvm_vcpu *vcpu, u64 addr,
 					u64 *spte);
 
 #ifdef CONFIG_X86_64
-static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return sp->tdp_mmu_page; }
+static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp)
+{
+	return !sp->shadow_mmu_page;
+}
 #else
 static inline bool is_tdp_mmu_page(struct kvm_mmu_page *sp) { return false; }
 #endif
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
