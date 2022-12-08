Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BF6C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 19:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AoDE0CojoL5Fz8R5JrXXujlk4clvWMzoH/Nj7mzDUNQ=; b=hNV96VM24slBIyQ/rDsD6MmBFt
	q9fct3BRXcYPiq+tb1Ny3RGkvfcHdfPlPptoOoEeP1x45FUT21ZFCbIR23OBcOhr0gRDJ0Tk1oSu1
	U1bjC1jhFbY/C8w96gzHeh5Ruw7yXsZxDgaMZ1+e6nFYtmG8Giuzoot9ksFtREpaR6hqZefSsR5NF
	YwfVXfv9rrbmvawB24ZXCcorLOTqzwmVwnpon/5GKk6vaU2U1xM7RzzUC+/iyD/t4yawnPMA0Nf2S
	dNQrMdzqnDCAfRgFGKtJsHSbNxF9VzK+6iZg84MqyoQ1rnHqEp3fbDlt9JWFFFj+dYedejm7uAts/
	vicfpX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MpU-00A0GM-Nm; Thu, 08 Dec 2022 19:45:12 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3MpR-00A06x-L4
	for linux-riscv@lists.infradead.org; Thu, 08 Dec 2022 19:45:11 +0000
Received: by mail-yb1-xb49.google.com with SMTP id i10-20020a25f20a000000b006ea4f43c0ddso2562230ybe.21
        for <linux-riscv@lists.infradead.org>; Thu, 08 Dec 2022 11:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jUiXg4Z/i5LqOe33gxGyRTPndvvAyQq0aDF8Gx926dw=;
        b=ighxqg/snU4tXdcxe5rmS9diIJMEYpBho3CcnpnWuQAtED+AhBGXYG30AvZnewuYSW
         +PxEPLajwD76T6tHoZB9rvsCIME05+Ml22rzK5huArVtcScCbqC6ekIOU+P5myHm4vXi
         R4EgQzje0PuBByDUR9/7eRDNQOVtYlSk3/+EZQFbpySSyYsvRa5mxUOW+WJy7P2kVHMr
         LdNRgzhOQbMvhiL/Ue8veJ5C2WtFDdDcwfdEEzx+4yjZrEaMU4AD1VnloLuIWDHrzj2p
         Nqw4S8uRQquwfvmcYjqYXUnPBaJxW1MX4LbeXgp1e25+ZAuz42vzjcVwAFjS+W3H33cg
         ky4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUiXg4Z/i5LqOe33gxGyRTPndvvAyQq0aDF8Gx926dw=;
        b=6A6qGw2uRup70VuJYhHJoZ88kINMnHGwKLQASZqhF4LvcBMkEQ/8PfvbdyvBJGOU0/
         GSbH2zQHYD/Km0V1tAAzM/p2MTuqOOuPUulsDqy/Z99HWiC1fcJedbTjYABo90lJA+PD
         euYwzmCduj5xvp2LCLNZwqoeVxKhnZsrwW0CqiMBZfntFvpu4SaTjrz1ROomPSBSbCx6
         6s5bZJtrfeep00I8Ysxt1oh8cSz6fo0Il6ObbFahfDSjl9AL9f6ueXa9+Gd+dgmzC98H
         Oyu7pW3wAC6cuxZHXXx7u5GJiAlcOAGHPn74GkJoWxBDM4M7YSX/ek4aK6Giolyl+hjw
         xd1A==
X-Gm-Message-State: ANoB5plRBGTiacmKZ3gQeT5fQ0FihV42iziDD/ZSEy4sMeFrsrnJTdsE
	zJEMZnqiRzqeZ/nNTxMu83iFig/UWwz4sw==
X-Google-Smtp-Source: AA0mqf5wtd6nzz7Bw3k0h8Agwz4nMHxILunKJx9Z/GTmhAEf2vfAyvwOajGTYXd4NdEjBogKL293TlwJdHSxug==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:7a03:0:b0:6dd:7c0a:4520 with SMTP id
 v3-20020a257a03000000b006dd7c0a4520mr93728044ybc.352.1670528368448; Thu, 08
 Dec 2022 11:39:28 -0800 (PST)
Date: Thu,  8 Dec 2022 11:38:33 -0800
In-Reply-To: <20221208193857.4090582-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20221208193857.4090582-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.rc1.256.g54fd8350bd-goog
Message-ID: <20221208193857.4090582-14-dmatlack@google.com>
Subject: [RFC PATCH 13/37] KVM: MMU: Move sptep_to_sp() to common code
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
X-CRM114-CacheID: sfid-20221208_114509_711483_08C12675 
X-CRM114-Status: GOOD (  12.24  )
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

Move sptep_to_sp() to common code in preparation for moving the TDP MMU
to common code.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/spte.h | 14 ++------------
 include/kvm/mmu.h       | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+), 12 deletions(-)
 create mode 100644 include/kvm/mmu.h

diff --git a/arch/x86/kvm/mmu/spte.h b/arch/x86/kvm/mmu/spte.h
index ad84c549fe96..4c5d518e3ac6 100644
--- a/arch/x86/kvm/mmu/spte.h
+++ b/arch/x86/kvm/mmu/spte.h
@@ -3,6 +3,8 @@
 #ifndef KVM_X86_MMU_SPTE_H
 #define KVM_X86_MMU_SPTE_H
 
+#include <kvm/mmu.h>
+
 #include "mmu_internal.h"
 
 /*
@@ -219,23 +221,11 @@ static inline int spte_index(u64 *sptep)
  */
 extern u64 __read_mostly shadow_nonpresent_or_rsvd_lower_gfn_mask;
 
-static inline struct kvm_mmu_page *to_shadow_page(hpa_t shadow_page)
-{
-	struct page *page = pfn_to_page((shadow_page) >> PAGE_SHIFT);
-
-	return (struct kvm_mmu_page *)page_private(page);
-}
-
 static inline struct kvm_mmu_page *spte_to_child_sp(u64 spte)
 {
 	return to_shadow_page(spte & SPTE_BASE_ADDR_MASK);
 }
 
-static inline struct kvm_mmu_page *sptep_to_sp(u64 *sptep)
-{
-	return to_shadow_page(__pa(sptep));
-}
-
 static inline bool is_mmio_spte(u64 spte)
 {
 	return (spte & shadow_mmio_mask) == shadow_mmio_value &&
diff --git a/include/kvm/mmu.h b/include/kvm/mmu.h
new file mode 100644
index 000000000000..425db8e4f8e9
--- /dev/null
+++ b/include/kvm/mmu.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __KVM_MMU_H
+#define __KVM_MMU_H
+
+#include <kvm/mmu_types.h>
+
+static inline struct kvm_mmu_page *to_shadow_page(hpa_t shadow_page)
+{
+	struct page *page = pfn_to_page((shadow_page) >> PAGE_SHIFT);
+
+	return (struct kvm_mmu_page *)page_private(page);
+}
+
+static inline struct kvm_mmu_page *sptep_to_sp(u64 *sptep)
+{
+	return to_shadow_page(__pa(sptep));
+}
+
+#endif /* !__KVM_MMU_H */
-- 
2.39.0.rc1.256.g54fd8350bd-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
