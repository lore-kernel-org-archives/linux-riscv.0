Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D491C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8TNB82yr3Q2OMXLJeKjFyTLvutZ5Nn5Y9334lh3WnLM=; b=LwgEutqOXJLDBiFkV8Svpb84TY
	llAjd1CjOEEmiA6gh+xI7Lo6ubVitxptutCNvLiLaWDCwUtcLbyrPz+4LcZBxbukO/ivJA9zFyPrs
	xvSKrujKb++V1jLdkM4yHNW9Kr8J2yaNAlFPTGl+I9/ps3fyZ6mSCRZSIatXpfU6ixe04Zoftj6gp
	SIut0TbM9oQaQu6ODERRGUqg3SusbyYow4UiWoeQpz5ZiosjLg6cJm2mZlKvdrcCr42xlwnV1hYgq
	aTlDqIQu0d1jVgBuBZliKMJlr1+hXAXGxA44cBw2D1UhTSc9g8RYWtzIzC1Z0gkxWdtz1OMd0shEL
	w37jJ1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVu4-003dlL-2v;
	Tue, 08 Aug 2023 23:14:16 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtf-003dCz-0E
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:53 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-d60d944f40bso173705276.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536426; x=1692141226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Py+nSHfjFpCHBtL754s2ZDTBxkx7EXVyuksTqbxeHnc=;
        b=Oobg/4/cdAOs54dQe4pnW/zbnaNBnlVLOanu5KZLTomKfQ+83/vesNasPXZkLytB/U
         yYuKOE66BlODpHN9VhrFvp9Li0ev2MyXeTQUiPUTJXSqU/0hjP6ffhaAu0DG8ceB9nRE
         7OEcsCUnawXNgnypHlVh6Ec+JBvBdbe6XhVEonXZ+4qbC9GAWgGFzjJ3qRCswmvnVSma
         K5WwlTP0idKzpgOBSRweJG4IFK7UjuzmMKGp5q7vQRUWRszUZlz518kqL6rhealjSgNW
         mURZVtnykI4uxjQF/p6Pbnppkymu8J5PbIwCL6iiQiL/zSW8l5u4ktomsh5R1SKCNTJU
         7Yaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536426; x=1692141226;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Py+nSHfjFpCHBtL754s2ZDTBxkx7EXVyuksTqbxeHnc=;
        b=Z/YaEsGImieh67k9k73ofolCZPyUtSmFycm+Or8WSsuT5eqqTFe8jfmRn6w29mwoKO
         oK/ibAIoiVffnKta0FBYAnKr7u2JLXmw7II/jh/W6GjkGMs+uDMXC4QVDhT12l7veNS8
         jkHQAv7uq3Ug1pYWe44JFb8D9Ja3NJFZQfPT4ecoBnsdK1Nnvdwbnf14KF39oYc7eQ6e
         EX+pPbW4JH7AYIZ3GBkapL81IPurhpY6c0rLjtUa/pnGnzdvTujWYAEi9b7XEVWSiMpB
         FYtmtgV4+tMStmmZxtdjKJnY1lxT7doMTo5OfoU51MfV90+wwj6h1DGCySMnUB/GyqoH
         anpw==
X-Gm-Message-State: AOJu0YwBYCeJp6icpzuhkRHeQQqPdoZRGs3Lods57JIfb35ZU/ynppTr
	YQSNV2Dm9Yhm+Gf2NL/A5YP0ChKG1Tvs
X-Google-Smtp-Source: AGHT+IFrEavsUv9CvI5rpWtoTRkTdNCW4hRKDt4k4H2kyQ7TTHO7qYga0LwAZMMkm4LGrdXgqeyzUr1J01Xw
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6902:1788:b0:d45:1b81:1154 with SMTP
 id ca8-20020a056902178800b00d451b811154mr21434ybb.2.1691536426494; Tue, 08
 Aug 2023 16:13:46 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:27 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-12-rananta@google.com>
Subject: [PATCH v8 11/14] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
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
X-CRM114-CacheID: sfid-20230808_161351_127279_4511FB12 
X-CRM114-Status: UNSURE (   7.84  )
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

Implement kvm_arch_flush_remote_tlbs_range() for arm64
to invalidate the given range in the TLB.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 ++
 arch/arm64/kvm/mmu.c              | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 20f2ba149c70c..8f2d99eaab036 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1113,6 +1113,8 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 static inline bool kvm_vm_is_protected(struct kvm *kvm)
 {
 	return false;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0ac721fa27f18..294078ce16349 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -172,6 +172,14 @@ int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 	return 0;
 }
 
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
+				      gfn_t gfn, u64 nr_pages)
+{
+	kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
+				start_gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT);
+	return 0;
+}
+
 static bool kvm_is_device_pfn(unsigned long pfn)
 {
 	return !pfn_is_map_memory(pfn);
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
