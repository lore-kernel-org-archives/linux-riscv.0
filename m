Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5137EEB64DD
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 02:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=k2E0YE+lKbsjMSHv75F9c3qhLL9ctF4nZA0tk9cmUF8=; b=biqqxRm7LMgp2K6YgPIknvcBAM
	nPmnJMQZyLDuijFcLXmK8lbenY/n5i34j2D14CcZOMLTQkLz5JChCVrcMt6yS3EWZPBBxmonw47ee
	LD4xyM1YjnQRyoKYNIb4dfBn1oaUYKZ5cgiOmjtPTlJYXTqv0GDas9btwXdPI6EEElYy1NEudPV1r
	+bh84HAFLvszLSPuC2n/FIzP71iytJineYr0cNRDts+VW7fb0nEYOh+e2BUKylBSLyxHNZ5GvlXdz
	t6EpJGXjCzTFJVAt6IiWPaQUXB7+UT4e9tfEH0W+SfCvRZgG65uxM7z77gLf92gPUOZNXNi6VnV1I
	2540xjjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Hn-00FcWj-17;
	Sat, 22 Jul 2023 02:23:59 +0000
Received: from mail-oo1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN2Gx-00Fby5-0A
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 02:23:11 +0000
Received: by mail-oo1-xc4a.google.com with SMTP id 006d021491bc7-565cd3f645bso4118997eaf.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jul 2023 19:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689992586; x=1690597386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t6IhHBctPmj0Hd53w4ZNc/Re4kwSrUfdnR+nipXWIaQ=;
        b=XM2WvQ2J6mE1rfTmtu+H3ixFfDqyyOigJ/cXxpZjzgxUeTEvruySCAG/rKQGRMkMXD
         07rrVwzG0IXIfadckFTDSzoIT6JBfxBjNKBOeSU/6MBVc1LmSKHsji/nuGGmGQPIKW9Z
         8e7BSL6ztWh3Jw6Z6PGETSGeZe5ZaSFMswnjP4AvGCsDJMra7BRdKmnFvYajNsuV/JMY
         bITmLvO3fa24IoVT1k5ocCvwVwzy0L2JEzDhQGC+xQG5l7KYRVRGLld5r1cQJkxXDbfN
         F/fdZbbGBuGYNfoaMNU2jMex6wIQ2ZaUo1INEFODeKlvJppQiagrfGq9lolGYB2gzo7l
         nv4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689992586; x=1690597386;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6IhHBctPmj0Hd53w4ZNc/Re4kwSrUfdnR+nipXWIaQ=;
        b=gMyVAg/mojVale55153Mac3PAmanEFK3QFfW0XiMGyvSaR4KfupIHBZqgXi3PUsI84
         4J5kPXRwNetcd1LDFEO64DxzDiCEAKbim5VX5kJ6klb6K7WuUsseb0c/mTWeV1lwpGLT
         jMFh7i3d0Lm7x++ALzPJPxlsTEgZYkYYHqXCedRA7OFmA5q1ug0L8tkn0IgVci91vxWk
         kox/lUQIl1RSf12QLJXky94S0OkMil4FB5vK0sok5wlPwbRohUsvxsRkF3/9XMfUS7Vj
         W5ObDutrQNaG0obmsqsafDRlBv6ozZ/qgELisvgd+C+6qO2mBksBemjlbB8/j7Udb08g
         2dtw==
X-Gm-Message-State: ABy/qLaa55jvsRwKdcaQrd3bks8qBcjM4zJuLfdt8Hd80e6GmlUrfBwq
	IYYp9ZJQl+KeAXHIsnkTK1B9LmEKBrMn
X-Google-Smtp-Source: APBJJlFmDJaT04gilXUKF4ITcHc4g3ZgKVKs4LBErP5xQ6ZXCTsrqhRw0GlVaRy9+yiIaqdevGRTlG/Ko5mu
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a4a:4fc3:0:b0:564:360c:2895 with SMTP id
 c186-20020a4a4fc3000000b00564360c2895mr5302803oob.1.1689992585914; Fri, 21
 Jul 2023 19:23:05 -0700 (PDT)
Date: Sat, 22 Jul 2023 02:22:50 +0000
In-Reply-To: <20230722022251.3446223-1-rananta@google.com>
Mime-Version: 1.0
References: <20230722022251.3446223-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
Message-ID: <20230722022251.3446223-12-rananta@google.com>
Subject: [PATCH v7 11/12] KVM: arm64: Invalidate the table entries upon a range
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
X-CRM114-CacheID: sfid-20230721_192307_103657_48A9225C 
X-CRM114-Status: UNSURE (   8.68  )
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
2.41.0.487.g6d72f3e995-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
