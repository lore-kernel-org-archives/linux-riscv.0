Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE74DEB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 04:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=j89bj2JxUJWKHaU2MyxGpXGIdpQJ9gB6xbVAyGhNDqQ=; b=gBo+nyFEmMXQ3AwqHcwlhP00Lq
	zXhifKEg7zVInhJV+ND/hEBZUt25y1UZmquMYZXYUkheDiY1BtrNu80TicAfYEAtL3fk57f3cRXNk
	aa9Yj1QAUkOLFHYzZ+1p6u8W0xm3F5gZ3l3p4yKZ0W/I7dvwLNaoG38xpDZAiMEHrs3bEaWyzjbn8
	3Ic38w8US1ngAG5ofRuFQiMdJVb48wINezo7tWZP7P1CqhcJgmTcV+5VMMZCKF7Nx9SYFAz3bhBJH
	7RiMLsp0rQi9ngPXk+2ZvsKhH4HVls2Fsf+RmXocRQTvTT8nd77bLWragCoHTE6FKBg6ayL2YcZZs
	qKxATZ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK8r-009QWt-1D;
	Fri, 11 Aug 2023 04:52:53 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7q-009Pdh-20
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 04:51:54 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d4ddbcbbaacso1644365276.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 21:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729509; x=1692334309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ceh3/nJpRP3LCUTMqceYFYfxrY0H2MNGDIBSz6bT86E=;
        b=lHqWfp61VXzWhun3liSCo1CSCBHiEyU47FTCxsnQq8PbPrZVJoSsWVZ4fEX98C2DkW
         5tek7XQP9mJy7NeheveiRehPOgCFv2062IYZFMuFBJd/9R8dr0dmve4e4xKZzUd6v89o
         VeSHW0hjn2DbsqdsgVscCVTcn0H4yM4N/0YEqjJ196nf8SdcTQtyOZZaVghqfh6h34Re
         E0oHw2Y6uHdjAkl15YMtMg9Z6P8rco3KWSpUtvl1TY8Fm49+r+1TuIERD17QjTEoKmLD
         O3fI87xp18xcDlB5HLBTUsrTm5rIbVZpwNSq52s4Abs8Cp3fKn2aFj26qWXruJf9eih2
         dIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729509; x=1692334309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceh3/nJpRP3LCUTMqceYFYfxrY0H2MNGDIBSz6bT86E=;
        b=Ypmo2JgUwHmyUSBH6pUSNlprcMa+UorHAUoNFBHkD7F6nhghQnDgijYSH4lz69INQS
         Zy6OrAfU8U7PS7yBC4xvR5GiKfHfEPYMYapLAZXdd5U6wc7eyoIqeKdVtdtvhQnnCsR+
         TACk/mzsPJUftyeou4cBeibK6llz5TOFCvT9exHPHLKI+nZAik4/9BoMK3PhHb9xiTfF
         kSpcosZoZNTFu+7/LFxWLd9y3W76pJ4V1nIDybiPUzy06r1SPUl5J1+Kq+o5fvl0TkLy
         2BO6jfUCu8ylN+VmOoCe4yhz+WiyH4awNX9nR4sUwmHg2NOKrYCTtEU9+O1Wvita09cN
         gb1Q==
X-Gm-Message-State: AOJu0YwBoYfnhqloHIV6sNPe3BEfwEzrYGKcWtU3hO9PYFgCyWULoscP
	jZz7EY9m0AEgU/L5axk9lA84DYEn3Zad
X-Google-Smtp-Source: AGHT+IGOJteWPd/cnLBRhVwGynPlFvhmV8TWzRZj/7clA/O6mEkppvIui53pAv4SPGvWg3HXNvX6L5O7yhJy
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:d814:0:b0:d48:c04:f256 with SMTP id
 p20-20020a25d814000000b00d480c04f256mr8024ybg.11.1691729509090; Thu, 10 Aug
 2023 21:51:49 -0700 (PDT)
Date: Fri, 11 Aug 2023 04:51:26 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-14-rananta@google.com>
Subject: [PATCH v9 13/14] KVM: arm64: Invalidate the table entries upon a range
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
X-CRM114-CacheID: sfid-20230810_215150_736945_392B6F86 
X-CRM114-Status: UNSURE (   8.95  )
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
