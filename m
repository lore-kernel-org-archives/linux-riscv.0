Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2492EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 00:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lXYAC1UhcXBE1mu0uUEMx2r9lt7Ad7jBgtFuVihlaaY=; b=Sx/Blfjc2Gd0KDIJ6vSWHaZYn+
	WGeUQTpT6lIacrBjYr4DBpORLUMo9n+lP4mXl33xzILhYPCYsF3RIofnOwNT6tZIvR0y0PyGuIGs9
	gR5BGfVCUOEICrurK5GNaUvQk2GME+2Xu0jue+8vJL2I/1FqcILFY/wEFIdeF6kYa950QK8zlpjmR
	wbSt3IoMpd+4nGFdMHiXHWHq/PtFxaguvdGer+mv5sJjMDfQG0H/Vp++CYSd0dz/fVnFVIETC/0F1
	TS9+2K5o6+nHxjMk47ZenFJdIssiiN1KEZV9gnne1siM4iAtD08K0wbMwFmfGtin2XTZW3SKj3+f4
	pfLdSlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTZ1-007atp-1l;
	Sat, 15 Jul 2023 00:55:11 +0000
Received: from mail-ot1-x34a.google.com ([2607:f8b0:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTYE-007aHa-2I
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 00:54:27 +0000
Received: by mail-ot1-x34a.google.com with SMTP id 46e09a7af769-6b7523df143so3925763a34.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 17:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689382461; x=1689987261;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lMoefZA3MlfauFX/NYW5KwnK8DnygDi/JN2AwltT7bM=;
        b=SX3GKM5mrWJriN6mxD7VKeCoEPGOfTdqn9EwSVirR6iKLo+Nl6dOv0quukgzWk7nHV
         6SuTwz5hjAZ7RKSmLUVJAnQwmGnCeiKEXzsUeJS6USuq1kdz9DNMt2LL73YEMCwj9WtV
         /f5/EMib2Mx/MrnCnC8HQBCxs0PSREypg3sn2FU4oZq+NwN8DlcYLayUp8dvvQ/PDvse
         Tid41Ff1Asl9LR8kElyDqeng1Ti3X11kF3j9m6GGmCa3VeZRfS5fA/IyMr1nNEJGM/hh
         pYCNhoUPVBY51zoHdVpxLc1drh0sy2xu3hEaoB2qkIdpv/8VbSBobhzqoI+oFtOp0nB8
         DM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689382461; x=1689987261;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMoefZA3MlfauFX/NYW5KwnK8DnygDi/JN2AwltT7bM=;
        b=JsDKo5YWwlIFO1JKrOO8Ks17bNb3IV9Rr7yXgr8CN4bTuD8EKwGK4Z4vaRS0l4L2r2
         Lp8WC4JxVxvu5mO3/VvPLCNpVcJ/8zvAGsUYX3J/w7NOXL7K6wfT5BOeRrMTzRlcU6z2
         naKzAr+tujERL6y1VQiH4JrBnh653dyZN9MhrJZrpGeIj86txXZbF9x/4iJ9tfUmfb/D
         wWKnwSAIEBi0z2jCMUXWdreEMiIF4Inn+5yKv6Hy/NVQbX5zbFBrWoaKO04J7UapZZwe
         z8C8Pp0W9SdJP/aiB0OxeNPYS0H3s/viWPxcWL4Qb1fe6viUKBNE5+A+Bvwk2ZyhSokH
         XmRg==
X-Gm-Message-State: ABy/qLaQpXZcHAdwr0N2JCOtoVBZquAJkLehDjVyOSrrWyh2BF5Q0bjK
	+pmAC1kql8stMbsypkUID7rDieLdQRiW
X-Google-Smtp-Source: APBJJlH5a3wI02XfLCdrjutA0c7lgVeZowupHuccGushVFyo4odptnWudcM/MN2XtoF/0rCDIRcqb128IY2O
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6830:1d6b:b0:6b8:c631:5c5a with SMTP
 id l11-20020a0568301d6b00b006b8c6315c5amr5318063oti.4.1689382461471; Fri, 14
 Jul 2023 17:54:21 -0700 (PDT)
Date: Sat, 15 Jul 2023 00:54:04 +0000
In-Reply-To: <20230715005405.3689586-1-rananta@google.com>
Mime-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.455.g037347b96a-goog
Message-ID: <20230715005405.3689586-11-rananta@google.com>
Subject: [PATCH v6 10/11] KVM: arm64: Invalidate the table entries upon a range
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Raghavendra Rao Anata <rananta@google.com>, David Matlack <dmatlack@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_175422_760454_C06041EE 
X-CRM114-Status: UNSURE (   8.94  )
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
---
 arch/arm64/kvm/hyp/pgtable.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 5d14d5d5819a..5ef098af1736 100644
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
2.41.0.455.g037347b96a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
