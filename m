Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6472C001E0
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1my0T5vfOyl6TLjDBHOPk0AS+frZmBWqjSaDP9WRu3w=; b=1ttbfbmONADlB3UFpjOpEK6Wj2
	BlhP4/sySi4IXqH4L4/Jx5wajUrBzQ1zmcGzBGzr/6W2z1XYUUFFBh+8+I0Q0B09QUYXdEBGfE4Iu
	2z2vKd2L9LOeYTFqXoBTItPv04DJJklUF8+wE7S9BXa/S9iLgsRpdLIiFeFSuBp18fZLeIO/F3J9f
	2cwa3n7oJ+5rLQt0eJxA1KReJb9jgrysxFmdrlthkJwWc9ujH1rQ7zsVRygFgV1rFblcFUb5mE0bQ
	6bPJ8ljtDKLZDygmB4q5fTyJp2tmT2Ao3MEJyA0+RrDHLgK/x9OT6vq5Imxd6dIn4KoK+nQvLOuux
	7Dvwityg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtn-003dR4-1t;
	Tue, 08 Aug 2023 23:13:59 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVta-003dAA-0V
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:49 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d4db064e4e2so4241112276.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536424; x=1692141224;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bI2/Ai2EKT2A2IhEWIOyLZxp6nDkYiv4aO92c97jYBA=;
        b=hOQ/QNJ4fDMZ2FC3pGaUDXkd1GQHOg5TRJBn6sYxz/OXZpP+kRlssN8bL3vT8Dq/Oz
         PJeWi4rKvEE795D0Mdr0NYRNJ8XYctBzLKe81Zn50caX0GD9ToYpOsrw7CBlOvi0aB4Z
         DrEbTqOG+c5oyjUIV6w4gfSf6i/e1hy12lLpXNAvyEkLpASj2E4Xt/qsGisnVZnqiTo3
         qK1+DZmlYg9+ohhyaVcnvxJ4JRNK9eaW8bIvDgE9COakWSV+KTWSt0KHykR8gI4BH9hz
         jOxvzwcesjF0cVffspEemGYKzaHNuAMxpTjjLBR8VbYHzDfOJdS466JXlh2I7vC/czlh
         zvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536424; x=1692141224;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bI2/Ai2EKT2A2IhEWIOyLZxp6nDkYiv4aO92c97jYBA=;
        b=c44eXuQzjMotdCXTLGEmqldh2CpK4XO54xVnUTuczCHJQn+JZbhCmkZmPzHdpVnbvA
         xoYF02z5lazJlq7XM2b+IGhFeCWWKZwJHnG+6qfzi6Zbzh4z2XxFrSj0OhryYqZqAvDU
         dHqqrUqwAwPMhC/0kWsQVNRxE4RFLvbwvTD+Z7UNOnA7h4us28hMTjWeGglqg/EjoUn3
         1B9feEUzWAPbFjgrJFMf56oh0qG1kQVt2vTIawKoucXsEBPd/tJ5eNVpi+Z2SaQ5maMm
         bTJvpZn6OJIFTOdrOt8RWvR9uzByNHZZdYOXowkBk9eEgtoYcnM3ghDL9/2EeImuyB6O
         4D+g==
X-Gm-Message-State: AOJu0YzMPYKy8gkfMn7+OMgIuYfO9Mp3jztSxgnBLy7jYHQIqef8d+pk
	GxaeY1GVI7rTmWM8J/6x2pYP4ON5dCZX
X-Google-Smtp-Source: AGHT+IGGHYwkr7nrnrafn7gr98QPyZhjySK4/ETqW8spkcqbMy1k4MjlMxIWPFgxTCp7whfgGZUxiSmogUJy
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:ab62:0:b0:d4c:f456:d54f with SMTP id
 u89-20020a25ab62000000b00d4cf456d54fmr18964ybi.8.1691536424596; Tue, 08 Aug
 2023 16:13:44 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:25 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-10-rananta@google.com>
Subject: [PATCH v8 09/14] KVM: arm64: Implement  __kvm_tlb_flush_vmid_range()
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
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_161346_305644_C9FA5FD3 
X-CRM114-Status: GOOD (  13.56  )
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

Define  __kvm_tlb_flush_vmid_range() (for VHE and nVHE)
to flush a range of stage-2 page-tables using IPA in one go.
If the system supports FEAT_TLBIRANGE, the following patches
would conviniently replace global TLBI such as vmalls12e1is
in the map, unmap, and dirty-logging paths with ripas2e1is
instead.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 arch/arm64/include/asm/kvm_asm.h   |  3 +++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 11 +++++++++++
 arch/arm64/kvm/hyp/nvhe/tlb.c      | 30 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/vhe/tlb.c       | 28 ++++++++++++++++++++++++++++
 4 files changed, 72 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index 7d170aaa2db41..2c27cb8cf442d 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -70,6 +70,7 @@ enum __kvm_host_smccc_func {
 	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa,
 	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_ipa_nsh,
 	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid,
+	__KVM_HOST_SMCCC_FUNC___kvm_tlb_flush_vmid_range,
 	__KVM_HOST_SMCCC_FUNC___kvm_flush_cpu_context,
 	__KVM_HOST_SMCCC_FUNC___kvm_timer_set_cntvoff,
 	__KVM_HOST_SMCCC_FUNC___vgic_v3_read_vmcr,
@@ -229,6 +230,8 @@ extern void __kvm_tlb_flush_vmid_ipa(struct kvm_s2_mmu *mmu, phys_addr_t ipa,
 extern void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
 					 phys_addr_t ipa,
 					 int level);
+extern void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
+					phys_addr_t start, unsigned long pages);
 extern void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu);
 
 extern void __kvm_timer_set_cntvoff(u64 cntvoff);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index a169c619db60b..857d9bc04fd48 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -135,6 +135,16 @@ static void handle___kvm_tlb_flush_vmid_ipa_nsh(struct kvm_cpu_context *host_ctx
 	__kvm_tlb_flush_vmid_ipa_nsh(kern_hyp_va(mmu), ipa, level);
 }
 
+static void
+handle___kvm_tlb_flush_vmid_range(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
+	DECLARE_REG(phys_addr_t, start, host_ctxt, 2);
+	DECLARE_REG(unsigned long, pages, host_ctxt, 3);
+
+	__kvm_tlb_flush_vmid_range(kern_hyp_va(mmu), start, pages);
+}
+
 static void handle___kvm_tlb_flush_vmid(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_s2_mmu *, mmu, host_ctxt, 1);
@@ -327,6 +337,7 @@ static const hcall_t host_hcall[] = {
 	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa),
 	HANDLE_FUNC(__kvm_tlb_flush_vmid_ipa_nsh),
 	HANDLE_FUNC(__kvm_tlb_flush_vmid),
+	HANDLE_FUNC(__kvm_tlb_flush_vmid_range),
 	HANDLE_FUNC(__kvm_flush_cpu_context),
 	HANDLE_FUNC(__kvm_timer_set_cntvoff),
 	HANDLE_FUNC(__vgic_v3_read_vmcr),
diff --git a/arch/arm64/kvm/hyp/nvhe/tlb.c b/arch/arm64/kvm/hyp/nvhe/tlb.c
index b9991bbd8e3fd..1b265713d6bed 100644
--- a/arch/arm64/kvm/hyp/nvhe/tlb.c
+++ b/arch/arm64/kvm/hyp/nvhe/tlb.c
@@ -182,6 +182,36 @@ void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
 	__tlb_switch_to_host(&cxt);
 }
 
+void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
+				phys_addr_t start, unsigned long pages)
+{
+	struct tlb_inv_context cxt;
+	unsigned long stride;
+
+	/*
+	 * Since the range of addresses may not be mapped at
+	 * the same level, assume the worst case as PAGE_SIZE
+	 */
+	stride = PAGE_SIZE;
+	start = round_down(start, stride);
+
+	/* Switch to requested VMID */
+	__tlb_switch_to_guest(mmu, &cxt, false);
+
+	__flush_s2_tlb_range_op(ipas2e1is, start, pages, stride, 0);
+
+	dsb(ish);
+	__tlbi(vmalle1is);
+	dsb(ish);
+	isb();
+
+	/* See the comment in __kvm_tlb_flush_vmid_ipa() */
+	if (icache_is_vpipt())
+		icache_inval_all_pou();
+
+	__tlb_switch_to_host(&cxt);
+}
+
 void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu)
 {
 	struct tlb_inv_context cxt;
diff --git a/arch/arm64/kvm/hyp/vhe/tlb.c b/arch/arm64/kvm/hyp/vhe/tlb.c
index e69da550cdc5b..46bd43f61d76f 100644
--- a/arch/arm64/kvm/hyp/vhe/tlb.c
+++ b/arch/arm64/kvm/hyp/vhe/tlb.c
@@ -143,6 +143,34 @@ void __kvm_tlb_flush_vmid_ipa_nsh(struct kvm_s2_mmu *mmu,
 	__tlb_switch_to_host(&cxt);
 }
 
+void __kvm_tlb_flush_vmid_range(struct kvm_s2_mmu *mmu,
+				phys_addr_t start, unsigned long pages)
+{
+	struct tlb_inv_context cxt;
+	unsigned long stride;
+
+	/*
+	 * Since the range of addresses may not be mapped at
+	 * the same level, assume the worst case as PAGE_SIZE
+	 */
+	stride = PAGE_SIZE;
+	start = round_down(start, stride);
+
+	dsb(ishst);
+
+	/* Switch to requested VMID */
+	__tlb_switch_to_guest(mmu, &cxt);
+
+	__flush_s2_tlb_range_op(ipas2e1is, start, pages, stride, 0);
+
+	dsb(ish);
+	__tlbi(vmalle1is);
+	dsb(ish);
+	isb();
+
+	__tlb_switch_to_host(&cxt);
+}
+
 void __kvm_tlb_flush_vmid(struct kvm_s2_mmu *mmu)
 {
 	struct tlb_inv_context cxt;
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
