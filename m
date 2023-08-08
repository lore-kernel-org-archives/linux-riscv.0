Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41C7C04A94
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j89bj2JxUJWKHaU2MyxGpXGIdpQJ9gB6xbVAyGhNDqQ=; b=mm6cQYyzz47M37T71fVMgRikYx
	uVHLMjMgfDjBwmOKNsFsroiU4BjnwuMXQjY1lHLSvE/WRxZwY9PrG0RlnuJo6VZwOZfkMdsjs6bF8
	ApDDYinODa2nPqepmcKmZ89Paye3gsskWPrbXnqnItJmiuHjmlwHIHCHPjD2tmFwSkZ6iOBzPaps8
	0C5T7ZH9ri+AGWO6PCfyoVI4gScfr5WqXOgOq5xelhzIWGBJa/I6s1zJBq/CNgFYm3P0rZSuuLAhq
	sutV4exxB00J/RTdEPsrBuJ6EHxZHUzDogb3pX3hKkLwK7sSH6XpqS7u+VyxMYqRkwUxI/6c3jp9k
	Q8bFakvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVu0-003dhZ-2U;
	Tue, 08 Aug 2023 23:14:12 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtf-003dFO-03
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:52 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d4b1c8f2d91so4178848276.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536428; x=1692141228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ceh3/nJpRP3LCUTMqceYFYfxrY0H2MNGDIBSz6bT86E=;
        b=lYWCq7XVM6FudJxW5r6RH/4QIo159OCh6BgBZTBQDRkAKhfeKsfGNQQCUQnkN8KvPr
         t2l9cZJpTHvXHX31KaawaEBmdl57OidB6o+0jjp9TDmM0VLLVpgNjiCEG1/+aYqFU6hC
         eAp6ynp7sqYoyVQ64la2au+GLVmINvRuVrGSHYiSeGeSQjAXxRWyTBZdKnV0DHkwK074
         YgL4nZU6PyCxpLCA6hze9IY8+wLAXkT7Chl05pETXiSkaPo3evGfyJZWaUFGflARAI1I
         CWJ4pe0DcCV/6ZrRmXGPD36mbRDc3h8lapnceaa/GYhujd1Sc5T65R444ON8TKY8zetm
         jTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536428; x=1692141228;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceh3/nJpRP3LCUTMqceYFYfxrY0H2MNGDIBSz6bT86E=;
        b=ZKWoWH/N2U0Alr2fmSY0FGWIPsbQmyfGPJNEb4aqe8GRvUvOXx93aiq/L8ApZW9SOL
         ZND473sBEnQKZCR0iWPwgNTp7inxaQ2a4Dp+m/bZ55ztJyRq419CkI6Yc9AkcgoBoqeF
         f/+aX9PZ9JOD3S+ZX76xhInJanVwsZjrU1GevYGl/XYBwaV7W2YesrLhi2bnvc7O5qmC
         /1pE5KeXWw48jMtHdKxv9+l1cWrXZWX4ZGSYM8OowOL5Tb7mE30EPqA2eMCcBH5hifHN
         KcxqzmKQfUwwlxX4IPTKZr+fG1SWwjgZ7nkn7b98woWqgrFI8Gzd+Qyz9SQ2vg5eRyWb
         1DFg==
X-Gm-Message-State: AOJu0Ywkyh1/v0AIexXuTkbeenh/eIWw1tEyWkN6BDXWiyk326KHdvmX
	gNekdNpJFbvuHDbhbrO3RWxfxWNoYzp2
X-Google-Smtp-Source: AGHT+IFZf7KdCrM3mKKctDL4eJEFrZL/iyXXoQ3odpF+ERPp4XkakMR9xXlj55lUKXM5dTMxS4wP8F7laVhf
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:ab50:0:b0:d10:5b67:843c with SMTP id
 u74-20020a25ab50000000b00d105b67843cmr20552ybi.4.1691536428387; Tue, 08 Aug
 2023 16:13:48 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:29 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-14-rananta@google.com>
Subject: [PATCH v8 13/14] KVM: arm64: Invalidate the table entries upon a range
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_161351_074297_01EEFFCA 
X-CRM114-Status: UNSURE (   9.79  )
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

Currently, during the operations such as a hugepage collapse,
KVM would flush the entire VM's context using 'vmalls12e1is'
TLBI operation. Specifically, if the VM is faulting on many
hugepages (say after dirty-logging), it creates a performance
penalty for the guest whose pages have already been faulted
earlier as they would have to refill their TLBs again.

Instead, leverage kvm_tlb_flush_vmid_range() for table entries.
If the system supports it, only the required range will be
flushed. Else, it'll fallback to the previous mechanism.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 5d14d5d5819a1..5ef098af17362 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -806,7 +806,8 @@ static bool stage2_try_break_pte(const struct kvm_pgtable_visit_ctx *ctx,
 		 * evicted pte value (if any).
 		 */
 		if (kvm_pte_table(ctx->old, ctx->level))
-			kvm_call_hyp(__kvm_tlb_flush_vmid, mmu);
+			kvm_tlb_flush_vmid_range(mmu, ctx->addr,
+						kvm_granule_size(ctx->level));
 		else if (kvm_pte_valid(ctx->old))
 			kvm_call_hyp(__kvm_tlb_flush_vmid_ipa, mmu,
 				     ctx->addr, ctx->level);
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
