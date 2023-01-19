Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC61C004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lnjsCn2ViYubNXkU8HYaSo+oFNw8Xj9IirM0QHQ3WPI=; b=iB1+WRicxPTfbGX8d60Bg4emWe
	fuGFJJia0GGAkmdhqAXBZXj06CjhQG+AZ7WOMhLCUEwE+16GuahlcdzHDe/DO+0k1Aupg/XDspPOi
	nveT4mKsGuWF6MpdOWDRL0qcrteihSmq3VW5qqdWjHIoV7nrWVkEqhsXDD5RXjGwPxMfKs9WEXb10
	IAvyZATPoibf+6RkeqgTNN+fC9gTvXpgcSP4qfmN1oHcDTBIRRxNnhveiw8j3UpS/iBrksqAW8DRz
	1EYVf6VwaILA3bm40a45mXBe2wPvCRc3DbEdFujyYJbWjoTKW+lcFb/lKzbFWE8hrtxooFQi3r5vU
	csTh3Pgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZFP-006RJT-NL; Thu, 19 Jan 2023 18:02:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZF6-006R9M-Fr
	for linux-riscv@bombadil.infradead.org; Thu, 19 Jan 2023 18:02:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=c0SS1XLwsBFZ40upMmt6qRjU4c0qpX4m+4RA3lz+crc=; b=jLyMc5vxGYYsnstCTwaljRsSsM
	Rh1+0tauJ6YZhrUhAQfH00hDqPmIRSCyD8Ml3I2EEVHU1cM4pbx5JCApLYbnY0j00uBEEsoymxu6P
	22qG0iS6fkp6BWg7RXqTKx81rwk9qS5+RUycyNyQ7MEpP95hWFkF+Ztnu4ipZDXbbT9mNYLWI9FX7
	2vfiE30yhJgpgVimgdqUgTxYcHqwccDvcqV4uOdG9H8AeCQ/1R9qDNw7nr8ulJURncFuYzY7ezzYf
	AXVMReoHUW33tglJq9aQLA0Yf4FyA1pj3KN+hXI/4yBFPXWGYd52joxF7juHNcIbQC40CJr1fkAnc
	N0QFCo7A==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIYpQ-000NZy-0h
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jan 2023 17:35:58 +0000
Received: by mail-pg1-x54a.google.com with SMTP id g31-20020a63111f000000b004bbc748ca63so1318707pgl.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 09:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c0SS1XLwsBFZ40upMmt6qRjU4c0qpX4m+4RA3lz+crc=;
        b=bRTUL9THslA1WY3C6zfQ1MAdQYPay9Jt3idYcFlPDFpT0P4o1+XdpDhUeIk2USmwqG
         D3KWQ2FFy3WJkFP9lARnX3e2e5+KhWdYytuOptPQtHynN/RZhg3lvRYJ1+tDBSadgtps
         wX3mEXowuzhodMcGekL2PsM6hfEXUHRivXQGF0Q29dG33K4Rv5+lelnHW3mcP/8E3OxY
         qNPsUHH4GMaFwBF+QLlhLNR1zHxYzEPnBpWfOlG2W1lShRazOpwLppupOCoEm3ciHxk3
         OsbBJeAM+1GFVBPMGCcS7Q866gvCz+lnaIzAW6Qyf3Bq9YevZj2TcF9nD2jvuYi68kxn
         b2Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0SS1XLwsBFZ40upMmt6qRjU4c0qpX4m+4RA3lz+crc=;
        b=jr37bwxG0a+71FRHg/5QD2FwczP4gDnL3Bh1yt57z4lRdgqmkREDY/NqFaX8sj92VQ
         MSAqhMCknbj07cMT8ZjxxrsNQj0OinTw6nbGlVUAZHJ4o+de2NkniFBuHsdnix/g0R1J
         AqD8O2em3g0q8MVLFvxoxuWwdD7gr88ItAjGkDKttmQUYMZvqAW823p+DqC6RXLZ4sTr
         q5nk8hDb99hxQaySyfexxt+En5dSrFrwbLVrqyo7JKhXB5OF+htW8x3ehiDEsgbFNEtg
         FnYCvRUfxhHMKze1e+AmjFuTtBXXuMShbxyJAgP3FK4P67/T2qhZTr5u+ZaOEG6Wt6F1
         TrFQ==
X-Gm-Message-State: AFqh2ko8x7iyPuVGxem8nGq4tPvfSqqoH72GOFtzRBzviseZWv++AQdw
	fNFPBIarexzAyegwr1ykK8LLIKkxT785/A==
X-Google-Smtp-Source: AMrXdXvbTmwzuJAuBPKJsyHR0snVOekSSTxs16QNlqhF8cG4iLKN5DvuKgwpJj8AOixc6btzxFQ4Hm+pmC9GRQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a62:ae10:0:b0:580:9b0b:4fde with SMTP id
 q16-20020a62ae10000000b005809b0b4fdemr1243710pff.49.1674149779734; Thu, 19
 Jan 2023 09:36:19 -0800 (PST)
Date: Thu, 19 Jan 2023 09:35:57 -0800
In-Reply-To: <20230119173559.2517103-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230119173559.2517103-6-dmatlack@google.com>
Subject: [PATCH 5/7] KVM: x86/MMU: Use gfn_t in kvm_flush_remote_tlbs_range()
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_173556_589020_A5E81B92 
X-CRM114-Status: GOOD (  10.28  )
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

Use gfn_t instead of u64 for the start_gfn parameter to
kvm_flush_remote_tlbs_range(), since that is the standard type for GFNs
throughout KVM.

No functional change intended.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 2 +-
 arch/x86/kvm/mmu/mmu_internal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 36ce3110b7da..1e2c2d711dbb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -246,7 +246,7 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages)
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
 	int ret = -EOPNOTSUPP;
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index e606a6d5e040..851982a25502 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -164,7 +164,7 @@ void kvm_mmu_gfn_allow_lpage(const struct kvm_memory_slot *slot, gfn_t gfn);
 bool kvm_mmu_slot_gfn_write_protect(struct kvm *kvm,
 				    struct kvm_memory_slot *slot, u64 gfn,
 				    int min_level);
-void kvm_flush_remote_tlbs_range(struct kvm *kvm, u64 start_gfn, u64 pages);
+void kvm_flush_remote_tlbs_range(struct kvm *kvm, gfn_t start_gfn, u64 pages);
 unsigned int pte_list_count(struct kvm_rmap_head *rmap_head);
 
 extern int nx_huge_pages;
-- 
2.39.0.246.g2a6d74b583-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
