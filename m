Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC9AC004D4
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 18:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Pwyy3Alo3QYT5ITgJbIUj501KGkJCXR5u7X58bEaXfw=; b=sNwS6wtRsqyqQHXb7aaoI3Jusk
	7BtwkP3+CGjsuBeuiRVf+Wxq7Vs/XjFLUQA1zVRf/H+pn0fIf0ZoDqRWyzjB43OYClDJRL/OIFZSg
	HwqbgfWYVqeq7CI/ktIXSRrxpku9MGSjrZ+Ro9QXeP0cNLXWU85k1gWtg2ujS8KZkpPh8St5T1gbt
	JfzkAZGqGpwrVeuAsv/IoxbZ5y26KixZ20moDWBqa/PLkiqtOo5CbZuwyW6c7laho6usKLoGj1FuN
	qcsFq5RkxcGJQwY5zBvBIGXu6dmCjdDzSVz6q0ld1d+XGnQ1IVjpp/ZgInxx7xLA0gIF+h8wXkmvZ
	qdAQ4BCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZFS-006RMC-Rg; Thu, 19 Jan 2023 18:02:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZF7-006RAn-QH
	for linux-riscv@bombadil.infradead.org; Thu, 19 Jan 2023 18:02:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3hAJU+LzPVf19y36Q9+8Vrf4nbiTPQzZyGa0NnmG2s0=; b=et5wYvykAa7FjEGtcRhKtKwTDe
	Eqo1IhFLpIYH3diRi771IXZwTiGW8d7WezZ87RKfUY9gGXXheTdB7j3CA4Kf+80OzxfQhJuQusKiD
	hv91Lnx/bniHPVKADEmxRKKR7/cWKko1F2YLDDkf7YAAEInoJj7oHx4jZ8rlHPEOpNnIs6vbebuKS
	5PKS0E5cWxKrxMX3qgfC9B5+1pQTK2IP7TjJtKSuXJCig0kBYjLttA8dFL29lFqW7pd+QMLOPM2gz
	50b+jcMOcbH75N5wEPrNtibtl6gsOqrJEKLU+bcY2gsK/A1kSRbpZhCElW8O5nCRLbPh1WtQ6HNFA
	l9+i+FNQ==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIYpM-000NZb-0Z
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jan 2023 17:35:54 +0000
Received: by mail-pg1-x549.google.com with SMTP id 201-20020a6300d2000000b004ccf545f44fso1309400pga.12
        for <linux-riscv@lists.infradead.org>; Thu, 19 Jan 2023 09:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3hAJU+LzPVf19y36Q9+8Vrf4nbiTPQzZyGa0NnmG2s0=;
        b=LncMkMbkcAIyGue9Im85wp+qazsdtyG2pD4++o+icy0IPMJV8lI9tX9+PjLo1kQmni
         Wo+qI4Pu/FDbulB075D7Bj5uVWpVwH11jl25Huz5SLadFPRwmt96/0kohdgBj2mHfVzm
         6vWEUZ5pdB/9lln0z/nXIlf+Ecwo1NSULAcY5mtcAXKtSLUjsKYxOpKOfvtpVDpwT+73
         zOyEADFpuPCZGJcbFi84wZfVws4tYTcDGmGejoC0EpWJU3GE4xj88gsVLKDwHZ+ih/U9
         mQJa2/FrlPiG/iljAp6TojZYVq7sxazNWHXO0HAp4VvA9tA2c11CBVsQchii7nqhnOA5
         kToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3hAJU+LzPVf19y36Q9+8Vrf4nbiTPQzZyGa0NnmG2s0=;
        b=F8807qU9nhS1Y09AR0rpi2NUoiIV/pP/VwAUSNFuFW1yqSGmeoSCvhiz74Wdsyx4pJ
         GZ511eMBEeaEYoWEGp9y9fVNLRL7cQKElH/P0KDADqi8ROLp6RVFZxmDzOEpx6kuk1a/
         9S6LgK1c9D2p1zppBbBGcD9ARLHgBdT9MK3GqfEFwIGFtyA7Evz/LEp3wxJ6jdEfjonj
         fdMWPfFosNS2fpuwLPnAJS9b16qmQZwDTy1CGE9PY+bFHGFLzy9rx5sDmHdpAHA/46IU
         UpoT0wETwqP24VvzVcfZPVtbekEcZuI9AyinEmcKNHLvLk8LQDaKV1ZJcCaMuYNWHJJF
         tpQg==
X-Gm-Message-State: AFqh2koQZAyi6hUua0uMChiSuzGmZ78dek/cUzEBUIK0qKP2nLxowLfo
	HjC2T7IAgem85cyzBwOv4xN2qwGGUxHYjQ==
X-Google-Smtp-Source: AMrXdXu2MvoeQqs801JuzBUZypqlRJrB9v2DrqnXy2L/ej84ncugCrPjhb3Yc6QUXlCd6vDUHuGhT1biHplZRQ==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a63:2f04:0:b0:479:1797:4893 with SMTP id
 v4-20020a632f04000000b0047917974893mr1012500pgv.86.1674149775261; Thu, 19 Jan
 2023 09:36:15 -0800 (PST)
Date: Thu, 19 Jan 2023 09:35:55 -0800
In-Reply-To: <20230119173559.2517103-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230119173559.2517103-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.0.246.g2a6d74b583-goog
Message-ID: <20230119173559.2517103-4-dmatlack@google.com>
Subject: [PATCH 3/7] KVM: x86/mmu: Collapse kvm_flush_remote_tlbs_with_{range,address}()
 together
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
X-CRM114-CacheID: sfid-20230119_173552_449514_7102A8D8 
X-CRM114-Status: UNSURE (   9.59  )
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

Collapse kvm_flush_remote_tlbs_with_range() and
kvm_flush_remote_tlbs_with_address() into a single function. This
eliminates some lines of code and a useless NULL check on the range
struct.

Opportunistically switch from ENOTSUPP to EOPNOTSUPP to make checkpatch
happy.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index aeb240b339f5..7740ca52dab4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -246,27 +246,20 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-static void kvm_flush_remote_tlbs_with_range(struct kvm *kvm,
-		struct kvm_tlb_range *range)
-{
-	int ret = -ENOTSUPP;
-
-	if (range && kvm_x86_ops.tlb_remote_flush_with_range)
-		ret = static_call(kvm_x86_tlb_remote_flush_with_range)(kvm, range);
-
-	if (ret)
-		kvm_flush_remote_tlbs(kvm);
-}
-
 void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
 		u64 start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
+	int ret = -EOPNOTSUPP;
 
 	range.start_gfn = start_gfn;
 	range.pages = pages;
 
-	kvm_flush_remote_tlbs_with_range(kvm, &range);
+	if (kvm_x86_ops.tlb_remote_flush_with_range)
+		ret = static_call(kvm_x86_tlb_remote_flush_with_range)(kvm, &range);
+
+	if (ret)
+		kvm_flush_remote_tlbs(kvm);
 }
 
 static void mark_mmio_spte(struct kvm_vcpu *vcpu, u64 *sptep, u64 gfn,
-- 
2.39.0.246.g2a6d74b583-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
