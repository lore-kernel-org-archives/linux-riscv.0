Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 812E7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MjlISX5BaHxbqS037DGutioUjdnplQ5wIgagunfIkzQ=; b=NhX8AdkLfisoGb/IhR4kkzYmwa
	uL9m1I1hZsryEHAXUQTmDi09lKBlTR5dXNI4RbOd3wnal8ddJndykjaXoDynE1OKtVEor1RYDY08W
	XOeqwDs6otaLm7zuU1kC3v3jWcvgFCWq/kWx9hE0CFhYZw9CvjYbzYW+BY6aNxxE+cOnLyNSjG2Ex
	al/5w7YM94lIP8RA5jjsp6itWNab6e5oV2I5c9D1mOdiESBVs1tG6Ttnz/+IBrS39gQDiLdgTxaxh
	n0ms1vGHIG6XO0liErKmnwQwEPQJwRpVH9g945k2H5fiPkmVwxKcy98K+++tWnHZw8ifQYRmRXkDM
	Pw6isqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mt1-00A36D-TQ; Thu, 08 Dec 2022 19:48:52 +0000
Received: from mail-oi1-x24a.google.com ([2607:f8b0:4864:20::24a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Mqm-00A1S8-Qk
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:46:34 +0000
Received: by mail-oi1-x24a.google.com with SMTP id o17-20020a0568080bd100b0035e30a861f7so1080116oik.14
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1a1z/b3owkRfttdiEuiESfzblYsje7V7GrYJ8kI0Po8=;
        b=F0XYX+U7NiHCkK7bsbIKwHt4xn5xSLrANWygs7k8NFHbu1R2R/rmJKDDnvUWdIHP92
         Ly2IYp0NOWTwXh63NaBMZcPqgDrfFaYYlcINvpDuRoegsyJJVoxOj7s7XDFnwq4W8GTC
         f+4upgVNo5G4bbwSbrkVhi3YHBvy4jYzsDFUG9wwYOpDkZx7UBWzJoj2myxNLvIdqZ4W
         pfI5REShGLM7+b3RergwOgWIMIsTPACWYsmBoNyo8t79eVgzWxxkGk1mGWxh5mVT27dB
         xSUuXJrP+ASrLLbWhs1/6bZw6Zgr2IKK/y+UkG+xQAvodbxK4QFJj/l93proPVAsOFHJ
         1lsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1a1z/b3owkRfttdiEuiESfzblYsje7V7GrYJ8kI0Po8=;
        b=1fbGW4gLNQySA8Xp4ClVwcLx8j4qYJuhwptjUx5p0Mn3SLssCJtpFNPVmjmLLM+U0L
         nhEmE8xz/z77osgsc5RTQAPd2ISZckGaoXe/1XOzs50XXYcQgCYh9KIo9OPOYpIQh5tW
         GH8WEPfcfWppemepKZwqWpMKRzIdcbN++42jaicvzDX/ay1JSwprzLgnG7F+swmUfRyz
         7CauhjVlaHqMTUol3LxA83knVs0kEjteWyU7u3dxBPaSKrl3ECSMtfNtLrcfFc1gsTOR
         FQoUnTTxjlOI1sbiPId2P4hen39X7pi2JitBODGKFpa90p2fArlbwOOS+Nvf+sJMk0XR
         VXCQ==
X-Gm-Message-State: ANoB5pk/B5usja5ZT+xvGs5Y3gqaS5dQKyHWQSYNy7m2txGnwzCHS6X3
	glJzoK+kPmaH8+SKdKx5HimJashknBzDNg==
X-Google-Smtp-Source: AA0mqf5kngnEG6TtWra1+xFIY37aBRwogffq20uJpUzBVyAWsE1WUGsuHoa/DzL+7L0/Sgg0ER4DuRQldLsQMw==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a17:90b:1997:b0:219:8ee5:a226 with SMTP
 id mv23-20020a17090b199700b002198ee5a226mr29019577pjb.13.1670528387307; Thu,
 08 Dec 2022 11:39:47 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:44 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-25-dmatlack@google.com>
Subject: [RFC PATCH 24/37] KVM: x86/mmu: Move kvm_mmu_hugepage_adjust() up to
 fault handler
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
X-CRM114-CacheID: sfid-20221208_114632_898933_55B1D273 
X-CRM114-Status: GOOD (  11.63  )
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

Move the call to kvm_mmu_hugepage_adjust() up to the fault handler
rather than calling it from kvm_tdp_mmu_map(). Also make the same change
to direct_map() for consistency. This reduces the TDP MMU's dependency
on an x86-specific function, so that it can be moved into common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c     | 6 ++++--
 arch/x86/kvm/mmu/tdp_mmu.c | 2 --
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 0593d4a60139..9307608ae975 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3151,8 +3151,6 @@ static int direct_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	int ret;
 	gfn_t base_gfn = fault->gfn;
 
-	kvm_mmu_hugepage_adjust(vcpu, fault);
-
 	trace_kvm_mmu_spte_requested(fault);
 	for_each_shadow_entry(vcpu, fault->addr, it) {
 		/*
@@ -4330,6 +4328,8 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	if (r)
 		goto out_unlock;
 
+	kvm_mmu_hugepage_adjust(vcpu, fault);
+
 	r = direct_map(vcpu, fault);
 
 out_unlock:
@@ -4408,6 +4408,8 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
 	if (is_page_fault_stale(vcpu, fault))
 		goto out_unlock;
 
+	kvm_mmu_hugepage_adjust(vcpu, fault);
+
 	r = kvm_tdp_mmu_map(vcpu, fault);
 
 out_unlock:
diff --git a/arch/x86/kvm/mmu/tdp_mmu.c b/arch/x86/kvm/mmu/tdp_mmu.c
index b997f84c0ea7..e6708829714c 100644
--- a/arch/x86/kvm/mmu/tdp_mmu.c
+++ b/arch/x86/kvm/mmu/tdp_mmu.c
@@ -1157,8 +1157,6 @@ int kvm_tdp_mmu_map(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
 	struct kvm_mmu_page *sp;
 	int ret = RET_PF_RETRY;
 
-	kvm_mmu_hugepage_adjust(vcpu, fault);
-
 	trace_kvm_mmu_spte_requested(fault);
 
 	rcu_read_lock();
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
