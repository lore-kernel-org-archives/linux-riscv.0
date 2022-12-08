Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D54BC4167B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=B/+L5OmrppgqbaH56wZARhewT9vR0gkGXqET9a66DKc=; b=RJsyNb1YSvKK80RKswNoplj6gv
	mGFQTilJfp+Zufen9uHai0ATr2lyBOXPokTNreMrScGase7YkPQQGck2FoMIm/OFdBj9ycAGDCDks
	bZSEFeCcqWlpI7HKg7OlQEgDyKusAPWaWv/Tmve7Ddf3fNvT+YEad/0Iqhr+7mFlUfWzFwwx8PoM4
	AYh3ET9gvyyVj//d/KKj8xG4KI29PYf07XB/ZvR0INmQRRcrFAMJfFpxhQfIeElmZhwUttN/h84AG
	YuE6bq9YVzwYKbEa76yz9nloPoYxvxPvwcXveZ/VM4rFDBsUqqccLA1mFMf+osvHW75+dpREmLprh
	rapI2wGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MqP-00A1AD-VT; Thu, 08 Dec 2022 19:46:10 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MqF-00A0zZ-Td
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:46:01 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-360b9418f64so24908577b3.7
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jgO+J07Uxt+qL/UpUVJ8WFrJDihM9AG5kpD8vJwjTTs=;
        b=QrMj5zLDlUXO+ZJ45hsRtxdfgmeW4IfijEqSAU7FIBqFwathovRwq/mzAGouVficrL
         gQcJIU9VmUG2hiNERRKbyTP3Lu3VIHMZ2AloTdIYXMt+wMOuMe8kDJQZMRgSvO6lAwNU
         Y6eBROrQrZ0gTi3qA1W8jY3mdXkghgQbhZG8f+ggIaWBggOtbOEtA4aAL9qoZ6wA6iTL
         UulvutyuA0lBG+LimgEdM3A93jCX+bLrq+G1CQa39qEIq4rZ4XwAKrU+qa0csJ6wjd9Z
         9Ua/MZeoHkveM5nl5wYxeuSnKf6S8qPxrJT/LRGNG++VotU8B0SenTfkKWEFNecwApXV
         JVtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgO+J07Uxt+qL/UpUVJ8WFrJDihM9AG5kpD8vJwjTTs=;
        b=yRPRlxzCNhc/6dmXIlHzGvp1MdYT668TZCNZ8LlChsTOxcuutn2Mc+9YF2wYofzjMw
         ysvblQFfvjaJzwqk77C3WFS+gb6AbDtHUYkdxFcD/2JcwS6mmDSIGH89K7F4+HTmLoUF
         zachBTjZTmFjvW7H0KRsCGyyEZQ4WM40yad9m08xVhvZZyoFN37prBx+PoBSbnbDTAzf
         9A0s9EguDHx5I4brWiM1B/3SY03AQMuKcMRXFFhn2URV2zRcId2Pq/gONuY4QObi1Xhw
         UnhhoTIbp+DzuRcNWZERlcoVu3lrgX8jpaRtndBIoSAGtlJwUuCnW6XXClMwd4ZD48Dr
         iMOQ==
X-Gm-Message-State: ANoB5pnXQjusgyF6ZHZin9yhb3DMPsyxeF60pM7WBeEVY/QqcJTXsCAm
	ms6x4E1KFlQefq4wai3uDd90btxv1QNvOg==
X-Google-Smtp-Source: AA0mqf4cuymNRC2hTArY/T3ebCSKh1ZW9fvhwu59cqHtPCYYXp2h3U5rWse1hGwJtXv7Z28ATD5Q6YFLoVGbsg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:d03:0:b0:706:e165:f752 with SMTP id
 3-20020a250d03000000b00706e165f752mr8717208ybn.510.1670528365193; Thu, 08 Dec
 2022 11:39:25 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:31 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-12-dmatlack@google.com>
Subject: [RFC PATCH 11/37] KVM: MMU: Move RET_PF_* into common code
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
X-CRM114-CacheID: sfid-20221208_114600_033422_3B79EECB 
X-CRM114-Status: GOOD (  14.99  )
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

Move the RET_PF_* enum into common code in preparation for moving the
TDP MMU into common code.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu_internal.h | 28 ----------------------------
 include/kvm/mmu_types.h         | 26 ++++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 28 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index 4abb80a3bd01..d3c1d08002af 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -79,34 +79,6 @@ static inline bool is_nx_huge_page_enabled(struct kvm *kvm)
 
 int kvm_tdp_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault);
 
-/*
- * Return values of handle_mmio_page_fault(), mmu.page_fault(), fast_page_fault(),
- * and of course kvm_mmu_do_page_fault().
- *
- * RET_PF_CONTINUE: So far, so good, keep handling the page fault.
- * RET_PF_RETRY: let CPU fault again on the address.
- * RET_PF_EMULATE: mmio page fault, emulate the instruction directly.
- * RET_PF_INVALID: the spte is invalid, let the real page fault path update it.
- * RET_PF_FIXED: The faulting entry has been fixed.
- * RET_PF_SPURIOUS: The faulting entry was already fixed, e.g. by another vCPU.
- *
- * Any names added to this enum should be exported to userspace for use in
- * tracepoints via TRACE_DEFINE_ENUM() in mmutrace.h
- *
- * Note, all values must be greater than or equal to zero so as not to encroach
- * on -errno return values.  Somewhat arbitrarily use '0' for CONTINUE, which
- * will allow for efficient machine code when checking for CONTINUE, e.g.
- * "TEST %rax, %rax, JNZ", as all "stop!" values are non-zero.
- */
-enum {
-	RET_PF_CONTINUE = 0,
-	RET_PF_RETRY,
-	RET_PF_EMULATE,
-	RET_PF_INVALID,
-	RET_PF_FIXED,
-	RET_PF_SPURIOUS,
-};
-
 static inline int kvm_mmu_do_page_fault(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 					u32 err, bool prefetch)
 {
diff --git a/include/kvm/mmu_types.h b/include/kvm/mmu_types.h
index 9f0ca920bf68..07c9962f9aea 100644
--- a/include/kvm/mmu_types.h
+++ b/include/kvm/mmu_types.h
@@ -110,4 +110,30 @@ struct kvm_page_fault {
 	struct kvm_page_fault_arch arch;
 };
 
+/*
+ * Return values for page fault handling routines.
+ *
+ * RET_PF_CONTINUE: So far, so good, keep handling the page fault.
+ * RET_PF_RETRY: let CPU fault again on the address.
+ * RET_PF_EMULATE: mmio page fault, emulate the instruction directly.
+ * RET_PF_INVALID: the spte is invalid, let the real page fault path update it.
+ * RET_PF_FIXED: The faulting entry has been fixed.
+ * RET_PF_SPURIOUS: The faulting entry was already fixed, e.g. by another vCPU.
+ *
+ * Any names added to this enum should be exported to userspace for use in
+ * tracepoints via TRACE_DEFINE_ENUM() in arch/x86/kvm/mmu/mmutrace.h.
+ *
+ * Note, all values must be greater than or equal to zero so as not to encroach
+ * on -errno return values.  Somewhat arbitrarily use '0' for CONTINUE, which
+ * will allow for efficient machine code when checking for CONTINUE.
+ */
+enum {
+	RET_PF_CONTINUE = 0,
+	RET_PF_RETRY,
+	RET_PF_EMULATE,
+	RET_PF_INVALID,
+	RET_PF_FIXED,
+	RET_PF_SPURIOUS,
+};
+
 #endif /* !__KVM_MMU_TYPES_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
