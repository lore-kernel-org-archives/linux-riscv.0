Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FD2C0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 02:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pDo1W8A1DVHdf9adK6kgA6bepJd+lAnwFoQ1CM9gc9A=; b=ojr+EZmcSi84O21dP/BGlHMZrC
	rLqIGxX+w7bCAwly/UTuBz2YtmtJcsi34Zg5YJR61IkBdYWUFCUOMizKp4yEkG1MmG53uhBMTc/9J
	l7QMMlDrduHmmKpvPq5UCr49kOX01QVcz0Y+cF/TIVvcqsf2RiwnVWrIpatQ3ovG/cAnitKB/U2S1
	z/wUJs+Br9tdx+U7t4nlv01XquvqdI5nlJ2RCUCSuj+gjm2sPOWWHQDAQ41QzdnzEh/WAApNTxlsZ
	Y1pQ/tftgD2JOyJYB051Nu29YiI3oH/TSNV9JDqrwdtHDH3ad8eqQmCnQn9dYDYL21hq2qH4/ceuI
	C7eKiOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Ho-00FcXg-0r;
	Sat, 22 Jul 2023 02:24:00 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gx-00Fbxa-1t
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:11 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-56768da274aso4554831eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992585; x=1690597385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hJ4NFtSWgiMEwLg284CgQ5sPMcVW/iV/DNVpISC4B6I=;
        b=etohqM8FNqv7jP4oVb5L3TebNKHl9Ev6yU/Q2F0QFmd/hK2W5vZOVAKqiYjkAljbq+
         oZe1DZV3dCfmTkU2tkYd9kzktIkqIWHBq/98vcxMCORri65Vb++76RZy+CR4jQQBlGVQ
         lLhwVUZnIC8148SyGe8CCO3G/+XAeJY7Nj6WbESw2/bNmVhdYwZ0UZWzHFJ4IdVSC1GG
         L/gipEiK8Leq2Ymca/xEEXCadVwQsbe+kI+uodWubqC2v7iKyC2dtVqZcz1pMeAMC0Ex
         a9r+g5hPGWdBfrPeN6SnGH6416sf2tSXPolPtei5F/nhMQI1Rkxmc6U9XjGuxMwAAaEe
         QAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992585; x=1690597385;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJ4NFtSWgiMEwLg284CgQ5sPMcVW/iV/DNVpISC4B6I=;
        b=LmRZbAtoHSh88wxqG6Aa17WNdIwIhOGsz8vs1AeQ3V4WTd8jCxUQdkw4P7S5PTwBYq
         DUaUsOq7Eugf3ns8GBCd+R7gildbmQpUKZXiab0D801xCA1D0b0rz+K+4oenBPBBEO3j
         OgfiYfrR61BSVr4g/bu9Cmuc28eJGxvT9BMILUYteW3EwJ+pJkYJmh5ocnM/MQUCuM5b
         vuw4RzOytchxeLIvXbBidcrxVzxhW1vfk66hL00eNA7qUC7Kqj7RWCIpXCiCQPW/FHrM
         d+l3kYK2rhsqp6dJLq9GIRyyN4tpwc9quLtwABkblRBVHMgW07sV66Qyl6NG5ibuX+o8
         fh/Q==
X-Gm-Message-State: ABy/qLYAEftCvHToPLSD59Iyaf+gEe1oGbRVvHD19bWXTJ7xQyps+ofn
	f4GiZ8B8c6VweGFQvMh7qXRJlN+qB+uX
X-Google-Smtp-Source: APBJJlGAW+6/JrIYJI2JdLwtGX1LjNoUSmksaPTMtdqVT4U713h6cuykvY/ueRKWB3kJQ1QCRmdAmt+/OBPn
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6808:15a1:b0:3a1:e58d:aae0 with SMTP
 id t33-20020a05680815a100b003a1e58daae0mr8380023oiw.3.1689992584760; Fri, 21
 Jul 2023 19:23:04 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:49 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-11-rananta@google.com>
Subject: [PATCH v7 10/12] KVM: arm64: Flush only the memslot after write-protect
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_192307_624707_8BB95D76 
X-CRM114-Status: UNSURE (   9.16  )
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

After write-protecting the region, currently KVM invalidates
the entire TLB entries using kvm_flush_remote_tlbs(). Instead,
scope the invalidation only to the targeted memslot. If
supported, the architecture would use the range-based TLBI
instructions to flush the memslot or else fallback to flushing
all of the TLBs.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 387f2215fde7..985f605e2abc 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1082,7 +1082,7 @@ static void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
 	write_lock(&kvm->mmu_lock);
 	stage2_wp_range(&kvm->arch.mmu, start, end);
 	write_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs(kvm);
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 /**
-- 
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
