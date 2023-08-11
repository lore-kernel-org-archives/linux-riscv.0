Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8108C04FE0
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 04:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FiLgX7yc29VrXN/xRPi9oIbpmK+mpert/txpJLHDM64=; b=jXo44QwU1y/iMUUDpMXnlt9yNT
	4o4RlA+pNMYb9dymNS3BW0dmpN+zxw/QP6OISVGsas9qpG6KGlzPhG9mHsEOyyGxjmD82HNhEGMGF
	iN2UIscxij8FhfOUgNV1qKmyK7AvkUoGDyDxPSWftxIjKGs3r1cL3vYtYWC36CDs8/yAkqopUo5RF
	Bipas+JaRreCSh91u07S4TO7yPk7brA++6afVkuL50sWzkY+7gRhNsjWH9up36UZJkWr54PiI3s9B
	tZltC0ZIbLRVXAYft1cARya25VlKrbNlRlLom35ooHH7XLfn8VBhZDTdrHuXGr/U1I3MUXkeiJ/kP
	HmCkceWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK8U-009QBo-1r;
	Fri, 11 Aug 2023 04:52:30 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7p-009PcQ-0R
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 04:51:52 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-58419550c3aso20136417b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 21:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729508; x=1692334308;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P6qPiqYiGdEy+ALMWmUClgOJtf7MJwHf5G0engyYFuk=;
        b=qrcaMEcSpq+ULmZt9JgV/iXS5+x9ZwEslbJLOWWZHpe9tEaJ28kJ0dsZTFh+wHaZVY
         z/+PWbhe4kPyyucCymXKpbVkBUvDdebb4moSiMcKue6hrkGuTyTFlQ2SS1ZDAmF+7o2K
         JIqhRUzm+nxJK7sCky9lN7UwOaQ9GwOZduGzIbm/TwSEScjePA4FFoYCus4bBKN6ke8D
         wf+zv3/75Th+zNlJ44hzGeBSVubCWPJjE5lDfkpmjoMYIWdYXie5RHK61lA9sT3xtR4j
         o2HtqwDGpSxcDAOl6CF9D9EeEbTPBni26ZJIeebSWG7wMNG4nNsXFqjiD04Lfm8rlpNh
         SVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729508; x=1692334308;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P6qPiqYiGdEy+ALMWmUClgOJtf7MJwHf5G0engyYFuk=;
        b=XXPItjwPSoiidrer9Ap5uTNgREaV8POTEcr1BJzvl8rCv1GRJuMZ9rKptB4DQJxnVa
         2HR8tQRRbBgpkzdAWUi5tBBhQQBcXRgY997EcWDSXDqFIuR3zb00TkDSZnwgQ/yKyPM+
         iq6+NBwyrh1YQ8Yj8DkWwqWJGNUZvusSLvLxfSu6PchfF3tncY3uPEoOZ8tcMDoHj5S+
         iAaUNI2RLeoJhMsgd/0J9nqwWeHAUPvs8ejT8BbizjQfkI2mSeWmw6nlTNX3Ysnd/LC+
         wEKUYSqBdBYps0SM8/wjpMWTFrPPcsJCeaztxAzDLxIEHmf3bZRbT5e2suL2bjFz7ya3
         FAzQ==
X-Gm-Message-State: AOJu0YzYWh5DGjjebv57zbasoBceG5ZulBfcN3bcBPHEl1qx89L4a143
	TcyxFn8OShLk0/AdIiOadh7yt+ajcKLs
X-Google-Smtp-Source: AGHT+IGXV3TrUe7VdEmoyRMybbrBwXMmeig9Hy139aV3xPrm/bppO8Uhrj80L5wM2TEVNSyoFL3mzf/IgjNd
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a81:b71b:0:b0:589:bfc5:d80b with SMTP id
 v27-20020a81b71b000000b00589bfc5d80bmr14055ywh.2.1691729508012; Thu, 10 Aug
 2023 21:51:48 -0700 (PDT)
Date: Fri, 11 Aug 2023 04:51:25 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-13-rananta@google.com>
Subject: [PATCH v9 12/14] KVM: arm64: Flush only the memslot after write-protect
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
X-CRM114-CacheID: sfid-20230810_215149_222734_FEBE7DFD 
X-CRM114-Status: UNSURE (   9.44  )
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
index 702f8715f9fe7..6f44896936b47 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1083,7 +1083,7 @@ static void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
 	write_lock(&kvm->mmu_lock);
 	stage2_wp_range(&kvm->arch.mmu, start, end);
 	write_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs(kvm);
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 /**
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
